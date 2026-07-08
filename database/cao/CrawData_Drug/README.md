# An Khang Drug Crawler

Crawler một file để lấy dữ liệu thuốc/sản phẩm từ `nhathuocankhang.com` bằng sitemap công khai và API sản phẩm. Script tự tải URL sản phẩm, gọi API chi tiết, chuẩn hóa dữ liệu, lưu SQLite/raw JSONL, rồi export CSV/JSONL sạch.

Script không tự động vượt CAPTCHA, xác minh bot, fingerprint hay proxy rotation. Nếu server trả về trang xác minh/chặn, crawler ghi trạng thái `blocked` và dừng theo mặc định.

## Chạy Nhanh Bằng Docker

Yêu cầu máy có Docker.

```bash
mkdir -p data
docker build -t ankhang-drug-crawler:local .
docker run --rm -v "$(pwd)/data:/data" ankhang-drug-crawler:local --output /data --limit 20 --max-sitemaps 2
```

Chạy toàn bộ sitemap:

```bash
docker run --rm -v "$(pwd)/data:/data" ankhang-drug-crawler:local --output /data
```

Chạy bằng Docker Compose:

```bash
docker compose up --build
```

## Chạy Local Không Docker

Yêu cầu Python 3.10+.

```bash
python -m venv .venv
. .venv/bin/activate
pip install -r requirements.txt
python crawl_ankhang_drugs.py --output data --limit 20 --max-sitemaps 2
```

Chạy toàn bộ:

```bash
python crawl_ankhang_drugs.py --output data
```

## Output

Sau khi chạy, thư mục `data/` có các file chính:

- `ankhang_drugs.sqlite`: database SQLite gồm queue URL và bảng sản phẩm đã parse.
- `ankhang_drugs.csv`: dữ liệu sạch để mở bằng Excel/Sheets hoặc import hệ thống khác.
- `ankhang_drugs.jsonl`: dữ liệu sạch dạng JSON Lines.
- `raw/details.jsonl`: response gốc từ API `Product/GetProductDetail`.
- `raw/gallery.jsonl`: response gốc từ API `Product/GetGalleryProduct`.
- `raw/promotion.jsonl`: response gốc nếu bật `--include-promotion`.
- `crawl_report.json`: thống kê trạng thái crawl.

## Cột Dữ Liệu Chính

CSV export gồm các trường:

```text
source_url, product_id, seller_id, seller_type, name, product_code,
variant_code, product_pe_id, url, category_code, category_name,
category_url, brand_code, brand_name, brand_url, brand_image, avatar,
medicine_type, medicine_visa, is_prescription, usage, main_ingredient,
target_user, manufacturer, origin_country, dosage_form, package_spec,
expiry, price, sys_price, discount_value, discount_percent, stock,
is_can_buy, online_status_id, inventory_status_id, hidden_price,
package_value, rating_score, total_rating, total_comment, total_sold,
instruction_html, gallery_images, variants_json, medicine_info_json,
filter_attribute_group_json, promotion_json, crawled_at
```

## Cách Script Hoạt Động

1. Tải `https://www.nhathuocankhang.com/sitemap-sanpham.xml`.
2. Parse các sitemap con `sitemap-sanpham-*.xml?page=*`.
3. Lưu URL sản phẩm vào SQLite queue.
4. Với từng URL pending, gọi `Product/GetProductDetail?url=<slug>&provinceId=1027`.
5. Lọc sản phẩm theo `--mode`.
6. Gọi thêm `Product/GetGalleryProduct` để lấy gallery ảnh.
7. Nếu bật `--include-promotion`, gọi thêm `Product/GetPromotionDetail`.
8. Parse các trường thuốc và lưu vào SQLite.
9. Export CSV, clean JSONL và report.

## Resume Và Chạy Lại

Crawler dùng SQLite checkpoint. Nếu bị dừng giữa chừng, chạy lại cùng `--output` là tiếp tục từ URL `pending`.

```bash
python crawl_ankhang_drugs.py --output data --no-refresh-sitemap
```

Reset toàn bộ queue và dữ liệu đã crawl:

```bash
python crawl_ankhang_drugs.py --output data --reset
```

## Tham Số Quan Trọng

- `--output data`: thư mục lưu output.
- `--province-id 1027`: tỉnh mặc định dùng cho API giá/tồn kho.
- `--limit 100`: chỉ crawl 100 URL pending, hữu ích khi test.
- `--max-sitemaps 3`: chỉ tải 3 sitemap con đầu tiên, hữu ích khi test.
- `--mode drugs-only`: mặc định, ưu tiên sản phẩm có số visa/thuốc kê toa/danh mục thuốc.
- `--mode medicine-like`: lưu rộng hơn các sản phẩm có tín hiệu thuốc/y tế như `medicineInfo`, `medicineType`, `medicineVisa`, hoặc danh mục chứa `thuoc`.
- `--mode all-products`: lưu tất cả sản phẩm trong sitemap.
- `--include-promotion`: lấy thêm API khuyến mãi.
- `--delay-min 0.5 --delay-max 1.5`: delay ngẫu nhiên giữa request.
- `--continue-on-block`: không dừng khi gặp response bị chặn, chỉ mark URL `blocked` rồi đi tiếp.
- `--seed-url <url-or-slug>`: thêm trực tiếp một URL/slug sản phẩm vào queue, có thể dùng nhiều lần.

## Lệnh Test Đề Xuất

Test nhanh end-to-end:

```bash
python crawl_ankhang_drugs.py --output data_test --limit 5 --max-sitemaps 1 --delay-min 0 --delay-max 0
```

Test trực tiếp một URL thuốc đã biết, không tải sitemap:

```bash
python crawl_ankhang_drugs.py --output data_test_seed --reset --no-refresh-sitemap --seed-url thuoc-khang-sinh/ornisid-500mg-h-30v --delay-min 0 --delay-max 0
```

Kiểm tra report:

```bash
python -m json.tool data_test/crawl_report.json
```

Xem vài dòng CSV:

```bash
python - <<'PY'
import csv
with open('data_test/ankhang_drugs.csv', encoding='utf-8-sig') as f:
    for i, row in enumerate(csv.DictReader(f), 1):
        print(row['name'], row['product_code'], row['category_name'])
        if i == 5:
            break
PY
```

## Ghi Chú Vận Hành

- Nên test bằng `--limit` trước khi chạy toàn bộ.
- Không nên đặt delay về `0` khi crawl lớn; chỉ dùng cho test nhỏ.
- Nếu `crawl_report.json` có nhiều `blocked`, dừng lại và kiểm tra quyền truy cập/chính sách website.
- `robots.txt` chặn `/tim-kiem?key=*`, nên script không crawl trang search HTML; chỉ dùng sitemap sản phẩm và API sản phẩm.
- Giá/tồn kho phụ thuộc `provinceId`, mặc định `1027` theo web bundle.
