#!/usr/bin/env python3
"""Crawl medicine/product data from nhathuocankhang.com.

The script intentionally uses public sitemaps and product APIs only. If the
server returns a bot-verification/CAPTCHA/interstitial response, it records the
URL as blocked and stops by default.
"""

from __future__ import annotations

import argparse
import csv
import html
import json
import random
import re
import sqlite3
import sys
import time
import unicodedata
import xml.etree.ElementTree as ET
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Iterable
from urllib.parse import urlparse

import requests


SITEMAP_INDEX_URL = "https://www.nhathuocankhang.com/sitemap-sanpham.xml"
SITE_BASE_URL = "https://www.nhathuocankhang.com"
API_BASE_URL = "https://webapi.nhathuocankhang.com/gw/bus-ankhang-tmdt/api"


class BlockedError(RuntimeError):
    """Raised when the server appears to return bot verification."""


class ApiError(RuntimeError):
    """Raised when a retryable/non-retryable API error occurs."""


@dataclass(frozen=True)
class Config:
    output: Path
    province_id: int
    timeout: float
    retries: int
    delay_min: float
    delay_max: float
    limit: int | None
    max_sitemaps: int | None
    mode: str
    include_promotion: bool
    stop_on_block: bool
    refresh_sitemap: bool
    user_agent: str
    seed_urls: tuple[str, ...]


def utc_now() -> str:
    return datetime.now(timezone.utc).isoformat(timespec="seconds")


def to_json(value: Any) -> str:
    return json.dumps(value, ensure_ascii=False, separators=(",", ":"))


def strip_html(value: Any) -> str:
    if value is None:
        return ""
    text = str(value)
    text = re.sub(r"<br\s*/?>", "\n", text, flags=re.I)
    text = re.sub(r"</p\s*>", "\n", text, flags=re.I)
    text = re.sub(r"<[^>]+>", " ", text)
    text = html.unescape(text)
    text = re.sub(r"[ \t\r\f\v]+", " ", text)
    text = re.sub(r"\n\s*", "\n", text)
    return text.strip()


def normalize_text(value: Any) -> str:
    text = strip_html(value).lower().strip()
    text = unicodedata.normalize("NFD", text)
    text = "".join(ch for ch in text if unicodedata.category(ch) != "Mn")
    text = text.replace("đ", "d")
    text = re.sub(r"\s+", " ", text)
    return text


def bool_to_int(value: Any) -> int | None:
    if value is None:
        return None
    return 1 if bool(value) else 0


def first_item(value: Any) -> dict[str, Any]:
    if isinstance(value, list) and value:
        first = value[0]
        return first if isinstance(first, dict) else {}
    return {}


def xml_children_by_local_name(root: ET.Element, local_name: str) -> list[ET.Element]:
    return [node for node in root.iter() if node.tag.rsplit("}", 1)[-1] == local_name]


def xml_child_text(parent: ET.Element, local_name: str) -> str:
    for child in parent.iter():
        if child.tag.rsplit("}", 1)[-1] == local_name and child.text:
            return child.text.strip()
    return ""


def slug_from_product_url(url: str) -> str:
    parsed = urlparse(url)
    return parsed.path.strip("/")


def full_product_url(slug_or_url: str) -> str:
    if slug_or_url.startswith("http://") or slug_or_url.startswith("https://"):
        return slug_or_url
    return f"{SITE_BASE_URL}/{slug_or_url.lstrip('/')}"


class AnKhangClient:
    def __init__(self, config: Config):
        self.config = config
        self.session = requests.Session()
        self.session.headers.update(
            {
                "Accept": "application/json, text/plain, */*",
                "Content-Type": "application/json",
                "User-Agent": config.user_agent,
            }
        )

    def sleep(self) -> None:
        if self.config.delay_max <= 0:
            return
        delay = random.uniform(self.config.delay_min, self.config.delay_max)
        if delay > 0:
            time.sleep(delay)

    def get_text(self, url: str) -> str:
        return self._request_url("GET", url).text

    def get_json(self, path: str, params: dict[str, Any] | None = None) -> dict[str, Any]:
        response = self._request_url("GET", f"{API_BASE_URL}{path}", params=params)
        try:
            data = response.json()
        except ValueError as exc:
            raise ApiError(f"Invalid JSON from {path}: {response.text[:200]}") from exc
        if not isinstance(data, dict):
            raise ApiError(f"Unexpected JSON root from {path}: {type(data).__name__}")
        return data

    def post_json(self, path: str, payload: dict[str, Any]) -> dict[str, Any]:
        response = self._request_url("POST", f"{API_BASE_URL}{path}", json_data=payload)
        try:
            data = response.json()
        except ValueError as exc:
            raise ApiError(f"Invalid JSON from {path}: {response.text[:200]}") from exc
        if not isinstance(data, dict):
            raise ApiError(f"Unexpected JSON root from {path}: {type(data).__name__}")
        return data

    def get_product_detail(self, slug: str) -> dict[str, Any]:
        return self.get_json(
            "/Product/GetProductDetail",
            params={"url": slug, "provinceId": self.config.province_id},
        )

    def get_product_gallery(
        self,
        product_code: str,
        model_code: str,
        seller_id: int | str | None,
    ) -> dict[str, Any]:
        return self.get_json(
            "/Product/GetGalleryProduct",
            params={
                "productCode": product_code,
                "modelCode": model_code,
                "provinceId": self.config.province_id,
                "districtId": 0,
                "wardId": 0,
                "SellerId": seller_id or 0,
            },
        )

    def get_product_promotion(
        self,
        product_code: str,
        model_code: str,
    ) -> dict[str, Any]:
        return self.get_json(
            "/Product/GetPromotionDetail",
            params={
                "ModelCode": model_code,
                "ProductCode": product_code,
                "ProvinceId": self.config.province_id,
                "DistrictId": 0,
                "WardId": 0,
                "isFlashSale": "false",
            },
        )

    def _request_url(
        self,
        method: str,
        url: str,
        params: dict[str, Any] | None = None,
        json_data: dict[str, Any] | None = None,
    ) -> requests.Response:
        last_error: Exception | None = None
        for attempt in range(1, self.config.retries + 1):
            self.sleep()
            try:
                response = self.session.request(
                    method,
                    url,
                    params=params,
                    json=json_data,
                    timeout=self.config.timeout,
                )
            except requests.RequestException as exc:
                last_error = exc
                self._backoff(attempt)
                continue

            if self._looks_blocked(response):
                raise BlockedError(
                    f"Blocked or verification required: status={response.status_code} url={response.url}"
                )

            if response.status_code in {429, 500, 502, 503, 504}:
                last_error = ApiError(f"HTTP {response.status_code}: {response.url}")
                self._backoff(attempt)
                continue

            if response.status_code >= 400:
                raise ApiError(f"HTTP {response.status_code}: {response.url} {response.text[:200]}")

            return response

        raise ApiError(str(last_error) if last_error else f"Request failed: {url}")

    def _backoff(self, attempt: int) -> None:
        if attempt >= self.config.retries:
            return
        time.sleep(min(30, 2**attempt))

    @staticmethod
    def _looks_blocked(response: requests.Response) -> bool:
        if response.status_code in {401, 403}:
            return True
        content_type = response.headers.get("content-type", "").lower()
        text = response.text[:4000].lower()
        if "text/html" in content_type and any(
            token in text
            for token in (
                "captcha",
                "incapsula",
                "_incapsula_resource",
                "access denied",
                "verify you are human",
                "xác minh",
                "xac minh",
            )
        ):
            return True
        return False


class Storage:
    PRODUCT_COLUMNS = [
        "source_url",
        "product_id",
        "seller_id",
        "seller_type",
        "name",
        "product_code",
        "variant_code",
        "product_pe_id",
        "url",
        "category_code",
        "category_name",
        "category_url",
        "brand_code",
        "brand_name",
        "brand_url",
        "brand_image",
        "avatar",
        "medicine_type",
        "medicine_visa",
        "is_prescription",
        "usage",
        "main_ingredient",
        "target_user",
        "manufacturer",
        "origin_country",
        "dosage_form",
        "package_spec",
        "expiry",
        "price",
        "sys_price",
        "discount_value",
        "discount_percent",
        "stock",
        "is_can_buy",
        "online_status_id",
        "inventory_status_id",
        "hidden_price",
        "package_value",
        "rating_score",
        "total_rating",
        "total_comment",
        "total_sold",
        "instruction_html",
        "gallery_images",
        "variants_json",
        "medicine_info_json",
        "filter_attribute_group_json",
        "promotion_json",
        "crawled_at",
    ]

    def __init__(self, output_dir: Path):
        self.output_dir = output_dir
        self.raw_dir = output_dir / "raw"
        self.db_path = output_dir / "ankhang_drugs.sqlite"
        self.raw_detail_path = self.raw_dir / "details.jsonl"
        self.raw_gallery_path = self.raw_dir / "gallery.jsonl"
        self.raw_promotion_path = self.raw_dir / "promotion.jsonl"
        self.csv_path = output_dir / "ankhang_drugs.csv"
        self.clean_jsonl_path = output_dir / "ankhang_drugs.jsonl"
        self.report_path = output_dir / "crawl_report.json"
        self.output_dir.mkdir(parents=True, exist_ok=True)
        self.raw_dir.mkdir(parents=True, exist_ok=True)
        self.conn = sqlite3.connect(self.db_path)
        self.conn.row_factory = sqlite3.Row
        self.init_schema()

    def close(self) -> None:
        self.conn.close()

    def init_schema(self) -> None:
        self.conn.executescript(
            """
            CREATE TABLE IF NOT EXISTS queue (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                source_url TEXT NOT NULL UNIQUE,
                slug TEXT NOT NULL,
                sitemap_url TEXT,
                lastmod TEXT,
                image_url TEXT,
                status TEXT NOT NULL DEFAULT 'pending',
                attempts INTEGER NOT NULL DEFAULT 0,
                last_error TEXT,
                created_at TEXT NOT NULL,
                updated_at TEXT NOT NULL
            );

            CREATE TABLE IF NOT EXISTS products (
                source_url TEXT PRIMARY KEY,
                product_id TEXT,
                seller_id INTEGER,
                seller_type INTEGER,
                name TEXT,
                product_code TEXT,
                variant_code TEXT,
                product_pe_id TEXT,
                url TEXT,
                category_code TEXT,
                category_name TEXT,
                category_url TEXT,
                brand_code TEXT,
                brand_name TEXT,
                brand_url TEXT,
                brand_image TEXT,
                avatar TEXT,
                medicine_type INTEGER,
                medicine_visa TEXT,
                is_prescription INTEGER,
                usage TEXT,
                main_ingredient TEXT,
                target_user TEXT,
                manufacturer TEXT,
                origin_country TEXT,
                dosage_form TEXT,
                package_spec TEXT,
                expiry TEXT,
                price REAL,
                sys_price REAL,
                discount_value REAL,
                discount_percent REAL,
                stock REAL,
                is_can_buy INTEGER,
                online_status_id INTEGER,
                inventory_status_id INTEGER,
                hidden_price INTEGER,
                package_value TEXT,
                rating_score REAL,
                total_rating INTEGER,
                total_comment INTEGER,
                total_sold TEXT,
                instruction_html TEXT,
                gallery_images TEXT,
                variants_json TEXT,
                medicine_info_json TEXT,
                filter_attribute_group_json TEXT,
                promotion_json TEXT,
                crawled_at TEXT NOT NULL
            );

            CREATE INDEX IF NOT EXISTS idx_queue_status ON queue(status);
            CREATE INDEX IF NOT EXISTS idx_products_product_code ON products(product_code);
            CREATE INDEX IF NOT EXISTS idx_products_category ON products(category_url);
            """
        )
        self.conn.commit()

    def reset(self) -> None:
        self.conn.executescript("DELETE FROM products; DELETE FROM queue;")
        self.conn.commit()

    def upsert_queue(self, records: Iterable[dict[str, Any]]) -> int:
        now = utc_now()
        inserted = 0
        for record in records:
            cur = self.conn.execute(
                """
                INSERT OR IGNORE INTO queue
                    (source_url, slug, sitemap_url, lastmod, image_url, status, attempts, created_at, updated_at)
                VALUES (?, ?, ?, ?, ?, 'pending', 0, ?, ?)
                """,
                (
                    record["source_url"],
                    record["slug"],
                    record.get("sitemap_url"),
                    record.get("lastmod"),
                    record.get("image_url"),
                    now,
                    now,
                ),
            )
            inserted += cur.rowcount
        self.conn.commit()
        return inserted

    def pending_count(self) -> int:
        row = self.conn.execute("SELECT COUNT(*) AS total FROM queue WHERE status='pending'").fetchone()
        return int(row["total"])

    def fetch_pending(self, limit: int | None) -> list[sqlite3.Row]:
        sql = "SELECT * FROM queue WHERE status='pending' ORDER BY id"
        params: tuple[Any, ...] = ()
        if limit is not None:
            sql += " LIMIT ?"
            params = (limit,)
        return list(self.conn.execute(sql, params).fetchall())

    def mark_status(self, source_url: str, status: str, error: str | None = None) -> None:
        self.conn.execute(
            """
            UPDATE queue
            SET status=?, attempts=attempts+1, last_error=?, updated_at=?
            WHERE source_url=?
            """,
            (status, error, utc_now(), source_url),
        )
        self.conn.commit()

    def save_product(self, record: dict[str, Any]) -> None:
        columns = self.PRODUCT_COLUMNS
        values = [record.get(column) for column in columns]
        assignments = ", ".join(f"{column}=excluded.{column}" for column in columns if column != "source_url")
        placeholders = ", ".join("?" for _ in columns)
        self.conn.execute(
            f"""
            INSERT INTO products ({', '.join(columns)})
            VALUES ({placeholders})
            ON CONFLICT(source_url) DO UPDATE SET {assignments}
            """,
            values,
        )
        self.conn.commit()

    def append_raw(self, kind: str, payload: dict[str, Any]) -> None:
        paths = {
            "detail": self.raw_detail_path,
            "gallery": self.raw_gallery_path,
            "promotion": self.raw_promotion_path,
        }
        path = paths[kind]
        with path.open("a", encoding="utf-8") as file:
            file.write(to_json(payload) + "\n")

    def export_products(self) -> int:
        rows = list(
            self.conn.execute(
                f"SELECT {', '.join(self.PRODUCT_COLUMNS)} FROM products ORDER BY source_url"
            ).fetchall()
        )
        with self.csv_path.open("w", encoding="utf-8-sig", newline="") as file:
            writer = csv.DictWriter(file, fieldnames=self.PRODUCT_COLUMNS)
            writer.writeheader()
            for row in rows:
                writer.writerow({column: row[column] for column in self.PRODUCT_COLUMNS})

        with self.clean_jsonl_path.open("w", encoding="utf-8") as file:
            for row in rows:
                file.write(to_json({column: row[column] for column in self.PRODUCT_COLUMNS}) + "\n")
        return len(rows)

    def build_report(self, started_at: str, finished_at: str, exported_rows: int) -> dict[str, Any]:
        status_counts = {
            row["status"]: row["total"]
            for row in self.conn.execute(
                "SELECT status, COUNT(*) AS total FROM queue GROUP BY status ORDER BY status"
            ).fetchall()
        }
        product_count = self.conn.execute("SELECT COUNT(*) AS total FROM products").fetchone()["total"]
        report = {
            "started_at": started_at,
            "finished_at": finished_at,
            "database": str(self.db_path),
            "csv": str(self.csv_path),
            "clean_jsonl": str(self.clean_jsonl_path),
            "raw_detail_jsonl": str(self.raw_detail_path),
            "raw_gallery_jsonl": str(self.raw_gallery_path),
            "queue_status_counts": status_counts,
            "product_count": product_count,
            "exported_rows": exported_rows,
        }
        self.report_path.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
        return report


class SitemapLoader:
    def __init__(self, client: AnKhangClient):
        self.client = client

    def load_product_urls(self, max_sitemaps: int | None = None) -> list[dict[str, Any]]:
        index_xml = self.client.get_text(SITEMAP_INDEX_URL)
        sitemap_urls = self.parse_sitemap_index(index_xml)
        if max_sitemaps is not None:
            sitemap_urls = sitemap_urls[:max_sitemaps]

        records: list[dict[str, Any]] = []
        for index, sitemap_url in enumerate(sitemap_urls, start=1):
            print(f"[sitemap] {index}/{len(sitemap_urls)} {sitemap_url}", flush=True)
            xml_text = self.client.get_text(sitemap_url)
            records.extend(self.parse_product_sitemap(xml_text, sitemap_url))
        return records

    @staticmethod
    def parse_sitemap_index(xml_text: str) -> list[str]:
        root = ET.fromstring(xml_text)
        return [node.text.strip() for node in xml_children_by_local_name(root, "loc") if node.text]

    @staticmethod
    def parse_product_sitemap(xml_text: str, sitemap_url: str) -> list[dict[str, Any]]:
        root = ET.fromstring(xml_text)
        records = []
        for url_node in xml_children_by_local_name(root, "url"):
            loc = xml_child_text(url_node, "loc")
            if not loc:
                continue
            slug = slug_from_product_url(loc)
            if not slug or slug.startswith("sp-"):
                continue
            image_url = ""
            for image_node in xml_children_by_local_name(url_node, "image"):
                image_url = xml_child_text(image_node, "loc")
                if image_url:
                    break
            records.append(
                {
                    "source_url": loc,
                    "slug": slug,
                    "sitemap_url": sitemap_url,
                    "lastmod": xml_child_text(url_node, "lastmod"),
                    "image_url": image_url,
                }
            )
        return records


class DrugParser:
    MEDICINE_KEYS = {
        "cong dung": "usage",
        "thanh phan chinh": "main_ingredient",
        "doi tuong su dung": "target_user",
        "nha san xuat": "manufacturer",
        "noi san xuat": "origin_country",
        "dang bao che": "dosage_form",
        "quy cach dong goi": "package_spec",
        "han dung": "expiry",
    }

    @classmethod
    def is_target_product(cls, product: dict[str, Any], mode: str) -> bool:
        if mode == "all-products":
            return True

        medicine_info = product.get("medicineInfo")
        medicine_type = product.get("medicineType")
        medicine_visa = strip_html(product.get("medicineVisa"))
        category_url = normalize_text(product.get("categoryUrl") or product.get("category", {}).get("categoryUrl"))
        category_name = normalize_text(product.get("categoryName") or product.get("category", {}).get("categoryName"))

        has_drug_signal = bool(medicine_visa) or "thuoc" in category_url or "thuoc" in category_name
        if mode == "drugs-only":
            return has_drug_signal or cls._has_prescription_flag(medicine_info)

        return bool(medicine_info) or bool(medicine_type) or has_drug_signal

    @staticmethod
    def _has_prescription_flag(medicine_info: Any) -> bool:
        if not isinstance(medicine_info, list):
            return False
        for item in medicine_info:
            if not isinstance(item, dict):
                continue
            if normalize_text(item.get("name")) == "thuoc ke toa":
                return True
        return False

    @classmethod
    def parse(
        cls,
        source_url: str,
        detail_response: dict[str, Any],
        gallery_response: dict[str, Any] | None,
        promotion_response: dict[str, Any] | None,
    ) -> dict[str, Any] | None:
        product = detail_response.get("data")
        if not isinstance(product, dict) or not product.get("productCode"):
            return None

        medicine_map = cls._medicine_info_map(product.get("medicineInfo"))
        price = first_item(product.get("productPrices"))
        brand = product.get("brand") if isinstance(product.get("brand"), dict) else {}
        category = product.get("category") if isinstance(product.get("category"), dict) else {}
        gallery_images = cls._gallery_images(product.get("productCode"), gallery_response)
        instruction_html = cls._instruction_html(product.get("instructionManual"))
        is_prescription = cls._is_prescription(product.get("medicineInfo"))

        return {
            "source_url": source_url,
            "product_id": product.get("id"),
            "seller_id": product.get("sellerId"),
            "seller_type": product.get("sellerType"),
            "name": product.get("name"),
            "product_code": product.get("productCode"),
            "variant_code": product.get("variantCode"),
            "product_pe_id": product.get("productPEId"),
            "url": product.get("url"),
            "category_code": product.get("categoryCode") or category.get("categoryCode"),
            "category_name": product.get("categoryName") or category.get("categoryName"),
            "category_url": product.get("categoryUrl") or category.get("categoryUrl"),
            "brand_code": product.get("brandCode") or brand.get("brandCode"),
            "brand_name": brand.get("brandName") or medicine_map.get("thuong hieu"),
            "brand_url": brand.get("url"),
            "brand_image": brand.get("image"),
            "avatar": product.get("avatar"),
            "medicine_type": product.get("medicineType"),
            "medicine_visa": strip_html(product.get("medicineVisa") or medicine_map.get("so visa thuoc")),
            "is_prescription": is_prescription,
            "usage": medicine_map.get("usage"),
            "main_ingredient": medicine_map.get("main_ingredient"),
            "target_user": medicine_map.get("target_user"),
            "manufacturer": medicine_map.get("manufacturer"),
            "origin_country": medicine_map.get("origin_country"),
            "dosage_form": medicine_map.get("dosage_form"),
            "package_spec": medicine_map.get("package_spec") or cls._key_selling_point(product),
            "expiry": medicine_map.get("expiry"),
            "price": price.get("price"),
            "sys_price": price.get("sysPrice"),
            "discount_value": price.get("discountValue"),
            "discount_percent": price.get("discountPercent"),
            "stock": price.get("stock"),
            "is_can_buy": bool_to_int(price.get("isCanBuy")),
            "online_status_id": price.get("onlineStatusId"),
            "inventory_status_id": price.get("inventoryStatusId"),
            "hidden_price": bool_to_int(product.get("hiddenPrice")),
            "package_value": product.get("packageValue") or cls._key_selling_point(product),
            "rating_score": product.get("scoreRating") or product.get("rate"),
            "total_rating": product.get("totalRating") or product.get("totalRate"),
            "total_comment": product.get("totalComment"),
            "total_sold": product.get("totalSold"),
            "instruction_html": instruction_html,
            "gallery_images": to_json(gallery_images),
            "variants_json": to_json(product.get("filter") or product.get("lstFilter") or []),
            "medicine_info_json": to_json(product.get("medicineInfo") or []),
            "filter_attribute_group_json": to_json(product.get("filterAttributeGroup") or []),
            "promotion_json": to_json((promotion_response or {}).get("data") or product.get("promotionList") or []),
            "crawled_at": utc_now(),
        }

    @classmethod
    def _medicine_info_map(cls, medicine_info: Any) -> dict[str, str]:
        result: dict[str, str] = {}
        if not isinstance(medicine_info, list):
            return result
        for item in medicine_info:
            if not isinstance(item, dict):
                continue
            raw_name = item.get("name")
            value = strip_html(item.get("value"))
            normalized_name = normalize_text(raw_name)
            if normalized_name in cls.MEDICINE_KEYS:
                result[cls.MEDICINE_KEYS[normalized_name]] = value
            else:
                result[normalized_name] = value
        return result

    @staticmethod
    def _is_prescription(medicine_info: Any) -> int | None:
        if not isinstance(medicine_info, list):
            return None
        for item in medicine_info:
            if not isinstance(item, dict):
                continue
            if normalize_text(item.get("name")) == "thuoc ke toa":
                value = normalize_text(item.get("value"))
                if value in {"co", "yes", "true", "1"}:
                    return 1
                if value in {"khong", "no", "false", "0"}:
                    return 0
        return None

    @staticmethod
    def _instruction_html(instruction_manual: Any) -> str:
        if not isinstance(instruction_manual, dict):
            return ""
        using_instruction = instruction_manual.get("usingInstruction")
        if not isinstance(using_instruction, dict):
            return ""
        value_list = using_instruction.get("valueList")
        if not isinstance(value_list, list):
            return ""
        parts = []
        for item in value_list:
            if isinstance(item, dict) and item.get("name"):
                parts.append(str(item["name"]))
        return "\n".join(parts).strip()

    @staticmethod
    def _gallery_images(product_code: str | None, gallery_response: dict[str, Any] | None) -> list[str]:
        if not gallery_response or not isinstance(gallery_response.get("data"), list):
            return []
        gallery_items = gallery_response["data"]
        ordered_items = sorted(
            gallery_items,
            key=lambda item: 0 if isinstance(item, dict) and item.get("productCode") == product_code else 1,
        )
        images: list[str] = []
        seen: set[str] = set()
        for gallery in ordered_items:
            if not isinstance(gallery, dict):
                continue
            candidates = []
            if gallery.get("avatar"):
                candidates.append(gallery.get("avatar"))
            for item in gallery.get("lstItem") or []:
                if isinstance(item, dict) and item.get("url"):
                    candidates.append(item.get("url"))
            for url in candidates:
                if url and url not in seen:
                    seen.add(url)
                    images.append(url)
        return images

    @staticmethod
    def _key_selling_point(product: dict[str, Any]) -> str:
        points = product.get("lstKeySellingPoint")
        if not isinstance(points, list):
            return ""
        labels = [strip_html(item.get("label")) for item in points if isinstance(item, dict)]
        return "; ".join(label for label in labels if label)


class Crawler:
    def __init__(self, config: Config):
        self.config = config
        self.client = AnKhangClient(config)
        self.storage = Storage(config.output)
        self.sitemap_loader = SitemapLoader(self.client)

    def run(self, reset: bool = False) -> dict[str, Any]:
        started_at = utc_now()
        if reset:
            print("[reset] clearing existing queue and products", flush=True)
            self.storage.reset()

        try:
            if self.config.seed_urls:
                self.seed_queue(self.config.seed_urls)
            if self.config.refresh_sitemap or (self.storage.pending_count() == 0 and not self.config.seed_urls):
                self.refresh_queue()
            self.crawl_pending()
            exported_rows = self.storage.export_products()
            finished_at = utc_now()
            report = self.storage.build_report(started_at, finished_at, exported_rows)
            print(f"[done] exported {exported_rows} rows -> {self.storage.csv_path}", flush=True)
            print(f"[done] report -> {self.storage.report_path}", flush=True)
            return report
        finally:
            self.storage.close()

    def refresh_queue(self) -> None:
        print("[queue] loading product URLs from sitemap", flush=True)
        records = self.sitemap_loader.load_product_urls(max_sitemaps=self.config.max_sitemaps)
        inserted = self.storage.upsert_queue(records)
        print(f"[queue] loaded={len(records)} inserted_new={inserted}", flush=True)

    def seed_queue(self, urls: Iterable[str]) -> None:
        records = []
        for url in urls:
            source_url = full_product_url(url)
            slug = slug_from_product_url(source_url)
            if not slug:
                continue
            records.append(
                {
                    "source_url": source_url,
                    "slug": slug,
                    "sitemap_url": "manual_seed",
                    "lastmod": "",
                    "image_url": "",
                }
            )
        inserted = self.storage.upsert_queue(records)
        print(f"[queue] seeded={len(records)} inserted_new={inserted}", flush=True)

    def crawl_pending(self) -> None:
        rows = self.storage.fetch_pending(self.config.limit)
        total = len(rows)
        print(f"[crawl] pending selected={total} mode={self.config.mode}", flush=True)
        for index, row in enumerate(rows, start=1):
            source_url = row["source_url"]
            slug = row["slug"]
            print(f"[crawl] {index}/{total} {slug}", flush=True)
            try:
                self.crawl_one(source_url, slug)
            except BlockedError as exc:
                self.storage.mark_status(source_url, "blocked", str(exc))
                print(f"[blocked] {exc}", flush=True)
                if self.config.stop_on_block:
                    print("[blocked] stopping because --stop-on-block is enabled", flush=True)
                    break
            except Exception as exc:  # noqa: BLE001 - command-line crawler should keep going.
                self.storage.mark_status(source_url, "error", repr(exc))
                print(f"[error] {slug}: {exc}", flush=True)

    def crawl_one(self, source_url: str, slug: str) -> None:
        detail_response = self.client.get_product_detail(slug)
        self.storage.append_raw(
            "detail",
            {
                "type": "detail",
                "source_url": source_url,
                "slug": slug,
                "fetched_at": utc_now(),
                "response": detail_response,
            },
        )
        product = detail_response.get("data")
        if not isinstance(product, dict) or not product.get("productCode"):
            self.storage.mark_status(source_url, "error", "missing productCode in detail response")
            return

        if not DrugParser.is_target_product(product, self.config.mode):
            self.storage.mark_status(source_url, "skipped_non_drug", None)
            return

        product_code = str(product.get("productCode") or "")
        model_code = str(product.get("id") or "")
        seller_id = product.get("sellerId")

        gallery_response: dict[str, Any] | None = None
        if product_code and model_code:
            gallery_response = self.client.get_product_gallery(product_code, model_code, seller_id)
            self.storage.append_raw(
                "gallery",
                {
                    "type": "gallery",
                    "source_url": source_url,
                    "slug": slug,
                    "product_code": product_code,
                    "fetched_at": utc_now(),
                    "response": gallery_response,
                },
            )

        promotion_response: dict[str, Any] | None = None
        if self.config.include_promotion and product_code and model_code:
            promotion_response = self.client.get_product_promotion(product_code, model_code)
            self.storage.append_raw(
                "promotion",
                {
                    "type": "promotion",
                    "source_url": source_url,
                    "slug": slug,
                    "product_code": product_code,
                    "fetched_at": utc_now(),
                    "response": promotion_response,
                },
            )

        record = DrugParser.parse(source_url, detail_response, gallery_response, promotion_response)
        if not record:
            self.storage.mark_status(source_url, "error", "parser returned no record")
            return
        self.storage.save_product(record)
        self.storage.mark_status(source_url, "done", None)


def parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Crawl medicine/product data from nhathuocankhang.com into SQLite, CSV and JSONL.",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )
    parser.add_argument("--output", default="data", help="Output directory for DB, CSV, JSONL and report")
    parser.add_argument("--province-id", type=int, default=1027, help="Province ID used by An Khang API")
    parser.add_argument("--timeout", type=float, default=30, help="HTTP timeout in seconds")
    parser.add_argument("--retries", type=int, default=3, help="HTTP retries per request")
    parser.add_argument("--delay-min", type=float, default=0.5, help="Minimum delay between HTTP requests")
    parser.add_argument("--delay-max", type=float, default=1.5, help="Maximum delay between HTTP requests")
    parser.add_argument("--limit", type=int, default=None, help="Only crawl N pending product URLs")
    parser.add_argument("--max-sitemaps", type=int, default=None, help="Only load first N product sitemap files")
    parser.add_argument(
        "--mode",
        choices=("medicine-like", "drugs-only", "all-products"),
        default="drugs-only",
        help="Product classification mode before saving",
    )
    parser.add_argument("--include-promotion", action="store_true", help="Fetch promotion detail endpoint")
    parser.add_argument("--reset", action="store_true", help="Clear existing SQLite queue/products before running")
    parser.add_argument(
        "--no-refresh-sitemap",
        action="store_true",
        help="Do not refresh sitemap queue before crawling existing pending rows",
    )
    parser.add_argument(
        "--continue-on-block",
        action="store_true",
        help="Continue after blocked responses instead of stopping the batch",
    )
    parser.add_argument(
        "--user-agent",
        default=(
            "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 "
            "(KHTML, like Gecko) Chrome/124.0 Safari/537.36"
        ),
        help="HTTP User-Agent header",
    )
    parser.add_argument(
        "--seed-url",
        action="append",
        default=[],
        help="Add one product URL/slug to the queue. Can be used multiple times.",
    )
    return parser.parse_args(argv)


def build_config(args: argparse.Namespace) -> Config:
    if args.delay_min < 0 or args.delay_max < 0:
        raise ValueError("delay values must be non-negative")
    if args.delay_min > args.delay_max:
        raise ValueError("--delay-min must be <= --delay-max")
    if args.retries < 1:
        raise ValueError("--retries must be >= 1")
    return Config(
        output=Path(args.output).expanduser().resolve(),
        province_id=args.province_id,
        timeout=args.timeout,
        retries=args.retries,
        delay_min=args.delay_min,
        delay_max=args.delay_max,
        limit=args.limit,
        max_sitemaps=args.max_sitemaps,
        mode=args.mode,
        include_promotion=args.include_promotion,
        stop_on_block=not args.continue_on_block,
        refresh_sitemap=not args.no_refresh_sitemap,
        user_agent=args.user_agent,
        seed_urls=tuple(args.seed_url),
    )


def main(argv: list[str] | None = None) -> int:
    args = parse_args(sys.argv[1:] if argv is None else argv)
    try:
        config = build_config(args)
        report = Crawler(config).run(reset=args.reset)
    except KeyboardInterrupt:
        print("\n[stop] interrupted by user", file=sys.stderr)
        return 130
    except Exception as exc:  # noqa: BLE001 - top-level CLI error reporting.
        print(f"[fatal] {exc}", file=sys.stderr)
        return 1

    print(json.dumps(report, ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
