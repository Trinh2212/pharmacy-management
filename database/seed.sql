USE pharmacy_management;

INSERT INTO medicine_groups (group_name, description) VALUES
('Thuốc giảm đau - Hạ sốt', 'Các loại thuốc giảm đau cơ bản, hạ sốt, chống viêm không steroid (NSAID)'),
('Thuốc kháng sinh', 'Điều trị các bệnh do nhiễm khuẩn, ký sinh trùng'),
('Thuốc tiêu hóa', 'Hỗ trợ hệ tiêu hóa, điều trị loét dạ dày, tiêu chảy, táo bón'),
('Vitamin và Khoáng chất', 'Bổ sung vitamin, vi chất cần thiết cho cơ thể, tăng sức đề kháng'),
('Thuốc tim mạch - Huyết áp', 'Điều trị cao huyết áp, mỡ máu, các bệnh lý tim mạch'),
('Thuốc hô hấp', 'Điều trị ho, hen suyễn, viêm phế quản, long đờm'),
('Thuốc cơ xương khớp', 'Giảm đau xương khớp, chống viêm, điều trị gout'),
('Thuốc chống dị ứng', 'Kháng histamin, điều trị dị ứng mẩn ngứa, viêm mũi dị ứng'),
('Thuốc da liễu', 'Các loại bôi ngoài da, trị nấm, trị mụn, viêm da cơ địa'),
('Thuốc nhỏ mắt, mũi, tai', 'Dung dịch vệ sinh và điều trị các bệnh về mắt, mũi, tai');


INSERT INTO active_ingredients (ingredient_name) VALUES
('Paracetamol'), ('Ibuprofen'), ('Amoxicillin'), ('Clavulanic acid'), ('Cefuroxime'), 
('Azithromycin'), ('Omeprazole'), ('Esomeprazole'), ('Diosmectite'), ('Lactobacillus'), 
('Vitamin C'), ('Vitamin B1'), ('Vitamin B6'), ('Vitamin B12'), ('Calcium'), 
('Amlodipine'), ('Atorvastatin'), ('Bisoprolol'), ('Metformin'), ('Salbutamol'), 
('Acetylcysteine'), ('Hedera helix (Cao lá thường xuân)'), ('Diclofenac'), ('Meloxicam'), 
('Celecoxib'), ('Fexofenadine'), ('Cetirizine'), ('Loratadine'), ('Ketoconazole'), 
('Natri Clorid');

INSERT INTO medicines (medicine_code, brand_name, origin, image_url, status, price, registration_number, unit) VALUES
-- Nhóm 1: Giảm đau - Hạ sốt (1-5)
('T001', 'Panadol Extra', 'Việt Nam', 'https://cdn.nhathuoclongchau.com.vn/v1/static/DSC_099842_74c1fc532a.png', 'đang cung cấp', 125000.00, 'VD-20156-14', 'Hộp'),
('T002', 'Hapacol 250', 'Việt Nam', 'https://cdn.nhathuoclongchau.com.vn/unsafe/2560x0/filters:quality(90):format(webp)/00003627_hapacol_250mg_9174_62ad_large_ecd78be179.jpg' ,'đang cung cấp', 45000.00, 'VD-18342-13', 'Hộp'),
('T003', 'Ibuprofen 400mg', 'Việt Nam', 'https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10023/247689/ibuprofen-400mg-stada-thumb-638681491186414970-600x600.jpg' ,'đang cung cấp', 30000.00, 'VD-12345-12', 'Vỉ'),
('T004', 'Efferalgan 500mg', 'Pháp', 'https://cdn.nhathuoclongchau.com.vn/v1/static/eferalgan_1_f94f787f4f.jpg', 'đang cung cấp', 48000.00, 'VN-11111-11', 'Hộp'),
('T005', 'Alaxan', 'Việt Nam', 'https://cdn.tgdd.vn/Products/Images/10023/130815/alaxan-2-1.jpg', 'đang cung cấp', 110000.00, 'VD-22222-15', 'Hộp'),

-- Nhóm 2: Kháng sinh (6-10)
('T006', 'Augmentin 1g', 'Anh', 'https://cdn.nhathuoclongchau.com.vn/unsafe/2560x0/filters:quality(90):format(webp)/00000964_augmentin_1g_8736_63aa_large_d5d9c99065.jpg', 'đang cung cấp', 280000.00, 'VN-33333-16', 'Hộp'),
('T007', 'Zinnat 500mg', 'Anh', 'https://cdn.nhathuoclongchau.com.vn/v1/static/00008252_zinnat_tablets_500mg_1686_63ab_large_e6d1be63ca.jpg', 'đang cung cấp', 250000.00, 'VN-44444-17', 'Hộp'),
('T008', 'Klamentin 875/125', 'Việt Nam', 'https://cdn.tgdd.vn/Products/Images/10026/131320/klamentin-875-125-mac-dinh-4.jpg', 'đang cung cấp', 135000.00, 'VD-55555-18', 'Hộp'),
('T009', 'Azithromycin 250mg', 'Việt Nam', 'https://cdn.nhathuoclongchau.com.vn/unsafe/2560x0/filters:quality(90):format(webp)/00022063_azithromycin_250mg_h1vi_x6v_armephaco_1x6_6773_60ae_large_e2638ab769.jpg', 'đang cung cấp', 45000.00, 'VD-66666-19', 'Vỉ'),
('T010', 'Amoxicillin 500mg', 'Việt Nam', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa0gbftVQ-T-QYKMFiLhbLdnErggxe0xR8GA&s', 'hết hàng', 35000.00, 'VD-77777-20', 'Vỉ'),

-- Nhóm 3: Tiêu hóa (11-15)
('T011', 'Nexium 40mg', 'Thụy Điển', 'https://cdn.nhathuoclongchau.com.vn/v1/static/123_7f8770f212.jpg', 'đang cung cấp', 350000.00, 'VN-88888-21', 'Hộp'),
('T012', 'Smecta', 'Pháp', 'https://cdn.nhathuoclongchau.com.vn/unsafe/2560x0/filters:quality(90):format(webp)/00006780_Smecta_68b17d7625.png', 'đang cung cấp', 115000.00, 'VN-99999-22', 'Hộp'),
('T013', 'Oresol 245', 'Việt Nam', 'https://cdn.nhathuoclongchau.com.vn/unsafe/2560x0/filters:quality(90):format(webp)/00027541_oresol_245_dhg_20_goi_3639_62a7_large_f11d55f4c5.jpg', 'đang cung cấp', 25000.00, 'VD-10101-23', 'Hộp'),
('T014', 'Phosphalugel', 'Pháp', 'https://cdn.nhathuoclongchau.com.vn/unsafe/2560x0/filters:quality(90):format(webp)/IMG_1940_693e2369e2.jpg', 'đang cung cấp', 120000.00, 'VN-12121-24', 'Hộp'),
('T015', 'Enterogermina', 'Ý', 'https://cdn.nhathuoclongchau.com.vn/unsafe/2560x0/filters:quality(90):format(webp)/DSC_01960_1704a27488.jpg', 'đang cung cấp', 160000.00, 'VN-13131-25', 'Hộp'),

-- Nhóm 4: Vitamin & Khoáng chất (16-20)
('T016', 'Enervon C', 'Việt Nam', 'https://cdn.nhathuoclongchau.com.vn/unsafe/2560x0/filters:quality(90):format(webp)/enervon_c_10x10_united_00002794_558c888fb2.png','đang cung cấp', 65000.00, 'VD-14141-26', 'Lọ'),
('T017', 'Vitamin C 500mg', 'Việt Nam','https://cdn.tgdd.vn/Products/Images/10053/160772/vitamin-c-500mg-nen-mekophar-2.jpg', 'đang cung cấp', 20000.00, 'VD-15151-27', 'Vỉ'),
('T018', 'Calcium Corbiere', 'Việt Nam','https://cdn.nhathuoclongchau.com.vn/v1/static/DSC_02581_2f1a3f2f6b.jpg', 'đang cung cấp', 145000.00, 'VD-16161-28', 'Hộp'),
('T019', 'Vitamin B1 250mg', 'Việt Nam','https://cdn.nhathuoclongchau.com.vn/unsafe/2560x0/filters:quality(90):format(webp)/00008009_vitamin_b1_250mg_6286_6066_large_da522ba371.jpg', 'đang cung cấp', 15000.00, 'VD-17171-29', 'Lọ'),
('T020', 'Magne B6', 'Việt Nam', 'https://cdn.nhathuoclongchau.com.vn/unsafe/2560x0/filters:quality(90):format(webp)/IMG_1838_0d59813938.jpg', 'ngừng cung cấp', 55000.00, 'VD-18181-30', 'Hộp'),

-- Nhóm 5: Tim mạch - Huyết áp (21-25)
('T021', 'Amlor 5mg', 'Pháp', 'https://cdn.tgdd.vn/Products/Images/6994/130842/amlor-5mg-nen-h-30v-mau-moi-4.jpg', 'đang cung cấp', 210000.00, 'VN-19191-31', 'Hộp'),
('T022', 'Lipitor 10mg', 'Mỹ','https://production-cdn.pharmacity.io/digital/828x828/plain/e-com/images/ecommerce/20250520034551-1-P00409_1.png?versionId=_jdzH67PaR1yMFfmavQc5XAhwgSqFeLL', 'đang cung cấp', 320000.00, 'VN-20202-32', 'Hộp'),
('T023', 'Concor 5mg', 'Đức','https://cdn.tgdd.vn/Products/Images/6994/130389/concor-5mg-hinh-4.jpg', 'đang cung cấp', 180000.00, 'VN-21212-33', 'Hộp'),
('T024', 'Glucophage 500mg','Pháp','https://cdn.tgdd.vn/Products/Images/10049/131230/glucophage-500mg-2-2.jpg', 'đang cung cấp', 95000.00, 'VN-22222-34', 'Hộp'),
('T025', 'Micardis 40mg', 'Đức','https://cdn.nhathuoclongchau.com.vn/v1/static/00004931_micardis_40_8254_63ab_large_32a58176d9.jpg', 'đang cung cấp', 290000.00, 'VN-23232-35', 'Hộp'),

-- Nhóm 6: Hô hấp (26-30)
('T026', 'Ventolin Inhaler', 'Tây Ban Nha', 'https://nhathuocanphuoc.com.vn/thumbs/1470x1410x2/upload/product/thuoc-ventolin-inhaler-100-mcglieu-xit-salbutamol-sulfate-9099.jpg','đang cung cấp', 85000.00, 'VN-24242-36', 'Bình xịt'),
('T027', 'Halixol', 'Hungary','https://cdn.nhathuoclongchau.com.vn/unsafe/2560x0/filters:quality(90):format(webp)/00022506_halixol_30mg_egis_2x10_3752_60fa_large_c18baef023.jpg', 'đang cung cấp', 55000.00, 'VN-25252-37', 'Chai'),
('T028', 'Acemuc 200mg', 'Việt Nam','https://cdn.nhathuoclongchau.com.vn/v1/static/DSC_02609_e665222ac5.png', 'đang cung cấp', 60000.00, 'VD-26262-38', 'Hộp'),
('T029', 'Prospan', 'Đức','https://cdn.nhathuoclongchau.com.vn/unsafe/2560x0/filters:quality(90):format(webp)/00006137_prospan_100ml_9655_5c68_large_ad5603e714.jpg', 'đang cung cấp', 75000.00, 'VN-27272-39', 'Chai'),
('T030', 'Rhinathiol', 'Pháp','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4YOTALEcsrYKPdj4j4ibxf1MFVSeligPXsg&s', 'hết hàng', 80000.00, 'VN-28282-40', 'Chai'),

-- Nhóm 7: Cơ xương khớp (31-34)
('T031', 'Voltaren 50mg', 'Thụy Sĩ','https://cdn.nhathuoclongchau.com.vn/unsafe/2560x0/filters:quality(90):format(webp)/00008073_voltaren_50mg_7634_5b24_large_86578127b9.JPG', 'đang cung cấp', 150000.00, 'VN-29292-41', 'Hộp'),
('T032', 'Mobic 7.5mg', 'Đức','https://cdn.nhathuoclongchau.com.vn/v1/static/00004983_mobic_75mg_2506_63ab_large_9af7d8d30a.jpg', 'đang cung cấp', 190000.00, 'VN-30303-42', 'Hộp'),
('T033', 'Celebrex 200mg', 'Mỹ','https://cdn.nhathuoclongchau.com.vn/unsafe/2560x0/filters:quality(90):format(webp)/CELE_327986f579.jpg', 'đang cung cấp', 240000.00, 'VN-31313-43', 'Hộp'),
('T034', 'Salonpas', 'Việt Nam','https://cdn.nhathuoclongchau.com.vn/unsafe/2560x0/filters:quality(90):format(webp)/00017084_cao_dan_salonpas_20_mieng_65cm_x_42cm_6443_5f9b_large_e5d308c2f5.JPG', 'đang cung cấp', 15000.00, 'VD-32323-44', 'Miếng dán'),

-- Nhóm 8: Chống dị ứng (35-37)
('T035', 'Telfast BD 60mg', 'Pháp','https://cdn.nhathuoclongchau.com.vn/unsafe/2560x0/filters:quality(90):format(webp)/IMG_1170_6b83f9156a.jpg', 'đang cung cấp', 45000.00, 'VN-33334-45', 'Hộp'),
('T036', 'Zyrtec 10mg', 'Thụy Sĩ','https://cdn.tgdd.vn/Products/Images/10036/131861/zyrtec-10mg-mac-dinh-2.jpg', 'đang cung cấp', 85000.00, 'VN-34343-46', 'Hộp'),
('T037', 'Clarityne 10mg', 'Bỉ','https://cdn.nhathuoclongchau.com.vn/unsafe/2560x0/filters:quality(90):format(webp)/thuoc_clarityne_10mg_bayer_1x10_00049431_9ed3fc6265.png', 'đang cung cấp', 70000.00, 'VN-35353-47', 'Hộp'),

-- Nhóm 9: Da liễu (38-39)
('T038', 'Nizoral Cream 2%', 'Thái Lan', 'https://production-cdn.pharmacity.io/digital/1080x1080/plain/e-com/images/product/20250506065627-0-P28822_1.jpg?versionId=51RJ1nTSSHXU3XfQ9nSr9OIWqi8JtLeZ', 'đang cung cấp', 35000.00, 'VN-36363-48', 'Tuýp'),
('T039', 'Biafine', 'Pháp', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTe5ehqNIaVA1iuas7nFZXqRAYrO7gJ9wt1iQ&s','đang cung cấp', 90000.00, 'VN-37373-49', 'Tuýp'),

-- Nhóm 10: Mắt, mũi, tai (40)
('T040', 'V.Rohto', 'Việt Nam', 'https://rohto.com.vn/images/2023/new-vrohto-20230612.jpg', 'đang cung cấp', 55000.00, 'VD-38383-50', 'Lọ');

INSERT INTO medicine_group_medicines (group_id, medicine_id) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5),          -- Giảm đau
(2, 6), (2, 7), (2, 8), (2, 9), (2, 10),         -- Kháng sinh
(3, 11), (3, 12), (3, 13), (3, 14), (3, 15),     -- Tiêu hóa
(4, 16), (4, 17), (4, 18), (4, 19), (4, 20),     -- Vitamin
(5, 21), (5, 22), (5, 23), (5, 24), (5, 25),     -- Tim mạch
(6, 26), (6, 27), (6, 28), (6, 29), (6, 30),     -- Hô hấp
(7, 31), (7, 32), (7, 33), (7, 34),              -- Cơ xương khớp
(8, 35), (8, 36), (8, 37),                       -- Dị ứng
(9, 38), (9, 39),                                -- Da liễu
(10, 40);                                        -- Mắt, mũi, tai

INSERT INTO medicine_ingredient_details (medicine_id, ingredient_id, strength) VALUES
(1, 1, '500 mg'), -- Panadol Extra: Paracetamol
(2, 1, '250 mg'), -- Hapacol 250: Paracetamol
(3, 2, '400 mg'), -- Ibuprofen: Ibuprofen
(4, 1, '500 mg'), -- Efferalgan: Paracetamol
(6, 3, '875 mg'), (6, 4, '125 mg'), -- Augmentin: Amox + Clav
(7, 5, '500 mg'), -- Zinnat: Cefuroxime
(8, 3, '875 mg'), (8, 4, '125 mg'), -- Klamentin: Amox + Clav
(9, 6, '250 mg'), -- Azithromycin
(11, 8, '40 mg'), -- Nexium: Esomeprazole
(12, 9, '3 g'),   -- Smecta: Diosmectite
(15, 10, '2 tỷ bào tử'), -- Enterogermina: Lactobacillus
(16, 11, '500 mg'), (16, 12, '50 mg'), -- Enervon C: Vit C + B1
(17, 11, '500 mg'), -- Vit C 500mg
(18, 15, '1.1 g'),  -- Calcium Corbiere
(21, 16, '5 mg'),   -- Amlor: Amlodipine
(22, 17, '10 mg'),  -- Lipitor: Atorvastatin
(23, 18, '5 mg'),   -- Concor: Bisoprolol
(24, 19, '500 mg'), -- Glucophage: Metformin
(26, 20, '100 mcg/liều'), -- Ventolin: Salbutamol
(28, 21, '200 mg'), -- Acemuc: Acetylcysteine
(29, 22, '0.7 g/100ml'), -- Prospan: Cao lá thường xuân
(31, 23, '50 mg'),  -- Voltaren: Diclofenac
(32, 24, '7.5 mg'), -- Mobic: Meloxicam
(33, 25, '200 mg'), -- Celebrex: Celecoxib
(35, 26, '60 mg'),  -- Telfast: Fexofenadine
(36, 27, '10 mg'),  -- Zyrtec: Cetirizine
(37, 28, '10 mg'),  -- Clarityne: Loratadine
(38, 29, '2%'),     -- Nizoral: Ketoconazole
(40, 30, '0.9%');   -- V.Rohto: Natri clorid
