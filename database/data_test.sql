USE pharmacy_management;

INSERT INTO medicine_groups (group_name, description) VALUES
('Thuốc nhỏ mắt, tra mắt', 'Nhóm sản phẩm Thuốc nhỏ mắt, tra mắt'),
('Thuốc bổ và vitamin', 'Nhóm sản phẩm Thuốc bổ và vitamin'),
('Thuốc đau đầu, hạ sốt', 'Nhóm sản phẩm Thuốc đau đầu, hạ sốt'),
('Thuốc dị ứng, say xe', 'Nhóm sản phẩm Thuốc dị ứng, say xe'),
('Thuốc kháng sinh', 'Nhóm sản phẩm Thuốc kháng sinh'),
('Thuốc trị bệnh da liễu', 'Nhóm sản phẩm Thuốc trị bệnh da liễu'),
('Thuốc trị đau dạ dày, cơ trơn', 'Nhóm sản phẩm Thuốc trị đau dạ dày, cơ trơn'),
('Thuốc tim mạch, huyết áp', 'Nhóm sản phẩm Thuốc tim mạch, huyết áp');

INSERT INTO active_ingredients (ingredient_name) VALUES
('Natri clorid'),
('Neomycin'),
('Dexamethason'),
('Polymyxin B'),
('Ofloxacin'),
('Chlorpheniramine Maleate'),
('Acid aminocaproic'),
('Sulfamethoxazol'),
('Dipotassium Glycyrrhizinate'),
('Moxifloxacin'),
('Calci'),
('Vitamin B3'),
('Vitamin B5'),
('Vitamin B9'),
('Biotin'),
('Vitamin C'),
('Vitamin B6'),
('Vitamin B2'),
('Vitamin B1'),
('Magnesium'),
('Kẽm'),
('Vitamin B12'),
('Calci carbonat'),
('Calci cacbonat'),
('Ascorbic acid'),
('Hà thủ ô đỏ'),
('Phục linh'),
('Hoài sơn'),
('Thục địa'),
('Sơn thù'),
('Trạch tả'),
('Mẫu đơn bì'),
('Paracetamol'),
('Cetirizine dihydrochloride'),
('Loratadin'),
('Desloratadin'),
('Loratadine'),
('Amoxicillin'),
('Acid clavulanic'),
('Clarithromycin'),
('Clindamycin'),
('Erythromycin'),
('Levofloxacin'),
('Ciprofloxacin'),
('Acyclovir'),
('Adapalen'),
('Clobetason butyrat'),
('Fluocinolon acetonid'),
('Betamethason'),
('Acid Fusidic'),
('Clotrimazol'),
('Gentamicin'),
('Hydrocortison acetat'),
('Ketoconazol'),
('Hydroquinone'),
('Clobetasol'),
('Omeprazole'),
('Lansoprazole'),
('Simethicon'),
('Alverin'),
('Esomeprazole'),
('Esomeprazol'),
('Drotaverine hydrochloride'),
('Trimebutin maleat'),
('Amlodipin'),
('Irbesartan'),
('Candesartan Cilexetil'),
('Metoprolol tartrate'),
('Bisoprolol fumarat'),
('Hydrochlorothiazid'),
('Amiodarone hydrochloride'),
('Natri camphosulfonat'),
('Lạc tiên'),
('Perindopril'),
('Valsartan'),
('Trimetazidin dihydroclorid'),
('Kali clorid'),
('Nifedipin'),
('Lisinopril'),
('Hydrochlorothiazide');

INSERT INTO medicines (medicine_code, brand_name, origin, image_url, status, price, registration_number, unit) VALUES
('1193664000053', 'Dung dịch nhỏ mắt, mũi Efticol 0.9% vệ sinh mắt, mũi chai 10ml', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/9920/131134/efticol-09-thumb01-600x600.jpg', 'đang cung cấp', 2700, '893100655424 (SĐK cũ: VD-17871-12)', 'Chai'),
('1193664000057', 'Thuốc mỡ tra mắt Maxitrol trị tình trạng đáp ứng với corticoid ở mắt tuýp 3.5g', 'Bỉ', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/9920/131401/maxitrol-35g-thumb-1-2-600x600.jpg', 'đang cung cấp', 100000, '540110522824 (SĐK cũ: VN-21925-19)', 'Tuýp'),
('1193664000066', 'Hỗn dịch nhỏ mắt Maxitrol trị viêm mắt chai 5ml', 'Bỉ', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/9920/131402/maxitrol-5ml-thumb-01-600x600.jpg', 'đang cung cấp', 100000, 'VN-10720-10', 'Chai'),
('1193664000048', 'Dung dịch Natri Clorid Pharmedic 0.9% vệ sinh mắt, mũi chai 10ml', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/9920/131459/natri-clorid-09-pharmedic-thumb-1-600x600.jpg', 'đang cung cấp', 3500, '893100060724 (SĐK cũ: VD-28927-18)', 'Chai'),
('1193664000059', 'Thuốc mỡ tra mắt Oflovid 0.3% trị nhiễm khuẩn mắt tuýp 3.5g', 'Nhật Bản', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/9920/131508/oflovid-03-35g-thumb01-600x600.jpg', 'đang cung cấp', 100000, '499115415523 (SĐK cũ: VN-18723-15)', 'Tuýp'),
('1193664000050', 'Dung dịch nhỏ mắt Oflovid 0.3% trị nhiễm khuẩn mắt chai 5ml', 'Nhật Bản', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/9920/131507/oflovid-03-5ml-170423-094129-600x600.jpg', 'đang cung cấp', 100000, 'VN-19341-15', 'Chai'),
('1193664000052', 'Dung dịch nhỏ mắt Osla rửa mắt, trị ngứa mắt, mỏi mắt, khô rát mắt chai 15ml', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/9920/131523/osla-15ml-thumb-600x600.jpg', 'đang cung cấp', 24000, '893100929924 (SĐK cũ: VD-19138-13)', 'Chai'),
('1193664000039', 'Dung dịch nhỏ mắt Rohto Antibacterial trị lẹo mắt, viêm kết mạc mắt chai 13ml', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/9920/131613/rohto-antibacterial-13ml-thumb-600x600.jpg', 'đang cung cấp', 100000, '893110279400 (SĐK cũ: VD-24640-16)', 'Chai'),
('1193664000049', 'Dung dịch nhỏ mắt Vigamox 0.5% trị viêm kết mạc do vi khuẩn chai 5ml', 'Mỹ', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/9920/131813/vigamox-05-5ml-thumb-1-600x600.jpg', 'đang cung cấp', 100000, '001115023625 (SĐK cũ: VN-22182-19)', 'Chai'),
('1193668000094', 'Viên nén sủi bọt Berocca Performance trị thiếu hụt vitamin B, C tuýp 10 viên', 'Indonesia', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/10053/130908/berocca-performance-thumb0001-600x600.jpg', 'đang cung cấp', 7600, '899100177223 (SĐK cũ: VN-19391-15)', 'Viên'),
('1193668000085', 'Viên nén sủi bọt CalSource Ca-C1000 Orange bổ sung canxi, vitamin C tuýp 10 viên', 'Hy Lạp', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/10053/130951/ca-c-1000-sandoz-orange-thumb-600x600.jpg', 'đang cung cấp', 6000, 'VN-18394-14', 'Viên'),
('1193668000088', 'Viên nén sủi bọt CalSource bổ sung canxi tuýp 20 viên', 'Pakistan', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/10053/130956/calcium-sandoz-500mg-thumb-2-600x600.jpg', 'đang cung cấp', 5400, 'VN-20168-16', 'Viên'),
('1193661000083', 'Siro C.C.Life 100mg/5ml phòng và trị thiếu vitamin chai 60ml', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/10053/130051/cclife-60ml-thumb-1-600x600.jpg', 'đang cung cấp', 100000, 'VD-16995-12', 'Chai'),
('1193668000788', 'Farzincol 10mg bổ sung kẽm, trị thiếu kẽm (10 vỉ x 10 viên)', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10053/131171/farzincol-10mg-111124-054848-784-600x600.jpg', 'đang cung cấp', 100000, '893110881724 (SĐK cũ: VD-27848-17)', 'Viên'),
('1193668000829', 'Folacid 5mg phòng và trị thiếu axit folic hộp 4 vỉ x 20 viên', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10053/130784/folacid-5mg-111124-055443-371-300x300.jpg', 'đang cung cấp', 100000, '893110806224 (SĐK cũ: VD-31642-19)', 'Viên'),
('1193689000053', 'Hà Thủ Ô Traphaco hỗ trợ trị thiếu máu, tóc bạc sớm (5 vỉ x 20 viên)', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10053/131238/ha-thu-o-111124-053854-175-300x300.jpg', 'đang cung cấp', 55000, '893200122600 (SĐK cũ: VD-24066-16)', 'Viên'),
('1193668000810', 'Homtamin Ginseng bổ sung vitamin và khoáng chất, giảm mệt mỏi (12 vỉ x 5 viên)', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10053/131260/homtamin-ginseng-thumb-638669434223963382-600x600.jpg', 'đang cung cấp', 12250, '893100857924 (VD-24417-16)', 'Viên'),
('1193668000821', 'Moriamin Forte bổ sung acid amin và vitamin (10 vỉ x 10 viên)', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10053/131441/moriamin-forte-bo-sung-axit-amin-va-vitamin-fix-thumb-638684119282253121-600x600.jpg', 'đang cung cấp', 100000, '893110319600 (SĐK cũ: VD-23274-15)', 'Viên'),
('1193689000074', 'Cao lỏng Traluvi giúp trẻ ăn ngon, ngừa mồ hôi trộm chai 100ml', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/10053/131388/traluvi-100ml-thumb-1-600x600.jpg', 'đang cung cấp', 42000, 'VD-16770-12', 'Chai'),
('1193684000037', 'Viên đặt trực tràng Efferalgan 300mg giảm đau, hạ sốt (2 vỉ x 5 viên)', 'Pháp', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/pim/cdn/images/202606/efferalgan-300mg-thumb145540.jpg', 'đang cung cấp', 3100, '300100011424 (SĐK cũ: VN-21217-18)', 'Viên'),
('1193684000076', 'Hapacol 325 giảm đau, hạ sốt (10 vỉ x 10 viên)', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10244/129408/hapacol-325mg-dhg-thumb-638682148344417180-300x300.jpg', 'đang cung cấp', 29000, '893100095323 (SĐK cũ: VD-20559-14)', 'Viên'),
('1193687000227', 'Hapacol 650 giảm đau, hạ sốt (10 vỉ x 5 viên)', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10244/131241/hapacol-650mg-dhg-thumb-638682188782202871-600x600.jpg', 'đang cung cấp', 30000, 'VD-21138-14', 'Viên'),
('1193696000038', 'Cetirizine Stella 10mg giảm các triệu chứng viêm mũi dị ứng (5 vỉ x 10 viên)', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10036/130768/cetirizine-stada-10mg-fix-thumb-638683514684010382-300x300.jpg', 'đang cung cấp', 500, 'VD-30834-18', 'Viên'),
('1193696000032', 'Clarityne 10mg giảm các triệu chứng viêm mũi dị ứng, mề đay (1 vỉ x 10 viên)', 'Indonesia', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10036/131002/clarityne-10mg-thumb-638790393851108307-600x600.jpg', 'đang cung cấp', 6800, 'VN-19796-16', 'Viên'),
('1193661000040', 'Siro Destacure 2.5mg/5ml trị viêm mũi dị ứng, mày đay tự phát chai 60ml', 'Ấn Độ', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/10036/129252/destacure-thum01-600x600.jpg', 'đang cung cấp', 60000, '890100133924 (SĐK cũ: VN-16773-13)', 'Chai'),
('1193661000031', 'Siro Lorastad Sp. giảm triệu chứng viêm mũi và mề đay mạn tính chai 60ml', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/10036/131384/lorastad-sp-60ml-thumb-1-2-600x600.jpg', 'đang cung cấp', 15000, '893100107423 (SĐK cũ: VD-23972-15)', 'Chai'),
('1193661000027', 'Siro Neocilor trị viêm mũi dị ứng, mày đay chai 50ml', 'Bangladesh', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/10036/130049/neocilor-syrup-50ml-thumb01-600x600.jpg', 'đang cung cấp', 100000, 'VN-18873-15', 'Chai'),
('1193686000098', 'Amoxicillin Domesco 500mg trị nhiễm khuẩn (10 vỉ x 10 viên)', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10026/130845/amoxicillin-500mg-thumb01-638676090614853770-600x600.jpg', 'đang cung cấp', 100000, '893110910524 (SĐK cũ: VD-22625-15)', 'Viên'),
('1193685000026', 'Bột pha hỗn dịch uống Augmentin GSK 250mg/31.25mg điều trị nhiễm khuẩn hộp 12 gói', 'Pháp', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10026/130872/augmentin-250mg-3125mg-thumb01-638676091835129662-600x600.jpg', 'đang cung cấp', 100000, 'VN-17444-13', 'Hộp'),
('1193686000087', 'Clarithromycin Stella 250mg trị nhiễm khuẩn do các vi khuẩn nhạy cảm (2 vỉ x 10 viên)', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10026/131000/clarithromycin-stada-250mg-thumb01-638676096425339238-600x600.jpg', 'đang cung cấp', 100000, '893110390123 (SĐK cũ: VD-31395-18)', 'Viên'),
('1193686000092', 'Dalacin C 300mg trị nhiễm khuẩn (2 vỉ x 8 viên)', 'Pháp', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10026/129938/dalacin-c-thubm01-638673976252472632-600x600.jpg', 'đang cung cấp', 100000, 'VN-18404-14', 'Viên'),
('1193686000088', 'Erythromycin Mekophar 500mg trị nhiễm khuẩn đường hô hấp, da, mô mềm (10 vỉ x 10 viên)', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10026/131153/erythromycin-500mg-thumb01-638676099931539330-600x600.jpg', 'đang cung cấp', 100000, '893110452624 (SĐK cũ: VD-32136-19)', 'Viên'),
('1193686000077', 'Levofloxacin Stada 500mg trị nhiễm khuẩn (2 vỉ x 7 viên)', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10026/129446/levofloxacin-stada-500mg-thumb01-638673962237155028-300x300.jpg', 'đang cung cấp', 100000, 'VD-24565-16', 'Viên'),
('1193686000082', 'OpeCipro 500 trị nhiễm khuẩn (2 vỉ x 7 viên)', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10026/131517/opecipro-500mg-thumb-638675274196192368-300x300.jpg', 'đang cung cấp', 100000, '893115103123 (SĐK cũ: VD-21676-14)', 'Viên'),
('1193678000102', 'Acyclovir Stella Cream điều trị nhiễm virus Herpes simplex da tuýp 5g', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/10037/130803/acyclovir-stada-cream-thumb01-600x600.jpg', 'đang cung cấp', 17500, '893100336723 (SĐK cũ: VD-25031-16)', 'Tuýp'),
('1193689000205', 'Kem bôi Differin 0.1% trị mụn trứng cá tuýp 30g', 'Pháp', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/10037/131102/differin-adapalene-cream-01-thumb-600x600.jpg', 'đang cung cấp', 100000, 'VN-19652-16', 'Tuýp'),
('1193678000113', 'Kem bôi Eumovate Cream 0.05% trị viêm da tuýp 5g', 'Anh', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/10037/131164/eumovate-cream-5g-thumb1-600x600.jpg', 'đang cung cấp', 24000, '500100028323 (SĐK cũ: VN-18307-14)', 'Tuýp'),
('1193678000105', 'Thuốc mỡ Flucinar trị viêm da tuýp 15g', 'Ba Lan', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/10037/131185/flucinar-15g-thumb-600x600.jpg', 'đang cung cấp', 100000, 'VN-20849-17', 'Tuýp'),
('1193678000122', 'Kem bôi Fucicort trị viêm da tuýp 15g', 'Ireland', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/10037/131201/fucicort-15g-thumb-1-2-600x600.jpg', 'đang cung cấp', 100000, '539110417123 (SĐK cũ: VN-14208-11)', 'Tuýp'),
('1193678000119', 'Gentridecme Cream trị viêm da tuýp 10g', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/10037/131214/gentridecme-cream-10g-thumb-1-2-600x600.jpg', 'đang cung cấp', 100000, '893110255700 (SĐK cũ: VD-28590-17)', 'Tuýp'),
('1193678000108', 'Kem bôi Shinpoong Gentri-Sone trị viêm da tuýp 10g', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/10037/131215/gentrisone-cream-10g-thumb-1-2-600x600.jpg', 'đang cung cấp', 100000, '893110396823 (SĐK cũ: VD-21761-14)', 'Tuýp'),
('1193678000153', 'Kem bôi Forsancort 1% trị các bệnh viêm da tiếp xúc tuýp 10g', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10037/129853/kem-boi-da-forsancort-10g-thumb-638724634663405403-600x600.jpg', 'đang cung cấp', 100000, 'VD-32290-19', 'Tuýp'),
('9253123000095', 'Dầu gội Nizoral phòng và trị gàu, nấm da đầu, viêm tiết bã nhờn chai 50ml', 'Thái Lan', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/10037/131489/nizoral-shampoo-50ml-thumb-1-600x600.jpg', 'đang cung cấp', 70000, 'VN-22415-19', 'Chai'),
('1193678000125', 'Kem bôi Phil Domina trị nám da, tàn nhang tuýp 10g', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/10037/131115/phil-domina-10g-thumb-01-600x600.jpg', 'đang cung cấp', 100000, '893110464124 (SĐK cũ: VD-20588-14)', 'Tuýp'),
('1193678000103', 'Kem bôi Philclobate trị viêm da tuýp 15g', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/10037/131006/philclobate-15g-thumb01-600x600.jpg', 'đang cung cấp', 100000, '893110621024 (SĐK cũ: VD-22042-14)', 'Tuýp'),
('1193682000108', 'Helinzole 20mg trị viêm loét, trào ngược dạ dày-thực quản (3 vỉ x 8 viên)', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10039/130542/helinzonle-20mg-281124-033053-184-600x600.jpg', 'đang cung cấp', 100000, 'VD-21005-14', 'Viên'),
('1193682000097', 'Lansoprazole Stella 30mg trị loét dạ dày, trào ngược dạ dày, thực quản', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10039/131348/lansoprazol-stada-30mg-091224-023042-800-600x600.jpg', 'đang cung cấp', 100000, '893110060000 (SĐK cũ: VD-21532-14)', 'Viên'),
('1193682000065', 'MeteoSpasmyl trị trướng bụng, rối loạn chức năng ruột (2 vỉ x 10 viên)', 'Pháp', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10039/131420/meteospasmyl-281124-035047-263-600x600.jpg', 'đang cung cấp', 100000, 'VN-22269-19', 'Viên'),
('1193682000088', 'Nexium Mups 20mg trị trào ngược dạ dày, thực quản (2 vỉ x 7 viên)', 'Thụy Điển', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10039/131475/nexium-mups-20mg-281124-035410-948-600x600.jpg', 'đang cung cấp', 100000, 'VN-19783-16', 'Viên'),
('1193682000098', 'Nexium Mups 40mg trị trào ngược dạ dày, thực quản (2 vỉ x 7 viên)', 'Thụy Điển', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10039/131476/nexium-mups-40mg-281124-035532-733-600x600.jpg', 'đang cung cấp', 100000, 'VN-19782-16', 'Viên'),
('1193682000288', 'No-Spa 40mg giảm đau do co thắt tiêu hóa (5 vỉ x 10 viên)', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10039/131490/no-spa-40mg-281124-035658-540-300x300.jpg', 'đang cung cấp', 100000, '893110049200 (SĐK cũ: VD-34026-20)', 'Viên'),
('1193682000126', 'Prazopro 40mg trị trào ngược dạ dày, thực quản (2 vỉ x 7 viên)', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10039/129298/prazopro-40mg-281124-030937-764-600x600.jpg', 'đang cung cấp', 100000, 'VD-19498-13', 'Viên'),
('1193682000076', 'Trimebutin TV.Pharm 100mg trị các chứng rối loạn chức năng tiêu hóa (10 vỉ x 10 viên)', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/10039/130552/trimebutin-100mg-281124-033157-093-300x300.jpg', 'đang cung cấp', 100000, 'VD-23720-15', 'Viên'),
('1193681000151', 'Amlodipin Domesco 5mg trị tăng huyết áp, đau thắt ngực (3 vỉ x 10 viên)', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/6994/130838/amlodipin-5mg-domesco-011224-102815-685-600x600.jpg', 'đang cung cấp', 100000, '893110315623 (SĐK cũ: VD-27371-17)', 'Viên'),
('1193681000111', 'Aprovel 150mg trị tăng huyết áp (2 vỉ x 14 viên)', 'Pháp', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/6994/130856/aprovel-150mg-011224-102134-390-600x600.jpg', 'đang cung cấp', 100000, 'VN-16719-13', 'Viên'),
('1193681000144', 'Aprovel 300mg điều trị tăng huyết áp (2 vỉ x 14 viên)', 'Pháp', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/6994/130857/aprovel-300mg-011224-101914-809-600x600.jpg', 'đang cung cấp', 100000, 'VN-16720-13', 'Viên'),
('1193681000137', 'Atasart Tablets 8mg điều trị tăng huyết áp (2 vỉ x 7 viên)', 'Pakistan', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/6994/130865/atasart-8mg-011224-101730-462-600x600.jpg', 'đang cung cấp', 100000, '896110994924 (SĐK cũ: VN-21857-19)', 'Viên'),
('1193681000112', 'Betaloc ZOK 25mg trị tăng huyết áp, đau thắt ngực (1 vỉ x 14 viên)', 'Thụy Điển', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/6994/130916/betaloc-zok-25mg-011224-101358-856-600x600.jpg', 'đang cung cấp', 100000, 'VN-17243-13', 'Viên'),
('1193681000145', 'Bihasal 5 điều trị tăng huyết áp, đau thắt ngực (3 vỉ x 10 viên)', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/6994/130923/bihasal-5mg-thumb01-638693485053899186-600x600.jpg', 'đang cung cấp', 100000, 'VD-17762-12', 'Viên'),
('1193681000148', 'CoAprovel 300/12.5mg trị tăng huyết áp (2 vỉ x 14 viên)', 'Pháp', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/6994/131014/co-aprovel-300mg-125mg-291124-053219-526-300x300.jpg', 'đang cung cấp', 100000, 'VN-17392-13', 'Viên'),
('1193681000099', 'CoAprovel 150/12.5mg sử dụng phối hợp trong trị tăng huyết áp (2 vỉ x 14 viên)', 'Pháp', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/6994/131013/coaprovel-150-125mg-291124-053359-770-300x300.jpg', 'đang cung cấp', 100000, 'VN-16721-13', 'Viên'),
('1193681000139', 'Cordarone 200mg trị loạn nhịp tim (2 vỉ x 15 viên)', 'Pháp', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/6994/131028/cordarone-200mg-thumb01-638681408879751185-600x600.jpg', 'đang cung cấp', 100000, 'VN-16722-13', 'Viên'),
('1193689000046', 'Thuốc nước Cortonyl OPC trị mất ngủ, trợ tim chai 25ml', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/6994/131030/cortonyl-opc-thumb-600x600.jpg', 'đang cung cấp', 100000, '893110112523 (SĐK cũ: VD-21868-14)', 'Chai'),
('1193681000154', 'Coversyl 10mg điều trị tăng huyết áp, bệnh động mạch vành ổn định lọ 30 viên', 'Pháp', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdn.tgdd.vn/Products/Images/6994/131034/coversyl-10mg-thumb-2-600x600.jpg', 'đang cung cấp', 100000, 'VN-17086-13', 'Viên'),
('1193681000155', 'Diovan 160 trị tăng huyết áp, suy tim, sau nhồi máu cơ tim (2 vỉ x 14 viên)', 'Tây Ban Nha', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/6994/131106/diovan-160mg-thumb01-638681411724997571-300x300.jpg', 'đang cung cấp', 100000, 'VN-18398-14', 'Viên'),
('1193681000142', 'Diovan 80 trị tăng huyết áp, suy tim (2 vỉ x 14 viên)', 'Tây Ban Nha', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/6994/131107/diovan-80mg-thumb01-638681413250151431-300x300.jpg', 'đang cung cấp', 100000, 'VN-18399-14', 'Viên'),
('1193681000162', 'Eftifarene 20mg trị đau thắt ngực (2 vỉ x 30 viên)', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/6994/131135/eftifarene-20mg-thumb01-638700271662359935-600x600.jpg', 'đang cung cấp', 100000, '893110272523 (SĐK cũ: VD-21227-14)', 'Viên'),
('1193681000147', 'Kaleorid 600mg phòng và trị giảm kali máu (3 vỉ x 10 viên)', 'Đan Mạch', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/6994/131294/kaleorid-600mg-fix-thumb-638678897608772956-300x300.jpg', 'đang cung cấp', 100000, 'VN-15699-12', 'Viên'),
('1193681000146', 'Nifedipin T20 Retard Stella trị tăng huyết áp, đau thắt ngực (10 vỉ x 10 viên)', 'Việt Nam', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/6994/131481/nifedipin-t20-stada-retard-20mg-fix-thumb-638678900904005970-300x300.jpg', 'đang cung cấp', 100000, '893110462724 (SĐK cũ: VD-24568-16)', 'Viên'),
('1193681000105', 'Zestoretic-20 trị tăng huyết áp từ nhẹ đến trung bình (2 vỉ x 14 viên)', 'Trung Quốc', 'https://img.tgdd.vn/imgt/ankhang/f_webp,fit_outside,quality_95/https://cdnv2.tgdd.vn/mwg-static/ankhang/Products/Images/6994/131844/zestoretic-20-thumb01-638682364118232470-600x600.jpg', 'đang cung cấp', 100000, '690110794424 (SĐK cũ: VN-17836-14)', 'Viên');

INSERT INTO usage_instructions (medicine_id, dosage_form, packaging, uses, contraindications, side_effects, dosage_administration, storage_condition, warning, document) VALUES
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000053'), 'Dung dịch nhỏ mắt', '1 chai x 10ml', 'Nhỏ mắt hoặc rửa mắt, chống kích ứng mắt và sát trùng nhẹ.
Trị nghẹt mũi, sổ mũi, viêm mũi do dị ứng.
Dùng thích hợp cho trẻ sơ sinh và người lớn.', 'Dị ứng với một trong các thành phần của thuốc.', 'Đôi khi có phản ứng dị ứng tại chỗ.
Thông báo cho bác sĩ tác dụng không mong muốn gặp phải khi dùng thuốc.', 'Nhỏ hoặc rửa mắt, hốc mũi, mỗi lần 2 - 3 giọt, ngày 3 - 4 lần hoặc nhiều hơn.
Không sử dụng sau khi mở nắp lần đầu 15 ngày.
- Quá liều
Efticol 0,9% khi dùng quá liều không ảnh hưởng tới sức khỏe nên không cần có biện pháp xử lý.', 'nhiệt độ dưới 30°C, tránh ánh sáng.', '- Thận trọng khi sử dụng
Đậy kín sau khi dùng.
Tránh làm nhiễm bẩn đầu chai thuốc.
- Thai kỳ và cho con bú
Không ảnh hưởng.
- Tương tác thuốc
Chưa có tài liệu nghiên cứu', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000057'), 'Thuốc mỡ tra mắt', '1 tuýp x 3.5g', 'Thuốc mỡ tra mắt Maxitrol được chỉ định để điều trị ngắn hạn các tình trạng đáp ứng với corticoid ở mắt khi cần dự phòng kháng sinh, sau khi đã loại trừ sự hiện diện của nấm và vi rút.', '• Quá mẫn với các hoạt chất (dexamethason, polymyxin B, neomycin) hoặc bất cứ thành phần nào của thuốc.
• Viêm giác mạc do Herpes simplex.
• Bệnh đậu bò, thủy đậu và những nhiễm virus khác ở giác mạc hoặc kết mạc.
• Các bệnh do nấm của cấu trúc mắt hoặc bệnh lý mắt do nhiễm ký sinh trùng chưa được điều trị.
• Nhiễm khuẩn lao ở mắt.', 'Những phản ứng bất lợi sau đây được phân loại theo quy ước như sau: rất thường gặp (> 1/10), thường
gặp (> 1/100 đến ≥1/1000 đến ≥1/10,000 đến
Hệ cơ quan
Phản ứng bất lợi (thuật ngữ của MedDRA (v.18.0))
Rối loạn mắt
Không phổ biến: viêm giác mạc, tăng áp lực nội nhãn, ngứa mắt, khó chịu ở mắt, kích ứng mắt.
Bảng tóm tắt các phản ứng bất lợi (từ giám sát hậu mãi)
Các phản ứng bất lợi được xác định từ giám sát hậu mãi được trình bày sau đây. Tần suất có thể ước tính từ các dữ liệu sẵn có. Trong mỗi nhóm tần suất, các tác dụng bất lợi được sắp xếp theo thứ tự mức độ
nghiêm trọng giảm dần.
Hệ cơ quan
Phản ứng bất lợi (thuật ngữ của MedDRA (v.18.0))
Rối loạn hệ miễn dịch
Quá mẫn
Rối loạn hệ thần kinh
Đau đầu
Rối loạn mắt
Viêm loét giác mạc, nhìn mờ, sợ ánh sáng, giãn đồng tử, sa mí mắt, đau mắt, sưng mắt, cảm giác có dị vật trong mắt, sung huyết mắt, tăng chảy nước mắt
Rối loạn da và mô
dưới da
Hội chứng Stevens-Johnson
Thông báo cho bác sỹ hoặc dược sỹ của bạn các tác dụng không mong muốn gặp phải khi sử dụng thuốc.', 'Thuốc chỉ dùng để tra mắt
Nếu đang dùng nhiều hơn một loại thuốc tra mắt, các loại thuốc phải được dùng cách nhau ít nhất 5 phút. Thuốc mỡ tra mắt cần dùng sau cùng.
Người lớn
• Tra một lượng thuốc vào túi kết mạc, có thể tới 3 hoặc 4 lần một ngày.
• Không được để đầu tuýp thuốc chạm vào mắt.
Trẻ em
Chưa thiết lập được tính an toàn và hiệu quả của thuốc mỡ tra mắt MAXITROL trên trẻ em.
Người cao tuổi
Liều dùng giống như ở người lớn.
Bệnh nhân suy gan, suy thận
Thuốc mỡ tra mắt MAXITROL chưa được nghiên cứu trên các đối tượng này. Tuy nhiên, do sự hấp thu toàn thân của các hoạt chất trong chế phẩm sau khi tra mắt thấp, không cần thiết phải hiệu chỉnh liều.
- Quá liều
Do đặc điểm của chế phẩm này để sử dụng tại chỗ, quá liều thuốc tra mắt này không được cho là gây thêm độc tính khi tra mắt quá liều cấp tính cũng như khi vô tình nuốt nhầm 1 lọ thuốc.
Trường hợp tra thuốc mỡ MAXITROL quá liều, nên rửa mắt bằng nước ấm.', 'Bảo quản thuốc ở nhiệt độ từ 2°C - 8°C.', '- Thận trọng khi sử dụng
Chỉ sử dụng để tra mắt. Không được tiêm hay nuốt.
Sau khi mở nắp lọ, nếu vòng đảm bảo bị rời ra, tháo bỏ trước khi dùng.
• Cũng như tất cả các kháng sinh, việc sử dụng kéo dài có thể dẫn đến sự tăng trưởng quá mức của các chủng vi khuẩn không nhạy cảm hoặc nấm. Trong trường hợp có bội nhiễm, nên bắt đầu điều trị thích hợp.
• Một số bệnh nhân có thể xảy ra mẫn cảm với aminoglycosid dùng tại chỗ, như neomycin, cần ngưng điều trị nếu xuất hiện quá mẫn trong quá trình dùng thuốc. Mức độ nghiêm trọng của các phản ứng dị ứng có thể từ phản ứng tại chỗ đến phản ứng toàn thân như ban đỏ, ngứa, mày đay, phát ban da, sốc phản vệ, phản ứng phản vệ hoặc phản ứng bóng nước. Nếu có dấu hiệu phản ứng nghiêm trọng hoặc quá mẫn cảm xảy ra, ngừng dùng thuốc tra mắt MAXITROL.
• Bệnh nhân sử dụng các thuốc mắt có chứa neomycin sulphat nên thăm khám bác sĩ nếu thấy đau mắt, đỏ, sưng hoặc kích ứng nặng hơn hoặc kéo dài.
• Đã xảy ra các phản ứng bất lợi nghiêm trọng bao gồm độc tính thần kinh, độc tính trên thính giác và thận trên những bệnh nhân điều trị với neomycin đường toàn thân hoặc khi sử dụng tại chỗ để điều trị vết thương hở hoặc tổn thương da. Phản ứng độc tính trên thận và thần kinh cũng xảy ra với polymyxin B đường toàn thân. Mặc dù các ảnh hưởng này chưa được báo cáo sau khi tra thuốc này, nên thận trọng khi dùng đồng thời với aminoglycosid hoặc polymyxin B đường toàn thân.
• Sử dụng các corticosteroid ở mắt kéo dài có thể dẫn đến tăng nhãn áp và/ hoặc gloucom, với tổn thương thần kinh thị giác, giảm thị lực và khiếm khuyết thị trường và gây đục thủy tinh thể dưới bao sau. Nên theo dõi nhãn áp định kỳ và thường xuyên cho bệnh nhân điều trị corticosteroid ở mắt kéo dài. Điều này đặc biệt quan trọng cho bệnh nhi, vì nguy cơ tăng nhãn áp do dùng corticosteroid ở trẻ em có thể cao hơn và xảy ra sớm hơn so với ở người lớn. Thuốc mỡ tra mắt MAXITROL không được phê duyệt để sử dụng ở bệnh nhi.
• Nguy cơ tăng nhãn áp do dùng corticosteroid và/ hoặc đục thể thủy tinh tăng lên ở những bệnh nhân dễ nhiễm bệnh (ví dụ: bệnh đái tháo đường).
• Với những bệnh làm mỏng giác mạc hoặc củng mạc, đã có gặp gây thủng các bộ phận đó sau khi dùng corticosteroid tại chỗ.
• Corticosteroid có thể làm giảm sức đề kháng và tạo điều kiện nhiễm các vi khuẩn không nhạy cảm, nhiễm nấm, kí sinh trùng hoặc vi rút và che lấp các dấu hiệu lâm sàng của bệnh hoặc có thể làm giảm các phản ứng quá mẫn với thành phần hoạt chất trong thuốc, cần cân nhắc đến khả năng bị nhiễm nấm ở những bệnh nhân bị loét giác mạc kéo dài. Cần ngừng ngay liệu pháp điều trị bằng corticosteroid khi bị nhiễm nấm.
• Để tránh nguy cơ tăng cường các bệnh giác mạc do Herpes, cần kiểm tra khe đèn thường xuyên.
• Corticosteroid dùng tại chỗ ở mắt có thể làm chậm sự hồi phục vết thương giác mạc. Đã biết việc dùng thuốc chống viêm không steroid (NSAIDs) tại chỗ cũng làm chậm hoặc trì hoãn sự phục hồi vết thương. Sử dụng đồng thời thuốc chống viêm không steroid và steroid tại chỗ có thể làm tăng nguy cơ đối với vấn đề hồi phục vết thương (xem mục TƯƠNG TÁC THUỐC)
• Không nên đeo kính áp tròng khi điều trị các tình trạng viêm ở mắt. Do đó, bệnh nhân không nên đeo kính áp tròng khi điều trị với MAXITROL.
• Ngoài ra, neomycin dùng tại chỗ có thể dẫn đến nhạy cảm da.
• Có thể xảy ra mẫn cảm chéo với các aminoglycosid khác, nên xem xét đến khả năng các bệnh nhân trở nên mẫn cảm với neomycin dùng tại chỗ cũng có thể mẫn cảm với các aminoglycosid tại chỗ và/ hoặc toàn thân khác.
• Hội chứng Cushing và/hoặc ức chế tuyến thượng thận do có sự hấp thu toàn thân của khi dùng tại mắt dexamethason có thể xảy ra sau khi điều trị tăng cường hoặc liên tục kéo dài ở những bệnh nhân có yếu tố nguy cơ, bao gồm cả trẻ em và những bệnh nhân được điều trị bằng ritonavir (xem mục TƯƠNG TÁC THUỐC). Trong những trường hợp này, việc điều trị không nên ngừng đột ngột mà nên giảm liều dần dần.
• Cũng như các kháng sinh khác, sử dụng dài ngày các kháng sinh như neomycin và polymyxin có thể dẫn đến sự phát triển quá mức các vi sinh vật không nhạy cảm, bao gồm cả nấm ở những người đã hoặc đang dùng thuốc và ngừng điều trị corticoid nếu xảy ra nhiễm nấm. Nếu xảy ra bội nhiễm, nên ngừng sử dụng và bắt đầu liệu pháp điều trị thay thế.
• Thuốc này có chứa methylparahydroxybenzoat và propylparahydroxybenzoat có thể gây ra phản ứng dị ứng (có thể xảy ra muộn).
• Thuốc này có chứa lanolin có thể gây phản ứng da tại chỗ (ví dụ viêm da tiếp xúc).
Không được dùng sau khi mở nắp tuýp thuốc lần đầu 28 ngày.
- Thai kỳ và cho con bú
Phụ nữ có thai
Các kháng sinh aminoglycosid như neomycin không qua nhau thai sau khi tiêm tĩnh mạch ở phụ nữ mang thai. Các nghiên cứu tiền lâm sàng và lâm sàng đã chứng minh độc tính trên tai và thận của aminoglycosid. Ở liều thấp dùng tại chỗ, neomycin được cho rằng không gây ra độc tính trên tai và thận khi thuốc tiếp xúc với tử cung. Sử dụng corticoid kéo dài và lặp lại khi mang thai có liên quan đến nguy cơ cao chậm phát triển tử cung. Trẻ sơ sinh có mẹ dùng corticoid trong thai kỳ nên quan sát thận trọng các dấu hiệu suy giảm chức năng tuyến thượng thận (xem mục CẢNH BÁO VÀ THẬN TRỌNG). Các nghiên cứu trên động vật cho thấy độc tính sinh sản của dexamethason sau khi dùng toàn thân và tại mắt (xem mục DỮ LIỆU TIỀN LÂM SÀNG). Không có dữ liệu về tính an toàn của polymyxin B ở động vật mang thai. Không khuyến cáo dùng thuốc mỡ tra mắt MAXITROL trong thai kỳ.
Cho con bú
Chưa biết liệu dexamethason, neomycin hoặc polymyxin B có bài tiết vào sữa mẹ hay không. Aminoglycosid được bài tiết vào sữa mẹ sau khi dùng thuốc toàn thân. Không có dữ liệu về việc dexamethason và polymyxin B vào sữa mẹ. Tuy nhiên, dường như không phát hiện được lượng dexamethason, neomycin và polymyxin B trong sữa mẹ và không có khả năng gây ra tác dụng trên lâm sàng ở những trẻ sơ sinh khi mẹ dùng thuốc tại chỗ. Không loại trừ nguy cơ đối với trẻ bú mẹ.
Cần cân nhắc lợi ích của việc bú mẹ với trẻ và lợi ích của việc điều trị cho mẹ để quyết định ngừng cho con bú hoặc ngừng/tránh sử dụng thuốc mỡ tra mắt MAXITROL.
Khả năng sinh sản
Chưa có dữ liệu về ảnh hưởng của việc sử dụng neomycin hoặc polymyxin B trên khả năng sinh sản của nam và nữ. Các dữ liệu lâm sàng hiện còn hạn chế để đánh giá ảnh hưởng của dexamethason trên khả năng sinh sản của nam giới và nữ giới. Dexamethason cho thấy không có tác dụng bất lợi trên khả năng sinh sản ở mô hình chuột đã được tiêm hormon chorionic gonadotropin.
- Khả năng lái xe và vận hành máy móc
Nhìn mờ tạm thời hoặc những rối loạn khác về thị lực có thể ảnh hưởng tới khả năng lái xe hay vận hành máy móc. Nếu bị nhìn mờ khi tra mắt, bệnh nhân phải chờ cho tới khi nhìn rõ rồi mới được phép lái xe và vận hành máy móc
- Tương tác thuốc
• Sử dụng đồng thời steroid dùng tại chỗ với thuốc chống viêm không steroid tại chỗ có thể làm tăng nguy cơ đối với vấn đề hồi phục vết thương giác mạc.
• Ở những bệnh nhân điều trị với ritonavir, có sự tăng nồng độ dexamethason trong huyết tương', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000066'), 'Hỗn dịch nhỏ mắt', '1 chai x 5ml', 'Thuốc MAXITROL được chỉ định sử dụng trong trường hợp viêm ở mắt khi xét thấy cần dùng đồng thời cả thuốc kháng khuẩn.', 'Viêm biểu mô giác mạc do herpes simplex (viêm giác mạc cành cây), bệnh đậu bò, thuỷ đậu và nhiều bệnh khác của kết mạc và giác mạc do virus gây ra. Nhiễm khuẩn Mycobacterium ở mắt, bệnh do nấm gây ra ở các bộ phận của mắt.
Bệnh nhân mẫn cảm với bất kỳ thành phần nào của thuốc.
Luôn luôn chống chỉ định sử dụng những loại thuốc phối hợp này sau khi mổ lấy dị vật giác mạc không có biến chứng.
Các trường hợp nhiễm khuẩn sinh mủ không được điều trị.', 'Đã có xảy ra những phản ứng phụ khi sử dụng những thuốc phối hợp steroid và kháng khuẩn, những phản ứng đó có thể là do thành phần steroid, thành phần kháng khuẩn hay do cả hỗn hợp. Chưa có những con số chính xác về tần suất phản ứng phụ vì chưa có thống kê về tổng số bệnh nhân được điều trị. Các phản ứng thường xảy ra nhất do thành phần kháng khuẩn là những phản ứng mẫn cảm dị ứng. Các phản ứng do thành phần steroid theo tần suất giảm dần như sau: tăng áp lực nội nhãn (IOP) có khả năng tiến triển thành glaucoma, và tổn thương thần kinh thị giác không thường xuyên, hình thành đục thủy tinh thể dưới bao phía sau, và chậm liền vết thương.
Nhiễm khuẩn thứ phát: nhiễm khuẩn thứ phát đã xảy ra sau khi sử dụng những thuốc phối hợp
Chứa steroid và kháng sinh. Nhiễm nấm ở giác mạc đặc biệt dễ xảy ra sau khi sử dụng steroid dài ngày. Khi đã điều trị bằng steroid phải xét khả năng xâm nhiễm nấm trong bất kỳ trường hợp nào có loét giác mạc kéo dài.
Nhiễm khuẩn thứ phát cũng có thể xảy ra do giảm đáp ứng của cơ thể.
Thông báo cho bác sĩ những tác dụng không mong muốn gặp phải khi sử dụng thuốc.', 'Lắc kỹ trước khi dùng.
Thuốc chỉ dùng để nhỏ mắt.
Trường hợp nhẹ, nhỏ 1 đến 2 giọt thuốc vào túi kết mạc của mắt bị bệnh, 4 - 6 lần mỗi ngày. Giảm dần số lần nhỏ thuốc khi các triệu chứng lâm sàng được cải thiện, không được ngừng điều trị quá sớm.
Trường hợp nặng, nhỏ 1 - 2 giọt thuốc mỗi giờ, sau đó giảm dần và ngừng điều trị khi hết viêm.
Bệnh nhân cần nhẹ nhàng khép mí mắt và chẹn ống thông mũi lệ sau khi nhỏ thuốc vào mắt để làm giảm lượng thuốc hấp thu vào vòng tuần hoàn chung, giảm tác dụng phụ toàn thân.
Sử dụng ở trẻ em:
Độ an toàn và hiệu quả của thuốc trên trẻ em chưa được xác định
Sử dụng ở bệnh nhân suy gan, suy thận:
Hỗn dịch thuốc nhỏ mắt MAXITROL chưa được nghiên cứu trên các đối tượng này. Tuy nhiên, do các hoạt chất trong chế phẩm hấp thu rất ít vào vòng tuần hoàn chung sau khi nhỏ mắt, không cần thiết phải hiệu chỉnh liều.
- Quá liều
Dấu hiệu và triệu chứng lâm sàng khi quá liều MAXITROL cũng tương tự như một số phản ứng phụ đã được quan sát ở một số bệnh nhân (viêm kết mạc dạng đốm, xung huyết, tăng chảy nước mắt, phù và ngứa mi mắt).
Trường hợp nhỏ mắt quá liều, nên rửa mắt bằng nước ấm.', 'bảo quản:', '- Thận trọng khi sử dụng
Dùng thuốc kéo dài có thể dẫn đến glaucoma, kèm tổn thương thần kinh thị giác, khiếm khuyết thị lực và thị trường, và tạo thành đục thủy tinh thể dưới bao ở phía sau. Sử dụng thuốc dài ngày có thể làm giảm đáp ứng của cơ thể và vì vậy tăng nguy cơ nhiễm trùng thứ phát ở mắt. Trong những trường hợp bệnh làm mỏng giác mạc, đã có trường hợp xảy ra thủng nhãn cầu khi sử dụng steroid tại chỗ.
Trong những bệnh nung mủ cấp tính ở mắt, steroid có thể che lấp dấu hiệu nhiễm trùng hay làm nặng thêm nhiễm trùng hiện có. Nếu sử dụng những thuốc này trong 10 ngày hay lâu hơn, nên theo dõi áp lực nội nhãn một cách thường quy mặc dù việc làm này khó thực hiện ở trẻ em và những bệnh nhân không hợp tác.
Khuyến cáo không sử dụng kính áp tròng trong quá trình điều trị nhiễm khuẩn ở mắt. Vì vậy, bệnh nhân được khuyên không đeo kính áp tròng trong khi sử dụng chế phẩm này. Ngoài ra cần lưu ý là chế phẩm có chứa chất bảo quản Benzalkonium chloride, có thể làm biến màu kính áp tròng mềm.
THẬN TRỌNG:
Việc kê toa lần đầu và nhắc lại điều trị quá 20ml (4 lọ) cần phải được thực hiện bởi thầy thuốc chuyên khoa sau khi kiểm tra bệnh nhân kỹ lưỡng bằng máy khuếch đại như đèn siêu hiển vi và khi thích hợp thử bằng nhuộm huỳnh quang. Khi gặp những phản ứng nghiêm trọng hoặc quá mẫn cảm, cần ngừng ngay thuốc.
Sau khi sử dụng steroid dài ngày cần phải xem chừng có khả năng nhiễm nấm giác mạc kéo dài.
Thông tin cho bệnh nhân: Không để chạm đầu ống thuốc nhỏ mắt vào bất cứ vật gì vì có thể làm nhiễm bẩn-thuốc. Không sử dụng thuốc khi mang kính sát tròng.
- Thai kỳ và cho con bú
Phụ nữ có thai: Không khuyến cáo sử dụng hỗn dịch nhỏ mắt MAXITROL cho phụ nữ mang thai.
Phụ nữ cho con bú: Nhiều loại thuốc có thể thải trừ qua sữa và gây hại cho trẻ bú mẹ. Việc quyết định ngừng cho con bú hay không sử dụng hỗn dịch nhỏ mắt cần được cân nhắc dựa trên lợi ích của thuốc đối với mẹ và nguy cơ đối với trẻ.
- Khả năng lái xe và vận hành máy móc
Cũng giống như khi nhỏ mắt bất cứ thuốc nào khác, nhìn mờ tạm thời và các rối loạn thị giác có thể làm ảnh hưởng tới khả năng lái xe và điều khiển máy móc của bệnh nhân. Nếu bị nhìn mờ sau khi nhỏ thuốc, bệnh nhân phải chờ đến khi nhìn rõ lại mới được lái xe hoặc điều khiển máy móc.
- Tương tác thuốc
Chưa có nghiên cứu đặc biệt nào được thực hiện với MAXITROL dùng nhỏ mắt. Sự tương tác giữa từng thành phần đã được ghi nhận khi dùng đường toàn thân. Tuy nhiên, sự hấp thụ của Dexamethasone, Neomycin Sulphate và Polymyxin B Sulphate theo đường dùng tại chỗ rất ít nên nguy cơ tương tác thuốc rất thấp.
Nếu đồng thời sử dụng hơn 1 loại thuốc nhỏ mắt, nên nhỏ thuốc cách nhau ít nhất 15 phút.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000048'), 'Dung dịch nhỏ mắt', '1 chai x 10ml', '- Rửa mắt.
- Rửa mũi.
- Phụ trị nghẹt mũi, sổ mũi, viêm mũi do dị ứng.
- Dùng được cho trẻ sơ sinh.', 'Không có.', 'Không có.', '- Cách dùng
Nhỏ hoặc rửa mắt, hốc mũi: mỗi lần 1 - 3 giọt, ngày 1 - 3 lần.
- Quá liều
Không có.', 'nhiệt độ không quá 30°C.', '- Thận trọng khi sử dụng
Không có.
- Thai kỳ và cho con bú
Không có báo cáo về vấn đề ảnh hưởng.
- Tương tác thuốc
Không có.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000059'), 'Thuốc mỡ tra mắt', '1 tuýp x 3.5g', 'Vi khuẩn được chỉ định: Các nhiễm khuẩn sau đây do các chủng vi khuẩn nhạy cảm với Ofloxacin: Staphylococcus sp., Streptococcus sp., Streptococcus pneumoniae, Enterococcus sp., Micrococcus sp., Moraxella sp., Corynebacterium sp., Klebsiella sp., Serratia sp., Proteus sp., Morganella morganii, Providencia sp., Haemophilus influenzae, Haemophilus aegyptius [trực khuẩn Koch - Weeks], Pseudomonas sp., Pseudomonas aeruginosa, Burkholderia cepacia, Stenotrophomonas (Xanthomonas) maltophilia, Acinetobacter sp., Propionibacterium acnes, và Chlamydia trachomatis.
Chỉ định:
Viêm bờ mi, viêm túi lệ, lẹo (chắp), viêm kết mạc, viêm sụn mi, viêm giác mạc (kể cả loét giác mạc), và dùng làm kháng sinh dự phòng sử dụng trước và sau phẫu thuật mắt.', 'Tiền sử quá mẫn cảm với bất kỳ thành phần nào của thuốc này hay với bất kỳ kháng sinh quinolon.', 'Tác dụng không mong muốn đã được báo cáo ở 14 trong số 2.360 bệnh nhân (0,59%) trong các thử nghiệm lâm sàng và theo dõi hậu mãi ở Nhật Bản. Tác dụng không mong muốn chính là ngứa mí mắt ở 3 bệnh nhân (0,13%), sưng mí mắt ở 3 bệnh nhân (0,13%), viêm bờ mi ở 2 bệnh nhân (0,08%), xung huyết kết mạc ở 2 bệnh nhân (0,08%), đau mắt ở 2 bệnh nhân (0,08%) và mí mắt đỏ ở 2 bệnh nhân (0,08%),... (Vào cuối giai đoạn tái kiểm tra).
Tác dụng không mong muốn có ý nghĩa lâm sàng:
Sốc, phản ứng dạng phản vệ (chưa rõ tỉ lệ mắc): Bệnh nhân nên được theo dõi cẩn thận vì sốc và phản ứng dạng phản vệ có thể xảy ra. Nếu có bất kỳ triệu chứng nào như ban đỏ, ban, khó thở, huyết áp hạ, phù mí mắt, v.v..., phải ngưng dùng thuốc và có các biện pháp xử trí thích hợp.
Tác dụng không mong muốn khác:
Nếu có bất kỳ tác dụng không mong muốn nào, nên áp dụng biện pháp thích hợp như ngưng dùng thuốc.
- Quá mẫn.
Ban, mề đay (không rõ tỷ lệ).
Ngứa (0,1 – 5%).
Viêm bờ mi (mí mắt đỏ và phù mí mắt), viêm da mí mắt (
- Mắt: Viêm kết mạc (xung huyết kết mạc và phù kết mạc,...), rối loạn giác mạc kể cả viêm giác mạc lan tỏa nông (không rõ tỷ lệ).', 'Thuốc tra mắt
Thông thường, tra một lượng thích hợp (khoảng 1cm thuốc mỡ) vào bên trong mí mắt dưới, 3 lần một ngày. Liều lượng có thể điều chỉnh theo triệu chứng của bệnh nhân thông qua tần suất sử dụng và để ít nhất 30 phút khoảng cách giữa các lần dùng.
Trong một nghiên cứu lâm sàng, thuốc mỡ tra mắt Ofloxacin 0,3% (tra 1 cm một lần, 16 lần, cách nhau 30 phút giữa các lần) đã được sử dụng lặp lại trên cả hai mắt ở những người tình nguyện nam trưởng thành khỏe mạnh (n=6). Hai đối tượng dùng thuốc mỡ cho thấy bị xung huyết và sưng nhưng các triệu chứng này đều nhẹ và không thấy gì bất thường.
Đề phòng
Nhằm tránh sự xuất hiện vi khuẩn kháng thuốc, cần khẳng định tính nhạy cảm của vi khuẩn và điều trị với thuốc này nên giới hạn ở thời gian tối thiểu cần để tiêu diệt sự nhiễm khuẩn.
Tránh dùng kéo dài. Thời gian chuẩn điều trị viêm kết mạc do Chlamydia trachomatis với thuốc này là 8 tuần, cần thận trọng khi tiếp tục dùng thuốc này trong thời gian dài hơn.
- Quá liều
Chưa có dữ liệu.', 'Bảo quản dưới 30°C trong bao bì kín.', '- Thận trọng khi sử dụng
Đọc kỹ hướng dẫn sử dụng trước khi dùng. Nếu cần thêm thông tin, xin hỏi ý kiến bác sĩ.
Thuốc này chỉ dùng theo đơn của bác sĩ.
Thông báo cho bác sĩ những tác dụng không mong muốn gặp phải khi sử dụng thuốc.
Đường dùng: Chỉ dùng để tra mắt.
Để xa tầm tay trẻ em.
Không sử dụng thuốc quá hạn sử dụng.
- Thai kỳ và cho con bú
Tính an toàn của thuốc ở phụ nữ có thai và cho con bú chưa được thiết lập. Do vậy không khuyến cáo dùng thuốc cho những đối tượng này.
- Khả năng lái xe và vận hành máy móc
Chưa được biết
- Tương tác thuốc
Chưa có dữ liệu.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000050'), 'Dung dịch nhỏ mắt', '1 chai x 5ml', 'Các chủng vi khuẩn nhạy cảm gồm Staphylococcus sp., Streptococcus sp., Streptococcus pneumoniae, Enterococcus sp., Micrococcus sp., Moraxella sp., Corynebacterium sp., Klebsiella sp., Serratia sp., Proteus sp., Morganella morganii, Providencia sp., Haemophilus influenzae, Haemophilus aegyptius (Koch-Weeks bacillus), Pseudomonas sp., Pseudomonas aeruginosa, Burkholderia cepacia, Stenotrophomonas (Xanthomonas) maltophilia, Acinetobacter sp., và Propionibacterium acnes.
Viêm bờ mi, viêm túi lệ, lẹo (chắp), viêm kết mạc, viêm sụn mi, viêm giác mạc (kể cả loét giác mạc) do nhiễm khuẩn nhạy cảm và dùng làm kháng sinh dự phòng sử dụng trước và sau phẫu thuật mắt.', 'Bệnh nhân có tiền sử quá mẫn các với các thành phần của thuốc hoặc với bất kỳ kháng sinh quinolon nào.', 'Tác dụng không mong muốn đối với thuốc này đã được báo cáo ở 44 trong số 13.329 bệnh nhân được đánh giá trước và sau khi thuốc được phê duyệt (0,33%). Các tác dụng không mong muốn chính là kích ứng mắt ở 11 bệnh nhân (0,08%), ngứa mí mắt ở 8 bệnh nhân (0,06%), viêm bờ mi ở 6 bệnh nhân (0,05%), xung huyết kết mạc ở 5 bệnh nhân (0,04%), đau mắt ở 5 bệnh nhân (0,04%), sưng mí mắt ở 5 bệnh nhân (0,04%),... (vào cuối giai đoạn tái kiểm tra).
Tác dụng không mong muốn có ý nghĩa lâm sàng
Sốc, phản ứng dạng phản vệ (không rõ tỉ lệ mắc): cần theo dõi bệnh nhân cẩn thận vì có thể xảy ra sốc và phản ứng dạng phản vệ. Nếu có bất cứ triệu chứng nào như ban đỏ, ban, khó thở, huyết áp hạ, phù mí mắt..., phải ngưng dùng thuốc và có các biện pháp xử trí thích hợp.
Tác dụng không mong muốn khác
Nếu có các tác dụng không mong muốn sau đây, nên có biện pháp xử trí thích hợp như ngưng dùng thuốc.
Thông báo cho bác sĩ những tác dụng không mong muốn gặp phải khi sử dụng thuốc.', 'Thuốc tra mắt: Thông thường, cho cả người lớn và trẻ em, mỗi lần nhỏ vào mắt 1 giọt, 3 lần/ngày. Liều lượng có thể được điều chỉnh theo triệu chứng của bệnh nhân. Thời gian điều trị tùy thuộc vào loại nhiễm khuẩn và đáp ứng của bệnh nhân.', 'Bảo quản dưới 30°C.', '- Thận trọng khi sử dụng
Đọc kỹ hướng dẫn sử dụng trước khi dùng. Nếu cần thêm thông tin, xin hỏi ý kiến bác sĩ.
Thuốc này chỉ dùng theo đơn của bác sĩ.
Đường dùng: Chỉ dùng để nhỏ mắt.
Để xa tầm tay trẻ em.
Khi dùng: Không chạm trực tiếp đầu lọ thuốc vào mắt để tránh nhiễm bẩn thuốc.
Khi dùng nhiều hơn 1 thuốc nhỏ mắt, phải nhỏ cách nhau ít nhất 5 phút.
Để tránh sự xuất hiện vi khuẩn kháng thuốc, cần khẳng định tính nhạy cảm của vi khuẩn và điều trị với thuốc này nên giới hạn ở thời gian tối thiểu cần để tiêu diệt sự nhiễm khuẩn.
Tránh dùng kéo dài.
- Thai kỳ và cho con bú
Chỉ dùng thuốc này cho phụ nữ có thai hoặc có khả năng có thai nếu lợi ích điều trị mong đợi hơn hẳn nguy cơ có thể xảy ra do dùng thuốc. (Độ an toàn của thuốc này trong thai kỳ chưa được thiết lập).
Ofloxacin được bài tiết vào sữa mẹ. Tuy nhiên, ở liều điều trị thuốc được dự đoán không ảnh hưởng đến trẻ bú mẹ. Chỉ dùng thuốc này cho phụ nữ cho con bú nếu lợi ích điều trị dự tính hơn hẳn nguy cơ có thể xảy ra với trẻ bú mẹ.
- Khả năng lái xe và vận hành máy móc
Chưa được biết.
- Tương tác thuốc
Chưa có nghiên cứu về tương tác thuốc đã được thực hiện cho đến nay. Tuy nhiên, do có thể xảy ra hấp thu toàn thân sau khi dùng ofloxacin tại mắt, không thể loại trừ khả năng có các tương tác thuốc như đã được báo cáo với một số kháng sinh nhóm quinolon dùng đường toàn thân (như tương tác với theophylin, cafein, các thuốc chống đông máu đường uống, cyclosporin).', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000052'), 'Dung dịch nhỏ mắt', '1 chai x 15ml', 'Mỏi mắt, ngứa mắt, khô rát mắt, cay mắt, xốn (cộm) mắt, đỏ mắt, mờ mắt, chảy nước mắt, mắt khó chịu.
Rửa mắt để loại các vật lạ như bụi bay vào mắt, làm sạch ghèn rỉ mắt.
Phòng ngừa các bệnh đau mắt.', 'Dị ứng với bất kỳ thành phần nào của thuốc.', 'Chưa có báo cáo.', 'Người lớn và trẻ em: nhỏ 2 - 4 giọt mỗi mắt/lần x 4 - 6 lần/ngày. Có thể nhỏ nhiều lần hơn nếu cần. Đậy kín nắp sau khi dùng. Sử dụng thuốc trong vòng 30 ngày sau khi đã mở nắp lần đầu.', NULL, '- Thai kỳ và cho con bú
Có thể sử dụng, an toàn.
- Tương tác thuốc
Chưa có báo cáo.
Thông tin thêm
- Đặc điểm
OSLA là dung dịch nhỏ mắt đẳng trương, trong suốt, không màu, ổn định và vô khuẩn, được bào chế để phòng ngừa đau mắt, giúp loại bỏ bụi bẩn và cân bằng độ ẩm cho mắt, làm dịu mắt, giúp cải thiện các triệu chứng khó chịu như khô mắt, mỏi mắt, ngứa mắt, kích ứng mắt và ghèn rỉ mắt.
- Bảo quản
Nơi khô ráo, dưới 30°C, tránh ánh sáng.
- Hạn dùng
24 tháng kể từ ngày sản xuất.
- Nhà sản xuất
Merap Group.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000039'), 'Dung dịch nhỏ mắt', '1 chai x 13ml', 'Thuốc nhỏ mắt Rohto Antibacterial chỉ định điều trị lẹo mắt, viêm kết mạc, viêm mi mắt và ngứa mắt.', 'Có tiền căn dị ứng với thuốc Sulfamide và mẫn cảm với các thành phần khác của thuốc', 'Có thể gây dị ứng ở những bệnh nhân có cơ địa dị ứng thuốc. Thông báo cho bác sĩ những tác dụng không mong muốn gặp phải khi sử dụng thuốc.', 'Nhỏ mắt 2-3 giọt/lần, 5-6 lần/ngày
- Quá liều
Khi dùng quá liều có thể gây xung huyết. Nếu xảy ra, ngưng sử dụng và xin chỉ dẫn của bác sĩ hoặc dược sĩ.', 'bảo quản. Nếu có kết tinh, lau miệng lọ bằng gạc sạch trước khi dùng.', '- Thận trọng khi sử dụng
1. Hỏi ý kiến bác sĩ hoặc dược sĩ trước khi dùng trong các trường hợp:
Đau mắt nặng.
Có tiền căn dị ứng với thuốc nhỏ mắt (thí dụ như mắt xung huyết, ngứa, sưng, nổi mẩn, đỏ, v.v...).
Đang theo một liệu trình.
2. Trước khi dùng thuốc, chú ý:
Dùng đúng liều qui định.
Trẻ em dùng thuốc dưới sự hướng dẫn của cha mẹ.
Không để mi mắt chạm vào miệng lọ, để tránh lây nhiễm hoặc tránh làm vẩn đục thuốc do các chất tiết hoặc mầm bệnh. Không dùng thuốc bị vẩn đục.
Một vài chất có thể kết tinh ở miệng lọ do điều kiện bảo quản. Nếu có kết tinh, lau miệng lọ bằng gạc sạch trước khi dùng.
Không dùng thuốc này như thuốc để mang kính tiếp xúc mềm. Không nhỏ vào mắt khi mang kính tiếp xúc mềm.
Chỉ dùng thuốc này để nhỏ mắt.
3. Trong và sau khi dùng, chú ý:
Nếu dùng thuốc gây xung huyết mắt, ngứa, sưng hay các triệu chứng khác, ngưng dùng và hỏi ý kiến bác sĩ hoặc dược sĩ.
Không dùng liên tục trong một thời gian dài.
Sau khi dùng vài ngày mà bệnh vẫn không đỡ, ngưng dùng thuốc và hỏi ý kiến bác sĩ càng sớm càng tốt.
- Thai kỳ và cho con bú
Chưa có ghi nhận về bất kì trường hợp ảnh hưởng nào tới phụ nữ có thai và cho con bú cũng như thai nhi.
- Tương tác thuốc
Trừ trường hợp có chỉ định của bác sĩ, tránh dùng cùng lúc với các loại thuốc nhỏ mắt khác.
7. Thông tin thêm
- Thông tin khác
Để xa tầm tay trẻ em.
Không dùng thuốc quá hạn sử dụng.
Đọc kỹ hướng dẫn sử dụng trước khi dùng.
Nếu cần thêm thông tin, xin hỏi ý kiến bác sĩ
- Bảo quản
Vặn chặt nắp lọ sau khi dùng. Bảo quản thuốc nơi khô mát (dưới 30 °C). Tránh ánh nắng trực tiếp, tránh để thuốc nơi có nhiệt độ quá cao hay quá thấp (trong tủ lạnh).
Để tránh nhầm lẫn và tránh giảm chất lượng, không đựng thuốc vào chai lọ khác.
Không dùng chung lọ thuốc với người khác để tránh lây nhiễm.
Sau khi mở nắp, nên sử dụng càng nhanh càng tốt vì thuốc có thể bị lây nhiễm trong khi sử dụng.
- Hạn dùng
36 tháng kể từ ngày sản xuất.
- Nhà sản xuất
Rohto-Mentholatum.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000049'), 'Dung dịch nhỏ mắt', '1 chai x 5ml', 'Dung dịch nhỏ mắt VIGAMOX được chỉ định trong điều trị viêm kết mạc do vi khuẩn nhạy cảm của các vi sinh vật sau đây:
Vi sinh vật Gram dương hiếu khí
Corynebacterium species+.
Microbacterium species.
Micrococcus luteus+ (bao gồm các chủng kháng erythromycin, gentamicin, tetracyclin và/hoặc trimethoprim).
Staphylococcus aureus (bao gồm các chủng kháng methicillin, erythromycin, gentamycin, ofloxacin, tetracyclin và/hoặc trimethoprim).
Staphylococcus epidermidis (bao gồm các chủng kháng methicillin, erythromycin, gentamycin, ofloxacin, tetracycline và/hoặc trimethoprim).
Staphylococcus haemolyticus (bao gồm các chủng kháng methicillin, erythromycin, gentamycin, ofloxacin, tetracycline và/hoặc trimethoprim).
Staphylococcus hominis (bao gồm các chủng kháng methicillin, erythromycin, gentamycin, ofloxacin, tetracycline và/hoặc trimethoprim)
Staphylococcus warneri+ (bao gồm các chủng kháng erythromycin).
Streptococcus pneumoniae (bao gồm các chủng kháng penicillin, erythromycin, tetracyclin và/hoặc trimethoprim).
Streptococcus viridans (bao gồm các chủng kháng penicillin, erythromycin, tetracyclin và/hoặc trimethoprim).
Vi sinh vật Gram âm hiếu khí
Acinetobacter species.
Haemophilus alconae (bao gồm các chủng kháng ampicillin).
Haemophilus influenza (bao gồm các chủng kháng ampicillin).
Haemophilus parainfluenzae.
Klebsialla pneumoniae.
Moraxella catarrhalis.
Pseudomonas aeruginosa.
Các vi sinh vật khác
Chlamydia trachomatis
Hiệu quả trên vi sinh vật này được nghiên cứu ở ít hơn 10 sự nhiễm khuẩn.
Ngoài ra, dung dịch nhỏ mắt VIGAMOX được sử dụng trong các trường hợp sau:
Điều trị viêm loét giác mạc
Dùng trước và sau mổ để đề phòng nhiễm trùng.', 'Dung dịch nhỏ mắt VIGAMOX chống chỉ định dùng cho các bệnh nhân có tiền sử quá mẫn với moxifloxacin, các quinolon khác hoặc với bất kỳ thành phần nào của thuốc.', 'Các tác dụng không mong muốn sau đây đã được báo cáo trong được phần loại theo các quy ước sau: rất phổ biến (≥ 1/10), phổ biến (≥ 1/100 đến
Phân loại hệ thống cơ quan
Tác dụng không mong muốn
Rối loạn máu và hệ bạch huyết
Hiếm gặp: giảm hemoglobin.
Rối loạn hệ thần kinh
Không phổ biến: đau đầu.
Hiếm: chứng dị cảm.
Rối loạn mắt
Phổ biến: đau mắt, kích ứng mắt.
Không phổ biến: viêm giác mạc chấm, khô mắt, xuất huyết kết mạc, sung huyết mất, phù nề mí mắt, đóng vảy bờ mi, khó chịu ở mắt.
Hiếm gặp: Khuyết biểu mô giác mạc, rối loạn giác mạc, viêm kết mạc, nhìn mờ, giảm thị lực, mỏi mắt, ban đỏ mí mặt.
Rối loạn hô hấp, lống ngực và trung thất
Hiếm gặp: khó chịu ở mũi, đau thanh quản - hầu họng, cảm giác có dị vật (ở họng).
Rối loạn dạ dày-ruột
Không phổ biến: loạn vị giác.
Hiếm gặp: nôn.
Rối loạn gan-mật
Hiếm gặp: tăng men chuyển hóa amino alanin, tăng men chuyển hóa gammaglutamyl.
Các tác dụng không mong muốn khác được xác định từ các giám sát sau khi lưu hành được liệt kê sau đây. Không thể ước tính tăng suất từ những dữ liệu có sẵn. Các tác dụng không mong muốn trong mỗi hệ cơ quan được sắp xếp theo thứ tự mức độ nghiêm trọng giảm dần.
Phân loại hệ thống cơ quan
Tác dụng không mong muốn
Rối loạn hệ miễn dịch
Quá mẫn
Rối loạn hệ thần kinh
Chóng mặt
Rối loạn mắt
Viêm loét giác mạc, viêm giác mạc, tăng tiết nước mắt, chứng sợ ánh sáng, tiết gỉ mắt
Rối loạn tim
Tim đập nhanh
Rối loạn hô hấp, lồng ngực và trung thất
Buồn nôn
Rối loạn da và mô dưới da
Ban đỏ, ngứa, phát ban, mày đay
Thông báo với bác sĩ các tác dụng không mong muốn gặp phải khi sử dụng thuốc.
6. Lưu ý
- Thận trọng khi sử dụng
Ở người bệnh dùng quinolon đường toàn thân, kể cả moxifloxacin, đã có báo cáo thỉnh thoảng xảy ra các phản ứng tăng mẫn cảm (quá mẫn) trầm trọng gây tử vong, một vài trường hợp xảy ra ngay liều khởi đầu điều trị. Ngưng dùng thuốc ngay lập tức và thông báo đến bác sỹ ngay khi có dấu hiệu đầu tiên của phản ứng nổi mẩn hoặc dị ứng. Một số phản ứng đi kèm như trụy tim mạch, bất tỉnh, phình mạch (bao gồm phù thanh quản, hầu hoặc mặt), tắc nghẽn đường hô hấp, khó thở, mề đay và ngứa.
Nếu phản ứng dị ứng với moxifloxacin xảy ra, cần ngưng dùng thuốc. Với các phản ứng quá mẫn cấp tính nghiêm trọng cần phải tiến hành điều trị cấp cứu ngay lập tức. Nên tiến hành kiểm soát đường thở và cung cấp oxy tùy theo chỉ định lâm sàng.
Giống như các thuốc chống nhiễm khuẩn khác, dùng thuốc kéo dài có thể dẫn đến tăng sinh quá mức các vi sinh vật không nhạy cảm, bao gồm cả nấm. Nếu xảy ra bội nhiễm cần ngưng dùng thuốc và áp dụng biện pháp điều trị thay thế.
Cần khuyên bệnh nhân không nên đeo kính áp tròng nếu có dấu hiệu và triệu chứng viêm kết mạc do vi khuẩn.
Viêm và đứt dây chằng có thể xảy ra khi sử dụng fluoroquinolon đường toàn thân, bao gồm cả moxifloxacin, đặc biệt ở những bệnh nhân cao tuổi và những người đang điều trị đồng thời với corticosteroid. Do đó, cần ngưng điều trị bằng dung dịch nhỏ mắt VIGAMOX ngay khi có dấu hiệu đầu tiên của viêm dây chằng.
- Thai kỳ và cho con bú
Khả năng sinh sản
Các nghiên cứu nhằm đánh giá về ảnh hưởng của dung dịch nhỏ mắt VIGAMOX đến khả năng sinh sản chưa được tiến hành.
Thai kỳ
Có rất ít hoặc không có dữ liệu về việc sử dụng dung dịch nhỏ mắt VIGAMOX trên phụ nữ mang thai. Tuy nhiên dự kiến thuốc không ảnh hưởng đối với phụ nữ mang thai vì sự hấp thu toàn thân moxifloxacin từ chế phẩm nhỏ mắt là không đáng kể.
Vì không có các nghiên cứu có đối chứng và đầy đủ ở phụ nữ mang thai, dung dịch nhỏ mắt VIGAMOX chỉ nên dùng trong thời kỳ mang thai khi lợi ích sử dụng cho người mẹ cao hơn nguy cơ có thể xảy ra cho bào thai.
Cho con bú
Chưa biết liệu moxifloxacin có được bài tiết vào sữa mẹ hay không. Các nghiên cứu trên động vật cho thấy sau khi uống moxifloxacin, thuốc được bài tiết với nồng độ thấp trong sữa mẹ. Tuy nhiên, dự kiến ở mức liều điều trị dung dịch nhỏ mắt VIGAMOX không gây ảnh hưởng đối với trẻ bú mẹ.
Nên thận trọng khi dùng dung dịch nhỏ mắt VIGAMOX trong thời kỳ cho con bú.
- Khả năng lái xe và vận hành máy móc
Cũng giống như bất cứ thuốc nhỏ mắt nào khác, nhìn mờ tạm thời và các rối loạn thị giác khác có thể ảnh hưởng tới khả năng lái xe hoặc vận hành máy móc. Nếu có hiện tượng nhìn mờ sau khi nhỏ mắt, bệnh nhân phải chờ đến khi nhìn rõ lại mới được lái xe hoặc vận hành máy móc.
- Tương tác thuốc
Các nghiên cứu về tương tác thuốc-thuốc chưa được tiến hành với dung dịch nhỏ mắt VIGAMOX. Các nghiên cứu in vitro cho thấy moxifloxacin không ức chế CYP3A4, CYP2D6, CYP2C9, CYP2C19 hay CYP1A2, vì vậy thuốc ít có khả năng ảnh hưởng đến dược động học của các thuốc chuyển hóa bởi các isoenzyme cytochrom P450 này.
Do sau khi nhỏ mắt thuốc này, nồng độ toàn thân của moxifloxacin thấp nên tương tác thuốc - thuốc hầu như không xảy ra.
6. Dược lý
- Dược động học (Tác động của thuốc đối với cơ thể)
Nồng độ moxifloxacin có trong huyết tương được xác định ở người nam và nữ trưởng thành khỏe mạnh nhỏ dung dịch nhỏ mắt VIGAMOX* ở hai mắt 3 lần/ngày. Nồng độ Cmax trung bình ở tình trạng bão hòa (2,7 ng/ml) và giá trị diện tích dưới đường cong AUC hàng ngày (41,9 ng-giờ/ml) được ước tính là thấp hơn 1.600 và 1.200 lần Cmax trung bình và diện tích dưới đường cong AUC được báo cáo sau khi điều trị bằng moxifloxacin 400 mg đường uống. Thời gian bán thải trong huyết tương của moxifloxacin khoảng 13 giờ.
Các nghiên cứu lâm sàng
Trong hai thử nghiệm lâm sàng ngẫu nhiên, mù đôi, đa trung tâm, có đối chứng cho bệnh nhân nhỏ dung dịch nhỏ mắt VIGAMOX 3 lần/ngày, trong 4 ngày, cho thấy có tác dụng chữa bệnh trên lâm sàng vào ngày thứ 5 - 6 ở 66% - 69% bệnh nhân điều trị viêm kết mạc do vi khuẩn. Tỉ lệ diệt trừ hết vi khuẩn của các mầm bệnh về mặt vi sinh học nằm trong khoảng từ 84% - 94%. Lưu ý rằng sự diệt trừ vi khuẩn về mặt sinh học không luôn tương quan với kết quả lâm sàng trong các thử nghiệm chống nhiễm khuẩn.
Sử dụng trên các đối tượng đặc biệt
Trẻ em:
Tính an toàn và hiệu quả của dung dịch nhỏ mắt VIGAMOX ở trẻ em dưới 1 tuổi chưa được xác định.
Không có bằng chứng về việc nhỏ mắt bằng dung dịch nhỏ mắt VIGAMOX có bất kỳ ảnh hưởng nào trên các khớp chịu lực mặc dù một vài thuốc nhóm quinolon dùng theo đường uống đã cho thấy gây bệnh lý khớp ở động vật chưa trưởng thành.
Người cao tuổi:
Không thấy có sự khác biệt tổng thể nào trong an toàn và hiệu quả đã được quan sát giữa bệnh nhân cao tuổi và bệnh nhân trẻ tuổi.
7. Thông tin thêm
- Đặc điểm
Dung dịch nhỏ mắt VIGAMOX (dung dịch nhỏ mắt moxifloxacin HCl) là dung dịch nhỏ mắt vô trùng. Dung dịch nhỏ mắt VIGAMOX là một thuốc nhỏ mắt chống nhiễm khuẩn nhóm 8-methoxy fluoroquinolon.
Tên hóa học:
1-Cyclopropyl-6-fluoro-1,4-dihydro-8-methoxy-7-[(4aS,7aS)- octahydro-6H-pyrrolol [3,4-b]pyridin-6-yl]-4-oxo-3- quinolinecarboxylic acid, monohydroclorid.
Moxifloxacin hydroclorid là bột tinh thể màu vàng nhạt đến màu vàng. Mỗi ml dung dịch nhỏ mắt VIGAMOX chứa 5.45mg moxifloxacin hydrodorid tương ứng với 5mg moxifloxacin.
- Đặc điểm
Mô tả: Dung dịch vô trùng, màu vàng hơi xanh, đẳng trương với áp suất thẩm thấu khoảng 290mOsm/kg.
- Bảo quản
Bảo quản ở nhiệt độ không quá 30ºC.
Vứt bỏ lọ thuốc sau khi mở lọ 1 tháng.
- Hạn dùng
24 tháng kể từ ngày sản xuất.
- Quy cách đóng gói
Hộp 1 lọ đếm giọt DROPTAINER* chứa 5 ml dung dịch.
- Nhà sản xuất
Novartis.', 'Chỉ dùng để nhỏ mắt. Không được tiêm. Không được tiêm dung dịch nhỏ mắt VIGAMOX dưới kết mạc, và cũng không được đưa thuốc trực tiếp vào tiền phòng của mắt.
Sử dụng ở người lớn, kể cả người cao tuổi
Nhỏ 1 giọt vào mắt bị viêm 3 lần/ngày, dùng thuốc trong 7 ngày. Tình trạng viêm thường được cải thiện sau 5 ngày, cần tiếp tục điều trị trong 2 - 3 ngày nữa. Nếu tình trạng viêm không được cải thiện sau 5 ngày điều trị, nên xem xét lại việc chẩn đoán và/hoặc điều trị.
Sử dụng ở trẻ em
Không cần hiệu chỉnh liều.
Sử dụng ở người suy gan và suy thận
Không cần hiệu chỉnh liều.
Cách dùng
Để tránh tạp nhiễm vào đầu lọ nhỏ thuốc, không được để đầu nhỏ thuốc tiếp xúc với mí mắt, vùng xung quanh mắt hoặc bất cứ vật nào.
- Quá liều
Do đặc điểm của chế phẩm này, dự đoán không có độc tính khi nhỏ mắt quá liều hoặc khi nuốt nhầm một lọ thuốc vào đường tiêu hóa.
Chưa có trường hợp quá liều dung dịch nhỏ mắt VIGAMOX nào được báo cáo. Khi nhỏ mắt quá liều VIGAMOX có thể rửa mắt ngay bằng nước ấm để loại bỏ thuốc.', 'Bảo quản ở nhiệt độ không quá 30ºC.', NULL, NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000094'), 'Viên nén sủi bọt', '1 tuýp x 10 viên', 'Berocca phòng ngừa và bổ sung trong các tình trạng tăng nhu cầu hoặc tăng nguy cơ thiếu hụt các vitamin nhóm B, vitamin C, calci và magnesi, như khi bị stress sinh lý, mệt mỏi, khó chịu, mất ngủ, v.v.', 'Mẫn cảm với bất kì thành phần nào của thuốc.
Suy thận nặng (GFR Sỏi thận hoặc tiền sử sỏi thận.
Tăng Calci huyết.
Tăng Calci niệu nặng.
Không nên dùng Vitamin C cho bệnh nhân tăng oxalate niệu, giảm chức năng thận hoặc thiếu hụt men glucose-6- phosphate dehydrogenase.', 'Các phản ứng phụ sau đây được ghi nhận trong quá trình sử dụng thuốc hậu mãi.
Các phản ứng này được báo cáo tự phát vì vậy không thể đánh giá được tần suất xuất hiện.
Các bệnh lý dạ dày ruột
Tiêu chảy, buồn nôn, nôn, đau bụng và đau dạ dày ruột, táo bón
Các bệnh lý hệ miễn dịch
Phản ứng dị ứng, phản ứng phản vệ, sốc phản vệ
Các phản ứng quá mẫn với các biểu hiện lâm sàng và xét nghiệm tương ứng gồm hội chứng hen, các phản ứng nhẹ đến trung bình ảnh hưởng lên da, và/ hoặc đường hô hấp, đường tiêu hóa, và/ hoặc hệ tim mạch. Các triệu chứng này có thể gồm phát ban, mề đay, phù, ngứa, rối loạn tim - hô hấp, và các phản ứng nghiêm trọng gồm sốc phản vệ đã được báo cáo.
Bệnh lý hệ thống thần kinh
Đau đầu, chóng mặt, mất ngủ, căng thẳng có thể xuất hiện.
Bệnh lý thận niệu
Màu sắc nước tiểu: Có thể thấy nước tiểu đổi màu vàng nhẹ. Ảnh hưởng này không có hại và do thành phần vitamin B2 có trong thuốc.
Thông báo cho bác sĩ những tác dụng không mong muốn mà bạn gặp phải khi sử dụng', '1 đến 2 viên nén sủi bọt mỗi ngày hoặc theo hướng dẫn của thầy thuốc.
Hòa tan viên sủi bọt trong một Iy nước để có một loại nước uống có hương vị thơm ngon.
- Quá liều
Khi sử dụng theo liều khuyến cáo, không có bằng chứng cho thấy thuốc gây quá liều. Cho phép sử dụng các vitamin và các khoáng chất từ tất cả các nguồn khác. Biểu hiện thông thường của quá liều có thể gồm lẫn lộn và rối loạn dạ dày ruột như táo bón, tiêu chảy, nôn và buồn nôn. Nếu các triệu chứng này xuất hiện, nên ngừng dùng thuốc và tham khảo ý kiến của chuyên gia y tế. Tình trạng quá liều cấp hoặc mãn tính của thuốc (ví dụ, sử dụng liều gấp 10 lần liều khuyến cáo) có thể gây ra độc tính đặc hiệu liên quan tới vitamin C, vitamin B6, hoặc kẽm. Các triệu chứng lâm sàng đặc hiệu, các phát hiện trên xét nghiệm, và các hậu quả do quá liều rất đa dạng, phụ thuộc vào mức độ nhạy cảm của từng người và tình trạng xung quanh. Nếu nghi ngờ có quá liều, nên ngưng sản phẩm và tư vấn chuyên gia y tế để điều trị các biểu hiện lâm sàng.', 'Bảo quản dưới 25°C và tránh ẩm.', '- Thận trọng khi sử dụng
Không nên vượt quá liều khuyến cáo.
Quá liều cấp và mãn tính làm tăng nguy cơ gây ra các tác dụng phụ. Cho phép sử dụng vitamin và khoáng chất từ tất cả các nguồn khác gồm các thực phẩm tăng cường, thực phẩm ăn kiêng và các thuốc sử dụng đồng thời (Xem trong phần Quá liều)
Với những bệnh nhân đang sử dụng các vitamin riêng lẻ hoặc các thuốc đa vitamin khác, hoặc bất kỳ thuốc nào khác, đang trong chế độ ăn hạn chế, hay đang được điều trị y tế nên tư vấn các chuyên gia y tế trước khi sử dụng thuốc này (xem phần Thành phần, Chống chỉ định, Tương tác thuốc và các dạng tương tác khác và Quá liều). Nên uống thuốc cách các thuốc khác khoảng 4 giờ trừ trường hợp đặc biệt xem trong phần tương tác với các thuốc khác và các dạng khác của tương tác). Thuốc có thể ảnh hưởng đến các xét nghiệm làm sai lệch kết quả. Thông báo cho các bác sĩ hoặc các nhân viên y tế khi sử dụng thuốc này và các xét nghiệm dự kiến thực hiện (xem phần Tương tác thuốc và các dạng tương tác khác).
Vitamin C có thể ảnh hưởng đến các dụng cụ và bộ xét nghiệm đo đường huyết dẫn đến các kết quả sai lệch. Tham khảo thông tin trong tờ hướng dẫn sử dụng của dụng cụ hoặc bỏ xét nghiệm đo đường huyết (xem phần Tương tác thuốc và các dạng tương tác khác).
Vitamin C làm tăng hấp thu Sắt. Các bệnh nhân có tình trạng thừa sắt trong cơ thể nên thận trọng khi sử dụng thuốc và tránh sử dụng vitamin C> 500 mg/ngày (xem phần Tương tác thuốc và các dạng tương tác khác và Quá liều).
Quá liều vitamin C ở các bệnh nhân thiếu hụt men glucose-6-phosphate dehydrogenase có liên quan tới thiếu máu tán huyết (xem phần Quá liều) Công thức của sản phẩm không dùng để điều trị thiếu hụt vitamin B12 do viêm teo dạ dày, bệnh lý ruột non hoặc tụy, và rối loạn hấp thu dạ dày - ruột của vitamin B12 hoặc thiếu hụt yếu tố nội tại (xem phần Chỉ định).
Bệnh nhân phenylketon niệu nên tránh các sản phần có chứa aspartame vì đó là một nguồn phenylalanine.
Dạng viên nén sủi bọt có chứa muối. Nên cân nhắc vấn đề này ở các bệnh nhân có chế độ ăn hạn chế muối.
- Thai kỳ và cho con bú
Khả năng sinh sản
Không có bằng chứng cho thấy nồng độ nội sinh thông thường của các vitamin và khoáng chất trong sản phẩm gây ra bất kỳ tác dụng ngoại ý nào lên khả năng sinh sản ở người.
Thai kỳ và cho con bú
Nhìn chung thuốc an toàn trong thai kỳ hoặc cho con bú khi sử dụng theo hướng dẫn. Tuy nhiên, vì không có đầy đủ các nghiên cứu có kiểm soát trên người để đánh giá nguy cơ của thuốc trong thai kỳ hoặc cho con bú, thuốc chỉ nên được sử dụng ở phụ nữ có thai hoặc cho con bú khi được chỉ định lâm sàng và khuyến cáo bởi chuyên gia y tế. Không nên vượt quá liều dùng khuyến cáo vì tình trạng quá liều mãn tính có thể ảnh hưởng đến thai nhi và trẻ sơ sinh. Cho phép sử dụng vitamin và khoáng chất từ các nguồn khác. Các vitamin và khoáng chất trong thuốc được bài tiết qua sữa mẹ. Nên cân nhắc điều này khi sử dụng thuốc.
- Tương tác thuốc
Hoạt chất
Thuốc
Mô tả
Vitamin C
Desferrioxamine
Vitamin C có thể làm tăng độc tính sắt ở mô, đặc biệt ở tim, gây tình trạng mất bù ở tim.
Cyclosporine
Bổ sung chất chống oxy hóa gồm vitamin C có thể giảm nồng độ cyclosporine trong máu.
Disulfiram
Dùng liều cao hoặc kéo dài Vitamin C có thể ảnh hưởng đến hiệu quả của disulfiram
Warfarin
Dùng liều cao vitamin C có thể ảnh hưởng đến hiệu quả của warfarin
Vitamin B6
Levodopa
Pyridoxine làm tăng chuyển hóa của levodopa, giảm hiệu quả kháng hội chứng parkinson của thuốc. Tuy nhiên, tương tác này không xuất hiện khi có carbidopa phối hợp với Ievodopa (ví dụ: Sinemet*1).
Vitamin B12
Choramphenicol
Choramphenicol có thể làm chậm hoặc gián đoạn phản ứng của hồng cầu lưới với vitamin B12. Do đó, cần theo dõi chặt chẽ công thức máu nếu việc kết hợp các thuốc này là không tránh khỏi.
Folic Acid
Methotrexat
Bổ sung acid folic có thể giảm hiệu quả của methotrexate trong điều trị leukemia lympho bào cấp, và về mặt lý thuyết, cũng ảnh hưởng đến hiệu quả điều trị các ung thư khác.
Canxi
Thuốc lợi tiểu Thiazide
Thuốc lợi tiểu thiazide làm giảm bài tiết canxi. Do tăng nguy cơ làm tăng canxi máu, nên theo dõi đều đặn nồng canxi máu trong khi sử dụng cùng lúc với các thuốc lợi tiểu thiazide
Magnesi,
Kẽm
Thuốc lợi tiểu giữ Kali
Các thuốc lợi tiểu giữ kali cũng có đặc tính giữ magnesi và/hoặc giữ kẽm. Khi sử dụng đồng thời với các thuốc lợi tiểu giữ kali có thể gây tăng nồng độ magnesi và/hoặc kẽm
Canxi, Magnesi, Kẽm
Kháng sinh
Quinolone
Penicillamine
Các Biphosphonate
Levothyroxine
Methyldopa
Mycophenolate mofetil
Eltrombopag
Các cation nhiều hóa trị như canxi, magnesi, và/hoặc kẽm, hình thành các phức chất với các chất nhất định, dẫn đến giảm hấp thu của cả hai chất, uống cách thuốc trước 2 giờ hoặc sau 4 giờ với thuốc khác, trừ trường hợp cụ thể khác, sẽ giảm thiểu nguy cơ cho tương tác này.
Tương tác với thức ăn
Vitamin C
Sắt Vitamin C có thể làm tăng hấp thu sắt, đặc biệt ở các bệnh nhân thiếu sắt. Tăng tích lũy sát ở mức độ nhỏ có thể là quan trọng với các bệnh nhân có bệnh lý ở sắt di truyền (hemochromatosis) hoặc các bệnh nhân dị hợp tử với bệnh lý này, do có thể làm trầm trọng hơn tình trạng ứ sắt.
Canxi, Magnesi và Kẽm
Do acid oxalic (có trong rau bi-na và cây đại hoàng) và acid phytic (có trong hầu hết các ngũ cốc có thể hạn chế hấp thu canxi, magnesi và kẽm nên sản phẩm được khuyến cáo không sử dụng trong vòng 2 giờ với các thức ăn có chứa hàm lượng acid oxalic và acid phytic
Tương tác với các xét nghiệm
Vitamin C
Vì vitamin C là một chất khử mạnh (cho electron), nó có thể gây ra các ảnh hưởng hóa học trong các xét nghiệm mà có sự tham gia của các phản ứng oxi hóa khứ, như xét nghiệm đường, creatinine, carbamazepine, acid uric và phosphate vô cơ trong nước tiểu, trong huyết thanh và tìm máu lẫn trong phân. Sử dụng các xét nghiệm chuyên biệt có đặc điểm không phụ thuộc vào việc giảm hoặc ngừng chế độ ăn nhiều vitamin C sẽ tránh các ảnh hưởng không mong muốn. Tham khảo thông tin của nhà sản xuất để xác định liệu vitamin C có ảnh hưởng tới kết quả xét nghiệm hay không.
Tuy không ảnh hưởng đến chỉ số đường huyết, vitamin C có thể ảnh hưởng đến các xét nghiệm đo đường huyết và đường hiệu dẫn đến sai lệch kết quả. Tham khảo thông tin bên trong và hộp về dụng cụ và bộ xét nghiệm nhằm xác định ảnh hưởng của vitamin C (acid ascorbic) và hướng dẫn để có các kết quả xét nghiệm chính xác
Vitamin B1 và vitamin B6
Urobilinogen: Thiamine và hoặc pyridoxine có thể tạo ra kết quả dương tính giả trong xét nghiệm với thuốc thử Ehrlich.
7. Thông tin thêm
- Bảo quản
Bảo quản dưới 25°C và tránh ẩm.
Đóng chặt nắp tuýp thuốc.
- Hạn dùng
36 tháng kể từ ngày sản xuất.
- Nhà sản xuất
P.T. Bayer Indonesia.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000085'), 'Viên nén sủi bọt', '1 tuýp x 10 viên', 'CalSource Ca-C 1000 Orange có thể được dùng trong các trường hợp thiếu calci hoặc vitamin C do kém dinh dưỡng hoặc tăng nhu cầu calci và vitamin C trong:
Thời kỳ có thai và nuôi con bú.
Trong các thời kỳ phát triển nhanh (thiếu niên, thanh niên).
Tuổi già.
Trong các bệnh nhiễm trùng và thời kỳ dưỡng bệnh.
CalSource Ca-C 1000 Orange cũng có thể được dùng như một chất hỗ trợ trong điều trị cảm lạnh và cúm.
Viên nén sủi bọt CalSource Ca-C 1000 Orange cung cấp vitamin C và calci nguyên tố với hàm lượng đủ để đáp ứng nhu cầu hàng ngày ở những giai đoạn có nhu cầu tăng cao.', '• Quá mẫn cảm với các hoạt chất hoặc bất cứ thành phần tá dược nào của thuốc.
• Mắc các bệnh và/hoặc các tình trạng dẫn đến tăng calci huyết và/hoặc tăng calci niệu (calci nước tiểu cao).
• Sỏi calci ở thận hoặc sỏi thận.', 'Giống như các thuốc khác, thuốc này có thể gây ra các phản ứng quá mẫn cảm như phát ban, ngứa, nổi mề đay và các phản ứng quá mẫn toàn thân như phản ứng phản vệ, phù mặt, phù thần kinh mạch. Đã có báo cáo về một số ít trường hợp bị tăng calci huyết và calci niệu và các trường hợp hiếm gặp bị rối loạn tiêu hóa như buồn nôn, tiêu chảy, đau bụng, táo bón, đầy hơi, nôn mửa. Ngoài ra còn có báo cáo về sỏi niệu.
Các phản ứng bất lợi được liệt kê dưới đây, được phân loại bởi hệ thống cơ quan và tần suất. Tần suất được định nghĩa là: Rất phổ biến (≥1/10), phổ biến (≥1/100, ≥ 1/1.000, ≥1/10.000, Rối loạn hệ thống miễn dịch
Hiếm gặp: Quá mẫn
Rất hiếm: Đã có báo cáo về các trường hợp cá biệt bị dị ứng toàn thân (phản ứng phản vệ, phù mặt, phù thần kinh mạch).
Rối loạn chuyển hóa và dinh dưỡng
Không phổ biến: Tăng calci huyết và calci niệu.
Rối loạn dạ dày - ruột
Hiếm gặp: đầy hơi, táo bón, tiêu chảy, buồn nôn, nôn, đau bụng.
Rối loạn thận và đường tiết niệu
Không biết: Trên một số bệnh nhân điều trị dài hạn với liều cao calci + vitamin C, có thể có sự hình thành sỏi đường tiết niệu.
Rối loạn da và các mô dưới da
Hiếm gặp: phát ban, ngứa, mề đay.', 'Liều lượng:
Người lớn và trẻ em từ 7 tuổi trở lên: một viên nén sủi bọt/ngày.
Trẻ em 3 - 7 tuổi: 1/2 viên nén sủi bọt/ngày.
Trẻ nhỏ: dùng theo sự kê đơn của bác sĩ.
Cách dùng:
Hòa tan viên sủi bọt CalSource Ca-C 1000 Orange trong cốc nước (khoảng 200 ml) và uống ngay, có thể được dùng cùng hoặc không cùng với thức ăn.
- Quá liều
Quá liều dẫn tới tăng calci niệu và tăng calci huyết. Các triệu chứng của tăng calci huyết có thể bao gồm: nôn, buồn nôn, khát, khát nặng, tiểu nhiều, mất nước và táo bón. Quá liều mạn tính dẫn tới tăng calci huyết có thể gây vôi hóa mạch máu và các cơ quan.
Ngưỡng nhiễm độc calci là liều bổ sung vượt quá 2000 mg/ngày, dùng trong nhiều tháng.
Liều cao vitamin C có thể gây tiêu chảy thẩm thấu, kèm theo các triệu chứng về tiêu hóa liên quan. Quá liều vitamin C có thể thúc đẩy tình trạng dư thừa sắt ở bệnh nhân bị bệnh lưu trữ sắt (bệnh nguyên hồng cầu chứa sắt trong tủy xương, bệnh nhiễm sắc tố sắt mô) và có thể gây tiêu huyết ở bệnh nhân hồng cầu bẩm sinh thiếu G-6-PD.
Điều trị quá liều
Trong trường hợp nhiễm độc, cần lập tức ngưng điều trị và nên điều chỉnh lượng dịch thiếu hụt. Khi quá liều cần phải điều trị thì nên bù nước, bao gồm truyền tĩnh mạch dung dịch muối đẳng trương nếu cần. Thuốc lợi tiểu quai (như furosemid) có thể được sử dụng để tăng đào thải calci và ngăn quá tải thể tích tuần hoàn, nhưng nên tránh dùng các thuốc lợi tiểu thiazid. Ở những bệnh nhân suy thận, bù nước không hiệu quả và nên thẩm tách máu. Trong trường hợp tăng calci huyết kéo dài, các yếu tố góp phần nên được loại trừ, như thừa vitamin A hoặc D, cường tuyến cận giáp nguyên phát, u ác tính, suy thận hoặc bất động.', 'Bảo quản dưới 30°C. Giữ tuýp thuốc được đóng kín.', '- Thận trọng khi sử dụng
• Đối với bệnh nhân bị tăng calci niệu nhẹ (vượt quá 300 mg/24 giờ hoặc 7,5 mmol/24 giờ) hoặc có tiền sử sỏi niệu, cần theo dõi sự đào thải calci trong nước tiểu. Nên giảm liều hoặc ngừng điều trị nếu cần. Việc tăng cung cấp
lượng dịch cho cơ thể được khuyến cáo ở các bệnh nhân dễ hình thành sỏi trong đường niệu.
• Với những bệnh nhân suy thận, cần phải dùng các muối calci dưới sự theo dõi y khoa cùng với theo dõi nồng độ calci và phosphat huyết thanh.
• Khi dùng liều cao và đặc biệt là dùng đồng thời với vitamin D, có nguy cơ bị tăng calci huyết và sau đó là suy thận, ở những bệnh nhân này nên theo dõi nồng độ calci huyết và chức năng thận.
• Liều dùng vitamin C ở bệnh nhân suy thận nặng không nên vượt quá 50 - 100 mg/ngày do nguy cơ tăng calci huyết và tạo sỏi oxalat ở thận.
• Nên thận trọng khi dùng Calci + vitamin C cho bệnh nhân có bài tiết oxalat qua nước tiểu. Đã có những báo cáo y văn về khả năng làm tăng hấp thu nhôm với các muối citrat. Cần lưu ý khi sử dụng viên sủi bọt CalSource Ca-C 1000 Orange (có chứa axit citric) cho bệnh nhân suy thận nặng, đặc biệt ở những bệnh nhân đang dùng các chế phẩm chứa nhôm.
• Nên giữ thuốc CalSource Ca-C 1000 Orange xa tầm tay của trẻ em.
Cảnh báo liên quan đến tá dược:
Viên nén sủi bọt CalSource Ca-C 1000 Orange chứa:
• Sucrose: Bệnh nhân di truyền hiếm gặp không dung nạp fructose, kém hấp thu glucose - galactose hoặc thiếu men sucrase -isomaltase không dùng thuốc này.
• Natri: 0,28 g natri/viên. cần lưu ý khi sử dụng cho bệnh nhân đang phải kiểm soát natri trong chế độ ăn.
- Thai kỳ và cho con bú
Thời kỳ mang thai
CalSource Ca-C 1000 Orange có thể được dùng trong thời kỳ mang thai, trong trường hợp thiếu calci. Tuy nhiên, khi bắt đầu bổ sung trong giai đoạn 3 tháng cuối thai kỳ, không dùng vượt quá 1500mg calci/ngày.
Ở phụ nữ mang thai, cần tránh quá liều calci vì tăng calci huyết kéo dài có liên quan đến các tác dụng phụ trên sự phát triển của bào thai.
Liều cao vitamin C không được khuyến cáo ở phụ nữ mang thai do có thể có những triệu chứng thiếu hụt vitamin C ở trẻ sơ sinh và trẻ nhỏ.
Thời kỳ cho con bú
CalSource Ca-C 1000 Orange có thể được sử dụng cho phụ nữ cho con bú. Vitamin C và calci bài tiết vào sữa mẹ.
- Tương tác thuốc
Các thuốc lợi tiểu thiazid làm giảm thải trừ calci qua nước tiểu. Nồng độ calci huyết thanh cần được kiểm soát thường xuyên khi dùng cùng các thuốc lợi tiểu thiazid do tăng nguy cơ tăng calci huyết.
Các thuốc corticosteroid tác dụng toàn thân làm giảm hấp thu calci. Khi dùng đồng thời, có thể cần tăng liều CalSource Ca-C 1000 Orange.
Các chế phẩm tetracyclin dùng cùng lúc với các chế phẩm chứa calci có thể giảm hấp thu. Do đó, các chế phẩm tetracyclin nên được dùng trước ít nhất 2 giờ hoặc sau 4 - 6 giờ sau khi dùng CalSource Ca-C 1000 Orange.
Độc tính của glycosid tim có thể tăng cùng với tăng calci huyết do quá trình điều trị với calci. Bệnh nhân cần được theo dõi điện tâm đồ và lượng calci huyết thanh.
Bisphosphonat đường uống hoặc natri fluorid dùng cùng với các chế phẩm chứa calci có thể làm giảm hấp thu ở dạ dày - ruột của bisphosphonat hoặc natri fluorid. Do đó, bisphosphonat đường uống nên được dùng trước ít nhất 3 giờ khi dùng CalSource Ca-C 1000 Orange. Dùng cùng với vitamin D và các dẫn xuất làm tăng hấp thu calci. Acid oxalic (có trong rau chân vịt, cây đại hoàng) và acid phytic (trong ngũ cốc) có thể ức chế hấp thu calci do hình thành hợp chất không tan với ion calci. Bệnh nhân không nên dùng các chế phẩm chứa calci trong vòng 2 giờ sau khi ăn thức ăn có chứa nhiều acid oxalic và acid phytic.
Dùng đồng thời vitamin C với các thuốc kháng acid có chứa nhôm có thể làm tăng hấp thu nhôm. Vitamin C không nên dùng đồng thời với thuốc kháng acid có chứa nhôm.
Vitamin C tăng tạo phức chelat của sắt. Do CalSource Ca-C 1000 Orange chứa liều cao vitamin C (> 200mg), không nên dùng cùng thuốc deferoxamin.
Ở liều hàng ngày vượt quá 1g, vitamin C có thể làm sai lệch kết quả xét nghiệm máu và nước tiểu (ví dụ định lượng glucose) do có phản ứng oxy hóa - khử.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000088'), 'Viên nén sủi bọt', '1 tuýp x 20 viên', 'Phòng ngừa và điều trị thiếu hụt calci do nhu cầu tăng cao (phụ nữ mang thai, cho con bú, trẻ trong giai đoạn tăng trưởng).
Phòng ngừa và điều trị hỗ trợ tình trạng mất calci ở xương của người lớn tuổi, hoặc sau thời kỳ mãn kinh, hoặc sau khi dùng liệu pháp corticoid, hoặc trong giai đoạn phục hồi vận động sau một thời gian bị bất động kéo dài.
Bổ sung calci như là một biện pháp bổ trợ cho điều trị đặc hiệu trong phòng và điều trị loãng xương ở bệnh nhân có nguy cơ thiếu calci.
Bệnh còi xương và loãng xương, bên cạnh liệu pháp Vitamin D3.', 'Quá mẫn cảm với các hoạt chất hoặc bất kỳ thành phần tá dược nào.
Các bệnh và/hoặc tình trạng dẫn đến tăng calci huyết và/hoặc tăng calci niệu.
Chứng nhiễm calci thận, bệnh sỏi thận.', 'Phản ứng bất lợi được liệt kê dưới đây, phân loại bởi hệ thống cơ quan và tần suất. Tần suất được định nghĩa như sau: rất phổ biến (≥ 1/10), phổ biến (≥ 1/100 đến Rối loạn hệ miễn dịch
Hiếm gặp: phản ứng quá mẫn, chẳng hạn như phát ban, ngứa, nổi mề đay.
Rất hiếm: Đã có báo cáo về các trường hợp cá biệt của các phản ứng dị ứng toàn thân (phản ứng phản vệ, phù mặt, phù mạch thần kinh).
Rối loạn chuyển hóa và dinh dưỡng
Không phổ biến: tăng calci huyết, tăng calci niệu.
Rối loạn hệ tiêu hóa
Hiếm gặp: đầy hơi, táo bón, tiêu chảy, buồn nôn, nôn, đau bụng.', 'Dùng đường uống.
Hòa tan viên nén sủi bọt CalSource trong một ly nước (khoảng 200 ml) và uống ngay lập tức.
Không được nuốt hoặc nhai viên thuốc.
CalSource có thể được dùng cùng hoặc không cùng thức ăn.
Liều dùng
Người lớn: 1- 3 viên CalSource (500 - 1500 mg calci nguyên tố) mỗi ngày.
Trẻ em: 1- 2 viên CalSource (500 - 1000 mg calci nguyên tố) mỗi ngày.
- Quá liều
Quá liều dẫn đến tăng calci niệu và tăng calci huyết. Các triệu chứng của tăng calci huyết có thể bao gồm: buồn nôn, nôn, khát nước, chứng khát nhiều, đi tiểu quá nhiều, mất nước và táo bón. Quá liều dài hạn với kết quả làm tăng calci huyết có thể dẫn đến vôi hóa mạch máu và cơ quan.
Ngưỡng nhiễm độc calci là khi bổ sung vượt quá 2000 mg mỗi ngày, liên tục trong vài tháng.
Cách xử trí quá liều
Trong trường hợp ngộ độc, ngưng điều trị ngay lập tức và bổ sung lượng dịch thiếu hụt.
Nếu quá liều cần phải điều trị, nên dùng biện pháp hydrat hóa, bao gồm truyền tĩnh mạch dung dịch muối khi cần thiết. Có thể sử dụng thuốc lợi tiểu quai (ví dụ như furosemid) để tăng bài tiết calci và để phòng tránh quá dư thể tích, nhưng nên tránh thuốc lợi tiểu thiazid. Ở bệnh nhân suy thận, hydrat hóa không hiệu quả và họ phải trải qua quá trình lọc máu. Trong trường hợp tăng calci máu dai dẳng, nên loại trừ các yếu tố liên quan, ví dụ như thừa vitamin A hoặc D, cường cận giáp tiên phát, khối u ác tính, suy thận, hoặc bất động.', 'bảo quản trên 30°C. Tránh ẩm. Giữ tuýp thuốc được đóng kín.', '- Thận trọng khi sử dụng
Đối với bệnh nhân tăng calci niệu nhẹ (vượt quá 300 mg/24 giờ hoặc 7,5 mmol/ 24 giờ) hoặc có tiền sử sỏi tiết niệu, cần giám sát sự bài tiết calci qua nước tiểu. Nên giảm liều hoặc ngưng điều trị nếu cần thiết. Khuyến cáo bổ sung dịch cho bệnh nhân dễ hình thành sỏi trong đường tiết niệu.
Ở bệnh nhân suy thận, các muối calci nên được sử dụng dưới sự giám sát y khoa, đồng thời theo dõi nồng độ calci và phosphat trong huyết thanh.
Trong quá trình điều trị liều cao và đặc biệt khi điều trị cùng vitamin D, có nguy cơ tăng calci máu và sau đó dẫn đến suy thận. Ở những bệnh nhân này nên theo dõi nồng độ calci huyết và chức năng thận.
Đã có báo cáo y văn về việc có thể tăng hấp thu nhôm của muối citrat. Viên sủi CalSource (chứa acid citric) nên được dùng thận trọng ở những bệnh nhân suy thận nặng, đặc biệt là những người đang dùng các chế phẩm có chứa nhôm
Giữ viên nén sủi bọt CalSource xa tầm với của trẻ em.
Cảnh báo liên quan đến tá dược
Natri: Mỗi viên CalSource chứa 275 mg natri. Nên cân nhắc điều này khi sử dụng cho các bệnh nhân có chế độ ăn uống phải kiểm soát natri.
Thông tin cho bệnh nhân đái tháo đường:
Mỗi viên CalSource chứa 0,002 đơn vị carbohydrat/viên do đó dùng được cho bệnh nhân đái tháo đường.
- Thai kỳ và cho con bú
Thời kỳ mang thai
CalSource có thể dùng được trong thời kỳ mang thai trong trường hợp thiếu calci. Tuy nhiên, liều bổ sung hằng ngày trong 3 tháng cuối của thai kỳ không nên vượt quá 1500 mg calci. Ở phụ nữ mang thai, nên tránh quá liều calci vì tăng calci dai dẳng có liên quan đến những tác dụng phụ bất lợi đến sự phát triển của thai nhi.
Thời kỳ cho con bú
CalSource có thể dùng được trong thời kỳ cho con bú. Calci bài tiết vào sữa mẹ.
- Tương tác thuốc
Thuốc lợi tiểu thiazid làm giảm bài tiết calci qua nước tiểu. Do tăng nguy cơ của chứng tăng calci huyết, nồng độ calci huyết nên được theo dõi đều đặn trong quá trình sử dụng đồng thời với thuốc lợi tiểu thiazid.
Corticosteroid toàn thân làm giảm hấp thu calci. Trong khi sử dụng đồng thời, có thể cần tăng liều CalSource.
Các chế phẩm chứa tetracyclin dùng đồng thời với các chế phẩm calci có thể không được hấp thu tốt. Vì lý do này, nên dùng những chế phẩm tetracyclin trước ít nhất 2 giờ hoặc 4 - 6 giờ sau khi uống CalSource.
Độc tính của glycosid trợ tim có thể tăng lên cùng với tăng calci huyết do điều trị với calci. Bệnh nhân cần được theo dõi điện tâm đồ (ECG) và nồng độ calci huyết thanh.
Bisphosphonate dạng uống hoặc natri fluorid dùng đồng thời với các chế phẩm calci có thể làm giảm hấp thu ở đường tiêu hóa của bisphosphonat đường uống hoặc natri fluorid. Do vậy, nên dùng bisphosphonate đường uống ít nhất 3 giờ trước khi uống CalSource.
Axit oxalic (ví dụ: có trong cải bó xôi và đại hoàng) và axit phytic (ví dụ: có trong các loại ngũ cốc) có thể ức chế sự hấp thụ calci thông qua hình thành các hợp chất không tan với ion calci. Bệnh nhân không nên dùng các sản phẩm calci trong vòng hai giờ sau khi ăn thức ăn giàu axit oxalic và axit phytic.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193661000083'), 'Siro', '1 chai x 60ml', 'C.C.Life 100mg/5ml chỉ định trong phòng và điều trị thiếu Vitamin C ở trẻ sơ sinh và trẻ em.', 'Không dùng cho người quá mẫn cảm với Vitamin C.
Không dùng Vitamin C liều cao cho người bị thiếu hụt glucose-6-phosphat dehydrogenase (G6PD) (nguy cơ thiếu máu huyết tán), người có tiền sử sỏi thận, tăng oxalat niệu và loạn chuyển hoá oxalat (tăng nguy cơ sỏi thận), bị bệnh thalassemia (tăng nguy cơ hấp thu sắt).', '- Tăng Oxalat niệu, buồn nôn, nôn, ợ nóng, co cứng cơ bụng, mệt mỏi, đỏ bừng, nhức đầu, mất ngủ và tình trạng buồn ngủ đã xảy ra.
- Sau khi uống một liều 1g hàng ngày hoặc lớn hơn, có thể xảy ra ỉa chảy.
- Thường gặp: ADR> 1/100
Thận: tăng Oxalat niệu.
- Ít gặp: 1/1000
Máu: thiếu máu tan máu.
Tim mạch: bừng đỏ, suy tim.
Thần kinh trung ương: xỉu, chóng mặt, nhức đầu, mệt mỏi.
Dạ dày - ruột: buồn nôn, nôn, ợ nóng, ỉa chảy.
Thần kinh - cơ và xương: đau cạnh sườn.
Thông báo cho bác sĩ những tác dụng không mong muốn gặp phải khi dùng thuốc.', 'Dùng đường uống.
Liều bổ sung: 1 lần mỗi ngày:
Trẻ sơ sinh đến 2 tuổi: 1.25ml (1/4 thìa cà phê).
Từ 2 - 6 tuổi: 2.5ml (1/2 thìa cà phê).
Từ 7 - 12 tuổi: 5ml (1 thìa cà phê).
Hoặc theo sự hướng dẫn của bác sĩ.
- Quá liều
Những triệu chứng quá liều gồm sỏi thận, buồn nôn, viêm dạ dày và ỉa chảy.
Xử trí: gây lợi tiểu bằng truyền dịch có thể có tác dụng sau khi uống liều lớn.', 'nhiệt độ không quá 30°C.', '- Thận trọng khi sử dụng
Vitamin C nên được dùng thận trọng với những bệnh nhân bị oxalat niệu. Sự nhờn thuốc có thể xảy ra ở những bệnh nhân sử dụng liều cao.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000788'), 'Viên nén', '10 vỉ x 10 viên', 'Bổ sung kẽm vào chế độ ăn trong các trường hợp:
Bệnh còi xương, chậm tăng trưởng ở trẻ em.
Phụ nữ mang thai và bà mẹ đang cho con bú.
Chế độ ăn thiếu cân bằng hoặc kiêng ăn.
Nuôi ăn lâu dài qua đường tĩnh mạch
Tiêu chảy cấp và mãn tính.
Điều trị thiếu kẽm:
- Thiếu kẽm nhẹ và vừa trong các trường hợp:
Suy dinh dưỡng nhẹ và vừa.
Rối loạn đường tiêu hóa: Chán ăn, chậm tiêu, táo bón nhẹ, buồn nôn và nôn khi mang thai.
Khó ngủ, mất ngủ, trẻ khóc đêm, suy nhược, nhức đầu.
Nhiễm trùng tái diễn ở đường hô hấp, đường tiêu hóa, da.
Khô da, vết thương chậm lành (bỏng, lở loét do nằm lâu).
Khô mắt, loét giác mạc, quáng gà.
- Thiếu kẽm nặng: Được đặc trưng bởi các tổn thương da điển hình trong bệnh viêm ruột, da đầu chi, dày sừng, hói, loạn dưỡng móng (móng nhăn, có vệt trắng, chậm mọc), khô mắt, viêm quanh lỗ tự nhiên (hậu môn, âm hộ) cùng với tiêu chảy.', 'Tránh dùng viên kẽm trong giai đoạn loét dạ dày tá tràng tiến triển và nôn ói cấp tính.', 'Hiếm khi xảy ra cảm giác khó chịu trong dạ dày, và thường kéo dài vài ngày đầu dùng thuốc, sau đó sẽ giảm dần. Cần báo cho bác sĩ biết bất kỳ tác dụng bất thường nào xảy ra trong lúc điều trị.
Thông báo cho Bác sĩ những tác dụng không mong muốn gặp phải khi sử dụng thuốc.', 'Liều bổ sung dinh dưỡng:
Từ 1/2 đến 2 viên/ngày, tùy từng trường hợp.
Liều điều trị: Theo hướng dẫn của thầy thuốc.
Nên giảm liều khi triệu chứng lâm sàng đã được cải thiện.
Việc dùng thuốc nên chia liều thành 1 - 2 lần/ngày, uống sau bữa ăn.
Đối với trẻ nhỏ: nên nghiền nát viên thuốc, thêm chút đường và hoà tan với nước nóng trong bình thủy rồi để nguội trước khi cho bé uống.
- Quá liều
Dùng quá liều, muối kẽm sẽ phá huỷ các mô mềm do dịch vị tác dụng lên kẽm tạo kẽm clorid.
Điều trị bao gồm dùng sữa hay carbonat kiềm và than hoạt tính.', 'Bảo quản ở nhiệt độ không quá 30°c.', '- Thận trọng khi sử dụng
Uống kẽm nên cách xa các thuốc có chứa canxi, sắt, đồng khoảng 2 - 3 giờ để ngăn ngừa tương tranh có thể làm giảm sự hấp thu của kẽm.
- Thai kỳ và cho con bú
Thuốc dùng được cho phụ nữ mang thai và cho con bú.
- Khả năng lái xe và vận hành máy móc
Không có.
- Tương tác thuốc
Dùng cùng tetracyclin, ciprofloxacin, các chế phẩm chứa sắt, đồng, làm giảm hấp thu kẽm.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000829'), 'Viên nén', '4 vỉ x 20 viên', '- Tình trạng thiếu acid folic: Thiếu máu nguyên hồng cầu khổng lồ và hồng cầu do thiếu folat.
- Người mang thai: dự phòng dị dạng ống thần kinh ở bào thai 4 tuần trước khi mang thai và tiếp tục 8 tuần sau khi mang thai.
- Tình trạng thiếu acid folic: do dinh dưỡng (suy dinh dưỡng), kém hấp thu (bệnh sprue nhiệt đới), tăng nhu cầu (mang thai, thiếu máu huyết tán mạn tính), tăng mất (thẩm phân máu) hoặc dùng các thuốc đối kháng folat.
Không dùng cho thiếu hụt folat do các chất ức chế dihydrofolat reductase.', '- Quá mẫn với acid folic hoặc với bất kỳ thành phần nào của thuốc.
- Không được dùng acid folic riêng biệt hay phối hợp với Vitamin B12 với liều không đủ để điều trị thiếu máu nguyên hồng cầu khổng lồ chưa chẩn đoán được chắc chắn.
- Bệnh nhân bị bệnh ác tính, trừ khi bị thiếu máu hồng cầu khổng lồ do thiếu acid folic.', 'Hiếm gặp (1/10.000 ≤ ADR
- Rối loạn hệ tiêu hóa: chán ăn, buồn nôn, trướng bụng và đầy hơi.
- Rối loạn hệ miễn dịch: phản ứng dị ứng, bao gồm hồng ban, ban da, ngứa, mày đay, khó thở, và phản ứng phản vệ (kể cả sốc).', 'Dự phòng và điều trị thiếu acid folic: Thiếu máu nguyên hồng cầu khổng lồ do thiếu folat:
+ Người lớn: uống 1 viên mỗi ngày, trong 4 tháng, có thể tới 15 mg/ngày khi có kém hấp thu.
+ Trẻ em cho tới 1 tuổi: 500 µg/kg/ngày uống 1 lần.
Thiếu máu tán huyết mạn tính (bệnh thalassemia, thiếu máu hồng cầu liềm): uống liên tục 1 viên cách 1 hoặc 7 ngày/lần tùy theo chế độ ăn và tốc độ tán huyết.
Dự phòng cho phụ nữ ở tuổi mang thai có nguy cơ cao có dị dạng ống thần kinh cho thai nhi khi mang thai: 1 viên/ngày trước khi mang thai 4 tuần và tiếp tục suốt 3 tháng đầu thai kỳ. Đối với phụ nữ ở tuổi mang thai: 400 µg/ngày.
- Quá liều
Quá liều: Không có dữ liệu về sử dụng thuốc quá liều, không dùng quá liều chỉ định của thuốc.
Cách xử trí: Tích cực theo dõi để có biện pháp xử trí kịp thời.', 'Bảo quản ở nhiệt độ không quá 30°C, tránh ánh sáng.', '- Thận trọng khi sử dụng
- Không nên dùng acid folic để điều trị chứng thiếu máu ác tính hoặc thiếu máu nguyên hồng cầu khổng lồ chưa rõ nguyên nhân nếu không có đủ lượng cyanocobalamin (Vitamin B12) vì acid folic dùng đơn sẽ không ngăn ngừa và có thể phát triển trầm trọng thoái hóa tủy sống cấp. Do đó cần chẩn đoán lâm sàng đầy đủ trước khi bắt đầu điều trị.
- Folat không nên dùng thường xuyên ở những bệnh nhân đang dùng stent mạch vành.
- Cần thận trọng khi dùng acid folic cho bệnh nhân có khối u phụ thuộc folat.
- Acid folic được loại bỏ bằng thẩm phân máu.
- Sản phẩm này không dành cho phụ nữ có khả năng mang thai khi dùng liều thấp hơn, nhưng dành cho phụ nữ mang thai bị thiếu folic hoặc phụ nữ có nguy cơ tái phát dị tật ống thần kinh.
- Bệnh nhân có các vấn đề về di truyền hiếm gặp khi không dung nạp galactose, thiếu hụt lactase hay hấp thu kém glucose-galactose không nên dùng thuốc này.
- Thai kỳ và cho con bú
Nhu cầu acid folic tăng cao khi mang thai. Thiếu acid folic có thể gây tổn hại cho thai nhi. Nên bổ sung acid folic cho người mang thai 1 tháng trước và 2 - 3 tháng đầu mang thai để dự phòng dị dạng ống thần kinh cho thai nhi, nhất là những người đang được điều trị động kinh hay sốt rét, vì các thuốc điều trị các bệnh này có thể gây thiếu hụt acid folic.
Acid folic bài tiết nhiều vào sữa mẹ. Mẹ cho con bú dùng được acid folic và dùng suốt trong thời gian cho con bú.
- Tương tác thuốc
- Sự hấp thu acid folic có thể giảm do sulfasalazin.
- Dùng cùng cholestyramin có thể gây cản trở sự hấp thu acid folic. Bệnh nhân điều trị cholestyramin kéo dài nên dùng acid folic 1 giờ trước hoặc 4 - 6 giờ sau khi dùng cholestyramin.
- Các kháng sinh có thể gây cản trở xét nghiệm vi sinh đối với nồng độ acid folic trong máu, hồng cầu và có thể gây ra kết quả thấp.
- Trimethoprim hoặc sulfonamid, dùng đơn hoặc kết hợp như co-trimoxazol có thể làm giảm tác dụng acid folic và điều này có thể nghiêm trọng ở bệnh nhân bị thiếu máu nguyên hồng cầu khổng lồ.
- Nồng độ trong máu thuốc chống co giật (phenytoin, phenobarbital, primidon) có thể giảm khi dùng folat, do đó bệnh nhân cần được bác sĩ kiểm tra cẩn thận và liều thuốc chống co giật được điều chỉnh khi cần thiết.
- Độc fluorouracil có thể xảy ra ở bệnh nhân đang dùng acid folic và sự phối hợp này nên tránh.
- Các loại đất sét hoặc thuốc kháng acid chứa nhôm hoặc magnesi có thể làm giảm sự hấp thụ acid folic. Bệnh nhân nên được khuyên dùng thuốc kháng acid ít nhất hai giờ sau khi dùng acid folic.
- Acid folic có thể làm giảm sự hấp thu kém ở ruột (đặc biệt quan trọng trong thai kỳ).
Tương kỵ của thuốc: Do không có các nghiên cứu về tính tương kỵ của thuốc, không trộn lẫn thuốc này với các thuốc khác.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193689000053'), 'Viên bao đường', '5 vỉ x 20 viên', 'Thiếu máu, chóng mặt, ù tai, đau lưng, mỏi gối, di mộng tinh.
Râu tóc bạc sớm.', 'Không dùng trong trường hợp táo bón.
Không dùng cho người tiểu đường.', 'Chưa phát hiện thấy tác dụng không mong muốn của thuốc.
Thông báo cho bác sỹ tác dụng không mong muốn gặp phải khi sử dụng thuốc.', 'Mỗi lần 2 - 3 viên, ngày 2 - 3 lần.', 'nhiệt độ không quá 30°C, tránh ánh sáng.', '- Thận trọng khi sử dụng
Thận trọng khi dùng cho phụ nữ mang thai.
- Thai kỳ và cho con bú
Thận trọng khi dùng cho phụ nữ có thai.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000810'), 'Viên nang mềm', '12 vỉ x 5 viên', 'Cung cấp vitamin và muối khoáng trong những trường hợp sau: Thể chất yếu, chán ăn, loạn dưỡng, mệt mỏi, gầy mòn, stress, trẻ đang tuổi lớn và người già yếu.
Là thuốc bổ và giảm mệt mỏi trong các trường hợp suy giảm thể chất khi đang bị bệnh hoặc trong giai đoạn hồi phục.', 'Phụ nữ có thai 3 tháng đầu.
Bệnh nhân tăng calci huyết, hội chứng thận hư.', 'Trong những trường hợp buồn nôn, nôn mửa, tiêu chảy, ngứa gây ra do dùng Homtamin-Ginseng Ext., nên ngưng dùng thuốc và hỏi ý kiến bác sĩ hay dược sĩ.
Trong những trường hợp khó chịu ở dạ dày, táo bón, nổi ban, đỏ da gây ra do dùng Homtamin-Ginseng Ext., nên ngưng dùng thuốc và hỏi ý kiến bác sĩ hay dược sĩ.
Có thể gặp đa kinh hoặc rối loạn kinh nguyệt khi dùng Homtamin-Ginseng Ext.. Nếu tình trạng kéo dài, hỏi ý kiến bác sĩ hay dược sĩ.
Thông báo cho bác sĩ những tác dụng không mong muốn gặp phải khi sử dụng thuốc.', '- Cách dùng
Liều thông thường cho người lớn là một viên nang mềm mỗi ngày.
- Quá liều
Triệu chứng: sử dụng quá liều có thể làm gia tăng tác dụng không mong muốn.
Xử trí: Các tác dụng không mong muốn nói chung sẽ hết khi ngưng dùng thuốc.', 'bảo quản và vận chuyển', '- Thận trọng khi sử dụng
Dùng hơn 5.000 đơn vị quốc tế Vitamin A (Retinol) mỗi ngày có khả năng sinh quái thai, do đó không được dùng Vitamin A vượt quá 5.000 đơn vị quốc tế mỗi ngày ở phụ nữ trong 3 tháng đầu của thai kỳ hoặc phụ nữ có khả năng mang thai (ngoại trừ bệnh nhân thiếu Vitamin A).
Thận trọng với bệnh nhân dị ứng với bất cứ thành phần nào của thuốc.
HỎI Ý KIẾN BÁC SĨ HOẶC DƯỢC SĨ TRONG NHỮNG TRƯỜNG HỢP SAU TRƯỚC KHI DÙNG HOMTAMIN-GINSENG EXT.
Trẻ em dưới 4 tuổi.
Bệnh nhân đang điều trị liệu pháp đặc biệt.
Phụ nữ có thai và cho con bú.
Không dùng thuốc quá thời hạn sử dụng.
- Thai kỳ và cho con bú
Ở nước ngoài, có một vài báo cáo về tính sinh dị tật thai nhi (nóc thần kinh sọ), bị nghi ngờ do người mẹ dùng thường xuyên Vitamin A liều cao (hơn 10.000 đơn vị quốc tế mỗi ngày) trong hoặc trước 3 tháng đầu của thai kỳ. Do vậy khi dùng ở phụ nữ có thai hoặc có khả năng có thai phải thận trọng về liều lượng và cách dùng, ngoại trừ trường hợp bệnh nhân thiếu Vitamin A. Khi bổ sung lượng Vitamin A cần cân nhắc đến lượng Vitamin A cung cấp trong thức ăn, cũng như khi sử dụng lượng Vitamin A trong chế phẩm này được hạn chế ở 5.000 đơn vị quốc tế/ngày.
Vitamin D bài tiết qua sữa mẹ, vì vậy nên thận trọng vì có thể gây chứng tăng calci huyết cho trẻ bú mẹ.
Do còn thiếu thông tin an toàn của thuốc ở phụ nữ mang thai và cho con bú, do đó chỉ nên dùng dưới sự chỉ định và giám sát của thầy thuốc.
- Khả năng lái xe và vận hành máy móc
Không ảnh hưởng đến khả năng lái xe và vận hành máy móc.
Lưu ý khác
Dùng đúng liều lượng và cách dùng đã mô tả.
Ở trẻ em, uống thuốc dưới sự giám sát và theo dõi của người lớn.
Bởi vì Vitamin A cũng được cung cấp trong thức ăn hàng ngày, không nên dùng quá 5000 đơn vị quốc tế mỗi ngày.
Nếu thấy hiệu quả kém sau 1 tháng dùng thuốc, thảo luận vấn đề với bác sĩ hay dược sĩ.
Lưu ý về bảo quản và vận chuyển
Giữ ngoài tầm tay trẻ em.
Để nơi khô mát, tránh ánh sáng trực tiếp.
Không nên cất giữ trong 1 loại hộp khác để bảo đảm chất lượng thuốc và tránh dùng nhầm thuốc.
7. Thông tin thêm
- Đặc điểm
Viên nang mềm hình thuôn dài, màu socola, bên trong chứa dịch thuốc màu nâu.
- Bảo quản
Bảo quản trong bao bì kín, tránh ánh sáng.
Ở nhiệt độ phòng không quá 30°C.
- Hạn dùng
36 tháng kể từ ngày sản xuất.
- Nhà sản xuất
Korea United Pharm.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000821'), 'Viên nang cứng', '10 vỉ x 10 viên', 'Duy trì và phục hồi sức khỏe trong các trường hợp:
Hoạt động thể lực, lao động nặng.
Mệt mỏi, làm việc quá sức.
Sau đợt bệnh nặng, sau phẫu thuật.
Bồi dưỡng, cung cấp chất đạm và vitamin cho:
Trẻ em, người lớn tuổi, phụ nữ có thai và cho con bú.
Người bệnh có nguy cơ thiếu hụt vitamin và chất đạm.', 'Mẫn cảm với các thành phần của thuốc, đặc biệt với các vitamin A, D, B12, C, PP.
Người bệnh thừa vitamin A.
Tăng calci máu hoặc nhiễm độc vitamin D.
Có tiền sử dị ứng với các cobalamin (vitamin B12 và các chất liên quan).
Chống chỉ định dùng vitamin C liều cao cho người bị thiếu hụt glucose-6-phosphat dehydrogenase (G6PD), người có tiền sử sỏi thận, tăng oxalat niệu và loạn chuyển hóa oxalat (tăng nguy cơ sỏi thận), bị bệnh thalassemia (tăng nguy cơ hấp thu sắt).
Không dùng vitamin PP trong các trường hợp hạ huyết áp nặng, xuất huyết động mạch.', '- Vitamin A: Khi dùng vitamin A liều cao kéo dài có thể dẫn đến ngộ độc vitamin A. Các triệu chứng đặc trưng là: mệt mỏi, dễ bị kích thích, chán ăn, sụt cân, nôn, rối loạn tiêu hóa, sốt, gan - lách to, rụng tóc, tóc khô giòn, môi nứt nẻ và chảy máu, thiếu máu, nhức đầu, calci huyết cao, phù nề dưới da, đau khớp. Ở trẻ em các triệu chứng ngộ độc mạn tính còn gồm cả tăng áp lực nội sọ (thóp căng), phù gai mắt, ù tai, rối loạn thị giác, sưng đau dọc các xương dài. Khi ngừng dùng vitamin A thì các triệu chứng cũng mất dần nhưng xương có thể ngừng phát triển do các đầu xương dài đã cốt hóa quá sớm.
- Vitamin D: Dùng vitamin D với liều không vượt quá nhu cầu sinh lý thường không độc. Tuy nhiên có thể xảy ra cường vitamin D, dẫn đến ngộ độc khi điều trị liều cao hoặc kéo dài hoặc khi tăng đáp ứng với liều bình thường vitamin D. Triệu chứng ban đầu của ngộ độc vitamin D là dấu hiệu và triệu chứng của tăng calci máu. Biểu hiện của tăng calci máu và ngộ độc vitamin D thường gặp:
Thần kinh: yếu, mệt, ngủ gà, đau đầu.
Tiêu hóa: chán ăn, khô miệng, vị kim loại, buồn nôn, nôn, chuột rút ở bụng, táo bón, tiêu chảy.
Khác: ù tai, ngoại ban, giảm trương lực cơ, đau cơ, đau xương và dễ bị kích thích.
- Vitamin B12: hiếm gặp, phản ứng ngoài da: mề đay, ngứa.
- Vitamin C: tăng oxalat niệu, buồn nôn, nôn, ợ nóng, co cứng cơ bụng, mệt mỏi, nhức đầu, mất ngủ với liều cao hằng ngày.
- Vitamin PP: liều nhỏ vitamin PP thường không gây độc, nếu dùng liều cao như liều điều trị pellagra có thể xảy ra một số tác dụng phụ như buồn nôn, đỏ bừng mặt và cổ, ngứa, cảm giác rát bỏng, buốt hoặc đau nhói ở da, những tác dụng phụ này sẽ hết sau khi ngừng thuốc.
- Methionin: buồn nôn, nôn, ngủ gà, dễ bị kích thích.
- Thiamin: hiếm xảy ra hiện tượng quá mẫn (khi tiêm).
- Pyridoxin: có thể gây bệnh thần kinh ngoại vi nặng, nếu dùng liều 200 mg/ngày và kéo dài trên 2 tháng.
- Các acid amin và các vitamin khác tác dụng phụ hiếm xảy ra và chỉ có khi sử dụng liều rất cao so với liều sử dụng hoặc chưa có báo cáo tác dụng phụ.', 'Thuốc uống.
1-2 viên mỗi ngày.
- Quá liều
Chưa có báo cáo.', NULL, '- Thận trọng khi sử dụng
Cần thận trọng khi dùng thuốc khác có chứa vitamin A.
Không được dùng acid folic phối hợp với vitamin B12 với liều không đủ để điều trị thiếu máu nguyên hồng cầu khổng lồ chưa chẩn đoán được chắc chắn. Các chế phẩm đa vitamin có chứa acid folic có thể nguy hiểm vì che lấp mức độ thiếu thực sự vitamin B12 trong bệnh thiếu máu nguyên hồng cầu khổng lồ do thiếu vitamin B12. Trong thời gian dùng thuốc, nước tiểu đôi khi có thể có màu vàng nhạt, do thuốc có chứa vitamin B2. Người bệnh suy gan, suy chức năng thận.
- Thai kỳ và cho con bú
Không gây ảnh hưởng gì theo nhu cầu hàng ngày. Phụ nữ mang thai tránh dùng ≥ 10.000 IU vitamin A/ ngày vì có khả năng gây quái thai.
Nên hỏi ý kiến bác sĩ hoặc dược sĩ trước khi dùng bất cứ loại thuốc nào.
- Khả năng lái xe và vận hành máy móc
Không ảnh hưởng đến khả năng lái xe và vận hành máy móc.
- Tương tác thuốc
Cholestyramin, parafin ngăn cản sự hấp thu vitamin A và D tại ruột.
Sử dụng vitamin C đồng thời với:
Fluphenazin dẫn đến giảm nồng độ fluphenazin huyết tương.
Aspirin làm tăng bài tiết vitamin C và giảm bài tiết aspirin trong nước tiểu.
Sử dụng nicotinamid đồng thời với:
Thuốc chẹn alpha-adrenergic trị tăng huyết áp có thể dẫn đến hạ huyết áp quá mức.
Các thuốc có độc tính với gan có thể làm tăng thêm tác hại cho gan.
Không nên dùng cùng với carbamazepin vì gây tăng nồng độ carbamazepin huyết tương dẫn đến tăng độc tính.
ĐỂ TRÁNH CÁC TƯỚNG TÁC CÓ THỂ XẢY RA, PHẢI LUÔN LUÔN BÁO BÁC SĨ HOẶC DƯỢC SĨ MỌI THUỐC KHÁC ĐANG DÙNG
7. Thông tin thêm
- Bảo quản
Nơi khô mát (dưới 30°C) và tránh ánh sáng.
- Hạn dùng
24 tháng kể từ ngày sản xuất.
- Nhà sản xuất
Roussel Việt Nam.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193689000074'), 'Cao lỏng', '1 chai x 100ml', 'Trẻ em: Biếng ăn, ra mồ hôi trộm, cơ thể suy nhược, gầy yếu, người nóng, phòng viêm nhiễm đường hô hấp tái phát.
Người lớn: Người gầy yếu, đau lưng, mỏi gối, ù tai, chóng mặt, di mộng tinh, háo khát, ra mồ hôi trộm.', 'Mẫn cảm với bất cứ thành phần nào của thuốc.
Không dùng cho những người đang rối loạn tiêu hóa, tiêu chảy, người tỳ vị hư hàn, người thể hàn và tiêu chảy do hàn: chân tay lạnh, tiêu hóa kém, sôi bụng, nóng rét, đi ngoài ra nguyên thức ăn.
7. Thông tin thêm
- Thông tin khác
TÁC DỤNG:
Theo quan điểm của Đông y cơ thể trẻ em “chân âm thường kém mà dương khí thì còn non nớt” nên trẻ thường có biểu hiện: ra mồ hôi trộm, cơ thể nóng, biếng ăn, gầy yếu, miệng khát, khó ngủ...Nếu bị kéo dài sẽ dẫn đến cơ thể gầy mòn, giảm sức đề kháng và dễ bị viêm nhiễm đường hô hấp.
Traluvi dựa trên bài thuốc cổ phương LỤC VỊ kinh điển của Đông Y, có tác dụng bổ âm, được bào chế dưới dạng dung dịch (ẩm) đặc biệt hữu ích cho trẻ và những người bị chứng âm hư.
- Bảo quản
Để nơi khô ráo, nhiệt độ không quá 30°C, tránh ánh sáng.
- Hạn dùng
24 tháng kể từ ngày sản xuất.
- Nhà sản xuất
Traphaco.', NULL, 'Lắc kỹ trước khi dùng
* Trẻ em:
1 thìa cà phê (5ml)/lần. Ngày 1 - 2 lần.
* Người lớn:
1 thìa canh (15ml)/lần. Ngày 1 - 2 lần.
Có thể pha loãng với nước chín để cho vị ngọt thích hợp.', 'nhiệt độ không quá 30°C, tránh ánh sáng.', NULL, NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193684000037'), 'Thuốc đạn đặt trực tràng', '2 vỉ x 5 viên', 'Thuốc được dùng để làm giảm đau từ nhẹ đến vừa và hạ sốt. Điều trị cho trẻ em cân nặng từ 15-30 kg.', 'Thuốc này không được dùng trong những trường hợp sau:
Biết có dị ứng với paracetamol hoặc với propacetamol hydroclorid (tiền chất của paracetamol) hoặc các thành phần của thuốc.
Suy tế bào gan nặng hoặc bệnh gan mất bù thể hoạt động.
Mới bị viêm hậu môn, hoặc trực tràng, hoặc chảy máu trực tràng.', 'Liên quan đến paracetamol
Các tác dụng phụ sau đây đã được báo cáo từ kinh nghiệm hậu mãi với thuốc đạn paracetamol. Do các phản ứng này được báo cáo một cách tự nguyện từ một dân số không có cỡ mẫu xác định, nên không thể thường xuyên ước tính được tần suất tác dụng phụ. Các phản ứng phụ được trình bày theo nhóm hệ cơ quan, tần suất và thuật ngữ MedDRA, dùng các loại tần suất như: rất thường gặp (≥ 1/10), thường gặp (≥ 1/100,
Nhóm hệ cơ quan
Tần suất
Thuật ngữ MedDRA
Rối loạn hệ máu và bạch huyết
Chưa biết
Giảm lượng tiểu cầu
Rối loạn tiêu hóa
Chưa biết
Đau bụng, tiêu chảy
Rối loạn gan mật
Chưa biết
Suy gan, hoại tử gan, viêm gan
Rối loạn hệ miễn dịch
Chưa biết
Phản ứng phản vệ, quá mẫn, phù mạch
Thăm khám cận lâm sàng
Chưa biết
Tăng enzym gan
Rối loạn da và mô dưới da
Chưa biết
Ban đỏ, ngứa, phát ban, mày đay, hội chứng ngoại ban mụn mủ toàn thân cấp tính, hội chứng hoại tử da nhiễm độc, hội chứng Stevens-Johnson
Liên quan đến dạng bào chế
Sử dụng thuốc đạn có khả năng gây kích thích hậu môn và trực tràng (xem mục CẢNH BÁO VÀ THẬN TRỌNG KHI SỬ DỤNG).', '- Liều dùng
Liều paracetamol tính theo cân nặng của trẻ, tuổi của trẻ chỉ để tham khảo, hướng dẫn.
Nếu không biết cân nặng của trẻ, cần phải cân trẻ để tính liều thích hợp nhất.
Tuổi thích hợp tương ứng với cân nặng được trình bày bên dưới chỉ để tham khảo. Để tránh nguy cơ bị quá liều, kiểm tra các thuốc uống cùng lúc (cả thuốc kê đơn và không kê đơn) phải không chứa paracetamol (xem mục CẢNH BÁO VÀ THẬN TRỌNG KHI SỬ DỤNG). Quá liều do vô ý có thể dẫn đến tổn thương gan nặng và gây tử vong (xem mục QUÁ LIỀU VÀ CÁCH XỬ TRÍ).
Paracetamol có nhiều dạng phân liều khác nhau để điều trị thích hợp tùy theo thể trọng của từng trẻ.
Liều dùng paracetamol hàng ngày khuyến cáo là khoảng 60 mg/kg/ngày, được chia làm 4 lần dùng khoảng 15 mg/kg mỗi 6 giờ.
Vì có nguy cơ gây kích thích trực tràng nên việc điều trị bằng thuốc đạn càng ngắn càng tốt, không nên vượt 4 lần/ngày và nên thay thế sớm nhất có thể bằng đường uống.
Dạng thuốc đạn không thích hợp trong trường hợp bị tiêu chảy.
Xem liều khuyến cáo cụ thể như bảng bên dưới:
Cân nặng (kg)
Tuổi thích hợp*
Hàm lượng Paracetamol /mỗi liều dùng (mg)
Số viên thuốc đạn /mỗi liều dùng
Khoảng cách tối thiểu dùng thuốc (giờ)
Liều dùng tối đa mỗi ngày (viên)
15 -
3 -
300 mg
1
6 giờ
1200 mg (4 viên)
Khoảng tuổi thích hợp tương ứng với cân nặng chỉ để tham khảo. Việc dùng theo tuổi dựa trên đường cong phát triển chuẩn tại địa phương.
- Cách dùng
Dùng đường trực tràng.
Nếu trẻ sốt trên 38,5°C, hãy làm những bước sau đây để tăng hiệu quả của việc dùng thuốc:
Cởi bỏ bớt quần áo của trẻ.
Cho trẻ uống thêm chất lỏng.
Không để trẻ ở nơi quá nóng.
Nếu cần, tắm cho trẻ bằng nước ấm, có nhiệt độ thấp hơn 2°C so với thân nhiệt của trẻ.
Tần số và thời điểm dùng thuốc
Dùng thuốc đều tránh được những dao động về mức độ đau hay sốt.
Ở trẻ em, cần có khoảng cách đều giữa mỗi lần dùng thuốc, cả ban ngày lẫn ban đêm nên là khoảng 6 giờ.
Suy thận
Ở bệnh nhân suy thận nặng, khoảng cách tối thiểu giữa mỗi lần dùng thuốc nên được điều chỉnh theo bảng sau:
Độ thanh thải Creatinin
Khoảng cách dùng thuốc
CI ≥ 10 mL/phút
6 giờ
CI
8 giờ
Suy gan
Ở bệnh nhân bệnh gan mạn tính hoặc bệnh gan còn bù thể hoạt động, đặc biệt ở những bệnh nhân suy tế bào gan, nghiện rượu mạn tính, suy dinh dưỡng kéo dài (kém dự trữ glutathion ở gan), và mất nước, phải giảm liều hoặc kéo dài khoảng cách giữa mỗi lần dùng thuốc. Liều tối đa mỗi ngày không nên vượt quá 60 mg/kg/ngày (không quá 2 g/ngày).
Bệnh nhân lớn tuổi
Không yêu cầu điều chỉnh liều ở bệnh nhân lớn tuổi.
- Quá liều
Có nguy cơ ngộ độc ở người cao tuổi và đặc biệt ở trẻ nhỏ (cả quá liều điều trị và ngộ độc bất thường đều là hiện tượng chung), có thể gây tử vong.
Cũng có nguy cơ quá liều, đặc biệt ở người bệnh gan, nghiện rượu mạn tính, ở bệnh nhân suy dinh dưỡng kéo dài và ở người dùng thuốc cảm ứng enzym. Rất đặc biệt quá liều có thể dẫn đến tử vong trong những trường hợp này (Xem mục CẢNH BÁO VÀ THẬN TRỌNG KHI SỬ DỤNG và TƯƠNG TÁC VỚI CÁC THUỐC KHÁC VÀ CÁC DẠNG TƯƠNG TÁC KHÁC).
Dấu hiệu và triệu chứng
Buồn nôn, nôn, chán ăn, xanh xao, đau bụng, đau đầu và đổ mồ hôi thường xuất hiện trong 24 giờ đầu.
Quá liều (dùng một lần quá 7,5 g ở người lớn và 140 mg/kg thể trọng dùng một lần ở trẻ em) sẽ gây hủy tế bào gan, có thể gây hoại tử hoàn toàn và không phục hồi, kéo theo suy tế bào gan, nhiễm acid chuyển hóa, bệnh não có thể dẫn tới hôn mê và tử vong.
Đồng thời, có tăng transaminase gan, lactate dehydrogenase và bilirubin cùng với giảm mức prothrombin có thể xảy ra từ 12 tới 48 giờ sau khi dùng thuốc. Các triệu chứng lâm sàng của tổn thương gan thường rõ rệt lúc ban đầu sau 1 đến 2 ngày, và đạt tối đa sau 3-4 ngày.
Các biện pháp cấp cứu
Đưa ngay đến bệnh viện.
Phải lấy một ống máu càng sớm càng tốt để định lượng ban đầu nồng độ paracetamol trong huyết tương, nhưng không được sớm hơn 4 giờ sau khi uống paracetamol.
Đào thải nhanh lượng thuốc đã dùng bằng rửa dạ dày.
Điều trị quá liều bao gồm dùng thuốc giải độc là N-acetylcystein (NAC) bằng đường tĩnh mạch hoặc đường uống, nếu có thể được, trong vòng 8 giờ sau khi dùng quá liều. NAC có thể cho một mức độ bảo vệ nào đó ngay cả sau 16 giờ.
Điều trị triệu chứng.
Phải tiến hành làm xét nghiệm về gan lúc khởi đầu điều trị và nhắc lại mỗi 24 giờ. Trong hầu hết trường hợp, transaminase gan trở lại mức bình thường sau 1-2 tuần với sự phục hồi đầy đủ chức năng gan. Tuy nhiên, trong trường hợp quá nặng, có thể cần ghép gan.', 'nhiệt độ thấp hơn 2°C so với thân nhiệt của trẻ.', '- Thận trọng khi sử dụng
Cảnh báo
Để tránh nguy cơ quá liều, luôn kiểm tra chắc chắn là các thuốc khác đã dùng (bao gồm cả thuốc kê đơn và không kê đơn) không chứa paracetamol.
Liều tối đa khuyến cáo:
Với trẻ em cân nặng từ 15 đến Dùng thuốc đạn có nguy cơ gây kích ứng tại chỗ, tần suất và cường độ tăng theo thời gian dùng thuốc, thời điểm đặt thuốc và liều dùng.
Liều paracetamol cao hơn liều khuyến cáo gây nên nguy cơ tổn thương gan rất nghiêm trọng. Các triệu chứng lâm sàng về tổn thương gan thường được ghi nhận đầu tiên sau 1 đến 2 ngày quá liều paracetamol. Các triệu chứng tổn thương gan tối đa thường được quan sát thấy sau 3-4 ngày. Cần sử dụng thuốc giải độc càng sớm càng tốt (xem mục QUÁ LIỀU VÀ CÁCH XỬ TRÍ).
Bác sĩ cần cảnh báo bệnh nhân về các dấu hiệu của phản ứng trên da nghiêm trọng như hội chứng Stevens-Johnson (SJS), hội chứng hoại tử da nhiễm độc (TEN) hoặc hội chứng Lyell, hội chứng ngoại ban mụn mủ toàn thân cấp tính (AGEP).
Dùng thận trọng paracetamol trong những trường hợp sau:
Suy tế bào gan.
Suy thận.
Thiếu hụt enzym Glucose-6-Phosphat-Dehydrogenase (G6PD) (có thể dẫn tới thiếu máu tán huyết).
Nghiện rượu mạn tính, uống rượu quá nhiều (≥ 3 cốc rượu mỗi ngày).
Chán ăn, chứng ăn vô độ hoặc suy mòn, suy dinh dưỡng kéo dài (tức kém dự trữ glutathion ở gan).
Mất nước, giảm thể tích máu.
Thận trọng khi dùng
Dạng thuốc đạn không thích hợp trong trường hợp bị tiêu chảy.
- Thai kỳ và cho con bú
Phụ nữ mang thai
Dữ liệu dịch tễ học từ việc sử dụng liều điều trị của paracetamol cho thấy không có các tác dụng không mong muốn đối với phụ nữ mang thai hoặc đối với sức khỏe của thai hoặc trẻ sơ sinh.
Các nghiên cứu về sinh sản với paracetamol đã không cho thấy bất kỳ tác dụng gây dị dạng hoặc tác dụng độc đối với thai. Các dữ liệu này trên phụ nữ mang thai đã dùng quá liều paracetamol cho thấy không làm tăng nguy cơ dị dạng.
Tuy nhiên, Efferalgan chỉ nên được dùng cho phụ nữ mang thai sau khi đã được đánh giá cẩn thận giữa lợi ích điều trị và nguy cơ. Ở bệnh nhân mang thai, liều khuyến cáo và thời gian dùng thuốc phải được theo dõi chặt chẽ.
Phụ nữ cho con bú
Sau khi uống, một lượng nhỏ paracetamol được tiết vào sữa mẹ. Đã có báo cáo về phát ban ở trẻ bú mẹ. Mặc dù paracetamol được xem xét là phù hợp đối với phụ nữ cho con bú, tuy nhiên cần thận trọng khi sử dụng Efferalgan cho phụ nữ trong thời kỳ cho con bú.
- Khả năng lái xe và vận hành máy móc
Không liên quan.
- Tương tác thuốc
Ảnh hưởng của EFFERALGAN lên các thuốc khác
Thuốc uống chống đông máu
Dùng đồng thời paracetamol với các coumarin bao gồm gồm warfarin có thể làm thay đổi nhẹ trị số INR. Trong trường hợp này, cần tăng cường theo dõi trị số INR trong thời gian sử dụng kết hợp cũng như trong 1 tuần sau khi ngưng điều trị paracetamol.
Tương tác với các xét nghiệm trong phòng thí nghiệm
Sử dụng paracetamol có thể tương tác với xét nghiệm acid uric máu theo phương pháp acid phosphotungstic và với xét nghiệm đường huyết theo phương pháp glucose-oxydase-peroxydase.
Ảnh hưởng của các thuốc khác lên EFFERALGAN
Phenytoin khi sử dụng đồng thời có thể dẫn đến giảm hiệu quả của paracetamol và làm tăng nguy cơ độc tính đối với gan. Những bệnh nhân đang điều trị bằng phenytoin nên tránh dùng paracetamol liều lớn và/hoặc kéo dài. Cần theo dõi bệnh nhân về dấu hiệu độc tính đối với gan.
Probenecid có thể làm giảm gần 2 lần độ thanh thải của paracetamol bằng cách ức chế sự liên hợp của nó với acid glucuronic. Nên xem xét giảm liều paracetamol khi sử dụng đồng thời với probenecid.
Salicylamid có thể kéo dài thời gian bán thải (t1/2) của paracetamol.
Các chất gây cảm ứng enzym: Cần thận trọng khi sử dụng đồng thời paracetamol với các chất gây cảm ứng enzym. Những chất này bao gồm nhưng không giới hạn barbiturat, isoniazid, carbamazepin, rifampin và ethanol (xem mục QUÁ LIỀU VÀ CÁCH XỬ TRÍ).', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193684000076'), 'Viên nén', '10 vỉ x 10 viên', 'Điều trị các triệu chứng đau trong các trường hợp: đau đầu, đau nửa đầu, đau răng, đau nhức do cảm cúm, đau họng, đau nhức cơ xương, đau do viêm khớp, đau sau khi tiêm ngừa hay nhổ răng.
Hạ sốt ở bệnh nhân bị cảm hay những bệnh có liên quan đến sốt.', 'Quá mẫn với một trong các thành phần của thuốc. Người bệnh thiếu hụt glucose - 6 - phosphat dehydrogenase.', 'Ít gặp: ban da; buồn nôn, nôn; bệnh thận, độc tính thận khi lạm dụng dài ngày; giảm bạch cầu trung tính, giảm toàn thể huyết cầu, thiếu máu.
Hiếm gặp: phản ứng quá mẫn.
Thông báo cho bác sĩ những tác dụng không mong muốn gặp phải khi sử dụng thuốc.', 'Cách mỗi 6 giờ uống một lần.
Trẻ em từ 6 đến 12 tuổi: uống 1 viên/lần.
Người lớn và trẻ em trên 12 tuổi: uống 1 1/2 viên/lần.
Hoặc theo chỉ dẫn của Thầy thuốc.
Lưu ý:
* Liều tối đa/24 giờ:
Đối với trẻ em: uống không quá 5 lần/ngày.
* Không nên kéo dài việc tự sử dụng thuốc mà cần có ý kiến bác sĩ khi:
Có triệu chứng mới xuất hiện.
Sốt cao (39,5°C) và kéo dài hơn 3 ngày hoặc tái phát.
Đau nhiều và kéo dài hơn 5 ngày.
- Quá liều
Quá liều Paracetamol do dùng một liều độc duy nhất hoặc do uống lặp lại liều lớn Paracetamol (7,5 -10g mỗi ngày, trong 1 - 2 ngày) hoặc do uống thuốc dài ngày. Hoại tử gan phụ thuộc liều là tác dụng độc cấp tính nghiêm trọng nhất do quá liều và có thể gây tử vong.
Biểu hiện của quá liều Paracetamol: buồn nôn, nôn, đau bụng, triệu chứng xanh tím da, niêm mạc và móng tay.
Biểu hiện của ngộ độc nặng Paracetamol: ban đầu kích thích nhẹ, kích động và mê sảng. Tiếp theo là ức chế hệ thần kinh trung ương: sững sờ, hạ thân nhiệt, mệt lả, thở nhanh và nông; mạch nhanh, yếu, không đều, huyết áp thấp và suy tuần hoàn.
Cách xử trí: Chẩn đoán sớm rất quan trọng trong điều trị quá liều Paracetamol.
Khi nhiễm độc Paracetamol nặng, cần điều trị hỗ trợ tích cực. Cần rửa dạ dày trong mọi trường hợp, tốt nhất trong vòng 4 giờ sau khi uống.
Liệu pháp giải độc chính là dùng những hợp chất Sulfhydryl. N - acetylcystein có tác dụng khi uống hoặc tiêm tĩnh mạch.
Ngoài ra, có thể dùng Methionin, than hoạt và/hoặc thuốc tẩy muối.', 'nhiệt độ không quá 30°C, tránh ánh sáng.', '- Thận trọng khi sử dụng
Đối với người bị phenylceton - niệu và người phải hạn chế lượng phenylalanin đưa vào cơ thể nên tránh dùng Paracetamol với thuốc hoặc thực phẩm có chứa Aspartam.
Đối với một số người quá mẫn (bệnh hen) nên tránh dùng Paracetamol với thuốc hoặc thực phẩm có chứa Sulfit.
Phải dùng thận trọng ở người bệnh có thiếu máu từ trước, suy giảm chức năng gan và thận.
Uống nhiều rượu có thể gây tăng độc tính với gan của Paracetamol, nên tránh hoặc hạn chế uống rượu.
Bác sĩ cần cảnh báo bệnh nhân về các dấu hiệu của phản ứng trên da nghiêm trọng như hội chứng Steven-Johnson (SJS), hội chứng hoại tử da nhiễm độc (TEN) hay hội chứng Lyell, hội chứng ngoại ban mụn mủ toàn thân cấp tính (AGEP).
- Thai kỳ và cho con bú
Chưa xác định được tính an toàn của Paracetamol đối với thai nhi khi dùng thuốc cho phụ nữ có thai. Do đó, chỉ nên dùng thuốc ở người mang thai khi thật cần thiết.
Nghiên cứu ở người mẹ cho con bú, dùng Paracetamol không thấy có tác dụng không mong muốn ở trẻ bú mẹ.
- Khả năng lái xe và vận hành máy móc
Thuốc không ảnh hưởng đến khả năng lái xe và vận hành máy móc.
- Tương tác thuốc
Uống dài ngày liều cao Paracetamol làm tăng nhẹ tác dụng chống đông của Coumarin và dẫn chất Indandion.
Cần chú ý đến khả năng gây hạ sốt nghiêm trọng ở người bệnh dùng đồng thời Phenothiazin và liệu pháp hạ nhiệt.
Các thuốc chống co giật (Phenytoin, Barbiturat, Carbamazepin), Isoniazid và các thuốc chống lao có thể làm tăng độc tính đối với gan của Paracetamol.
Uống rượu quá nhiều và dài ngày có thể làm tăng nguy cơ Paracetamol gây độc cho gan.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193687000227'), 'Viên nén', '10 vỉ x 5 viên', 'Điều trị các triệu chứng đau trong các trường hợp: đau đầu, đau nửa đầu, đau răng, đau nhức do cảm cúm, đau họng, đau nhức cơ xương, đau do viêm khớp, đau sau khi tiêm ngừa hay nhổ răng,...
Hạ sốt ở bệnh nhân bị cảm hay những bệnh có liên quan đến sốt.', 'Quá mẫn với một trong các thành phần của thuốc. Người bệnh thiếu hụt glucose - 6 - phosphat dehydrogenase.', 'Ít gặp: ban da; buồn nôn, nôn; bệnh thận, độc tính thận khi lạm dụng dài ngày; giảm bạch cầu trung tính, giảm toàn thể huyết cầu, thiếu máu.
Hiếm gặp: phản ứng quá mẫn.
Thông báo cho bác sĩ những tác dụng không mong muốn gặp phải khi sử dụng thuốc.', 'Khoảng cách giữa 2 lần uống phải hơn 4 giờ và không uống quá 6 viên/ngày.
Người lớn và trẻ em > 12 tuổi: uống 1 viên/lần.
Không tự ý dùng thuốc quá 3 ngày để giảm sốt hoặc quá 10 ngày để giảm đau.
Hoặc theo chỉ dẫn của Thầy thuốc.
Lưu ý:
* Liều tối đa/24 giờ: không quá 4g, khoảng cách giữa 2 lần uống thuốc phải hơn 4 giờ.
* Không nên kéo dài việc tự sử dụng thuốc mà cần có ý kiến bác sĩ khi:
Có triệu chứng mới xuất hiện.
Sốt cao (39,5°C) và kéo dài hơn 3 ngày hoặc tái phát.
Đau nhiều và kéo dài hơn 5 ngày.
- Quá liều
Quá liều Paracetamol do dùng một liều độc duy nhất hoặc do uống lặp lại liều lớn Paracetamol (7,5-10g mỗi ngày, trong 1-2 ngày) hoặc do uống thuốc dài ngày. Hoại tử gan phụ thuộc liều là tác dụng độc cấp tính nghiêm trọng nhất do quá liều và có thể gây tử vong.
Biểu hiện của quá liều Paracetamol: buồn nôn, nôn, đau bụng, triệu chứng xanh tím da, niêm mạc và móng tay.
Biểu hiện của ngộ độc nặng Paracetamol: ban đầu kích thích nhẹ, kích động và mê sảng. Tiếp theo là ức chế hệ thần kinh trung ương: sững sờ, hạ thân nhiệt, mệt lả, thở nhanh và nông; mạch nhanh, yếu, không đều, huyết áp thấp và suy tuần hoàn.
Cách xử trí:
Chẩn đoán sớm rất quan trọng trong điều trị quá liều Paracetamol.
Khi nhiễm độc Paracetamol nặng, cần điều trị hỗ trợ tích cực. Cần rửa dạ dày trong mọi trường hợp, tốt nhất trong vòng 4 giờ sau khi uống.
Liệu pháp giải độc chính là dùng những hợp chất Sulfhydryl. N - acetylcystein có tác dụng khi uống hoặc tiêm tĩnh mạch.
Ngoài ra, có thể dùng Methionin, than hoạt và/hoặc thuốc tẩy muối.', 'nhiệt độ không quá 30°C, tránh ánh sáng.', '- Thận trọng khi sử dụng
Đối với người bị phenylceton - niệu và người phải hạn chế lượng phenylalanin đưa vào cơ thể nên tránh dùng Paracetamol với thuốc hoặc thực phẩm có chứa Aspartam.
Đối với một số người quá mẫn (bệnh hen) nên tránh dùng Paracetamol với thuốc hoặc thực phẩm có chứa sulfit.
Phải dùng thận trọng ở người bệnh có thiếu máu từ trước, suy giảm chức năng gan và thận.
Uống nhiều rượu có thể gây tăng độc tính với gan của Paracetamol, nên tránh hoặc hạn chế uống rượu.
Bác sĩ cần cảnh báo bệnh nhân về các dấu hiệu của phản ứng trên da nghiêm trọng như hội chứng Steven-Johnson (SJS), hội chứng hoại tử da nhiễm độc (TEN) hay hội chứng Lyell, hội chứng ngoại ban mụn mủ toàn thân cấp tính (AGEP).
- Thai kỳ và cho con bú
Chưa xác định được tính an toàn của Paracetamol đối với thai nhi khi dùng thuốc cho phụ nữ có thai. Do đó, chỉ nên dùng thuốc ở người mang thai khi thật cần thiết. Nghiên cứu ở người mẹ cho con bú, dùng Paracetamol không thấy có tác dụng không mong muốn ở trẻ bú mẹ.
- Khả năng lái xe và vận hành máy móc
Thuốc không ảnh hưởng đến khả năng lái xe và vận hành máy móc.
- Tương tác thuốc
Uống dài ngày liều cao Paracetamol làm tăng nhẹ tác dụng chống đông của Coumarin và dẫn chất Indandion.
Cần chú ý đến khả năng gây hạ sốt nghiêm trọng ở người bệnh dùng đồng thời Phenothiazin và liệu pháp hạ nhiệt.
Các thuốc chống co giật (Phenytoin, Barbiturat, Carbamazepin), Isoniazid và các thuốc chống lao có thể làm tăng độc tính đối với gan của Paracetamol.
Uống rượu quá nhiều và dài ngày có thể làm tăng nguy cơ Paracetamol gây độc cho gan.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193696000038'), 'Viên nén bao phim', '5 vỉ x 10 viên', 'Cetirizine STELLA 10mg được chỉ định ở người lớn và trẻ em từ 12 tuổi trở lên: Làm giảm các triệu chứng ở mũi và mắt của viêm mũi dị ứng theo mùa và quanh năm.
Làm giảm các triệu chứng của mày đay vô căn mạn tính.', 'Quá mẫn với cetirizine, với bất kỳ tá dược nào của thuốc, với hydroxyzin hoặc bất kỳ các dẫn xuất nào của piperazin.
Bệnh nhân suy thận nặng có độ thanh thải creatinin dưới 10 ml/phút.', 'Rất thường gặp (ADR ≥ 1/10), thường gặp (1/100 ≤ ADR Ít gặp
Tâm thần: Kích động.
Thần kinh: Dị cảm.
Tiêu hóa: Tiêu chảy.
Da và mô dưới da: Ngứa, phát ban.
Toàn thân (chung): Suy nhược, mệt mỏi.
Hiếm gặp
Miễn dịch: Quá mẫn.
Tâm thần: Gây hấn, lú lẫn, trầm cảm, ảo giác, mất ngủ.
Thần kinh: Co giật, rối loạn vận động.
Tim: Nhịp tim nhanh.
Gan: Chức năng gan bất thường (tăng transaminase, phosphat kiềm, y-GT và bilirubin).
Da và mô dưới da: Mày đay.
Toàn thân (chung): Phù nề.
Nghiên cứu liên quan: Tăng cân.
Rất hiếm gặp
Máu và bạch huyết: Giảm tiểu cầu.
Miễn dịch: Sốc phản vệ.
Tâm thần: Vận động hay phát âm không chủ ý.
Thần kinh: Rối loạn vị giác, ngất, run, loạn trương lực cơ, rối loạn vận động.
Mắt: Rối loạn điều tiết, nhìn mờ, vận nhãn.
Da và mô dưới da: Phù mạch, phát ban da cố định do thuốc.
Thận và tiết niệu: Khó tiểu, đái dầm.
Chưa rõ tần suất
Chuyển hóa và dinh dưỡng: Tăng thèm ăn.
Tâm thần: Có ý định tự tử.
Hệ thần kinh: Mất trí nhớ, suy giảm trí nhớ.
Tai và tai trong: Chóng mặt.
Gan: Viêm gan.
Thận và tiết niệu: Bí tiểu.', 'Cách dùng
Cetirizine STELLA 10 mg được dùng đường uống. Thức ăn có thể làm giảm nồng độ đỉnh trong máu và kéo dài thời gian đạt nồng độ đỉnh, nhưng không ảnh hưởng đến mức hấp thu thuốc, cho nên có thể uống cùng hoặc ngoài bữa ăn.
Liều dùng
Người lớn và trẻ em từ 12 tuổi trở lên: 10 mg x 1 lần/ngày.
Bệnh nhân suy thận nhẹ (độ thanh thải creatinin từ 50 - 79 ml/phút): 10 mg x 1 lần/ngày.
Cetirizine STELLA 10 mg không có khắc vạch để chia liều nên không phù hợp cho:
Trẻ em dưới 12 tuổi.
Bệnh nhân bị suy gan.
Bệnh nhân suy thận vừa và nặng (độ thanh thải creatinin dưới 50 ml/phút).
- Quá liều
Triệu chứng
Các triệu chứng ghi nhận được sau khi dùng quá liều cetirizine chủ yếu là liên quan đến các tác dụng trên hệ thần kinh trung ương hay các tác dụng kháng cholinergic.
Tác dụng không mong muốn được ghi nhận sau khi sử dụng một lượng ít gấp 5 lần liều khuyến cáo hàng ngày: Lú lẫn, tiêu chảy, chóng mặt, mệt mỏi, nhức đầu, khó chịu, giãn đồng tử, ngứa, bồn chồn, buồn ngủ, mơ màng, sững sờ, tim đập nhanh, run rẩy và bí tiểu.
Xử trí
Chưa có thuốc giải độc đặc hiệu cho cetirizine.
Nếu quá liều xảy ra, bệnh nhân cần điều trị triệu chứng và điều trị hỗ trợ. Nếu mới uống thuốc trong khoảng thời gian ngắn thì có thể cân nhắc biện pháp rửa dạ dày.
Không hiệu quả trong việc loại cetirizine ra khỏi cơ thể bằng phương pháp thẩm tách máu.', 'Bảo quản trong bao bì kín, nơi khô. Nhiệt độ không quá 30°C.', '- Thận trọng khi sử dụng
Không có tương tác ý nghĩa lâm sàng nào với rượu (đối với nồng độ trong máu 0,5 g/l) được chứng minh ở liều điều trị. Tuy nhiên, nên thận trọng khi dùng thuốc đồng thời với rượu.
Bệnh nhân có các yếu tố bí tiểu bẩm sinh (ví dụ như tổn thương tủy sống, tăng sản tuyến tiền liệt) vì cetirizine có thể làm tăng nguy cơ bí tiểu.
Thận trọng ở bệnh nhân động kinh và bệnh nhân có nguy cơ co giật.
Cần thực hiện xét nghiệm dị ứng da trước khi dùng thuốc do xét nghiệm này bị ức chế bởi thuốc kháng histamin và thời gian rửa giải (3 ngày).
Cetirizine STELLA 10 mg có chứa lactose. Không nên dùng thuốc này cho bệnh nhân có các vấn đề về di truyền hiếm gặp không dung nạp galactose, thiếu hụt enzym lactase toàn phần hay kém hấp thu glucose-galactose.
- Thai kỳ và cho con bú
Phụ nữ có thai
Nghiên cứu trên chuột cho thấy không có sự ảnh hưởng có hại trực tiếp hay gián tiếp đến thai kì, sự phát triển của phôi, thai nhi trong khi sinh hoặc sau khi sinh. Cần thận trọng khi kê toa cho phụ nữ mang thai.
Phụ nữ cho con bú
Cetirizine qua được sữa mẹ với nồng độ bằng 25% đến 90% nồng độ đo được trong huyết tương, tùy thuộc thời gian lấy mẫu sau khi uống thuốc. Vì thế cần thận trọng khi sử dụng cetirizine ở phụ nữ cho con bú.
Khả năng sinh sản
Rất ít dữ liệu nghiên cứu trên khả năng sinh sản ở người, tính an toàn chưa được thiết lập.
- Khả năng lái xe và vận hành máy móc
Với liều khuyến cáo 10 mg, không có bất cứ biểu hiện lâm sàng có liên quan với khả năng lái xe và vận hành máy móc. Tuy nhiên, bệnh nhân thấy buồn ngủ nên hạn chế lái xe, tham gia vào các hoạt động nguy hiểm hay vận hành máy móc. Bệnh nhân không nên dùng quá liều khuyến cáo và nên theo dõi đáp ứng của họ đối với thuốc.
- Tương tác thuốc
Tương tác của thuốc
Tránh kết hợp với các thuốc ức chế thần kinh trung ương như thuốc an thần, rượu.
Độ thanh thải cetirizine giảm nhẹ khi uống cùng 400 mg theophyline.
Tương kỵ của thuốc
Do không có các nghiên cứu về tính tương kỵ của thuốc, không trộn lẫn thuốc này với các thuốc khác.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193696000032'), 'Viên nén', '1 vỉ x 10 viên', 'Clarityne được chỉ định để giảm triệu chứng do viêm mũi dị ứng, như hắt hơi, sổ mũi, ngứa mũi, ngứa và chảy nước mắt. Các dấu hiệu và triệu chứng ở mũi và mắt sẽ giảm nhanh sau khi uống thuốc.
Clarityne được chỉ định để giảm triệu chứng của mày đay mạn tính và các bệnh da do dị ứng khác.', 'Chống chỉ định cho những bệnh nhân quá mẫn hoặc dị ứng với các thành phần của thuốc.', 'Không gây buồn ngủ một cách đáng kể với liều 10mg mỗi ngày.
Các tác dụng phụ được báo cáo phổ biến nhất bao gồm: mệt mỏi, đau đầu, lơ mơ, khô miệng, rối loạn dạ dày ruột như buồn nôn, viêm dạ dày, và cũng gặp các triệu chứng dị ứng như nổi ban.
Trong quá trình lưu hành sản phẩm Clarityne, hiếm có báo cáo rụng tóc, quá mẫn, chức năng gan bất thường, nhanh nhịp tim, đánh trống ngực, chóng mặt và co giật.
Trong những nghiên cứu lâm sàng có kiểm soát trên bệnh nhi, tỉ lệ đau đầu, lơ mơ và hốt hoảng liên quan đến việc dùng thuốc hiếm khi được báo cáo, tương tự với placebo.
Thông báo cho bác sĩ những tác dụng không mong muốn gặp phải khi dùng thuốc.', 'Người lớn và trẻ > 12 tuổi:
Clarityne viên nén: 1 viên 10 mg - ngày 1 lần.
Trẻ từ 2 đến 12 tuổi:
Cân nặng > 30 kg: 10 mg - ngày 1 lần.
Cân nặng ≤ 30 kg: 5 mg - ngày 1 lần.
- Quá liều
Lơ mơ, đánh trống ngực và đau đầu đã được báo cáo khi dùng quá liều, uống một lần 160mg loratadine không gây tác dụng phụ. Trong trường hợp quá liều nên lập tức điều trị triệu chứng và điều trị hỗ trợ.', 'Bảo quản dưới 30', '- Thận trọng khi sử dụng
Những bệnh nhân suy gan nặng nên sử dụng liều ban đầu thấp hơn do giảm thanh thải Loratadine. Liều khởi đầu đề nghị cho những bệnh nhân này là 5 mg/ngày hoặc 10mg dùng cách ngày.
Chưa xác lập hiệu quả của Clarityne ở trẻ dưới 2 tuổi. Tuy nhiên, dữ liệu dược động học của Loratadine ở trẻ từ 1 đến 2 tuổi sau khi dùng liều duy nhất 2,5mg Clarityne sirô là tương tự như trẻ lớn tuổi hơn và người lớn.
Không dùng thuốc khi quá hạn sử dụng.
- Thai kỳ và cho con bú
Chưa xác định tính an toàn khi dùng các chế phẩm Clarityne cho phụ nữ có thai; do đó chỉ dùng thuốc khi lợi ích vượt trội nguy cơ đối với thai.
Do Loratadine được tiết vào sữa và do những nguy cơ khi dùng các thuốc kháng histamine tăng lên ở trẻ em, đặc biệt trẻ sơ sinh và sinh non, nên ngừng cho con bú hoặc ngừng thuốc.
- Khả năng lái xe và vận hành máy móc
Trong các nghiên cứu lâm sàng đánh giá về khả năng lái xe, không quan sát thấy ảnh hưởng đến khả năng lái xe ở các bệnh nhân sử dụng Loratadine. Tác động của Clarityne lên khả năng lái xe và vận hành máy móc là không có hoặc không đáng kể. Rất hiếm bệnh nhân gặp tình trạng buồn ngủ có thể ảnh hưởng đến khả năng lái xe hoặc vận hành máy móc.
- Tương tác thuốc
Dựa trên những nghiên cứu được tiến hành khi sử dụng chung với rượu, Loratadine không ảnh hưởng trên tâm thần.
Trong các thử nghiệm lâm sàng có kiểm soát, đã thấy tăng nồng độ Loratadine trong huyết tương khi sử dụng đồng thời với ketoconazole, erythromycin hoặc cimetldine, nhưng không thấy thay đổi đáng kể có ý nghĩa lâm sàng (kể cả điện tâm đồ). Cần thận trọng khi phối hợp với các thuốc khác đã biết có tác dụng ức chế sự chuyển hóa ở gan cho đến khi nghiên cứu về tương tác thuốc được hoàn thành đầy đủ.
Tương tác thuốc/Xét nghiệm: Nên ngừng sử dụng Clarityne 48 giờ trước khi tiến hành các thử nghiệm trên da vì các thuốc kháng histamine có thể ngăn ngừa hoặc giảm các phản ứng dương tính ở da.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193661000040'), 'Siro', '1 chai x 60ml', 'Viêm mũi dị ứng theo mùa: DESTACURE được chỉ định để làm giảm nhanh các triệu chứng viêm mũi dị ứng theo mùa ở những bệnh nhân từ 2 tuổi trở lên.
Viêm mũi dị ứng lâu năm: DESTACURE được chỉ định để làm giảm nhanh các triệu chứng viêm mũi dị ứng lâu năm ở những bệnh nhân từ 6 tháng tuổi trở lên.
Chứng mề đay tự phát mãn tính: DESTACURE được chỉ định để làm giảm nhanh các triệu chứng ngứa, giảm số lượng và kích thước phát ban ở những bệnh nhân mề đay tự phát mãn tính từ 6 tháng tuổi trở lên.', 'Không dùng cho bệnh nhân quá mẫn với DESTACURE hoặc bất cứ thành phần nào của thuốc hoặc quá mẫn với loratadin.', 'Trong những thử nghiệm lâm sàng ở tổng số 246 trẻ em từ 6 tháng đến 11 tuổi được cho uống Xi-rô desloratadin. Tỉ lệ mắc phải tác dụng không mong muốn tổng thể ở trẻ 2 tới 11 tuổi là tương tự nhau giữa nhóm uống xi rô desloratadin và nhóm giả dược. Ở trẻ sơ sinh và trẻ nhỏ từ 6 đến 23 tháng tuổi, hầu hết các trường hợp sau khi uống desloratadin có một số tác dụng phụ như tiêu chảy (3,7%), sốt (2,3%) và mất ngủ (2,3%).
Với liều dùng khuyến cáo, trong những thử nghiệm lâm sàng liên quan đến người lớn và thanh thiếu niên trong các chỉ định bao gồm viêm mũi dị ứng và nổi mề đay tự phát mãn tính, tác dụng không mong muốn với desloratadin được ghi nhận ở 3% bệnh nhân so với thuốc giả dược. Tỷ lệ tác dụng phụ tương tự như nhau giữa những bệnh nhân dùng desloratadin và những bệnh nhân điều trị bằng giả dược như mệt mỏi (1,2%), khô miệng (0,8%) và nhức đầu (0,6%). Báo cáo tác dụng không mong muốn khác rất hiếm gặp trong quá trình theo dõi hậu mãi được liệt kê trong bảng sau:
Rối loạn tâm thần
Ảo giác
Rối loạn hệ thống thần kinh
Chóng mặt, buồn ngủ, mất ngủ, vận động thần kinh quá mức, động kinh
Rối loạn tim mạch
Tim đập nhanh, đánh trống ngực
Rối loạn tiêu hóa
Đau bụng, buồn nôn, nôn mửa, khó tiêu, tiêu chảy
Rối loạn gan mật
Tăng cao các men gan, tăng bilirubin, viêm gan
Cơ xương khớp và các rối loạn mô liên kết
Chứng đau cơ
Rối loạn toàn thân
Những phản ứng mẫn cảm (như dị ứng, phù mạch, khó thở, nổi mẩn, ngứa, và nổi mày đay)
Thông báo cho bác sĩ nếu có bất kỳ tác dụng phụ nào liên quan đến việc dùng thuốc.', 'Nên sử dụng DESTACURE phù hợp với lứa tuổi bằng cách đong bằng ống nhỏ giọt hoặc xi lanh để lấy từ 2ml tới 2,5ml (1/2 muỗng trà).
Người lớn và trẻ em trên 12 tuổi: Liều dùng được khuyến cáo của DESTACURE là 2 muỗng trà đầy (5mg trong 10ml) mỗi ngày một lần.
Trẻ em từ 6 đến 11 tuổi: Liều dùng được khuyến cáo của DESTACURE là 1 muỗng trà đầy (2,5mg trong 5ml) mỗi ngày một lần.
Trẻ em từ 12 tháng đến 5 tuổi: Liều dùng được khuyến cáo của DESTACURE là ½ muỗng trà (1,25mg trong 2,5ml) mỗi ngày một lần.
Trẻ em từ 6 tháng đến 11 tháng tuổi: Liều dùng được khuyến cáo của DESTACURE là 2ml (1,0mg) mỗi ngày một lần.
- Quá liều
Trong trường hợp quá liều, cần có những biện pháp chuẩn để loại bỏ phần hoạt chất chưa được hấp thu ra khỏi cơ thể.
Cần có biện pháp điều trị triệu chứng và điều trị hỗ trợ.
Dựa trên các thử nghiệm lâm sàng với các liều dùng khác nhau ở người lớn và thanh thiếu niên với liều dùng khuyến cáo đến 45mg Desloratadin (gấp 9 lần liều dùng thông thường), không thấy có những tác dụng trên lâm sàng có liên quan.
Không loại bỏ Desloratadin được bằng thẩm phân máu, chưa rõ có đào thải được bằng thẩm tách màng bụng hay không.', 'Bảo quản siro', '- Thận trọng khi sử dụng
Khi có những phản ứng do mẫn cảm với thành phần của thuốc như phát ban, ngứa, nổi mề đay, phù, khó thở nên ngừng desloratadin và thay bằng phương pháp điều trị khác.
- Thai kỳ và cho con bú
Mang thai trong thời kì theo FDA: Loại C
Desloratadin không gây quái thai ở chuột với liều lượng 48mg/kg/ngày (ước tính giá trị điều trị của Desloratadin và chất chuyển hóa Desloratadine khoảng 210 lần AUC ở người dựa vào liều uống hàng ngày được khuyến cáo) hoặc ở thỏ với liều lượng 60mg/kg/ngày (ước tính giá trị điều trị của Desloratadin khoảng 230 lần AUC ở người dựa vào liều uống hàng ngày được khuyến cáo). Sử dụng Desloratadin với liều lượng 9mg/kg/ngày hoặc nhiều hơn sẽ làm giảm trọng lượng cơ thể và chậm phản xạ ánh sáng ở chó khi mang thai (ước tính giá trị điều trị của Desloratadin và chất chuyển hóa Desloratadin khoảng 50 lần AUC ở người dựa vào liều uống hàng ngày được khuyến cáo). Desloratadin không gây ảnh hưởng đến sự phát triển bào thai ở chó với liều lượng 3mg/kg/ngày (ước tính giá trị điều trị của Desloratadin và chất chuyển hóa Desloratadin khoảng 7 lần AUC ở người dựa vào liều uống hàng ngày được khuyến cáo). Tuy nhiên chưa có nghiên cứu thích đáng và có kiểm soát ở phụ nữ mang thai. Bởi vì những nghiên cứu sinh sản ở động vật không phải lúc nào cũng cho kết quả giống như ở con người, Desloratadin chỉ được sử dụng trong thai kỳ nếu thật cần thiết.
Phụ nữ cho con bú:
Desloratadin được bài tiết vào sữa mẹ; vì thế cần quyết định ngưng cho con bú mẹ hoặc ngưng dùng Desloratadin dựa trên tầm quan trọng của thuốc đối với mẹ.
- Khả năng lái xe và vận hành máy móc
Thận trọng cho người lái xe và vận hành máy móc.
- Tương tác thuốc
Chất ức chế Cytochrome P450 3A4
Trong những nghiên cứu lâm sàng có kiểm soát cho thấy Desloratadin uống kết hợp với ketoconazole, erythromycin, hoặc azithromycin kết quả là tăng nồng độ huyết tương của Desloratadin và 3-hydroxydesloratadin, nhưng không thấy có biểu hiện lâm sàng nào liên quan đến tương tác với desloratadin trong các nghiên cứu lâm sàng.
Fluoxetine
Trong những nghiên cứu lâm sàng có kiểm soát cho thấy Desloratadin uống kết hợp với fluoxetine, một chất ức chế tái hấp thu có chọn lọc serotonin (SSRI), kết quả là nồng độ huyết tương tăng dần của Desloratadin và 3-hydroxydesloratadin, nhưng không thấy có biểu hiện lâm sàng nào liên quan đến tương tác với desloratadin trong các nghiên cứu lâm sàng.
Cimetidine
Trong những nghiên cứu lâm sàng có kiểm soát cho thấy Desloratadin uống kết hợp với cimetidin, một chất đối kháng có thụ thể histamine H2, kết quả là nồng độ huyết tương tăng dần của Desloratadin và 3-hydroxydesloratadin, nhưng không thấy có biểu hiện lâm sàng nào liên quan đến tương tác với desloratadin trong các nghiên cứu lâm sàng.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193661000031'), 'Siro', '1 chai x 60ml', 'Giảm triệu chứng của dị ứng bao gồm viêm mũi và mày đay mạn tính.', 'Bệnh nhân quá mẫn hay dị ứng với bất cứ thành phần nào của thuốc.
Trẻ em dưới 2 tuổi.', 'Loạn nhịp thất nặng đã xảy ra khi điều trị với một số thuốc kháng thụ thể histamin H1 thế hệ 2. Điều đó không xuất hiện khi điều trị bằng loratadine. Khi sử dụng loratadine với liều lớn hơn 10 mg hàng ngày, những tác dụng không mong muốn sau đây có thể xảy ra:
Thường gặp (1/100 ≤ ADR
Thần kinh: Đau đầu.
Tiêu hóa: Khô miệng.
Ít gặp (1/1000 ≤ ADR
Thần kinh: Chóng mặt.
Hô hấp: Khô mũi và hắt hơi.
Khác: Viêm kết mạc.
Hiếm gặp (1/10.000 ≤ ADR
Thần kinh: Trầm cảm.
Tim mạch: Tim đập nhanh, loạn nhịp nhanh trên thất, hồi hộp.
Tiêu hóa: Buồn nôn.
Chuyển hóa: Chức năng gan bất thường, kinh nguyệt không đều.
Khác: Ngoại ban, nổi mày đay và choáng phản vệ.', 'Lorastad Sp được dùng bằng đường uống, sử dụng muỗng 5 ml kèm theo trong hộp để đong thể tích.
- Người lớn và trẻ em trên 12 tuổi: 10 ml x 1 lần/ ngày (= 2 muỗng x 1 lần/ ngày).
- Trẻ em từ 2 -12 tuổi:
+ 2-5 tuổi: 5 ml/ ngày (= 1 muỗng/ ngày).
+ 6-12 tuổi: 10 ml/ ngày (= 2 muỗng/ ngày).
- Người bị suy gan hoặc suy thận nặng (độ thanh thải creatinin
+ Người lớn và trẻ em từ 6 tuổi trở lên: Liều khởi đầu 10 ml/ lần (= 2 muỗng/ lần), 2 ngày một lần.
+ Trẻ em từ 2 tuổi đến dưới 6 tuổi: Liều 5 ml/ lần (= 1 muỗng/ lần), 2 ngày một lần.
- Quá liều
Triệu chứng
Người lớn: Buồn ngủ, nhịp tim nhanh và đau đầu (dùng liều 40 -180 mg loratadine).
Trẻ em: Biểu hiện ngoại tháp và hồi hộp (dùng quá 10 mg).
Điều trị
Điều trị quá liều loratadine thông thường bao gồm điều trị triệu chứng và điều trị hỗ trợ, được tiến hành ngay và duy trì đến khi cần thiết.
Trường hợp quá liều cấp loratadine, nên làm rỗng dạ dày ngay bằng cách dùng siro ipeca gây nôn. Uống than hoạt sau khi gây nôn có thể có hiệu quả ngăn chặn sự hấp thu của loratadine. Nếu gây nôn không có hiệu quả hoặc bị chống chỉ định (như với bệnh nhân hôn mê, đang co giật), có thể tiến hành súc rửa dạ dày bằng dung dịch NaCI 0,9% nếu có ống đặt nội khí quản để ngăn ngừa việc hít vào phổi các chất trong dạ dày. Nước muối có tác dụng pha loãng nhanh chóng các chất chứa trong ruột.', 'Bảo quản trong bao bì kín, tránh ánh sáng. Nhiệt độ không quá 30°C.', '- Thận trọng khi sử dụng
Suy gan.
Khi dùng loratadine, có nguy cơ khô miệng, đặc biệt ở người cao tuổi, và tăng nguy cơ sâu răng. Do đó, cần phải vệ sinh răng miệng sạch sẽ khi dùng loratadine.
- Thai kỳ và cho con bú
Tính an toàn khi sử dụng các chế phẩm loratadine trong khi mang thai chưa được xác định, do đó, chỉ dùng thuốc nếu lợi ích điều trị cao hơn nguy cơ xảy ra cho bào thai với liều thấp nhất có thể và trong thời gian ngắn nhất.
Do loratadine và chất chuyển hóa còn hoạt tính là desloratadine được bài tiết qua sữa mẹ và vì nguy hại của thuốc kháng histamin gia tăng trên trẻ em, đặc biệt trẻ sơ sinh và trẻ sinh non, nên quyết định ngưng cho con bú hoặc ngưng dùng thuốc.
- Khả năng lái xe và vận hành máy móc
Trong các thử nghiệm lâm sàng cho thấy không có sự suy giảm khả năng lái xe ở những bệnh nhân dùng loratadine. Tuy nhiên, bệnh nhân phải được thông báo có một số ít người đã bị buồn ngủ, điều này có thể ảnh hưởng đến khả năng lái xe hay vận hành máy móc.
- Tương tác thuốc
Tương tác của thuốc
Điều trị đồng thời loratadine và cimetidin dẫn đến tăng nồng độ loratadine trong huyết tương 60%, do cimetidin ức chế chuyển hóa của loratadine. Điều này không có biểu hiện lâm sàng.
Điều trị đồng thời loratadine và ketoconazol dẫn đến tăng nồng độ loratadine trong huyết tương gấp 3 lần, do ức chế CYP3A4. Điều đó không có biểu hiện lâm sàng vì loratadine có chỉ số điều trị rộng.
Điều trị đồng thời loratadine và erythromycin dẫn đến tăng nồng độ loratadine trong huyết tương. AUC (diện tích dưới đường cong của nồng độ theo thời gian) của loratadine, tăng trung bình 40% và AUC của descarboethoxyloratadine tăng trung bình 46% so với điều trị loratadine đơn độc. Trên điện tâm đồ không có thay đổi về khoảng QTc. Về mặt lâm sàng, không có biểu hiện sự thay đổi tính an toàn của loratadine, và không có thông báo về tác dụng an thần hoặc hiện tượng ngất khi điều trị đồng thời 2 thuốc này.
Tương kỵ của thuốc
Do không có các nghiên cứu về tính tương kỵ của thuốc, không trộn lẫn thuốc này với các thuốc khác.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193661000027'), 'Siro', '1 chai x 50ml', 'Viêm mũi dị ứng theo mùa:
Neocilor siro được chỉ định để giảm các triệu chứng liên quan đến mũi hoặc không liên quan đến mũi của bệnh viêm mũi dị ứng theo mùa.
Viêm mũi dị ứng quanh năm:
Neocilor siro được chỉ định để giảm nhẹ các triệu chứng liên quan đến mũi hoặc không liên quan đến mũi của bệnh viêm mũi dị ứng quanh năm.
Bệnh mày đay mãn tính tự phát:
Neocilor siro được chỉ định để giảm triệu chứng ngứa, giảm số lượng phát ban ngoài da.', 'Desloratadin chống chỉ định trên bệnh nhân mẫn cảm hoặc có phản ứng đặc biệt với desloratadin, với loratadin hoặc bất kỳ tá dược nào của thuốc.', '- Nhìn chung desloratadin được dung nạp tốt. Những phản ứng phụ thường thấy được ghi nhận trong suốt thời gian điều trị bằng desloratadin là: mệt mỏi, nhức đầu, khô miệng.
- Các phản ứng hiếm gặp khác: Hoa mắt, buồn ngủ, mất ngủ, mạch nhanh, đánh trống ngực, đau bụng, buồn nôn, nôn, khó tiêu, tiêu chảy, tăng men gan, tăng bilirubin, viêm gan, đau cơ, phản ứng quá mẫn (phản vệ, phù mạch, khó thở, ngứa, ban đỏ và nổi mề đay).', 'Thuốc này chỉ dùng theo sự kê đơn của thầy thuốc.
- Trẻ từ 6 tháng - 11 tháng: 1mg desloratadin/ 2,0ml/ 1 ngày.
- Trẻ từ 12 tháng - 5 tuổi: 1,25mg desloratadin/ 2,5ml (thìa cà phê)/ 1 ngày.
- Trẻ từ 6 tuổi - 11 tuổi: 2,5mg desloratadin/ 5ml (2 thìa cà phê)/ 1 ngày.
- Người lớn và trẻ từ 12 tuổi trở lên: 5mg desloratadin/ 10ml (4 thìa cà phê)/ 1 ngày.
- Bệnh nhân suy thận hoặc suy gan: trên bệnh nhân suy thận hoặc suy gan liều khởi đầu khuyên dùng là 5mg/ 10ml (4 thìa cà phê)/ cách ngày dựa trên các thông số dược động học.
- Dùng trong hoặc sau bữa ăn.
- Quá liều
Trong trường hợp quá liều, cần dùng những phương pháp chuẩn để loại bỏ hoạt chất chưa có hấp thu. Có thể điều trị triệu chứng và điều trị hỗ trợ. Dựa trên thử nghiệm lâm sàng đa liều, trong đó sử dụng một lượng desloratadin lên đến 45mg (gấp 9 lần liều điều trị), không có hậu quả lâm sàng nào được ghi nhận. Desloratadin không bị thải trừ khi thẩm phân máu, chưa biết rõ thuốc có bị thải trừ khi thẩm phân màng bụng hay không.', 'Bảo quản siro', '- Thận trọng khi sử dụng
Hiệu quả và an toàn của NEOCILOR Syrup trên trẻ em dưới 6 tháng tuổi chưa được xác lập. Trong trường hợp suy thận nặng, desloratadin có thể được sử dụng thận trọng. Bệnh nhân gặp vấn đề di truyền không dung nạp galactose, bệnh nhân thiếu men lactase hoặc hấp thu glucose-galactose kém không nên dùng thuốc này.
- Thai kỳ và cho con bú
Phụ nữ có thai: Chưa có những nghiên cứu đầy đủ và được kiểm soát tốt khi sử dụng desloratadin trên phụ nữ có thai. Không nên dùng desloratadin trong thai kỳ trừ khi lợi ích điều trị mong đợi cho người mẹ vượt trội những nguy cơ có thể xảy ra đối với thai nhi.
Phụ nữ cho con bú: Desloratadin có thể qua sữa mẹ, do đó, cần quyết định có nên ngưng thuốc trong thời gian cho con bú hay không, cần lưu ý về tầm quan trọng của thuốc cho người mẹ.
- Khả năng lái xe và vận hành máy móc
Trong nghiên cứu lâm sàng về khả năng lái xe, không có trường hợp xấu nào xảy ra ở bệnh nhân sử dụng desloratadin. Tuy nhiên, bệnh nhân cần được thông báo về những triệu chứng hiếm gặp như buồn ngủ, điều này có thể ảnh hưởng đến khả năng lái xe vận hành máy móc.
- Tương tác thuốc
Không có tương tác lâm sàng nào được ghi nhận trong các thử nghiệm liên quan đến tương tác thuốc giữa desloratadin khi dùng chung với erythromycin hoặc ketoconazol. Trong thử nghiệm dược lý - lâm sàng, dùng chung desloratadin với rượu cho thấy thuốc không làm tăng cường tác dụng ức chế của rượu trên hệ thần kinh.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193686000098'), 'Viên nang cứng', '10 vỉ x 10 viên', 'Các trường hợp nhiễm trùng do vi khuẩn nhạy cảm:
- Nhiễm khuẩn đường hô hấp trên, viêm xoang, viêm tai giữa.
- Nhiễm khuẩn đường hô hấp dưới do liên cầu khuẩn, phế cầu khuẩn, tụ cầu khuẩn không tiết penicillinase và H. influenzae.
- Nhiễm khuẩn đường tiết niệu không biến chứng.
- Bệnh lậu.
- Nhiễm khuẩn đường mật.
- Nhiễm khuẩn da, cơ do liên cầu khuẩn, tụ cầu khuẩn, E. coli nhạy cảm với amoxicillin.
- Nhiễm Chlamydia trachomatis đường tiết niệu sinh dục ở người mang thai không dung nạp được erythromycin.
- Viêm dạ dày - ruột (bao gồm viêm ruột do Salmonella, không do lỵ trực khuẩn), viêm màng trong tim (đặc biệt để dự phòng ở bệnh nhân phẫu thuật hoặc nhổ răng), sốt thương hàn và sốt phó thương hàn.
- Phối hợp với các thuốc khác trong điều trị nhiễm H. pylori ở bệnh nhân loét dạ dày tá tràng.', 'Người bệnh có tiền sử dị ứng với bất kỳ loại penicillin nào hay bất kỳ thành phần của thuốc.', '- Thường gặp: Ngoại ban (xuất hiện chậm sau 7 ngày điều trị), buồn nôn, nôn, đau thượng vị, tiêu chảy ở người lớn, tỷ lệ cao hơn ở trẻ em và người cao tuổi (phân lỏng ở 42% trẻ em dưới 8 tháng, 20% ở trẻ em từ 8 -16 tháng và 8,5% ở trẻ em 24 - 36 tháng).
- Ít gặp: Ban đỏ, ban dát sần và mề đay, đặc biệt là hội chứng Stevens - Johnson.
- Hiếm gặp: Tăng nhẹ SGOT (AST), kích động, vật vã, lo lắng, mất ngủ, lú lẫn, thay đổi ứng xử và/hoặc chóng mặt, viêm đại tràng có màng giả do Clostridium difficile; viêm tiểu kết tràng cấp với triệu chứng đau bụng và đi ngoài ra máu, không liên quan đến Clostridium difficile, thiếu máu, giảm tiểu cầu, ban xuất huyết giảm tiểu cầu, tăng bạch cầu ưa eosin, giảm bạch cầu, mất bạch cầu hạt.
Hướng dẫn cách xử trí ADR
Những phản ứng không mong muốn của amoxicillin ở đường tiêu hóa, ở máu thường mất đi khi ngừng điều trị. Khi viêm đại tràng có màng giả nặng, cần bồi phụ nước, điện giải và protein; điều trị bằng metronidazol và vancomycin đường uống.
Mề đay, các dạng ban khác và những phản ứng giống bệnh huyết thanh có thể điều trị bằng kháng histamin, và nếu cần, dùng liệu pháp corticosteroid toàn thân. Tuy nhiên khi phản ứng như vậy xảy ra, phải ngừng dùng amoxicillin, trừ khi có ý kiến của thầy thuốc trong những trường hợp đặc biệt, nguy hiểm đến tính mạng mà chỉ có amoxicillin mới giải quyết được.
Nếu phản ứng dị ứng xảy ra như ban đỏ, phù Quincke, sốc phản vệ, hội chứng Stevens - Johnson, phải ngừng liệu pháp amoxicillin và ngay lập tức điều trị cấp cứu bằng adrenalin, thở oxy, liệu pháp corticoid tiêm tĩnh mạch và thông khí, kể cả đặt nội khí quản và không bao giờ được điều trị bằng penicillin hoặc cephalosporin nữa. Thông báo cho bác sĩ những tác dụng không mong muốn gặp phải khi sử dụng thuốc.', 'Dùng uống trước hoặc sau bữa ăn.
Nhiễm vi khuẩn nhạy cảm ở tai, mũi, họng, da, đường tiết niệu:
- Người lớn: Nhiễm khuẩn nhẹ, vừa: 1 viên 500mg x 2 lần/ngày; nhiễm khuẩn nặng: 1 viên 500mg x3 lần/ngày.
- Trẻ em ≥ 40 kg: nhiễm khuẩn nhẹ, vừa: 25mg/kg/ngày cách 12 giờ/lần; nhiễm khuẩn nặng: 40 - 45mg/kg/ngày cách 8 giờ/lần.
Nhiễm Helicobacter pylori:
- Người lớn: 2 viên 500mg phối hợp với clarithromycin 500mg và omeprazol 20mg (hoặc lansoprazol 30mg) uống 2 lần/ngày; trong 7 ngày. Sau đó, uống 20mg omeprazol (hoặc 30mg lansoprazol) mỗi ngày trong 3 tuần nữa nếu bị loét tá tràng tiến triển, hoặc 3 - 5 tuần nữa nếu bị loét dạ dày tiến triển.
Dự phòng viêm nội tâm mạc nhiễm khuẩn:
- Người lớn: Một liều duy nhất 2g, uống 1 giờ trước khi làm thủ thuật.
- Trẻ em ≥ 10kg: Một liều duy nhất 50 mg/kg, uống 1 giờ trước khi làm thủ thuật.
Viêm khớp, không kèm theo rối loạn thần kinh do bệnh Lyme:
- Người lớn: 500 mg/lần, 3 lần/ngày trong 28 ngày.
- Trẻ em ≥ 30kg: 50 mg/kg/ngày chia làm 3 lần (tối đa 1.5 g/ngày).
* Đối với người suy thận, phải giảm liều theo hệ số thanh thải creatinin:
- Clcr - Clcr: 10-30 ml/phút: 250 - 500 mg/12 giờ phụ thuộc vào mức độ nặng của nhiễm khuẩn.
Bệnh nhân thẩm phân máu:
250 - 500mg/24 giờ phụ thuộc vào mức độ nặng của nhiễm khuẩn và một liều bổ sung trong và sau mỗi giai đoạn thẩm phân.
- Quá liều
- Triệu chứng tâm thần kinh, thận (tiểu ra tinh thể) và rối loạn tiêu hóa.
- Xử trí: Không có thuốc giải độc đặc hiệu, có thể loại bỏ amoxicillin bằng thẩm phân máu. Điều trị triệu chứng, đặc biệt chú ý đến cân bằng nước-điện giải.', 'nhiệt độ dưới 30°C, tránh ánh sáng.', '- Thận trọng khi sử dụng
Phải định kỳ kiểm tra chỉ số huyết học, chức năng gan, thận trong suốt quá trình điều trị dài ngày.
Có thể xảy ra phản ứng quá mẫn trầm trọng ở những bệnh nhân có tiền sử dị ứng với penicillin hoặc các dị nguyên khác, nên trước khi bắt đầu điều trị bằng amoxicillin cần phải điều tra kỹ tiền sử dị ứng với penicillin, cephalosporin và các dị nguyên khác.
Dùng liều cao amoxicillin cho người suy thận hoặc người có tiền sử co giật, động kinh có thể gây co giật, tuy hiếm gặp.
Trong trường hợp suy thận, phải điều chỉnh liều theo hệ số thanh thải creatinin hoặc creatinin huyết.
Tiểu ít là một nguy cơ để thuốc kết tinh, phải uống nhiều nước khi dùng thuốc.
Trong điều trị bệnh Lyme, cần chú ý có thể xảy ra phản ứng Jarisch-Herxheimer.
Có nguy cơ phát ban cao ở bệnh nhân tăng bạch cầu đơn nhân nhiễm khuẩn.
- Thai kỳ và cho con bú
Chỉ sử dụng thuốc này khi thật cần thiết trong thời kỳ mang thai. Tuy nhiên, chưa có bằng chứng nào về tác dụng có hại cho thai nhi khi dùng amoxicillin cho người mang thai. Amoxicillin là thuốc được lựa chọn để điều trị nhiễm Chlamydia và điều trị bệnh than ngoài da hoặc đề phòng sau khi tiếp xúc với bào tử Bacillus anthracis ở phụ nữ mang thai.
Amoxicillin bài tiết vào sữa mẹ, tuy nhiên lượng thuốc trong sữa rất ít và an toàn cho trẻ sơ sinh ở liều thường dùng, nên có thể dùng cho phụ nữ thời kỳ cho con bú, theo dõi chặt chẽ trẻ nhỏ khi dùng.
- Khả năng lái xe và vận hành máy móc
Thuốc Amoxicillin 500mg có thể gây tác dụng chóng mặt (hiếm gặp). Thận trọng khi lái xe và vân hành máy móc.
- Tương tác thuốc
Nifedipin làm tăng hấp thu amoxicillin.
Bệnh nhân tăng acid uric máu khi dùng allopurinol cùng với amoxicillin sẽ làm tăng khả năng phát ban của amoxicillin.
Có thể có đối kháng giữa chất diệt khuẩn amoxicillin và các chất kìm khuẩn như acid fusidic, cloramphenicol, tetracyclin.
Methotrexat: Amoxicillin làm giảm bài tiết methotrexat, tăng độc tính trên đường tiêu hóa và hệ tạo máu.
Thuốc tránh thai dạng uống: Amoxicillin có khả năng làm giảm tác dụng tránh thai.
Vắc xin thương hàn: Amoxicillin làm giảm tác dụng của vắc xin.
Warfarin: Các nghiên cứu không chứng minh được có tương tác nhưng kinh nghiệm cho thấy tác dụng chống đông có ảnh hưởng khi dùng đồng thời warfarin với amoxicillin.
Probenecid khi uống ngay trước hoặc đồng thời với amoxicillin làm giảm thải trừ amoxicillin, từ đó làm tăng nồng độ Cmax và thời gian bán thải lên 30 - 60%, tăng diện tích dưới đường cong nồng độ theo thời gian (AUC) lên 60%, từ đó làm tăng nồng độ thuốc trong máu.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193685000026'), 'Bột pha hỗn dịch uống', '1 hộp x 12 gói', 'Nên sử dụng Augmentin theo hướng dẫn kê toa thuốc kháng sinh chính thức và dữ liệu về tính nhạy cảm của các kháng sinh tại địa phương.
Augmentin được chỉ định điều trị ngắn hạn các nhiễm khuẩn gây bởi các vi khuẩn nhạy cảm với amoxicillin-clavulanate, ở các vị trí dưới đây:
- Nhiễm khuẩn đường hô hấp trên (gồm cả tai-mũi-họng) như viêm amidan tái phát, viêm xoang, viêm tai giữa, điển hình gây bởi Streptococcus pneumoniae, Haemophilus influenzae*, Moraxella catarrhalis* và Streptococcus pyogenes.
- Nhiễm khuẩn đường hô hấp dưới như đợt cấp của viêm phế quản mạn, viêm phổi thùy và viêm phế quản phổi, điển hình gây bởi Streptococcus pneumoniae, Haemophilus influenzae* và Moraxella catarrhalis*.
- Nhiễm khuẩn đường niệu-sinh dục như viêm bàng quang, viêm niệu đạo, viêm thận-bể thận, nhiễm khuẩn sinh dục nữ, điển hình gây bởi Enterobacteriaceae* (chủ yếu Escherichia coli), Staphylococcus saprophyticus và Enterococcus species và bệnh lậu do Neisseria gonorrhoeae*.
- Nhiễm khuẩn da và mô mềm điển hình gây bởi Staphylococcus aureus*, Streptococcus pyogenes và Bacteroides species*.
- Nhiễm khuẩn xương và khớp như viêm tủy xương, điển hình gây bởi Staphylococcus aureus*, thường phải điều trị kéo dài.
- Các nhiễm khuẩn khác như nạo/sẩy thai nhiễm khuẩn, nhiễm khuẩn sau đẻ, nhiễm khuẩn trong ổ bụng.
*Một số vi khuẩn thuộc những loài này sinh beta-lactamase, khiến chúng không nhạy cảm với riêng amoxicillin (xem đặc tính dược học, dược lực học để thêm thông tin).
Tính nhạy cảm của vi khuẩn với AUGMENTIN sẽ thay đổi theo địa lý và thời gian. Nên tham khảo dữ liệu về tính nhạy cảm của các vi khuẩn tại địa phương nếu có sẵn, và tiến hành lấy mẫu vi sinh và xét nghiệm về tính nhạy cảm nếu cần.
Nhiễm khuẩn gây bởi các chủng nhạy cảm với amoxicillin có thể được điều trị khỏi bởi AUGMENTIN nhờ thành phần amoxicillin. Nhiễm khuẩn hỗn hợp gây bởi các chủng nhạy cảm với amoxicillin kết hợp với chủng sinh beta-lactamase nhạy cảm với amoxicillin-clavulanate có thể được điều trị bằng AUGMENTIN.', '- Ở những bệnh nhân có tiền sử quá mẫn với beta-lactam, ví dụ các penicillin và cephalosporin.
- Ở bệnh nhân có tiền sử quá mẫn với beta-lactam, ví dụ các penicillin và cephalosporin, có tiền sử vàng da/rối loạn chức năng gan liên quan đến amoxicillin-clavulanate.', 'Dữ liệu từ các thử nghiệm lâm sàng lớn đã được sử dụng để xác định tần suất của tác dụng không mong muốn từ rất phổ biến đến hiếm. Tần suất quy định cho tất cả các tác dụng không mong muốn khác (ví dụ, xuất hiện dưới 1/10.000) được xác định chủ yếu từ các số liệu sau khi thuốc lưu hành và nhằm nói đến tỷ lệ báo cáo hơn là tần suất thực.
Quy ước dưới đây được sử dụng để phân loại tần suất:
Rất phổ biến > 1/10.
Phổ biến > 1/100 và Không phổ biến > 1/1000 và Hiếm > 1/10.000 và Rất hiếm Nhiễm khuẩn và nhiễm kí sinh trùng:
Phổ biến: Nhiễm nấm Candida trên da và niêm mạc.
Rối loạn hệ máu và bạch huyết:
Hiếm: Giảm bạch cầu có hồi phục (kể cả giảm bạch cầu trung tính) và giảm tiểu cầu.
Rất hiếm: Mất bạch cầu hạt có hồi phục và thiếu máu tan máu. Kéo dài thời gian chảy máu và thời gian prothrombin.
Rối loạn hệ miễn dịch:
Rất hiếm: Phù mạch thần kinh, phản vệ, hội chứng giống bệnh huyết thanh, viêm mạch quá mẫn.
Rối loạn hệ thần kinh:
Không phổ biến: Chóng mặt đau đầu.
Rất hiếm chứng tăng động có hồi phục và co giật. Có thể xuất hiện co giật ở những bệnh nhân suy giảm chức năng thận hoặc dùng liều cao.
Rối loạn đường tiêu hóa:
Người lớn:
Rất phổ biến: Tiêu chảy.
Phổ biến: Buồn nôn, nôn.
Trẻ em:
Phổ biến: Tiêu chảy, buồn nôn, nôn.
Mọi đối tượng:
Buồn nôn thường xuất hiện hơn khi uống những liều cao. Nếu có dấu hiệu của các phản ứng trên đường tiêu hóa, có thể uống AUGMENTIN vào đầu bữa ăn để làm giảm nhanh phản ứng này.
Không phổ biến: Khó tiêu.
Rất hiếm: Viêm đại tràng do kháng sinh (kể cả viêm đại tràng giả mạc và viêm đại tràng xuất huyết). (Xem Cảnh báo và Thận trọng)
Lưỡi lông đen.
Rất hiếm có các báo cáo về thay đổi màu răng ở trẻ. Vệ sinh răng miệng tốt có thể phòng tránh thay đổi màu răng.
Rối loạn gan mật:
Không phổ biến đã ghi nhận tăng vừa phải AST và/hoặc ALT ở những bệnh nhân điều trị với kháng sinh nhóm beta-lactam, nhưng chưa biết ý nghĩa của những phát hiện này.
Rất hiếm: Viêm gan và vàng da ứ mật những biến cố này đã được ghi nhận khi sử dụng các penicillin và cephalosporin khác. Những biến cố về gan chủ yếu được báo cáo ở nam giới và bệnh nhân cao tuổi và có thể liên quan đến thời gian điều trị kéo dài.
Trẻ em:
Rất hiếm có báo cáo về những biến cố này ở trẻ em.
Mọi đối tượng:
Các dấu hiệu và triệu chứng thường xuất hiện trong hoặc ngay sau khi điều trị nhưng một số trường hợp có thể không trở nên rõ ràng cho đến vài tuần sau khi ngừng thuốc. Các biến cố này thường hồi phục. Những biến cố trên gan có thể nặng và trong một số trường hợp cực hiếm đã có báo cáo tử vong. Hầu hết các trường hợp này thường xảy ra ở những bệnh nhân đang bị bệnh nặng tiềm ẩn hoặc đang dùng những thuốc đã biết có khả năng ảnh hưởng đến gan.
Rối loạn da và mô dưới da:
Không phổ biến: Ban trên da, ngứa, mày đay.
Hiếm: Hồng ban đa dạng.
Rất hiếm: Hội chứng Stevens-Johnson, hoại tử thượng bì nhiễm độc, viêm da bóng nước bong vảy và mụn mủ ngoại ban toàn thân cấp tính (AGEP).
Nên ngừng điều trị nếu có bất kỳ phản ứng viêm da quá mẫn nào xảy ra.
Rối loạn thận và tiết niệu:
Rất hiếm: Viêm thận kẽ, tinh thể niệu (xem Quá liều)
Thông báo cho bác sĩ những tác dụng không mong muốn gặp phải khi dùng thuốc.', 'Liều phụ thuộc vào tuổi, cân nặng và chức năng thận của bệnh nhân và mức độ nặng của nhiễm khuẩn.
Liều dùng được thể hiện theo cả thành phần amoxicillin-clavulanate ngoại trừ khi được nêu rõ theo liều của từng thành phần riêng rẽ.
Uống thuốc vào đầu bữa ăn để hạn chế tối đa khả năng không dung nạp qua đường tiêu hóa.
Sự hấp thu của AUGMENTIN là tối ưu khi uống thuốc vào đầu bữa ăn.
Không nên điều trị quá 14 ngày mà không kiểm tra lại.
Có thể bắt đầu điều trị bằng đường tiêm truyền và tiếp nối bằng đường uống.
Người lớn:
Nhiễm khuẩn nhẹ tới vừa
1000/125mg x 2 lần/ngày.
Nhiễm khuẩn nặng (bao gồm nhiễm khuẩn đường tiết niệu tái phát và mạn tính, nhiễm khuẩn đường hô hấp dưới)
1000/125mg 3 lần/ngày.
Trẻ em:
Liều dùng được thể hiện theo tuổi của trẻ hoặc dưới dạng mg/kg/ngày (chia 2 hoặc 3 lần mỗi ngày).
Trẻ em nặng từ 40kg trở lên nên được kê toa theo khuyến cáo dành cho người lớn.
Trẻ em dưới 12 tuổi:
Liều khuyến cáo:
40mg/5mg/kg/ngày tới 80mg/10mg/kg/ngày (không quá 3000mg/375mg mỗi ngày) chia 3 lần, tùy thuộc vào mức độ nặng của nhiễm khuẩn.
Thời gian điều trị tùy thuộc vào đáp ứng của bệnh nhân. Một số loại nhiễm khuẩn (ví dụ như viêm tủy xương) cần thời gian điều trị dài hơn.
Trẻ sinh non:
Không có liều khuyến cáo dùng cho trẻ sinh non.
Người già:
Không cần chỉnh liều; dùng liều như người lớn. Nếu có dấu hiệu suy thận, nên điều chỉnh liều dùng theo bệnh nhân suy thận.
Suy thận:
Không cần điều chỉnh liều ở bệnh nhân có độ thanh thải creatinin (CrCl) lớn hơn 30ml/phút
Ở bệnh nhân có độ thanh thải creatinin dưới 30ml/phút, không khuyến cáo dùng AUGMENTIN với tỷ lệ amoxicillin và acid clavulanic là 8:1, do không có khuyến cáo điều chỉnh liều.
Thẩm phân máu:
Gói AUGMENTIN 250mg/31,25mg dạng bột pha hỗn dịch uống chỉ nên dùng cho bệnh nhân có độ thanh thải creatinin cao hơn 30ml/phút.
Thận trọng khi kê toa; nên định kì kiểm tra chức năng gan. Không đủ dữ liệu để đưa ra liều khuyến cáo.
- Quá liều
Triệu chứng và dấu hiệu
Các triệu chứng trên đường tiêu hóa và rối loạn cân bằng nước điện giải có thể là biểu hiện của quá liều.
Đã quan sát thấy tinh thể amoxicillin niệu, trong một số trường hợp dẫn đến suy thận (xem Cảnh báo và Thận trọng).
Điều trị
Có thể điều trị triệu chứng cho các biểu hiện trên đường tiêu hóa với lưu ý về cân bằng nước và điện giải.
AUGMENTIN có thể được loại bỏ khỏi vòng tuần hoàn bằng thẩm phân máu.
Trẻ em
Một nghiên cứu tiến cứu trên 51 bệnh nhi tại một trung tâm chống độc đã cho thấy quá liều tới dưới 250mg/kg amoxicillin không đi kèm những triệu chứng lâm sàng đáng kể và không cần làm sạch dạ dày.
Lạm dụng và phụ thuộc thuốc:
Chưa có báo cáo về phụ thuộc thuốc, nghiện hay lạm dụng đối với thuốc này.', 'Bảo quản', '- Thận trọng khi sử dụng
Nên hỏi kỹ tiền sử về phản ứng quá mẫn với penicillin, cephalosporin hoặc các dị nguyên khác trước khi khởi đầu điều trị bằng augmentin.
Đã có báo cáo về các phản ứng quá mẫn (dạng phản vệ) nặng và đôi khi gây tử vong ở những bệnh nhân điều trị bằng penicillin. Các phản ứng này thường xảy ra hơn ở những bệnh nhân có tiền sử quá mẫn với penicillin. Nếu phản ứng dị ứng xảy ra, nên ngừng điều trị bằng AUGMENTIN và thay thế bằng liệu pháp điều trị thích hợp. Phản ứng dạng phản vệ nghiêm trọng cần được cấp cứu ngay lập tức với adrenalin. Oxy, steroid tiêm tĩnh mạch và xử lý đường thở, bao gồm đặt nội khí quản cũng có thể cần thiết.
Nên tránh sử dụng AUGMENTIN nếu nghi ngờ tăng bạch cầu đơn nhân nhiễm khuẩn do sự xuất hiện của ban dạng sởi liên quan đến tình trạng này sau khi dùng amoxicillin.
Sử dụng kéo dài đôi khi có thể gây tăng sinh các vi khuẩn không nhạy cảm. Viêm đại tràng giả mạc đã được báo cáo khi dùng kháng sinh và với mức độ nghiêm trọng từ nhẹ đến đe dọa tính mạng. Do đó, cân nhắc chẩn đoán này rất quan trọng ở những bệnh nhân xuất hiện tiêu chảy trong hoặc sau khi dùng kháng sinh. Nếu tiêu chảy nhiều hoặc kéo dài hoặc bệnh nhân bị đau quặn bụng, nên ngừng điều trị ngay lập tức và kiểm tra bệnh nhân thêm.
Nhìn chung, AUGMENTIN dung nạp tốt và có độc tính thấp đặc trưng của kháng sinh nhóm penicillin. Nên kiểm tra định kỳ chức năng các cơ quan, bao gồm gan, thận và chức năng tạo máu khi điều trị kéo dài.
Hiếm có báo cáo kéo dài bất thường thời gian prothrombin (INR tăng) ở những bệnh nhân dùng AUGMENTIN và các thuốc chống đông máu dùng đường uống. Nên theo dõi thích hợp khi các thuốc chống đông máu được kê toa đồng thời. Có thể cần điều chỉnh liều các thuốc chống đông máu dùng đường uống để duy trì mức độ chống đông mong muốn.
Nên thận trọng khi sử dụng AUGMENTIN trên bệnh nhân có dấu hiệu suy giảm chức năng gan.
Ở bệnh nhân suy thận, nên điều chỉnh liều theo mức độ suy thận (xem liều lượng và cách dùng - Suy thận).
Đã quan sát thấy tinh thể niệu ở những bệnh nhân giảm bài tiết nước tiểu nhưng rất hiếm, chủ yếu gặp khi bệnh nhân dùng đường tiêm truyền. Nên khuyên bệnh nhân uống đủ nước để duy trì lượng nước tiểu đào thải trong thời gian dùng amoxicillin liều cao để làm giảm khả năng xuất hiện tinh thể amoxicillin niệu (xem Quá liều).
AUGMENTIN gói, có chứa aspartame, là một nguồn của phenylalanine và do đó nên dùng thận trọng ở bệnh nhân bị phenylceton niệu.
- Thai kỳ và cho con bú
Thai kỳ:
Những nghiên cứu về khả năng sinh sản trên động vật (chuột nhắt và chuột cống với liều cao tới 10 lần liều dùng cho người) khi dùng AUGMENTIN đường uống và tiêm truyền không cho thấy tác dụng sinh quái thai. Trong một nghiên cứu đơn ở những phụ nữ sinh non do vỡ màng ối sớm (pPROM), đã có báo cáo về việc điều trị dự phòng với AUGMENTIN có thể liên quan đến tăng nguy cơ viêm ruột hoại tử ở trẻ sơ sinh. Cũng như tất cả các thuốc khác, nên tránh dùng thuốc trong thai kỳ, trừ khi bác sĩ cho là cần thiết.
Cho con bú:
Có thể dùng AUGMENTIN trong thời gian cho con bú. Ngoại trừ nguy cơ bị mẫn cảm, liên quan đến việc thuốc được bài tiết một lượng rất ít vào sữa mẹ, chưa biết tác dụng bất lợi nào cho trẻ đang bú mẹ.
- Khả năng lái xe và vận hành máy móc
Chưa tiến hành những nghiên cứu về ảnh hưởng lên khả năng lái xe hoặc vận hành máy móc. Tuy nhiên, các tác dụng không mong muốn có thể xảy ra (ví dụ như phản ứng dị ứng, chóng mặt co giật), gây ảnh hưởng lên khả năng lái xe và vận hành máy móc (xem Tác dụng không mong muốn).
- Tương tác thuốc
Không khuyến cáo sử dụng đồng thời với probenecid. Probenecid làm giảm bài tiết amoxicillin qua ống thận. Sử dụng đồng thời với AUGMENTIN có thể gây tăng và kéo dài nồng độ amoxicillin trong máu nhưng không ảnh hưởng đến acid clavulanic.
Sử dụng đồng thời allopurinol trong khi điều trị với amoxicillin có thể gây tăng khả năng xảy ra các phản ứng dị ứng trên da. Không có dữ liệu về việc sử dụng kết hợp AUGMENTIN với allopurinol.
Cũng giống như các kháng sinh khác, AUGMENTIN có thể ảnh hưởng đến hệ vi khuẩn đường ruột dẫn đến làm giảm tái hấp thu oestrogen và làm giảm hiệu quả của các thuốc tránh thai kết hợp đường uống.
Trong các y văn, hiếm có các trường hợp tăng INR (international normalised ratio) ở những bệnh nhân đang điều trị duy trì với acenocoumarol hoặc warfarin và được kê toa 1 đợt amoxicillin. Nếu cần thiết kê toa đồng thời, nên theo dõi cẩn thận thời gian prothrombin hoặc INR khi dùng thêm hoặc ngưng dùng amoxicillin.
Ở những bệnh nhân đang dùng mycophenolate mofetil, đã có báo cáo về sự giảm nồng độ của chất chuyển hóa có hoạt tính mycophenolic acid (MPA) trong liều trước đó khoảng 50% sau khi bắt đầu dùng amoxicillin đường uống kết hợp acid clavulanic. Sự thay đổi nồng độ liều trước đó có thể không thể hiện chính xác những thay đổi về mức phơi nhiễm MPA tổng thể.
Penicillins có thể làm giảm sự thải trừ methotrexate dẫn tới tăng khả năng gây độc tính.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193686000087'), 'Viên nén bao phim', '2 vỉ x 10 viên', '- Clarithromycin được chỉ định cho người lớn và trẻ em trên 12 tuổi.
- Clarithromycin được chỉ định điều trị trong các trường hợp nhiễm trùng do các vi khuẩn nhạy cảm như:
- Nhiễm trùng đường hô hấp dưới như viêm phế quản cấp tính, mạn tính và viêm phổi.
- Nhiễm trùng đường hô hấp trên như viêm xoang, viêm họng.
- Clarithromycin thích hợp để điều trị ban đầu những nhiễm trùng hô hấp mắc phải ở cộng đồng và đã được chứng minh có hoạt tính in vitro chống lại những tác nhân gây bệnh đường hô hấp thông thường và không điển hình.
- Clarithromycin còn được chỉ định trong nhiễm trùng da và mô mềm từ nhẹ đến trung bình.
- Với sự hiện diện của chất ức chế tiết acid như omeprazol hay lansoprazol, clarithromycin còn được chỉ định trong điều trị tiệt trừ Helicobacter pylori ở những bệnh nhân loét tá tràng.
- Hoạt tính chống Helicobacter pylori của clarithromycin tại pH trung tính mạnh hơn tại pH acid.', '- Bệnh nhân quá mẫn với clarithromycin, erythromycin hay bất kỳ kháng sinh nhóm macrolid khác hoặc bất cứ thành phần nào của thuốc.
- Chống chỉ định sử dụng đồng thời clarithromycin với một số thuốc như terfenadin, astemizol, cisaprid và pimozid vì có thể gây tăng đáng kể nồng độ của những thuốc này trong huyết tương và gây độc tính trên tim nghiêm trọng và/hoặc đe dọa tính mạng.
- Sử dụng đồng thời với các alkaloid cựa lõa mạch (ergotamin, dihydroergotamin) cũng được chống chỉ định vì có khả năng gây độc tính nghiêm trọng.
- Không nên dùng clarithromycin cho bệnh nhân có tiền sử khoảng QT kéo dài hoặc loạn nhịp tâm thất kèm xoắn đỉnh.
- Không nên dùng clarithromycin đồng thời với các chất ức chế HMG-CoA reductase (các statin) được chuyển hóa hầu hết bởi CYP3A4 (lovastatin hoặc simvastatin) vì tăng nguy cơ các bệnh về cơ gồm tiêu cơ vân. Nên ngưng dùng các thuốc trên trong khi điều trị với clarithromycin.
- Không nên dùng clarithromycin cho những bệnh nhân hạ kali máu (nguy cơ kéo dài khoảng ỌT).
- Không dùng clarithromycin cho những bệnh nhân suy gan nặng.', 'Thường gặp (1/100 ≤ ADR
- Tác dụng không mong muốn thường gặp nhất là rối loạn tiêu hóa, đặc biệt là ở người bệnh trẻ với tần suất 5%. Phản ứng dị ứng ở mức độ khác nhau từ mày đay đến phản vệ và hội chứng Stevens-Johnson. Cũng có thể bị viêm đại tràng màng giả từ nhẹ đến đe dọa tính mạng.
- Toàn thân: Phản ứng quá mẫn như ngứa, mày đay, ban da, kích ứng.
ít gặp (1/1.000 ≤ ADR
- Tiêu hóa: Các triệu chứng ứ mật (đau bụng trên, đôi khi đau nhiều), buồn nôn, nôn.
- Gan: Các trị số chức năng gan bất thường, bilirubin huyết thanh tăng và thường kèm theo vàng da, sốt phát ban và tăng bạch cầu ưa eosin.
- Thính giác: Điếc (nếu dùng liều cao) thần kinh giác quan có thể hồi phục.', 'Cách dùng
Clarithromycin STELLA 250mg được dùng qua đường uống và không bị ảnh hưởng bởi thức ăn.
Liều dùng
Bệnh nhân bị nhiễm trùng đường hô hấp/ nhiễm trùng da và mô mềm
- Người lớn và trẻ em trên 12 tuổi: Liều thường dùng là 250 mg ngày 2 lần có thể tăng lên 500mg ngày 2 làn trong trường hợp nhiễm trùng nặng.
- Thời gian điều trị khoảng 14 ngày.
- Không sử dụng Clarithromycin STELLA 250 mg cho trẻ em dưới 12 tuổi.
Trị tiệt trừ Helicobacter pylori ở bệnh nhân loét tá tràng (người lớn và người cao tuổi)
Thời gian điều trị khoảng 14 ngày.
- Phác đồ 3 thuốc: Clarithromycin (500mg) ngày 2 lần, lansoprazol 30mg ngày 2 lần và amoxycillin 1000mg ngày 2 lần.
- Phác đồ 3 thuốc: Clarithromycin (500mg) ngày 2 lần, lansoprazol 30mg ngày 2 lần và metronidazol 400mg ngày 2 lần.
- Phác đồ 3 thuốc: Clarithromycin (500mg) ngày 2 làn, omeprazol 20mg ngày 2 lần, phối hợp với amoxycillin 1000mg ngày 2 lần hoặc metronidazol 400mg ngày 2 lần.
- Phác đồ 3 thuốc: Clarithromycin (500mg) ngày 2 lần, amoxycillin 1000mg ngày 2 lần và omeprazol 20mg ngày 2 lần.
Suy thận: Những bệnh nhân suy thận có độ thanh thải creatinin nhỏ hơn 30 ml/phút nên giảm liều một nửa, 250mg ngày 1 lần hoặc 250mg ngày 2 lần nếu nhiễm trùng nặng. Không điều trị quá 14 ngày.
- Quá liều
- Quá liều clarithromycin có thể gây ra các triệu chứng trên hệ tiêu hóa như đau bụng, nôn, buồn nôn và tiêu chảy.
- Những tác dụng không mong muốn khi quá liều cần được điều trị bằng cách loại thải ngay thuốc chưa hấp thu và điều trị hỗ trợ. Cũng như những kháng sinh macrolid khác, nồng độ trong huyết thanh của clarithromycin không thể được loại trừ bằng phương pháp thẩm phân máu hay thẩm phân màng bụng.', 'Bảo quản trong bao bì kín, nơi khô, tránh ánh sáng. Nhiệt độ không quá 30°C.', '- Thận trọng khi sử dụng
- Chỉ định clarithromycin khi biết rõ không có nhiễm trùng hoặc nghi ngờ nhiễm khuẩn hay để phòng ngừa thì không đem lại lợi ích cho bệnh nhân mà còn làm tăng nguy cơ phát triển nhiều vi khuẩn đề kháng thuốc.
- Clarithromycin được đào thải chủ yếu qua gan và thận. Clarithromycin có thể được dùng mà không cần điều chỉnh liều đối với những bệnh nhân suy gan có chức năng thận bình thường. Tuy nhiên, nếu suy thận nặng có hoặc không kèm theo suy gan thì nên giảm liều hoặc kéo dài thời gian giữa các liều dùng.
- Không sử dụng đồng thời clarithromycin và ranitidin bismuth citrat đối với những bệnh nhân có độ thanh thải creatinin dưới 25 ml/phút và không nên dùng cho những bệnh nhân có tiền sử rối loạn chuyển hóa porphyrin cấp.
- Giống như các thuốc kháng khuẩn khác, clarithromycin có thể gây tăng trưởng quá mức các loại vi khuẩn hoặc nấm không nhạy cảm. Nếu bội nhiễm xảy ra, thay thế bằng liệu pháp thích hợp.
- Ảnh hưởng trên gan: Tăng nồng độ ALT (SGPT), AST (SGOT), y-glutamyl transferase (y-glutamyl transpeptidase, GGT, GGTP), phosphatase kiềm, LDH, và/hoặc tổng lượng bilirubin huyết thanh đã được báo cáo (dưới 1% bệnh nhân) ở những bệnh nhân dùng riêng lẻ clarithromycin hay kẽt hợp điều trị với omeprazol. Gan to và bất thường chức năng gan (như ứ mật, có hoặc không có vàng da) cũng đã được báo cáo trên những bệnh nhân dùng thuốc. Bất thường chức năng gan này có thể nghiêm trọng nhưng thường tự khỏi. Tuy nhiên suy gan dẫn đến hoại tử đã được báo cáo hiếm gặp, chủ yếu trên những bệnh nhân suy gan nặng và/hoặc dùng thuốc kết hợp điều trị.
- Thai kỳ và cho con bú
Phụ nữ có thai
Chưa có nghiên cứu đầy đủ và có kiểm soát trên phụ nữ có thai. Clarithromycin chỉ nên dùng trong thai kỳ khi đã cân nhắc giữa lợi ích và nguy cơ đối với thai nhi.
Phụ nữ cho con bú
Cần thận trọng khi sử dụng clarithromycin cho phụ nữ cho con bú.
- Khả năng lái xe và vận hành máy móc
Chưa có dữ liệu về sự ảnh hưởng của clarithromycin trên khả năng lái xe và vận hành máy móc. Khả năng choáng váng, chóng mặt, lẫn lộn và mất phương hướng có thể xảy ra khi dùng thuốc, nên chú ý trước khi lái xe và vận hành máy móc.
- Tương tác thuốc
Tương tác của thuốc
- Các thuốc được chuyển hóa bởi enzym thuộc vi lạp thể ở gan: sử dụng đồng thời với clarithromycin làm tăng nồng độ trong huyết thanh của các thuốc này, nên theo dõi chặt chẽ nồng độ trong huyết thanh của các thuốc sử dụng đồng thời.
+ Carbamazepin: Thận trọng khi sử dụng với clarithromycin. Nên giảm liều carbamazepin và/hoặc theo dõi nồng độ carbamazepin huyết thanh.
+ Cisaprid: Chống chỉ định dùng đồng thời với clarithromycin. Việc sử dụng đồng thời clarithromycin và/hoặc erythromycin với cisaprid làm kéo dài khoảng QT và gây loạn nhịp tim nặng (nhịp nhanh tâm thất, rung thất, xoắn đỉnh), đã có báo cáo tử vong.
+ Darifenacin: Liều của darifenacin không nên quá 7,5 mg/ngày khi dùng đồng thời với các thuốc ức chế CYP3A4 bao gồm clarithromycin.
+ Disopyramid: Khi dùng đồng thời với clarithromycin nên theo dõi điện tâm đồ và nồng độ disopyramid huyết thanh. Rung thất, kéo dài khoảng QT và tăng thời gian bán thải của disopyramid (40 giờ) đã được báo cáo ở một bệnh nhân dùng liều duy trì disopyramid (200mg ngày 2 lần) và clarithromycin (250mg ngày 2 lần), omeprazol (20mg ngày 2 lần), metronidazol (400mg ngày 2 lần) trong điều trị H. pylori gây loét tá tràng mạn tính. Đã có báo cáo gây xoắn đỉnh khi dùng chung clarithromycin với disopyramid.
+ Erlotinib: Thận trọng khi dùng đồng thời với các thuốc ức chế CYP3A4, bao gồm clarithromycin và xem xét giảm liều erlotinib nếu tác dụng không mong muốn xảy ra.
+ Eszopiclon: Giảm liều eszopiclon khi dùng đồng thời với các thuốc ức chế CYP3A4 bao gồm clarithromycin. Khi bắt đầu điều trị, liều eszopiclon không nên quá 1mg nhưng có thể tăng lên 2mg nếu có chỉ định lâm sàng.
+ Thuốc ức chế hydroxymethylglutaryl-CoA (HMG-CoA) reductase: Clarithromycin làm tăng nồng độ huyết thanh của các thuốc này (lovastatin, simvastatin) do ức chế sự chuyển hóa bởi các isoenzym cytocrom P-450. Tiêu cơ vân đôi khi kèm theo suy thận cấp thứ phát kèm myoglobin niệu hiếm gặp khi điều trị riêng lẻ hay phối hợp với các kháng sinh nhóm macrolid.
+ Pimozid: Chống chỉ định dùng đồng thời với các kháng sinh nhóm macrolid, bao gồm clarithromycin. Các kháng sinh nhóm macrolid như azithromycin, clarithromycin và erythromycin ức chế sự chuyển hóa của pimozid làm tăng nồng độ pimozid huyết thanh. Do pimozid gây kéo dài khoảng QT, tăng nồng độ thuốc trong huyết thanh có thể làm tăng nguy cơ nghiêm trọng trên tim mạch như chứng loạn nhịp tâm thất nguy kịch. Đã có ít nhất hai trường hợp tử vong ở bệnh nhân điều trị đồng thời clarithromycin với pimozid.
+ Rifabutin hoặc rifampin: Làm tăng chuyển hóa clarithromycin khi dùng đồng thời.
+ Terfenadin và astemizol: Kéo dài khoảng QT, ST-U bất thường và nhịp nhanh tâm thất, bao gồm xoắn đỉnh đã được báo cáo ở một số bệnh nhân dùng đồng thời terfenadin và erythromycin.
- Thuốc chống đông máu: Khi dùng đồng thời, clarithromycin có thể làm tăng tác dụng của thuốc chống đông đường uống.
- Thuốc kháng retrovirus
+ Atazanavir: Sử dụng clarithromycin (500mg ngày 2 lần) với atazanavir (400mg ngày 1 lần) làm tăng nồng độ đỉnh trong huyết tương và AUC của clarithromycin, giảm nồng độ đỉnh trong huyết tương và AUC của 14-hydroxyclarithromycin, và làm tăng nồng độ đỉnh trong huyết tương và AUC của atazanavir. Tăng nồng độ của clarithromycin có thể gây kéo dài khoảng QTc.
+ Delavirdin: Sử dụng clarithromycin (500mg ngày 2 lần trong 15 ngày) với delavirdin (300mg ngày 3 lần trong 30 ngày) làm tăng 100% AUC của clarithromycin nhưng không có ảnh hưởng đáng kể đến dược động học của delavirdin.
+ Efavirenz: Dùng clarithromycin (500 mg mỗi 12 giờ) và efavirenz (400 mg mỗi ngày trong 7 ngày) làm giảm nồng độ đỉnh trong huyết tương và AUC của clarithromycin 26% và 39% tương ứng, làm tăng nồng độ đỉnh trong huyết tương và AUC của 14-hydroxyclarithromycin 49% và 34% tương ứng. AUC của efavirenz không bị ảnh hưởng. Sự tương tác dược động học này trên lâm sàng chưa được biết.
Trong các nghiên cứu tương tác thuốc, 46% người bệnh dùng clarithromycin và efavirenz bị phát ban. Do đã có các báo cáo tương tác dược động học giữa clarithromycin và efavirenz và tỷ lệ phát ban cao ở những người sử dụng đồng thời các thuốc này, thuốc thay thế clarithromycin (như azithromycin) nên xem xét sử dụng ở những bệnh nhân dùng efavirenz. Nếu sử dụng thuốc đồng thời càn theo dõi hiệu quả của macrolid.
+ Indinavir: Sử dụng clarithromycin (500mg mỗi 12 giờ) với indinavir (800mg ngày 3 lần) làm tăng cả nồng độ indinavir và clarithromycin.
+ Lopinavir: Sử dụng clarithromycin với các kẽt hợp của lopinavir và ritonavir có thể làm tăng nồng độ clarithromycin.
+ Nevirapin: Sử dụng đồng thời với clarithromycin làm giảm nồng độ trong huyết tương và AUC của clarithromycin, tăng nồng độ trong huyết tương và AUC của chất chuyển hóa chính của nó (14-hydroxyclarithromycin) và tăng nồng độ nevirapin.
+ Ritonavir: Khi clarithromycin được sử dụng ở bệnh nhân đang dùng ritonavir, không cần thiết thay đổi liều clarithromycin thường dùng ở những người có chức năng thận bình thường; tuy nhiên, liều clarithromycin nên được giảm 50% ở những bệnh nhân có độ thanh thải creatinin từ 30 đến 60 ml/phút và giảm 75% ở những bệnh nhân có độ thanh thải creatinin dưới 30 ml/phút.
+ Saquinavir: Sử dụng đồng thời clarithromycin và saquinavir có thể làm tăng nồng độ trong huyết tương của cả hai thuốc.
+ Zidovudin: Dùng đồng thời với clarithromycin ở người lớn bị nhiễm HIV làm giảm nồng độ đỉnh trong huyết tương của zidovudin khoảng 41% nhưng không ảnh hưởng đáng kể đến dược động học của clarithromycin, ở một số người lớn nhiễm HIV, dùng clarithromycin (500mg ngày 2 lần) làm giảm trạng thái ổn định AUC của zidovudin trung bình 12%. Uống clarithromycin trước khi uống zidovudin 2 - 4 giờ làm trạng thái ổn định nồng độ đỉnh trong huyết thanh của zidovudin tăng gấp đôi nhưng AUC không bị ảnh hưởng.
- Các benzodiazepin: Tác động trên hệ thần kinh trung ương (như buồn ngủ, lú lẫn) đã được báo cáo khi sử dụng clarithromycin đông thời với triazolam.
- Colchicin: Đã có báo cáo vê độc tính colchicin khi clarithromycin được sử dụng đồng thời với colchicin, đặc biệt là ở những bệnh nhân lớn tuổi và/hoặc ở bệnh nhân suy thận.
- Digoxin: Tăng nồng độ huyết thanh của digoxin.
- Ergot alkaloids: Chống chỉ định sử dụng đồng thời clarithromycin và ergot alkaloids (ergotamin, dihydroergotamin). Sử dụng đồng thời clarithromycin và ergotamin hoặc dihydroergotamin gây độc ergot cấp tính, đặc trưng bởi co mạch và thiếu máu cục bộ ở các chi và các mô khác, bao gồm cả hệ thần kinh trung ương.
- Fluconazol: ở những người khỏe mạnh uống 500mg clarithromycin ngày 2 lần đồng thời với fluconazol 200 mg mỗi ngày, trạng thái ổn định nồng độ đáy trong huyết thanh và diện tích dưới đường cong nồng độ trong huyết thanh theo thời gian (AUC) của clarithromycin tăng trung bình 33% và 18%.
- Omeprazol: Dùng với clarithromycin làm thay đổi dược động học (như tăng nồng độ trong mô dạ dày và/hoặc huyết thanh) của clarithromycin, 14-hydroxyclarithromycin, và omeprazol.
- Quinidin: Xoắn đỉnh đã được báo cáo hiếm gặp ở những bệnh nhân dùng clarithromycin với quinidin. Nếu clarithromycin và quinidin được sử dụng đồng thời nên theo dõi điện tâm đồ và nồng độ quinidin huyết thanh.
- Ranitidin: Dùng đồng thời ranitidin bismuth citrat với clarithromycin làm tăng nồng độ trong huyết tương của ranitidin (57%), nồng độ đáy trong huyết tương bismuth (48%) và nồng độ trong huyết tương của 14-hydroxyclarithromycin (31%).
- Sildenafil: Dùng đồng thời với erythromycin đã được báo cáo là tăng AUC của sildenafil. Do tương tác có thể xảy ra với clarithromycin, nên xem xét giảm liều sildenafil.
- Theophyllin: Sử dụng đồng thời clarithromycin cho những bệnh nhân đang dùng theophyllin có thể liên quan đến sự gia tăng nồng độ theophyllin trong huyết thanh do giảm chuyển hóa ở gan và/hoặc độ thanh thải của theophyllin.
Tương kỵ của thuốc
Do không có các nghiên cứu về tính tương kỵ của thuốc, không trộn lẫn thuốc này với các thuốc khác.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193686000092'), 'Viên nang cứng', '2 vỉ x 8 viên', 'Clindamycin có tác dụng điều trị những nhiễm khuẩn dưới đây do các vi khuẩn kỵ khí nhạy cảm với thuốc hoặc các chủng vi khuẩn ái khí gram dương nhạy cảm với thuốc như liên cầu (streptococci), tụ cầu (staphylococci), phế cầu (pneumococci), và các chủng Chlamydia trachomatis nhạy cảm với thuốc.
Các nhiễm khuẩn đường hô hấp trên bao gồm viêm amidan, viêm họng, viêm xoang, viêm tai giữa và bệnh tinh hồng nhiệt.
Các nhiễm khuẩn đường hô hấp dưới bao gồm viêm phế quản, viêm phổi, viêm mủ màng phổi và áp-xe phổi.
Các nhiễm khuẩn da và mô mềm bao gồm trứng cá, nhọt, viêm mô tế bào, chốc lở, các áp-xe và nhiễm khuẩn tại vết thương. Với các trường hợp nhiễm khuẩn da và mô mềm đặc hiệu như viêm quầng và viêm mé móng (panaritium) có đáp ứng tốt khi trị liệu với clindamycin.
Các nhiễm khuẩn xương và khớp bao gồm viêm xương tủy và viêm khớp nhiễm khuẩn.
Các nhiễm khuẩn phụ khoa bao gồm viêm nội mạc tử cung, viêm mô tế bào, nhiễm khuẩn âm đạo, áp-xe vòi-buồng trứng và viêm vòi trứng khi kết hợp với một thuốc kháng sinh phổ vi khuẩn gram âm ái khí thích hợp. Trong trường hợp viêm cổ tử cung do Chlamydia trachomatis, điều trị clindamycin đơn thuần được nhận thấy là có hiệu quả loại sạch được vi khuẩn này.
Các nhiễm khuẩn trong ổ bụng bao gồm viêm phúc mạc và áp-xe trong ổ bụng khi cho cùng với một thuốc kháng sinh phổ vi khuẩn ái khí gram âm thích hợp.
Nhiễm trùng huyết và viêm nội tâm mạc. Hiệu quả của clindamycin đã được ghi nhận trong điều trị một số trường hợp viêm nội tâm mạc cụ thể, khi clindamycin ở nồng độ thích hợp có thể đạt được trong huyết thanh có tác dụng diệt khuẩn in vitro đối với vi khuẩn đang bị nhiễm.
Các nhiễm khuẩn răng miệng như áp-xe quanh răng (áp-xe nha chu) và viêm quanh răng (viêm nha chu).
Viêm phổi do Pneumocystis jiroveci (phân loại trước đây là Pneumocystis carinii) trên bệnh nhân AIDS. Ở bệnh nhân không dung nạp với hoặc không đáp ứng đầy đủ điều trị thông thường, clindamycin có thể sử dụng phối hợp với primaquin.
Sốt rét: Đối với chỉ định này, xin tham khảo hướng dẫn chẩn đoán và điều trị bệnh sốt rét do Bộ Y tế ban hành.
Điều trị dự phòng viêm màng trong tim trên bệnh nhân nhạy cảm/dị ứng với các kháng sinh penicillin.
Trên in vitro, những vi khuẩn nhạy cảm với clindamycin gồm: B. melaninogenicus, B. disiens, B. bivius, Peptostreptococcus spp., G. vaginalis, M. mulieris, M. curtisii, Mycoplasma hominis.', 'Chống chỉ định clindamycin ở bệnh nhân trước đây có tiền sử dị ứng với clindamycin hoặc lincomycin hoặc bất kỳ thành phần nào trong công thức.', 'Tất cả các tác dụng không mong muốn được liệt kê theo phân loại của MedDRA SOC (Medical Dictionary for Regualatory Activities System Organ Class). Trong mỗi mục phân loại theo hệ cơ quan, các tác dụng không mong muốn được trình bày với tần suất được liệt kê theo thứ tự mức độ nghiêm trọng giảm dần.
Bảng các tác dụng không mong muốn
Phân loại theo hệ cơ quan
Thường gặp
≥1/100 đến
Ít gặp
≥1/10000 đến
Hiếm gặp ≥1/10000 đến
Tần suất chưa biết (không ước tính được từ dữ liệu sẵn có)
Nhiễm trùng và nhiễm ký sinh trùng
Viêm đại tràng giả mạc
Viêm đại tràng do clostridium difficile, nhiễm khuẩn âm đạo.
Rối loạn máu và hệ bạch huyết
Tăng bạch cầu ưa eosin
Mất bạch cầu hạt, giảm bạch cầu trung tính, giảm tiểu cầu, giảm bạch cầu.
Rối loạn hệ miễn dịch
Sốc phản vệ, phản ứng dạng phản vệ, phản ứng phản vệ, quá mẫn.
Rối loạn hệ thần kinh
Rối loạn vị giác
Rối loạn tim
Ngừng tim-hô hấp§
Rối loạn mạch máu
Viêm tắc tĩnh mạch†
Giảm huyết áp§
Rối loạn hệ tiêu hóa
Tiêu chảy
Đau bụng, buồn nôn, nôn mửa
Viêm thực quản↕, loét thực quản
Rối loạn gan mật
Vàng da
Rối loạn da và mô dưới da
Ban sần
Mề đay
Hồng ban đa dạng, ngứa
Hoại tử biểu bì do nhiễm độc (TEN), hội chứng Stevens-Johnson (SJS), phản ứng do thuốc kèm tăng bạch cầu ưa eosin và những triệu chứng toàn thân (DRESS), ngoại ban mụn mủ toàn thân cấp tính (AGEP), phù mạch, viêm da tróc vảy, viêm da bọng nước, ban dạng sởi.
Các rối loạn chung tại nơi dùng thuốc
Đau†, áp xe tại chỗ tiêm†
Khó chịu tại nơi tiêm†
Kết quả kiểm tra/xét nghiệm
Xét nghiệm chức năng gan bình thường
*ADR được xác định sau khi dùng thuốc lưu hành† ADR chỉ áp dụng cho các dạng thuốc tiêm
↕ADR chỉ áp dụng cho các dạng thuốc uống
§Các trường hợp hiếm gặp đã được báo cáo sau khi tiêm qua tĩnh mạch quá nhanh (xem mục Liều dùng và cách dùng)
Thông báo cho bác sĩ các tác dụng không mong muốn gặp phải khi sử dụng thuốc.', 'Liều dùng cho người lớn:
Clindamycin hydroclorid viên nang (đường uống):
300mg/lần mỗi 6,8,12 giờ hoặc 600mg/lần mỗi 8,12 giờ. Để tránh khả năng kích thích thực quản nên uống viên Clindamycin hydroclorid với một cốc nước đầy.
Liều cho người cao tuổi:
Các nghiên cứu dược động học của Clindamycin cho thấy không có sự khác biệt có ý nghĩa về mặt lâm sàng giữa người trẻ và người cao tuổi với chức năng gan bình thường và chức năng thận (điều chỉnh theo tuổi) bình thường sau khi uống hoặc tiêm. Vì vậy không cần thiết phải điều chỉnh liều ở người cao tuổi mà chức năng gan bình thường và chức năng thận (điều chỉnh theo tuổi) bình thường (Xem mục các đặc tính dược động học)
Liều dùng cho bệnh nhân suy thận
Không cần thiết điều chỉnh liều Clindamycin ở bệnh nhân suy thận
Liều dùng cho bệnh nhân suy gan
Có thể phải xem xét điều chỉnh liều dùng ở bệnh nhân suy gan nặng
Liều dùng cho những chỉ định đặc biệt
Nhiễm liên cầu bê-ta tan huyết: Tuân theo các liều chỉ định ở trên trong phần Liều dùng cho người lớn. Nên tiếp tục điều trị trong ít nhất 10 ngày.
Viêm cổ tử cung do Chlamydia trachomatis: Clindamycin hydroclorid uống 600mg, 3 lần/ngày trong 10-14 ngày.
Viêm phổi do Pneumocystis jiroveci trên bệnh nhân AIDS: Uống 300mg Clindamycin hydroclorid mỗi 6 giờ hoặc 600mg mỗi 8 giờ trong 21 ngày và Primaquin 15 đến 30mg một lần mỗi ngày trong 21 ngày.
Điều trị viêm amidan/Viêm họng cấp do liên cầu: Liều Clindamycin hydroclorid viên nang 300mg, uống 2 lần một ngày trong 10 ngày.
Điều trị sốt rét: Viên nang Clindamycin hydroclorid (đường uống). Với chỉ định này, xin tham khảo hướng dẫn chẩn đoán và điều trị bệnh sốt rét mới nhất do Bộ Y tế ban hành.
Dự phòng viêm nội mạc ở bệnh nhân nhạy cảm với Penicillin: Clindamycin hydroclorid viên nang (đường uống). Người lớn: 600mg 1 giờ trước khi phẫu thuật; trẻ em: 20mg/kg 1 giờ trước khi phẫu thuật.
- Quá liều
Thẩm phân máu và dịch màng bụng không có hiệu quả trong việc loại bỏ clindamycin trong huyết thanh.', 'bảo quản', '- Thận trọng khi sử dụng
Phản ứng quá mẫn nghiêm trọng, bao gồm cả những phản ứng da nghiêm trọng như phản ứng do thuốc kèm tăng bạch cầu ưa eosin và những triệu chứng toàn thân (DRESS), hội chứng Stevens-Johnson (SJS), hoại tử biểu bì do nhiễm độc (TEN), và ngoại ban mụn mủ toàn thân cấp tính (AGEP) đã được báo cáo ở bệnh nhân được điều trị bằng Clindamycin. Nếu bị phản ứng quá mẫn hoặc phản ứng da nghiêm trọng, nên ngừng dùng clindamycin và tiến hành điều trị bằng liệu pháp thích hợp (xem mục Chống chỉ định và mục Tác dụng không mong muốn).
Viêm đại tràng giả mạc được báo cáo với hầu hết các thuốc kháng sinh bao gồm clindamycin với mức độ từ nhẹ đến đe dọa tính mạng. Do vậy, điều quan trọng là cân nhắc chẩn đoán trên các bệnh nhân có các dấu hiệu của tiêu chảy sau khi dùng kháng sinh.
Điều trị bằng thuốc kháng sinh làm thay đổi hệ sinh vật của đại tràng và có thể tạo cơ hội cho clostridia tăng cường vượt mức. Các nghiên cứu cho thấy độc tố tạo ra do Clostridium difficile là nguyên nhân đầu tiên gây ra viêm đại tràng do kháng sinh. Sau khi xác định chẩn đoán viêm đại tràng giả mạc ban đầu, cần cân nhắc việc quản lý bù nước và chất điện giải, bổ sung protein, và điều trị với một kháng sinh có hiệu quả lâm sàng với viêm ruột kết do Clostridium difficile.
Do clindamycin không khuếch tán nhiều vào dịch não tủy, không nên dùng thuốc để điều trị viêm màng não.
Nếu điều trị kéo dài, nên theo dõi chức năng gan, thận và giám sát công thức máu. Sử dụng clindamycin có thể dẫn đến tình trạng tăng sinh quá mức các sinh vật không nhạy cảm, đặc biệt là nấm.
Tiêu chảy do Clostridium difficile (Clostridium difficile associated diarrhea - CDAD) đã được báo cáo khi sử dụng đối với hầu hết các thuốc kháng sinh, bao gồm clindamycin, và mức độ có thể từ tiêu chảy nhẹ đến viêm đại tràng dẫn đến tử vong. Điều trị bằng các thuốc kháng sinh sẽ làm thay đổi quần thể vi sinh tự nhiên của ruột dẫn tới sự phát triển quá mức của C. difficile.
Clostridium difficile sinh ra độc tố A và B góp phần làm phát triển CDAC. Các chủng C. difficlie sinh nhiều độc tố là nguyên nhân làm tăng tỷ lệ mắc bệnh và tử vong, vì các nhiễm khuẩn này có thể khó chữa khi dùng các liệu pháp kháng sinh và có thể cần phải cắt bỏ đại tràng. Cần phải nghĩ đến bệnh CDAD ở tất cả các bệnh nhân xuất hiện tiêu chảy sau khi dùng các chất kháng khuẩn. Cần ghi bệnh án cẩn thận vì đã có báo cáo CDAD xảy ra sau hơn 2 tháng kể từ khi điều trị bằng kháng sinh.
- Thai kỳ và cho con bú
Sử dụng trên phụ nữ có thai
Các nghiên cứu độc tính lên khả năng sinh sản qua đường uống và tiêm dưới da ở chuột và thỏ không phát hiện bằng chứng nào về suy giảm khả năng sinh sản hoặc gây hại đến thai do clindamycin, ngoại trừ ở các liều lượng gây độc cho mẹ. Nghiên cứu trên khả năng sinh sản của động vật không phải lúc nào cũng dự đoán được đáp ứng trên người.
Clindamycin qua được nhau thai người. Sau khi dùng đa liều, nồng độ clindamycin trong dịch ối đạt khoảng 30% nồng độ trong máu của mẹ.
Trong các thử nghiệm lâm sàng trên phụ nữ mang thai, việc dùng clindamycin theo đường toàn thân trong suốt ba tháng thứ hai và ba tháng cuối của thai kỳ không liên quan đến việc tăng tần suất xuất hiện dị tật bẩm sinh. Chưa có các nghiên cứu phù hợp và được kiểm soát tốt trên phụ nữ mang thai trong suốt ba tháng đầu tiên của thai kỳ.
Chỉ nên dùng clindamycin cho phụ nữ có thai khi thực sự cần thiết.
Sử dụng cho phụ nữ cho con bú
Clindamycin được báo cáo là có bài tiết qua sữa mẹ với nồng độ trong khoảng 0,7 - 3,8µg/mL. Không nên dùng clindamycin cho phụ nữ đang cho con bú do có thể gây ra các phản ứng bất lợi nghiêm trọng trên trẻ sơ sinh.
- Khả năng lái xe và vận hành máy móc
Ảnh hưởng của clindamycin trên khả năng lái xe và vận hành máy móc chưa được đánh giá một cách có hệ thống.
- Tương tác thuốc
Tác dụng đối kháng giữa Clindamycin và Erythromycin đã được nhận thấy trong nghiên cứu in vitro. Do có ý nghĩa đáng kể về lâm sàng, không nên dùng 2 thuốc này đồng thời. Clindamycin được thấy có đặc tính chẹn thần kinh cơ nên có thể làm tăng tác dụng của các thuốc chẹn thần kinh cơ. Do vậy, cần thận trọng trên các bệnh nhân đang dùng các thuốc này.
Thuốc chống đông kháng vitamin K.
Đã có báo cáo về tăng các chỉ số xét nghiệm về đông máu (PT/INR) và/hoặc xuất huyết ở những bệnh nhân được điều trị bằng Clindamycin kết hợp với một thuốc chống đông kháng vitamin K (ví dụ như warfarin, acenocoumarol và fluindione). Vì vậy, cần thường xuyên theo dõi các kết quả xét nghiệm đông máu ở những bệnh nhân được điều trị bằng thuốc kháng vitamin K.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193686000088'), 'Viên nén bao phim', '10 vỉ x 10 viên', '- Các nhiễm khuẩn đường hô hấp, da và các mô mềm, các cơ quan tiết niệu - sinh dục, đường tiêu hóa.
- Phối hợp với Neomycin đề phòng nhiễm khuẩn khi tiến hành phẫu thuật ruột.
- Dùng thay thế các kháng sinh β-Iactam ở những bệnh nhân dị ứng Penicillin.
- Dùng thay thế Penicillin trong dự phòng dài hạn thấp khớp cấp.', '- Mẫn cảm với bất kỳ thành phần nào của thuốc.
- Bệnh nhân trước đây đã dùng Erythromycin mà có rối loạn về gan, bệnh nhân có tiền sử bị điếc, bệnh nhân rối loạn chuyển hóa porphyrin cấp.
- Phối hợp với Terfenadine, Astemizole.', '- Thường gặp: Đau bụng, nôn, tiêu chảy, ngoại ban,...
- Ít gặp: Mày đay.
- Hiếm gặp: Loạn nhịp tim, tăng transaminase, tăng bilirubin huyết, điếc có hồi phục.', '- Nên uống thuốc Erythromycin Mekophar 500mg vào lúc đói, nếu bị kích ứng tiêu hóa thì uống trong khi ăn.
- Theo chỉ định của bác sĩ.
- Liều đề nghị:
+ Người lớn: uống 500 – 1000mg/lần, ngày 2-3 lần.
+ Trẻ em: uống 30 – 50mg/kg/ngày, chia 2 - 3 lần.
- Quá liều
- Quá liều Erythromycin thường có triệu chứng đau bụng, nôn mửa, tiêu chảy, mất thính lực (tạm thời).
- Cách xử trí: Cho dùng Epinephrine, corticosteroid và thuốc kháng histamin để xử trí các phản ứng dị ứng; thụt rửa dạ dày để loại trừ thuốc chưa hấp thu ra khỏi cơ thể; và khi cần dùng các biện pháp hỗ trợ.
- Nếu trường hợp quá liều xảy ra, đề nghị đến ngay cơ sở y tế gần nhất để nhân viên y tế có phương pháp xử lý.', 'nhiệt độ ≤ 30°C, tránh ánh sáng.', '- Thận trọng khi sử dụng
Cần sử dụng rất thận trọng các dạng Erythromycin cho người bệnh đang có bệnh gan hoặc suy gan.
Cần phải rất thận trọng khi dùng cho các người bệnh loạn nhịp, có các bệnh khác về tim. Trong trường hợp này, tương tác thuốc có thể gây tác dụng phụ chết người.
- Thai kỳ và cho con bú
Thận trọng khi dùng cho phụ nữ mang thai, phụ nữ cho con bú.
- Tương tác thuốc
- Chống chỉ định dùng phối hợp Astemizole hoặc Terfenadine với Erythromycin vì nguy cơ độc với tim như xoắn đỉnh, nhịp nhanh thất và tử vong.
- Cần thận trọng khi dùng Erythromycin cùng với các thuốc sau đây:
Erythromycin làm giảm sự thanh thải trong huyết tương và kéo dài thời gian tác dụng của Alfentanil.
Erythromycin có thể ức chế chuyển hóa của Carbamazepine và acid Valproic, làm tăng nồng độ các thuốc này trong huyết tương và làm tăng độc tính.
Erythromycin có thể đẩy hoặc ngăn chặn không cho Chloramphenicol hoặc Lincomycin gắn với tiểu đơn vị 50S của ribosome vi khuẩn, do đó đối kháng tác dụng của những thuốc này.
Các thuốc kìm khuẩn có thể ảnh hưởng đến tác dụng diệt khuẩn của Penicillin trong điều trị viêm màng não hoặc các trường hợp cần có tác dụng diệt khuẩn nhanh. Tốt nhất là tránh phối hợp.
Erythromycin làm tăng nồng độ của digoxin trong máu do tác động lên hệ vi khuẩn đường ruột làm cho digoxin không bị mất hoạt tính.
Erythromycin làm giảm sự thanh thải của các xanthine như Aminophylline, Theophylline, Caffeine, do đó làm tăng nồng độ của những chất này trong máu. Nếu cần, phải điều chỉnh liều.
Erythromycin có thể kéo dài quá mức thời gian prothrombin và làm tăng nguy cơ chảy máu khi điều trị kéo dài bằng Warfarin, do làm giảm chuyển hóa và độ thanh thải của thuốc này. Cần phải điều chỉnh liều Warfarin và theo dõi chặt chẽ thời gian prothrombin.
Erythromycin làm giảm độ thanh thải của Midazolam hoặc Triazolam và làm tăng tác dụng của những thuốc này.
Dùng liều cao Erythromycin với các thuốc có độc tính với tai ở người bệnh suy thận có thể làm tăng tiềm năng độc tính với tai của những thuốc này.
Phối hợp Erythromycin với các thuốc có độc tính với gan có thể làm tăng tiềm năng độc với gan.
Erythromycin làm tăng nồng độ Cyclosporin trong huyết tương và tăng nguy cơ độc với thận.
Erythromycin ức chế chuyển hóa của Ergotamine và làm tăng tác dụng co thắt mạch của thuốc này.
Dùng Erythromycin cùng với Lovastatin có thể làm tăng nguy cơ tiêu cơ vân.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193686000077'), 'Viên nén bao phim', '2 vỉ x 7 viên', 'Ở người lớn với nhiễm khuẩn nhẹ hoặc trung bình, Levofloxacin được chỉ định điều trị các bệnh nhiễm khuẩn do các vi khuẩn nhạy cảm với Levofloxacin:
- Viêm phổi mắc phải cộng đồng.
- Nhiễm khuẩn đường tiết niệu có biến chứng kể cả viêm thận - bể thận.
- Viêm tuyến tiền liệt mạn tính do vi khuẩn.
- Nhiễm khuẩn da và mô mềm.
- Nhiễm khuẩn đường tiết niệu không phức tạp: do kháng sinh fluoroquinolon, trong đó có Levofloxacin liên quan đến phản ứng có hại nghiêm trọng (xem mục THẬN TRỌNG) và nhiễm khuẩn đường tiết niệu không phức tạp ở một số bệnh nhân có thể tự khỏi, chỉ nên sử dụng Levofloxacin cho những bệnh nhân không có lựa chọn điều trị khác thay thế.
- Đợt nhiễm khuẩn cấp của viêm phế quản mạn tính: do kháng sinh fluoroquinolon, trong đó có Levofloxacin liên quan đến phản ứng có hại nghiêm trọng (xem mục THẬN TRỌNG) và đợt nhiễm khuẩn cấp của viêm phế quản mạn tính ở một số bệnh nhân có thể tự khỏi, chỉ nên sử dụng Levofloxacin cho những bệnh nhân không có lựa chọn điều trị khác thay thế.
- Viêm xoang cấp tính do vi khuẩn: do kháng sinh fluoroquinolon, trong đó có Levofloxacin liên quan đến phản ứng có hại nghiêm trọng (xem mục THẬN TRỌNG) và viêm xoang cấp tính do vi khuẩn ở một số bệnh nhân có thể tự khỏi, chỉ nên sử dụng Levofloxacin cho những bệnh nhân không có lựa chọn điều trị khác thay thế.', '- Bệnh nhân quá mẫn với Levofloxacin hoặc các quinolon khác hoặc bất cứ thành phần tá dược nào của thuốc.
- Bệnh nhân động kinh.
- Bệnh nhân thiếu hụt G6PD.
- Bệnh nhân có tiền sử bệnh ở gân cơ do fluoroquinolon.
- Trẻ em < 18 tuổi.', 'Thường gặp
- Tiêu hóa: buồn nôn, tiêu chảy.
- Gan: tăng enzym gan.
- Thần kinh: Mất ngủ, đau đầu.
Ít gặp
- Thần kinh: hoa mắt, căng thẳng, kích động, lo lắng.
- Tiêu hóa: đau bụng, đầy hơi, khó tiêu, nôn, táo bón.
- Gan: tăng bilirubin huyết.
- Tiết niệu, sinh dục: viêm âm đạo, nhiễm nấm Candida sinh dục.
- Da: ngứa, phát ban.
Hiếm gặp
- Tim mạch: tăng hoặc hạ huyết áp, loạn nhịp.
- Tiêu hóa: viêm đại tràng màng giả, khô miệng, viêm dạ dày, phù lưỡi.
- Cơ xương khớp: đau khớp, yếu cơ, đau cơ, viêm tủy xương, viêm gân Achille.
- Thần kinh: co giật, giấc mơ bất thường, trầm cảm, rối loạn tâm thần.
- Dị ứng: phù Quinck, choáng phản vệ, hội chứng Stevens-Johnson và Lyell.', 'Cách dùng
Levofloxacin STADA 500mg được dùng đường uống.
Liều dùng
- Viêm phổi mắc phải cộng đồng: 500mg x 1 hoặc 2 lần/ngày x 7 - 14 ngày.
- Nhiễm khuẩn đường tiết niệu có biến chứng: 500mg x 1 lần/ngày x 7 - 14 ngày.
- Viêm thận - bể thận: 500mg x 1 lần/ngày x 7 - 10 ngày.
- Viêm tuyến tiền liệt mạn tính do vi khuẩn: 500mg x 1 lần/ngày x 28 ngày.
- Nhiễm khuẩn da và mô mềm: 500mg x 1 hoặc 2 lần/ngày x 7 - 14 ngày.
- Nhiễm khuẩn đường tiết niệu không phức tạp: 250mg x 1 lần/ngày x 3 ngày.
- Đợt nhiễm khuẩn cấp của viêm phế quản mạn tính: 500mg x 1 lần/ngày x 7 - 10 ngày.
- Viêm xoang cấp tính do vi khuẩn: 500mg x 1 lần/ngày x 10 - 14 ngày.
- Liều dùng cho người bệnh suy thận:
Độ thanh thải creatinin (ml/phút)
Liều ban đầu
Liều duy trì
Nhiễm khuẩn đường tiết niệu có biến chứng, viêm thận - bể thận cấp
≥ 20
10 - 19
250 mg
250 mg
250 mg mỗi 24 giờ
250 mg mỗi 48 giờ
Các chỉ định khác
50 - 80
20 - 49
10 - 19
Thẩm tách máu
Thẩm phân phúc mạc liên tục
Không cần điều chỉnh liều
500mg
500mg
500mg
500mg
Không cần điều chỉnh liều
250mg mỗi 24 giờ
125mg mỗi 24 giờ
125mg mỗi 24 giờ
125mg mỗi 24 giờ
- Quá liều
Triệu chứng
Theo các nghiên cứu về độc tính trên động vật hay các nghiên cứu về dược lâm sàng cho thấy với liều vượt quá liều trị liệu, các dấu hiệu quan trọng nhất có thể thấy sau khi quá liều Levofloxacin cấp tính là các triệu chứng ở hệ thần kinh trung ương như nhầm lẫn, hoa mắt, suy giảm nhận thức, co giật kiểu động kinh, tăng khoảng QT cũng như các phản ứng ở dạ dày - ruột như buồn nôn, ăn mòn niêm mạc.
Xử trí
Trong trường hợp quá liều, nên điều trị triệu chứng. Đảm bảo việc theo dõi điện tâm đồ ECG do khả năng kéo dài khoảng QT. Các thuốc kháng acid có thể được sử dụng để bảo vệ niêm mạc dạ dày. Thẩm tách máu, kể cả thẩm tách màng bụng và thẩm phân phúc mạc liên tục ngoại trú, không có hiệu quả trong việc thải trừ Levofloxacin ra khỏi cơ thể. Không có thuốc giải độc đặc hiệu.', 'Nhiệt độ không quá 30°C.', '- Thận trọng khi sử dụng
- Viêm gân và đứt gân: viêm gân có thể hiếm xảy ra. Phần lớn thường liên quan đến gân Achille và có thể dẫn đến đứt gân. Nguy cơ viêm gân và đứt gân gia tăng ở người lớn tuổi, bệnh nhân dùng corticosteroid và bệnh nhân dùng liều 1000mg Levofloxacin mỗi ngày. Nếu nghi ngờ viêm gân, phải ngưng ngay việc điều trị với Levofloxacin.
- Bệnh liên quan với Clostridium difficile: tiêu chảy, đặc biệt nếu nặng, dai dẳng và/hoặc có máu, trong hoặc sau khi điều trị với Levofloxacin, có thể là triệu chứng của bệnh liên quan với Clostridium difficile, dạng nặng nhất là viêm đại tràng màng giả. Nếu nghi ngờ viêm đại tràng màng giả, phải ngưng dùng Levofloxacin ngay.
- Bệnh nhân suy thận: do Levofloxacin được bài tiết chủ yếu qua thận, nên điều chỉnh liều của Levofloxacin ở bệnh nhân suy thận.
- Bệnh nhân thiếu glucose-6-phosphat dehydrogenase: Bệnh nhân với khiếm khuyết tiềm tàng hay khiếm khuyết thực sự hoạt tính của glucose-6-phosphat dehydrogenase có thể dễ xảy ra phản ứng tán huyết khi điều trị với các thuốc kháng khuẩn quinolon, vì thế nên dùng thận trọng Levofloxacin.
- Bệnh nhân dễ bị co giật: Levofloxacin nên được dùng thật thận trọng ở người bệnh dễ bị co giật, như những bệnh nhân đã bị tổn thương hệ thần kinh trung ương trước đó.
- Rối loạn đường huyết: cũng như tất cả các thuốc nhóm quinolon, đã có báo cáo về hạ đường huyết và tăng đường huyết, thường ở các bệnh nhân đái tháo đường đang điều trị đồng thời với một thuốc hạ đường huyết đường uống (như glibenclamid) hoặc với insulin, ở những bệnh đái tháo đường này, nên theo dõi đường huyết cẩn thận.
- Nên cẩn thận khi dùng fluoroquinolon, kể cả Levofloxacin, ở những bệnh nhân đã biết có các yếu tố nguy cơ kéo dài khoảng QT: hội chứng QT kéo dài bẩm sinh, dùng đồng thời các thuốc kéo dài khoảng QT (như thuốc chống loạn nhịp tim typ IA và III, thuốc chống trầm cảm 3 vòng, macrolid), mất cân bằng chất điện giải không hiệu chỉnh được (như giảm kali huyết, giảm magnesi huyết), người lớn tuổi, bệnh tim mạch (như suy tim, nhồi máu cơ tim, nhịp tim chậm).
- Nhược cơ: cần thận trọng ở người bị bệnh nhược cơ vi các biểu hiện có thể nặng hơn.
- Tác dụng trên thần kinh trung ương: đã có các thông báo về phản ứng bất lợi như rối loạn tâm thần, tăng áp lực nội sọ, kích thích thần kinh trung ương dẫn đến co giật, run rẩy, bồn chồn, đau đầu, mất ngủ, trầm cảm, lú lẫn, ảo giác, ác mộng, có ý định hoặc hành động tự sát (hiếm gặp) khi sử dụng các nhóm quinolon, thậm chí ngay khi sử dụng ở liều đầu tiên. Nếu xảy ra những phản ứng bất lợi này trong khi sử dụng Levofloxacin, cần dừng thuốc và có các biện pháp xử trí triệu chứng thích hợp. cần thận trọng khi sử dụng cho người bệnh có các bệnh lý trên thần kinh trung ương như động kinh, xơ cứng mạch não... vì có thể tăng nguy cơ co giật.
- Phản ứng mẫn cảm: phản ứng mẫn cảm với nhiều biểu hiện lâm sàng khác nhau, thậm chí sốc phản vệ khi sử dụng các quinolon, bao gồm cả Levofloxacin đã được thông báo. Cần ngưng dùng ngay khi có các dấu hiệu đầu tiên của phản ứng quá mẫn và áp dụng các biện pháp thích hợp.
- Mẫn cảm với ánh sáng mức độ từ trung bình đến nặng đã được thông báo với nhiều kháng sinh nhóm fluoroquinolon, trong đó có Levofloxacin (mặc dù đến nay, tỉ lệ gặp phản ứng bất lợi này khi sử dụng Levofloxacin rất thấp - Các phản ứng có hại nghiêm trọng có khả năng không hồi phục và gây tàn tật, bao gồm viêm gân, đứt gân, bệnh lý thần kinh ngoại biên và các tác dụng bất lợi trên thần kinh trung ương.
- Các kháng sinh nhóm fluoroquinolon có liên quan đến các phản ứng có hại nghiêm trọng có khả năng gây tàn tật và không hồi phục trên các hệ cơ quan khác nhau của cơ thể. Các phản ứng này có thể xuất hiện đồng thời trên cùng bệnh nhân. Các phản ứng có hại thường được ghi nhận gồm viêm gân, đứt gân, đau khớp, đau cơ, bệnh lý thận kinh ngoại vi và các tác dụng bất lợi trên hệ thống thần kinh trung ương (ảo giác, lo âu, trầm cảm, mất ngủ, đau đầu nặng và lú lẫn). Các phản ứng này có thể xảy ra trong vòng vài giờ đến vài tuần sau khi sử dụng thuốc. Bệnh nhân ở bất kỳ tuổi nào hoặc không có yếu tố nguy cơ tồn tại từ trước đều có thể gặp những phản ứng có hại trên.
- Ngừng sử dụng thuốc ngay khi có dấu hiệu hoặc triệu chứng đầu tiên của bất kỳ phản ứng có hại nghiêm trọng nào. Thêm vào đó, tránh sử dụng các kháng sinh nhóm fluoroquinolon cho các bệnh nhân đã từng gặp các phản ứng nghiêm trọng liên quan đến fluoroquinolon.
- Thai kỳ và cho con bú
Phụ nữ có thai: các nghiên cứu về khả năng sinh sản ở động vật chưa mang lại lợi ích cụ thể. Tuy nhiên trong tình trạng thiếu thông tin ở người và do nguy cơ thoái hóa dựa trên thực nghiệm của fluoroquinolon đối với sụn nâng đỡ trọng lượng của cơ thể đang phát triển, Levofloxacin không được sử dụng cho phụ nữ có thai.
Phụ nữ cho con bú: Levofloxacin không được sử dụng cho phụ nữ đang cho con bú.
- Khả năng lái xe và vận hành máy móc
Một số tác dụng không mong muốn (như hoa mắt/chóng mặt, buồn ngủ, rối loạn thị giác) có thể làm giảm khả năng tập trung và phản ứng của bệnh nhân, do vậy có thể gây rủi ro trong các tình huống mà những khả năng này đóng vai trò đặc biệt quan trọng (như lái xe hoặc vận hành máy móc).
- Tương tác thuốc
- Muối sắt, thuốc kháng acid chứa magnesi hoặc nhôm: sự hấp thu Levofloxacin bị giảm đáng kể khi dùng đồng thời muối sắt, hoặc thuốc kháng acid chứa magnesi hoặc nhôm với Levofloxacin.
- Theophyllin, Fenbufen hoặc các thuốc kháng viêm không steroid tương tự: ngưỡng co giật ở não có thể giảm đáng kể khi dùng đồng thời quinolon với Theophyllin, thuốc kháng viêm không steroid, hoặc các thuốc làm giảm ngưỡng co giật. Khi có sự hiện diện của Fenbufen nồng độ của Levofloxacin cao hơn khoảng 13% so với khi dùng đơn lẻ.
- Sucralfat: sinh khả dụng của Levofloxacin giảm đáng kể khi dùng chung với Sucralfat. Nếu bệnh nhân dùng cả Sucralfat và Levofloxacin, tốt nhất nên uống sucralfat 2 giờ sau khi uống Levofloxacin.
- Probenecid và Cimetidin: qua thống kê, Probenecid và Cimetidin có ảnh hưởng đáng kể trên sự thải trừ của Levofloxacin. Độ thanh thải qua thận của Levofloxacin giảm 24% do Cimetidin và 34% do Probenecid.
- Warfarin: do đã có thông báo Warfarin tăng tác dụng khi dùng cùng với Levofloxacin, cần giám sát các chỉ số đông máu khi sử dụng đồng thời hai thuốc này.
- Các thuốc hạ đường huyết: dùng đồng thời với Levofloxacin co thể làm tăng nguy cơ rối loạn đường huyết, cần giám sát chặt chẽ.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193686000082'), 'Viên nén bao phim', '2 vỉ x 7 viên', 'OPECIPRO được chỉ định cho các nhiễm khuẩn gây ra bởi các vi khuẩn nhạy cảm mà các thuốc kháng sinh thông thường không tác dụng để tránh phát triển chủng vi khuẩn kháng ciprofloxacin: Nhiễm khuẩn đường tiêu hóa, nhiễm khuẩn thận và đường tiểu, lậu cầu và nhiễm khuẩn đường sinh dục, nhiễm khuẩn da và mô mềm, nhiễm khuẩn xương và khớp, nhiễm khuẩn đường hô hấp, nhiễm khuẩn tai mũi họng, nhiễm khuẩn khoang miệng và răng, nhiễm khuẩn sản phụ khoa, nhiễm khuẩn huyết, nhiễm khuẩn đường mật, nhiễm khuẩn ổ bụng (viêm phúc mạc). Dự phòng bệnh não mô cầu và nhiễm khuẩn ở người suy giảm miễn dịch.', '- Bệnh nhân có tiền sử mẫn cảm với ciprofloxacin, acid nalidixic và các quinolon khác.
- Phụ nữ có thai hoặc đang cho con bú.', '- Thường gặp, ADR > 1/100: Buồn nôn, nôn, ỉa chảy, đau bụng, tăng tạm thời nồng độ các men transaminase.
- Ít gặp, 1/1000 - Hiếm gặp, ADR + Phản ứng phản vệ hoặc dạng phản vệ, thiếu máu, tăng bạch cầu, tăng tiểu cầu, thay đổi nồng độ prothrombin.
+ Co giật, lú lẫn, rối loạn tâm thần, hoang tưởng, mất ngủ, trầm cảm, đau cơ, viêm gan, ứ mật. Loạn cảm ngoại vi, rối loạn thị giác kể cả ảo giác, rối loạn thính giác, ù tai, rối loạn vị giác và khứu giác, tăng áp lực nội sọ. Viêm đại tràng màng giả.
+ Hội chứng da - niêm mạc, viêm mạch, hội chứng Lyell, ban đỏ da dạng nốt, ban đỏ đa dạng.
+ Đã có báo cáo về một vài trường hợp bị hoại tử tế bào gan, đau cơ, viêm gan, vàng da ứ mật. Có một vài trường hợp bị đứt gân, đặc biệt là ở người cao tuổi khi dùng phối hợp với corticosteroid.
+ Có tinh thể niệu khi nước tiểu kiềm tính, đái ra máu, suy thận cấp, viêm thận kẽ.
+ Nhạy cảm với ánh sáng khi phơi nắng, phù thanh quản hoặc phù phổi, khó thở, co thắt phế quản.
Thông báo cho bác sĩ những tác dụng không mong muốn gặp phải khi sử dụng thuốc.', '- Nhiễm khuẩn đường tiểu chưa biến chứng: uống 250mg/lần, ngày x 2 lần.
- Nhiễm khuẩn đường tiểu có biến chứng: uống 500mg/lần, ngày x 2 lần.
- Nhiễm khuẩn đường hô hấp và viêm xương tủy xương: uống 750mg/lần, ngày x 2 lần.
- Các nhiễm khuẩn khác: uống 500mg/lần, ngày x 2 lần.
- Liều đơn 250mg được khuyến cáo dùng trong trường hợp lậu cầu cấp.
- Phòng bệnh viêm não mô cầu:
+ Người lớn và trẻ em trên 20kg: 500mg, một liều duy nhất.
+ Trẻ em dưới 20kg: 250mg, liều duy nhất hoặc 20mg/kg.
- Phòng nhiễm khuẩn Gram âm ở người bị suy giảm miễn dịch: 250 - 500mg, ngày 2 lần.
- Liệu pháp OPECIPRO liên tục 7 ngày trong điều trị nhiễm khuẩn thận và đường tiểu. Viêm xương tủy xương được điều trị trong 2 tháng. Thời gian điều trị cho những nhiễm khuẩn khác từ 7 đến 14 ngày, đối với nhiễm khuẩn do liên cầu nhạy cảm, thời gian điều trị tối thiểu 10 ngày.
- Đối với hầu hết các nhiễm khuẩn, nên điều trị tiếp tục 72 giờ sau khi có cải thiện về lâm sàng và về vi khuẩn học.
- Cần phải giảm liều ở người bị suy giảm chức năng thận hay chức năng gan. Trong trường hợp người bị suy chức năng thận, nếu dùng liều thấp thì không cần giảm liều; nếu dùng liều cao thì phải điều chỉnh liều dựa vào độ thanh thải creatinine, hoặc nồng độ creatinine trong huyết thanh.
Độ thanh thải Creatinine (ml/phút/1,73 m2)
Gợi ý điều chỉnh liều lượng
31 - 60 (creatinin huyết thanh: 120 - 170 micromol/L)
Liều >= 750mg x 2 lần/ngày nên giảm xuống còn 500mg x 2 lần/ngày
175 micromol/L)
Liều >= 500mg x 2 lần/ngày nên giảm xuống còn 500mg x 1 lần/ngày
- Quá liều
Sử dụng phải một liều lớn, thì cần xem xét để áp dụng những biện pháp gây nôn, rửa dạ dày, dùng thuốc lợi tiểu. Cần theo dõi người bệnh và điều trị hỗ trợ như truyền dịch.', 'Bảo quản ở nhiệt độ dưới 30°C, nơi khô ráo, tránh ánh sáng.', '- Thận trọng khi sử dụng
Ở người có tiền sử động kinh hay rối loạn hệ thần kinh trung ương, người bị suy chức năng gan hay chức năng thận, người thiếu men glucose 6 phosphat dehydrogenase, người bị bệnh nhược cơ.
Theo dõi người bệnh và làm kháng sinh đồ thường xuyên để có biện pháp điều trị thích hợp theo kháng sinh đồ.
Không nên dùng Ciprofloxacin cho trẻ em cho đến khi phát triển xương của trẻ hoàn chỉnh.
Ciprofloxacin có thể làm cho các xét nghiệm vi khuẩn Mycobacterium tuberculosis bị âm tính.
Không dùng thuốc quá hạn sử dụng.
- Thai kỳ và cho con bú
Trong thời kỳ mang thai, chỉ dùng Ciprofloxacin khi thật cần thiết và theo dõi thật cẩn thận. Không dùng Ciprofloxacin cho người đang cho con bú.
- Khả năng lái xe và vận hành máy móc
Ciprofloxacin có thể gây chóng mặt. Bệnh nhân không nên lái xe hoặc vận hành máy móc.
- Tương tác thuốc
- Dùng đồng thời các thuốc chống viêm không steroid (ibuprofen, indomethacin...) sẽ làm tăng tác dụng phụ của ciprofloxacin.
- Dùng đồng thời thuốc trung hòa acid có nhôm và magnesi, hay các chế phẩm có sắt (fumarat, gluconat, sulfat), hay các chế phẩm có kẽm sẽ làm giảm sự hấp thu của ciprofloxacin. Do đó, không nên uống đồng thời ciprofloxacin với các thuốc này, nên uống ciprofloxacin 1 hoặc 2 giờ trước hoặc ít nhất 4 giờ sau khi uống các thuốc kể trên.
- Mức độ hấp thu ciprofloxacin có thể bị giảm đi một nửa nếu dùng đồng thời một số thuốc gây độc tế bào (cyclophosphamid, vincristin, doxorubicin, cytosin arabinosid, mitozantron).
- Nếu dùng đồng thời didanosin, thì nồng độ ciprofloxacin bị giảm đi đáng kể. Nên uống ciprofloxacin trước khi dùng didanosin 2 giờ hoặc sau khi dùng didanosin 6 giờ.
- Uống ciprofloxacin đồng thời với theophylin có thể làm tăng nồng độ theophylin trong huyết thanh, gây ra các tác dụng phụ của theophylin. Cần kiểm tra nồng độ theophylin trong máu, và có thể giảm liều theophylin nếu buộc phải dùng 2 loại thuốc.
- Ciprofloxacin và ciclosporin dùng đồng thời có thể gây tăng nhất thời creatinin huyết thanh. Nên kiểm tra creatinin huyết mỗi 2 tuần.
- Probenecid cản trở sự bài tiết của ciprofloxacin. Dùng đồng thời probenecid và ciprofloxacin làm gia tăng nồng độ ciprofloxacin trong huyết thanh. Điều này nên được xem xét khi cho bệnh nhân dùng đồng thời cả hai loại thuốc này.
- Warfarin phối hợp với ciprofloxacin có thể gây hạ prothrombin. Cần kiểm tra thường xuyên prothrombin huyết và điều chỉnh liều thuốc chống đông máu.
- Bệnh nhân dùng OPECIPRO nên đảm bảo đủ nước và được khuyên uống nước đầy đủ.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000102'), 'Kem bôi', '1 tuýp x 5g', 'Điều trị nhiễm virus Herpes simplex ở da bao gồm Herpes môi, Herpes sinh dục khởi phát và tái phát.', 'Bệnh nhân mẫn cảm với acyclovir, valacyclovir, hay bất cứ thành phần nào của thuốc.', 'Acyclovir dùng ngoài có thể gây đau nhói, nóng rát, ngứa hay ban đỏ thoáng qua.', 'Acyclovir STADA cream chỉ được sử dụng ngoài da.
Liều lượng
Thoa một lớp kem mỏng lên vùng da bị tổn thương và kế cận 5 lần/ngày, cách nhau mỗi 4 giờ.
Điều trị liên tục trong 5 ngày, tiếp tục điều trị thêm 5 ngày nữa nếu vết thương chưa lành hẳn.
- Quá liều
Quá liều hầu như không xảy ra nếu dùng kem tại chỗ như chỉ định. Không có báo cáo liên quan đến quá liều acyclovir dạng kem.', 'Nhiệt độ không quá 30°C.', '- Thận trọng khi sử dụng
Việc điều trị bắt đầu càng sớm càng tốt ngay sau khi bị nhiễm, tốt nhất là trong giai đoạn tiền triệu chứng hay tổn thương đầu tiên xuất hiện.
Bệnh nhân nên rửa tay trước và sau khi thoa thuốc, tránh cọ xát vào vết thương khi không cần thiết hoặc dùng khăn lau để tránh làm nặng thêm hay lây truyền nhiễm trùng.
Không thoa kem lên niêm mạc như bên trong miệng, âm đạo hoặc mắt. Cẩn trọng tránh tiếp xúc thuốc vào mắt.
Không dùng cho bệnh nhân bị suy giảm miễn dịch như bị nhiễm HIV, ghép tủy xương hay điều trị ung thư, trừ khi có lời khuyên của bác sĩ.
Hướng dẫn bệnh nhân tránh tiếp xúc gần với những người có các dấu hiệu hoặc triệu chứng nhiễm Herpes simplex. Chưa có bằng chứng về việc sử dụng acyclovir dùng ngoài sẽ ngăn ngừa được sự truyền nhiễm HSV cho người khác.
Tính an toàn và hiệu quả khi dùng acyclovir dạng kem ở trẻ em dưới 12 tuổi chưa được xác minh.
- Thai kỳ và cho con bú
Phụ nữ có thai
Không có những nghiên cứu đầy đủ và có kiểm soát trên phụ nữ có thai. Chỉ nên dùng acyclovir cho phụ nữ mang thai khi lợi ích điều trị cao hơn so với nguy cơ tiềm ẩn cho thai nhi.
Phụ nữ cho con bú
Nên dùng acyclovir thận trọng cho phụ nữ cho con bú và chỉ dùng khi được chỉ định.
- Khả năng lái xe và vận hành máy móc
Không ảnh hưởng đến khả năng lái xe hay vận hành máy móc.
- Tương tác thuốc
Không xảy ra sự tương tác với các thuốc khác đối với acyclovir dùng ngoài.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193689000205'), 'Kem bôi', '1 tuýp x 30g', 'Differin Cream được dùng để điều trị mụn trứng cá khi có nhiều nhân trứng cá, sần và mụn mủ. Thuốc có thể dùng được cho mụn trứng cá ở mặt, ngực và lưng.', 'Quá mẫn với bất kỳ thành phần nào của thuốc này.
5. Lưu ý
- Thận trọng khi sử dụng
Tổng quát: Nếu xuất hiện các phản ứng nhạy cảm hay kích ứng trầm trọng, nên ngưng thuốc. Nếu mức độ kích ứng tại chỗ là báo động, nên hướng dẫn bệnh nhân kéo dài khoảng cách dùng thuốc, tạm thời ngưng thuốc hoặc ngưng hẳn. Differin Cream không nên cho tiếp xúc với mắt, miệng, gốc mũi và niêm mạc. Nếu thuốc dây vào mắt, rửa ngay lập tức bằng nước ấm.
Không dùng thuốc quá hạn dùng trên bao bì.
- Thai kỳ và cho con bú
Không có thông tin về sự sử dụng adapalen ở phụ nữ có thai. Do đó, không nên dùng adapalen trong thai kỳ. Không biết thuốc có tiết qua sữa động vật hoặc người hay không. Do nhiều thuốc được bài tiết qua đường sữa mẹ, nên thận trọng khi dùng Differin Cream cho phụ nữ nuôi con bú. Trong trường hợp nuôi con bú, không nên bôi thuốc lên ngực.
- Tương tác thuốc
Không có tương tác nào được biết giữa các thuốc khác được sử dụng đồng thời trên da với Differin Cream. Tuy nhiên không nên dùng đồng thời các thuốc retinoid hay các thuốc khác có cùng phương thức tác động với adapalen.
Adapalene bền vững với oxy, ánh sáng và cũng như không có phản ứng về mặt hoá học. Trong khi nghiên cứu rộng rãi trên động vật và người không cho thấy khả năng bị tác hại của ánh sáng hay dị ứng với ánh sáng của adapalen, tính an toàn của việc sử dụng adapalen khi tiếp xúc nhiều với ánh sáng thấy tia cực tím chưa được xác định trên cả động vật và người. Nên tránh tiếp xúc nhiều với ánh sáng hay tia cực tím. Ở người, adapalene hấp thu qua da kém và do đó tương tác với thuốc có tác dụng toàn thân hầu như không xảy ra. Không có bằng chứng về sự ảnh hưởng của việc sử dụng Differin Cream ngoài da lên các thuốc dùng theo đường uống như thuốc ngừa thai và kháng sinh. Differin Cream có khả năng gây kích ứng tại chỗ nhẹ, do đó, nên tránh việc sử dụng đồng thời với các thuốc có tác dụng bong da, se da hay những thuốc có tính kích ứng gộp. Khuyến cáo phải dùng Differin Cream cách 12h sau khi dùng các thuốc điều trị mụn trứng cá trên da như dung dịch erythromycin (với nồng độ đến 4%) hay clindamycin phosphat (1% dạng base) hay dạng gel nước benzoyl peroxid với nồng độ đến 10%.
7. Dược lý
- Dược lý
Adapalen là một hợp chất dạng retinoid đã được chứng minh là có tính kháng viêm in vivo và in vitro. Adapalen bền vững với oxy, ánh sáng và không có phản ứng về mặt hoá học. Cơ chế hoạt động của adapalen, giống như tretinoin, là gắn kết vào các thụ thể acid retinoic đặc hiệu của nhân, nhưng khác tretinoin ở chỗ không gắn vào protein của thụ thể trong bào tương.
Adapalen khi dùng trên da có tác dụng tiêu nhân mụn ở mô hình chuột nhắt rhino và cũng như tác dụng trên những bất thường của quá trình sừng hoá và biệt hoá của biểu bì, cả 2 quá trình này đều có mặt trong sinh bệnh hoá của mụn trứng cá thông thường. Phương thức tác động của adapalen được xem là bình thường hoá tiến trình biệt hoá của các tế bào nang biểu mô và do đó làm giảm sự hình thành vi nhân mụn trứng cá. Adapalen có ưu điểm hơn các retinoid trong thử nghiệm kháng viêm tiêu chuẩn cả in vitro và in vivo. Cơ chế của nó là ức chế các đáp ứng hoá ứng động và hoá tăng động của bạch cầu đa nhân ở người và cả sự chuyển hoá bằng cách lipoxid hoá acid arachidonic thành các chất trung gian tiền viêm. Đặc tính này gợi ý rằng thành phần viêm qua trung gian tế bào của mụn trứng cá có thể bị adapalen tác động. Các nghiên cứu ở người đã cho những bằng chứng lâm sàng về việc adapalen dùng trên da có hiệu quả trong việc giảm bớt phần viêm của mụn trứng cá (sần và mụn mủ).
- Dược động học (Tác động của cơ thể với thuốc)
Ở người, adapalen hấp thu qua da kém.Trong các thử nghiệm lâm sàng, không tìm thấy được nồng độ adapalen trong huyết tương ở mức có thể đo được khi sử dụng dài hạn trên một vùng da rộng bị mụn trứng cá với mức độ nhạy cảm phân tích là 0,15ng/ml. Sau khi xử lý [­14 C] - adapalen ở chuột lớn (tiêm tĩnh mạch, tiêm phúc mạc, uống và dùng ngoài da), ở thỏ (tiêm tĩnh mạch, uống và dùng ngoài da) và ở chó (tiêm tĩnh mạch và uống), hoạt tính phóng xạ phân bố ở một số mô và được tìm thấy nhiều nhất ở gan, lá lách, thượng thận và buồng trứng. Chuyển hóa thuốc ở động vật chưa được xác định rõ ràng, chủ yếu qua con đường O-demethyl hoá, hydroxyl hoá và liên hợp, và đào thải chủ yếu qua đường mật. Trong các nghiên cứu trên động vật, adapalen được dung nạp rất tốt khi dùng ngoài da trong 6 tháng ở thỏ và 2 năm ở chuột nhắt. Triệu chứng ngộ độc chủ yếu tìm thấy ở các loài này khi dùng theo đường uống có liên quan đến hội chứng thừa vitamin A, gồm cả loãng xương, tăng phosphatase kiềm và thiếu máu nhẹ. Liều uống adapalen cao không gây tác dụng ngoại ý trên thần kinh, tim mạch hay hô hấp ở động vật. Adapalen không gây đột biến. Các nghiên cứu suốt đời với adapalen đã được thực hiện hoàn tất ở chuột nhắt với liều bôi da là 0,6; 2 và 6mg/kg/ngày. Khám phá đáng kể duy nhất là sự gia tăng có ý nghĩa thống kê tế bào ưa crôm lành tính của phần tủy thượng thận ở chuột đực lớn dùng adapalen với liều 1,5mg/kg/ngày. Các thay đổi này không được xem là có liên quan đến sử dụng adapalen ngoài da.
8. Thông tin thêm
- Bảo quản
Bảo quản ở nhiệt độ phòng (không quá 30°C) - Tránh làm đông lạnh sản phẩm trong quá trình vận chuyển và bảo quản - Để thuốc ngoài tầm tay trẻ em.
- Hạn dùng
36 tháng kể từ ngày sản xuất.
- Thương hiệu
Galderma.', NULL, 'Differin Cream nên được dùng trên vùng da bị mụn trứng cá mỗi ngày một lần trước khi nghỉ ngơi và sau khi rửa sạch sẽ. Nên bôi một lớp mỏng, tránh tiếp xúc với mắt và môi (xem Chú ý để phòng và thận trọng khi dùng). Chú ý lau thật khô vùng da bị mụn trước khi bôi thuốc.
Với những bệnh nhân cần phải kéo dài khoảng cách dùng thuốc hay tạm thời ngưng điều trị, có thể sử dụng thường xuyên trở lại hoặc tiếp tục trị liệu khi xét rằng bệnh nhân có thể dung nạp bình thường với trị liệu trở lại. Nếu bệnh nhân có sử dụng mỹ phẩm, nên dùng mỹ phẩm không gây nhân mụn và không làm se da.
Cách dùng: Bóp nhẹ ống thuốc ở phần đuôi, lấy một lượng kem vừa đủ trên đầu ngón tay để bôi lên vùng da bị mụn. Đóng chặt nắp ống sau khi dùng.
- Quá liều
Differin Cream không được dùng qua đường uống và chỉ dùng trên da. Nếu dùng quá nhiều thuốc, sẽ không thu được kết quả nhanh hơn hay tốt hơn mà có thể bị đỏ da, bong da hay khó chịu. Độc tính cấp theo đường uống trên chuột nhắt cao hơn 10g/kg.Tuy vậy, khi nuốt nhầm, trừ khi chỉ nuốt một lượng nhỏ, nên xem xét đến phương pháp rửa dạ dày thích hợp.', 'Bảo quản ở nhiệt độ phòng (không quá 30°C) - Tránh làm đông lạnh sản phẩm trong quá trình vận chuyển và bảo quản - Để thuốc ngoài tầm tay trẻ em.', NULL, NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000113'), 'Kem bôi', '1 tuýp x 5g', 'EUMOVATE cream là corticosteroid dùng tại chỗ có hiệu lực trung bình được chỉ định cho người lớn, người già, trẻ em và nhũ nhi nhằm làm giảm các triệu chứng viêm và ngứa của các bệnh da đáp ứng với steroid.
Các bệnh này bao gồm:
- Viêm da cơ địa (chàm).
- Viêm da tiếp xúc dị ứng hoặc kích ứng.
- Viêm da tiết bã.
- Hăm da do tã lót.
- Viêm da do tiếp xúc với ánh sáng.
- Viêm tai ngoài.
- Sẩn cục ngứa.
- Các phản ứng do côn trùng đốt.
EUMOVATE có thể dùng để điều trị duy trì xen kẽ giữa các đợt điều trị bằng các steroid tại chỗ có hiệu lực cao hơn.', 'Không điều trị bằng Eumovate trong các trường hợp sau:
- Các nhiễm trùng da chưa được điều trị (ví dụ Herpes simplex, thủy đậu).
- Bệnh trứng cá đỏ rosacea.
- Mụn trứng cá.
- Ngứa nhưng không viêm.', 'Các tác dụng không mong muốn của thuốc (ADRs) được liệt kê dưới đây theo phân loại hệ thống cơ quan của cơ thể MedDRA và tần suất. Tần suất được xác định như sau: rất phổ biến (> 1/10), phổ biến (> 1/100 và 1/1000 và 1/10000 và Dữ liệu sau khi lưu hành thuốc
Nhiễm trùng và nhiễm ký sinh trùng
Rất hiếm: Nhiễm trùng cơ hội
Rối loạn hệ miễn dịch
Rất hiếm: Quá mẫn (mày đay, bỏng rát tại vùng da tiếp xúc, phát ban, ngứa, ban đỏ)
Rối loạn nội tiết
Rất hiếm: Ức chế trục dưới đồi - tuyến yên - thượng thận (trục HPA):
Các đặc điểm giống hội chứng Cushing (ví dụ: mặt tròn như mặt trăng, béo phì ở trung tâm), chậm tăng cân/ chậm lớn ở trẻ em, loãng xương, glaucoma, tăng đường huyết/glucose, đục thủy tinh thể, tăng huyết áp, tăng cân/béo phì, giảm nồng độ cortisol nội sinh.
Rối loạn da và mô dưới da
Rất hiếm: Viêm da tiếp xúc dị ứng, mày đay, teo da, thay đổi sắc tố da, trầm trọng thêm các triệu chứng tiềm ẩn, bỏng rát tại vùng da tiếp xúc, rậm lông, phát ban, ngứa, ban đỏ.
Ảnh hưởng thứ phát trên da do tác dụng toàn thân và/hoặc tại chỗ của sự ức chế trục dưới đồi - tuyến yên - thượng thận (trục HPA).
Thông báo cho bác sỹ những tác dụng không mong muốn gặp phải khi dùng thuốc', 'Người lớn, người cao tuổi, trẻ em và nhũ nhi
Dạng kem đặc biệt thích hợp cho các bề mặt da ẩm ướt hoặc rỉ dịch.
Viêm da cơ địa (chàm)
Bôi một lớp mỏng và xoa nhẹ đủ để phủ kín hoàn toàn vùng da bị bệnh 1 hoặc 2 lần mỗi ngày cho đến khi tình trạng được cải thiện, sau đó giảm số lần sử dụng hoặc chuyển sang điều trị bằng thuốc có hiệu lực thấp hơn. Sau mỗi lần dùng thuốc, giữ cho thuốc có đủ thời gian hấp thu vào da trước khi dùng một thuốc làm mềm da.
Nếu tình trạng bệnh xấu hơn hoặc không cải thiện trong vòng 4 tuần, nên đánh giá lại phương pháp điều trị và chẩn đoán.
Khi đã kiểm soát được bệnh, liệu pháp điều trị bằng corticosteroid tại chỗ nên được ngưng dần dần và tiếp tục điều trị duy trì bằng một thuốc làm mềm da. Các bệnh da trước đó có thể tái phát khi ngưng dùng đột ngột các thuốc corticosteroid tại chỗ, đặc biệt các thuốc có hiệu lực cao.
Trẻ em
Trẻ em thường bị các tác dụng không mong muốn tại chỗ và toàn thân hơn khi dùng các thuốc corticosteroid tại chỗ và nhìn chung thì yêu cầu thời gian điều trị ngắn hơn và các thuốc có tiềm lực yếu hơn so với người lớn.
Cần thận trọng khi sử dụng EUMOVATE để đảm bảo dùng một lượng thuốc tối thiểu mà vẫn có hiệu quả điều trị.
Người cao tuổi
Các nghiên cứu lâm sàng không xác định được sự khác biệt về đáp ứng điều trị giữa người bệnh cao tuổi và người bệnh trẻ tuổi. Nếu xảy ra hấp thu toàn thân, quá trình thải trừ thuốc ở người cao tuổi có thể chậm hơn do tần suất bị suy giảm chức năng gan hoặc thận ở các bệnh nhân này nhiều hơn. Do đó nên sử dụng lượng thuốc tối thiểu trong thời gian điều trị ngắn nhất để đạt được hiệu quả điều trị lâm sàng mong muốn.
Suy gan/thận
Trong trường hợp hấp thu toàn thân (khi sử dụng thuốc trên bề mặt da rộng trong thời gian dài), suy gan/thận có thể làm chậm quá trình chuyển hóa và thải trừ, do đó làm tăng nguy cơ độc tính toàn thân. Do đó nên sử dụng lượng thuốc tối thiểu trong thời gian điều trị ngắn nhất để đạt được hiệu quả điều trị lâm sàng mong muốn.
- Quá liều
EUMOVATE dùng tại chỗ có thể được hấp thu với lượng đủ để gây tác dụng toàn thân. Quá liều cấp tính hầu như không xảy ra, tuy nhiên trong trường hợp quá liều mạn tính hoặc lạm dụng thuốc, cường thượng thận có thể xảy ra (xem Tác dụng không mong muốn).
Trong trường hợp quá liều, nên ngừng sử dụng EUMOVATE dần dần bằng cách giảm số lần dùng thuốc hoặc thay thế bằng một corticosteroid có hiệu lực thấp hơn do có nguy cơ thiếu glucocorticosteroid.
Các kiểm soát chuyên sâu hơn nên được chỉ định dựa theo lâm sàng hoặc theo chỉ dẫn của trung tâm chống độc quốc gia nếu có.', 'Bảo quản dạng kem dưới 30°C.', '- Thận trọng khi sử dụng
Nên thận trọng khi sử dụng EUMOVATE ở bệnh nhân có tiền sử quá mẫn tại chỗ với corticosteroid hoặc với bất kỳ tá dược nào của thuốc.
Các phản ứng quá mẫn tại chỗ (xem Tác dụng không mong muốn) có thể tương tự các triệu chứng của bệnh đang điều trị. Cường thượng thận (hội chứng Cushing) và sự ức chế thuận nghịch trục dưới đồi - tuyến yên - thượng thận (trục HPA) có thể dẫn đến thiếu glucocorticosteroid ở một số bệnh nhân, đây là kết quả của sự tăng hấp thu toàn thân steroid dùng tại chỗ. Khi phát hiện thấy một trong các biểu hiện trên, ngừng dừng thuốc dần dần bằng cách giảm số lần dùng hoặc thay thế bằng một corticosteroid có hiệu lực thấp hơn.
Ngừng thuốc đột ngột có thể dẫn đến thiếu glucocorticosteroid (xem Tác dụng không mong muốn).
Các yếu tố nguy cơ của tăng tác dụng toàn thân bao gồm:
- Hiệu lực và công thức bào chế của steroid tại chỗ.
- Thời gian tiếp xúc với thuốc.
- Sử dụng thuốc trên một diện tích bề mặt rộng.
- Sử dụng trên vùng da bị băng kín, ví dụ: trên vùng bị hãm hoặc vùng da bị băng kín (ở trẻ em tã lót có thể gây tác dụng như khi băng kín).
- Tăng hydrat hóa lớp sừng.
- Sử dụng trên vùng da mỏng như da mặt.
- Sử dụng trên vùng da bị rách hoặc các trường hợp khác khi hàng rào bảo vệ da bị tổn thương.
- Trẻ em và trẻ sơ sinh có thể hấp thu một lượng corticosteroid dùng tại chỗ lớn hơn so với người lớn, do đó dễ gặp tác dụng không mong muốn toàn thân hơn. Điều này là do trẻ em có hàng rào bảo vệ da còn non nớt và tỉ lệ diện tích bề mặt so với cân nặng cao hơn người lớn.
Trẻ em
Ở trẻ em và trẻ nhỏ dưới 12 tuổi, nếu có thể nên tránh điều trị liên tục kéo dài với corticosteroid tại chỗ, vì ức chế tuyến thượng thận có thể dễ xảy ra hơn.
Nguy cơ nhiễm trùng vùng da băng kín
Điều kiện ấm, ẩm tại các nếp gấp của da hoặc khi da bị băng kín tạo thuận lợi cho sự nhiễm khuẩn. Cần làm sạch da trước khi băng kín.
Sử dụng thuốc trên mặt
Không nên sử dụng thuốc kéo dài trên mặt vì vùng này dễ bị teo da.
Sử dụng thuốc trên mí mắt
Nếu bôi thuốc vào mí mắt cần thận trọng để đảm bảo thuốc không vào mắt vì tiếp xúc nhiều lần có thể dẫn đến đục thủy tinh thể và glaucoma.
Nhiễm khuẩn kèm theo
Điều trị bằng kháng sinh thích hợp khi các tổn thương viêm đang điều trị corticosteroid tại chỗ bị nhiễm trùng. Khi có dấu hiệu nhiễm trùng lan rộng, cần phải ngừng sử dụng corticosteroid tại chỗ và dùng kháng sinh thích hợp.
Vết loét mạn tính ở chân
Corticosteroid tại chỗ đôi khi được sử dụng để điều trị viêm da quanh vết loét mạn tính ở chân. Tuy nhiên, việc sử dụng này có thể đi kèm với sự xảy ra nhiều hơn các phản ứng quá mẫn tại chỗ và tăng nguy cơ nhiễm trùng tại chỗ.
Nuốt nhầm thuốc
Thuốc chỉ được dùng ngoài da. Chế phẩm này và tất cả các thuốc khác nên được để xa tầm tay trẻ em. Trong trường hợp nuốt phải thuốc, nên ngay lập tức tìm trợ giúp chuyên môn hoặc liên hệ với trung tâm chống độc quốc gia (xem phần Quá liều).
- Thai kỳ và cho con bú
Dữ liệu về việc sử dụng EUMOVATE trên phụ nữ có thai còn hạn chế.
Sử dụng corticosteroid tại chỗ cho động vật mang thai có thể gây bất thường đối với sự phát triển bào thai (Xem Dữ liệu an toàn tiền lâm sàng). Mối liên quan của phát hiện này với người chưa được xác lập. Cân nhắc việc sử dụng EUMOVATE trong thai kỳ chỉ khi lợi ích mong đợi cho mẹ vượt trội nguy cơ đối với thai nhi. Nên sử dụng lượng thuốc ít nhất trong thời gian điều trị ngắn nhất vẫn chưa xác lập được tính an toàn của corticosteroid tại chỗ đối với phụ nữ cho con bú.
Vẫn chưa biết liệu việc dùng corticosteroid tại chỗ có thể gây ra hấp thu toàn thân đủ để bài tiết một lượng thuốc có thể phát hiện được trong sữa mẹ.
Chỉ nên cân nhắc việc sử dụng EUMOVATE trong thời gian cho con bú khi lợi ích mong đợi cho người mẹ vượt trội nguy cơ đối với trẻ.
Nếu sử dụng thuốc trong thời gian cho con bú, không nên bôi thuốc vào bầu vú để tránh việc trẻ nuốt phải thuốc.
Không có dữ liệu đánh giá ảnh hưởng của corticosteroid tại chỗ đến khả năng sinh sản ở người.
- Khả năng lái xe và vận hành máy móc
Chưa có nghiên cứu điều tra ảnh hưởng của EUMOVATE đến việc lái xe hoặc khả năng vận hành máy móc. Không thấy được ảnh hưởng bất lợi trên các hoạt động này từ hồ sơ tác dụng không mong muốn của EUMOVATE dùng tại chỗ.
- Tương tác thuốc
Việc dùng đổng thời với các thuốc ức chế CYP3A4 (ví dụ: ritonavir, itraconazole) đã cho thấy các thuốc này gây ức chế chuyển hóa của corticosteroid dẫn đến tăng tiếp xúc toàn thân. Mức độ của tương tác này có liên quan trên lâm sàng, phụ thuộc vào liều dùng, đường dùng corticosteroid và hiệu lực của chất ức chế CYP3A4.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000105'), 'Thuốc mỡ', '1 tuýp x 15g', 'Flucinar dạng mỡ được sử dụng ngắn hạn cho các trường hợp viêm da khô không nhiễm khuẩn đáp ứng với các glucocorticosteroid, kết hợp với bệnh ngứa dai dẳng và bệnh dày sừng. Flucinar được sử dụng trong các trường hợp viêm da tiết bã, viêm da dị ứng, mày đay do bệnh liken, eczema do dị ứng tiếp xúc, ban đỏ đa dạng, lupus ban đỏ, bệnh vảy nến lâu năm, liken phẳng.', 'Không sử dụng thuốc cho da bị nhiễm khuẩn, nhiễm nấm, nhiễm virut, viêm nang bã và bệnh trứng cá đỏ, viêm da quanh miệng, sau khi tiêm ngừa vaccin, và các trường hợp được biết là quá mẫn với fluocinolone acetonide hoặc các glucocorticosteroid khác và các thành phần tá dược. Không sử dụng thuốc cho trẻ em dưới 2 tuổi.', 'Các tác dụng không mong muốn đã gặp bao gồm: mụn trứng cá, ban xuất huyết sau khi dùng steroid, ức chế sự phát triển của biểu mô, teo mô dưới da, khô da, mọc lông quá mức hoặc rụng tóc, đổi màu da, teo và nứt da, giãn mạch, viêm da quanh miệng, viêm nang lông và nhiễm trùng thứ cấp. Đôi khi xảy ra mày đay, ban dát sần, hoặc làm tăng thương tổn ở vùng da sử dụng thuốc. Khi sử dụng thuốc, nếu băng kín sẽ làm tăng hấp thu thuốc, có thể dẫn đến tác dụng toàn thân, biểu hiện như phù mạch, tăng huyết áp, và giảm miễn dịch. Sử dụng ngoài trên vùng da ở mí mắt đôi khi có thể dẫn đến Glôcôm hoặc đục nhân mắt.', 'Dùng một lượng nhỏ thuốc bôi lên vùng da nhiễm bệnh, không quá 1 - 2 lần một ngày. Không băng kín vùng da sử dụng thuốc, ngoại trừ trường hợp vảy nến, có thể băng kín và phải thay băng hàng ngày.
Không sử dụng thuốc liên tục quá 2 tuần. Trên mặt không sử dụng quá 1 tuần. Không sử dụng quá 1 tuýp thuốc cho một tuần.
Cần thận trọng khi sử dụng thuốc cho trẻ em dưới 2 tuổi, chỉ sử dụng thuốc khi thật sự cần thiết, chỉ sử dụng 1 lần một ngày, không sử dụng thuốc trên da mặt.
- Quá liều
Sử dụng thuốc kéo dài và trên vùng da rộng có thể dẫn đến xuất hiện các triệu chứng quá liều như phù mạch, cao huyết áp, tăng đường huyết, giảm miễn dịch và trường hợp nặng có thể xảy ra bệnh Cushing, thuốc phải được ngưng sử dụng từ từ hoặc phải sử dụng các thuốc glucocorticosteroid có tác dụng nhẹ hơn', 'nhiệt độ và độ ẩm của da, cũng như dẫn đến tăng hấp thu fluocinolone acetonide. Hấp thu cũng tăng lên khi tăng tần suất sử dụng hoặc sử dụng trên vùng da rộng. Hấp thu qua da ở bệnh nhân trẻ lớn hơn so với bệnh nhân già.', '- Thận trọng khi sử dụng
Tránh sử dụng thuốc liên tục quá 2 tuần. Khi sử dụng thuốc dài ngày trên vùng da rộng, có thể làm tăng tần suất của các tác dụng không mong muốn, có thể gây phù nề, cao huyết áp, tăng đường huyết và giảm miễn dịch.
Dưới ảnh hưởng của việc sử dụng fluocinolone acetonide ngoài da, giảm bài tiết hocmon hướng vỏ thượng thận (ACTH) bởi tuyến yên có thể xảy ra, nghĩa là ức chế trục thượng thận - tuyến yên, dẫn đến giảm nồng độ cortisol trong máu và hội chứng Cushing. Tình trạng này sẽ giảm khi ngừng sử dụng thuốc. Thử định kỳ chức năng tuyến thượng thận được chỉ định bằng cách xác định nồng độ cortisol trong máu và nước tiểu sau khi kích thích tuyến thượng thận với ACTH.
Trong trường hợp nhiễm khuẩn hoặc nấm ở vị trí sử dụng thuốc, cần tiến hành điều trị với các thuốc kháng khuẩn và kháng nấm thích hợp. Nếu các triệu chứng nhiễm kéo dài, cần ngưng sử dụng thuốc cho đến khi khỏi hẳn.
Tránh sử dụng thuốc ở mí mắt hoặc vùng da gần mí mắt cho các bệnh nhân Glôcôm góc hẹp và góc rộng, cũng như ở các bệnh nhân đục nhân mắt vì có thể làm tăng các triệu chứng bệnh
Chỉ sử dụng thuốc trên da mặt và háng khi thật sự cần thiết vì tăng hấp thu và dễ xảy ra các tác dụng không mong muốn (giãn mao mạch, viêm da quanh miệng) thậm chí xảy ra sau khi sử dựng thời gian ngắn.
Cần sử dụng thận trọng cho các trường hợp teo mô dưới da, đặc biệt ở các bệnh nhân già.
- Thai kỳ và cho con bú
Sử dụng thuốc cho phụ nữ có thai: loại C
Các nghiên cứu trên động vật cho thấy rằng các glucocorticosteroid bộc lộ tính sinh quái thai, thậm chí khi sử dụng liều uống nhỏ. Tác dụng sinh quái thai cũng được tìm thấy ở động vật sử dụng ngoài da glucocorticosteroid. Không có các nghiên cứu có kiểm soát khi sử dụng fluocinolone acetonide trên da cho phụ nữ có thai.
Flucinar có thể được sử dụng cho phụ nữ có thai khi lợi ích của việc dùng thuốc lớn hơn khả năng gây hại cho thai nhi.
Tuyệt đối không sử dụng thuốc trong 3 tháng đầu của thai kỳ.
Sử dụng thuốc cho phụ nữ nuôi con bú:
Không biết fluocinolone acetonide khi sử dụng ngoài da có bài tiết vào sữa mẹ hay không. Sau khi sử dụng liều uống các glucocorticosteroid, không có một lượng đáng kể các hocmon này, có khả năng gây nên bất kỳ tác dụng có hại nào cho trẻ sơ sinh được tìm thấy trong sữa mẹ. Tuy nhiên, cần đặc biệt thận trọng khi sử dụng thuốc cho phụ nữ nuôi con bú.
- Khả năng lái xe và vận hành máy móc
Thuốc không ảnh hưởng đến khả năng lái xe và vận hành máy móc.
- Tương tác thuốc
Không có tương tác nào được biết liên quan đến việc sử dụng các glucocorticosteroid ngoài da. Tuy nhiên, cần lưu ý rằng các bệnh nhân không được tiêm vaccin thủy đậu và các thuốc miễn dịch khác, đặc biệt khi sử dụng thuốc lâu dài trên vùng da rộng, bởi vì có thể làm giảm đáp ứng miễn dịch.
Flucinar có thể làm tăng tác dụng của các thuốc ức chế miễn dịch và làm giảm tác dụng của các thuốc ức chế kích thích.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000122'), 'Kem bôi', '1 tuýp x 15g', 'Dùng Fucicort trong viêm da nhiễm khuẩn hoặc có thể bị nhiễm khuẩn.', 'Được biết mẫn cảm với acid fusidic/natri fusidate, betamethasone valerate hoặc với bất kỳ tá dược nào.
Vì có chứa corticosteroid nên kem Fucicort được chống chỉ định cho những trường hợp sau: nhiễm trùng da khởi phát bởi vi khuẩn, nấm hoặc virut (như herpes hay thủy đậu), các bệnh về da liên quan tới bệnh lao da hoặc giang mai, viêm quanh miệng và trứng cá đỏ.', 'Rất hay gặp >1/10
Hay gặp >1/100 và
Không hay gặp > 1/1000 và 1/100
Hiếm gặp > 1/1000 và
Rất hiếm
Tác dụng không mong muốn phổ biến nhất được báo cáo là các triệu chứng đa dạng kích ứng tại nơi dùng. Các phản ứng dị ứng cũng được báo cáo.
Dựa trên các dữ liệu lâm sàng đối với Fucicort khoảng 3% bệnh nhân đã từng gặp phải phản ứng không mong muốn. Kích ứng da thoáng qua, cảm giác nhức nhối và nóng nóng đỏ, bệnh ngứa, phát ban, và eczema trầm trọng là không phổ biến.
Rối loạn hệ thống miễn dịch
Rất hiếm: Phản ứng dị ứng
Rối loạn da và mô dưới da
Không hay gặp: Eczema trầm trọng, viêm da tiếp xúc, da khô, phát ban, kích ứng da, cảm giác nóng đỏ da, cảm giác nhức nhối da, ngứa, ban đỏ
Rất hiếm: Teo da, chứng giãn mao mạch.
Các tác dụng phụ được quan sát thấy với corticosteroid gồm:
Teo da, chứng giãn mao mạch và vân da, đặc biệt khi dùng kéo dài, xuất hiện nhiều nang bạch huyết, rậm lông, viêm quanh miệng, viêm da dị ứng tiếp xúc, mất sắc tố, hoạt tính hệ thống như tăng nhãn áp và chẹn adrenocorticoid.
Thông báo cho bác sĩ các tác dụng không mong muốn khi phải sử dụng thuốc.', 'Bôi một lượng thuốc nhỏ lên vùng da bị ảnh hưởng, bôi 2 lần mỗi ngày cho tới khi đạt được kết quả mong muốn. Một liệu trình điều trị đơn không nên kéo dài quá 2 tuần.
- Quá liều
Sử dụng các corticosteroid tại chỗ quá liều kéo dài có thể làm ngừng chức năng tuyến yên-thượng thận gây ra suy thận thứ cấp nhưng thường ổn định lại được. Trong trường hợp đó cần phải điều trị triệu chứng.', 'Bảo quản dưới 30°C.', '- Thận trọng khi sử dụng
Nên tránh điều trị dài ngày với corticosteroid, đặc biệt đối với trẻ sơ sinh và trẻ em. Sự ức chế vỏ tuyến thượng thận có thể xảy ra thậm chí cả khi không băng kín. Hiện tượng teo da có thể xảy ra ở mặt và nhẹ hơn ở các bộ phận khác của cơ thể sau khi điều trị kéo dài với các thuốc chứa corticosteroid tại chỗ. Thận trọng khi bôi thuốc gần mắt. Bệnh tăng nhãn áp có thể xảy ra nếu thuốc thấm vào trong mắt. Phải dùng hóa trị liệu theo đường toàn thân nếu nhiễm khuẩn kéo dài.
Sự kháng lại thuốc của vi khuẩn đã được báo cáo khi sử dụng acid fusidic. Cũng như với tất cả các kháng sinh khác, việc sử dụng kéo dài hoặc lặp lại có thể làm tăng nguy cơ kháng thuốc.
Việc sử dụng kết hợp giữa kháng sinh với corticosteroid nên hạn chế trong vòng 2 tuần vì các corticosteroid có thể che dấu sự nhiễm trùng hoặc các phản ứng quá mẫn.
Vì có chứa corticosteroid nên cần tránh sử dụng kem Fucicort trong những trường hợp sau: teo da, loét da, trứng cá thông thường, vùng sinh dục, chỗ nếp gấp.
Thận trọng khi dùng Fucicort trên diện rộng cơ thể và mặt. Tránh dùng thuốc chỗ vết thương hở và niêm mạc nhầy.
Kem Fucicort có chứa cetostearyl alcol mà có thể gây ra phản ứng da tại chỗ (như viêm da tiếp xúc) và chứa chlorocresol có thể gây ra các phản ứng dị ứng.
- Thai kỳ và cho con bú
Phụ nữ có thai
Tính an toàn về sử dụng kem Fucicort trên phụ nữ có thai và cho con bú vẫn chưa được xác định. Nghiên cứu trên động vật không cho thấy tác động quái thai bởi fusidic acid nhưng nghiên cứu khi dùng corticosteroid đã cho thấy có tác động quái thai. Nguy cơ tiềm tàng cho con người vẫn chưa được biết. Không nên dùng Fucicort trong quá trình mang thai hay cho con bú nếu chưa thực sự cần thiết.
Cho con bú
Không thấy có sự ảnh hưởng đến trẻ đang bú mẹ bởi vì sự hấp thu toàn thân acid fusidic và betamethasone ở phụ nữ cho bú là không đáng kể khi dùng tại chỗ trên 1 vùng da hạn chế. Fucicort có thể sử dụng được trong thời kỳ cho con bú. Không nên bôi Fucicort lên vùng vú ở phụ nữ đang cho bú.
- Khả năng lái xe và vận hành máy móc
Fucicort có ảnh hưởng hoặc ảnh hưởng không đáng kể đến khả năng lái xe và vận hành máy móc.
- Tương tác thuốc
Chưa được biết.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000119'), 'Kem bôi', '1 tuýp x 10g', 'Dùng ngoài da trong các chỉ định sau khi có mặt, nghi ngờ hoặc có thể xảy ra nhiễm trùng thứ phát do vi khuẩn và/hoặc nấm: Chàm, kể cả chàm dị ứng, chàm ở trẻ em, và chàm hình đĩa; sẩn ngứa nổi cục; vẩy nến (ngoại trừ vẩy nến dạng mảng lan rộng); các bệnh da do thần kinh, kể cả liken đơn, liken phẳng; viêm da tiết bã nhờn; các phản ứng dị ứng da do tiếp xúc: Lupus ban đỏ hình đĩa.', 'Bệnh nhân quá mẫn với bất kỳ thành phần nào của thuốc.
Không dùng thuốc này cho mắt.', 'Các tác dụng không mong muốn sau có thể xảy ra khi dùng thuốc: cảm giác bỏng rát, ngứa, dát sần, phù, bội nhiễm, ban đỏ, mụn nước, bong da, nổi mày đay và kích ứng da.
Cũng như các corticoid tác dụng tại chỗ khác, khi được sử dụng với một lượng lớn kéo dài hoặc được điều trị trên một diện tích da rộng lớn, thuốc có thể được hấp thu toàn thân với một lượng đủ để gây nên các biểu hiện của tình trạng cường vỏ thượng thận. Tác dụng này dễ xảy ra hơn ở trẻ nhũ nhi và trẻ em, và trong cách điều trị có băng kín.
Thông báo cho bác sĩ những tác dụng không mong muốn gặp phải khi dùng thuốc.', 'Thoa thuốc lên vùng da bị bệnh và xung quanh đó hai đến ba lần mỗi ngày.
Để việc điều trị có kết quả, nên thoa thuốc đều đặn. Thời gian trị liệu phụ thuộc vào mức độ, vị trí của vùng da bệnh và sự đáp ứng của người bệnh. Tuy nhiên, nếu không có cải thiện lâm sàng sau bốn tuần thoa thuốc, nên xem lại chẩn đoán; đặc biệt đối với trẻ em không quá 2 tuần, trẻ sơ sinh không quá 1 tuần.
- Quá liều
Chưa có báo cáo về việc sử dụng thuốc quá liều.', NULL, '- Thận trọng khi sử dụng
Không nên dùng thuốc diện rộng hoặc dùng thuốc thời gian dài. Không nên dùng thuốc dưới dạng băng ép.
Corticosteroid dùng tại chỗ để điều trị bệnh vẩy nến có thể gây hại cho người bệnh do phản ứng dội ngược, mà nguy cơ là xuất hiện vảy nến mụn mủ, và thuốc sẽ gây độc tính tại chỗ và toàn thân cho người bệnh do chức năng bảo vệ của da bị suy giảm.
- Thai kỳ và cho con bú
Chỉ dùng thuốc này cho phụ nữ có thai khi lợi ích của việc điều trị cần phải được đặt lên trên các nguy cơ có thể xảy ra đối với bào thai, do chưa có đủ bằng chứng về độ an toàn của thuốc khi dùng cho phụ nữ có thai.
- Tương tác thuốc
Chưa có báo cáo nào về tương tác thuốc.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000108'), 'Kem bôi', '1 tuýp x 10g', '- Giảm các đợt viêm và ngứa của bệnh viêm da và dị ứng da đáp ứng với corticosteroid: chàm cấp và mạn tính, viêm da tiếp xúc, viêm da dị ứng, viêm da tăng tiết bã nhờn, liken phẳng mạn tính, viêm da bong vảy, mề đay, bệnh vảy nến, ngứa hậu môn, âm hộ, vết bỏng nhẹ hay vết đốt côn trùng.
- Điều trị nấm da do Candida albicans và lang ben do Malassezia furfur. Điều trị nấm thân (lác, hắc lào), nấm bẹn và nấm bàn chân do Trichophyton rubrum, T.mentagrophytes, Epidermophyton floccosum, hoặc Microsporum canis gây ra.
- Nhiễm trùng bề mặt da do các chủng vi khuẩn nhạy cảm gây ra.', '- Lao da, Herpes Simplex, thuỷ đậu, Herpes Zoster, ban đậu bò, giang mai.
- Viêm da chàm hóa vùng ống tai ngoài với màng nhĩ bị thủng.
- Loét da, bỏng từ độ 2 trở lên, bệnh cước.
- Tiền sử mẫn cảm với kháng sinh Aminoglycosides (Streptomycin, Kanamycin, Gentamicin, Neomycin,...), Bacitracin hoặc các thành phần khác của SHINPOONG GENTRI-SONE.', '- Bội nhiễm do nấm hoặc vi khuẩn có thể xảy ra.
- Ngưng thuốc khi bị kích thích da hoặc phát ban.
- Sử dụng thuốc trên vùng da rộng, dùng thuốc dài ngày hoặc băng đắp kín vết thương có thể xảy ra tác dụng phụ liên quan đến Betamethason: teo biểu bì, teo mô dưới da, mỏng da, kích ứng, ngứa, đỏ da, sưng phồng, phát ban, mụn nước, mụn trứng cá,... khi đó nên ngưng dùng thuốc. Sự hấp thu toàn thân có thể gây ức chế thuận nghịch trục HPA, hội chứng Cushing, tăng đường huyết và đường niệu; mất kali, giữ natri và nước, kinh nguyệt thất thường, ức chế tăng trưởng của thai trong tử cung và của trẻ nhỏ, giảm dung nạp glucose, bộc lộ đái tháo đường tiềm ẩn, tăng nhu cầu insulin hoặc thuốc hạ đường huyết ở người đái tháo đường, yếu cơ, mất khối lượng cơ, loãng xương, áp xe vô khuẩn, v,v...
Thông báo bác sĩ các tác dụng phụ gặp phải khi dùng thuốc.', 'Bôi một lượng nhỏ kem SHINPOONG GENTRI-SONE lên vùng tổn thương một hoặc vài lần trong ngày.
* Lưu ý khi dùng thuốc:
- Trường hợp viêm da hoặc chàm có nhiễm trùng da nên dùng phối hợp với thuốc kháng sinh, kháng nấm đường toàn thân.
- Ngoại trừ những trường hợp đặc biệt, cần tránh bôi thuốc trên một vùng da rộng, dùng thuốc dài ngày hoặc băng đắp kín vết thương vì có thể làm tăng sự hấp thu toàn thân của thuốc.
- Không bôi thuốc vào mắt.
- Quá liều
Khi vô tình nuốt phải thuốc: Áp dụng các biện pháp hỗ trợ và điều trị triệu chứng thích hợp. Những biện pháp thường quy như rửa dạ dày chỉ được tiến hành khi những triệu chứng quá liều xuất hiện rõ ràng trên lâm sàng (chóng mặt, buồn nôn hoặc ói mửa) và chỉ khi đã bảo vệ được đường thở đầy đủ.', 'nhiệt độ dưới 30°C.', '- Thận trọng khi sử dụng
- Độc tính toàn thân và cục bộ thường xảy ra, nhất là khi dùng thuốc kéo dài trên một vùng da bị tổn thương sâu và rộng, trên vùng da bị gấp cong hoặc bị băng đắp. Nếu dùng thuốc cho trẻ em hoặc khi bôi lên mặt thì tốt nhất là chỉ dùng trong 5 ngày. Tránh dùng thuốc kéo dài ở tất cả người bệnh, bất kể tuổi tác.
- Hạn chế dùng thuốc cho trẻ sơ sinh và trẻ em nếu việc mang tã gây hiệu ứng như một sự băng đắp hoặc khi thuốc có thể hấp thu vào máu và dẫn đến ức chế tuyến thượng thận.
- Corticosteroid dùng tại chỗ có thể gây một số bất lợi khi điều trị vẩy nến (tái phát ngược lại do sự dung nạp thuốc tăng lên, nguy cơ phát triển rộng vẩy nến thể mủ, độc tính toàn thân hoặc tại chỗ do chức năng bảo vệ của da bị suy giảm). Cần theo dõi cẩn thận.
- Sự hấp thu của corticosteroid dùng tại chỗ vào máu có thể gây ức chế thuận nghịch trực hạ đồi-tuyến yên-thượng thận (HPA), dẫn đến khả năng giảm glucocorticosteroid sau khi ngưng thuốc, và có thể làm xuất hiện hội chứng Cushing. Thận trọng trong trường hợp suy tim sung huyết, nhồi máu cơ tim mới mắc, tăng huyết áp, đái tháo đường, động kinh, glôcôm, thiểu năng tuyến giáp, suy gan, loãng xương, loét dạ dày, loạn tâm thần và suy thận. Dùng kéo dài có thể gây đục thể thủy tinh (đặc biệt ở trẻ em), glôcôm với khả năng tổn thương dây thần kinh thị giác.
- Thai kỳ và cho con bú
- Chưa có nghiên cứu đầy đủ về việc dùng thuốc này trong thai kỳ. Chỉ nên dùng thuốc cho phụ nữ có thai khi lợi ích của thuốc lớn hơn nguy cơ tiềm ẩn đối với thai nhi.
- Chưa rõ việc dùng ngoài da clotrimazol, gentamicin và betamethason có dẫn đến sự hấp thu toàn thân ở nồng độ đủ để có thể phát hiện được trong sữa mẹ hay không, cần cân nhắc việc ngưng thuốc hoặc ngưng cho con bú dựa trên tầm quan trọng của thuốc đối với người mẹ.
- Khả năng lái xe và vận hành máy móc
Không ảnh hưởng.
- Tương tác thuốc
Chưa có nghiên cứu về tương tác thuốc đối với dạng bôi ngoài da. Khi hấp thu toàn thân, các tương tác thuốc có thể xảy ra.
- Betamethason có thể tương tác với: paracetamol (tăng nguy cơ nhiễm độc gan); thuốc chống trầm cảm ba vòng (có thể tăng các rối loạn tâm thần do corticosteroid); thuốc chống đái tháo đường uống hoặc insulin (nên điều chỉnh liều nếu cần); glycosid digitalis (có thể tăng khả năng loạn nhịp tim hoặc độc tính của digitalis kèm với hạ kali huyết); phenobarbital, phenytoin, rifampicin, ephedrin (có thể tăng chuyển hóa corticosteroid và làm giảm tác dụng điều trị của chúng); estrogen (thay đổi chuyển hóa và mức liên kết protein của glucocorticoid, dẫn đến giảm độ thanh thải, tăng nửa đời thải trừ, tăng tác dụng điều trị và độc tính của glucocorticoid); thuốc chống đông loại coumarin (tăng hoặc giảm tác dụng chống đông); kháng viêm không steroid, aspirin, rượu (tăng tác dụng phụ trên tiêu hóa, gây chảy máu).
- Clotrimazol có thể tương tác với: tacrolimus (tăng nồng độ trong huyết thanh của người bệnh ghép gan tăng, nên giảm liều tacrolimus theo nhu cầu).', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000153'), 'Kem bôi', '1 tuýp x 10g', 'Được dùng ngoài để chữa các bệnh viêm da tiếp xúc kích ứng, viêm da tiếp xúc dị ứng, phản ứng côn trùng cắn, bệnh eczema ở mức độ nhẹ đến trung bình.', 'Mẫn cảm với bất kỳ thành phần nào của thuốc.
Không bôi thuốc trên mắt hoặc trên mặt (ví dụ mụn trứng cá, trứng cá đỏ hoặc viêm da quanh miệng), vùng da quanh bộ phận sinh dục, vết thương hở, da bị nhiễm khuẩn, chốc lở, vết côn trùng cắn hoặc đốt bị nhiễm khuẩn.
Người bị nhiễm khuẩn, nhiễm virus (thủy đậu, zona, herpes) nhiễm nấm hay ký sinh trùng, loét da.', '- Nếu có dấu hiệu quá mẫn cảm, bao gồm viêm tiếp xúc dị ứng hoặc tình trạng trầm trọng hơn xảy ra, nên ngưng ngay việc điều trị.
- Những tác dụng phụ liên quan đến corticosteroid dạng dùng tại chỗ có thể xảy ra:
Hệ cơ quan
Tần suất
Tác dụng phụ
Các rối loạn trên da và các tổ chức dưới da
Chưa biết đến
Teo da, chứng giãn mao mạch, rạn da, mụn trứng cá, mụn trứng cá đỏ, rối loạn sắc tố da, tăng sắc tố da.
Rối loạn cơ xương
và mô liên kết
Chưa biết đến
Rối loạn collagen
Thông báo ngay cho bác sĩ hoặc dược sĩ những phản ứng có hại gặp phải khi sử dụng thuốc.', 'Liều dùng:
Bôi thuốc 1-2 lần/ ngày, dùng thuốc không quá 7 ngày. Nếu tình trạng bệnh không cải thiện, phải hỏi ý kiến bác sĩ.
Người cao tuổi: Không cần thiết phải điều chỉnh liều dùng ở người cao tuổi.
Trẻ em: Đối với trẻ em trên 10 tuổi, dùng liều như người lớn. Không nên sử dụng sản phẩm này ở trẻ em dưới 10 tuổi khi không có ý kiến của bác sĩ.
Cách dùng:
Chỉ dùng bôi ngoài da
Bôi 1 chấm nhỏ thuốc lên vùng da bị bệnh. Massage nhẹ nhàng vào da.
- Quá liều
Quá liều rất khó xảy ra. Không có biện pháp phòng ngừa đặc biệt hoặc thuốc giải độc đặc hiệu. Dùng thuốc quá liều hoặc lạm dụng thuốc có thể làm tăng nguy cơ xuất hiện các tác dụng phụ có liên quan đến corticosteroid dùng tại chỗ hoặc toàn thân, bao gồm ức chế trục hạ đồi - tuyến yên - thượng thận (HPA) và hội chứng Cushing.
Cách xử trí:
Tùy triệu chứng mà điều trị thích hợp. Nếu sự ức chế trục HPA được ghi nhận, nên thử ngừng thuốc, giảm tần suất sử dụng, hoặc thay thế bằng một loại steroid tác dụng yếu hơn.Các triệu chứng quá liều corticoid cấp tính thì có thể hồi phục thực sự. Điều chỉnh mất cân bằng điện giải, nếu cần. Trong các trường hợp gây độc mãn tính, nên giảm dần lượng steroid.', 'nhiệt độ dưới 30°C, tránh ánh sáng.', '- Thận trọng khi sử dụng
Nếu tình trạng bệnh không cải thiện, hãy hỏi ý kiến bác sĩ. Không nên sử dụng trong thời gian dài vì có thể gây teo da, sưng phồng và giãn mạch trên bề mặt.
Trong công thức thuốc có chứa các thành phần tá dược cần phải sử dụng thận trọng:
Cetostearyl alcohol (bao gồm cả Cetyl alcohol): Có thể gây phản ứng da tại chỗ ( ví dụ: viêm da tiếp xúc)
Propylene glycol: Propylene glycol có thể gây kích ứng da. Không sử dụng thuốc có chứa propylene glycol trên vết thương hở hoặc trên vùng da bị tổn thương hoặc da bị bỏng mà không có tham vấn với bác sĩ hoặc dược sĩ. Không dùng cho trẻ em dưới 4 tuần tuổi.
Polyoxyl 40 hydrogenated castor oil: Có thể gây phản ứng dị ứng trên da.
Lưu ý: Không dùng thuốc quá 30 ngày kể từ khi mở nắp tuýp thuốc Số lô sản xuất, ngày sản xuất và hạn sử dụng xem trên bao bì chính của sản phẩm.
- Thai kỳ và cho con bú
- Sử dụng thuốc cho phụ nữ có thai:
Chỉ sử dụng theo sự chỉ định và sự theo dõi của thầy thuốc.
Sử dụng corticosteroid khi mang thai hoặc ở người có khả năng mang thai phải cân nhắc giữa lợi ích và nguy cơ của thuốc đối với người mẹ và phôi hoặc thai nhi.
- Sử dụng thuốc ở phụ nữ cho con bú:
Không nên sử dụng thuốc này trong thời gian cho con bú trừ khi được bác sĩ khuyến cáo. Corticosteroid được bài tiết vào trong sữa mẹ. Không có thông tin về các tác dụng của thuốc trên việc tiết sữa. Nguy cơ đối với trẻ sơ sinh. không thể bị loại trừ do thuốc bài xuất vào sữa mẹ và có thể có hại cho trẻ nhỏ, có thể ức chế sự phát triển của trẻ và gây các tác dụng không mong muốn khác. Lợi ích cho người mẹ phải được cân nhắc với khả năng nguy hại cho trẻ nhỏ.
- Khả năng lái xe và vận hành máy móc
Không ảnh hưởng.
- Tương tác thuốc
Tương tác của thuốc: Chưa có thông tin.
Tương kỵ của thuốc: Do không có các nghiên cứu về tính tương kỵ của thuốc, không trộn lẫn thuốc này với các thuốc khác.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '9253123000095'), 'Dung dịch', '1 chai x 50ml', 'Dầu gội Nizoral điều trị và dự phòng nhiễm nấm men Malassezia  (trước đây gọi là Pityrosporum), như là lang ben (khu trú), viêm da tiết bã và pityriasis capitis (gàu).', 'Chống chỉ định dùng NIZORAL shampoo 2% cho người mẫn cảm với bất kỳ thành phần nào của thuốc.', 'Những phản ứng bất lợi sẽ được trình bày trong phần này. Phản ứng bất lợi là những biến cố bất lợi được xem là có liên quan hợp lý đến việc sử dụng ketoconazol dựa trên đánh giá toàn diện của những thông tin về biến cố bất lợi sẵn có. Mối quan hệ nhân quả với ketoconazol không được thiết lập một cách đáng tin cậy từ các ca riêng lẻ. Hơn nữa, do những thử nghiệm lâm sàng được thực hiện trong những điều kiện rất khác nhau, tỷ lệ phản ứng bất lợi ghi nhận trong những thử nghiệm lâm sàng của một thuốc không thể so sánh trực tiếp với tỷ lệ trong những thử nghiệm lâm sàng của thuốc khác và không thể phản ánh được tỷ lệ ghi nhận được trên thực tế lâm sàng.
Dữ liệu nghiên cứu lâm sàng
Tính an toàn của NIZORAL shampoo 2% được đánh giá trên 2890 đối tượng nghiên cứu trong 22 nghiên cứu lâm sàng, trong đó NIZORAL shampoo 2% được sử dụng tại chỗ trên da đầu và/hoặc trên da.
Không có phản ứng bất lợi (ADRs) được báo cáo ≥ 1% đối tượng nghiên cứu điều trị với NIZORAL shampoo 2%.
Các phản ứng bất lợi xảy ra
Bảng 1: Phản ứng bất lợi xảy ra
Phân loại theo hệ thống cơ quan
Thuật ngữ thường sử dụng
Các rối loạn về mắt
Kích ứng mắt
Tăng tiết nước mắt
Các rối loạn toàn thân và tình trạng tại chỗ sử dụng thuốc
Ban đỏ tại chỗ
Kích ứng tại chỗ
Mẫn cảm tại chỗ
Ngứa tại chỗ
Mụn mủ tại chỗ
Phản ứng tại chỗ
Rối loạn hệ miễn dịch
Quá mẫn cảm
Nhiễm khuẩn và ký sinh trùng
Viêm nang lông
Rối loạn hệ thần kinh
Rối loạn vị giác
Rối loạn da và mô dưới da
Mụn trứng cá
Rụng tóc
Viêm da tiếp xúc
Khô da
Bất thường cấu trúc tóc
Phát ban
Cảm giác bỏng rát da
Rối loạn da
Tróc da
Dữ liệu hậu mãi
Cùng với những phản ứng bất lợi được báo cáo trong các nghiên cứu lâm sàng và được liệt kê bên trên, những phản ứng bất lợi sau được ghi nhận trong giai đoạn hậu mãi (Bảng 2). Trong bảng này, tần suất được tính theo qui ước sau:
Rất thường gặp ≥ 1/10.
Thường gặp ≥ 1/100 và
Không thường gặp ≥ 1/1000 và
Hiếm gặp ≥ 1/10000 và
Rất hiếm
Trong bảng 2, các phản ứng bất lợi được thể hiện theo phân loại tần suất dựa trên tỷ lệ báo cáo tự phát
Bảng 2: Phản ứng bất lợi được ghi nhận trong giai đoạn hậu mãi của NIZORAL shampoo 2% được phân loại theo tần suất ước tính từ tỷ lệ báo cáo tự phát
Rối loạn da và mô dưới da
Rất hiếm: phù mạch, mày đay, đổi màu tóc
Thông báo cho bác sĩ những tác dụng không mong muốn gặp phải khi sử dụng thuốc.', 'Liều dùng:
Thông thường, một lượng nhỏ trong lòng bàn tay hoặc một gói dầu gội là vừa đủ cho một lần gội.
Điều trị:
Lang ben: một lần mỗi ngày trong 5 ngày.
Viêm da tiết bã và pityriasis capitis (gàu): 2 lần mỗi tuần trong 2 đến 4 tuần.
Dự phòng:
Lang ben: một lần mỗi ngày trong 3 ngày, trong một đợt điều trị duy nhất trước khi vào hè.
Viêm da tiết bã và pityriasis capitis (gàu): một lần với 1 hoặc 2 tuần.
Đối tượng đặc biệt:
Trẻ em:
Sử dụng hiệu quả và an toàn của NIZORAL shampoo 2% trên trẻ nhỏ và trẻ em dưới 12 tuổi chưa được nghiên cứu.
Cách dùng:
Dùng tại chỗ cho da đầu hoặc da.
Gội hoặc rửa kỹ vùng da hay da đầu bị nhiễm nấm bằng NIZORAL shampoo 2%. Nên để cho dầu gội tiếp xúc với da đầu từ 3 – 5 phút trước khi xả nước.
- Quá liều
Trong trường hợp vô ý uống vào, nên thực hiện các biện pháp điều trị hỗ trợ và triệu chứng.
Nhằm tránh hít phải, không nên thực hiện các biện pháp gây nôn hay rửa dạ dày.', 'Bảo quản ở 25°C hay thấp hơn', '- Thận trọng khi sử dụng
Những bệnh nhân đã sử dụng corticosteroid bôi tại chỗ trong thời gian dài nên giảm liều dần và ngưng hẳn trong vòng 2 đến 3 tuần trong khi sử dụng NIZORAL shampoo 2% để ngăn ngừa hiện tượng dội ngược.
Tránh để dầu gội tiếp xúc với mắt. Nếu dầu gội vào mắt thì nên rửa mắt bằng nước sạch.
- Thai kỳ và cho con bú
Phụ nữ có thai
Chưa có các nghiên cứu đầy đủ và được kiểm chứng tốt trên phụ nữ có thai. Không tìm thấy ketoconazol trong huyết tương của những người không mang thai sau khi sử dụng NIZORAL shampoo 2% trên da đầu. Khi sử dụng NIZORAL shampoo 2% trên toàn cơ thể thì có phát hiện được ketoconazol trong huyết tương.
Chưa xác định được những nguy cơ có liên quan đến việc sử dụng NIZORAL shampoo 2% ở phụ nữ có thai.
Phụ nữ cho con bú
Không có các nghiên cứu đầy đủ và được kiểm chứng tốt trên phụ nữ đang cho con bú. Chưa xác định được những nguy cơ có liên quan đến việc sử dụng NIZORAL shampoo 2% ở phụ nữ đang cho con bú.
- Khả năng lái xe và vận hành máy móc
Không có dữ liệu.
- Tương tác thuốc
Tương kỵ: Chưa được biết.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000125'), 'Dạng kem', '1 tuýp x 10g', 'Kem PHILDOMINA được dùng để tẩy trắng từ từ trong các trường hợp tăng sắc tố da như: nám da, sạm da, tàn nhang, nốt ruồi (những dát nhỏ tương tự như tàn nhang), và những vùng da khác bị tăng sắc tố. Vì chỉ cần tiếp xúc với tránh ánh sáng mắt trời ở mức độ tối thiểu cũng có thể làm đảo nghịch tác dụng tẩy trắng của chế phẩm nên chỉ dùng chế phẩm vào ban đêm hoặc trên những vùng da được che phủ.
Ban ngày nên tránh ánh sáng mặt trời hoặc dùng kem chống nắng hoặc quần áo bảo vệ để ngăn chặn sự nhiễm sắc tố trở lại trên vùng da đã được tẩy trắng.', 'Bệnh nhân có tiền sử quá mẫn hoặc phản ứng dị ứng với thuốc hoặc bất kỳ thành phần nào của thuốc. Độ an toàn của việc dùng hydroquinone trong thời gian mang thai hoặc cho trẻ em (dưới 12 tuổi) chưa được xác định.', 'Phản ứng dị ứng có thể xảy ra nhưng hiếm gặp.
* Thông báo cho bác sĩ hoặc dược sĩ những tác dụng không mong muốn gặp phải khi dùng thuốc.', 'Bôi thuốc lên vùng da bệnh và thoa đều, mỗi ngày một lần vào ban đêm. Không nên dùng thuốc đối với trẻ em dưới 12 tuổi trừ khi có sự chỉ định và theo dõi của bác sĩ.
- Quá liều
Người trưởng thành dùng 300 - 500mg hydroquinone/ngày trong vòng 3 - 5 tháng vẫn không cho thấy bị ngộ độc thuốc.', 'nhiệt độ dưới 30°C.', '- Thận trọng khi sử dụng
Hydroquinone là tác nhân tẩy trắng da có thể gây ra những tác dụng không mong muốn nếu dùng không đúng theo chỉ dẫn. Thử độ nhạy cảm của da trước khi dùng kem PHILDOMINA bằng cách bôi một ít thuốc lên một vùng nhỏ của da không bị tổn thương và kiểm tra trong 24 giờ. Nếu xuất hiện vết đỏ nhỏ thì vẫn có thể dùng chế phẩm này, nhưng nếu xảy ra ngứa hoặc hình thành mụn giộp hoặc có đáp ứng viêm quá mạnh thì không nên tiếp tục sử dụng. Tránh để thuốc tiếp xúc với mắt. Nếu sau khi điều trị 2 tháng không thấy tác dụng tẩy trắng hoặc làm sáng da thì nên ngưng dùng thuốc.
Chỉ dùng ngoài da.
- Thai kỳ và cho con bú
Chưa có đầy đủ những nghiên cứu có đối chứng về tác động của thuốc khi dùng đường ngoài da cho phụ nữ có thai, vì vậy không nên dùng thuốc này cho phụ nữ đang mang thai trừ khi lợi ích của việc điều trị cần phải được lên trên mọi nguy cơ có thể xảy ra.
Tác động của hydroquinone lên phôi thai vẫn chưa được biết rõ.
Do người ta vẫn chưa biết hydroquinone dùng đường ngoài da có được hấp thu hoặc bài tiết vào trong sữa mẹ hay không, do đó không nên dùng thuốc này cho phụ nữ đang cho con bú.
- Tương tác thuốc
Chưa có báo cáo về tương tác của thuốc này và các thuốc khác.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000103'), 'Thuốc mỡ', '1 tuýp x 15g', 'Thuốc mỡ Philclobate được chỉ định dùng trong những bệnh ngoài da như sau: viêm da, chàm, chàm dị ứng, viêm da do dị ứng và viêm da do tiếp xúc với ánh sáng mặt trời.', 'Không dùng thuốc này cho những bệnh nhân quá mẫn cảm với clobetasol propionate, với các corticosteroid khác hoặc với bất cứ thành phần nào của thuốc.', 'Thuốc mỡ Clobetasol propionate được dung nạp tốt khi sử dụng trong thời gian khoảng 2 tuần lễ.
Tác dụng phụ thường gặp của thuốc là những tác dụng tại chỗ, bao gồm cảm giác bỏng rát và đau nhức, chiếm khoảng 1% bệnh nhân. Những tác dụng phụ ít gặp hơn là: ngứa, teo da và da bị nứt nẻ.
Khi dùng corticosteroid tại chỗ theo đúng chỉ định thì rất hiếm khi xảy ra tác dụng phụ. Những tác dụng phụ này được liệt kê theo thứ tự giảm dần về tần suất gặp: cảm giác bỏng, ngứa, rát, khô da, viêm nang lông, chứng rậm lông, ban dạng viêm nang bã, giảm sắc tố, viêm da quanh miệng, viêm da dị ứng do tiếp xúc, lột da, bội nhiễm, teo da, vết rạn da và tổn thương dạng kê ở da.
Sự hấp thu toàn thân của corticosteroid dùng tại chỗ có thể gây ra sự ức chế ngược lên trục tuyến yên - vùng dưới đồi, biểu hiện bởi hội chứng cushing, chứng tăng glucose huyết và chứng glucose niệu ở một vài bệnh nhân. Trong một vài trường hợp hiếm hơn, việc điều trị (hoặc ngừng điều trị) bệnh vảy nến với corticosteroid có thể làm trầm trọng thêm những triệu chứng của bệnh hoặc gây ra những tổn thương dạng mụn mủ. Do đó, cần theo dõi bệnh nhân cẩn thận.
Thông báo cho bác sĩ hoặc dược sĩ những tác dụng không mong muốn gặp phải khi sử dụng thuốc', 'Bôi thuốc vào vùng da bị bệnh từ 1 đến 2 lần mỗi ngày.
Liều dùng không được quá 50g/tuần và không nên dùng chế phẩm này liên tục quá 2 tuần.
- Quá liều
Nếu bôi thuốc mỡ clobetasol propionate với lượng lớn, sự hấp thu thuốc có thể dẫn đến những tác dụng toàn thân.
Tình trạng quá liều cấp tính rất ít khi xảy ra, tuy nhiên, trong trường hợp quá liều mạn tính hoặc sử dụng sai, các biểu hiện cường vỏ thượng thận có thể xảy ra và trong trường hợp này cần phải ngưng ngay thuốc corticoid bôi da.', 'nhiệt độ dưới 30°C.', '- Thận trọng khi sử dụng
Khi có biểu hiện của nhiễm trùng da, nên dùng những chế phẩm kháng khuẩn và kháng nấm thích hợp. Nếu tình trạng nhiễm trùng không đáp ứng tốt với liệu pháp điều trị, nên ngưng dùng corticosteroid cho đến khi kiểm soát được tình trạng nhiễm trùng.
Khi điều trị với corticosteroid, một số vùng da ở mặt, háng, nách thường sẽ có khuynh hướng dễ bị teo da hơn những vùng da khác của cơ thể do đó cần phải theo dõi sát bệnh nhân nếu dùng thuốc tại những vùng da này.
Không nên băng kín hoặc băng ép vùng da đang được điều trị với thuốc.
Không dùng thuốc quá thời hạn sử dụng.
- Thai kỳ và cho con bú
Chưa có những nghiên cứu đầy đủ và kiểm soát tốt về tác dụng gây quái thai của corticosteroid, kể cả clobetasol, khi sử dụng ngoài da cho phụ nữ đang mang thai. Vì vậy, clobetasol và những corticosteroid dùng ngoài da khác chỉ nên được sử dụng cho phụ nữ mang thai khi lợi ích của việc điều trị cần phải được đặt lên trên mọi nguy cơ có thể xảy ra cho thai nhi.
- Tương tác thuốc
Chưa có những thông tin về tương tác giữa Clobetasol propionate và các thuốc khác.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000108'), 'Viên nang cứng', '3 vỉ x 8 viên', 'Điều trị viêm loét dạ dày, tá tràng, viêm thực quản do trào ngược, hội chứng tăng tiết acid dịch vị (Zollinger - Ellison).', 'Quá mẫn cảm với bất cứ thành phần nào của thuốc.
Không dùng cho phụ nữ có thai 3 tháng đầu.', '- Thường gặp, ADR > 1/100
+ Toàn thân: nhức đầu, buồn ngủ, chóng mặt.
+ Tiêu hóa: buồn nôn, nôn, đau bụng, táo bón, chướng bụng.
- Ít gặp, 1/1000
+ Thần kinh: mất ngủ, rối loạn cảm giác, chóng mặt, mệt mỏi.
+ Da: nổi mày đay, ngứa, phát ban không rõ ràng, phát ban đỏ, viêm da tróc vảy, nổi bóng nước.
+ Gan: tăng tạm thời transaminase
- Hiếm gặp, ADR
+ Toàn thân: đổ mồ hôi, phù ngoại biên, quá mẫn bao gồm phù mạch, sốt, phản vệ, rụng tóc, viêm miệng.
+ Huyết học: giảm bạch cầu, giảm tiểu cầu, giảm toàn bộ các tế bào máu, mất bạch cầu hạt, hạ natri máu.
+ Thần kinh: lú lẫn có hồi phục, kích động, trầm cảm, ảo giác ở người bệnh cao tuổi và đặc biệt là ở người bệnh nặng, rối loạn thính giác, mất điều hòa.
+ Nội tiết: bất lực ở nam giới, to hai vú ở nữ giới.
+ Tiêu hóa: viêm dạ dày, nhiễm nấm Candida, khô miệng, nhiễm trùng đường tiêu hóa.
+ Gan: viêm gan vàng da hoặc không vàng da, tăng men gan, nhiễm độc gan, bệnh não ở người suy gan.
+ Mắt: mù lòa, giảm thị lực, rối loạn thị giác, viêm mắt.
+ Hô hấp: co thắt phế quản, viêm phổi.
+ Cơ - xương: đau khớp, đau cơ, gút.
+ Niệu - dục: viêm thận kẽ.
- Hướng dẫn cách xử trí ADR: phải ngừng thuốc khi có biểu hiện tác dụng không mong muốn nặng.
Thông báo cho bác sỹ biết những tác dụng không mong muốn gặp phải khi sử dụng thuốc.', 'Dùng uống trước bữa ăn sáng hoặc buổi tối, nuốt nguyên viên thuốc, không dừng thuốc đột ngột.
Bệnh nhân viêm loét dạ dày, tá tràng, và viêm thực quản do trào ngược: uống lần 1 viên (20mg), ngày 1 lần.
+ Ở bệnh nhân viêm loét tá tràng: uống liên tục trong thời gian 2 tuần. Nếu chưa khỏi hẳn, uống thêm 2 tuần nữa.
+ Ở bệnh nhân viêm loét dạ dày và viêm thực quản do trào ngược: uống liên tục trong thời gian 4 tuần. Nếu chưa khỏi hẳn, uống thêm 4 tuần nữa. Với những bệnh nhân viêm loét dạ dày, tá tràng, viêm thực quản do trào ngược trầm trọng và đề kháng với những thuốc khác: uống 2 viên 1 lần (40mg), ngày uống 1 lần. Uống liên tục trong 4 - 8 tuần.
Hội chứng tăng tiết acid dịch vị (Zollinger - Ellison):
+ Liều khởi đầu 3 viên Omeprazol (60mg), uống 1 lần mỗi ngày.
+ Ở bệnh nhân trầm trọng và không đáp ứng đầy đủ với những thuốc khác: uống liều duy trì 1 - 3 viên mỗi lần (20mg - 60mg). Ngày uống 1 - 2 lần.
+ Điều trị hội chứng Zollinger - Ellison: nếu dùng liều trên 80mg thì chia ra 2 lần/ngày.
- Quá liều
Liều uống một lần tới 160mg, liều tiêm tĩnh mạch một lần tới 80mg, liều tiêm tĩnh mạch một ngày tới 200mg và liều 520mg tiêm tĩnh mạch trong thời gian 3 ngày vẫn được dung nạp tốt.
Khi uống quá liều, phải điều trị theo triệu chứng, không có thuốc điều trị đặc hiệu.
Thông báo ngay cho bác sỹ những tác dụng không mong muốn gặp phải khi sử dụng thuốc quá liều.', 'nhiệt độ dưới 30°C.', '- Thận trọng khi sử dụng
Khi nghi ngờ loét dạ dày, muốn dùng Omeprazol, trước hết phải loại trừ khả năng bệnh ác tính vì điều trị có thể làm giảm triệu chứng và gây trở ngại cho chẩn đoán.
Trong thời kỳ mang thai và cho con bú, cần thiết phải có chỉ định của thầy thuốc.
- Thai kỳ và cho con bú
Tuy trên thực nghiệm không thấy omeprazol có khả năng gây dị dạng và độc với bào thai, nhưng không nên dùng cho người mang thai, nhất là trong 3 tháng đầu.
Không nên dùng omeprazol ở người cho con bú. Cho đến nay, chưa tài liệu nghiên cứu nào có kết luận cụ thể về vấn đề này.
- Khả năng lái xe và vận hành máy móc
Không nên dùng Omeprazol khi đang vận hành máy móc, tàu xe vì thuốc có thể gây chóng mặt, buồn ngủ.
- Tương tác thuốc
Omeprazol không có tương tác quan trọng trên lâm sàng khi được dùng cùng thức ăn, rượu, amoxycilin, bacampicilin, cafein, lidocain, quinidin hay theophylin. Thuốc cũng không bị ảnh hưởng do dùng đồng thời Maalox hay metoclopramid.
Omeprazol có thể làm tăng nồng độ ciclosporin trong máu.
Omeprazol làm tăng tác dụng của kháng sinh diệt trừ H. pylori.
Không có tương tác nào ghi nhận với propranolon hoặc theophylin.
Omeprazol ức chế chuyển hóa của các thuốc bị chuyển hóa bởi hệ enzym trong cytocrom P450 của gan và có thể làm tăng nồng độ diazepam, phenytoin và warfarin trong máu. Sự giảm chuyển hóa của diazepam làm cho tác dụng của thuốc kéo dài hơn. Với liều 40mg/ngày omeprazol ức chế chuyển hóa phenytoin và làm tăng nồng độ của phenytoin trong máu, nhưng liều omeprazol 20mg/ngày lại có tương tác yếu hơn nhiều. Omeprazol ức chế chuyển hóa warfarin, nhưng lại ít làm thay đổi thời gian chảy máu.
Omeprazol làm tăng tác dụng chống đông máu của dicoumarol.
Omeprazol làm giảm chuyển hóa nifedipin ít nhất là 20% và có thể làm tăng tác dụng của nifedipin.
Clarithromycin ức chế chuyển hóa omeprazol và làm cho nồng độ omeprazol tăng cao gấp đôi.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000097'), 'Viên nang cứng', '3 vỉ x 10 viên', 'Loét dạ dày tiến triển.
Viêm thực quản do trào ngược dạ dày - thực quản.
Hội chứng Zollinger-Ellison.', 'Bệnh nhân mẫn cảm với bất kỳ thành phần nào của thuốc.
Phụ nữ có thai và cho con bú.
Trẻ em.', 'Các phản ứng không mong muốn thường gặp nhất với lansoprazole là ở đường tiêu hóa như tiêu chảy, đau bụng, ngoài ra một số người bệnh có đau đầu, chóng mặt.
Thường gặp (1/100 ≤ ADR 1/10):
+ Toàn thân: Đau đầu, chóng mặt.
+ Tiêu hóa: Tiêu chảy, đau bụng, buồn nôn, nôn, táo bón, khó tiêu.
+ Da: Phát ban.
Ít gặp (1/1000 ≤ ADR
+ Toàn thân: Mệt mỏi.
+ Cận lâm sàng: Tăng mức gastrin huyết thanh, enzym gan, hematocrit, hemoglobin, acid uric và protein niệu.', 'Lansoprazole STELLA 30 mg được uống trước khi ăn, không cắn vỡ hay nhai viên nang.
Loét dạ dày tiến triển: Uống 1 viên/lần/ngày, trong 4 tuần, nếu cần thiết có thể dùng tiếp trong 2 đến 4 tuần nữa.
Viêm thực quản do trào ngược dạ dày - thực quản: Uống 1 viên/lần/ngày, trong 4 tuần, nếu cần thiết có thể dùng tiếp trong 4 tuần nữa.
Hội chứng Zollinger-Ellison: 1 - 2 viên/lần/ngày. Thời gian điều trị tùy thuộc vào đáp ứng bệnh lý.
- Quá liều
Liều uống đến 5000 mg/kg ở chuột cống (khoảng 1300 lần liều dùng cho người tính theo diện tích bề mặt cơ thể) và ở chuột nhắt (khoảng 675,7 lần liều dùng cho người tính theo diện tích bề mặt cơ thể) vẫn chưa gây tử vong hay bất cứ dấu hiệu lâm sàng nào.
Thẩm phân máu không loại trừ được lansoprazole khỏi hệ thống tuần hoàn. Trong một ca quá liều, bệnh nhân dùng đến 600 mg mà không có phản ứng có hại nào.', 'Bảo quản trong bao bì kín, nơi khô, tránh ánh sáng. Nhiệt độ không quá 30°C.', '- Thận trọng khi sử dụng
Sử dụng các thuốc ức chế bơm proton, đặc biệt khi dùng liều cao và trong thời gian dài (> 1 năm), có thể làm tăng nhẹ nguy cơ gãy xương hông, cổ tay và xương sống, chủ yếu xảy ra ở người già hoặc khi có các yếu tố nguy cơ khác. Các nghiên cứu quan sát cho thấy các thuốc ức chế bơm proton làm tăng nguy cơ gãy xương chung từ 10 đến 40%, vài trường hợp có thể do các yếu tố khác. Bệnh nhân có nguy cơ loãng xương phải được chăm sóc theo hướng dẫn lâm sàng hiện có và cần bổ sung đầy đủ vitamin D và calci.
Đã có báo cáo hạ magnesi huyết nặng trên bệnh nhân điều trị với các thuốc ức chế bơm proton trong ít nhất 3 tháng và hầu hết các trường hợp điều trị khoảng 1 năm. Các triệu chứng của hạ magnesi huyết nặng có thể xảy ra như mệt mỏi, co cứng cơ, mê sảng, co giật, choáng váng và loạn nhịp thất nhưng các triệu chứng trên có thể xảy ra âm ỉ và không được chú ý đến. Ở phần lớn các bệnh nhân bị hạ magnesi huyết, tình trạng bệnh được cải thiện sau khi bổ sung magnesi và ngưng dùng các thuốc ức chế bơm proton.
Nên lưu ý đo nồng độ magnesi trước khi bắt đầu điều trị và định kỳ trong khi điều trị cho những bệnh nhân cần điều trị lâu dài hoặc phải dùng thuốc ức chế bơm proton đồng thời với digoxin hay những thuốc gây hạ magnesi huyết (ví dụ thuốc lợi tiểu).
Ở bệnh nhân suy gan: Cần giảm liều ở bệnh nhân bị bệnh gan nặng.
Ở trẻ em: Hiệu lực và mức độ dung nạp thuốc chưa được khảo sát. Do đó, không dùng thuốc cho trẻ em.
Ở người già: Nên sử dụng lansoprazole một cách thận trọng do sự tiết acid dịch vị và những chức năng sinh lý khác đã giảm.
Lansoprazole STELLA 30 mg có chứa sucrose. Không nên dùng thuốc này cho bệnh nhân có các vấn đề về di truyền hiếm gặp không dung nạp galactose, kém hấp thu glucose-galactose hay thiếu hụt enzym sucrose-isomaltase.
- Thai kỳ và cho con bú
Chưa có nghiên cứu đầy đủ về việc sử dụng thuốc trong thai kỳ, chỉ sử dụng thuốc cho phụ nữ có thai khi thật cần thiết.
Chưa biết thuốc có bài tiết qua sữa mẹ hay không.
- Khả năng lái xe và vận hành máy móc
Các tác dụng không mong muốn của thuốc như hoa mắt, chóng mặt, giảm thị lực và ngủ gà có thể xảy ra làm giảm khả năng phản ứng.
- Tương tác thuốc
Tương tác của thuốc
Lansoprazole có thể làm thay đổi sự chuyển hóa của các thuốc được chuyển hóa qua hệ thống cytochrom P450 như warfarin, antipyrin, indomethacin, ibuprofen, phenytoin, propranolol, prednison, diazepam hoặc clarithromycin.
Khi dùng đồng thời lansoprazole với theophyllin, độ thanh thải của theophyllin tăng nhẹ (10%).
Lansoprazole có thể kéo dài thời gian thải trừ của diazepam, phenytoin và warfarin.
Lansoprazole làm giảm sự hấp thu của các thuốc có sự hấp thu phụ thuộc vào pH acid dịch vị như ketoconazol, và có thể là itraconazol. Với voriconazol, nồng độ trong huyết tương của cả hai thuốc đều tăng và khuyến cáo nên giảm liều lansoprazole.
Các thuốc kháng acid và sucralfat: Nên tránh dùng trong vòng 1 giờ sau khi dùng lansoprazole vì các thuốc này làm giảm sinh khả dụng của lansoprazole.
Tương kỵ của thuốc
Do không có các nghiên cứu về tính tương kỵ của thuốc, không trộn lẫn thuốc này với các thuốc khác.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000065'), 'Viên nang mềm', '2 vỉ x 10 viên', 'Điều trị triệu chứng của rối loạn ruột chức năng, đặc biệt kèm chướng bụng.', 'Thuốc này không nên dùng trong trường hợp có tiền sử dị ứng hoặc bất dung nạp với alverin hoặc một trong các tá dược.', 'Do có chứa Alverine:
Hiếm có trường hợp nổi mề đay, đôi khi có phù thanh quản, sốc.
Hiếm có trường hợp bị tổn thương gan, hồi phục lại khi ngừng thuốc.
Thông báo cho bác sĩ những tác dụng không mong muốn gặp phải khi sử dụng thuốc.', 'Liều dùng:
Dành cho người lớn:
1 viên nang, 2 đến 3 lần mỗi ngày.
Đường dùng: Đường uống.
Cách dùng:
Uống thuốc trước bữa ăn.
- Quá liều
Triệu chứng: hạ huyết áp và triệu chứng nhiễm độc giống atropine.
Xử trí: như khi ngộ độc atropine và biện pháp hỗ trợ điều trị hạ huyết áp.', 'Bảo quản ở nhiệt độ dưới 30°C.', '- Thận trọng khi sử dụng
Không nên dùng cho phụ nữ có thai và cho con bú mà không có ý kiến của bác sĩ.
- Thai kỳ và cho con bú
Tốt hơn là không dùng thuốc này trong lúc mang thai và cho con bú.
- Tương tác thuốc
Không có.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000088'), 'Viên nén kháng dịch dạ dày', '2 vỉ x 7 viên', 'Người lớn:
Viên nén NEXIUM MUPS được chỉ định cho các trường hợp:
Bệnh trào ngược dạ dày - thực quản (GERD).
Điều trị viêm xước thực quản do trào ngược.
Điều trị dài hạn cho bệnh nhân viêm thực quản đã chữa lành để phòng ngừa tái phát.
Điều trị triệu chứng bệnh trào ngược dạ dày - thực quản (GERD).
Kết hợp với một phác đồ kháng khuẩn thích hợp để diệt trừ Helicobacter pylori:
Chữa lành loét tá tràng có nhiễm Helicobacter pylori.
Phòng ngừa tái phát loét dạ dày - tá tràng ở bệnh nhân loét có nhiễm Helicobacter pylori.
Bệnh nhân cần điều trị bằng thuốc kháng viêm không steroid (NSAID) liên tục.
Chữa lành loét dạ dày do dùng thuốc NSAID.
Phòng ngừa loét dạ dày và loét tá tràng do dùng thuốc NSAID ở bệnh nhân có nguy cơ. Điều trị kéo dài sau khi đã điều trị phòng ngừa tái xuất huyết do loét dạ dày tá tràng bằng đường tĩnh mạch.
Điều trị hội chứng Zollinger Ellison
Trẻ vị thành niên từ 12 tuổi trở lên:
Bệnh trào ngược dạ dày - thực quản (GERD)
Điều trị viêm xước thực quản do trào ngược.
Điều trị dài hạn cho bệnh nhân viêm thực quản đã chữa lành để phòng ngừa tái phát.
Điều trị triệu chứng bệnh trào ngược dạ dày - thực quản (GERD).
Kết hợp với kháng sinh trong điều trị loét tá tràng do Helicobacter pylori.', 'Tiền sử quá mẫn với esomeprazole, phân nhóm benzimidazole hay các thành phần khác trong công thức.
Không nên sử dụng esomeprazole đồng thời với nelfinavir, atazanavir (Xem “Tương Tác Thuốc và các dạng tương tác khác”).', 'Các phản ứng ngoại ý phổ biến nhất bao gồm: đau đầu, đau bụng, tiêu chảy và buồn nôn (kể cả trong nghiên cứu hậu mãi). Đặc tính về an toàn là tương tự nhau giữa các dạng thuốc, các chỉ định, nhóm tuổi và các quần thể bệnh nhân.
Các phản ứng ngoại ý do thuốc sau đây đã được ghi nhận hay nghi ngờ trong các chương trình nghiên cứu lâm sàng của esomeprazole và theo dõi sau khi thuốc ra thị trường. Không có phản ứng nào liên quan đến liều dùng.
Các phản ứng này được xếp theo tần suất xảy ra: Rất thường gặp: &gt;1/10, thường gặp: 1/100 đến &lt; 1/10; ít gặp : 1/1000 đến &lt; 1/100; hiếm gặp: 1/10.000 đến &lt; 1/1000; rất hiếm gặp: &lt; 1 /10.000; chưa biết (không thể dự đoán từ các dữ liệu đang có).
Rối loạn máu và hệ bạch huyết
Hiếm gặp: giảm bạch cầu, giảm tiểu cầu.
Rất hiếm gặp: mất bạch cầu hạt, giảm toàn thể huyết cầu.
Rối loạn hệ miễn dịch
Hiếm gặp: phản ứng quá mẫn như là sốt, phù mạch, phản ứng phản vệ/sốc phản vệ.
Rối loạn chuyển hóa và dinh dưỡng
Ít gặp: phù ngoại biên.
Hiếm gặp: giảm natri máu.
Chưa biết: giảm magiê máu (xem mục “Lưu ý và thận trọng đặc biệt khi dùng’’), giảm magiê máu nặng có thể liên quan tới giảm canxi máu. Giảm magiê máu cũng có thể dẫn đến giảm kali máu.
Rối loạn tâm thần
Ít gặp: mất ngủ.
Hiếm gặp: kích động, lú lẫn, trầm cảm.
Rất hiếm: nóng nảy, ảo giác.
Rối loạn hệ thần kinh
Thường gặp: nhức đầu.
Ít gặp: choáng váng, dị cảm, ngủ gà.
Hiếm gặp: rối loạn vị giác.
Rối loạn mắt
Hiếm gặp: nhìn mờ.
Rối loạn tai và mê đạo.
Ít gặp: chóng mặt.
Rối loạn hô hấp, ngực và trung thất
Hiếm gặp: Co thắt phế quản
Rối loạn tiêu hóa
Thường gặp: đau bụng, táo bón, tiêu chảy, đầy bụng, buồn nôn/nôn.
Ít gặp: khô miệng.
Hiếm gặp: viêm miệng, nhiễm Candida đường tiêu hóa.
Chưa biết: Viêm đại tràng vi thể.
Rối loạn gan mật
Ít gặp: tăng men gan.
Hiếm gặp: viêm gan có hoặc không vàng da.
Rất hiếm: suy gan, bệnh não ở bệnh nhân đã có bệnh gan.
Rối loạn da và mô dưới da
Ít gặp: viêm da, ngứa, nổi mẩn, mề đay.
Hiếm gặp: hói đầu, nhạy cảm với ánh sáng.
Rất hiếm: hồng ban đa dạng, hội chứng Stevens-Johnson, hoại tử biểu bì gây độc (TEN).
Rối loạn cơ xương và mô liên kết
Ít gặp: gãy xương hông, cổ tay và cột sống (xem mục “Lưu ý và thận trọng đặc biệt khi dùng’).
Hiếm gặp: đau khớp, đau cơ.
Rất hiếm: yếu cơ.
Rối loạn thận và tiết niệu
Rất hiếm: viêm thận kẽ; ở một số bệnh nhân tình trạng suy thận đi kèm đã được báo cáo.
Rối loạn hệ sinh sản và tuyến vú
Rất hiếm: nữ hóa tuyến vú.
Các rối loạn tổng quát và tại chỗ
Hiếm: khó ở, tăng tiết mồ hôi.', 'Nên nuốt toàn bộ viên cùng với chất lỏng. Không nên nhai hay nghiền nát viên.
Đối với bệnh nhân khó nuốt, có thể phân tán viên thuốc trong nửa Iy nước không chứa carbonate. Không dùng các chất lỏng khác vì lớp bọc giúp thuốc tan trong đường ruột có thể bị hòa tan. Khuấy cho đến khi viên thuốc phân tán hoàn toàn và uống dịch phân tán chứa vi hạt này ngay lập tức hoặc trong vòng 30 phút. Tráng ly lại bằng nửa ly nước và uống. Không được nhai hoặc nghiền nát các vi hạt này.
Đối với bệnh nhân không thể nuốt được, có thể phân tán viên thuốc trong nước không chứa carbonate và dùng qua ống thông dạ dày. Quan trọng là phải kiểm tra cẩn thận sự thích hợp của loại bơm tiêm và ống thông chọn lựa. Xin xem phần hướng dẫn sử dụng, xử lý và loại bỏ (khi cần) để được hướng dẫn chuẩn bị và sử dụng.
Người lớn và trẻ vị thành niên từ 12 tuổi trở lên
Bệnh trào ngược dạ dày - thực quản (GERD)
Điều trị viêm xước thực quản do trào ngược: 40mg, 1 lần/ngày trong 4 tuần. Nên điều trị thêm 4 tuần nữa cho bệnh nhân viêm thực quản chưa được chữa lành hay vẫn có triệu chứng dai dẳng.
Điều trị dài hạn cho bệnh nhân viêm thực quản đã chữa lành để phòng ngừa tái phát: 20mg, 1 lần/ngày.
Điều trị triệu chứng bệnh trào ngược dạ dày-thực quản (GERD): 20mg, 1 lần/ngày ở bệnh nhân không bị viêm thực quản. Nếu không kiểm soát được triệu chứng sau 4 tuần, bệnh nhân nên được thăm dò cận lâm sàng kỹ hơn để xác định chẩn đoán. Khi đã hết triệu chứng, có thể duy trì sự kiểm soát triệu chứng với liều 20mg, 1 lần/ngày. Ở người lớn có thể sử dụng chế độ điều trị khi cần thiết với liều 20mg, 1 lần/ngày. Ở những bệnh nhân trào ngược dạ dày thực quản (GERD) đang sử dụng NSAID có nguy cơ phát triển loét dạ dày tá tràng, không khuyến cáo kiểm soát các triệu chứng bằng chế độ điều trị khi cần thiết.
Người lớn
Kết hợp với một phác đồ kháng khuẩn thích hợp để diệt trừ Helicobacter pylori:
Chữa lành loét tá tràng có nhiễm Helicobacter pylori: NEXIUM MUPS 20mg, amoxicillin 1g và clarithromycin 500mg, tất cả được dùng 2 lần/ngày trong 7 ngày.
Phòng ngừa tái phát loét dạ dày - tá tràng ở bệnh nhân loét có nhiễm Helicobacter pylori: NEXIUM MUPS 20mg, amoxicillin 1g và clarithromycin 500mg, tất cả được dùng 2 lần/ngày trong 7 ngày.
Bệnh nhân cần điều trị bằng thuốc kháng viêm không steroid (NSAID) liên tục
Chữa lành loét dạ dày do dùng thuốc NSAID: liều thông thường 20mg, 1 lần/ngày. Thời gian điều trị là 4 - 8 tuần.
Phòng ngừa loét dạ dày và loét tá tràng do dùng thuốc NSAID ở bệnh nhân có nguy cơ: 20mg, 1 lần/ngày.
Điều trị kéo dài sau khi đã điều trị phòng ngừa tái xuất huyết do loét dạ dày tá tràng bằng đường tĩnh mạch.
40mg, 1 lần/ngày trong 4 tuần sau khi đã điều trị phòng ngừa tái xuất huyết do loét dạ dày tá tràng bằng đường tĩnh mạch.
Điều trị hội chứng Zollinger Ellison
Liều khởi đầu khuyến cáo là NEXIUM MUPS 40mg, 2 lần/ngày. Sau đó điều chỉnh liều theo đáp ứng của từng bệnh nhân và tiếp tục điều trị khi còn chỉ định về mặt lâm sàng. Các dữ liệu lâm sàng cho thấy phần lớn bệnh nhân được kiểm soát với esomeprazole liều từ 80 – 160 mg/ngày Khi liều hàng ngày lớn hơn 80mg, nên chia liều dùng thành 2 lần/ngày.
Trẻ vị thành niên từ 12 tuổi trở lên
Điều trị loét tá tràng do Helicobacter pylori
Khi lựa chọn liệu pháp phối hợp thích hợp, cần xem xét hướng dẫn chính thức của quốc gia, vùng và địa phương về sự đề kháng của vi khuẩn, thời gian điều trị (thông thường là 7 ngày nhưng đôi khi có thể lên tới 14 ngày), và cách dùng các thuốc kháng khuẩn thích hợp. Quá trình điều trị cần được theo dõi bởi chuyên viên y tế.
Liều dùng khuyến cáo là:
Cân nặngLiều dùng
30 - 40 kgKết hợp với hai kháng sinh: dùng đồng thời NEXIUM MUPS 20mg, amoxicillin 750mg và clarithromycin7.5 mg/kg cân nặng, 2 lần/ngày trong 1 tuần.
&gt; 40 kgKết hợp với hai kháng sinh: dùng đồng thời NEXIUM MUPS 20mg, amoxicillin 1g và clarithromycin 500mg, 2 lần/ngày trong 1 tuần.
Trẻ em dưới 12 tuổi
Về liều lượng cho bệnh nhân từ 1 đến 11 tuổi, xin tham khảo tờ hướng dẫn sử dụng của NEXIUM dạng gói chứa cốm kháng dịch dạ dày.
Người tổn thương chức năng thận
Không cần phải điều chỉnh liều ở bệnh nhân tổn thương chức năng thận. Do ít kinh nghiệm về việc dùng thuốc ở bệnh nhân suy thận nặng, nên thận trọng khi điều trị ở các bệnh nhân này (Xem “Đặc Tính Dược Động Học”).
Người tổn thương chức năng gan
Không cần phải điều chỉnh liều ở bệnh nhân tổn thương gan ở mức độ từ nhẹ đến trung bình. Ở bệnh nhân suy gan nặng, không nên dùng quá liều tối đa là NEXIUM MUPS 20mg (Xem “Đặc Tính Dược Động Học”).
Người cao tuổi
Không cần điều chỉnh liều ở người cao tuổi.
- Quá liều
Cho đến nay có rất ít kinh nghiệm về việc dùng quá liều có chủ đích. Các triệu chứng được mô tả có liên quan đến việc dùng liều 280mg là các triệu chứng trên đường tiêu hóa và tình trạng mệt mỏi. Các liều đơn esomeprazole 80mg vẫn an toàn khi dùng. Chưa có chất giải độc đặc hiệu.
Esomeprazole gắn kết mạnh với protein huyết tương và vì vậy không dễ dàng thẩm phân được.
Trong trường hợp quá liều, nên điều trị triệu chứng và sử dụng các biện pháp hỗ trợ tổng quát.', 'bảo quản ở nhiệt độ trên 30', '- Thận trọng khi sử dụng
Khi có sự hiện diện bất kỳ một triệu chứng báo động nào (như là giảm cân đáng kể không chủ ý, nôn tái phát, khó nuốt, nôn ra máu hay đại tiện phân đen) và khi nghi ngờ hoặc bị loét dạ dày nên loại trừ bệnh lý ác tính vì điều trị bằng NEXIUM MUPS có thể làm giảm triệu chứng và làm chậm trễ việc chẩn đoán.
Bệnh nhân điều trị thời gian dài (đặc biệt những người đã điều trị hơn 1 năm) nên được theo dõi thường xuyên.
Bệnh nhân điều trị theo chế độ khi cần thiết nên liên hệ với bác sỹ nếu có các triệu chứng thay đổi về đặc tính. Khi kê toa esomeprazole theo chế độ điều trị khi cần thiết, nên xem xét đến mối liên quan về tương tác với các thuốc khác do nồng độ esomeprazole trong huyết tương có thể thay đổi (Xem “Tương Tác Thuốc và các dạng tương tác khác").
Khi kê toa esomeprazole để diệt trừ Helicobacter pylori, nên xem xét các tương tác thuốc có thể xảy ra trong phác đồ điều trị 3 thuốc. Clarithromycin là chất ức chế mạnh CYP3A4 và vì thế nên xem xét chống chỉ định và tương tác đối với clarithromycin khi dùng phác đồ 3 thuốc cho bệnh nhân đang dùng các thuốc khác chuyển hóa qua CYP3A4 như cisapride.
Thuốc này có chứa đường sucrose. Bệnh nhân có các vấn đề di truyền hiếm gặp như không dung nạp fructose, kém hấp thu glucose - galactose hoặc thiếu sucrase - isomaltase không nên dùng thuốc này.
Điều trị bằng thuốc ức chế bơm proton có thể làm tăng nhẹ nguy cơ nhiễm khuẩn đường tiêu hóa do Salmonella và Campylobacter (Xem phần “Đặc tính Dược lực học”).
Không khuyến cáo dùng đồng thời esomeprazole với atazanavir (xem mục Tương tác thuốc và các dạng tương tác khác). Nếu sự phối hợp atazanavir với thuốc ức chế bơm proton là không thể tránh khỏi, cần theo dõi chặt chẽ trên lâm sàng khi tăng liều atazanavir đến 400mg kết hợp với 100mg ritonavir; không nên sử dụng quá 20mg esomeprazole.
Esomeprazole, cũng như các thuốc kháng axít khác, có thể làm giảm hấp thu vitamin B12 (cyanocobalamin) do sự giảm hoặc thiếu axít dịch vị. Điều này nên được cân nhắc ở những bệnh nhân có giảm dự trữ vitamin B12 hoặc có yếu tố nguy cơ giảm hấp thu vitamin B12 khi điều trị dài hạn.
Esomeprazole là chất ức chế CYP2C19. Khi bắt đầu hay kết thúc điều trị với esomeprazole, cần xem xét nguy cơ tương tác thuốc với các thuốc chuyển hóa qua CYP2C19. Đã có ghi nhận tương tác giữa Clopidogrel và esomeprazole (xem mục “Tương tác thuốc và các dạng tương tác khác"). Không rõ mối liên quan lâm sàng của tương tác này. Như là một biện pháp thận trọng, không khuyến khích dùng đồng thời esomeprazole và clopidogrel.
Đã có các báo cáo về giảm magiê máu nặng ở những bệnh nhân điều trị bằng thuốc ức chế bơm proton (PPI) như esomeprazole trong ít nhất 3 tháng, và trong đa số các trường hợp là trong 1 năm. Biểu hiện nặng của giảm magiê máu như mệt mỏi, co cứng, mê sảng, co giật, choáng váng và loạn nhịp thất có thể xảy ra nhưng khởi phát âm thầm và không được lưu tâm. Ở đa số các bệnh nhân, tình trạng giảm magiê máu được cải thiện sau khi sử dụng liệu pháp magiê thay thế và ngừng sử dụng PPI.
Đối với các bệnh nhân cần được điều trị kéo dài hoặc những bệnh nhân dùng đồng thời PPI và digoxin hoặc các thuốc khác có thể gây hạ magiê máu (ví dụ như các thuốc lợi tiểu), nhân viên y tế nên cân nhắc định lượng nồng độ magiê máu trước khi bắt đầu điều trị PPI và định kỳ theo dõi trong quá trình điều trị.
Các thuốc ức chế bơm proton, đặc biệt khi dùng liều cao và trong thời gian dài (&gt; 1 năm), có thể làm tăng nhẹ nguy cơ gãy xương hông, xương cổ tay và cột sống, đặc biệt ở bệnh nhân cao tuổi hoặc khi có sự hiện diện của yếu tố nguy cơ khác. Các nghiên cứu quan sát chỉ ra rằng các thuốc ức chế bơm proton có thể làm tăng tổng thể nguy cơ gãy xương khoảng 10 - 40%. Một phần trong mức tăng này có thể do các yếu tố nguy cơ khác. Bệnh nhân có nguy cơ loãng xương nên được chăm sóc theo các hướng dẫn lâm sàng hiện hành và nên được bổ sung một lượng vitamin D và calcium thích hợp.
- Thai kỳ và cho con bú
Chưa có đủ dữ liệu lâm sàng về việc dùng NEXIUM MUPS trên phụ nữ có thai. Khi dùng hỗn hợp đồng phân racemic của omeprazole, dữ liệu trên số lượng lớn phụ nữ có thai có dùng thuốc từ các nghiên cứu dịch tễ chứng tỏ thuốc không gây dị tật hoặc độc tính trên bào thai. Các nghiên cứu về esomeprazole trên động vật không cho thấy thuốc có tác động có hại trực tiếp hay gián tiếp trên sự phát triển của phôi/thai nhi. Các nghiên cứu trên động vật với hỗn hợp racemic cũng không cho thấy có tác động có hại trực tiếp hay gián tiếp trên tình trạng mang thai, sự sinh nở hoặc sự phát triển sau sinh. Nên thận trọng khi kê toa cho phụ nữ có thai.
Người ta chưa biết esomeprazole có tiết qua sữa mẹ hay không. Không có nghiên cứu nào trên phụ nữ cho con bú được thực hiện. Vì vậy, không nên dùng NEXIUM MUPS trong khi cho con bú.
- Khả năng lái xe và vận hành máy móc
Esomeprazole ít ảnh hưởng tới khả năng lái xe và vận hành máy móc. Một số phản ứng ngoại ý như chóng mặt (ít gặp), nhìn mờ (hiếm gặp) có thể xảy ra (xem phần “Phản ứng không mong muốn”). Nếu xảy ra các phản ứng ngoại ý này, bệnh nhân không nên lái xe và vận hành máy móc.
- Tương tác thuốc
Tác động của esomeprazole trên dược động học của các thuốc khác:
Đối với những thuốc hấp thu phụ thuộc độ pH
Tình trạng giảm độ axít dạ dày khi điều trị bằng esomeprazole và các PPI khác có thể làm giảm hay tăng sự hấp thu của các thuốc khác có cơ chế hấp thu phụ thuộc pH dạ dày. Giống như các thuốc làm giảm độ axít dạ dày khác, sự hấp thu của các thuốc như ketoconazole, itraconazole và erlotinib có thể giảm và sự hấp thu của digoxin có thể tăng lên trong khi điều trị với esomeprazole. Dùng đồng thời omeprazole (20mg/ngày) và digoxin ở các đối tượng khỏe mạnh làm tăng sinh khả dụng của digoxin khoảng 10% (lên đến 30% ở 2 trên 10 đối tượng nghiên cứu). Hiếm có các báo cáo về độc tính của digoxin. Tuy nhiên, cần thận trọng khi dùng esomeprazole liều cao ở bệnh nhân cao tuổi. Cần tăng cường theo dõi việc điều trị bằng digoxin.
Đã có báo cáo rằng omeprazole tương tác với một số chất ức chế enzym protease. Chưa rõ tầm quan trọng về lâm sàng và cơ chế tác dụng của các tương tác đã được ghi nhận. Tăng độ pH dạ dày trong quá trình điều trị với omeprazole có thể dẫn đến thay đổi sự hấp thu của chất ức chế enzym protease. Cơ chế tương tác khác có thể xảy ra là thông qua sự ức chế enzym CYP2C19. Đối với atazanavir và neIfinavir, giảm nồng độ thuốc trong huyết thanh đã được ghi nhận khi dùng chung với omeprazole, do đó không khuyến cáo dùng đồng thời các thuốc này. Ở người tình nguyện khỏe mạnh, sử dụng đồng thời omeprazole (40mg, 1 lần/ngày) và atazanavir 300mg/ritonavir 100mg làm giảm đáng kể nồng độ và thời gian tiếp xúc atazanavir (giảm AUC, Cmax và Cmin khoảng 75%). Tăng liều atazanavir đến 400mg đã không bù trừ tác động của omeprazole trên nồng độ và thời gian tiếp xúc atazanavir.
Dùng phối hợp omeprazole (20mg, 1 lần/ngày) với atazanavir 400mg/ritonavir 100mg ở người tình nguyện khỏe mạnh làm giảm khoảng 30% nồng độ và thời gian tiếp xúc atazanavir khi so sánh với nồng độ và thời gian tiếp xúc ghi nhận trong trường hợp dùng atazanavir 300mg/ritonavir 100mg, 1 lần/ngày, mà không dùng omeprazole 20mg, 1 lần/ngày.
Dùng phối hợp với omeprazole (40mg, 1 lần/ngày) làm giảm trị số trung bình AUC, Cmax và Cmin của nelfinavir khoảng 36 - 39% và giảm khoảng 75 - 92% trị số trung bình AUC, Cmax và Cmin của chất chuyển hóa hoạt tính có tác động dược lý M8. Đối với saquinavir (sử dụng đồng thời với ritonavir), tăng nồng độ thuốc trong huyết thanh (80 - 100%) khi dùng đồng thời với omeprazole (40mg, 1 lần/ngày). Điều trị với omeprazole 20mg, 1 lần/ngày, không ảnh hưởng đến sự tiếp xúc của darunavir (khi dùng đồng thời với ritonavir) và amprenavir (khi dùng đồng thời với ritonavir). Điều trị với esomeprazole 20mg, 1 lần/ngày, không ảnh hưởng đến sự tiếp xúc của amprenavir (sử dụng hay không sử dụng đồng thời với ritonavir). Điều trị với omeprazole 40mg, 1 lần/ngày, không ảnh hưởng đến sự tiếp xúc của Iopinavir (sử dụng đồng thời với ritonavir). Do tác động dược lực và các đặc tính dược động học tương tự của omeprazole và esomeprazole, không khuyến cáo sử dụng esomeprazole đồng thời với atazanavir và chống chỉ định sử dụng esomeprazole đồng thời với nelfinavir.
Những thuốc chuyển hóa qua CYP2C19
Esomeprazole ức chế CYP2C19, enzym chính chuyển hóa esomeprazole. Do vậy, khi esomeprazole được dùng chung với các thuốc chuyển hóa bằng CYP2C19 như diazepam, citalopram, imipramine, clomipramine, phenytoin..., nồng độ các thuốc này trong huyết tương có thể tăng và cần giảm liều dùng. Điều này cần được đặc biệt chú ý khi kê toa esomeprazole theo chế độ điều trị khi cần thiết. Dùng đồng thời với esomeprazole 30mg làm giảm 45% độ thanh thải diazepam (một cơ chất của CYP2C19). Khi dùng đồng thời với esomeprazole 40mg làm tăng 13% nồng độ đáy (trough) của phenytoin trong huyết tương ở bệnh nhân động kinh. Nên theo dõi nồng độ phenytoin trong huyết tương khi bắt đầu hay ngưng điều trị với esomeprazole. Omeprazole (40mg, 1 lần/ngày) làm tăng 15% Cmax và 45% AUCt của voriconazole (một cơ chất của CYP2C19).
Khi dùng đồng thời 40mg esomeprazole ở người đang điều trị bằng warfarin trong một thử nghiệm lâm sàng đã cho thấy thời gian đông máu ở trong khoảng có thể chấp nhận. Tuy vậy, sau một thời gian lưu hành thuốc đã ghi nhận có một số rất hiếm trường hợp tăng INR đáng kể trên lâm sàng khi điều trị đồng thời hai thuốc trên. Nên theo dõi bệnh nhân khi bắt đầu và khi chấm dứt điều trị đồng thời esomeprazole với warfarin hoặc các dẫn chất khác của coumarine. Omeprazole, cũng như esomeprazole, hoạt động như các chất ức chế CYP2C19. Trong một nghiên cứu chéo, omeprazole sử dụng với liều 40mg trên đối tượng khỏe mạnh đã làm tăng Cmax và AUC của Cilostazol tương ứng 18% và 26% và Cmax và AUC của một chất chuyển hóa có hoạt tính của nó tương ứng 29% và 69%.
Ở người tình nguyện khỏe mạnh, khi dùng chung với 40mg esomeprazole, diện tích dưới đường cong biểu diễn nồng độ cisapride trong huyết tương theo thời gian (AUC) tăng lên 32% và thời gian bán thải cisapride kéo dài thêm 31% nhưng nồng độ đỉnh cisapride trong huyết tương tăng lên không đáng kể. Khoảng QTc hơi kéo dài sau khi dùng cisapride riêng lẻ, không bị kéo dài hơn nữa khi dùng đồng thời cisapride với esomeprazole (xem “Lưu ý Và Thận Trọng Đặc Biệt Khi Dùng").
Esomeprazole đã được chứng tỏ là không có tác động đáng kể về lâm sàng trên dược động học của amoxicillin hoặc quinidine.
Những nghiên cứu ngắn hạn đánh giá việc sử dụng đồng thời esomeprazole với naproxen hay rofecoxib chưa xác định được bất cứ tương tác dược động học nào liên quan về mặt lâm sàng. Kết quả từ các nghiên cứu trên đối tượng khỏe mạnh đã chỉ ra tương tác Dược động / Dược lực (PK/PD) giữa clopidogrel (liều nạp 300 mg/ liều duy trì hàng ngày 75mg) và esomeprazole (40mg uống 1 lần/ngày) dẫn đến giảm nồng độ và thời gian tiếp xúc với chất chuyển hóa có hoạt tính của clopidogrel trung bình 40% và giảm sự ức chế tối đa kết tập tiểu cầu (gây ra bởi ADP) trung bình 14%.
Trong một nghiên cứu trên người khỏe mạnh, khi sử dụng đồng thời clopidogrel với phối hợp liều cố định esomeprazole 20mg + ASA 81mg, nồng độ và thời gian tiếp xúc của chất chuyển hóa có hoạt tính của clopidogrel giảm gần 40% so với sử dụng Clopidogrel đơn thuần. Tuy nhiên, mức độ tối đa ức chế kết tập tiểu cầu (gây bởi ADP) trên những đối tượng này là như nhau ở nhóm clopidogrel đơn thuần và nhóm clopidogrel phối hợp với (esomeprazole + ASA). Số liệu chưa nhất quán về biểu hiện lâm sàng của tương tác Dược động / Dược lực của esomeprazole trên các biến cố tim mạch chính đã được báo cáo từ các nghiên cứu quan sát và nghiên cứu lâm sàng. Nhằm mục đích thận trọng, việc dùng đồng thời clopidogrel không được khuyến khích.
Chưa biết cơ chế
Việc sử dụng đồng thời với esomeprazole đã được báo cáo làm tăng nồng độ huyết thanh của tacrolimus.
Khi dùng đồng thời các PPI, nồng độ methotrexate được báo cáo là tăng lên ở một số bệnh nhân. Khi dùng liều cao methotrexate, nên cân nhắc dừng tạm thời esomeprazole.
Ảnh hưởng của các thuốc khác trên dược động học của esomeprazole
Esomeprazole được chuyển hóa bởi CYP2C19 và CYP3A4. Khi dùng đồng thời esomeprazole với một chất ức chế CYP3A4, clarithromycin (500mg, 2 lần/ngày) làm tăng gấp đôi diện tích dưới đường cong (AUC) của esomeprazole. Dùng đồng thời esomeprazole cùng với một chất ức chế cả hai CYP2C19 và CYP3A4 có thể làm tăng hơn hai lần nồng độ và thời gian tiếp xúc của esomeprazole. Chất ức chế CYP2C19 và CYP3A4 voriconazole làm tăng AUCT của omeprazole lên 280%. Không cần điều chỉnh liều esomeprazole thường xuyên trong những tình huống này. Tuy nhiên, sự điều chỉnh liều cần được lưu ý ở những bệnh nhân suy gan nặng hoặc điều trị lâu dài. Các thuốc cảm ứng CYP2C19 hoặc CYP3A4 hoặc cả hai (như rifampicin và cỏ St. John’s) có thể gây giảm nồng độ esomeprazole huyết thanh do tăng chuyển hóa esomeprazole.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000098'), 'Viên nén kháng dịch dạ dày', '2 vỉ x 7 viên', 'Người lớn:
Bệnh trào ngược dạ dày - thực quản (GERD)
Điều trị viêm xước thực quản do trào ngược.
Điều trị dài hạn cho bệnh nhân viêm thực quản đã chữa lành để phòng ngừa tái phát.
Điều trị triệu chứng bệnh trào ngược dạ dày - thực quản (GERD).
Kết hợp với một phác đồ kháng khuẩn thích hợp để diệt trừ Helicobacter pylori
Chữa lành loét tá tràng có nhiễm Helicobacter pylori.
Phòng ngừa tái phát loét dạ dày - tá tràng ở bệnh nhân loét có nhiễm Helicobacter pylori.
Bệnh nhân cần điều trị bằng thuốc kháng viêm không steroid (NSAID) liên tục
Chữa lành loét dạ dày do dùng thuốc NSAID.
Phòng ngừa loét dạ dày và loét tá tràng do dùng thuốc NSAID ở bệnh nhân có nguy cơ.
Điều trị kéo dài sau khi đã điều trị phòng ngừa tái xuất huyết do loét dạ dày tá tràng bằng đường tĩnh mạch.
Điều trị hội chứng Zollinger Ellison.
Trẻ vị thành niên từ 12 tuổi trở lên
Bệnh trào ngược dạ dày - thực quản (GERD)
Điều trị viêm xước thực quản do trào ngược.
Điều trị dài hạn cho bệnh nhân viêm thực quản đã chữa lành để phòng ngừa tái phát.
Điều trị triệu chứng bệnh trào ngược dạ dày - thực quản (GERD).
Kết hợp với kháng sinh trong điều trị loét tá tràng do Helicobacter pylori.', 'Tiền sử quá mẫn với esomeprazole, phân nhóm benzimidazole hay các thành phần khác trong công thức.
Không nên sử dụng esomeprazole đồng thời với nelfinavir, atazanavir (Xem “Tương Tác Thuốc và các dạng tương tác khác”).', 'Các phản ứng ngoại ý phổ biến nhất bao gồm: đau đầu, đau bụng, tiêu chảy và buồn nôn (kể cả trong nghiên cứu hậu mãi). Đặc tính về an toàn là tương tự nhau giữa các dạng thuốc, các chỉ định, nhóm tuổi và các quần thể bệnh nhân.
Các phản ứng ngoại ý do thuốc sau đây đã được ghi nhận hay nghi ngờ trong các chương trình nghiên cứu lâm sàng của esomeprazole và theo dõi sau khi thuốc ra thị trường. Không có phản ứng nào liên quan đến liều dùng.
Các phản ứng này được xếp theo tần suất xảy ra: rất thường gặp &gt; 1/10, thường gặp &gt;= 1/100 đến &lt; 1/10; ít gặp &gt;= 1/1000 đến &lt; 1/100; hiếm gặp &gt;= 1/10.000 đến &lt; 1/1000; rất hiếm gặp &lt; 1/10.000; chưa biết (không thể dự đoán từ các dữ liệu đang có).
Rối loạn máu và hệ bạch huyết
Hiếm gặp: giảm bạch cầu, giảm tiểu cầu.
Rất hiếm gặp: mất bạch cầu hạt, giảm toàn thể huyết cầu.
Rối loạn hệ miễn dịch
Hiếm gặp: phản ứng quá mẫn như là sốt, phù mạch, phản ứng phản vệ/sốc phản vệ.
Rối loạn chuyển hóa và dinh dưỡng
Ít gặp: phù ngoại biên.
Hiếm gặp: giảm natri máu.
Chưa biết: giảm magiê máu (xem mục “Lưu ý và thận trọng đặc biệt khi dùng”); giảm magiê máu nặng có thể liên quan tới giảm canxi máu. Giảm magiê máu cũng có thể dẫn đến giảm kali máu.
Rối loạn tâm thần
Ít gặp: mất ngủ.
Hiếm gặp: kích động, lú lẫn, trầm cảm.
Rất hiếm: nóng nảy, ảo giác.
Rối loạn hệ thần kinh
Thường gặp: nhức đầu.
Ít gặp: choáng váng, dị cảm, ngủ gà.
Hiếm gặp: rối loạn vị giác.
Rối loạn mắt
Hiếm gặp: nhìn mờ.
Rối loạn tai và mê đạo
Ít gặp: chóng mặt.
Rối loạn hô hấp, ngực và trung thất
Hiếm gặp: co thắt phế quản.
Rối loạn tiêu hóa
Thường gặp: đau bụng, táo bón, tiêu chảy, đầy bụng, buồn nôn/nôn.
Ít gặp: khô miệng.
Hiếm gặp: viêm miệng, nhiễm candida đường tiêu hóa.
Chưa biết: viêm đại tràng vi thể.
Rối loạn gan mật
Ít gặp: tăng men gan.
Hiếm gặp: viêm gan có hoặc không vàng da.
Rất hiếm: suy gan, bệnh não ở bệnh nhân đã có bệnh gan.
Rối loạn da và mô dưới da
Ít gặp: viêm da, ngứa, nổi mẩn, mề đay.
Hiếm gặp: hói đầu, nhạy cảm với ánh sáng.
Rất hiếm: hồng ban đa dạng, hội chứng Stevens - Johnson, hoại tử biểu bì gây độc (TEN).
Rối loạn cơ xương và mô liên kết
Ít gặp: gãy xương hông, cổ tay và cột sống (xem mục “Lưu ý và thận trọng đặc biệt khi dùng”)
Hiếm gặp: đau khớp, đau cơ.
Rất hiếm: yếu cơ.
Rối loạn thận và tiết niệu
Rất hiếm: viêm thận kẽ; ở một số bệnh nhân tình trạng suy thận đi kèm đã được báo cáo.
Rối loạn hệ sinh sản và tuyến vú
Rất hiếm: nữ hóa tuyến vú.
Các rối loạn tổng quát và tại chỗ
Hiếm: khó ở, tăng tiết mồ hôi.', 'Nên nuốt toàn bộ viên cùng với chất lỏng. Không nên nhai hay nghiền nát viên.
Đối với bệnh nhân khó nuốt, có thể phân tán viên thuốc trong nửa ly nước không chứa carbonate. Không dùng các chất lỏng khác vì lớp bọc giúp thuốc tan trong đường ruột có thể bị hòa tan. Khuấy cho đến khi viên thuốc phân tán hoàn toàn và uống dịch phân tán chứa vi hạt này ngay lập tức hoặc trong vòng 30 phút. Tráng ly lại bằng nửa ly nước và uống. Không được nhai hoặc nghiền nát các vi hạt này.
Đối với bệnh nhân không thể nuốt được, có thể phân tán viên thuốc trong nước không chứa carbonate và dùng qua ống thông dạ dày. Quan trọng là phải kiểm tra cẩn thận sự thích hợp của loại bơm tiêm và ống thông chọn lựa. Xin xem phần hướng dẫn sử dụng, xử lý và loại bỏ (khi cần) để được hướng dẫn chuẩn bị và sử dụng.
Người lớn và trẻ vị thành niên từ 12 tuổi trở lên
Bệnh trào ngược dạ dày - thực quản (GERD)
Điều trị viêm xước thực quản do trào ngược: 40mg, 1 lần/ngày trong 4 tuần. Nên điều trị thêm 4 tuần nữa cho bệnh nhân viêm thực quản chưa được chữa lành hay vẫn có triệu chứng dai dẳng.
Điều trị dài hạn cho bệnh nhân viêm thực quản đã chữa lành để phòng ngừa tái phát: 20mg, 1 lần/ngày.
Điều trị triệu chứng bệnh trào ngược dạ dày - thực quản (GERD): 20mg, 1 lần/ngày ở bệnh nhân không bị viêm thực quản. Nếu không kiểm soát được triệu chứng sau 4 tuần, bệnh nhân nên được thăm dò cận lâm sàng kỹ hơn để xác định chẩn đoán. Khi đã hết triệu chứng, có thể duy trì sự kiểm soát triệu chứng với liều 20mg, 1 lần/ngày. Ở người lớn có thể sử dụng chế độ điều trị khi cần thiết với liều 20mg, 1 lần/ngày. Ở những bệnh nhân trào ngược dạ dày thực quản (GERD) đang sử dụng NSAID có nguy cơ phát triển loét dạ dày tá tràng, không khuyến cáo kiểm soát các triệu chứng bằng chế độ điều trị khi cần thiết.
Người lớn
Kết hợp với một phác đồ kháng khuẩn thích hợp để diệt trừ Helicobacter pylori
Chữa lành loét tá tràng có nhiễm Helicobacter pylori: NEXIUM MUPS 20mg, amoxicillin 1g và clarithromycin 500mg, tất cả được dùng 2 lần/ngày trong 7 ngày.
Phòng ngừa tái phát loét dạ dày - tá tràng ở bệnh nhân loét có nhiễm Helicobacter pylori: NEXIUM MUPS 20mg, amoxicillin 1g và clarithromycin 500mg, tất cả được dùng 2 lần/ngày trong 7 ngày.
Bệnh nhân cần điều trị bằng thuốc kháng viêm không steroid (NSAID) liên tục
Chữa lành loét dạ dày do dùng thuốc NSAID: liều thông thường 20mg, 1 lần/ngày. Thời gian điều trị là 4-8 tuần.
Phòng ngừa loét dạ dày và loét tá tràng do dùng thuốc NSAID ở bệnh nhân có nguy cơ: 20mg, 1 lần/ngày.
Điều trị kéo dài sau khi đã điều trị phòng ngừa tái xuất huyết do loét dạ dày tá tràng bằng đường tĩnh mạch
40mg, 1 lần/ngày trong 4 tuần sau khi đã điều trị phòng ngừa tái xuất huyết do loét dạ dày tá tràng bằng đường tĩnh mạch.
Điều trị hội chứng Zollinger Ellison
Liều khởi đầu khuyến cáo là NEXIUM MUPS 40mg, 2 lần/ngày. Sau đó điều chỉnh liều theo đáp ứng của từng bệnh nhân vả tiếp tục điều trị khi còn chỉ định về mặt lâm sàng. Các dữ liệu lâm sàng cho thấy phần lớn bệnh nhân được kiểm soát với esomeprazole liều từ 80 - 160mg/ngày. Khi liều hàng ngày lớn hơn 80mg, nên chia Iiều dùng thành 2 lần/ngày.
Trẻ vị thành niên từ 12 tuổi trở lên
Điều trị loét tá tràng do Helicobacter pylori
Khi lựa chọn liệu pháp phối hợp thích hợp, cần xem xét hướng dẫn chính thức của quốc gia, vùng và địa phương về sự đề kháng của vi khuẩn, thời gian điều trị (thông thường là 7 ngày nhưng đôi khi có thể lên tới 14 ngày), và cách dùng các thuốc kháng khuẩn thích hợp. Quá trình điều trị cần được theo dõi bởi chuyên viên y tế.
Liều dùng khuyến cáo là:
Cân nặngLiều dùng
30 - 40kg- Kết hợp với hai kháng sinh: dùng đồng thời NEXIUM MUPS 20mg, amoxicillin 750mg và clarithromycin 7,5mg/kg cân nặng, 2 lần/ngày trong 1 tuần.
&gt; 40kg- Kết hợp với hai kháng sinh: dùng đồng thời NEXIUM MUPS 20mg, amoxicillin 1g và clarithromycin 500mg, 2 lần/ngày trong 1 tuần.
Trẻ em dưới 12 tuổi
Về liều lượng cho bệnh nhân từ 1 đến 11 tuổi, xin tham khảo tờ hướng dẫn sử dụng của NEXIUM dạng gói chứa cốm kháng dịch dạ dày.
Người tổn thương chức năng thận
Không cần phải điều chỉnh liều ở bệnh nhân tổn thương chức năng thận. Do ít kinh nghiệm về việc dùng thuốc ở bệnh nhân suy thận nặng, nên thận trọng khi điều trị ở các bệnh nhân này (Xem “Đặc Tính Dược Động Học”).
Người tổn thương chức năng gan
Không cần phải điều chỉnh liều ở bệnh nhân tổn thương gan ở mức độ từ nhẹ đến trung bình. Ở bệnh nhân suy gan nặng, không nên dùng quá liều tối đa là NEXIUM MUPS 20mg (Xem “Đặc Tính Dược Động Học”).
Người cao tuổi
Không cần điều chỉnh liều ở người cao tuổi.
- Quá liều
Cho đến nay có rất ít kinh nghiệm về việc dùng quá liều có chủ đích. Các triệu chứng được mô tả có liên quan đến việc dùng liều 280mg là các triệu chứng trên đường tiêu hóa và tình trạng mệt mỏi. Các liều đơn esomeprazole 80mg vẫn an toàn khi dùng. Chưa có chất giải độc đặc hiệu. Esomeprazole gắn kết mạnh với protein huyết tương và vì vậy không dễ dàng thẩm phân được. Trong trường hợp quá liều, nên điều trị triệu chứng và sử dụng các biện pháp hỗ trợ tổng quát.', 'bảo quản ở nhiệt độ trên 30°C. Bảo quản trong bao bì gốc để tránh ẩm.', '- Thận trọng khi sử dụng
Khi có sự hiện diện bất kỳ một triệu chứng báo động nào (như là giảm cân đáng kể không chú ý, nôn tái phát, khó nuốt, nôn ra máu hay đại tiện phân đen) và khi nghi ngờ hoặc bị loét dạ dày nên loại trừ bệnh lý ác tính vì điều trị bằng NEXIUM MUPS có thể làm giảm triệu chứng và làm chậm trễ việc chẩn đoán.
Bệnh nhân điều trị thời gian dài (đặc biệt những người đã điều trị hơn 1 năm) nên được theo dõi thường xuyên.
Bệnh nhân điều trị theo chế độ khi cần thiết nên liên hệ với bác sỹ nếu có các triệu chứng thay đổi về đặc tính. Khi kê toa esomeprazole theo chế độ điều trị khi cần thiết, nên xem xét đến mối liên quan về tương tác với các thuốc khác do nồng độ esomeprazole trong huyết tương có thể thay đổi (Xem “Tương Tác Thuốc và các dạng tương tác khác").
Khi kê toa esomeprazole để diệt trừ Helicobacter pylori, nên xem xét các tương tác thuốc có thể xảy ra trong phác đồ điều trị 3 thuốc. Clarithromycin là chất ức chế mạnh CYP3A4 và vì thế nên xem xét chống chỉ định và tương tác đối với clarithromycin khi dùng phác đồ 3 thuốc cho bệnh nhân đang dùng các thuốc khác chuyển hóa qua CYP3A4 như cisapride.
Thuốc này có chứa đường sucrose. Bệnh nhân có các vấn đề di truyền hiếm gặp như không dung nạp fructose, kém hấp thu glucose - galactose hoặc thiếu sucrase -isomaltase không nên dùng thuốc này.
Điều trị bằng thuốc ức chế bơm proton có thể làm tăng nhẹ nguy cơ nhiễm khuẩn đường tiêu hóa do Salmonella và Campylobacter (Xem phần “Đặc tính Dược lực học”).
Không khuyến cáo dùng đồng thời esomeprazole với atazanavir (xem mục tương tác thuốc và các dạng tương tác khác). Nếu sự phối hợp atazanavir với thuốc ức chế bơm proton là không thể tránh khỏi, cần theo dõi chặt chẽ trên lâm sàng khi tăng liều atazanavir đến 400mg kết hợp với 100mg ritonavir, không nên sử dụng quá 20mg esomeprazole.
Esomeprazole, cũng như các thuốc kháng axit khác, có thể làm giảm hấp thu vitamin B12 (cyanocobalamin) do sự giảm hoặc thiếu axít dịch vị. Điều này nên được cân nhắc ở những bệnh nhân có giảm dự trữ vitamin B12 hoặc có yếu tố nguy cơ giảm hấp thu vitamin B12 khi điều trị dài hạn.
Esomeprazole là chất ức chế CYP2C19. Khi bắt đầu hay kết thúc điều trị với esomeprazole, cần xem xét nguy cơ tương tác thuốc với các thuốc chuyển hóa qua CYP2C19. Đã có ghi nhận tương tác giữa clopidogrel và esomeprazole (xem mục “Tương tác thuốc và các dạng tương tác khác”). Không rõ mối liên quan lâm sàng của tương tác này. Như là một biện pháp thận trọng, không khuyến khích dùng đồng thời esomeprazole và clopidogrel.
Đã có các báo cáo về giảm magiê máu nặng ở những bệnh nhân điều trị bằng thuốc ức chế bơm proton (PPI) như esomeprazole trong ít nhất 3 tháng, và trong đa số các trường hợp là trong 1 năm. Biểu hiện nặng của giảm magiê máu như mệt mỏi, co cứng, mê sảng, co giật, choáng váng và loạn nhịp thất có thể xảy ra nhưng khởi phát âm thầm và không được lưu tâm. Ở đa số các bệnh nhân, tình trạng giảm magiê máu được cải thiện sau khi sử dụng liệu pháp magiê thay thế và ngừng sử dụng PPI.
Đối với các bệnh nhân cần được điều trị kéo dài hoặc những bệnh nhân dùng đồng thời PPI và digoxin hoặc các thuốc khác có thể gây hạ magiê máu (ví dụ như các thuốc lợi tiểu), nhân viên y tế nên cân nhắc định lượng nồng độ magiê máu trước khi bắt đầu điều trị PPI và định kỳ theo dõi trong quá trình điều trị.
Các thuốc ức chế bơm proton, đặc biệt khi dùng liều cao và trong thời gian dài (&gt; 1 năm), có thể làm tăng nhẹ nguy cơ gãy xương hông, xương cổ tay và cột sống, đặc biệt ở bệnh nhân cao tuổi hoặc khi có sự hiện diện của yếu tố nguy cơ khác. Các nghiên cứu quan sát chỉ ra rằng các thuốc ức chế bơm proton có thể làm tăng tổng thể nguy cơ gãy xương khoảng 10 - 40%. Một phần trong mức tăng này có thể do các yếu tố nguy cơ khác. Bệnh nhân có nguy cơ loãng xương nên được chăm sóc theo các hướng dẫn lâm sàng hiện hành và nên được bổ sung một lượng vitamin D và calcium thích hợp.
Tương tác với các xét nghiệm
Sự tăng nồng độ Chromogranin A (CgA) có thể can thiệp vào việc dò tìm các khối u thần kinh nội tiết. Nhằm tránh sự can thiệp này, nên ngừng điều trị bằng esomeprazole ít nhất 5 ngày trước khi định lượng CgA (xem mục "Đặc tính dược động học”).
- Thai kỳ và cho con bú
Chưa có đủ dữ liệu lâm sàng về việc dùng NEXIUM MUPS trên phụ nữ có thai. Khi dùng hỗn hợp đồng phân racemic của omeprazole, dữ liệu trên số lượng lớn phụ nữ có thai có dùng thuốc từ các nghiên cứu dịch tễ chứng tỏ thuốc không gây dị tật hoặc độc tính trên bào thai. Các nghiên cứu về esomeprazole trên động vật không cho thấy thuốc có tác động có hại trực tiếp hay gián tiếp trên sự phát triển của phôi/thai nhi. Các nghiên cứu trên động vật với hỗn hợp racemic cũng không cho thấy có tác động có hại trực tiếp hay gián tiếp trên tình trạng mang thai, sự sinh nở hoặc sự phát triển sau sinh. Nên thận trọng khi kê toa cho phụ nữ có thai.
Người ta chưa biết esomeprazole có tiết qua sữa mẹ hay không. Không có nghiên cứu nào trên phụ nữ cho con bú được thực hiện. Vì vậy, không nên dùng NEXIUM MUPS trong khi cho con bú.
- Khả năng lái xe và vận hành máy móc
Esomeprazole ít ảnh hưởng tới khả năng lái xe và vận hành máy móc. Một số phản ứng ngoại ý như chóng mặt (ít gặp), nhìn mờ (hiếm gặp) có thể xảy ra. Nếu xảy ra các phản ứng ngoại ý này, bệnh nhân không nên lái xe và vận hành máy móc.
- Tương tác thuốc
Các nghiên cứu về tương tác thuốc mới chỉ được thực hiện ở người lớn.
Tác động của esomeprazole trên dược động học của các thuốc khác.
Đối với những thuốc hấp thu phụ thuộc độ pH
Tình trạng giảm độ axit dạ dày khi điều trị bằng esomeprazole và các PPI khác có thể làm giảm hay tăng sự hấp thu của các thuốc khác có cơ chế hấp thu phụ thuộc pH dạ dày. Giống như các thuốc làm giảm độ axit dạ dày khác, sự hấp thu của các thuốc như ketoconazole, itraconazole và erlotinib có thể giảm và sự hấp thu của digoxin có thể tăng lên trong khi điều trị với esomeprazole. Dùng đồng thời omeprazole (20mg/ngày) và digoxin ở các đối tượng khỏe mạnh làm tăng sinh khả dụng của digoxin khoảng 10% (lên đến 30% ở 2 trên 10 đối tượng nghiên cứu). Hiếm có các báo cáo về độc tính của digoxin. Tuy nhiên, cần thận trọng khi dùng esomeprazole liều cao ở bệnh nhân cao tuổi. Cần tăng cường theo dõi việc điều trị bằng digoxin.
Đã có báo cáo rằng omeprazole tương tác với một số chất ức chế enzym protease. Chưa rõ tầm quan trọng về lâm sàng và cơ chế tác dụng của các tương tác đã được ghi nhận. Tăng độ pH dạ dày trong quá trình điều trị với omeprazole có thể dẫn đến thay đổi sự hấp thu của chất ức chế enzym protease. Cơ chế tương tác khác có thể xảy ra là thông qua sự ức chế enzym CYP2C19. Đối với atazanavir và nelfinavir, giảm nồng độ thuốc trong huyết thanh đã được ghi nhận khi dùng chung với omeprazole, do đó không khuyến cáo dùng đồng thời các thuốc này. Ở người tình nguyện khỏe mạnh, sử dụng đồng thời omeprazole (40mg, 1 lần/ngày) và atazanavir 300mg/ritonavir 100mg làm giảm đáng kể nồng độ và thời gian tiếp xúc atazanavir (giảm AUC, Cmax và Cmin khoảng 75%). Tăng liều atazanavir đến 400mg đã không bù trừ tác động của omeprazole trên nồng độ và thời gian tiếp xúc atazanavir.
Dùng phối hợp omeprazole (20mg, 1 lần/ngày) với atazanavir 400mg/ritonavir 100mg ở người tình nguyện khỏe mạnh làm giảm khoảng 30% nồng độ và thời gian tiếp xúc atazanavir khi so sánh với nồng độ và thời gian tiếp xúc ghi nhận trong trường hợp dùng atazanavir 300mg/ritonavir 100mg, 1 lần/ngày, mà không dùng omeprazole 20mg, 1 lần/ngày. Dùng phối hợp với omeprazole (40mg, 1 lần/ngày) làm giảm trị số trung bình AUC, Cmax và Cmin của nelfinavir khoảng 36 - 39% và giảm khoảng 75 - 92% trị số trung bình AUC, Cmax và Cmin của chất chuyển hóa hoạt tính có tác động dược lý M8. Đối với saquinavir (sử dụng đồng thời với ritonavir), tăng nồng độ thuốc trong huyết thanh (80-100%) khi dùng đồng thời với omeprazole (40mg, 1 lần/ngày). Điều trị với omeprazole 20mg, 1 lần/ngày, không ảnh hưởng đến sự tiếp xúc của darunavir (khi dùng đồng thời với ritonavir) và amprenavir (khi dùng đồng thời với ritonavir). Điều trị với esomeprazole 20mg, 1 lần/ngày, không ảnh hưởng đến sự tiếp xúc của amprenavir (sử dụng hay không sử dụng đồng thời với ritonavir). Điều trị với omeprazole 40mg, 1 lần/ngày, không ảnh hưởng đến sự tiếp xúc của lopinavir (sử dụng đồng thời với ritonavir). Do tác động dược lực và các đặc tính dược động học tương tự của omeprazole và esomeprazole, không khuyến cáo sử dụng esomeprazole đồng thời với atazanavir và chống chỉ định sử dụng esomeprazole đồng thời với nelfinavir.
Những thuốc chuyển hóa qua CYP2C19
Esomeprazole ức chế CYP2C19, enzym chính chuyển hóa esomeprazole. Do vậy, khi esomeprazole được dùng chung với các thuốc chuyển hóa bằng CYP2C19 như diazepam, citalopram, imipramine, clomipramine, phenytoin..., nồng độ các thuốc này trong huyết tương có thể tăng và cần giảm liều dùng. Điều này cần được đặc biệt chú ý khi kê toa esomeprazole theo chế độ điều trị khi cần thiết. Dùng đồng thời với esomeprazole 30mg làm giảm 45% độ thanh thải diazepam (một cơ chất của CYP2C19). Khi dùng đồng thời với esomeprazole 40mg làm tăng 13% nồng độ đáy (trough) của phenytoin trong huyết tương ở bệnh nhân động kinh. Nên theo dõi nồng độ phenytoin trong huyết tương khi bắt đầu hay ngưng điều trị với esomeprazole. Omeprazole (40mg, 1 lần/ngày) làm tăng 15% Cmax và 45% AUCt của voriconazole (một cơ chất của CYP2C19).
Khi dùng đồng thời 40mg esomeprazole ở người đang điều trị bằng warfarin trong một thử nghiệm lâm sàng đã cho thấy thời gian đông máu ở trong khoảng có thể chấp nhận. Tuy vậy, sau một thời gian lưu hành thuốc đã ghi nhận có một số rất hiếm trường hợp tăng INR đáng kể trên lâm sàng khi điều trị đồng thời hai thuốc trên. Nên theo dõi bệnh nhân khi bắt đầu và khi chấm dứt điều trị đồng thời esomeprazole với warfarin hoặc các dẫn chất khác của coumarine. Omeprazole, cũng như esomeprazole, hoạt động như các chất ức chế CYP2C19. Trong một nghiên cứu chéo, omeprazole sử dụng với liều 40mg trên đối tượng khỏe mạnh đã làm tăng Cmax và AUC của cilostazol tương ứng 18% và 26% và Cmax và AUC của một chất chuyển hóa có hoạt tính của nó tương ứng 29% và 69%.
Ở người tình nguyện khỏe mạnh, khi dùng chung với 40mg esomeprazole, diện tích dưới đường cong biểu diễn nồng độ cisapride trong huyết tương theo thời gian (AUC) tăng lên 32% và thời gian bán thải cisapride kéo dài thêm 31% nhưng nồng độ đỉnh cisapride trong huyết tương tăng lên không đáng kể. Khoảng QTc hơi kéo dài sau khi dùng cisapride riêng lẻ, không bị kéo dài hơn nữa khi dùng đồng thời cisapride với esomeprazole (xem “Lưu ý và thận trọng đặc biệt khi dùng”).
Esomeprazole đã được chứng tỏ là không có tác động đáng kể về lâm sàng trên dược động học của amoxicillin hoặc quinidine.
Những nghiên cứu ngắn hạn đánh giá việc sử dụng đồng thời esomeprazole với naproxen hay rofecoxib chưa xác định được bất cứ tương tác dược động học nào liên quan về mặt lâm sàng. Kết quả từ các nghiên cứu trên đối tượng khỏe mạnh đã chỉ ra tương tác dược động/dược lực (PK/PD) giữa clopidogrel (liều nạp 30mg/liều duy trì hàng ngày 75mg) và esomeprazole (40mg uống 1 lần/ngày) dẫn đến giảm nồng độ và thời gian tiếp xúc với chất chuyển hóa có hoạt tính của clopidogrel trung bình 40% và giảm sự ức chế tối đa kết tập tiểu cầu (gây ra bởi ADP) trung bình 14%.
Trong một nghiên cứu trên người khỏe mạnh, khi sử dụng đồng thời clopidogrel với phối hợp liều cố định esomeprazole 20mg + ASA 81mg, nồng độ và thời gian tiếp xúc của chất chuyển hóa có hoạt tính của clopidogrel giảm gần 40% so với sử dụng clopidogrel đơn thuần. Tuy nhiên, mức độ tối đa ức chế kết tập tiểu cầu (gây bởi ADP) trên những đối tượng này là như nhau ở nhóm clopidogrel đơn thuần và nhóm clopidogrel phối hợp với (esomeprazole + ASA). Số liệu chưa nhất quán về biểu hiện lâm sàng của tương tác dược động/dược lực của esomeprazole trên các biến cố tim mạch chính đã được báo cáo từ các nghiên cứu quan sát và nghiên cứu lâm sàng. Nhằm mục đích thận trọng, việc dùng đồng thời clopidogrel không được khuyến khích.
Chưa biết cơ chế
Việc sử dụng đồng thời với esomeprazole đã được báo cáo làm tăng nồng độ huyết thanh của tacrolimus.
Khi dùng đồng thời các PPI, nồng độ methotrexate được báo cáo là tăng lên ở một số bệnh nhân. Khi dùng Iiều cao methotrexate, nên cân nhắc dừng tạm thời esomeprazole.
Ảnh hưởng của các thuốc khác trên dược động học của esomeprazole
Esomeprazole được chuyển hóa bởi CYP2C19 và CYP3A4. Khi dùng đồng thời esomeprazole với một chất ức chế CYP3A4, clarithromycin (500mg, 2 lần/ngày) làm tăng gấp đôi diện tích dưới đường cong (AUC) của esomeprazole. Dùng đồng thời esomeprazole cùng với một chất ức chế cả hai CYP2C19 và CYP3A4 có thể làm tăng hơn hai lần nồng độ và thời gian tiếp xúc của esomeprazole. Chất ức chế CYP2C19 và CYP3A4 voriconazole làm tăng AUCt của omeprazole lên 280%. Không cần điều chỉnh liều esomeprazole thường xuyên trong những tình huống này. Tuy nhiên, sự điều chỉnh liều cần được lưu ý ở những bệnh nhân suy gan nặng hoặc điều trị lâu dài. Các thuốc cảm ứng CYP2C19 hoặc CYP3A4 hoặc cả hai (như rifampicin và có St. John’s) có thể gây giảm nồng độ esomeprazole huyết thanh do tăng chuyển hóa esomeprazole.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000288'), 'Viên nén', '5 vỉ x 10 viên', 'Drotaverine là thuốc điều trị chứng co thắt có nguồn gốc từ cơ trơn.
Cơn đau quặn mật do co thắt cơ trơn có liên quan đến những bệnh của đường mật: do sỏi túi mật, sỏi ống mật, viêm túi mật, viêm quanh túi mật, viêm đường mật và viêm bóng tụy.
Cơn đau quặn thận do co thắt cơ trơn trong những bệnh của đường tiết niệu: do sỏi thận, sỏi niệu quản, viêm bể thận, viêm bàng quang và co thắt bàng quang.
Dùng điều trị hỗ trợ trong:
- Đau bụng hay cơn đau quặn bụng do co thắt cơ trơn đường tiêu hoá: co thắt trong loét dạ dày-tá tràng, viêm dạ dày, co thắt tâm vị và môn vị, viêm ruột non và viêm đại tràng, co thắt đại tràng với táo bón và các dạng chướng bụng do hội chứng đại tràng bị kích thích. Drotaverine cải thiện nhanh và hiệu quả các triệu chứng đau bụng do co thắt nhưng không làm che lấp các dấu hiệu bụng ngoại khoa.
- Các bệnh phụ khoa: đau bụng kinh.', 'Không dùng NO-SPA 40mg trong những trường hợp sau:
Mẫn cảm với hoạt chất chính hoặc với bất kỳ tá dược nào của thuốc.
Suy gan nặng, suy thận nặng hay suy tim nặng (phân suất tống (EF) máu thấp).
Blốc nhĩ - thất độ II-III.
Trẻ em dưới 1 tuổi do thiếu dữ liệu về an toàn và hiệu quả.', 'Trong thời gian nghiên cứu lâm sàng, các tác dụng không mong muốn sau đây được báo cáo có liên quan đến drotaverine theo các nhóm tần suất: Rất hay gặp (>1/10), thường gặp (>1/100, 1/1.000, 1/10.000,
Rối loạn hệ tiêu hóa:
Hiếm gặp: buồn nôn, táo bón.
Rối loạn hệ thần kinh:
Hiếm gặp: nhức đầu, chóng mặt, mất ngủ.
Rối loạn hệ tim mạch:
Hiếm gặp: đánh trống ngực, hạ huyết áp.
Rối loạn hệ miễn dịch:
Hiếm gặp: phản ứng dị ứng (phù mạch, mề đay, phát ban, ngứa).
Khi gặp những triệu chứng trên, cần báo ngay cho bác sĩ điều trị. Nếu bạn ghi nhận bất kỳ tác dụng phụ nào không được nêu trong tờ hướng dẫn sử dụng này, cần báo ngay cho bác sĩ hoặc dược sĩ.', 'Liều dùng được khuyến cáo mỗi ngày của NO-SPA 40mg là:
Người lớn: 120 - 240mg/ngày (3 - 6 viên chia 2 - 3 lần/ngày).
Liều tương đương: 1 - 2 viên, uống 3 lần/ngày.
Trẻ em:
Trẻ em từ 1 - 6 tuổi: 40 - 120mg/ngày (1 - 3 viên chia 2 - 3 lần/ngày).
Liều tương đương: 1/2 - 1 viên, uống 2 - 3 lần/ngày. Hãy nghiền 1/2 - 1 viên thuốc hòa với ít nước trước khi uống.
Trẻ em trên 6 tuổi: 80 - 200mg/ngày (2 - 5 viên chia 2 - 5 lần/ngày).
Liều tương đương: 1 viên, uống 2 - 5 lần/ngày.
Cách dùng:
Dùng đường uống.
- Quá liều
Quá liều drotaverine có liên quan đến rối loạn nhịp tim và rối loạn dẫn truyền, bao gồm block phân nhánh và ngưng tim có thể dẫn đến tử vong.
Trong trường hợp quá liều, bệnh nhân cần được giám sát chặt chẽ, điều trị triệu chứng và chăm sóc nâng đỡ.
Biện pháp xử lý bao gồm gây nôn và/hoặc rửa dạ dày.', 'Bảo quản ở nhiệt độ không quá 30°C.', '- Thận trọng khi sử dụng
Những lưu ý đặc biệt và thận trọng khi sử dụng thuốc:
Cần phải thận trọng hơn khi dùng drotaverine trong trường hợp hạ huyết áp. Do thuốc có chứa lactose, bệnh nhân bị rối loạn di truyền hiếm gặp như bất dung nạp galactose, thiếu enzym lactase hoặc kém hấp thu glucose-galactose không nên sử dụng NO-SPA 40mg.
- Thai kỳ và cho con bú
Phụ nữ mang thai: Chưa có bằng chứng sinh quái thai và gây độc cho phôi thai từ các nghiên cứu trên động vật và nghiên cứu hồi cứu ở người trong giai đoạn mang thai khi dùng thuốc bằng đường uống. Tuy nhiên, cần thận trọng khi chỉ định dùng thuốc cho phụ nữ mang thai.
Phụ nữ đang nuôi con bằng sữa mẹ: do chưa có các kết quả khảo sát đầy đủ, thuốc không được khuyên dùng trong thời kỳ nuôi con bằng sữa mẹ.
- Tương tác thuốc
Khi dùng chung với levodopa, thuốc này làm giảm tác dụng chống Parkinson, và tăng run rẩy, co cứng cơ.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000126'), 'Viên nang cứng', '2 vỉ x 7 viên', 'Loét dạ dày-tá tràng lành tính.
Phòng và điều trị loét dạ dày tá tràng do dùng thuốc chống viêm không steroid.
Hội chứng Zollinger-Ellison.
Bệnh trào ngược dạ dày - thực quản: viêm thực quản trợt xước, loét hoặc thắt hẹp được xác định bằng nội soi.', 'Mẫn cảm với bất cứ thành phần nào của thuốc.
Dưới 18 tuổi.', 'Thường gặp: nhức đầu, đau bụng, táo bón, tiêu chảy, đầy bụng, buồn nôn, nôn.
Hiếm gặp: giảm bạch cầu tiểu cầu, sốt phù mạch, kích động, lú lẫn, trầm cảm, rối loạn vị giác.
Thông báo cho bác sỹ những tác dụng phụ gặp phải khi sử dụng thuốc.', '- Dùng đường uống
- Uống thuốc trước bữa ăn 1 giờ.
- Dùng theo chỉ định của bác sĩ hoặc theo liều sau:
Loét dạ dày-tá tràng nhiễm Helicobacter pylori:
Esomeprazol 40mg, ngày 1 lần; kết hợp với Clarithromycin 500mg + Amoxicilin1g, ngày 2 lần; phác đồ uống 10 ngày.
Hội chứng Zollinger-Ellison:
Tùy theo cá thể và mức độ tăng tiết acid dạ dày, liều uống cao hơn các trường hợp khác, có thể uống 1 lần hoặc chia làm nhiều lần. Trong trường hợp, không cắt bỏ khối u phải uống thuốc lâu dài.
Điều trị bệnh trào ngược dạ dày - thực quản nặng có viêm thực quản:
Uống 40mg, ngày 1 lần, trong 4 - 8 tuần có thể tăng 4 - 8 tuần nếu vẫn còn triệu chứng hoặc còn viêm qua nội soi.
- Quá liều
Chưa có báo cáo về quá liều esomeprazol ở người.
Khi uống quá liều, chỉ điều trị triệu chứng, không có thuốc điều trị đặc hiệu.', NULL, '- Thận trọng khi sử dụng
Esomeprazol có thể che giấu triệu chứng và làm chậm chẩn đoán ở bệnh nhân bị tổn thương ác tính ở dạ dày.
Thận trọng khi dùng cho bệnh nhân bị bệnh gan, người mang thai, người cho con bú.
Thận trọng khi dùng Esomeprazol kéo dài vì có thể gây viêm teo dạ dày.
- Thai kỳ và cho con bú
Chỉ sử dụng Esomeprazol khi thật cần thiết cho phụ nữ mang thai.
Nếu bắt buộc phải dùng esomeprazol cho phụ nữ cho con bú thì phải ngưng cho trẻ bú khi sử dụng esomeprazol.
- Khả năng lái xe và vận hành máy móc
Thuốc có thể dùng cho người lái xe và vận hành máy móc.
- Tương tác thuốc
Tình trạng giảm độ acid dạ dày khi điều trị bằng esomeprazole có thể làm tăng hay giảm sự hấp thu của các thuốc khác nếu cơ chế hấp thu của các thuốc này bị ảnh hưởng bởi độ acid dạ dày. Sự hấp thu của ketoconazole và itraconazole có thể giảm trong khi điều trị với esomeprazole.
Esomeprazole ức chế CYP2C19, men chính chuyển hóa esomeprazole. Do vậy, khi esomeprazole dùng chung với các thuốc chuyển hóa bằng CYP2C19 như diazepam, citalopram,..nồng độ các thuốc này trong huyết tương có thể tăng lên và cần giảm liều.
Dùng đồng thời esomeprazol + amoxicilin + clarithromycin làm tăng nồng độ esomeprazol và 14 hydroxy clarithromycin trong máu.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000076'), 'Viên nén', '10 vỉ x 10 viên', 'Các chứng rối loạn chức năng tiêu hóa như loét dạ dày - tá tràng (khó tiêu, buồn nôn và nôn), trào ngược dạ dày. Hội chứng ruột dễ bị kích thích, co thắt, trướng bụng, táo bón, tiêu chảy.', 'Mẫn cảm với trimebutin hoặc bất kỳ thành phần nào của thuốc.
Trẻ em dưới 12 tuổi.', 'Hiếm khi xảy ra ở liều điều trị thông thường: khô miệng, hôi miệng, tiêu chảy, buồn nôn, nôn, táo bón, buồn ngủ, mệt mỏi, chóng mặt, nhức đầu.
Rất hiếm xảy ra: các phản ứng ở da, lo lắng, bí tiểu, ù tai.
Thông báo cho bác sĩ biết những tác dụng không mong muốn gặp phải khi sử dụng thuốc.', 'Cách dùng:
Dùng đường uống. Uống thuốc trước bữa ăn.
Liều dùng:
Theo hướng dẫn của thầy thuốc hoặc theo liều sau:
Người lớn và trẻ em từ 12 tuổi trở lên: uống 1 - 2 viên/lần, ngày 3 lần. Liều dùng tối đa là 6 viên/ngày.
- Quá liều
Chưa có đủ thông tin về hiện tượng quá liều.', NULL, '- Thận trọng khi sử dụng
Thận trọng khi sử dụng cho phụ nữ mang thai và cho con bú.
- Thai kỳ và cho con bú
Độ an toàn dùng cho các đối tượng này chưa được nghiên cứu. Vì vậy cần cân nhắc giữa lợi ích dùng thuốc và nguy cơ có thể xảy ra. Nếu thật sự cần thiết, bệnh nhân nên ngừng cho con bú trong thời gian dùng thuốc.
- Khả năng lái xe và vận hành máy móc
Thuốc có thể gây chóng mặt do đó cần sử dụng thận trọng cho người lái xe hoặc vận hành máy móc.
- Tương tác thuốc
Trimebutin có thể ảnh hưởng hấp thu và gia tăng tác dụng không mong muốn của tubocurarin.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000151'), 'Viên nang cứng', '3 vỉ x 10 viên', 'Điều trị tăng huyết áp (ở người bệnh có những biến chứng chuyển hóa như đái tháo đường) và điều trị dự phòng ở người bệnh đau thắt ngực ổn định.', 'Không dùng cho những người suy tim chưa được điều trị ổn định.
Quá mẫn với dihydropyridin.
Phụ nữ có thai ba tháng đầu của thai kỳ.', 'Thường gặp: Phù cổ chân, nhức đầu, chóng mặt, đỏ bừng mặt và có cảm giác nóng, mệt mỏi, suy nhược, đánh trống ngực, chuột rút, buồn nôn, đau bụng, khó tiêu, khó thở.
Ít gặp: Hạ huyết áp quá mức, nhịp tim nhanh, đau ngực, ngoại ban, ngứa, đau cơ, đau khớp, rối loạn giấc ngủ.
Hiếm gặp: Ngoại tâm thu, tăng sản lợi, nổi mày đay, tăng enzym gan (transaminase, phosphatase kiềm, lactat dehydrogenase), tăng glucose huyết, lú lẫn, hồng ban đa dạng.
Thông báo cho bác sĩ những tác dụng không mong muốn gặp phải khi sử dụng thuốc.', 'Dùng uống.
Để điều trị tăng huyết áp và đau thắt ngực, liều phải phù hợp cho từng người bệnh. Liều khởi đầu bình thường là 5mg, 1 lần cho 24 giờ. Liều có thể tăng đến 10mg cho 1 lần trong 1 ngày.
Nếu tác dụng không hiệu quả sau 4 tuần điều trị có thể tăng liều. Không cần điều chỉnh liều khi phối hợp các thuốc lợi tiểu thiazid.
- Quá liều
Nhiễm độc amlodipin rất hiếm.
Dùng 30mg amlodipin cho trẻ em 1 tuổi rưỡi chỉ gây nhiễm độc "trung bình".
Trong trường hợp quá liều với thuốc chẹn calci, cách xử trí chung như sau:
Theo dõi tim mạch bằng điện tâm đồ và điều trị triệu chứng các tác dụng lên tim mạch cùng với rửa dạ dày và cho uống than hoạt. Nếu cần, phải điều chỉnh các chất điện giải. Trường hợp nhịp tim chậm và block tim, phải tiêm atropin 0.5 - 1mg vào tĩnh mạch cho người lớn (với trẻ em, tiêm tĩnh mạch 20 - 50 microgram/1kg thể trọng). Nếu cần, tiêm nhắc lại. Tiêm nhỏ giọt tĩnh mạch 20ml dung dịch calci gluconat (9 mg/ml) trong 5 phút cho người lớn; thêm isoprenalin 0.05 - 0.1 microgam/kg/phút hoặc adrenalin 0.05 - 0.3 microgam/kg/phút hoặc dopamin 4 - 5 microgam /kg/phút.
Với người bệnh giảm thể tích tuần hoàn cần truyền dung dịch natri clorid 0.9%. Khi cần, phải đặt máy tạo nhịp tim.
Trong trường hợp bị hạ huyết áp nghiêm trọng, phải tiêm tĩnh mạch dung dịch natri clorid 0.9%, adrenalin. Nếu không tác dụng thì dùng isoprenalin phối hợp với amrinon. Điều trị triệu chứng.', 'nhiệt độ 15 - 30°C', '- Thận trọng khi sử dụng
Với người giảm chức năng gan, hẹp động mạch chủ, suy tim sau nhồi máu cơ tim cấp.
- Thai kỳ và cho con bú
Các thuốc chẹn kênh calci có thể ức chế cơn co tử cung sớm. Tuy nhiên, thuốc không có tác dụng bất lợi cho quá trình sinh đẻ. Phải tính đến nguy cơ thiếu oxy cho thai nhi nếu gây hạ huyết áp ở người mẹ, vì có nguy cơ làm giảm tưới máu nhau thai. Đây là nguy cơ chung khi dùng các thuốc điều trị tăng huyết áp, chúng có thể làm thay đổi lưu lượng máu do giãn mạch ngoại biên.
Ở động vật thực nghiệm, thuốc chẹn kênh calci có thể gây quái thai ở dạng dị tật xương. Vì vậy, tránh dùng amlodipin cho người mang thai, đặc biệt trong 3 tháng đầu thai kỳ.
Chưa có dữ liệu nào đánh giá sự tích lũy amlodipin trong sữa mẹ.
- Khả năng lái xe và vận hành máy móc
Không ảnh hưởng khi lái xe và vận hành máy móc.
- Tương tác thuốc
Các thuốc gây mê làm tăng tác dụng chống tăng huyết áp của amlodipin và có thể làm huyết áp giảm mạnh hơn.
Lithi: Khi dùng cùng với amlodipin, có thể gây độc thần kinh, buồn nôn, nôn, tiêu chảy.
Thuốc chống viêm không steroid, đặc biệt là indomethacin có thể làm giảm tác dụng chống tăng huyết áp của amlodipin do ức chế tổng hợp prostaglandin và/hoặc giữ natri và dịch.
Các thuốc liên kết cao với protein (như dẫn chất coumarin, hydantoin...) phải dùng thận trọng với amlodipin, vì amlodipin cũng liên kết cao với protein nên nồng độ của các thuốc nói trên ở dạng tự do (không liên kết), có thể thay đổi trong huyết thanh.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000111'), 'Viên nén bao phim', '2 vỉ x 14 viên', 'Aprovel thuộc nhóm thuốc đối kháng thụ thể angiotensin - II. Angiotensin - II là một chất do cơ thể sinh ra, khi gắn lên thụ thể của nó ở mạch máu làm co mạch máu. Kết quả là làm tăng huyết áp. Aprovel chống lại việc gắn của angiotensin - II lên thụ thể này do đó làm mạch máu giãn ra và làm hạ huyết áp.
Aprovel làm chậm sự suy giảm chức năng thận ở bệnh nhân tăng huyết áp và đái tháo đường týp 2.
Aprovel được chỉ định dùng cho người lớn để:
Điều trị tăng huyết áp (tăng huyết áp nguyên phát).
Bảo vệ thận đối với bệnh nhân đái tháo đường týp 2 có tăng huyết áp và các bằng chứng xét nghiệm suy giảm chức năng thận.', 'Không được dùng Aprovel:
Nếu bạn bị dị ứng với Irbesartan hoặc bất kỳ thành phần nào chứa trong Aprovel.
Nếu bạn đang có thai hơn 3 tháng (tốt nhất là nên tránh dùng Aprovel từ lúc bắt đầu có thai - xem mục Phụ nữ có thai).
Không dùng Aprovel cho trẻ em (dưới 18 tuổi).', 'Giống tất cả các thuốc, Aprovel có thể gây ra những tác dụng không mong muốn, mặc dù không phải tất cả mọi người đều gặp các tác dụng phụ này. Một vài tác dụng phụ có thể trầm trọng và đòi hỏi phải được theo dõi y khoa.
Cũng như các loại thuốc tương tự, hiếm gặp các phản ứng dị ứng da (phát ban, mề đay), cũng như sưng phồng khu trú ở mặt, môi và/hoặc lưỡi ở các bệnh nhân uống Irbesartan. Nếu bạn có những triệu chứng như trên hoặc khó thở nên ngưng dùng Aprovel và đi gặp bác sĩ của bạn ngay lập tức.
Tần số của các tác dụng phụ nêu ra dưới đây được xác định theo quy ước sau:
Rất thường gặp: ảnh hưởng ít nhất từ 1 trên 10 bệnh nhân hoặc hơn.
Thường gặp: ảnh hưởng ít nhất 1 trên 100 bệnh nhân và ít hơn 1 trên 10 bệnh nhân.
Không thường gặp: ảnh hưởng ít nhất 1 trên 1000 bệnh nhân và ít hơn 1 trên 100 bệnh nhân.
Trong các nghiên cứu lâm sàng đối với bệnh nhân dùng Aprovel các tác dụng phụ sau đây đã được báo cáo:
Rất thường gặp: đối với bệnh nhân tăng huyết áp có đái tháo đường týp 2 và bệnh thận, xét nghiệm máu cho thấy tăng nồng độ kali.
Thường gặp: choáng váng, cảm giác buồn nôn/nôn, mệt mỏi và các xét nghiệm máu cho thấy tăng nồng độ men đo lường chức năng của cơ và của tim (creatin kinase). Đối với bệnh nhân tăng huyết áp và đái tháo đường týp 2 với bệnh thận, choáng váng khi đứng dậy từ tư thế nằm hoặc ngồi, hạ huyết áp khi đứng dậy từ tư thế nằm hoặc ngồi, đau khớp hoặc cơ cũng như giảm protein trong hồng cầu (hemoglobin).
Không thường gặp: tăng nhịp tim, phừng đỏ mặt, ho, tiêu chảy, khó tiêu/ợ nóng, rối loạn tình dục (các vấn đề thực hiện chức năng tình dục), đau ngực.
Một số tác dụng phụ được báo cáo kể từ khi Aprovel lưu hành trên thị trường nhưng không rõ tần số. Các tác dụng phụ ngoại ý này là chóng mặt, đau đầu, rối loạn vị giác, kêu vo vo ở tai, vọp bẻ, đau nhức khớp và cơ, bất thường chức năng gan, tăng nồng độ kali huyết, suy chức năng thận và viêm các mạch máu nhỏ chủ yếu ở da. Hiếm gặp các trường hợp vàng da (vàng da và/hoặc trắng con mắt). Nếu bất kỳ tác dụng phụ nào trở nên trầm trọng, hoặc nếu bạn gặp phải các tác dụng phụ không liệt kê trong toa hướng dẫn sử dụng thuốc này, bạn cần thông báo cho bác sĩ hoặc dược sĩ của bạn.', 'Luôn luôn tuân theo chỉ dẫn của bác sĩ dành cho bạn. Bạn phải hỏi lại bác sĩ hoặc dược sĩ nếu bạn không chắc chắn.
Cách dùng:
Dùng bằng đường uống. Viên thuốc phải được nuốt với một lượng nước thích hợp. Aprovel có thể được uống trong hoặc ngoài bữa ăn. Bạn nên uống liều thuốc hàng ngày vào cùng một thời điểm trong ngày. Điều quan trọng là bạn phải sử dụng Aprovel liên tục cho đến khi bác sĩ quyết định dùng phương cách điều trị khác.
- Bệnh nhân tăng huyết áp
Liều thông thường là 150mg một lần/ngày. Sau đó liều có thể tăng lên 300mg một lần/ngày tùy theo mức đáp ứng của huyết áp.
- Bệnh nhân tăng huyết áp và đái tháo đường týp 2 với bệnh thận
Đối với bệnh nhân tăng huyết áp và đái tháo đường týp 2, dùng liều duy trì 300mg một lần/ngày là thích hợp cho điều trị bệnh thận đi kèm. Bác sĩ có thể khuyến cáo cho dùng liều thấp hơn, nhất là khi bắt đầu điều trị ở những bệnh nhân đang thẩm tách máu, hoặc ở những bệnh nhân trên 75 tuổi.
Hiệu quả hạ áp tối đa có thể đạt được trong vòng 4 - 6 tuần sau khi bắt đầu điều trị.
Trẻ em không nên dùng Aprovel
Không nên dùng Aprovel cho trẻ em dưới 18 tuổi. Nếu một trẻ nuốt vài viên thuốc, phải đi gặp bác sĩ ngay lập tức.
Nếu bạn quên uống Aprovel
Nếu bạn tình cờ quên uống một liều hàng ngày, cứ uống liều kế tiếp như bình thường. Không được uống gấp đôi liều để bù cho liều đã quên.
Nếu bạn có thêm bất cứ thắc mắc nào về việc sử dụng thuốc này, hãy hỏi bác sĩ hay dược sĩ của bạn.
- Quá liều
Nếu bạn tình cờ uống quá nhiều viên thuốc, phải đi gặp bác sĩ ngay lập tức. Những kinh nghiệm ở người trưởng thành uống tới liều 900mg mỗi ngày trong 8 tuần cho thấy không có một biểu hiện độc tính nào. Các biểu hiện quá liều được nghĩ do Irbesartan là tụt huyết áp và nhanh nhịp tim; chậm nhịp tim cũng có thể gặp.
Không có thông tin cụ thể về điều trị quá liều Aprovel. Bệnh nhân nên được giám sát chặt chẽ, điều trị triệu chứng và nâng đỡ. Việc xử lý phụ thuộc vào thời gian kể từ lúc uống vào và độ nặng của các triệu chứng. Các biện pháp đề nghị trong xử trí quá liều bao gồm gây nôn và/hoặc rửa dạ dày, có thể sử dụng than hoạt. Irbesartan không bị loại thải bởi thẩm tách máu.', 'Bảo quản thuốc ở nhiệt độ dưới 30°C.', '- Thận trọng khi sử dụng
Hãy báo cho bác sĩ nếu bạn gặp một trong các tình trạng sau:
Tiêu chảy hoặc ói mửa nhiều.
Bệnh lý thận.
Bệnh lý tim.
Nếu dùng Aprovel cho bệnh thận do đái tháo đường. Trong trường hợp này bác sĩ có thể cho xét nghiệm máu thường quy, đặc biệt là đo nồng độ kali trong máu trong trường hợp chức năng thận kém.
Nếu bạn sắp sửa được phẫu thuật hoặc được gây mê.
- Thai kỳ và cho con bú
Phụ nữ có thai:
Cần báo cho bác sĩ biết nếu bạn có thai, hoặc có thể có thai. Thông thường bác sĩ sẽ khuyên bạn ngưng dùng Aprovel trước khi có thai hoặc ngay khi bạn biết mình có thai và sẽ khuyên bạn dùng thuốc khác thay thế cho Aprovel.
Aprovel không được khuyên dùng trong các tháng đầu của thai kỳ và không được dùng khi đã mang thai hơn 3 tháng, vì thuốc có thể là nguyên nhân gây nguy hiểm cho trẻ nếu người mẹ dùng thuốc này sau 3 tháng đầu của thai kỳ.
Phụ nữ đang thời kỳ nuôi con bằng sữa mẹ:
Cần báo cho bác sĩ biết nếu bạn đang hoặc bắt đầu nuôi con bằng sữa mẹ. Không được dùng Aprovel cho phụ nữ đang nuôi con bằng sữa mẹ, và bác sĩ sẽ chọn hướng điều trị khác cho bạn, nhất là khi con bạn còn sơ sinh hoặc thiếu tháng.
- Khả năng lái xe và vận hành máy móc
Chưa có nghiên cứu nào về các tác động trên khả năng lái xe và vận hành máy móc được thực hiện. Aprovel không ảnh hưởng đến khả năng lái xe hoặc điều khiển máy móc.
Tuy nhiên, trong thời gian điều trị tăng huyết áp, choáng váng hoặc mệt mỏi đôi khi có thể xảy ra. Nếu có những triệu chứng này, bạn cần phải tham khảo ý kiến của bác sĩ trước khi lái xe hoặc vận hành máy móc.
- Tương tác thuốc
Thông báo cho bác sĩ hoặc dược sĩ của bạn biết các thuốc bạn đang sử dụng hoặc vừa sử dụng, bao gồm cả các thuốc không cần kê toa.
Thường thì Aprovel không có tương tác với những thuốc loại khác.
Cần phải xét nghiệm máu nếu bạn sử dụng:
Những loại thuốc bổ sung kali.
Các chất muối thay thế có chứa kali.
Các loại thuốc giữ kali (như thuốc lợi tiểu).
Các loại thuốc có chứa lithium.
Tác dụng của Irbesartan có thể giảm khi bạn dùng các thuốc giảm đau như kháng viêm không steroid.
Dùng Aprovel chung với thức ăn và thức uống: Aprovel có thể được uống cùng hoặc không cùng với thức ăn.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000144'), 'Viên nén bao phim', '2 vỉ x 14 viên', 'Aprovel thuộc nhóm thuốc đối kháng thụ thể angiotensin-ll. Angiotensin-ll là một chất do cơ thể sinh ra, khi gắn lên thụ thể của nó ở mạch máu làm co mạch máu. Kết quả là làm tăng huyết áp. Aprovel chống lại việc gắn của angiotensin-ll lên thụ thể này do đó
làm mạch máu giãn ra và làm hạ huyết áp.
Aprovel làm chậm sự suy giảm chức năng thận ở bệnh nhân tăng huyết áp và đái tháo đường týp 2.
Aprovel được chỉ định dùng cho người lớn để:
Điều trị tăng huyết áp (tăng huyết áp nguyên phát)
Bảo vệ thận đối với bệnh nhân đái tháo đường týp 2 có tăng huyết áp và các bằng chứng xét nghiệm suy giảm chức năng thận.', 'Không được dùng APROVEL
Nếu bạn bị dị ứng với irbesartan hoặc bất kỳ thành phần nào chứa trong Aprovel
Nếu bạn đang có thai hơn 3 tháng (tốt nhất là nên tránh dùng Aprovel từ lúc bắt đầu có thai - xem mục Phụ nữ có thai).
Không dùng Aprovel cho trẻ em (dưới 18 tuổi).', 'Giống tất cả các thuốc, Aprovel có thể gây ra những tác dụng không mong muốn, mặc dù không phải tất cả mọi người đều gặp các tác dụng phụ này. Một vài tác dụng phụ có thể trầm trọng và đòi hỏi phải được theo dõi y khoa.
Cũng như các loại thuốc tương tự, hiếm gặp các phản ứng dị ứng da (phát ban, mề đay), cũng như sưng phồng khu trú ở mặt, môi và/hoặc lưỡi ở các bệnh nhân uống irbesartan. Nếu bạn có những triệu chứng như trên hoặc khó thở nên ngưng dùng Aprovel và đi gặp bác sĩ của bạn ngay lập tức.
Tần số của các tác dụng phụ nêu ra dưới đây được xác định theo quy ước sau:
Rất thường gặp: ảnh hưởng ít nhất từ 1 trên 10 bệnh nhân hoặc hơn.
Thường gặp: ảnh hưởng ít nhất 1 trên 100 bệnh nhân và ít hơn 1 trên 10 bệnh nhân.
Không thường gặp: ảnh hưởng ít nhất 1 trên 1000 bệnh nhân và ít hơn 1 trên 100 bệnh nhân.
Trong các nghiên cứu lâm sàng đối với bệnh nhân dùng Aprovel, các tác dụng phụ sau đây đã được báo cáo:
Rất thường gặp: đối với bệnh nhân tăng huyết áp có đái tháo đường týp 2 và bệnh thận, xét nghiệm máu cho thấy tăng nồng độ kali.
Thường gặp: choáng váng, cảm giác buồn nôn/nôn, mệt mỏi và các xét nghiệm máu cho thấy tăng nồng độ men đo lường chức năng của cơ và của tim (creatin kinase). Đối với bệnh nhân tăng huyết áp và đái tháo đường týp 2 với bệnh thận, choáng váng khi đứng dậy từ tư thế nằm hoặc ngồi, hạ huyết áp khi đứng dậy từ tư thế nằm hoặc ngồi), đau khớp hoặc cơ cũng như giảm protein trong hồng cầu (hemoglobin).
Không thường gặp: tăng nhịp tim, phừng đỏ mặt, ho, tiêu chảy, khó tiêu/ợ nóng, rối loạn tình dục (các vấn đề thực hiện chức năng tình dục), đau ngực.
Một số tác dụng phụ được báo cáo kể từ khi Aprovel lưu hành trên thị trường nhưng không rõ tần số. Các tác dụng phụ ngoại ý này là chóng mặt, đau đầu, rối loạn vị giác, kêu vo vo ở tai, vọp bẻ, đau nhức khớp và cơ, bất thường chức năng gan, tăng nồng độ kali huyết, suy chức năng thận và viêm các mạch máu nhỏ chủ yếu ở da.
Hiếm gặp các trường hợp vàng da (vàng da và/hoặc trắng con mắt).
Nếu bất kỳ tác dụng phụ nào trở nên trầm trọng, hoặc nếu bạn gặp phải các tác dụng phụ không liệt kê trong toa hướng dẫn sử dụng thuốc này, bạn cần thông báo cho bác sĩ hoặc dược sĩ của bạn.', 'Luôn luôn tuân theo chỉ dẫn của bác sĩ dành cho bạn. Bạn phải hỏi lại bác sĩ hoặc dược sĩ nếu bạn không chắc chắn.
Cách dùng
Dùng bằng đường uống, viên thuốc phải được nuốt với một lượng nước thích hợp. Aprovel có thể được uống trong hoặc ngoài bữa ăn. Bạn nên uống liều thuốc hàng ngày vào cùng một thời điểm trong ngày. Điều quan trọng là bạn phải sử dụng Aprovel liên tục cho đến khi bác sĩ quyết định dùng phương cách điều trị khác.
Bệnh nhân tăng huyết áp
Liều thông thường là 150mg một lần/ngày. Sau đó liều có thể tăng lên 300mg một lần/ngày tùy theo mức đáp ứng của huyết áp.
Bệnh nhân tăng huyết áp và đái tháo đường týp 2 với bệnh thận
Đối với bệnh nhân tăng huyết áp và đái tháo đường týp 2, dùng liều duy trì 300mg một lần/ngày là thích hợp cho điều trị bệnh thận đi kèm.
Bác sĩ có thể khuyến cáo cho dùng liều thấp hơn, nhất là khi bắt đầu điều trị ở những bệnh nhân đang thẩm tách máu, hoặc ở những bệnh nhân trên 75 tuổi.
Hiệu quả hạ áp tối đa có thể đạt được trong vòng 4 - 6 tuần sau khi bắt đầu điều trị.
Trẻ em không nên dùng Aprovel
Không nên dùng Aprovel cho trẻ em dưới 18 tuổi. Nếu một trẻ nuốt vài viên thuốc, phải đi gặp bác sĩ ngay lập tức.
Nếu bạn quên uống Aprovel
Nếu bạn tình cờ quên uống một liều hàng ngày, cứ uống liều kế tiếp như bình thường. Không được uống gấp đôi liều để bù cho liều đã quên.
Nếu bạn có thêm bất cứ thắc mắc nào về việc sử dụng thuốc này, hãy hỏi bác sĩ hay dược sĩ của bạn.
- Quá liều
Nếu bạn tình cờ uống quá nhiều viên thuốc, phải đi gặp bác sĩ ngay lập tức. Những kinh nghiệm ở người trưởng thành uống với liều 900mg mỗi ngày trong 8 tuần cho thấy không có một biểu hiện độc tính nào. Các biểu hiện quá liều được nghĩ do irbesartan là tụt huyết áp và nhanh nhịp tim; chậm nhịp tim cũng có thể gặp.
Không có thông tin cụ thể về điều trị quá liều Aprovel. Bệnh nhân nên được giám sát chặt chẽ, điều trị triệu chứng và nâng đỡ. Việc xử lý phụ thuộc vào thời gian kể từ lúc uống vào và độ nặng của các triệu chứng. Các biện pháp đề nghị trong xử trí quá liều bao gồm gây nôn và/hoặc rửa dạ dày, có thể sử dụng than hoạt.
Irbesartan không bị loại thải bởi thẩm tách máu.', 'Bảo quản thuốc ở nhiệt độ dưới 30°C.', '- Thận trọng khi sử dụng
Hãy báo cho bác sĩ nếu bạn gặp một trong các tình trạng sau:
Tiêu chảy hoặc ói mửa nhiều.
Bệnh lý thận.
Bệnh lý tim.
Nếu dùng Aprovel cho bệnh thận do đái tháo đường. Trong trường hợp này bác sĩ có thể cho xét nghiệm máu thường quy, đặc biệt là đo nồng độ kali trong máu trong trường hợp chức năng thận kém.
Nếu bạn sắp sửa được phẫu thuật hoặc được gây mê.
- Thai kỳ và cho con bú
Phụ nữ có thai
Cần báo cho bác sĩ biết nếu bạn có thai, hoặc có thể có thai. Thông thường bác sĩ sẽ khuyên bạn ngưng dùng Aprovel trước khi có thai hoặc ngay khi bạn biết mình có thai và sẽ khuyên bạn dùng thuốc khác thay thế cho Aprovel.
Aprovel không được khuyên dùng trong các tháng đầu của thai kỳ và không được dùng khi đã mang thai hơn 3 tháng, vì thuốc có thể là nguyên nhân gây nguy hiểm cho trẻ nếu người mẹ dùng thuốc này sau 3 tháng đầu của thai kỳ.
Phụ nữ đang thời kỳ nuôi con bằng sữa mẹ
Cần báo cho bác sĩ biết nếu bạn đang hoặc bắt đầu nuôi con bằng sữa mẹ. Không được dùng Aprovel cho phụ nữ đang nuôi con bằng sữa mẹ, và bác sĩ sẽ chọn hướng điều trị khác cho bạn, nhất là khi con bạn còn sơ sinh hoặc thiếu tháng.
- Khả năng lái xe và vận hành máy móc
Chưa có nghiên cứu nào về các tác động trên khả năng lái xe và vận hành máy móc được thực hiện. Aprovel không ảnh hưởng đến khả năng lái xe hoặc điều khiển máy móc.
Tuy nhiên, trong thời gian điều trị tăng huyết áp, choáng váng hoặc mệt mỏi đôi khi có thể xảy ra. Nếu có những triệu chứng này, bạn cần phải tham khảo ý kiến của bác sĩ trước khi lái xe hoặc vận hành máy móc.
- Tương tác thuốc
Sử dụng các thuốc khác:
Thông báo cho bác sĩ hoặc dược sĩ của bạn biết các thuốc bạn đang sử dụng hoặc vừa sử dụng, bao gồm cả các thuốc không cần kê toa.
Thường thì Aprovel không có tương tác với những thuốc loại khác.
Cần phải xét nghiệm máu nếu bạn sử dụng:
Những loại thuốc bổ sung kali.
Các chất muối thay thế có chứa kali.
Các loại thuốc giữ kali (như thuốc lợi tiểu).
Các loại thuốc có chứa lithium.
Tác dụng của Irbesartan có thể giảm khi bạn dùng các thuốc giảm đau như kháng viêm không steroid.
Dùng Aprovel chung với thức ăn và thức uống:
Aprovel có thể được uống cùng hoặc không cùng với thức ăn.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000137'), 'Viên nén', '2 vỉ x 7 viên', 'ATASART (Candesartan Cilexetil) được chỉ định để điều trị tăng huyết áp. Có thể sử dụng một mình hoặc kết hợp với các thuốc trị cao huyết áp khác.', 'Chống chỉ định Candesartan Cilexetil trên bệnh nhân quá mẫn với bất kỳ thành phần nào của thuốc.', 'Nhìn chung, việc điều trị bằng Candesartan Cilexetil được dung nạp tốt. Tuy nhiên, vẫn có một số các phản ứng phụ liên quan đến việc điều trị bằng Candesartan, đó là nhức đầu và chóng mặt nhẹ thoáng qua.
Những phản ứng phụ quan trọng đã được báo cáo với tỷ lệ là 0,5%, tuy nhiên chưa thể xác định là có liên quan đến việc điều trị bằng Candesartan Cilexetil hay không:
Toàn thân: suy nhược cơ thể, sốt.
Hệ thần kinh trung ương và ngoại biên: Dị cảm, chóng mặt.
Rối loạn hệ tiêu hóa: khó tiêu, viêm dạ dày ruột.
Rối loạn nhịp tim: nhịp tim nhanh, đánh trống ngực.
Rối loạn chuyển hóa và dinh dưỡng: tăng men creatine phosphokinase, tăng đường, tăng triglyceride máu, tăng ure máu.
Rối loạn hệ cơ xương: đau cơ.
Rối loạn đông máu/chảy máu/tiểu cầu: chảy máu cam
Rối loạn thần kinh: lo âu, suy nhược thần kinh, lo mo.
Rối loạn hệ hô hấp: khó thở.
Rối loạn da và phần mềm: phát ban, đổ mồ hôi nhiều.
Rối loạn hệ bài tiết: tiểu ra máu.
Các biểu hiện khác ít gặp hơn bao gồm: đau thắt ngực, nhồi máu cơ tim, phù mạch. Các biểu hiện đều giống nhau ở phụ nữ và nam giới, người trẻ vả người già, da đen hay da trắng.
Một số phản ứng phụ rất ít gặp:
Hệ tiêu hóa: viêm gan và rối loạn chức năng gan.
Hệ máu: giảm bạch cầu trung tính, giảm bạch cầu và tăng bạch cầu không hạt.
Rối loạn chuyển hóa và dinh dưỡng: tăng kali máu, giảm natri máu.
Rối loạn da và phần mềm: ngứa và nổi mề đay.
Thông báo cho bác sĩ những tác dụng phụ khi dùng thuốc.', 'ATASART (Candesartan Cilexetil) có thể dùng kèm hay không kèm với thức ăn. Liều dùng tuỳ thuộc vào từng bệnh nhân. Đáp ứng huyết áp phụ thuộc vào liều trong khoảng từ 2 đến 32mg Candesartan Cilexetil. Liều khởi đầu thông thường là 16mg Candesartan Cilexetil 1 lần/ngày khi dùng đơn trị ở bệnh nhân không bị giảm thể tích dịch.
ATASART có thể dùng 1 hoặc 2 lần/ngày với tổng liều hàng ngày trong khoảng 8mg đến 32mg. Liều cao hơn không cho hiệu quả cao hơn, và có ít kinh nghiệm đối với những liều như vậy. Hầu hết tác động chống tăng huyết áp xuất hiện trong vòng 2 tuần, và hiệu quả giảm huyết áp cao nhất đạt được trong vòng 4 đến 6 tuần sau khi điều trị bằng ATASART.
Nếu việc sử dụng riêng lẻ ATASART (Candesartan Cilexetil) không kiểm soát được huyết áp, có thể dùng thêm thuốc lợi tiểu. ATASART có thể được dùng phối hợp với các thuốc trị cao huyết áp khác.
Bệnh nhân suy gan: ở bệnh nhân suy gan trung bình, cần phải cân nhắc sử dụng ATASART (Candesartan Cilexetil) với liều khởi đầu thấp hơn. Không cần điều chỉnh liều ở bệnh nhân suy gan nhẹ.
Bệnh nhân giảm thể tích dịch: Đối với bệnh nhân có nguy cơ giảm thể tích nội mạch (như bệnh nhân đang điều trị bằng thuốc lợi tiểu, đặc biệt khi những bệnh nhân này bị suy thận), cần phải cân nhắc điều trị khởi đầu với ATASART ở liều thấp hơn.
Liều dùng có thể điều chỉnh theo tuổi và triệu chứng.
- Quá liều
Các biểu hiện của quá liều thường là: hạ huyết áp, chóng mặt và nhịp tim nhanh; có thể xảy ra tình trạng nhịp tim chậm khi kích thích đối giao cảm. Nếu có dấu hiệu hạ huyết áp, phải áp dụng ngay các liệu pháp điều trị hỗ trợ.
Không thể loại trừ Candesaratan bằng thẩm phân máu.', 'Bảo quản nơi mát, tránh ánh nắng, nhiệt độ', '- Thận trọng khi sử dụng
Huyết áp thấp ở bệnh nhân mất muối và giảm thể tích dịch
Những bệnh nhân có hệ men renin - angiotensin hoạt động, chẳng hạn như những bệnh nhân mất muối và thể tích dịch (ví dụ: bệnh nhân đã được điều trị bằng thuốc lợi tiểu) có thể xảy ra triệu chứng hạ huyết áp. Những triệu chứng này nên được giải quyết trước khi dùng ATASART (Candesartan cilexetil), hoặc điều trị dưới sự giám sát chặt chẽ. Nếu xảy ra hạ huyết áp, nên đặt bệnh nhân nằm ngửa và, nếu cần thiết, truyền tĩnh mạch nước muối sinh lý. Hạ huyết áp thoáng qua không phải là chống chỉ định trong việc điều trị sau này và việc điều trị không gặp khó khăn một khi huyết áp ổn định.
Suy chức năng thận
Vì tác động ức chế hệ thống men reninangiotensin - aldosterone của thuốc, cần lường trước những thay đổi trong chức năng thận trên những cá nhân nhạy cảm được điều trị với ATASART (Candesartan cilexetil). Cần thận trọng khi dùng thuốc này.
Trong những nghiên cứu chất ức chế men chuyển trên bệnh nhân hẹp động mạch thận một bên hay hai bên, đã có báo cáo về việc tăng Creatinine huyết tương hay BUN. ATASART chưa được sử dụng lâu ngày ở bệnh nhân hẹp động mạch thận một bên hay hai bên, tuy nhiên những triệu chứng tương tự có thể xảy ra.
- Thai kỳ và cho con bú
Khi sử dụng ở phụ nữ có thai ở ba tháng giữa và cuối thai ký, thuốc có thể tác động trực tiếp lên hệ renin-angiotensin do đó có thể gây ra tổn thương và có thể gây tử vong cho thai nhi. Do đó khi biết có thai, phải ngưng dùng thuốc càng sớm càng tốt
Chưa biết Candesartan Cilexetil có bài tiết qua sữa mẹ hay không. Tuy nhiên, nghiên cứu cho thấy Candesartan bài tiết qua sữa chuột. Vì các phản ứng phụ mạnh trên nhũ nhi, do đó không nên dùng ATASART (Candesartan Cilexetil) khi đang cho con bú.
- Tương tác thuốc
Do Candesartan Cilexetil bị chuyển hóa không đáng kể bởi hệ thống cytochrome P450 (CYP450) và ở nồng độ điều trị không có tác dụng lên men P450, do đó không xảy ra tương tác với các thuốc ức chế hoặc được chuyển hóa bởi các men này.
Không có tương tác thuốc nào đáng kể được báo cáo trong các nghiên cứu về thuốc dùng chung với các thuốc khác như glyburide, nifedipine, digoxin, warfarin, hydrochlorothiazide và thuốc tránh thai đường uống ở những người tình nguyện khỏe mạnh.
Vì cả thuốc ức chế ACE và thuốc chẹn thụ thể angiotensin, trong đó có Candesartan Cilexetil, có thể làm tăng nồng độ Kali trong máu. Do đó nên thận trọng khi dùng Candesartan Cilexetil với các thuốc khác có thể làm tăng nồng độ kali trong máu như spironolactone và các chất bổ sung Kali.
Sự gia tăng nồng độ lithium huyết tương trong suốt thời gian lithium chung với Candesartan Cilexetil. Vì vậy, cần thận trọng theo dõi nồng độ lithium huyết tương khi phải dùng đồng thời hai thuốc này.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000112'), 'Viên nén phóng thích kéo dài', '1 vỉ x 14 viên', 'Điều trị tăng huyết áp: làm giảm huyết áp và giảm nguy cơ tử vong do tim mạch và bệnh mạch vành (kể cả đột tử) và tỉ lệ tổn thương cơ quan.
Điều trị đau thắt ngực. Điều trị bổ sung cho liệu pháp điều trị suy tim cơ bản ở những bệnh nhân suy tim mạn tính có triệu chứng đã ổn định do suy chức năng tâm thu thất trái.
Phòng ngừa tử vong do tim và tái nhồi máu sau cơn nhồi máu cơ tim cấp. Điều trị loạn nhịp tim đặc biệt là nhịp nhanh trên thất, giảm nhịp thất trong rung nhĩ và trong ngoại tâm thu thất. Điều trị rối loạn chức năng tim có kèm đánh trống ngực. Phòng ngừa đau nửa đầu dạng migraine.', 'Blốc nhĩ thất độ 2 hoặc độ 3, suy tim mất bù không ổn định (phù phổi, giảm tưới máu hoặc hạ huyết áp), bệnh nhân điều trị liên tục hoặc ngắt quãng với thuốc tăng co bóp cơ tim loại chủ vận thụ thể bêta, chậm nhịp xoang trên lâm sàng, hội chứng suy nút xoang (trừ khi có đặt máy tạo nhịp tim dài hạn), sốc do tim, rối loạn tuần hoàn động mạch ngoại vi nặng. Không được dùng metoprolol cho các bệnh nhân bị nghi ngờ là có nhồi máu cơ tim cấp có nhịp tim 0,24 giây hoặc huyết áp tâm thu < 100 mmHg. Chống chỉ định cho những bệnh nhân nhạy cảm với bất kỳ thành phần nào của thuốc hoặc với các thuốc ức chế thụ thể bêta khác.', 'Betaloc ZOK dung nạp tốt và tác động ngoại ý thường nhẹ và có thể hồi phục. Các tác động ngoại ý sau đây được ghi nhận trong các thử nghiệm lâm sàng và trong việc sử dụng hằng ngày, hầu hết là trên Betaloc dạng bào chế thông thường (metoprolol tartrate). Trong nhiều trường hợp, liên quan giữa tác động ngoại ý và điều trị với Betaloc chưa được xác lập. Định nghĩa các tần số xuất hiện các tác động ngoại ý. Rất thường gặp (≥ 10%), thường gặp (1 - 9,9%), ít gặp (0,1 - 0,9%), hiếm gặp (0,01 - 0,09%) và rất hiếm gặp (Hệ tim mạch
Thường gặp: chậm nhịp tim, hạ huyết áp tư thế (rất hiếm: ngất), lạnh tay chân và đánh trống ngực. Ít gặp: các triệu chứng suy tim tăng thoáng qua, sốc tim ở những bệnh nhân bị nhồi máu cơ tim cấp, blốc nhĩ thất độ I, phù, đau vùng trước tim. Hiếm gặp: rối loạn dẫn truyền cơ tim, rối loạn nhịp tim. Rất hiếm gặp: hoại thư ở những bệnh nhân có rối loạn tuần hoàn ngoại biên nặng trước đó.
Hệ thần kinh trung ương
Rất thường gặp: mệt mỏi.
Thường gặp: choáng váng, nhức đầu.
Ít gặp: dị cảm, vọp bẻ.
Hệ tiêu hoá
Thường gặp: buồn nôn, đau bụng, tiêu chảy, táo bón. ít gặp: nôn.
Hiếm gặp: khô miệng.
Huyết học
Rất hiếm gặp: giảm tiểu cầu.
Gan
Hiếm gặp: bất thường về xét nghiệm chức năng gan.
Rất hiếm gặp: viêm gan.
Hệ cơ xương
Rất hiếm gặp: đau khớp.
Chuyển hoá
Ít gặp: tăng cân.
Tâm thần
Ít gặp: trầm cảm, mất tập trung, ngủ gà hoặc mất ngủ, ác mộng.
Hiếm gặp: bồn chồn, lo lắng, rối loạn chức năng sinh dục/ bất lực.
Rất hiếm gặp: mất trí nhớ/giảm trí nhớ, lú lẫn, ảo giác.
Hệ hô hấp
Thường gặp: khó thở khi gắng sức.
Ít gặp: co thắt phế quản.
Hiếm gặp: viêm mũi.
Giác quan
Hiếm gặp: rối loạn thị giác, khô và/hoặc kích ứng mắt, viêm kết mạc.
Rất hiếm gặp: ù tai, rối loạn vị giác. Da
Ít gặp: nổi ban (dạng mày đay, vẩy nến và sang thương loạn dưỡng da), tăng tiết mồ hôi.
Hiếm gặp: rụng tóc.
Rất hiếm gặp: nhạy cảm với ánh sáng, tăng bệnh vẩy nến.', 'Betaloc ZOK dùng điều trị với liều duy nhất trong ngày và tốt nhất là dùng vào buổi sáng. Viên nén Betaloc ZOK được nuốt với chất lỏng. Uống nguyên viên hoặc 1/2 viên đã chia vạch sẵn, không được nhai hoặc nghiền. Thức ăn không ảnh hưởng đến sinh khả dụng của thuốc.
Nên điều chỉnh liều để tránh tác dụng gây chậm nhịp tim.
Điều trị tăng huyết áp
Liều khuyến cáo cho bệnh nhân tăng huyết áp từ nhẹ đến vừa là Betaloc ZOK 50mg ngày một làn. Nếu bệnh nhân không đáp ứng với liều 50mg, có thể tăng lên đến 100 - 200mg ngày một lần và/hoặc kết hợp với các thuốc điều trị tăng huyết áp khác.
Điều trị đau thắt ngực
Liều khuyến cáo là 100 - 200mg Betaloc ZOK ngày một lần, nếu cần có thể dùng kết hợp với các thuốc trị đau thắt ngực khác.
Điều trị bổ sung cho liệu pháp điều trị suy tim cơ bản ở những bệnh nhân suy tim mạn tính có triệu chứng đã ổn định do suy chức năng tâm thu thất trái.
Bệnh nhân phải có tình trạng suy tim mạn tính ổn định, không có biểu hiện cấp trong 6 tuần gần nhất và đang dùng một liệu pháp điều trị cơ bản cần thiết không thay đổi trong 2 tuần gần nhất.
Điều trị suy tim bằng các thuốc ức chế bêta đôi khi có thể tăng tạm thời triệu chứng. Trong vài trường hợp có thể tiếp tục điều trị hoặc giảm liều, và trong các trường hợp khác cần phải ngưng điều trị. Liều khởi đầu cho những bệnh nhân suy tim nặng (độ IV theo NYHA) phải được chỉ định bởi các bác sĩ chuyên sâu điều trị suy tim (xem Lưu Ý Và Thận Trọng Khi Dùng).
Liều cho bệnh nhân suy tim ổn định, độ II: Liều khởi đầu khuyến cáo cho 2 tuần đầu là 25mg ngày một lần. Sau 2 tuần, liều có thể tăng lên 50mg ngày một lần và sau đó có thể gấp đôi liều mỗi 2 tuần. Liều đích cho điều trị dài hạn là 200mg ngày một lần.
Liều cho bệnh nhân suy tim ổn định, độ III - IV:
Liều khởi đầu khuyến cáo là 12,5mg (nửa viên 25mg) ngày một lần. Nên điều chỉnh liều theo từng bệnh nhân và theo dõi bệnh nhân chặt chẽ trong suốt thời gian tăng liều vì các triệu chứng suy tim có thể trở nên trầm trọng ở một số bệnh nhân. Sau 1 - 2 tuần liều có thể tăng lên 25mg ngày một lần. Hai tuần tiếp theo, liều có thể tăng đến 50mg ngày một lần. Ở những bệnh nhân dung nạp được liều cao hơn, có thể gấp đôi liều mỗi 2 tuần cho đến liều tối đa 200mg/ngày.
Trong trường hợp có hạ huyết áp và/hoặc chậm nhịp tim, cần phải giảm các thuốc dùng phối hợp hoặc giảm liều Betaloc ZOK. Hạ huyết áp khi bắt đầu điều trị không có nghĩa là Betaloc ZOK không thể dung nạp được trong điều trị suy tim mạn tính, nhưng không được tăng liều cho đến khi tình trạng bệnh nhân đã ổn định, và cần phải tăng cường việc kiểm soát chức năng thận.
Điều trị loạn nhịp tim
Liều khuyến cáo là 100 - 200mg Betaloc ZOK ngày một lần.
Điều trị dự phòng sau nhồi máu cơ tim
Điều trị dài ngày bằng metoprolol đường uống với liều 200mg ngày một lần đã cho thấy làm giảm được nguy cơ tử vong (kể cả đột tử) và giảm nguy cơ tái nhồi máu cơ tim (thường gặp ở bệnh nhân tiểu đường).
Điều trị rối loạn chức năng tim có kèm đánh trống ngực
Liều khuyến cáo: 100mg ngày một lần. Nếu cần, liều có thể tăng đến 200mg.
Dự phòng đau nửa đầu dạng migraine
Liều khuyến cáo là 100 - 200mg ngày một lần.
Suy chức năng thận
Không cần điều chỉnh liều cho bệnh nhân suy thận.
Suy chức năng gan
Thường không cần điều chỉnh liều cho các bệnh nhân xơ gan vì metoprolol gắn kết với protein thấp (5 - 10%). Khi có các dấu hiệu suy chức năng gan trầm trọng (ví dụ: bệnh nhân có shunt nối) nên xem xét việc giảm liều.
Người cao tuổi
Không cần điều chỉnh liều cho các bệnh nhân cao tuổi. Trẻ em kinh nghiệm dùng Betaloc ZOK cho trẻ em còn giới hạn.
- Quá liều
Độc tính
Trên người trưởng thành, dùng liều 7,5g sẽ gây ra nhiễm độc tử vong. Trên trẻ em 5 tuổi, liều 100mg không gây triệu chứng nhiễm độc sau khi rửa dạ dày. Liều 450mg ở trẻ 12 tuổi và 1,4g ở người trưởng thành gây ra nhiễm độc trung bình. Liều 2,5g gây ra nhiễm độc nghiêm trọng và liều 7,5g gây nhiễm độc rất nghiêm trọng ở người trưởng thành.
Triệu chứng
Triệu chứng trên tim mạch là quan trọng nhất, nhưng trong một vài trường hợp, đặc biệt là ở trẻ em và thanh thiếu niên, triệu chứng trên thần kinh và hô hấp có thể chiếm ưu thế. Nhịp tim chậm, blốc nhĩ thất độ I - III, kéo dài quãng thời gian QT (trong vài trường hợp ngoại lệ), vô tâm thu, giảm huyết áp, tưới máu ngoại biên kém, suy tim, sốc tim. Suy hô hấp, ngưng thở.
Triệu chứng khác: mệt mỏi, lú lẫn, hôn mê, run, chuột rút, đổ mồ hôi, dị cảm, co thắt phế quản, buồn nôn, ói mửa, có thể co thắt thực quản, hạ đường huyết (đặc biệt là ở trẻ em) hoặc tăng đường huyết, tăng kali máu. Ảnh hưởng trên thận. Hội chứng nhược cơ thoáng qua. Sử dụng đồng thời với rượu, thuốc điều trị tăng huyết áp, quinidin hoặc barbiturat có thể làm trầm trọng thêm tình trạng bệnh nhân. Biểu hiện sớm của quá liều xảy ra từ 20 phút đến 2 giờ sau khi dùng thuốc.
Điều trị
Cần thực hiện chăm sóc bệnh nhân ở các cơ sở y tế có đầy đủ các thiết bị hỗ trợ phù hợp, theo dõi và giám sát.
Nếu thích hợp, có thể rửa dạ dày và/hoặc dùng than hoạt tính.
Atropin, thuốc kích thích hệ thần kinh giao cảm hoặc máy tạo nhịp tim dùng điều trị triệu chứng nhịp tim chậm và rối loạn dẫn truyền.
Đặt nội khí quản và thở máy nên được thực hiện với chỉ định rất rộng. Máy tạo nhịp tim là liệu pháp tùy chọn. Nếu ngưng tuần hoàn do quá liều, có thể cứu chữa bằng các biện pháp hồi sức trong vài giờ.
Hạ huyết áp, suy tim cấp tính và sốc được điều trị bằng việc tăng thể tích dịch cơ thể thích hợp, tiêm glucagon (nếu cần thiết, truyền tĩnh mạch glucagon sau đó), tiêm tĩnh mạch các thuốc kích thích hệ thần kinh giao cảm như dobutamin, và bổ sung thuốc chủ vận thụ thể α1 khi xảy ra giãn mạch, có thể xem xét sử dụng dung dịch ion Ca2+ tiêm tĩnh mạch. Điều trị triệu chứng co thắt phế quản bằng thuốc làm giãn phế quản.', 'bảo quản ở nhiệt độ trên 30°C.', '- Thận trọng khi sử dụng
Các thuốc chẹn kênh canxi loại verapamil dùng đường tĩnh mạch không được dùng cho các bệnh nhân đang điều trị với thuốc ức chế thụ thể bêta.
Nói chung, khi điều trị bệnh nhân hen suyễn, nên dùng kèm với một chất chủ vận bêta-2 (viên nén và/hoặc đường hít). Liều của chất chủ vận bêta-2 có thể phải điều chỉnh (tăng lên) khi bắt đầu điều trị với Betaloc ZOK. Tuy nhiên, Betaloc dạng ZOK ít tác động lên các thụ thể bêta-2 hơn so với các dạng viên nén bào chế thông thường của thuốc ức chế chọn lọc bêta-1.
Trong khi điều trị với Betaloc ZOK, nguy cơ ảnh hưởng lên chuyển hóa đường hoặc làm che lấp các triệu chứng của hạ đường huyết ít hơn so với dạng viên nén bào chế thông thường của thuốc ức chế chọn lọc bêta-1 và ít hơn nhiều so với thuốc ức chế bêta không chọn lọc.
Cần duy trì điều trị bù trừ ở bệnh nhân suy tim bằng các điều trị cơ bản trước và trong khi điều trị với Betaloc ZOK.
Các trường hợp bệnh nhân có tiền sử rối loạn dẫn truyền nhĩ thất ở mức độ trung bình rất hiếm khi bị nặng hơn (blốc nhĩ-thất).
Nếu bệnh nhân có biểu hiện chậm nhịp tim nhiều hơn nữa, nên dùng Betaloc ZOK liều thấp hơn hoặc ngưng thuốc từ từ.
Betaloc ZOK có thể làm nặng thêm triệu chứng rối loạn tuần hoàn động mạch ngoại biên chủ yếu do ảnh hưởng của sự giảm huyết áp.
Khi dùng Betaloc ZOK ở bệnh nhân u tế bào ưa crôm, nên dùng thuốc ức chế alpha kèm theo.
Trước khi phẫu thuật, bệnh nhân nên báo cho bác sĩ gây mê biết đang sử dụng Betaloc ZOK. Không nên ngưng điều trị thuốc ức chế bêta ở các bệnh nhân sắp được phẫu thuật. Nên tránh điều trị khởi đầu ngay với metoprolol liều cao cho bệnh nhân sắp phẫu thuật ngoài tim (non-cardiac surgery) vì thuốc có liên quan đến chậm nhịp tim, hạ huyết áp và đột quỵ có thể dẫn đến tử vong ở bệnh nhân có các yếu tố nguy cơ tim mạch.
Các dữ liệu về an toàn/ hiệu quả từ các nghiên cứu lâm sàng có kiểm chứng về suy tim nặng có triệu chứng ổn định (độ IV theo NYHA) còn hạn chế. Việc điều trị suy tim ở những bệnh nhân này chỉ nên được bắt đầu bởi các bác sĩ chuyên sâu trong lĩnh vực này (xem Liều Lượng Và Cách Sử Dụng).
Bệnh nhân suy tim có triệu chứng có kèm nhồi máu cơ tim cấp và đau thắt ngực không ổn định bị loại ra khỏi nghiên cứu dùng chẹn bêta trong điều trị suy tim. Do vậy, tính an toàn/ hiệu quả đã không được ghi nhận ở những bệnh nhân này. Chống chỉ định trong điều tri suy tim mất bù, không ổn định (xem Chống Chỉ Định).
Nên tránh ngưng thuốc đột ngột. Việc ngưng đột ngột thuốc ức chế bêta là rất nguy hiểm, đặc biệt ở những bệnh nhân có nguy cơ cao và có thể làm nặng thêm tình trạng suy tim mạn tính cũng như tăng nguy cơ nhồi máu cơ tim và đột tử. Vì thế, nếu ngưng điều trị bằng Betaloc ZOK nên giảm liều từ từ với liều bằng phân nửa ở mỗi bước trong vòng ít nhất là 2 tuần, đến liều sau cùng là nửa viên 25mg. Liều này nên được dùng tối thiểu trong 4 ngày trước khi ngưng hẳn. Tốc độ giảm liều nên chậm hơn nếu có các triệu chứng tái hiện.
Ở bệnh nhân đang sử dụng thuốc ức chế bêta, sốc phản vệ, nếu xảy ra, có thể nặng hơn.
- Thai kỳ và cho con bú
Giống như hầu hết các thuốc, Betaloc ZOK không nên sử dụng trong thai kỳ và trong thời gian cho con bú trừ khi việc sử dụng là cần thiết. Giống như tất cả các thuốc điều trị tăng huyết áp, thuốc ức chế bêta có thể gây ra các tác dụng ngoại ý như chậm nhịp tim cho thai nhi, trẻ sơ sinh và trẻ bú mẹ.
Tuy nhiên lượng thuốc được hấp thu qua sữa mẹ dường như có tác dụng ức chế bêta không đáng kể ở trẻ nếu người mẹ dùng metoprolol ở giới hạn liều điều trị thông thường.
- Khả năng lái xe và vận hành máy móc
Bệnh nhân nên tự nhận biết phản ứng của họ đối với Betaloc ZOK trước khi lái xe hoặc sử dụng máy vì thuốc có thể gây choáng váng và mệt mỏi.
- Tương tác thuốc
Metoprolol là chất nền chuyển hóa của Cytochrome P450 isoenzyme CYP2D6. Những thuốc gây cảm ứng hoặc ức chế men này có thể ảnh hưởng đến nồng độ huyết tương của metoprolol. Nồng độ metoprolol trong huyết tương có thể tăng khi dùng đồng thời với các hoạt chất chuyển hóa qua CYP2D6, như thuốc chống loạn nhịp, thuốc kháng histamine, chất đối kháng thụ thể histamine 2, thuốc chống trầm cảm, thuốc chống loạn thần và chất ức chế COX-2. Nồng độ metoprolol trong huyết tương giảm bởi rifampicin và có thể tăng do rượu và hydralazine.
Cần theo dõi khi sử dụng đồng thời với các thuốc ức chế hạch giao cảm, các thuốc ức chế thụ thể bêta khác (ví dụ: thuốc nhỏ mắt) hoặc các thuốc ức chế men MAO.
Khi ngưng liệu pháp phối hợp với clonidine, nên ngưng thuốc ức chế bêta vài ngày trước khi ngưng clonidine.
Nên theo dõi tác dụng ức chế co bóp tim và làm chậm nhịp tim khi dùng kết hợp metoprolol với các thuốc chẹn kênh canxi thuộc nhóm verapamil và diltiazem và/hoặc thuốc chống loạn nhịp. Khi bệnh nhân đang dùng thuốc ức chế thụ thể bêta thì không nên tiêm tĩnh mạch thuốc chẹn kênh canxi thuộc nhóm verapamil.
Thuốc ức chế beta có thể làm tăng tác dụng ức chế co bóp cơ tim và chậm dẫn truyền của thuốc chống loạn nhịp (nhóm quinidine và amiodarone).
Điều trị phối hợp thuốc ức chế bêta với các Digitalis glycoside có thể làm tăng thời gian dẫn truyền nhĩ thất và gây chậm nhịp tim.
Ở bệnh nhân điều trị với thuốc ức chế bêta, thuốc mê đường thở làm tăng tác dụng ức chế tim.
Điều trị phối hợp với indomethacin hoặc các thuốc ức chế men tổng hợp prostaglandin có thể làm giảm hiệu quả hạ áp của thuốc ức chế bêta.
Trong một số trường hợp khi dùng adrenaline cho các bệnh nhân được điều trị bằng thuốc ức chế bêta thì những thuốc ức chế bêta chọn lọc trên tim ít ảnh hưởng lên việc kiểm soát huyết áp hơn so với các thuốc ức chế bêta không chọn lọc.
Có thể phải chỉnh liều của thuốc điều trị tiểu đường dạng uống ở những bệnh nhân dùng thuốc ức chế bêta.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000145'), 'Viên nén bao phim', '3 vỉ x 10 viên', 'Tăng huyết áp từ nhẹ đến vừa. Có thể dùng đơn trị liệu hoặc phối hợp với các thuốc chống tăng huyết áp khác, đặc biệt là thuốc lợi tiểu.
Cơn đau thắt ngực.
Hỗ trợ trong điều trị bệnh suy tim mãn tính ổn định.', 'Quá mẫn với Bisoprolol hoặc các thuốc chẹn beta hoặc một trong các thành phần khác của thuốc.
Sốc do tim, suy tim mất bù.
Rối loạn dẫn truyền nhĩ thất (blốc nhĩ thất độ 2 và 3).
Hội chứng rối loạn nút xoang, blốc xoang nhĩ.
Nhịp tim chậm dưới 50 nhịp/phút trước khi bắt đầu điều trị.
Huyết áp thấp (huyết áp tâm thu dưới 90mmHg).
Nhiễm acid chuyển hoá.
Hen phế quản, viêm phế quản, bệnh đường hô hấp mãn tính.
Dùng đồng thời với các thuốc ức chế MAO.
Rối loạn tuần hoàn ngoại biên giai đoạn tiến triển.
Hội chứng Raynaud.', 'Thường gặp: Mệt mỏi, chóng mặt, hoa mắt, nhức đầu, đổ mồ hôi, rối loạn giấc ngủ, có những giấc mơ mạnh, Io lắng, mất tập trung và trầm cảm. Các triệu chứng này thường ít nghiêm trọng và thường biến mất trong vòng từ 1 đến 2 tuần sau khi bắt đầu điều trị.
Thỉnh thoảng: Rối loạn tiêu hoá (tiêu chảy, táo bón, buồn nôn, nôn mửa, đau bụng, dạ dày, đau vùng thượng vị, loét dạ dày...), hạ huyết áp, mạch chậm, hoặc rối loạn dẫn truyền nhĩ thất, tình trạng tê rần và cảm giác lạnh ở đầu chi.
Hiếm gặp: phản ứng ngoài da (như ban đỏ, sưng tấy, ngứa, rụng tóc...), nhược cơ, vọp bẻ và giảm tiết nước mắt (nếu có mang kính sát tròng), tăng đề kháng đường hô hấp (khó thở trên bệnh nhân có khuynh hướng bị phản ứng co thắt phế quản).
Trên bệnh nhân có dáng đi khập khiễng và hiện tượng Raynaud, lúc bắt đầu điều trị các triệu chứng này có thể trở nên nghiêm trọng hơn và suy cơ tim có thể nặng hơn.
Trên bệnh nhân lớn tuổi bị tiểu đường, những dấu hiệu hạ đường huyết như tim đập nhanh có thể bị che lấp.
- Các bất thường xét nghiệm
Thường có sự tăng triglycerid huyết thanh nhưng không chắc do thuốc gây ra.
Có sự tăng nhẹ acid uric, creatinin, BUN, kail huyết thanh, glucose và phospho, sự giảm nhẹ tế bào bạch cầu và tiểu cầu. Những sự thay đổi này không có ý nghĩa lâm sàng quan trọng và hiếm khi phải ngưng dùng Bisoprolol fumarat.', 'Mức liều nên được xác định tùy theo từng cá thể phù hợp với nhịp tim và kết quả điều trị.
- Trong điều trị tăng huyết áp và đau thắt ngực:
Liều thông thường: uống liều duy nhất từ 5 - 10 mg/ngày.
Liều tối đa: 20 mg/ngày.
Không cần thiết phải điều chỉnh liều ở bệnh nhân rối loạn chức năng gan và thận từ nhẹ đến vừa. Liều khởi đầu có thể là 2,5 mg/ngày và lưu ý điều chỉnh liều cho phù hợp. Liều của Bisoprolol fumarat không được vượt quá 10 mg/ngày đối với bệnh nhân suy thận nặng (độ thanh thải creatinin dưới 20 ml/min) hoặc rối loạn chức năng gan nghiêm trọng.
- Trong điều trị suy tim:
Liều khởi đầu: uống liều duy nhất 1,25 mg/ngày.
Nếu dung nạp thuốc, có thể tăng liều lên gấp đôi sau 1 tuần, và tăng liều dần dần trong khoảng từ 1 - 4 tuần đến liều tối đa mà bệnh nhân có thể dung nạp được nhưng không nên vượt quá 10 mg/ngày.
Không cần thiết điều chỉnh liều ở bệnh nhân lớn tuổi trừ trường hợp bị rối loạn chức năng gan và thận đáng kể.
Uống thuốc với nhiều nước, nên dùng thuốc vào buổi sáng khi đói hoặc lúc điểm tâm.
- Quá liều
Thường gặp nhất là chậm nhịp và hạ huyết áp. Phải ngưng sử dụng Bisoprolol ngay và điều trị bằng cách tiêm tĩnh mạch atropin (1 - 2mg), nếu cần có thể theo sau bởi một liều truyền tĩnh mạch 25mcg isoprenalin, glucagon cũng có thể được dùng với liều từ 1 - 5mg.
Có thể xảy ra co thắt phế quản và suy tim. Điều trị co thắt phế quản bằng cách tiêm tĩnh mạch aminophylline và điều trị suy tim bằng thuốc trợ tim mạch (digitalis) và thuốc lợi tiểu.', 'nhiệt độ dưới 30', '- Thận trọng khi sử dụng
Suy tim: Không sử dụng các thuốc chẹn beta cho bệnh nhân có triệu chứng của bệnh suy tim sung huyết. Tuy nhiên, ở một số bệnh nhân suy tim phải bù, nếu cần thiết sử dụng thuốc thì phải thật thận trọng.
Ngưng điều trị đột ngột: Ngưng điều trị đột ngột các thuốc chẹn beta có thể làm trầm trọng thêm cơn đau thắt ngực, nhồi máu cơ tim hoặc loạn nhịp tâm thất ở những bệnh nhân mắc bệnh động mạch vành. Nên thận trọng khi ngưng điều trị nếu không có hướng dẫn của bác sĩ.
Bệnh co thắt phế quản: Vì tính chọn lọc beta tương đối nên có thể dùng Bisoprolol với mức thận trọng cần thiết ở người bệnh co thắt phế quản không đáp ứng hoặc không dung nạp liệu pháp chống tăng huyết áp khác. Chính vì tính chọn lọc beta không tuyệt đối nên có thể dùng Bisoprolol ở liều thấp nhất có thể được với liều khởi đầu là 2,5 mg/ngày. Cũng có thể dùng đồng thời với một thuốc kích thích β2 (chất gây giãn phế quản).
Giải phẫu và gây mê: Nên ngưng sử dụng Bisoprolol ít nhất 48 giờ trước khi bệnh nhân được phẫu thuật. Nếu phải sử dụng thuốc trong suốt quá trình phẫu thuật, nên thận trọng đối với các tác nhân gây mê như ether, cyclopropan và tricloroethylen. Nếu quá liều, xử lý với atropin 1 - 2 mg I.V.
Tiểu đường và hạ glucose máu: Bisoprolol che giấu biểu hiện hạ đường huyết (đặc biệt là nhịp tim nhanh). Tuy nhiên, ở bệnh nhân tiểu đường được chỉ định insulin hoặc các thuốc hạ đường huyết dạng uống, nên sử dụng Bisoprolol một cách thận trọng.
Nhiễm độc tuyến giáp: Bisoprolol có thể che giấu các dấu hiệu lâm sàng cường tuyến giáp (như nhịp tim nhanh). Sự ngừng đột ngột thuốc chẹn beta có thể thúc đẩy cơn nhiễm độc tuyến giáp.
- Thai kỳ và cho con bú
Không nên sử dụng thuốc cho phụ nữ đang có thai hoặc cho con bú.
Do có khả năng gây nhịp tim chậm, hạ huyết áp và hạ đường huyết trên trẻ sơ sinh, trước thời hạn sinh là 72 giờ, phải được chấm dứt điều trị với Bisoprolol. Nếu việc điều trị không thể chấm dứt được, trẻ sơ sinh phải được theo dõi trong vòng 48 - 72 giờ sau khi sinh.
- Khả năng lái xe và vận hành máy móc
Do thuốc có tác dụng hạ huyết áp nên tùy theo cá thể có thể ảnh hưởng đến khả năng lái xe và vận hành máy móc. Đặc biệt là tình trạng này thường xảy ra vào lúc đầu điều trị và khi có thay đổi sự dùng thuốc cũng như khi có sự tương tác với rượu.
- Tương tác thuốc
Không nên phối hợp với các thuốc chẹn beta khác.
Điều trị đồng thời Bisoprolol với các thuốc làm cạn kiệt catecholamin (reserpin, alpha-methyldopa, clonidin và guanethidin) có thể làm giảm đáng kể nhịp tim. Ở bệnh nhân được điều trị đồng thời với clonidin, nếu muốn ngừng thuốc, khuyến cáo nên ngưng sử dụng Bisoprolol trong vài ngày trước khi ngưng clonidine.
Sử dụng đồng thời Bisoprolol với thuốc làm giãn cơ tim hay ức chế dẫn truyền nhĩ thất như một số thuốc đối vận calci (đặc biệt là nhóm phenylalkylamin [verapamil] và nhóm benzothiazepin [diltiazem]), hoặc tác nhân chống loạn nhịp (disopyramide) có thể xảy ra hạ huyết áp, nhịp chậm, loạn nhịp tim hoặc suy tim.
Khi dùng đồng thời với reserpin, alpha-methyldopa, guanfacine, Clonidin hoặc các glycosid có thể làm giảm đáng kể nhịp tim.
Rifampicin làm tăng chuyển hóa thải trừ Bisoprolol fumarat do đó rút ngắn thời gian bán thải của thuốc. Tuy nhiên, việc điều chỉnh liều của Bisoprolol là không cần thiết.
Sử dụng Bisoprolol cùng lúc với insulin và thuốc làm giảm đường huyết đường uống, có thể làm tăng khả năng tác dụng của chúng. Các triệu chứng hạ đường huyết (đặc biệt là nhịp tim nhanh) bị che lấp đi hoặc bị giảm nhẹ. Hàm lượng đường huyết phải được kiểm tra theo dõi một cách đều đặn.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000148'), 'Viên nén bao phim', '2 vỉ x 14 viên', 'CoAprovel là một phối hợp của 2 hoạt chất, irbesartan và hydrochlorothiazid.
Irbesartan thuộc nhóm thuốc đối kháng thụ thể angiotensin-II. Angiotensin-II là một chất do cơ thể sinh ra, khi gắn lên thụ thể của nó ở mạch máu làm co mạch máu. Kết quả là làm tăng huyết áp. Irbesartan chống lại việc gắn của angiotensin-ll lên thụ thể này do đó làm mạch máu giãn ra và làm hạ huyết áp.
Hydrochlorothiazid là một thuốc trong nhóm thuốc lợi tiểu thiazide có tác dụng làm tăng lượng nước tiểu và do đó làm giảm huyết áp.
Hai hoạt chất trong CoAprovel cùng làm hạ huyết áp tốt hơn là khi dùng riêng lẻ từng thành phần.
CoAprovel được chỉ định dùng cho những bệnh nhân tăng huyết áp (tăng huyết áp nguyên phát), khi điều trị riêng lẻ với irbesartan hoặc hydrochlorothiazid mà vẫn không kiểm soát được huyết áp một cách thỏa đáng.', 'Không được dùng CoAprovel
- Nếu bạn bị dị ứng với irbesartan hoặc bất kỳ thành phần nào chứa trong CoAprovel.
- Nếu bạn bị dị ứng với hydrochlorothiazid hoặc bất kỳ thuốc có dẫn xuất sulfonamid.
- Nếu bạn đang có thai hơn 3 tháng (tốt nhất là nên tránh dùng CoAprovel từ lúc bắt đầu có thai - xem mục Phụ nữ có thai).
- Nếu bạn đang bị bệnh gan hay thận nặng.
- Nếu cơ thể bạn gặp các cản trở tạo ra nước tiểu.
- Nếu bạn có bệnh lý làm tăng lượng calci hay giảm lượng kali kéo dài trong máu. Không nên dùng CoAprovel cho trẻ em (dưới 18 tuổi).', 'Giống tất cả các thuốc, CoAprovel có thể gây ra những tác dụng không mong muốn. Một vài tác dụng phụ có thể trầm trọng và đòi hỏi phải được theo dõi y khoa.
Hiếm gặp các phản ứng dị ứng da (phát ban, nổi mề đay), cũng như sưng phồng khu trú ở mặt, môi và/hoặc lưỡi ở các bệnh nhân uống irbesartan.
Nếu bạn có những triệu chứng như trên hoặc khó thở nên ngưng dùng CoAprovel và đi gặp bác sĩ của bạn ngay lập tức.
Trong các nghiên cứu lâm sàng đối với bệnh nhân dùng CoAprovel, các tác dụng phụ sau đây đã được báo cáo:
Thường gặp (1-10 trên 100 bệnh nhân):
Buồn nôn/nôn.
Tiểu bất thường.
Mệt mỏi.
Choáng váng (bao gồm khi đứng lên từ tư thế nằm hoặc ngồi).
Các xét nghiệm máu cho thấy tăng nồng độ men đo lường chức năng của cơ và của tim (creatin kinase) hoặc tăng nồng độ của các chất đo lường chức năng thận (urê máu, creatinin).
Nếu bạn gặp bất kỳ tác dụng phụ nào kể trên, hãy báo ngay cho bác sĩ.
Ít gặp (1-10 trên 1000 bệnh nhân):
Tiêu chảy.
Huyết áp thấp.
Ngất.
Tăng nhịp tim.
Phừng đỏ mặt.
Sưng phồng.
Rối loạn chức năng tình dục và cương dương.
Xét nghiệm máu cho thấy nồng độ kali và natri trong máu thấp.
Nếu bạn gặp bất kỳ tác dụng phụ nào kể trên, hãy báo ngay cho bác sĩ.
Một số tác dụng phụ ngoại ý được báo cáo kể từ khi CoAprovel lưu hành trên thị trường nhưng không rõ tần số như: đau đầu, kêu vo vo ở tai, ho, rối loạn vị giác, khó tiêu, đau nhức khớp và cơ, rối loạn chức năng gan và giảm chức năng thận, tăng kali máu, và các phản ứng dị ứng như phát ban, nổi mề đay, sưng phồng mặt, môi, miệng, lưỡi hoặc họng. Hiếm gặp các trường hợp vàng da (vàng da và/hoặc vàng tròng trắng của mắt).
Giống như bất cứ phối hợp hai hoạt chất thuốc, không thể loại trừ các tác dụng phụ đi kèm với từng hoạt chất.
Tác dụng không mong muốn khi dùng irbesartan đơn thuần
Ở những bệnh nhân uống irbesartan đơn thuần, ngoài các tác dụng phụ kể trên, còn có thể gặp đau ngực.
Tác dụng không mong muốn khi dùng hydrochlorothiazid đơn thuần
Ăn mất ngon; kích thích dạ dày; co thắt dạ dày; táo bón; vàng da có/hoặc không có vàng mắt; viêm tụy có đặc điểm là đau nhiều ở vùng thượng vị, thường có buồn nôn và nôn; rối loạn giấc ngủ; trầm cảm; mờ mắt; giảm bạch cầu có thể dẫn đến hay bị nhiễm trùng; sốt; giảm tiểu cầu (một loại tế bào máu có vai trò quan trọng trong đông máu); giảm hồng cầu (thiếu máu) biểu hiện như mệt mỏi, đau đầu, khó thở khi gắng sức, chóng mặt, và niêm mạc tái; bệnh thận; các rắc rối về phổi bao gồm viêm phổi hoặc tăng tiết dịch trong phổi; da tăng cảm với ánh sáng mặt trời; viêm các mạch máu; bệnh ở da biểu hiện tróc da toàn thân, luput ban đỏ biểu hiện phát ban trên mặt, cổ và da đầu; các phản ứng dị ứng; yếu cơ và co thắt cơ; thay đổi nhịp tim; tụt huyết áp tư thế; sưng phồng tuyến nước bọt; tăng đường huyết; có đường trong nước tiểu; tăng vài loại mỡ trong máu; tăng nồng độ acid uric trong máu có thể dẫn đến bệnh gout.
Các tác dụng phụ đi kèm với hydrochlorothiazid có thể tăng với liều dùng cao hơn.
Nếu bạn gặp bất kỳ tác dụng phụ nào trở nên trầm trọng hoặc chưa được liệt kê trong tờ hướng dẫn sử dụng thuốc này, hãy thông báo cho bác sĩ hoặc dược sĩ của bạn.', 'Luôn luôn tuân theo chỉ dẫn của bác sĩ dành cho bạn. Bạn phải hỏi lại bác sĩ hoặc dược sĩ nếu bạn không chắc chắn.
Liều lượng
Liều thông thường của CoAprovel là 1 viên một ngày. Thông thường CoAprovel được bác sĩ kê toa cho bạn khi các điều trị tăng huyết áp trước đó không đủ để hạ huyết áp của bạn. Bác sĩ sẽ hướng dẫn bạn cách chuyển từ điều trị trước đó sang điều trị với CoAprovel.
Cách dùng
Dùng bằng đường uống. Viên thuốc nên được nuốt với một lượng chất lỏng thích hợp (như một ly nước). CoAprovel có thể được uống trong hoặc ngoài bữa ăn. Bạn nên uống liều thuốc hàng ngày vào cùng một thời điểm trong ngày. Điều quan trọng là bạn phải sử dụng CoAprovel liên tục cho đến khi bác sĩ quyết định dùng phương cách khác.
Hiệu quả hạ áp tối đa đạt được trong vòng 6-8 tuần sau khi bắt đầu điều trị.
Trẻ em không nên dùng CoAprovel
Trẻ em dưới 18 tuổi không được uống CoAprovel. Nếu một trẻ em nuốt vài viên thuốc, phải đi gặp bác sĩ ngay lập tức.
Nếu bạn quên uống CoAprovel
Nếu bạn tình cờ quên uống một liều hàng ngày, cứ uống liều kế tiếp như bình thường. Không được uống gấp đôi liều để bù cho liều đã quên.
Nếu bạn có thêm bất cứ thắc mắc nào về việc sử dụng thuốc này, hãy hỏi bác sĩ hay dược sĩ của bạn.
- Quá liều
Nếu nhỡ uống quá nhiều viên thuốc, phải đến gặp bác sĩ ngay lập tức. Biểu hiện quá liều của irbesartan thường gặp là tụt huyết áp và thay đổi nhịp tim. Quá liều do hydrochlorothiazid thường đi kèm với sụt giảm các chất điện giải trong huyết thanh và mất nước do lợi tiểu quá mức. Các triệu chứng hay gặp là buồn nôn và buồn ngủ lơ mơ.
Bệnh nhân cần được giám sát chặt chẽ, điều trị triệu chứng và nâng đỡ. Việc xử lý phụ thuộc vào thời gian kể từ lúc uống vào và độ nặng của các triệu chứng. Các biện pháp đề nghị trong xử trí quá liều bao gồm gây nôn và/hoặc rửa dạ dày, có thể sử dụng than hoạt. Phải theo dõi thường xuyên các chất điện giải và creatinin huyết thanh. Nếu tụt huyết áp xảy ra, bệnh nhân nên được đặt ở tư thế nằm ngửa, nhanh chóng bù nước và điện giải.', 'Bảo quản thuốc ở nhiệt độ dưới 30°C.', '- Thận trọng khi sử dụng
Hãy báo cho bác sĩ nếu bạn gặp một trong các tình trạng sau:
Tiêu chảy hay ói mửa nhiều.
Vấn đề về thận, hoặc đang ghép thận.
Vấn đề về tim.
Vấn đề về gan.
Đái tháo đường.
Luput ban đỏ (còn được gọi là bệnh luput ban đỏ rải rác).
Tăng aldosteron nguyên phát (bệnh có liên quan đến sản xuất ra nhiều hormon aldosteron, là nguyên nhân lưu giữ natri và kế đến làm tăng huyết áp).
Bạn cũng cần phải báo cho bác sĩ nếu:
Bạn đang theo chế độ ăn kiêng ít muối.
Bạn có những dấu hiệu như khát nước bất thường, khô miệng, mệt nhọc, buồn ngủ, co thắt cơ gây đau, buồn nôn, nôn hay nhịp tim nhanh bất thường có thể chỉ điểm cho một tác động quá mức của hydrochlorothiazid (chứa trong viên CoAprovel).
Bạn đã từng bị tăng nhạy cảm da với ánh sáng mặt trời với các triệu chứng bỏng nắng (như đỏ bừng, ngứa, sưng phồng, rộp da) xuất hiện nhanh hơn bình thường.
Bạn sắp phải phẫu thuật hoặc phải gây mê.
Hydrochlorothiazid chứa trong viên thuốc này có thể cho kết quả dương tính khi xét nghiệm chống doping.
- Thai kỳ và cho con bú
Phụ nữ có thai:
Cần báo cho bác sĩ biết nếu bạn có thai, hoặc có thể có thai. Thông thường bác sĩ sẽ khuyên bạn ngưng dùng CoAprovel trước khi có thai hoặc ngay khi bạn biết mình có thai và sẽ khuyên bạn dùng thuốc khác thay thế cho CoAprovel,
CoAprovel không được khuyên dùng trong các tháng đầu của thai kỳ và không được dùng khi đã mang thai hơn 3 tháng, vì thuốc có thể là nguyên nhân gây nguy hiểm cho trẻ nếu người mẹ dùng thuốc này sau 3 tháng đầu của thai kỳ.
Phụ nữ đang thời kỳ nuôi con bằng sữa mẹ:
Cần báo cho bác sĩ biết nếu bạn đang hoặc bắt đầu nuôi con bằng sữa mẹ.
Không được dùng CoAprovel cho phụ nữ đang nuôi con bằng sữa mẹ, và bác sĩ sẽ chọn hướng điều trị khác cho bạn, nhất là khi con bạn còn sơ sinh hoặc thiếu tháng.
- Khả năng lái xe và vận hành máy móc
Chưa thực hiện nghiên cứu nào về tác động của CoAprovel đối với khả năng lái xe và vận hành máy móc. CoAprovel không chắc có gây ảnh hưởng đến khả năng lái xe hoặc điều khiển máy móc. Tuy nhiên, trong thời gian điều trị tăng huyết áp, choáng váng hoặc mệt mỏi đôi khi có thể xảy ra. Nếu có những triệu chứng này, bạn cần phải tham khảo ý kiến của bác sĩ trước khi lái xe hoặc vận hành máy móc.
- Tương tác thuốc
Các thuốc tri tăng huyết áp khác: hiệu quả trị tăng huyết áp của CoAprovel có thể tăng thêm khi dùng đồng thời với các thuốc trị tăng huyết áp khác
Lithium: khuyến cáo không nên phối hợp lithium và CoAprovel. Nếu sự phối hợp được chứng tỏ là cần thiết thì khuyến cáo phải theo dõi cẩn thận nồng độ lithium huyết thanh.
Các thuốc ảnh hưởng đến kali: tác động mất kali của hydrochlorothiazid được làm yếu đi do tác động giữ kali của irbesartan. Sử dụng đồng thời với các thuốc lợi tiểu giữ kali, bổ sung kali, các muối thay thế có chứa kali hoặc các thuốc khác có thể tăng mức độ kali huyết thanh (như natri heparin) có thể dẫn đến tăng kali huyết thanh. Khuyến cáo theo dõi thỏa đáng nồng độ kali huyết thanh ở những bệnh nhân nguy cơ.
Các thuốc bị ảnh hưởng bởi sự rối loạn kali huyết thanh (như các glycoside digitalis, các thuốc chống loạn nhịp): cần theo dõi định kỳ kali huyết
Các thuốc kháng viêm không steroid: tác dụng trị tăng huyết áp của CoAprovel có thể bị giảm đi.
Các thông tin bổ sung về tương tác của hydrochlorothiazid:
Rượu: có khả năng xảy ra tụt huyết áp tư thế;
Các thuốc trị đái tháo đường (các thuốc uống và insulin): có thể phải điều chỉnh liều của các thuốc trị đái tháo đường.
Các nhựa trao đổi ion colestyramine và colestipol: sự hấp thu hydrochlorothiazid kém đi.
Các corticosteroid, ACTH: gia tăng mất các chất điện giải, nhất là hạ kali huyết;
Các glycoside digitalis: thiazide gây ra hạ kali huyết hoặc hạ magnesi huyết làm dễ khởi phát rối loạn nhịp tim gây ra do digitalis.
Các thuốc chống viêm không steroid: có thể làm giảm tác động lợi tiểu, giảm bài tiết sodium niệu và giảm tác động hạ huyết áp của thuốc lợi tiểu thiazide ở một số bệnh nhân.
Các amin tăng huyết áp (như noradrenaline): tác động của các amin tăng huyết áp có thể bị giảm đi, nhưng không đủ để ngăn cản việc sử dụng chúng.
Các thuốc giãn cơ vân không khử cực (như tubocurarine): hydrochlorothiazid làm tăng tác động giãn cơ vân không khử cực.
Thuốc trị bệnh gout: hydrochlorothiazid có thể làm tăng acid uric huyết thanh, tăng tỷ lệ phản ứng quá mẫn với allopurinol.
Các muối canxi: thuốc lợi tiểu thiazide có thể làm tăng nồng độ canxi huyết thanh do làm giảm bài tiết canxi.
Cần phải xét nghiệm máu nếu bạn sử dụng:
Những loại thuốc bổ sung kali.
Các chất muối thay thế có chứa kali.
Các loại thuốc giữ kali hoặc các thuốc lợi tiểu khác.
Thuốc nhuận trường
Thuốc điều trị bệnh gout
Thuốc bổ sung vitamin D
Thuốc kiểm soát nhịp tim
Các thuốc trị đái tháo đường (dạng uống hoặc insulin), carbamazepine (một loại thuốc điều trị động kinh).
Cần thông báo cho bác sĩ nếu bạn đang sử dụng hoặc vừa sử dụng thuốc hạ huyết áp khác, các steroid, thuốc điều trị ung thư, thuốc giảm đau, hoặc thuốc trị viêm khớp, hoặc các nhựa trao đổi ion colestyramine và colestipol làm hạ cholesterol trong máu, bao gồm cả các thuốc không cần kê toa.
Dùng CoAprovel chung với thức ăn và thức uống:
CoAprovel có thể được uống cùng hoặc không cùng với thức ăn.
Do hydrochlorothiazid chứa trong CoAprovel, nếu bạn uống rượu trong khi đang điều trị thuốc này, có thể bạn có cảm giác choáng váng ở tư thế đứng, nhất là khi đứng lên từ tư thế ngồi.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000099'), 'Viên nén bao phim', '2 vỉ x 14 viên', 'CoAprovel là một phối hợp của 2 hoạt chất, irbesartan và hydrochlorothiazid. Irbesartan thuộc nhóm thuốc đối kháng thụ thể angiotensin-II. Angiotensin-II là một chất do cơ thể sinh ra, khi gắn lên thụ thể của nó ở mạch máu làm co mạch máu. Kết quả là làm tăng huyết áp. Irbesartan ngăn chặn việc gắn của angiotensin-II lên thụ thể này do đó làm mạch máu giãn ra và làm hạ huyết áp. Hydrochlorothiazid là một thuốc trong nhóm thuốc lợi tiểu thiazide có tác dụng làm tăng lượng nước tiểu và do đó làm giảm huyết áp.
Hai hoạt chất trong CoAprovel cùng làm hạ huyết áp tốt hơn là khi dùng riêng lẻ từng thành phần.
CoAprovel được chỉ định dùng cho những bệnh nhân tăng huyết áp (tăng huyết áp nguyên phát), khi điều trị riêng lẻ với irbesartan hoặc hydrochlorothiazid mà vẫn không kiểm soát được huyết áp một cách thỏa đáng.', 'Không được dùng CoAprovel
- Nếu bạn bị dị ứng với irbesartan hoặc bất kỳ thành phần nào chứa trong CoAprovel.
- Nếu bạn bị dị ứng với hydrochlorothiazid hoặc bất kỳ thuốc có dẫn xuất sulfonamid.
- Nếu bạn đang có thai hơn 3 tháng (tốt nhất là nên tránh dùng CoAprovel từ lúc bắt đầu có thai - xem mục Phụ nữ có thai).
- Nếu bạn đang bị bệnh gan hay thận nặng.
- Nếu cơ thể bạn gặp các cản trở tạo ra nước tiểu.
- Nếu bạn có bệnh lý làm tăng lượng calci hay giảm lượng kali kéo dài trong máu. Không nên dùng CoAprovel cho trẻ em (dưới 18 tuổi)', 'Giống tất cả các thuốc, CoAprovel có thể gây ra những tác dụng không mong muổn. Một vài tác dụng phụ có thể trầm trọng và đòi hỏi phải được theo dõi y khoa.
Hiếm gặp các phản ứng dị ứng da (phát ban, nổi mề đay), cũng như sưng phồng khu trú ở mặt, môi và/hoặc lưỡi ở các bệnh nhân uống irbesartan.
Nếu bạn có những triệu chứng như trên hoặc khó thở nên ngưng dùng CoAprovel và đi gặp bác sĩ của bạn ngay lập tức.
Trong các nghiên cứu lâm sàng đối với bệnh nhân dùng CoAprovel, các tác dụng phụ sau đây đã được báo cáo:
Thường gặp (1 - 10 trên 100 bệnh nhân):
Buồn nôn/nôn.
Tiểu bất thường.
Mệt mỏi.
Choáng váng (bao gồm khi đứng lên từ tư thế nằm hoặc ngồi).
Các xét nghiệm máu cho thấy tăng nồng độ men đo lường chức năng của cơ và của tim (creatin kinase) hoặc tăng nồng độ của các chất đo lường chức năng thận (urê máu, creatinin).
Nếu bạn gặp bất kỳ tác dụng phụ nào kể trên, hãy báo ngay cho bác sĩ.
Ít gặp (1 - 10 trên 1000 bệnh nhân):
Tiêu chảy.
Huyết áp thấp.
Ngất.
Tăng nhịp tim.
Phừng đỏ mặt.
Sưng phồng.
Rối loạn chức năng tình dục và cương dương.
Xét nghiệm máu cho thấy nồng độ kali và natri trong máu thấp.
Nếu bạn gặp bất kỳ tác dụng phụ nào kể trên, hãy báo ngay cho bác sĩ.
Một số tác dụng phụ ngoại ý được báo cáo kể từ khi CoAprovel lưu hành trên thị trường nhưng không rõ tần số như: đau đầu, kêu vo vo ở tai, ho, rối loạn vị giác, khó tiêu, đau nhức khớp và cơ, rối loạn chức năng gan và giảm chức năng thận, tăng kali máu, và các phản ứng dị ứng như phát ban, nổi mề đay, sưng phồng mặt, môi, miệng, lưỡi hoặc họng. Hiếm gặp các trường hợp vàng da (vàng da và/hoặc vàng tròng trắng của mắt).
Giống như bất cứ phối hợp hai hoạt chất thuốc, không thể loại trừ các tác dụng phụ đi kèm với từng hoạt chất.
Tác dụng không mong muốn khi dùng irbesartan đơn thuần
Ở những bệnh nhân uống irbesartan đơn thuần, ngoài các tác dụng phụ kể trên, còn có thể gặp đau ngực.
Tác dụng không mong muốn khi dùng hydrochlorothiazid đơn thuần
Ăn mất ngon; kích thích dạ dày; co thắt dạ dày; táo bón; vàng da và/hoặc vàng mắt; viêm tụy có đặc điểm là đau nhiều ở vùng thượng vị, thường có buồn nôn và nôn; rối loạn giấc ngủ; trầm cảm; mờ mắt; giảm bạch cầu có thể dẫn đến hay bị nhiễm trùng; sốt; giảm tiểu cầu (một loại tế bào máu có vai trò quan trọng trong đông máu); giảm hồng cầu (thiếu máu) biểu hiện như mệt mỏi, đau đầu, khó thở khi gắng sức, chóng mặt, và niêm mạc tái; bệnh thận; các rắc rối về phổi bao gồm viêm phổi hoặc tăng tiết dịch trong phổi; da tăng cảm với ánh sáng mặt trời; viêm các mạch máu; bệnh ở da biểu hiện tróc da toàn thân, luput ban đỏ biểu hiện phát ban trên mặt, cổ và da đầu; các phản ứng dị ứng; yếu cơ và co thắt cơ; thay đổi nhịp tim; tụt huyết áp tư thế; sưng phồng tuyến nước bọt; tăng đường huyết; có đường trong nước tiểu; tăng vài loại mỡ trong máu; tăng nồng độ acid uric trong máu có thể dẫn đến bệnh gout.
Các tác dụng phụ đi kèm với hydrochlorothiazid có thể tăng với liều dùng cao hơn. Nếu bạn gặp bất kỳ tác dụng phụ nào trở nên trầm trọng hoặc chưa được liệt kê trong tờ hướng dẫn sử dụng thuốc này, hãy thông báo cho bác sĩ hoặc dược sĩ của bạn.', 'Luôn luôn tuân theo chỉ dẫn của bác sĩ dành cho bạn. Bạn phải hỏi lại bác sĩ hoặc dược sĩ nếu bạn không chắc chắn.
Liều lượng
Liều thông thường của CoAprovel là 1 hoặc 2 viên một ngày. Thông thường CoAprovel được bác sĩ kê toa cho bạn khi các điều trị tăng huyết áp trước đó không đủ để hạ huyết áp của bạn. Bác sĩ sẽ hướng dẫn bạn cách chuyển từ điều trị trước đó sang điều trị với CoAprovel.
Cách dùng
Dùng bằng đường uống. Viên thuốc nên được nuốt với một lượng chất lỏng thích hợp (như một ly nước). CoAprovel có thể được uống trong hoặc ngoài bữa ăn. Bạn nên uống liều thuốc hàng ngày vào cùng một thời điểm trong ngày. Điều quan trọng là bạn phải sử dụng CoAprovel liên tục cho đến khi bác sĩ quyết định dùng phương cách khác.
Hiệu quả hạ áp tối đa đạt được trong vòng 6 - 8 tuần sau khi bắt đầu điều trị.
Trẻ em không nên dùng CoAprovel
Trẻ em dưới 18 tuổi không được uống CoAprovel. Nếu một trẻ em nuốt vài viên thuốc, phải đi gặp bác sĩ ngay lập tức.
Nếu bạn quên uống CoAprovel
Nếu bạn tình cờ quên uống một liều hàng ngày, cứ uống liều kế tiếp như bình thường. Không được uống gấp đôi liều để bù cho liều đã quên.
Nếu bạn có thêm bất cứ thắc mắc nào về việc sử dụng thuốc này, hãy hỏi bác sĩ hay dược sĩ của bạn.
- Quá liều
Nếu nhỡ uống quá nhiều viên thuốc, phải đến gặp bác sĩ ngay lập tức. Biểu hiện quá liều của irbesartan thường gặp là tụt huyết áp và thay đổi nhịp tim. Quá liều do hydrochlorothiazid thường đi kèm với sụt giảm các chất điện giải trong huyết thanh và mất nước do lợi tiểu quá mức. Các triệu chứng hay gặp là buồn nôn và buồn ngủ lơ mơ.
Bệnh nhân cần được giám sát chặt chẽ, điều trị triệu chứng và nâng đỡ. Việc xử lý phụ thuộc vào thời gian kể từ lúc uống vào và độ nặng của các triệu chứng. Các biện pháp đề nghị trong xử trí quá liều bao gồm gây nôn và/hoặc rửa dạ dày, có thể sử dụng than hoạt. Phải theo dõi thường xuyên các chất điện giải và creatinin huyết thanh. Nếu tụt huyết áp xảy ra, bệnh nhân nên được đặt ở tư thế nằm ngửa, nhanh chóng bù nước và điện giải.', 'Bảo quản thuốc ở nhiệt độ dưới 30°C.', '- Thận trọng khi sử dụng
Hãy báo cho bác sĩ nếu bạn gặp một trong các tình trạng sau:
Tiêu chảy hay ói mửa nhiều.
Vấn đề về thận, hoặc đang ghép thận.
Vấn đề về tim.
Vấn đề về gan.
Đái tháo đường.
Luput ban đỏ (còn được gọi là bệnh luput ban đỏ rải rác)
Tăng aldosteron nguyên phát (bệnh có liên quan đến sản xuất ra nhiều hormon aldosteron, là nguyên nhân lưu giữ natri và kế đến làm tăng huyết áp).
Bạn cũng cần phải báo cho bác sĩ nếu:
Bạn đang theo chế độ ăn kiêng ít muối.
Bạn có những dấu hiệu như khát nước bất thường, khô miệng, mệt nhọc, buồn ngủ, co thắt cơ gây đau, buồn nôn, nôn hay nhịp tim nhanh bất thường có thể chỉ điểm cho một tác động quá mức của hydrochlorothiazid (chứa trong viên CoAprovel).
Bạn đã từng bị tăng nhạy cảm da với ánh sáng mặt trời với các triệu chứng bỏng nắng (như đỏ bừng, ngứa, sưng phồng, rộp da) xuất hiện nhanh hơn bình thường.
Bạn sắp phải phẫu thuật hoặc phải gây mê.
Hydrochlorothiazid chứa trong viên thuốc này có thể cho kết quả dương tính khi xét nghiệm chống doping.
- Thai kỳ và cho con bú
Phụ nữ có thai
Cần báo cho bác sĩ biết nếu bạn có thai, hoặc có thể có thai. Thông thường bác sĩ sẽ khuyên bạn ngưng dùng CoAprovel trước khi có thai hoặc ngay khi bạn biết mình có thai và sẽ khuyên bạn dùng thuốc khác thay thế cho CoAprovel, CoAprovel không được khuyên dùng trong các tháng đầu của thai kỳ và không được dùng khi đã mang thai hơn 3 tháng, vì thuốc có thể là nguyên nhân gây nguy hiểm cho trẻ nếu người mẹ dùng thuốc này sau 3 tháng đầu của thai kỳ.
Phụ nữ đang thời kỳ nuôi con bằng sữa mẹ
Cần báo cho bác sĩ biết nếu bạn đang hoặc bắt đầu nuôi con bằng sữa mẹ.
Không được dùng CoAprovel cho phụ nữ đang nuôi con bằng sữa mẹ, và bác sĩ sẽ chọn hướng điều trị khác cho bạn, nhất là khi con bạn còn sơ sinh hoặc thiếu tháng.
- Khả năng lái xe và vận hành máy móc
Chưa thực hiện nghiên cứu nào về tác động của CoAprovel đối với khả năng lái xe và vận hành máy móc. CoAprovel không chắc có gây ảnh hưởng đến khả năng lái xe hoặc điều khiển máy móc. Tuy nhiên, trong thời gian điều trị tăng huyết áp, choáng váng hoặc mệt mỏi đôi khi có thể xảy ra. Nếu có những triệu chứng này, bạn cần phải tham khảo ý kiến của bác sĩ trước khi lái xe hoặc vận hành máy móc.
- Tương tác thuốc
Thông báo cho bác sĩ hoặc dược sĩ của bạn biết các thuốc bạn đang sử dụng hoặc vừa sử dụng, bao gồm cả các thuốc không cần kê toa.
Các thuốc trị tăng huyết áp khác: hiệu quả trị tăng huyết áp của CoAprovel có thể tăng thêm khi dùng đồng thời với các thuốc trị tăng huyết áp khác.
Lithium: khuyến cáo không nên phối hợp lithium và CoAprovel. Nếu sự phối hợp được chứng tỏ là cần thiết thì khuyến cáo phải theo dõi cẩn thận nồng độ lithium huyết thanh.
Các thuốc ảnh hưởng đến kali: tác động mất kali của hydrochlorothiazid được làm yếu đi do tác động giữ kali của irbesartan. Sử dụng đồng thời với các thuốc lợi tiểu giữ kali, bổ sung kali, các muối thay thế có chứa kali hoặc các thuốc khác có thể tăng mức độ kail huyết thanh (như natri heparin) có thể dẫn đến tăng kali huyết thanh. Khuyến cáo theo dõi thỏa đáng nồng độ kali huyết thanh ở những bệnh nhân nguy cơ.
Các thuốc bi ảnh hưởng bởi sự rối lọan kali huyết thanh: (như các glycoside digitalis, các thuốc chống loạn nhịp): cần theo dõi định kỳ kail huyết.
Các thuốc kháng viêm không steroid: tác dụng trị tăng huyết áp của CoAprovel có thể bị giảm đi.
Các thông tin bổ sung về tương tác của hydrochlorothiazid:
Rượu: có khả năng xảy ra tụt huyết áp tư thế;
Các thuốc trị đái tháo đường (các thuốc uống và insulin): có thể phải điều chỉnh liều của các thuốc trị đái tháo đường.
Các nhựa trao đổi ion colestyramine và colestipol: sự hấp thu hydrochlorothiazid kém đi.
Các corticosteroid, ACTH: gia tăng mất các chất điện giải, nhất là hạ kali huyết;
Các glycoside digitalis: thiazide gây ra hạ kali huyết hoặc hạ magnesi huyết làm dễ khởi phát rối loạn nhịp tim gây ra do digitalis.
Các thuốc chống viêm không steroid: có thể làm giảm tác động lợi tiểu, giảm bài tiết sodium niệu và giảm tác động hạ huyết áp của thuốc lợi tiểu thiazide ở một số bệnh nhân;
Các amin tăng huyết áp (như noradrenaline): tác động của các amin tăng huyết áp có thể bị giảm đi, nhưng không đủ để ngản cản việc sử dụng chúng;
Các thuốc giãn cơ vân không khử cực (như tubocurarine): hydrochlorothiazid làm tăng tác động giãn cơ vân không khử cực;
Thuốc trị bệnh gout: hydrochlorothiazide có thể làm tăng acid uric huyết thanh, tăng tỷ lệ phản ứng quá mẫn với allopurinol.
Các muối canxi: thuốc lợi tiểu thiazid có thể làm tăng nồng độ canxi huyết thanh do làm giảm bài tiết canxi.
Cần phải xét nghiệm máu nếu bạn sử dụng:
Những loại thuốc bổ sung kali.
Các chất muối thay thế có chứa kali.
Các loại thuốc giữ kali hoặc các thuốc lợi tiểu khác.
Thuốc nhuận trường.
Thuốc điều trị bệnh gout.
Thuốc bổ sung vitamin D.
Thuốc kiểm soát nhịp tim.
Các thuốc trị đái tháo đường (dạng uống hoặc insulin).
Carbamazepine (một loại thuốc điều trị động kinh).
Cần thông báo cho bác sĩ nếu bạn đang dùng thuốc hạ huyết áp khác, các steroid, thuốc điều trị ung thư, thuốc giảm đau, hoặc thuốc trị viêm khớp.
Dùng CoAprovel chung với thức ăn và thức uống:
CoAprovel có thể được uống cùng hoặc không cùng với thức ăn.
Do hydrochlorothiazid chứa trong CoAprovel, nếu bạn uống rượu trong khi đang điều trị thuốc này, có thể bạn có cảm giác choáng váng ở tư thế đứng, nhất là khi đứng lên từ tư thế ngồi.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000139'), 'Viên nén', '2 vỉ x 15 viên', 'Thuốc Cordarone 200mg được chỉ định dùng phòng ngừa và điều trị một số dạng rối loạn nhịp tim.', 'Không được sử dụng Cordarone trong các trường hợp sau:
Dị ứng đã biết với iốt hoặc với amiodarone, hoặc một trong các thành phần của thuốc.
Cường tuyến giáp.
Một số rối loạn nhịp tim và/hoặc tính dẫn truyền.
Nhịp tim chậm quá mức.
Sau 3 tháng đầu của thai kỳ.
Phụ nữ đang thời kỳ cho con bú.
Khi dùng chung với các thuốc có khả năng gây ra xoắn đỉnh (rối loạn nhịp tim nặng):
Thuốc chống loạn nhịp tim nhóm Ia (quinidine, hydroquinidine, disopyramide).
Thuốc chống loạn nhịp tim nhóm III (sotalol, dofetilide, ibutilide).
Các thuốc khác (như arsenious trioxide, bepridil, cisapride, diphemanil, dolasetron tiêm tĩnh mạch, erythromycin tiêm tĩnh mạch, mizolastine, moxifloxacin, spiramycin tiêm tĩnh mạch, toremifene, vincamine tiêm tĩnh mạch) (xem “Tương tác thuốc”).', 'Như tất cả các thuốc có hoạt tính, CORDARONE có thể gây ra ít nhiều tác dụng khó chịu ở một số người.
Các triệu chứng này cần được thông báo cho bác sĩ của bạn biết để xét xem có nên tiếp tục hay cần ngưng điều trị:
Rất thường gặp:
Rối loạn thị giác (cảm giác sương mù hoặc quầng sáng quanh đồ vật).
Các phản ứng da với ánh sáng.
Hormon tuyến giáp thay đổi mà không có các dấu hiệu lâm sàng của bệnh về tuyến giáp.
Tăng một vài men gan trong máu (transaminase).
Rối loạn tiêu hóa nhẹ (buồn nôn, nôn, loạn vị giác).
Thường gặp:
Da có màu xám.
Bệnh về tuyến giáp (tăng cân, nhạy cảm với nhiệt độ lạnh và mệt mỏi hoặc ngược lại gầy sút quá độ và tiêu chảy).
Có vấn đề về hô hấp (khó thở, thở hổn hển, sốt và ho khan).
Run vẫy.
Rối loạn giấc ngủ kể cả ác mộng.
Đi đứng khó (tổn thương thần kinh tứ chi).
Bệnh gan cấp tính và/hoặc vàng da, có thể rất nặng.
Nhịp tim chậm.
Hiếm gặp:
Rối loạn tính dẫn truyền tim.
Tổn thương cơ tứ chi.
Rất ít gặp:
Mờ hoặc giảm thị lực.
Phản ứng da với phát ban da và ngứa ngáy.
Rụng tóc.
Có vấn đề về hô hấp trong trường hợp hen suyễn và/hoặc ngay sau khi phẫu thuật, có thể rất nặng.
Bệnh gan mạn tính.
Nhịp tim chậm nghiêm trọng.
Giảm lượng tiểu cầu trong máu.
Tổn thương thận.
Nhức đầu.
Giảm natri huyết.
Không rõ tần suất gặp:
Xuất huyết phổi thường kèm khó thở.
Phản ứng dị ứng có biểu hiện là sưng tấy ở mặt và cổ.
Nếu bạn ghi nhận có bất kỳ tác dụng phụ nào không nêu ra trong toa thuốc này, hoặc nếu bất kỳ tác dụng phụ nào trở nên trầm trọng, hãy báo cho bác sĩ hoặc dược sĩ.', 'Liều dùng:
Liều thông thường thay đổi tùy từng bệnh nhân, nhưng thông thường là:
Khi bắt đầu điều trị: mỗi lần uống 1 viên, ngày 3 lần, dùng trong 8 - 10 ngày.
Liều duy trì: 1/2 viên - 2 viên/ngày.
Tuyệt đối tuân theo sự chỉ định của bác sĩ, không thay đổi liều dùng nếu không có ý kiến bác sĩ.
Ngay cả khi ngưng thuốc cũng phải hỏi ý kiến bác sĩ.
Cách dùng và đường dùng:
Dùng đường uống.
Số lần và lúc uống thuốc: uống thuốc trước, trong hay sau bữa ăn; nhai viên thuốc cũng không làm thay đổi tính chất của thuốc.
Thời gian điều trị: theo chỉ định của bác sĩ.
Xử lý trong trường hợp quên dùng một hoặc nhiều liều: Nếu bạn quên uống thuốc một lần thì cũng không gây ra nguy cơ gì đặc biệt. Nếu bạn quên uống thuốc không được dùng gấp đôi liều cho một lần uống.
- Quá liều
Trong trường hợp quá liều, gọi ngay cho bác sĩ của bạn hay trung tâm chống độc trong vùng bạn ở.
Việc dùng quá liều amiodarone ít được ghi nhận. Một vài trường hợp như chậm nhịp tim, rối loạn nhịp tâm thất, đặc biệt là xoắn đỉnh và suy gan đã được báo cáo. Nên điều trị triệu chứng. Do động học của thuốc, thời gian theo dõi nên đủ dài, đặc biệt là chức năng của tim.
Amiodarone và các chất chuyển hóa của nó không thể thẩm tách.', 'nhiệt độ lạnh và', '- Thận trọng khi sử dụng
LƯU Ý ĐẶC BIỆT:
Trong trường hợp xuất hiện thở hổn hển bất thường, khó thở hoặc ho khan, có hoặc không làm ảnh hưởng đến tổng trạng, mệt mỏi hoặc sốt kéo dài hoặc không giải thích được, tiêu chảy, sụt cân, đau cơ, giảm thị lực hoặc trong trường hợp tái xuất hiện nhịp tim quá nhanh, hãy báo cho bác sĩ đang điều trị bạn.
Bạn không nên dùng thuốc này trong trường hợp mắc chứng loạn chuyển hoá galactose bẩm sinh, hội chứng kém hấp thu glucose và galactose hoặc thiếu hụt men lactase (bệnh di truyền hiếm gặp).
Tránh dùng phối hợp Cordarone với cyclosporin, diltiazem dạng thuốc tiêm, verapamil, một vài thuốc diệt ký sinh trùng (halofantrine, lumefantrine, pentamidine), một số thuốc an thần (amisulpride, chlorpromazine, cyamemazine,droperidol, fluphenazine, haloperidol, levomepromazine, pimozide, pipamperone, pipotiazine, sertindole, sulpiride, sultopride, tiapride, zuclopenthixol) và với methadone. (xem "Tương tác thuốc").
THẬN TRỌNG KHI DÙNG:
Cần tránh ra ánh nắng trong thời gian điều trị để tránh xảy ra các phản ứng làm nám da.
Trong thời gian điều trị, bạn cần được xét nghiệm máu để kiểm tra tuyến giáp hoặc chức năng gan của bạn.
Nếu bạn đang được cấy máy phá rung hay máy tạo nhịp tim, nên hỏi ý kiến bác sĩ điều trị xem máy có đang hoạt động chính xác hay không trước khi hay một thời gian sau khi bắt đầu điều trị bằng amiodarone hoặc bất cứ khi nào cần chỉnh liều thuốc.
Trước khi phẫu thuật, báo cho bác sĩ gây mê biết là bạn đang dùng amiodarone.
Chưa rõ về hiệu quả và tính an toàn khi dùng amiodarone cho trẻ em.
- Thai kỳ và cho con bú
Do có sự hiện diện của iodine, thuốc này chống chỉ định đối với phụ nữ đang mang thai từ tháng thứ 4 trở đi.
Thuốc cũng chống chỉ định đối với phụ nữ đang thời kỳ cho con bú.
Như là một nguyên tắc chung, bạn cần phải báo cho bác sĩ hoặc dược sĩ của bạn biết bạn đang mang thai hoặc đang thời kỳ cho con bú trước khi dùng bất kỳ loại thuốc nào.
- Khả năng lái xe và vận hành máy móc
Không ảnh hưởng.
- Tương tác thuốc
Nhằm tránh tương tác có thể xảy ra giữa các thuốc, bạn phải báo cho bác sĩ hay dược sĩ của bạn một cách đầy đủ tất cả các điều trị khác mà bạn đang theo.
Cordarone không được dùng phối hợp với các thuốc có khả năng gây ra xoắn đỉnh (rối loạn nhịp tim nặng) như một số thuốc chống loạn nhịp tim (quinidine, hydroquinidine, disopyramide, dofetilide, ibutilide, sotalol), hoặc với các thuốc khác (arsenious trioxide, bepridil, cisapride, diphemanil, dolasetron tiêm tĩnh mạch, erythromycin tiêm tĩnh mạch, mizolastine, moxifloxacin, spiramycin tiêm tĩnh mạch, toremifen, vincamine tiêm tĩnh mạch). Tránh dùng phối hợp Cordarone với cyclosporin, diltiazem dạng thuốc tiêm, verapamil, một vài thuốc diệt ký sinh trùng (halofantrine, lumefantrine, pentamidine), một số thuốc an thần (amisulpride, chlorpromazine, cyamemazine, droperidol, fluphenazine, haloperidol, levomepromazine, pimozide, pipamperone, pipotiazine, sertindole, sulpiride, sultopride, tiapride, zuclopenthixol) và với methadone (xem “Lưu ý đặc biệt”).
Danh sách các tá dược cần biết để tránh nguy cơ của thuốc đối với một số bệnh nhân:
Lactose.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193689000046'), 'Thuốc nước', '1 chai x 25ml', 'Trợ tim, ngất do suy tim.
Mất ngủ, lao lực, an thần.', 'Người đang lái xe, vận hành máy móc.
Bệnh nhân mẫn cảm với bất kỳ thành phần nào của thuốc.', 'Có thể có buồn nôn, nôn, đau bụng.', 'Người lớn: ngày uống 2 lần, mỗi lần uống 20 - 50 giọt pha với khoảng 30ml nước.
Trẻ em: ngày uống 2 lần, mỗi lần uống 10 - 15 giọt pha với khoảng 15ml nước.
- Quá liều
Triệu chứng quá liều của Lạc tiên: Nhức đầu, choáng váng, rối loạn thị giác
Triệu chứng quá liều Natri camphosulfonai: buồn nôn, nôn, nhức đầu, cảm giác nóng sốt, lẫn lộn, mê sảng, co giật, hôn mê, khó thở, suy hô hấp.
Phương pháp cấp cứu ngộ độc là các biện pháp điều trị triệu chứng và chăm sóc hỗ trợ.', 'nhiệt độ dưới 30°C.', '- Thận trọng khi sử dụng
Cần tham khảo ý kiến thầy thuốc khi dùng cho trẻ em, phụ nữ có thai và cho con bú.
- Thai kỳ và cho con bú
Thận trọng khi dùng cho phụ nữ có thai và cho con bú.
- Khả năng lái xe và vận hành máy móc
Thuốc có tác dụng an thần, không được dùng cho người đang lái xe và vận hành máy móc.
- Tương tác thuốc
Cho đến nay chưa có thông tin báo cáo về tương tác thuốc.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000154'), 'Viên nén bao phim', '1 lọ x 30 viên', '- Tăng huyết áp: Điều trị tăng huyết áp.
- Bệnh động mạch vành ổn định: Làm giảm nguy cơ biến cố tim mạch trên bệnh nhân đã có tiền sử nhồi máu cơ tim và/hoặc tái thông mạch.', '- Dị ứng với thành phần hoạt chất hoặc bất kỳ thành phần nào của thuốc, hay bất kỳ thuốc ức chế men chuyển nào khác.
- Tiền sử phù mạch liên quan đến việc sử dụng các thuốc ức chế men chuyển trước đó.
- Phù mạch di truyền hoặc vô căn.
- Giai đoạn hai và ba của thai kỳ.
- Sử dụng đồng thời Coversyl với các sản phẩm có chứa aliskiren trên bệnh nhân tiểu đường hoặc suy thận (GFR&lt; 60ml/phút/1,73 m2).', 'Tóm tắt dữ liệu an toàn:
Dữ liệu an toàn của perindopril hoà hợp với dữ liệu an toàn của các thuốc ức chế men chuyển:
Các tác dụng không mong muốn có tần suất phổ biến đã được báo cáo trong các nghiên cứu lâm sàng và được quan sát với perindopril bao gồm: choáng váng, đau đầu, dị cảm, chóng mặt, rối loạn thị giác, ù tai, hạ huyết áp, ho, khó thở, đau bụng, táo bón, tiêu chảy, mất vị giác, rối loạn tiêu hoá, buồn nôn, nôn, ngứa, ngoại ban, chuột rút và suy nhược.
Bảng tổng kết các tác dụng không mong muốn
Các tác dụng không mong muốn sau đây đã được quan sát trong các thử nghiệm lâm sàng và/hoặc trong quá trình lưu hành perindopril và được sắp xếp theo tần số xuất hiện như sau:
Rất phổ biến (≥ 1/10); phổ biến (≥1/100, &lt; 1/10); không phổ biến (≥1/1000, &lt; 1/100); hiếm (≥1/10000, &lt; 1/1000); rất hiếm ( &lt; 1/10000); chưa biết (không thể đánh giá từ các dữ liệu hiện có)
Phân loại hệ thống cơ quanTác dụng không mong muốnTần suất
Rối loạn máu và hệ bạch huyếtTăng bạch cầuKhông phổ biến*
Mất bạch cầu hạt hoặc giảm toàn thể hồng cầuRất hiếm
Giảm hemoglobin và giảm thể tích hồng cầu đặcRất hiếm
Giảm bạch cầu /giảm bạch cầu trung tínhRất hiếm
Thiếu máu tan huyết ở bệnh nhân
thiếu G-6PDH bẩm sinhRất hiếm
Giảm tiểu cầuRất hiếm
Rối loạn chuyển hoá và dinh dưỡngHạ đường huyếtKhông phổ biến*
Tăng kali máu, có hồi phục khi dừng thuốcKhông phổ biến*
Hạ natri máuKhông phổ biến*
Rối loạn tâm thầnRối loạn khí sắcKhông phổ biến
Rối loạn giấc ngủKhông phổ biến
Rối loạn hành kinhChoáng vángPhổ biến
Đau đầuPhổ biến
Dị cảmPhổ biến
Chóng mặtPhổ biến
Ngủ lơ mơKhông phổ biến*
NgấtKhông phổ biến*
Bối rốiRất hiếm
Rối loạn thị giácRối loạn thị giácPhổ biến
Rối loạn tai và mê cungÙ taiPhổ biến
Rối loạn timĐánh trống ngựcKhông phổ biến*
Nhịp tim nhanhKhông phổ biến*
Đau ngựcRất hiếm
Loạn nhịpRất hiếm
Nhồi máu cơ tim, có thể thứ phát sau cơn hạ huyết áp quá mức trên bệnh nhân có nguy cơ caoRất hiếm
Rối loạn
mạchHạ huyết áp (và các triệu chứng liên quan đến hạ huyết áp)Phổ biến
Viêm mạchKhông phổ biến*
Đột quỵ, có thể thứ phát sau cơn hạ huyết áp quá mức trên bệnh nhân có nguy cơ caoRất hiếm
Rối loạn hô hấp, ngực và trung thấtHoPhổ biến
Khó thởPhổ biến
Co thắt phế quảnKhông phổ biến
Viêm phổi tăng bạch cầu ưa eosinRất hiếm
Viêm mũiRất hiếm
Rối loạn tiêu hoáĐau bụngPhổ biến
Táo bónPhổ biến
Tiêu chảyPhổ biến
Mất vị giácPhổ biến
Rối loạn tiêu hoáPhổ biến
Buồn nônPhổ biến
NônPhổ biến
Khô miệngKhông phổ biến
Viêm tuỵRất hiếm
Rối loạn gan mậtViêm gan hủy tế bào hoặc viêm gan ứ mậtRất hiếm
Rối loạn da và mô
dưới đaNgứaPhổ biến
Ngoại banPhổ biến
Mày đayKhông phổ biến
Phù mặt, chi, môi, niêm mạc, lưỡi, thanh môn và/hoặc thanh quảnKhông phổ biến
Nhạy cảm ánh sángKhông phổ biến*
Nốt bóng nước trên daKhông phổ biến*
Ra nhiều mồ hôiKhông phổ biến
Ban đỏ da hình tháiRất hiếm
Rối loạn cơ xương
khớp và mô liên kếtChuột rútPhổ biến
Đau khớpKhông phổ biến*
Đau cơKhông phổ biến*
Rối loạn thận và bài tiếtSuy giảm chức năng thậnKhông phổ biến
Suy thận cấpRất hiếm
Rối loạn sinh sản và cho con búRối loạn cươngKhông phổ biến
Rối loạn chungSuy nhượcPhổ biến
Đau ngựcKhông phổ biến*
Cảm giác khó ởKhông phổ biến*
Phù ngoại biênKhông phổ biến*
SốtKhông phổ biến*
Thông sốTăng urê huyếtKhông phổ biến*
Tăng creatinin huyếtKhông phổ biến*
Tăng bilirubin huyếtHiếm
Tăng enzym ganHiếm
Bị thương, nhiễm độc và biến chứngNgãKhông phổ biến*
* Tần suất được tính từ các nghiên cứu lâm sàng cho các biến cố bất lợi nhận được từ các báo cáo tự nguyện.
Nghiên cứu lâm sàng
Trong giai đoạn ngẫu nhiên của nghiên cứu EUROPA, chỉ có những tác dụng không mong muốn nghiêm trọng được thu thập. Rất ít bệnh nhân trải qua các biến cố bất lợi nghiêm trọng: 16 (0,3%) trong số 6122 bệnh nhân dùng perindopril và 12 (0,2%) trong số 6107 bệnh nhân dùng placebo, ở nhóm bệnh nhân dùng perindopril, có 6 bệnh nhân bị hạ huyết áp, 3 bệnh nhân bị phù mạch và 1 bệnh nhân bị ngừng tim đột ngột. Số bệnh nhân ở nhóm perindopril rút khỏi nghiên cứu do ho, hạ huyết áp hoặc không dung nạp với perindopril là 6,0% (n=336) nhiều hơn so với nhóm placebo 2,1% (n=129)
Báo cáo các tác dụng không mong muốn
Báo cáo tác dụng không mong muốn sau khi thuốc lưu hành là quan trọng. Việc này cho phép kiểm soát cân bằng lợi ích/nguy cơ của thuốc. Các cán bộ y tế có thể báo cáo các tác dụng không mong muốn thông qua hệ thống báo cáo quốc gia.', 'Liều thuốc nên được áp dụng theo từng cá thể bệnh nhân và mức đáp ứng huyết áp.
Tăng huyết áp:
Coversyl có thể được sử dụng đơn lẻ hoặc phối hợp với các thuốc chống tăng huyết áp khác.
Liều khởi đầu khuyến cáo là 5mg một lần mỗi ngày vào buổi sáng.
Những bệnh nhân với hệ thống renin-angiotensin-aldosteron hoạt tính mạnh (đặc biệt, tăng huyết áp động mạch thận, giảm muối và/hoặc giảm thể tích tuần hoàn, mất bù tim hoặc tăng huyết áp nghiêm trọng) có thể bị giảm huyết áp mạnh sau liều đầu tiên. Liều khởi đầu 2,5mg nên được khuyến cáo ở những bệnh nhân này và bước đầu trị liệu nên được giám sát y tế.
Liều dùng có thể tăng tới 10mg một lần mỗi ngày sau 1 tháng điều trị.
Hạ huyết áp có triệu chứng có thể xảy ra sau khi khởi trị với Coversyl, điều này xảy ra thường xuyên hơn ở những bệnh nhân đang được điều trị đồng thời với thuốc lợi tiểu. Do đó cần thận trọng vì những bệnh nhân này có thể bị giảm thể tích tuần hoàn và/hoặc muối.
Nếu có thể, nên dừng thuốc lợi tiểu 2 - 3 ngày trước khi bắt đầu với Coversyl, ở những bệnh nhân tăng huyết áp không thể dừng thuốc lợi tiểu, trị liệu bằng Coversyl nên được khởi đầu với liều 2.5mg. Nên theo dõi chức năng thận và kali huyết thanh. Việc bổ sung liều Coversyl cần được điều chỉnh tùy thuộc đáp ứng huyết áp. Nếu cần, việc điều trị bằng thuốc lợi tiểu có thể bắt đầu lại. Ở bệnh nhân lớn tuổi việc điều trị có thể bắt đầu với liều 2.5mg và tăng dần liều tới 5mg sau 1 tháng và sau đó là 10mg nếu cần thiết tuỳ thuộc vào chức năng thận (xem bảng bên dưới).
Bệnh động mạch vành ổn định:
Nên bắt đầu Coversyl với liều khởi đầu là 5mg một lần mỗi ngày trong hai tuần, sau đó tăng liều lên 10mg một lần mỗi ngày, phụ thuộc vào chức năng thận và liều 5mg được dung nạp tốt.
Bệnh nhân lớn tuổi nên dùng liều 2.5mg một lần mỗi ngày cho tuần đầu tiên, sau đó 5mg một lần mỗi ngày cho tuần tiếp theo trước khi tăng lên 10mg một lần mỗi ngày tuỳ thuộc chức năng thận (xem bảng 1 “ Điều chỉnh liều ở bệnh nhân suy thận”). Chỉ nên tăng liều nếu liều trước đó được dung nạp tốt.
Nhóm bệnh nhân đặc biệt:
Bệnh nhân suy thận
Liều thuốc Coversyl ở bệnh nhân suy thận nên được điều chỉnh dựa trên độ thanh thải creatinin như trong bảng 1 dưới đây:
Bảng 1: chỉnh liều Coversyl ở bệnh nhân suy thận
Độ thanh thải Creatinin (ml/phút)Liều khuyến cáo
ClCR ≥ 605mg/1 ngày
30 &lt; ClCR &lt; 602.5 mg/1 ngày
15 &lt; ClCR &lt; 302.5mg mỗi 2 ngày
Bệnh nhân thẩm tích máu*
ClCR &lt; 152.5mg vào ngày thẩm tích máu
*Độ thẩm phân của perindoprilat là 70ml/phút
Đối với bệnh nhân thẩm tích máu, liều thuốc nên được dùng sau khi thẩm tích máu.
Bệnh nhân suy gan:
Không cần điều chỉnh liều ở bệnh nhân suy gan.
Trẻ em:
Độ an toàn và hiệu quả của perindopril trên trẻ em và trẻ vị thành niên dưới 18 tuổi chưa được thiết lập.
Các dữ liệu hiện tại đã được mô tả trong mục “Tác dụng dược lực học” nhưng chưa có khuyến cáo về chỉ định.
Do đó việc sử dụng thuốc trên trẻ em và trẻ vị thành niên không được khuyến cáo.
Cách dùng:
Dùng đường uống.
Coversyl được chỉ định dùng một lần mỗi ngày trước khi ăn sáng.
- Quá liều
Các dữ liệu về việc dùng quá liều trên người còn hạn chế.
Các triệu chứng liên quan đến dùng quá liều thuốc ức chế men chuyển có thể bao gồm hạ huyết áp, sốc tuần hoàn, rối loạn điện giải, suy thận, thở nhanh, nhịp tim nhanh, đánh trống ngực, nhịp tim chậm, choáng váng, lo âu và ho.
Việc điều trị quá liều được khuyến cáo là truyền tĩnh mạch dung dịch natri clorid 9mg/ml (0,9%). Nếu bệnh nhân bị hạ huyết áp, nên giữ bệnh nhân ở nguyên tư thế. Nếu có thể, cân nhắc truyền angiotensin II và/hoặc tiêm tĩnh mạch catecholamine. Có thể loại perindopril ra khỏi tuần hoàn chung bằng cách lọc máu. Máy tạo nhịp được chỉ định cho những trường hợp chậm nhịp tim kháng trị. Những dấu hiệu của sự sống, điện giải huyết thanh và nồng độ creatinin nên được giám sát liên tục.', 'bảo quản: dưới 30°C.', '- Thận trọng khi sử dụng
Bệnh mạch vành ổn định:
Nếu có cơn đau thắt ngực không ổn định (điển hình hoặc không điển hình) xuất hiện trong tháng đầu tiên khi điều trị bằng perindopril, nên đánh giá thận trọng lợi ích/nguy cơ trước khi tiếp tục điều trị.
Hạ huyết áp
Các thuốc ức chế men chuyển có thể gây hạ huyết áp. Các triệu chứng hạ huyết áp ít khi quan sát thấy trên bệnh nhân tăng huyết áp không có biến chứng và thường xuất hiện trên các bệnh nhân có khối lượng tuần hoàn giảm như đang điều trị bằng các thuốc lợi tiểu, chế độ ăn hạn chế muối, thẩm tích máu, ỉa chảy hoặc nôn hoặc các bệnh nhân tăng huyết áp nặng phụ thuộc renin. Hạ huyết áp có triệu chứng được ghi nhận trên các bệnh nhân suy tim có triệu chứng, có kèm theo suy thận hoặc không. Các triệu chứng này xuất hiện hầu hết trên các bệnh nhân suy tim ở mức độ nặng hơn là do sử dụng liều cao thuốc lợi tiểu quai, hạ natri máu hoặc suy thận chức năng. Ở những bệnh nhân tăng nguy cơ hạ huyết áp triệu chứng, cần giám sát chặt bệnh nhân khi bắt đầu điều trị và lúc hiệu chỉnh liều. Nguyên tắc tương tự cũng được áp dụng cho bệnh nhân thiếu máu cơ tim hoặc bệnh mạch máu não, do việc hạ huyết áp quá mức có thể dẫn đến nhồi máu cơ tim hoặc tai biến mạch máu não.
Nếu xuất hiện triệu chứng hạ huyết áp, nên đặt bệnh nhân nằm ngửa và nếu cần thiết nên truyền tĩnh mạch dung dịch natri clorid 9mg/ml (0,9%). Không có chống chỉ định cho liều tiếp theo nếu phản ứng hạ huyết áp thoáng qua, bệnh nhân thường có thể dùng liều tiếp theo mà không gặp khó khăn gì khi khối tượng tuần hoàn tăng kéo huyết áp tăng theo.
Trên một số bệnh nhân suy tim sung huyết có huyết áp bình thường hoặc huyết áp thấp, việc hạ thêm huyết áp toàn thân có thể xuất hiện khi sử dụng Coversyl. Tác dụng này có thể dự doán được và thường không phải là nguyên nhân bắt buộc phải ngừng điều trị. Trong trường hợp hạ huyết áp có biểu hiện triệu chứng, có thể cần phải giảm liều hoặc ngừng dùng Coversyl.
Hẹp động mạch chủ và van hai lá/ bệnh cơ tim phì đại
Tương tự các thuốc ức chế men chuyển khác, nên thận trọng khi dùng Coversyl cho các bệnh nhân hẹp van hai lá và tắc nghẽn dòng máu đi ra từ thất trái như hẹp động mạch chủ hoặc bệnh cơ tim phì đại.
Suy thận
Trong trường hợp suy thận (thanh thải creatinin &lt; 60ml/ phút), nên hiệu chỉnh liều khởi đầu của perindopril theo độ thanh thải creatinin của bệnh nhân, sau đó tuỳ theo đáp ứng của bệnh nhân. Theo dõi thường xuyên kali và creatinin là một phần trong kế hoạch chăm sóc thường quy cho các bệnh nhân này.
Trên bệnh nhân suy tim có triệu chứng, hạ huyết áp xuất hiện sau khi bắt đầu điều trị bằng các thuốc ức chế men chuyển có thể dẫn đến suy giảm thêm chức năng thận. Suy thận cấp, thường có hồi phục đã được ghi nhận trong trường hợp này.
Trên một số bệnh nhân hẹp động mạch thận hai bên hoặc hẹp động mạch thận một bên được điều trị bằng các thuốc ức chế men chuyển đã ghi nhận được tăng urê máu và creatinin huyết thanh thường có hồi phục sau khi ngừng thuốc điều trị. Điều này đặc biệt hay xảy ra trên các bệnh nhân suy thận. Nếu bệnh nhân có tăng huyết áp động mạch thận, nguy cơ hạ huyết áp nặng và suy thận sẽ tăng lên. Trên những bệnh nhân này, nên bắt đầu điều trị với liều thấp dưới sự giám sát y tế chặt chẽ và tăng liều thận trọng. Do các thuốc lợi tiểu có thể là yếu tố góp phần thúc đẩy các nguy cơ trên, nên cần ngừng dùng các thuốc lợi tiểu và theo dõi chức năng thận trong những tuần đầu điều trị bằng Coversyl.
Một số bệnh nhân tăng huyết áp trước đây không có biểu hiện bệnh lý mạch máu thận có thể xuất hiện tăng urê máu và creatinin huyết thanh, thường nhẹ và thoáng qua, đặc biệt khi dùng Coversyl đồng thời với các thuốc lợi tiểu. Nguy cơ có nhiều khả năng xảy ra hơn trên bệnh nhân có tiền sử suy thận. Có thể cần giảm liều và/hoặc ngừng dùng các thuốc lợi tiểu và/hoặc Coversyl.
Bệnh nhân thẩm tích máu
Phản ứng phản vệ đã được báo cáo trên những bệnh nhân thẩm tích máu với màng lọc tốc độ cao được điều trị đồng thời với các thuốc ức chế men chuyển. Trên các bệnh nhân này, nên xem xét sử dụng loại màng thẩm tích máu khác hoặc sử dụng các thuốc chống tăng huyết áp nhóm khác.
Ghép thận
Chưa có kinh nghiệm sử dụng khi dùng Coversyl cho bệnh nhân mới ghép thận.
Quá mẫn/Phù mạch
Phù mạch ở mặt, các đầu chi, môi, niêm mạc, lưỡi, thanh môn và/hoặc thanh quản đã được báo cáo hiếm gặp trên những bệnh nhân được điều trị bằng các thuốc ức chế men chuyển, bao gồm Coversyl.
Phản ứng này có thể xuất hiện bất cứ thời gian nào trong quá trình điều trị. Trong những trường hợp như vậy, nên kịp thời ngừng dùng Coversyl và bắt đầu quá trình theo dõi thích hợp, tiếp tục cho đến khi các triệu chứng xuất hiện thoái lui hoàn toàn. Trong khoảng thời gian này, các triệu chứng sưng mặt và môi thường tự hết mà không cần điều trị, cho dù các thuốc kháng histamin có thể có hiệu quả làm giảm triệu chứng.
Phù mạch liên quan đến phù thanh quản có thể gây tử vong. Khi xuất hiện các triệu chứng phù ở lưỡi, thanh môn hoặc thanh quản, có thể dẫn đến tắc nghẽn đường thở, nên điều trị cấp cứu kịp thời. Có thể sử dụng adrenalin và/hoặc kết hợp với thông khí đường hô hấp cho bệnh nhân. Bệnh nhân nên được theo dõi y tế chặt chẽ cho đến khi hết hoàn toàn các triệu chứng.
Bệnh nhân có tiền sử phù mạch không liên quan đến việc điều trị bằng các thuốc ức chế men chuyển có thể tăng nguy cơ phù mạch khi sử dụng các thuốc ức chế men chuyển.
Phù mạch đường tiêu hoá đã được ghi nhận là hiếm gặp trên các bệnh nhân điều trị bằng các thuốc ức chế men chuyển. Các bệnh nhân này xuất hiện triệu chứng đau bụng (có hoặc không có buồn nôn hoặc nôn); trong một số trường hợp không có phù mặt xuất hiện trước và nồng độ C-1 esterase ở mức bình thường. Chẩn đoán phù mạch bao gồm chụp CT ổ bụng, hoặc siêu âm, hoặc bằng phẫu thuật và mất các triệu chứng sau khi ngừng dùng thuốc ức chế men chuyển. Phù mạch đường tiêu hoá nên bao gồm trong các chẩn đoán phân biệt trên bệnh nhân dùng thuốc ức chế men chuyển có biểu hiện đau bụng.
Các phản ứng phản vệ trong quá trình lọc loại lipoprotein tỷ trọng thấp (LDL)
Phản ứng phản vệ đe dọa tính mạng hiếm khi gặp ở bệnh nhân dùng thuốc ức chế men chuyển trong quá trình lọc loại lipoprotein tỷ trọng thấp bằng dextran sulphat. Có thể tránh được các phản ứng phản vệ này bằng cách tạm thời ngừng dùng thuốc ức chế men chuyển trước mỗi lần lọc loại.
Các phản ứng phản vệ trong quá trình giải mẫn cảm
Bệnh nhân dùng thuốc ức chế men chuyển trong quá trình giải mẫn cảm (ví dụ nọc một số loài côn trùng) đã gặp các phản ứng phản vệ. Trên các bệnh nhân này, các phản ứng phản vệ có thể tránh được bằng cách tạm ngừng dùng các thuốc ức chế men chuyển, nhưng các phản ứng này có thể xuất hiện trở lại sau khi vô ý bị tái mẫn cảm.
Suy gan
Hiếm gặp các trường hợp các thuốc ức chế men chuyển liên quan đến hội chứng bắt đầu bằng vàng da ứ mật và tiến triển thành hoại tử gan lan toả và (đôi khi) tử vong. Cơ chế của hội chứng này chưa được biết rõ. Bệnh nhân dùng các thuốc ức chế men chuyển có vàng da tiến triển hoặc tăng enzym gan nên ngừng dùng thuốc và được theo dõi y tế phù hợp.
Giảm bạch cầu trung tính/ Mất bạch cầu hạt/ Giảm tiểu cầu/ Thiếu máu
Giảm bạch cầu trung tính, mất bạch cầu hạt, giảm tiểu cầu và thiếu máu đã được ghi nhận trên các bệnh nhân dùng thuốc ức chế men chuyển. Trên các bệnh nhân chức năng thận bình thường và không có các yếu tố nguy cơ khác, giảm bạch cầu trung tính hiếm khi xuất hiện. Tuyệt đối thận trọng khi sử dụng perindopril cho những bệnh nhân có bệnh mạch máu tạo keo, bệnh nhân điều trị suy giảm miễn dịch, đang điều trị bằng allopurinol hoặc procainamid, hoặc bệnh nhân có sự kết hợp các yếu tố nguy cơ này, đặc biệt bệnh nhân trước đây đã có tiền sử suy thận. Một số bệnh nhân trong số này đã có nhiễm trùng nặng, đôi khi không đáp ứng với liệu pháp điều trị kháng sinh tích cực. Nếu sử dụng perindopril trên các bệnh nhân này, theo dõi định kỳ số lượng tế bào bạch cầu và hướng dẫn bệnh nhân báo cáo bất cứ dấu hiệu nhiễm trùng nào (ví dụ đau họng, sốt).
Chủng tộc
Các thuốc ức chế men chuyển gây phù mạch trên bệnh nhân da đen với tỷ lệ cao hơn trên các bệnh nhân khác. Tương tự các thuốc ức chế men chuyển khác, tác dụng hạ huyết áp của perindopril có thể kém hiệu quả hơn trên bệnh nhân da đen, có thể là do trạng thái hoạt tính renin huyết tương thấp phổ biến hơn ở quần thể bệnh nhân da đen tăng huyết áp.
Ho
Ho đã được ghi nhận khi sử dụng các thuốc ức chế men chuyển. Ho thường đặc trưng bởi ho khan, dai dẳng và chấm dứt sau khi ngừng điều trị. Các thuốc ức chế men chuyển gây ho nên được xem như một phần của chẩn đoán phân biệt ho.
Phẫu thuật/Gây mê
Trên bệnh nhân phải thực hiện phẫu thuật lớn hoặc gây mê bằng các thuốc có thể gây hạ huyết áp, Coversyl có thể gây ức chế tổng hợp angiotensin II thứ phát bù trừ do giải phóng renin. Nên ngừng dùng thuốc một ngày trước phẫu thuật. Nếu xuất hiện hạ huyết áp do cơ chế này, có thể điều chỉnh bằng cách tăng khối lượng tuần hoàn.
Tăng kali huyết thanh
Tăng kali huyết thanh đã được ghi nhận trên một số bệnh nhân dùng các thuốc ức chế men chuyển, bao gồm perindopril. Các yếu tố nguy cơ làm tăng kali máu bao gồm suy thận, giảm chức năng thận, tuổi (&gt; 70 tuổi), tiểu đường, bị nhiều bệnh đồng thời, đặc biệt là mất nước, mất bù tim cấp, nhiễm toan chuyển hoá và sử dụng đồng thời với các thuốc lợi tiểu giữ kali (như spironolacton, eplerenon, triamteren hoặc amilorid), chế phẩm bổ sung kali và các muối thay thế có chứa kali; hoặc bệnh nhân sử dụng các thuốc khác làm tăng kali huyết thanh (ví dụ heparin). Việc sử dụng các chế phẩm bổ sung kali, các thuốc lợi tiểu giữ kali hoặc các muối thay thế có chứa kali đặc biệt trên bệnh nhân suy thận có thể làm tăng có ý nghĩa nồng độ kali huyết thanh. Tăng kali máu có thể gây loạn nhịp nghiêm trọng, đôi khi dẫn đến tử vong. Nếu việc dùng đồng thời các thuốc nói trên được coi là cần thiết thì cần sử dụng thận trọng và thường xuyên theo dõi kali huyết thanh.
Bệnh nhân tiểu đường
Trên bệnh nhân tiểu đường sử dụng các thuốc điều trị tiểu đường đường uống hoặc insulin, nên theo dõi chặt đường huyết trong tháng đầu khi điều trị với các thuốc ức chế men chuyển.
Lithi
Kết hợp lithi với perindopril nói chung không được khuyến cáo.
Thuốc lợi tiểu giữ kali, bổ sung kali hoặc các muối thay thế chứa kali
Việc kết hợp perindopril với các thuốc lợi tiểu giữ kali, bổ sung kali hoặc các muối thay thế chứa kali nói chung không được khuyến cáo.
Thuốc phong bế kép hệ renin-angiotensin-aldosteron (RAAS)
Đã có bằng chứng cho thấy việc sử dụng đồng thời các thuốc ức chế men chuyển, ức chế thụ thể angiotensin II hoặc aliskiren làm tăng nguy cơ hạ huyết áp, tăng kali máu và suy giảm chức năng thận (bao gồm suy thận cấp tính). Phong bế kép hệ renin-angiotensin-aldosteron bằng việc phối hợp các thuốc ức chế men chuyển, ức chế thụ thể angiotensin II hoặc aliskiren do đó không được khuyến cáo.
Nếu liệu pháp phong bế kép được cho là thực sự cần thiết, chỉ nên tiến hành dưới sự giám sát của chuyên gia và theo dõi chặt chẽ thường xuyên chức năng thận, chất điện giải và huyết áp.
Không nên dùng đồng thời các thuốc ức chế men chuyển và thuốc ức chế thụ thể angiotensin II ở bệnh nhân có bệnh thận do tiểu đường.
Phụ nữ có thai
Không nên bắt đầu sử dụng các thuốc ức chế men chuyển trong thời gian mang thai. Trừ trường hợp cần thiết phải tiếp tục điều trị bằng các thuốc ức chế men chuyển, bệnh nhân dự định mang thai nên đổi sang điều trị bằng thuốc chống tăng huyết áp khác mà dữ liệu an toàn khi sử dụng cho phụ nữ có thai đã được thiết lập. Khi được chẩn đoán có thai, nên ngừng dùng các thuốc ức chế men chuyển ngay lập tức và nên bắt đầu điều trị thay thế bằng một thuốc khác nếu điều kiện lâm sàng cho phép.
Tá dược
Do sự có mặt của lactose, bệnh nhân có rối loạn di truyền hiếm gặp như không dung nạp galactose, kém dung nạp glucose - galactose, hoặc thiếu hụt Lapp lactase không nên sử dụng thuốc này.
- Thai kỳ và cho con bú
Mang thai
Việc sử dụng các thuốc ức chế men chuyển không được khuyến cáo trong 3 tháng đầu tiên của thai kỳ và là chống chỉ định khi có thai trên 3 tháng.
Bằng chứng dịch tễ học về nguy cơ gây quái thai khi dùng thuốc ức chế men chuyển trong ba tháng đầu mang thai vẫn chưa được xác định; tuy nhiên không thể loại trừ khả năng có sự tăng nhẹ nguy cơ này. Trừ khi việc dùng thuốc ức chế men chuyển là rất quan trọng, bệnh nhân nữ có kế hoạch mang thai cần chuyển sang liệu pháp thay thế đã có bằng chứng về tính an toàn để điều trị tăng huyết áp ở phụ nữ mang thai. Khi đã được chẩn đoán có thai, việc điều trị bằng thuốc ức chế men chuyển cần được ngừng ngay lập tức, và nếu có thể, nên bắt đầu liệu pháp điều trị thay thế.
Việc dùng thuốc ức chế men chuyển từ tháng thứ ba của quá trình mang thai được cho là gây độc tính trên thai nhi (giảm chức năng thận, ít dịch ối, chậm phát triển khung xương sọ) và độc tính trên trẻ sơ sinh (suy thận, hạ huyết áp, tăng kali huyết).
Trường hợp phụ nữ mang thai từ sau tháng thứ ba trở đi có sử dụng thuốc ức chế men chuyển, khuyến cáo bệnh nhân siêu âm kiểm tra chức năng thận và kiểm tra hộp sọ.
Trẻ sơ sinh có mẹ sử dụng thuốc ức chế men chuyển nên được theo dõi chặt chẽ để tránh tình trạng hạ huyết áp.
Cho con bú
Do không có thông tin về việc sử dụng Coversyl trong giai đoạn cho con bú, Coversyl không được khuyến cáo sử dụng và nên dùng liệu pháp thay thế có đầy đủ dữ liệu hơn về tính an toàn trên phụ nữ cho con bú, đặc biệt đối với trẻ mới sinh hoặc trẻ sinh non.
Khả năng sinh sản
Không có ảnh hưỏng trên khả năng sinh sản.
- Khả năng lái xe và vận hành máy móc
Coversyl không ảnh hưởng trực tiếp đến khả năng lái xe và vận hành máy móc nhưng một số bệnh nhân có thể bị một số triệu chứng liên quan đến việc giảm huyết áp, đặc biệt khi mới điều trị hoặc khi phối hợp với các thuốc chống tăng huyết áp khác. Do đó, khả năng lái xe và vận hành máy móc có thể bị hạn chế khi dùng thuốc.
- Tương tác thuốc
Các dữ liệu lâm sàng cho thấy việc phong bế kép hệ renin-angiotensin-aldosteron bằng việc phối hợp các thuốc ức chế men chuyển, ức chế thụ thể angiotensin II hoặc aliskiren liên quan đến việc làm tăng tần suất các tác dụng không mong muốn như hạ huyết áp, tăng kali máu và suy giảm chức năng thận (bao gồm suy thận cấp) so với việc sử dụng các thuốc tác dụng trên hệ renin-angiotensin-aldosteron đơn lẻ.
Các thuốc làm tăng kali máu
Một vài thuốc hoặc liệu pháp điều trị có thể làm tăng kali máu: aliskiren, muối kali, thuốc lợi tiểu giữ kali, thuốc ức chế men chuyển, thuốc kháng thụ thể angiotensin II, thuốc kháng viêm giảm đau không steroids, heparin, các tác nhân ức chế miễn dịch như ciclosporin hoặc tacrolimus, trimethoprim. Sự kết hợp của các thuốc này làm gia tăng nguy cơ tăng kali máu.
Điều trị đồng thời là chống chỉ định:
Aliskiren:
Ở các bệnh nhân đái tháo đường hoặc suy thận, nguy cơ tăng kali máu, suy giảm chức năng thận và nguy cơ tim mạch và nguy cơ tử vong tăng.
Điều trị đồng thời không được khuyến cáo:
Trị liệu đồng thời với ức chế men chuyển và thuốc ức chế thụ thể angiotensin:
Đã có ghi nhận trong y văn, ở các bệnh nhân có tiền sử xơ vữa động mạch, suy tim, hoặc ở các bệnh nhân đái tháo đường có tổn thương cơ quan đích, khi điều trị đồng thời thuốc ức chế men chuyển và thuốc ức chế thụ thể angiotensin có khả năng cao hơn xảy ra hạ huyết áp, ngất, tăng kali máu, và suy giảm chức năng thận (bao gồm suy thận cấp) khi so sánh với đơn trị liệu một tác nhân tác động lên hệ renin-angiotensin-aldosteron. Phong bế kép (ví dụ, phối hợp một thuốc ức chế men chuyển với một thuốc kháng thụ thể angiotensin II) nên được giới hạn trong những trường hợp riêng biệt với sự theo dõi chặt chẽ chức năng thận, nồng độ kali và huyết áp.
Estramustine: Nguy cơ tăng các biến cố bất lợi như phù mạch thần kinh.
Thuốc lợi tiểu giữ kali (ví dụ: triamterene, amiloride...),muối kali:
Tăng kali máu (có nguy cơ tử vong), đặc biệt trong trường hợp bệnh nhân suy thận (tác động cộng hợp tăng kali máu).
Sự kết hợp perindopril với các thuốc vừa được đề cập là không được khuyến cáo. Tuy nhiên nếu vẫn chỉ định phối hợp, điều trị này cần được sử dụng thận trọng với sự theo dõi thường xuyên nồng độ kali huyết tương. Trong trường hợp sử dụng spironolactone ở các bệnh nhân suy tim, xin xem phần dưới dây.
Lithi:
Tăng có hồi phục nồng độ lithi huyết thanh và độc tính đã được báo cáo khi dùng đồng thời lithi với các thuốc ức chế men chuyển, sử dụng perindopril với lithi không được khuyến cáo, nhưng nếu cần thiết phải kết hợp, cần theo dõi thận trọng nồng độ lithi huyết thanh.
Điêu trị đồng thời yêu cầu sự chăm sóc đặc biệt:
Các thuốc chống đái tháo đường (insulin, các thuốc hạ đường máu dạng uống):
Các nghiên cứu dịch tễ học đưa ra gợi ý rằng việc sử dụng đồng thời các thuốc ức chế men chuyển với các thuốc điều trị đái tháo đường (insulin, các thuốc hạ đường huyết dạng uống) có thể làm tăng hiệu quả hạ đường huyết dẫn đến nguy cơ hạ đường huyết. Hiện tượng này thường xuất hiện trong các tuần đầu điều trị phối hợp và trên các bệnh nhân suy thận.
Baclofen:
Tăng khả năng hạ huyết áp. Theo dõi huyết áp và điều chỉnh liều thuốc hạ huyết áp trong trường hợp cần thiết.
Thuốc lợi tiểu không giữ kali:
Bệnh nhân đang điều trị thuốc lợi tiểu, đặc biệt nếu có suy giảm thể tích và/hoặc muối, có thể bị hạ huyết áp mạnh sau khi khởi trị với thuốc ức chế men chuyển. Khả năng gây hạ huyết áp có thể giảm thiểu bằng cách ngừng sử dụng thuốc lợi tiểu, bù thể tích hoặc muối trước khi khởi trị với liều thấp sau đó tăng dần liều perindopril. Ở các bệnh nhân tăng huyết áp động mạch, khi điều trị lợi tiểu trước đó gây suy giảm thể tích hoặc muối, nên ngưng sử dụng thuốc lợi tiểu trước khi khởi trị với thuốc ức chế men chuyển, sau đó có thể sử dụng một thuốc lợi tiểu không giữ kali hoặc thuốc ức chế men chuyển với liều khởi đầu thấp tiếp đó tăng dần.
Ở các bệnh nhân sử dụng thuốc lợi tiểu trong điều trị suy tim sung huyết, nên khởi trị thuốc ức chế men chuyển ở liều rất thấp, có thể sau khi giảm liều của các thuốc lợi tiểu không giữ kali.
Trong tất cả các trường hợp, chức năng thận (nồng độ creatinin) phải được theo dõi trong suốt những tuần đầu điều trị với thuốc ức chế men chuyển.
Các thuốc lợi tiểu giữ kali (eplerenone, spironolactone):
Với eplerenone hoặc spironolactone ở liều từ 12,5mg đến 50mg mỗi ngày với liều thấp của thuốc ức chế men chuyển:
Trong điều trị suy tim độ II-IV (NYHA) với phân suất tống máu &lt; 40%, và trước đó đã được điều trị với thuốc ức chế men chuyển và lợi tiểu quai, có nguy cơ tăng kali máu, có thể tử vong, đặc biệt với trường hợp không tuân thủ khuyến cáo của điều trị phối hợp này.
Trước khi khởi trị phối hợp này, cần kiểm tra sự không có mặt của tăng kali máu và suy thận. Cần theo dõi chặt chẽ nồng độ kali máu, nồng độ creatinin máu một lần mỗi tuần trong tháng đầu tiên điều trị và hàng tháng sau đó.
Các thuốc chống viêm phi steroid (NSAID) bao gồm cả aspirin với liều ≥ 3g/ngày:
Khi sử dụng đồng thời các thuốc ức chế men chuyển với các thuốc chống viêm phi steroid (ví dụ acid acetyl-salicylic ở liều chống viêm, các thuốc ức chế COX-2 và các NSAID không chọn lọc), tác dụng hạ huyết áp của perindopril có thể bị giảm.
Sử dụng đồng thời các thuốc ức chế men chuyển và NSAID có thể làm tăng nguy cơ giảm chức năng thận, bao gồm suy thận cấp, tăng nồng độ kali huyết thanh, đặc biệt trên bệnh nhân đã có giảm chức năng thận trước đó. Việc kết hợp thuốc nên được áp dụng thận trọng, đặc biệt trên bệnh nhân cao tuổi. Bệnh nhân cần được bù nước thích hợp và nên được theo dõi chức năng thận khi bắt đầu điều trị phối hợp, định kỳ theo dõi sau đó.
Điều trị phối hợp yêu cầu thận trọng:
Thuốc hạ huyết áp và thuốc giãn mạch:
Điều trị đồng thời với các tác nhân này có thể làm tăng hiệu quả hạ huyết áp của perindopril. Sử dụng đồng thời với nitroglycerin và các nitrate khác, hoặc các thuốc giãn mạch, có thể gây giảm thêm mức huyết áp.
Gliptines (linagliptine, saxagliptine, sitagliptine, vildagliptine)
Tăng nguy cơ phù mạch do dipeptidyl peptidase IV (DPP-IV) bị giảm tác động bởi gliptine, ở bệnh nhân điều trị phối hợp với ức chế men chuyển.
Thuốc chống trầm cảm ba vòng/Thuốc chống loạn thần/Thuốc gây mê:
Sử dụng đồng thời các thuốc gây mê, thuốc chống trầm cảm ba vòng và thuốc chống loạn thần với thuốc ức chế men chuyển có thể làm tăng khả năng hạ huyết áp.
Các thuốc giống giao cảm:
Các thuốc giống giao cảm có thể làm giảm tác dụng hạ huyết áp của thuốc ức chế men chuyển.
Vàng:
Các phản ứng nitritoid (triệu chứng bao gồm đỏ bừng mặt, buồn nôn, nôn và hạ huyết áp) đã được ghi nhận hiếm gặp trên các bệnh nhân đang điều trị bằng muối vàng dạng tiêm (natri aurothiomalat) và điều trị đồng thời với các thuốc ức chế men chuyển trong đó có perindopril.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000155'), 'Viên nén bao phim', '2 vỉ x 14 viên', 'Tăng huyết áp
Điều trị tăng huyết áp.
Suy tim
Điều trị suy tim (độ II-IV theo phân loại của Hiệp hội Tim NewYork - NYHA) ở bệnh nhân đang điều trị chuẩn với thuốc lợi tiểu, digitalis kèm với hoặc thuốc chẹn beta hoặc thuốc ức chế men chuyển angiotensin (ACE) nhưng không phải dùng cả hai; không bắt buộc có tất cả điều trị chuẩn này.
Diovan cải thiện tỷ lệ mắc bệnh ở những bệnh nhân này, chủ yếu qua việc làm giảm thời gian nhập viện do suy tim. Diovan còn làm chậm sự tiến triển suy tim, cải thiện độ suy tim chức năng theo phân loại của NYHA, cải thiện phân suất tống máu, giảm dấu hiệu và triệu chứng của suy tim và cải thiện chất lượng sống so với khi dùng giả dược (xem phần DƯỢC LÝ LÂM SÀNG).
Sau nhồi máu cơ tim
Diovan được chỉ định để cải thiện sự sống còn sau nhồi máu cơ tim ở những bệnh nhân ổn định về lâm sàng có các dấu hiệu, triệu chứng hoặc biểu hiện X-quang về suy thất trái và/hoặc có rối loạn chức năng tâm thu thất trái (xem phần DƯỢC LÝ LÂM SÀNG).', 'Được biết quá mẫn cảm với valsartan hoặc với bất kỳ tá dược nào của Diovan.
Phụ nữ có thai (xem phần PHỤ NỮ CÓ KHẢ NĂNG MANG THAI, PHỤ NỮ CÓ THAI, CHO CON BÚ, CÓ KHẢ NĂNG SINH SẢN).
Sử dụng đồng thời thuốc đối kháng thụ thể angiotensin (ARBs) - bao gồm Diovan - hoặc thuốc ức chế men chuyển (ACEIs) với aliskiren ở bệnh nhân đái tháo đường type 2 (xem phần TƯƠNG TÁC THUỐC, mục Thuốc phong tỏa kép hệ Renin Angiotensin RAS).
Bệnh nhân suy gan nặng, xơ gan nặng, xơ gan ứ mật.', 'Trong các nghiên cứu lâm sàng có kiểm chứng trên bệnh nhân bị tăng huyết áp, tần suất chung bị các phản ứng phụ (ADRs) được so sánh với giả dược và phù hợp với tính chất dược lý của valsartan. Tần suất của các phản ứng phụ không liên quan đến liều dùng hoặc thời gian điều trị và cũng cho thấy không có liên quan với giới tính, tuổi tác hoặc chủng tộc.
Các phản ứng phụ được báo cáo từ các nghiên cứu lâm sàng, kinh nghiệm hậu mãi và các kết quả cận lâm sàng được liệt kê dưới đây theo nhóm hệ thống cơ quan.
Các phản ứng phụ được xếp loại theo tần suất, đầu tiên là hay gặp nhất, sử dụng quy ước sau đây: rất hay gặp ( ≥ 1/10); hay gặp ( ≥ 1/100, &lt; 1/10); Ít gặp ( ≥ 1/1.000, &lt; 1/100); hiếm gặp ( ≥ 1/10.000,&lt; 1/1.000); rất hiếm gặp ( &lt; 1/10.000) bao gồm cả các báo cáo lẻ tẻ. Với mỗi nhóm tần suất, các phản ứng phụ được xếp loại theo thứ tự độ nghiêm trọng giảm dần.
Đối với các phản ứng phụ được báo cáo từ kinh nghiệm hậu mãi và các kết quả cận lâm sàng không thể sắp xếp vào bất cứ tần suất phản ứng phụ nào và do đó chúng được đề cập với tần suất “chưa biết”.
Tăng huyết áp
Bảng 1: Phản ứng bất lợi trên tăng huyết áp
Rối loạn về máu và hệ bạch huyết
Chưa biếtGiảm hemoglobin, giảm hematocrit, giảm bạch cầu trung tính, giảm tiểu cầu
Rối loạn về hệ miễn dịch
Chưa biếtQuá mẫn cảm bao gồm bệnh huyết thanh
Rối loạn về chuyển hóa và dinh dưỡng
Chưa biếtTăng kali huyết, hạ natri huyết
Rối loạn về tai và mê đạo
Ít gặpChóng mặt
Rối loạn về mạch
Chưa biếtViêm mạch
Rối loạn về hô hấp, ngực và trung thất
Ít gặpHo
Rối loạn về dạ dày ruột
Ít gặpĐau bụng
Rối loạn về gan mật
Chưa biếtXét nghiệm chức năng gan bất thường bao gồm tăng bilirubin huyết.
Rối loạn về da và mô dưới da
Chưa biếtPhù mạch, viêm da bóng nước, ban, ngứa
Rối loạn về cơ xương và mô liên kết
Chưa biếtĐau cơ
Rối loạn về thận và tiết niệu
Chưa biếtGiảm chức năng thận và suy thận, tăng creatinine huyết.
Rối loạn toàn thân và tình trạng tại chỗ dùng thuốc
Ít gặpMệt mỏi
Các biến cố sau đây cũng được quan sát thấy trong các thử nghiệm lâm sàng trên bệnh nhân tăng huyết áp bất kể mối liên quan của chúng với thuốc nghiên cứu: Đau khớp, suy nhược, đau lưng, tiêu chảy, chóng mặt, đau đầu, mất ngủ, giảm dục năng, buồn nôn, phù, viêm họng, viêm mũi, viêm xoang, nhiễm trùng đường hô hấp trên, nhiễm vi rút.
Suy tim và/hoặc sau nhồi máu cơ tim
Độ an toàn được quan sát thấy trong các nghiên cứu lâm sàng có kiểm soát trên bệnh nhân suy tim và/hoặc sau nhồi máu cơ tim khác với độ an toàn được quan sát thấy ở các bệnh nhân bị tăng huyết áp. Điều này có thể liên quan đến bệnh có sẵn của bệnh nhân. Các phản ứng phụ xảy ra ở các bệnh nhân suy tim và/hoặc sau nhồi máu cơ tim được liệt kê dưới đây.
Bảng 2: Phản ứng bất lợi trên suy tim và/hoặc sau nhồi máu cơ tim
Rối loạn về máu và hệ bạch huyết
Chưa biếtGiảm tiểu cầu
Rối loạn về hệ miễn dịch
Chưa biếtQuá mẫn cảm bao gồm bệnh huyết thanh
Rối loạn về chuyển hóa và dinh dưỡng
Ít gặpTăng kali huyết
Chưa biếtTăng kali huyết, hạ natri huyết
Rối loạn về hệ thần kinh
Hay gặpChóng mặt, chóng mặt khi thay đổi tư thế
Ít gặpNgất, đau đầu
Rối loạn về tai và mê đạo
Ít gặpChóng mặt
Rối loạn về tim
Ít gặpSuy tim
Rối loạn về mạch
Hay gặpHạ huyết áp tư thế
Chưa biếtViêm mạch
Rối loạn về hô hấp, ngực và trung thất
Ít gặpHo
Rối loạn về dạ dày ruột
Ít gặpBuồn nôn, tiêu chảy
Rối loạn về gan mật
Chưa biếtXét nghiệm chức năng gan bất thường
Rối loạn về da và mô dưới da
Ít gặpPhù mạch
Chưa biếtViêm da bóng nước, ban, ngứa
Rối loạn về cơ xương và mô liên kết
Chưa biếtĐau cơ
Rối loạn về thận và tiết niệu
Hay gặpGiảm chức năng thận và suy thận
Ít gặpSuy thận cấp, tăng creatinine huyết
Chưa biếtTăng urê huyết
Rối loạn toàn thân và tình trạng tại chỗ dùng thuốc
Ít gặpSuy nhược, mệt mỏi
Các phản ứng sau đây cũng được quan sát thấy trong các thử nghiệm lâm sàng trên bệnh nhân suy tim và/hoặc sau nhồi máu cơ tim bất kể mối liên quan của chúng với thuốc nghiên cứu: Đau khớp, đau bụng, đau lưng, mất ngủ, bất lực, giảm bạch cầu trung tính, phù, viêm họng, viêm mũi, viêm xoang, nhiễm trùng đường hô hấp trên, nhiễm vi rút.
Thông báo cho bác sĩ những tác dụng không mong muốn gặp phải khi sử dụng thuốc.', 'Liều dùng:
Người lớn
Tăng huyết áp
Liều khuyến cáo của Diovan là 80mg hoặc 160mg viên nén bao phim, 1 lần/ngày, không phân biệt chủng tộc, tuổi hoặc giới tính. Tác dụng chống tăng huyết áp thể hiện rõ trong vòng 2 tuần và tác dụng tối đa ghi nhận được sau 4 tuần, ở những bệnh nhân mà huyết áp không được kiểm soát thỏa đáng, có thể tăng liều hằng ngày đến 320mg viên nén bao phim hoặc có thể thêm thuốc lợi tiểu.
Cũng có thể dùng Diovan với các thuốc chống tăng huyết áp khác.
Suy tim
Liều khởi đầu khuyến cáo của Diovan là 40mg viên nén bao phim, 2 lần/ngày. Tăng liều lên đến 80mg - 160mg, 2 lần/ngày ở bệnh nhân dung nạp được liều cao nhất này. Cần xem xét giảm liều của thuốc lợi tiểu dùng đồng thời. Liều tối đa/ngày được dùng trong các thử nghiệm lâm sàng là 320mg chia làm nhiều lần.
Khi đánh giá bệnh nhân bị suy tim phải luôn bao gồm đánh giá chức năng thận.
Sau nhồi máu cơ tim
Điều trị có thể bắt đầu sớm 12 giờ sau khi bị nhồi máu cơ tim. Sau liều khởi đầu 20mg, 2 lần/ngày, điều trị bằng valsartan nên được điều chỉnh thành 40mg, 80mg và 160mg viên nén bao phim, 2 lần/ngày trong các tuần sau. Liều khởi đầu được cho bằng viên nén 40mg có thể bẻ được.
Liều đích tối đa là 160mg, 2 lần/ngày. Nói chung, bệnh nhân được khuyến cáo đạt được mức liều 80mg, 2 lần/ngày 2 tuần sau khi bắt đầu điều trị và liều đích tối đa đạt được sau 3 tháng, dựa trên sự dung nạp của bệnh nhân đối với valsartan trong suốt thời gian tăng liều. Nếu xảy ra hạ huyết áp triệu chứng hoặc rối loạn chức năng thận cần xem xét giảm liều.Valsartan có thể dùng ở bệnh nhân đã được điều trị bằng các thuốc khác sau nhồi máu cơ tim ví dụ thuốc làm tan huyết khối, acid acetylsalicylic, thuốc chẹn beta hoặc các statin.
Khi đánh giá bệnh nhân bị nhồi máu cơ tim phải luôn bao gồm đánh giá chức năng thận.
Lưu ý đối với tất cả chỉ định: Không cần điều chỉnh liều đối với bệnh nhân bị suy giảm chức năng thận hoặc bệnh nhân bị suy gan không do đường mật và không bị ứ mật.
Sử dụng ở trẻ em và thiếu niên
Độ an toàn và hiệu quả của Diovan chưa được xác định ở trẻ em và thiếu niên (dưới 18 tuổi).
Sử dụng ở bệnh nhân suy thận
Không cần chỉnh liều cho bệnh nhân suy thận có độ thanh thải creatinine &gt; 10ml/phút.
Sử dụng ở bệnh nhân suy gan
Liều dùng không được vượt quá 80mg cho bệnh nhân suy gan nhẹ đến trung bình không kèm theo tắc mật.
Cách dùng
Viên nén bao phim: Diovan nên uống cách xa bữa ăn và nên dùng kèm với nước.
- Quá liều
Quá liều với Diovan có thể gây hạ huyết áp rõ rệt, đưa đến giảm tri giác, trụy tuần hoàn và/hoặc sốc. Nếu mới uống thuốc, cần gây nôn. Mặt khác, điều trị thường dùng là truyền tĩnh mạch dung dịch muối đẳng trương.
Valsartan không chắc được loại bỏ bằng thẩm tách máu.', 'bảo quản trên 30°C, giữ thuốc trong bao bì gốc.', '- Thận trọng khi sử dụng
Đọc kỹ hướng dẫn sử dụng trước khi dùng. Nếu cần thêm thông tin, xin hỏi ý kiến bác sĩ.
Thuốc này chỉ dùng theo sự kê đơn của bác sĩ.
Tăng kali máu
Một số bệnh nhân suy tim đã tăng kali. Những hiện tượng này thường nhẹ và thoáng qua, và có nhiều khả năng xảy ra ở bệnh nhân suy thận từ trước. Giảm liều và/hoặc ngưng Diovan có thể được yêu cầu.
Không khuyến cáo sử dụng đồng thời với các thuốc bổ sung kali, thuốc lợi tiểu giữ kali, các sản phẩm thay thế muối chứa kali, hoặc thuốc khác gây tăng nồng độ kali (như heparin,...). cần thực hiện theo dõi nồng độ kali một cách thích hợp.
Bệnh nhân bị mất natri và/hoặc mất dịch
Ở những bệnh nhân bị mất natri và/hoặc mất dịch trầm trọng như đang điều trị thuốc lợi tiểu liệu cao, có thể gặp hạ huyết áp triệu chứng xảy ra sau khi khởi đầu điều trị bằng Diovan. Mất natri và/hoặc mất dịch cần được điều trị trước khi bắt đầu điều trị bằng Diovan, ví dụ giảm liều thuốc lợi tiểu.
Nếu xảy ra hạ huyết áp, phải đặt bệnh nhân nằm ngửa và nếu cần, truyền tĩnh mạch dung dịch muối đẳng trương. Có thể tiếp tục điều trị một khi huyết áp đã ổn định.
Bệnh nhân hẹp động mạch thận
Dùng Diovan trong thời gian ngắn cho 12 bệnh nhân bị tăng huyết áp do mạch máu thận thứ phát sau hẹp động mạch thận một bên không gây ra thay đổi đáng kể nào về huyết động học ở thận, creatinine huyết thanh hoặc nitơ urê máu (BUN). Tuy nhiên, vì các thuốc khác ảnh hưởng đến hệ renin-angiotensin-aldosterone (RAAS) có thể làm tăng urê máu và creatinine huyết thanh ở những bệnh nhân bị hẹp động mạch thận hai bên hoặc một bên, khuyến cáo theo dõi cả hai thông số trên như là biện pháp an toàn.
Bệnh nhân suy chức năng thận
Không cần chỉnh liều đối với bệnh nhân bị suy thận. Tuy nhiên chưa có dữ liệu về các trường hợp nặng (độ thanh thải creatinine &lt; 10mL/phút), vì vậy nên thận trọng.
Cần tránh sử dụng thuốc đối kháng thụ thể antagonists (ARBs) - bao gồm Diovan - hoặc thuốc ức chế men chuyển (ACEIs) với aliskiren ở bệnh nhân suy thận nặng (tốc độ lọc cầu thận - GFR &lt; 30mL/phút) (xem phần TƯƠNG TÁC THUỐC, mục thuốc phong tỏa kép hệ Renin Angiotensin RAS).
Bệnh nhân suy gan
Không cần chỉnh liều đối với bệnh nhân bị suy gan. Valsartan hầu như được bài tiết trong mật dưới dạng không đổi, và bệnh nhân bị bệnh nghẽn mật cho thấy độ thanh thải valsartan thấp hơn (xem phần DƯỢC LÝ LÂM SÀNG), cần thận trọng đặc biệt khi dùng valsartan cho bệnh nhân bị tắc nghẽn đường mật.
Bệnh nhân suy tim/sau nhồi máu cơ tim
Sử dụng Diovan ở những bệnh nhân bị suy tim hoặc sau nhồi máu cơ tim thường dẫn đến giảm phần nào về huyết áp, nhưng việc ngừng dùng Diovan do hạ huyết áp triệu chứng đang diễn tiến thường không cần thiết miễn là dùng liều theo đúng chỉ dẫn.
Cần thận trọng khi bắt đầu điều trị ở bệnh nhân bị suy tim hoặc sau nhồi máu cơ tim (xem phần LIỀU LƯỢNG VÀ CÁCH DÙNG).
Là hậu quả của sự ức chế hệ renin-angiotensin-aldosterone (RASS), các thay đổi về chức năng thận có thể đoán trước được ở những bệnh nhân nhạy cảm. Ở bệnh nhân bị suy tim nặng mà chức năng thận của họ có thể phụ thuộc vào hoạt động của hệ renin-angiotensin-aldosterone, việc điều trị bằng các thuốc ức chế men chuyển angiotensin (ACE) hoặc các thuốc đối kháng thụ thể angiotensin có liên quan với thiểu niệu và/hoặc tăng nitơ huyết và (hiếm gặp) suy thận cấp và/hoặc tử vong. Khi đánh giá bệnh nhân bị suy tim hoặc sau nhồi máu cơ tim phải luôn đánh giá chức năng thận.
Ở bệnh nhân bị suy tim, cần thận trọng khi phối hợp ba loại gồm thuốc ức chế men chuyển angiotensin, thuốc chẹn beta và valsartan (xem phần DƯỢC LÝ LÂM SÀNG).
Phù mạch
Phù mạch, bao gồm sưng thanh quản và thanh môn, gây tắc nghẽn đường thở và/hoặc sưng mặt, môi, cổ họng, và/hoặc lưỡi đã được báo cáo ở những bệnh nhân được điều trị với valsartan, một số những bệnh nhân này trước đây đã từng bị phù mạch khi dùng các thuốc khác bao gồm cả thuốc ức chế men chuyển angiotensin. Diovan nên được ngưng ngay lập tức ở những bệnh nhân bị phù mạch, và không nên tái sử dụng Diovan nữa.
Thuốc phong tỏa kép hệ Renin - Angiotensin (RAS)
Cần thận trọng khi sử dụng đồng thời thuốc đối kháng thụ thể Angiotensin (ARBs), bao gồm Diovan, với các thuốc khác phong tỏa hệ RAS như thuốc ức chế men chuyển (ACEIs) hoặc Aliskiren (xem phần TƯƠNG TÁC THUỐC, mục Thuốc phong tỏa kép hệ Renin-Angiotensin).
- Thai kỳ và cho con bú
Phụ nữ có khả năng mang thai
Tương tự như bất kỳ loại thuốc nào có tác động trực tiếp trên RAAS, Diovan không nên được sử dụng ở phụ nữ có dự định mang thai. Các bác sĩ khi kê toa bất kỳ tác nhân nào tác động lên RAAS nên tư vấn cho các phụ nữ có khả năng mang thai về nguy cơ tiềm ẩn của các thuốc này trong thời gian mang thai.
Phụ nữ có thai
Tương tự như bất kỳ loại thuốc nào có tác động trực tiếp trên RAAS, Diovan không được sử dụng trong thời kỳ mang thai (xem phần CHỐNG CHỈ ĐỊNH). Do cơ chế tác dụng của các thuốc đối kháng angiotensin II, không thể loại trừ nguy cơ đối với thai. Đã ghi nhận tác dụng của các thuốc ức chế men chuyển angiotensin (nhóm thuốc đặc trị tác dụng trên hệ renin-angiotensin-aldosterone) trong 3 tháng giữa và 3 tháng cuối thai kỳ gây tổn thương và chết đối với thai đang phát triển trong tử cung. Hơn nữa, theo các dữ liệu hồi cứu, việc sử dụng các thuốc ức chế men chuyển angiotensin trong 3 tháng đầu thai kỳ có liên quan đến nguy cơ tiềm tàng của những khiếm khuyết ở trẻ sơ sinh. Đã có báo cáo về sảy thai tự phát, ít nước ối và rối loạn chức năng thận ở trẻ mới sinh khi người phụ nữ có thai vô ý dùng valsartan. Nếu phát hiện có thai khi đang điều trị thì phải ngừng Diovan càng sớm càng tốt (xem phần DỮ LIỆU AN TOÀN TIỀN LÂM SÀNG).
Cho con bú
Chưa rõ có phải valsartan được bài tiết vào sữa mẹ hay không. Do valsartan được bài tiết vào sữa của chuột nuôi con bú, không khuyên dùng Diovan ở bà mẹ đang cho con bú.
Khả năng sinh sản
Không có thông tin về tác động của valsartan trên khả năng sinh sản của con người. Các nghiên cứu ở chuột không hiển thị bất kỳ ảnh hưởng nào của valsartan về khả năng sinh sản (xem phần DỮ LIỆU AN TOÀN TIỀN LÂM SÀNG).
- Khả năng lái xe và vận hành máy móc
Cũng như các thuốc chống tăng huyết áp khác, cần thận trọng khi lái xe hoặc vận hành máy móc.
- Tương tác thuốc
Thuốc phong tỏa kép hệ Renin - Angiotensin (RAS) bao gồm thuốc đối kháng thụ thể của Angiontensin, thuốc ức chế men chuyển, hoặc Aliskiren:
Việc sử dụng đồng thời thuốc đối kháng với thụ thể Angiotensin,bao gồm Diovan, với các tác nhân khác tác động lên hệ Renin-Angiotensin có liên quan đến gia tăng tỉ lệ tụt huyết áp, tăng kali máu, và thay đổi chức năng thận so với đơn trị liệu. Do đó cần khuyến cáo theo dõi huyết áp chức năng thận và điện giải ở bệnh nhân dùng Diovan và các thuốc khác tác động lên hệ RAS (xem phần CẢNH BÁO VÀ THẬN TRỌNG).
Việc sử dụng đồng thời thuốc đối kháng thụ thể Angiotensin (ARB) bao gồm Diovan - hoặc thuốc ức chế men chuyển (ACEIs) với aliskiren, cần tránh ở những bệnh nhân suy thận nặng (GFR &lt; 30mL/phút) (xem phần CẢNH BÁO VÀ THẬN TRỌNG).
Việc sử dụng đồng thời ARB - bao gồm cả Diovan - hoặc ACEIs với aliskiren là chống chỉ định với những bệnh nhân bị đái tháo đường type 2 (xem phần CHỐNG CHỈ ĐỊNH).
Kali: Dùng đồng thời với các thuốc lợi tiểu giữ kali (ví dụ spironolactone, triamterene, amiloride), các thuốc bổ sung kali hoặc các chất muối thay thế chứa kali hoặc các thuốc có thể làm tăng nồng độ kali khác (như heparin) có thể dẫn đến tăng kali huyết thanh và ở bệnh nhân suy tim dẫn đến tăng creatinine huyết thanh. Nếu việc dùng đồng thời các thuốc này là cần thiết thì cần phải theo dõi kali huyết thanh.
Thuốc chống viêm không steroid (NSAIDs) bao gồm nhóm ức chế chọn lọc cyclooxygenase-2 (ức chế COX-2):
Khi sử dụng đồng thời thuốc đối kháng angiotensin II với các thuốc NSAIDs, sự giảm hiệu quả hạ huyết áp có thể xảy ra.
Hơn nữa, ở những bệnh nhân cao tuổi, suy giảm thể tích tuần hoàn (bao gồm cả bệnh nhân điều trị lợi tiểu), hoặc có tổn thương chức năng thận, sử dụng đồng thời các thuốc đối kháng angiotensin II và NSAID có thể dẫn đến tăng nguy cơ suy giảm trầm trọng chức năng thận. Vì vậy, theo dõi chức năng thận được khuyến cáo khi bắt đầu hoặc thay đổi điều trị ở bệnh nhân sử dụng valsartan dùng đồng thời với NSAIDs.
Lithium: Tăng có hồi phục nồng độ Lithium trong máu và độc tính đã được báo cáo khi dùng đồng thời Lithium với các thuốc ức chế men chuyển hoặc ức chế thụ thể Angiotensin II bao gồm cả Diovan. Do đo, khuyến khích theo dõi cẩn thận nồng độ Lithiumtrong máu khi dùng kết hợp. Nếu một thuốc lợi tiểu cũng được sử dụng, nguy cơ ngộ độc Lithium có thể tăng hơn với Diovan.
Các chất vận chuyển:
Kết quả từ một nghiên cứu trong ống nghiệm trên mô gan người cho thấy valsartan là một chất nền của chất vận chuyển hấp thu thuốc vào bên trong gan OATP1B1 và chất vận chuyển thuốc ra ngoài gan MRP2. Điều trị đồng thời các chất ức chế chất vận chuyển thuốc vào trong gan (như rifampin, ciclosporin) hoặc chất vận chuyển ra ngoài gan (ritonavir) có thể làm tăng nồng độ valsartan trong cơ thể.
Vì valsartan không được chuyển hóa ở một mức độ đáng kể, không có khả năng có tương tác thuốc - thuốc với valsartan trên lâm sàng với thuốc cảm ứng hoặc ức chế hệ cytochrome P450. Mặc dù valsartan gắn mạnh vào protein huyết tương, các nghiên cứu in vitro không cho thấy tương tác nào ở dạng này với một loạt các phân tử cũng gắn mạnh vào protein huyết tương như diclofenac, furosemide và warfarin.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000142'), 'Viên nén bao phim', '2 vỉ x 14 viên', 'Tăng huyết áp
Điều trị tăng huyết áp.
Suy tim
Điều trị suy tim (độ II - IV theo phân loại của Hiệp hội Tim New York - NYHA) ở bệnh nhân đang điều trị chuẩn với thuốc lợi tiểu, digitalis kèm với hoặc thuốc chẹn beta hoặc thuốc ức chế men chuyển angiotensin (ACE) nhưng không phải dùng cả hai; không bắt buộc có tất cả điều trị chuẩn này.
Diovan cải thiện tỷ lệ mắc bệnh ở những bệnh nhân này, chủ yếu qua việc làm giảm thời gian nhập viện do suy tim. Diovan còn làm chậm sự tiến triển suy tim, cải thiện độ suy tim chức năng theo phân loại của NYHA, cải thiện phân suất tống máu, giảm dấu hiệu và triệu chứng của suy tim và cải thiện chất lượng sống so với khi dùng giả dược (xem phần ĐẶC TÍNH DƯỢC LỰC HỌC).
Sau nhồi máu cơ tim
Diovan được chỉ định để cải thiện sự sống còn sau nhồi máu cơ tim ở những bệnh nhân ổn định về lâm sàng có các dấu hiệu, triệu chứng hoặc biểu hiện X-quang về suy thất trái và/hoặc có rối loạn chức năng tâm thu thất trái (xem phần ĐẶC TÍNH DƯỢC LỰC HỌC).', 'Được biết quá mẫn cảm với valsartan hoặc với bất kỳ tá dược nào của Diovan.
Phụ nữ có thai (xem phần PHỤ NỮ CÓ KHẢ NĂNG MANG THAI, PHỤ NỮ CÓ THAI, CHO CON BÚ, VÀ KHẢ NĂNG SINH SẢN).
Sử dụng đồng thời thuốc đối kháng thụ thể angiotensin (ARB) - bao gồm Diovan - hoặc thuốc ức chế men chuyển (ACEI) với aliskiren ở bệnh nhân đái tháo đường type 2 (xem phần TƯƠNG TÁC,TƯƠNG KỴ CỦA THUỐC, mục Thuốc phong tỏa kép hệ Renin Angiotensin RAS).
Bệnh nhân suy gan nặng, xơ gan nặng, xơ gan ứ mật.', 'Trong các nghiên cứu lâm sàng có kiểm chứng trên bệnh nhân bị tăng huyết áp, tần suất chung bị các phản ứng phụ (ADRs) được so sánh với giả dược và phù hợp với tính chất dược lý của valsartan. Tần suất của các phản ứng phụ không liên quan đến liều dùng hoặc thời gian điều trị và cũng cho thấy không có liên quan với giới tính, tuổi tác hoặc chủng tộc.
Các phản ứng phụ được báo cáo từ các nghiên cứu lâm sàng, kinh nghiệm hậu mãi và các kết quả cận lâm sàng được liệt kê dưới đây theo nhóm hệ thống cơ quan.
Các phản ứng phụ được xếp loại theo tần suất, đầu tiên là hay gặp nhất, sử dụng quy ước sau đây: rất hay gặp (≥ 1/10); hay gặp (≥ 1/100 và &lt; 1/10); ít gặp (≥ 1/1,000 và &lt; 1/100); hiếm gặp (≥ 1/10,000 và &lt; 1/1,000); rất hiếm gặp (&lt; 1/10,000) bao gồm cả các báo cáo lẻ tẻ. Với mỗi nhóm tần suất, các phản ứng phụ được xếp loại theo thứ tự độ nghiêm trọng giảm dần.
Đối với các phản ứng phụ được báo cáo từ kinh nghiệm hậu mãi và các kết quả cận lâm sàng không thể sắp xếp vào bất cứ tần suất phản ứng phụ nào và do đó chúng được đề cập với tần suất “chưa biết”.
Tăng huyết áp
Bảng 1: Phản ứng bất lợi trên tăng huyết áp
Rối loạn về máu và hệ bạch huyết
Chưa biết: Giảm hemoglobin, giảm hematocrit, giảm bạch cầu đa nhân trung tính, giảm tiểu cầu
Rối loạn về hệ miễn dịch
Chưa biết: Quá mẫn cảm bao gồm bệnh huyết thanh
Rối loạn về chuyển hóa và dinh dưỡng
Chưa biết: Tăng kali huyết, hạ natri huyết
Rối loạn về tai và mê đạo
Ít gặp: Chóng mặt
Rối loạn về mạch máu
Chưa biết: Viêm mạch máu
Rối loạn về hô hấp, ngực và trung thất
Ít gặp: Ho
Rối loạn về tiêu hóa
Ít gặp: Đau bụng
Rối loạn về gan mật
Chưa biết: Xét nghiệm chức năng gan bất thường bao gồm tăng bilirubin huyết.
Rối loạn về da và mô dưới da
Chưa biết: Phù mạch, viêm da bóng nước, ban, ngứa
Rối loạn về cơ xương và mô liên kết
Chưa biết: Đau cơ
Rối loạn về thận và tiết niệu
Chưa biết: Giảm chức năng thận và suy thận, tăng creatinine huyết
Rối loạn toàn thân và tình trạng tại chỗ dùng thuốc
Ít gặp: Mệt mỏi
Các biến cố sau đây cũng được quan sát thấy trong các thử nghiệm lâm sàng trên bệnh nhân tăng huyết áp bất kể mối liên quan của chúng với thuốc nghiên cứu: đau khớp, suy nhược, đau lưng, tiêu chảy, chóng mặt, đau đầu, mất ngủ, giảm dục năng, buồn nôn, phù, viêm họng, viêm mũi, viêm xoang, nhiễm trùng đường hô hấp trên, nhiễm vi rút.
Suy tim và/hoặc sau nhồi máu cơ tim
Độ an toàn được quan sát thấy trong các nghiên cứu lâm sàng có kiểm soát trên bệnh nhân suy tim và/hoặc sau nhồi máu cơ tim khác với độ an toàn được quan sát thấy ở các bệnh nhân bị tăng huyết áp. Điều này có thể liên quan đến bệnh có sẵn của bệnh nhân. Các phản ứng phụ xảy ra ở các bệnh nhân suy tim và/hoặc sau nhồi máu cơ tim được liệt kê dưới đây.
Bảng 2: Phản ứng bất lợi trên suy tim và/hoặc sau nhồi
máu cơ tim
Rối loạn về máu và hệ bạch huyết
Chưa biết: Giảm tiểu cầu
Rối loạn về hệ miễn dịch
Chưa biết: Quá mẫn cảm bao gồm bệnh huyết thanh
Rối loạn về chuyển hóa và dinh dưỡng
Ít gặp: Tăng kali huyết#
Rối loạn về hệ thần kinh
Hay gặp: Chóng mặt, chóng mặt khi thay đổi tư thế
Ít gặp: Ngất, đau đầu
Rối loạn về tai và mê đạo
Ít gặp: Chóng mặt
Rối loạn về tim
Ít gặp: Suy tim
Rối loạn về mạch máu
Hay gặp: Hạ huyết áp, hạ huyết áp tư thế đứng
Chưa biết: Viêm mạch máu
Rối loạn về hô hấp, ngực và trung thất
Ít gặp: Ho
Rối loạn về tiêu hóa
Ít gặp: Buồn nôn, tiêu chảy
Rối loạn về gan mật
Chưa biết: Xét nghiệm chức năng gan bất thường
Rối loạn về da và mô dưới da
Ít gặp: Phù mạch
Chưa biết: Viêm da bóng nước, ban, ngứa
Rối loạn về cơ xương và mô liên kết
Chưa biết: Đau cơ
Rối loạn về thận và tiết niệu
Hay gặp: Giảm chức năng thận và suy thận
Ít gặp: Suy thận cấp, tăng creatinine huyết
Chưa biết: Tăng Urê huyết
Rối loạn toàn thân và tình trạng tại chỗ dùng thuốc
Ít gặp: Suy nhược, mệt mỏi
# Tăng kali huyết (chưa biết tần suất) - theo báo cáo sau khi
đưa thuốc ra thị trường.
Các phản ứng sau đây cũng được quan sát thấy trong các thử nghiệm lâm sàng trên bệnh nhân suy tim và/hoặc sau nhồi máu cơ tim bất kể mối liên quan của chúng với thuốc nghiên cứu: đau khớp, đau bụng, đau lưng, mất ngủ, bất lực, giảm bạch cầu trung tính, phù, viêm họng, viêm mũi, viêm xoang, nhiễm trùng đường hô hấp trên, nhiễm vi rút.', 'Liều dùng
Người lớn
Tăng huyết áp
Liều khuyến cáo của Diovan là 80mg hoặc 160mg viên nén bao phim, 1 lần/ngày, không phân biệt chủng tộc, tuổi hoặc giới tính. Tác dụng chống tăng huyết áp thể hiện rõ trong vòng 2 tuần và tác dụng tối đa ghi nhận được sau 4 tuần, ở những bệnh nhân mà huyết áp không được kiểm soát thỏa đáng, có thể tăng liều hàng ngày đến 320mg viên nén bao phim hoặc có thể thêm thuốc lợi tiểu.
Cũng có thể dùng Diovan với các thuốc chống tăng huyết áp khác.
Suy tim
Liều khởi đầu khuyến cáo của Diovan là 40mg viên nén bao phim, 2 lần/ngày. Tăng liều lên đến 80mg - 160mg, 2 lần/ngày ở bệnh nhân dung nạp được liều cao nhất này. Cần xem xét giảm liều của thuốc lợi tiểu dùng đồng thời. Liều tối đa/ngày được dùng trong các thử nghiệm lâm sàng là 320mg chia làm nhiều lần.
Khi đánh giá bệnh nhân bị suy tim phải luôn bao gồm đánh giá chức năng thận.
Sau nhồi máu cơ tim
Điều trị có thể bắt đầu sớm 12 giờ sau khi bị nhồi máu cơ tim. Sau liều khởi đầu 20mg, 2 lần/ngày, điều trị bằng valsartan nên được điều chỉnh thành 40mg, 80mg và 160mg viên nén bao phim, 2 lần/ngày trong các tuần sau. Liều khởi đầu được cho bằng viên nén 40mg có thể bẻ được.
Liều đích tối đa là 160mg, 2 lần/ngày. Nói chung, bệnh nhân được khuyến cáo đạt được mức liều 80mg, 2 lần/ngày 2 tuần sau khi bắt đầu điều trị và liều đích tối đa đạt được sau 3 tháng, dựa trên sự dung nạp của bệnh nhân đối với valsartan trong suốt thời gian tăng liều. Nếu xảy ra hạ huyết áp triệu chứng hoặc rối loạn chức năng thận cần xem xét giảm liều.
Valsartan có thể dùng ở bệnh nhân đã được điều trị bằng các thuốc khác sau nhồi máu cơ tim ví dụ thuốc làm tan huyết khối, acid acetylsalicylic, thuốc chẹn beta hoặc các statin.
Khi đánh giá bệnh nhân bị nhồi máu cơ tim phải luôn bao gồm đánh giá chức năng thận.
LƯU Ý đối với tất cả chỉ định: không cần điều chỉnh liều đối với bệnh nhân bị suy giảm chức năng thận hoặc bệnh nhân bị suy gan không do đường mật và không bị ứ mật.
Sử dụng ở trẻ em và thiếu niên
Độ an toàn và hiệu quả của Diovan chưa được xác định ở trẻ em và thiếu niên (dưới 18 tuổi).
Sử dụng ở bệnh nhân suy thận
Không cần chỉnh liều cho bệnh nhân suy thận có độ thanh thải creatinine &gt; 10 ml/phút.
Sử dụng ở bệnh nhân suy gan
Liều dùng không được vượt quá 80mg cho bệnh nhân suy gan nhẹ đến trung bình không kèm theo tắc mật.
Cách dùng
Diovan nên uống cách xa bữa ăn và nên dùng kèm với nước.
- Quá liều
Quá liều với Diovan có thể gây hạ huyết áp rõ rệt, đưa đến giảm tri giác, trụy tuần hoàn và/hoặc sốc. Nếu mới uống thuốc, cần gây nôn. Mặt khác, điều trị thường dùng là truyền tĩnh mạch dung dịch muối đẳng trương.
Valsartan không chắc được loại bỏ bằng thẩm tách máu.', 'bảo quản trên 30°C, giữ thuốc trong bao bì gốc.', '- Thận trọng khi sử dụng
Tăng kali máu
Một số bệnh nhân suy tim đã tăng kali. Những hiện tượng này thường nhẹ và thoáng qua, và có nhiều khả năng xảy ra ở bệnh nhân suy thận từ trước. Giảm liều và/hoặc ngưng Diovan có thể được yêu cầu.
Không khuyến cáo sử dụng đồng thời với các thuốc bổ sung kali, thuốc lợi tiểu giữ kali, các sản phẩm thay thế muối chứa kali, hoặc thuốc khác gây tăng nồng độ kali (như heparin,...). Cần thực hiện theo dõi nồng độ kali một cách thích hợp.
Bệnh nhân bị mất natri và/hoặc mất dịch
Ở những bệnh nhân bị mất natri và/hoặc mất dịch trầm trọng như đang điều trị thuốc lợi tiểu liều cao, có thể gặp hạ huyết áp triệu chứng xảy ra sau khi khởi đầu điều trị bằng Diovan. Mất natri và/hoặc mất dịch cần được điều trị trước khi bắt đầu điều trị bằng Diovan, ví dụ giảm liều thuốc lợi tiểu.
Nếu xảy ra hạ huyết áp, phải đặt bệnh nhân nằm ngửa và nếu cần, truyền tĩnh mạch dung dịch muối đẳng trương. Có thể tiếp tục điều trị một khi huyết áp đã ổn định.
Bệnh nhân hẹp động mạch thận
Dùng Diovan trong thời gian ngắn cho 12 bệnh nhân bị tăng huyết áp do mạch máu thận thứ phát sau hẹp động mạch thận một bên không gây ra thay đổi đáng kể nào về huyết động học ở thận, creatinine huyết thanh hoặc nitơ urê máu (BUN). Tuy nhiên, vì các thuốc khác ảnh hưởng đến hệ renin-angiotensin-aldosterone (RAAS) có thể làm tăng urê máu và creatinine huyết thanh ở những bệnh nhân bị hẹp động mạch thận hai bên hoặc một bên, khuyên cáo theo dõi cả hai thông số trên như là biện pháp an toàn.
Bệnh nhân suy chức năng thận
Không cần chỉnh liều đối với bệnh nhân bị suy thận. Tuy nhiên chưa có dữ liệu về các trường hợp nặng (độ thanh thải creatinine &lt; 10 ml/phút), vì vậy nên thận trọng.
Cần tránh sử dụng thuốc đối kháng thụ thể antagonists (ARB) - bao gồm Diovan - hoặc thuốc ức chế men chuyển (ACEI) với aliskiren ở bệnh nhân suy thận nặng (tốc độ lọc cầu thận - GFR &lt; 30 ml/phút) (xem phần TƯƠNG TÁC, TƯƠNG KỴ CỦA THUỐC, mục thuốc phong tỏa kép hệ Renin Angiotensin RAS).
Bệnh nhân suy gan
Không cần chỉnh liều đối với bệnh nhân bị suy gan. Valsartan hầu như được bài tiết trong mật dưới dạng không đổi, và bệnh nhân bị bệnh nghẽn mật cho thấy độ thanh thải valsartan thấp hơn (xem phần ĐẶC TÍNH DƯỢC ĐỘNG HỌC). Cần thận trọng đặc biệt khi dùng valsartan cho bệnh nhân bị tắc nghẽn đường mật.
Bệnh nhân suy tim/sau nhồi máu cơ tim
Sử dụng Diovan ở những bệnh nhân bị suy tim hoặc sau nhồi máu cơ tim thường dẫn đến giảm phần nào về huyết áp, nhưng việc ngừng dùng Diovan do hạ huyết áp triệu chứng đang diễn tiến thường không cần thiết miễn là dùng liều theo đúng chỉ dẫn.
Cần thận trọng khi bắt đầu điều trị ở bệnh nhân bị suy tim hoặc sau nhồi máu cơ tim (xem phần LIỀU LƯỢNG VÀ CÁCH DÙNG).
Là hậu quả của sự ức chế hệ renin-angiotensin-aldosterone (RAAS), các thay đổi về chức năng thận có thể đoán trước được ở những bệnh nhân nhạy cảm. Ở bệnh nhân bị suy tim nặng mà chức năng thận của họ có thể phụ thuộc vào hoạt động của hệ renin-angiotensin-aldosterone, việc điều trị bằng các thuốc ức chế men chuyển angiotensin (ACE) hoặc các thuốc đối kháng thụ thể angiotensin có liên quan với thiểu niệu và/hoặc tăng nitơ huyết và (hiếm gặp) suy thận cấp và/hoặc tử vong. Khi đánh giá bệnh nhân bị suy tim hoặc sau nhồi máu cơ tim phải luôn đánh giá chức năng thận.
Ở bệnh nhân bị suy tim, cần thận trọng khi phối hợp ba loại gồm thuốc ức chế men chuyển angiotensin, thuốc chẹn beta và valsartan (xem phần ĐẶC TÍNH DƯỢC LỰC HỌC).
Phù mạch
Phù mạch, bao gồm sưng thanh quản và thanh môn, gây tắc nghẽn đường thở và/hoặc sưng mặt, môi, cổ họng, và/hoặc lưỡi đã được báo cáo ở những bệnh nhân được điều trị với valsartan, một số những bệnh nhân này trước đây đã từng bị phù mạch khi dùng các thuốc khác bao gồm cả thuốc ức chế men chuyển angiotensin. Diovan nên được ngưng ngay lập tức ở những bệnh nhân bị phù mạch, và không nên tái sử dụng Diovan nữa.
Thuốc phong tỏa kép hệ Renin - Angiotensin (RAS)
Cần thận trọng khi sử dụng đồng thời thuốc đối kháng thụ thể Angiotensin (ARB), bao gồm Diovan với các thuốc khác phong tỏa hệ RAS như thuốc ức chế men chuyển (ACEI) hoặc Aliskiren (xem phần TƯƠNG TÁC, TƯƠNG KỴ CỦA THUỐC, mục Thuốc phong tỏa kép hệ Renin - Angiotensin).
- Thai kỳ và cho con bú
Phụ nữ có thai
Tóm tắt nguy cơ
Tương tự như bất kỳ loại thuốc nào có tác động trực tiếp trên RAAS, Diovan không được sử dụng trong thời kỳ mang thai (xem phần CHỐNG CHỈ ĐỊNH). Do cơ chế tác dụng của các thuốc đối vận angiotensin II, không thể loại trừ nguy cơ đối với thai. Đã ghi nhận tác dụng của các thuốc ức chế men chuyển angiotensin (nhóm thuốc đặc hiệu tác dụng trên hệ renin-angiotensin-aldosterone) trong 3 tháng giữa và 3 tháng cuối thai kỳ gây tổn thương và chết đối với thai đang phát triển trong tử cung. Hơn nữa, theo các dữ liệu hồi cứu, việc sử dụng các thuốc ức chế men chuyển angiotensin trong 3 tháng đầu thai kỳ có liên quan đến nguy cơ tiềm ẩn của những khiếm khuyết ở trẻ sơ sinh. Đã có báo cáo về sảy thai tự phát, ít nước ối và rối loạn chức năng thận ở trẻ mới sinh khi người phụ nữ có thai vô ý dùng valsartan. Nếu phát hiện có thai khi đang điều trị thì phải ngừng Diovan càng sớm càng tốt (xem phần DỮ LIỆU TRÊN ĐỘNG VẬT).
Cân nhắc lâm sàng
Nguy cơ của mẹ và/hoặc phối thai/thai nhi có liên quan đến bệnh tật
Tăng huyết áp trong thai kỳ làm tăng nguy cơ mắc tiền sản giật, tiểu đường thai kỳ, sinh non và biến chứng khi sinh của mẹ (ví dụ: yêu cầu mổ lấy thai, và xuất huyết sau sinh). Tăng huyết áp làm tăng nguy cơ của thai nhi bị hạn chế tăng trưởng trong tử cung và tử vong trong tử cung.
Nguy cơ của thai nhi/trẻ sơ sinh
Chứng ít nước ối ở phụ nữ có thai dùng thuốc ảnh hưởng đến hệ renin-angiotensin trong thai kỳ thứ hai và thai kỳ thứ ba có thể dẫn đến: giảm chức năng thận của thai nhi dẫn đến vô niệu và suy thận, suy phổi thai nhi, biến dạng xương, bao gồm suy sản hộp sọ, hạ huyết áp và tử vong.
Trong trường hợp mẹ vô tình dùng nhầm thuốc nhóm ARB, cần phải xem xét theo dõi thai nhi thích hợp.
Trẻ sơ sinh có mẹ đã dùng trị liệu ARB nên được theo dõi chặt chẽ tình trạng tụt huyết áp.
Cho con bú
Tóm tắt nguy cơ
Chưa rõ có phải valsartan được bài tiết vào sữa mẹ hay không. Do valsartan được bài tiết vào sữa của chuột cống nuôi con bú, không khuyên dùng Diovan ở bà mẹ đang cho con bú. Khả năng sinh sản ở nam và nữ giới Tương tự như bất cứ loại thuốc nào tác động trực tiếp trên hệ RAAS, Diovan không nên được sử dụng ở phụ nữ có dự định có thai. Nhân viên y tế khi kê đơn bất kỳ hoạt chất nào tác động lên hệ RAAS nên tư vấn cho phụ nữ có khả năng sinh sản về nguy cơ tiềm ẩn của các hoạt chất này trong thai kỳ.Khả năng sinh sản
Không có thông tin về tác động của valsartan trên khả năng sinh sản của con người. Các nghiên cứu ở chuột không hiển thị bất kỳ ảnh hưởng nào của valsartan về khả năng sinh sản (xem phần DỮ LIỆU AN TOÀN TIỀN LÂM SÀNG).
Dữ liệu trên động vật
Trong các nghiên cứu phát triển phôi thai ở chuột nhắt, chuột cống và thỏ, đã quan sát thấy hiện tượng quái thai liên quan đến độc tính trên mẹ ở chuột cống với liều valsartan 600 mg/kg/ngày, khoảng 6 lần liều tối đa khuyến cáo trên người theo cách tính liều theo mg/m2 (tính toán giả định một liều uống 320 mg/ngày trên bệnh nhân 60 kg) và ở thỏ liều 10mg/kg/ngày, khoảng 0,6 lần liều tối đa khuyến cáo trên người theo cách tính liều theo mg/m2 (tính toán giả định một liều uống 320 mg/ngày trên bệnh nhân 60 kg). Không có bằng chứng về độc tính trên mẹ hay hiện tượng quái thai ở chuột nhắt với mức liều lên đến 600mg/kg/ngày, xấp xỉ 9 lần liều tối đa khuyến cáo trên người theo cách tính liều theo mg/m2 (tính toán giả định một liều uống 320 mg/ngày trên bệnh nhân 60 kg).
- Khả năng lái xe và vận hành máy móc
Cũng như các thuốc chống tăng huyết áp khác, cần thận trọng khi lái xe hoặc vận hành máy móc.
- Tương tác thuốc
Thuốc phong tỏa kép hệ Renin - Angiotensin (RAS) bao gồm thuốc đối kháng thụ thể của Angiotensin, thuốc ức chế men chuyển, hoặc Aliskiren:
Việc sử dụng đồng thời thuốc đối kháng với thụ thể Angiotensin, bao gồm Diovan, với các tác nhân khác tác động lên hệ Renin -Angiotensin có liên quan đến gia tăng tỉ lệ tụt huyết áp, tăng kali máu, và thay đổi chức năng thận so với đơn trị liệu. Do đó cần khuyến cáo theo dõi huyết áp, chức năng thận và điện giải ở bệnh nhân dùng Diovan và các thuốc khác tác động lên hệ RAS (xem phần CẢNH BÁO VÀ THẬN TRỌNG).
Việc sử dụng đồng thời thuốc đối kháng thụ thể Angiotensin (ARB) bao gồm Diovan - hoặc thuốc ức chế men chuyển (ACEI) với aliskiren, cần tránh ở những bệnh nhân suy thận nặng (GFR &lt; 30 ml/phút) (xem phần CẢNH BÁO VÀ THẬN TRỌNG).
Việc sử dụng đồng thời ARB - bao gồm cả Diovan - hoặc ACEIs với aliskiren là chống chỉ định với những bệnh nhân bị đái tháo đường type 2 (xem phần CHỐNG CHỈ ĐỊNH).
Kali: Dùng đồng thời với các thuốc lợi tiểu giữ kali (ví dụ spironolactone, triamterene, amiloride), các thuốc bổ sung kali hoặc các chất muối thay thế chứa kali hoặc các thuốc có thể làm tăng nồng độ kali khác (như heparin) có thể dẫn đến tăng kali huyết thanh và ở bệnh nhân suy tim dẫn đến tăng creatinine huyết thanh. Nếu việc dùng đồng thời các thuốc này là cần thiết thì cần phải theo dõi kali huyết thanh.
Thuốc chống viêm không steroid (NSAIDs) bao gồm nhóm ức chế chọn lọc cyclooxygenase-2 (ức chế COX-2): Khi sử dụng đồng thời thuốc đối kháng angiotensin II với các thuốc NSAID, sự giảm hiệu quả hạ huyết áp có thể xảy ra.
Hơn nữa, ở những bệnh nhân cao tuổi, suy giảm thể tích tuần hoàn (bao gồm cả bệnh nhân điều trị lợi tiểu), hoặc có tổn thương chức năng thận, sử dụng đồng thời các thuốc đối kháng angiotensin II và NSAID có thể dẫn đến tăng nguy cơ suy giảm trầm trọng chức năng thận. Vì vậy, theo dõi chức năng thận được khuyến cáo khi bắt đầu hoặc thay đổi điều trị ở bệnh nhân sử dụng valsartan dùng đồng thời với NSAID.
Lithium: Tăng có hồi phục nồng độ Lithium trong máu và độc tính đã được báo cáo khi dùng đồng thời Lithium với các thuốc ức chế men chuyển hoặc ức chế thụ thể Angiotensin II bao gồm cả Diovan. Do đó, khuyến khích theo dõi cẩn thận nồng độ Lithium trong máu khi dùng kết hợp. Nếu một thuốc lợi tiểu cũng được sử dụng, nguy cơ ngộ độc Lithium có thể tăng hơn với Diovan.
Các chất vận chuyển: Kết quả từ một nghiên cứu trong phòng thí nghiệm (in vitro) trên mô gan người cho thấy valsartan là một cơ chất của chất vận chuyển thuốc vào bên trong gan OATP1B1 và chất vận chuyển thuốc ra ngoài gan MRP2. Điều trị đồng thời các chất ức chế chất vận chuyển thuốc vào trong gan (như rifampin, cyclosporin) hoặc chất vận chuyển ra ngoài gan (ritonavir) có thể làm tăng nồng độ valsartan trong cơ thể.
Vì valsartan không được chuyển hóa ở một mức độ đáng kể, không có khả năng có tương tác thuốc - thuốc với valsartan trên lâm sàng với thuốc cảm ứng hoặc ức chế hệ cytochrome P450. Mặc dù valsartan gắn mạnh vào protein huyết tương, các nghiên cứu in vitro không cho thấy tương tác nào ở dạng này với một loạt các phân tử cũng gắn mạnh vào protein huyết tương như diclofenac, furosemide và warfarin.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000162'), 'Viên nén bao phim', '2 vỉ x 30 viên', 'Chỉ định cho người lớn trong liệu pháp bổ sung/hỗ trợ vào biện pháp trị liệu hiện có để điều trị triệu chứng đau thắt ngực ổn định không được kiểm soát đầy đủ hoặc bệnh nhân không dung nạp với các liệu pháp điều trị đau thắt ngực khác.', '- Quá mẫn đối với thành phần hoạt chất hoặc bất cứ tá dược nào được liệt kê trong công thức bào chế sản phẩm.
- Bệnh nhân Parkinson, có triệu chứng Parkinson, run, hội chứng chân không nghỉ và các rối loạn vận động có liên quan khác.
- Suy thận nặng (độ thanh thải creatinin < 30ml/phút).', 'Nhóm cơ quan
Tần suất
Biểu hiện
Thường gặp
Chóng mặt, đau đầu
Không rõ
Triệu chứng Parkinson (run, vận động chậm và khó khăn, tăng trương lực cơ), dáng đi không vững, hội chứng chân không nghỉ, các rối loạn vận động có liên quan khác, thường có thể hồi phục sau khi dừng thuốc.
Rối loạn giấc ngủ (mất ngủ, lơ mơ).
Rối loạn trên tim
Hiếm gặp
Đánh trống ngực, hồi hộp, ngoại tâm thu, tim đập nhanh
Rối loạn trên mạch
Hiếm gặp
Hạ huyết áp động mạch, tụt huyết áp thế đứng, có thể dẫn đến khó chịu, chóng mặt hoặc ngã, đặc biệt ở các bệnh nhân đang điều trị bằng các thuốc chống tăng huyết áp, đỏ bừng mặt.
Rối loạn trên dạ dày - ruột
Thường gặp
Đau bụng, tiêu chảy, khó tiêu, buồn nôn và nôn.
Không rõ
Táo bón
Rối loạn trên da và mô dưới da
Thường gặp
Mẫn ngứa, mày đay
Không rõ
Ngoại ban mụn mủ toàn thân cấp tính (AGEP), phù mạch.
Rối loạn toàn thân và tình trạng sử dụng thuốc
Thường gặp
Suy nhược
Rối loạn hệ máu và hệ bạch huyết
Không rõ
Mất bạch cầu hạt, giảm tiểu cầu, ban xuất huyết giảm tiểu cầu.
Rối loạn gan mật
Không rõ
Suy gan', 'Một viên 20mg/lần x 3 lần/ngày
Các đối tượng đặc biệt:
Bệnh nhân suy thận mức độ trung bình (độ thanh thải creatinin 30 - 60ml/phút).
Dạng viên 20mg: liều dùng khuyến cáo là 1 viên 20mg/lần x 2 lần/ngày, sáng và tối dùng cùng bữa ăn (xem thêm phần chống chỉ định, phần cảnh báo và thận trọng).
Bệnh nhân cao tuổi: bệnh nhân cao tuổi có thể có mức độ nhạy cảm với trimetazidin cao hơn bình thường do suy giảm chức năng thận theo tuổi tác.
Dạng viên 20mg đối với bệnh nhân suy thận mức độ trung bình (độ thanh thải creatinin [30-60]ml/phút). Liều dùng khuyến cáo là 1 viên 20mg/lần x 2 lần/ngày, sáng và tối dùng cùng với bữa ăn (xem thêm phần chống chỉ định, phần cảnh báo và thận trọng).
Cần thận trọng tính toán liều dùng đối với bệnh nhân cao tuổi (xem thêm phần chống chỉ định, phần cảnh báo và thận trọng).
Trẻ em: Mức độ an toàn và hiệu quả đối với bệnh nhân dưới 18 tuổi chưa được đánh giá. Hiện chưa có dữ liệu trên đối tượng bệnh nhân này.', 'nhiệt độ dưới 30°C', '- Thận trọng khi sử dụng
Trimetazidin có thể gây ra hoặc làm trầm trọng thêm triệu chứng Parkinson (run, vận động chậm và khó khăn, tăng trương lực cơ). Do đó bệnh nhân, nhất là những bệnh nhân cao tuổi cần phải được kiểm tra và theo dõi thường xuyên. Trong các trường hợp nghi ngờ, bệnh nhân cần được đưa tới bác sĩ chuyên khoa thần kinh để được kiểm tra thích hợp.
Khi gặp các rối loạn vận động như các triệu chứng Parkinson, hội chứng chân bứt rứt, run, dáng đi không vững cần ngay lập tức ngừng sử dụng trimetazidin.
Các trường hợp này ít xảy ra và thường phục hồi sau khi dùng thuốc. Phần lớn bệnh nhân phục hồi sau khi ngưng thuốc 4 tháng. Nếu triệu chứng parkinson tiếp tục xảy ra sau 4 tháng sau khi dùng thuốc, cần tham vấn bác sỹ chuyên khoa thần kinh.
Có thể gặp biểu hiện ngã, dáng đi không vững hoặc tụt huyết áp, đặc biệt ở các bệnh nhân đang dùng các thuốc điều trị tăng huyết áp (xem thêm phần tác dụng không mong muốn).
Cần thận trọng khi kê đơn trimetazidin với đối tượng bệnh nhân có mức độ nhạy cảm cao như (xem thêm phần liều dùng và cách dùng) :
Bệnh nhân suy thận mức độ trung bình.
Bệnh nhân > 75 tuổi.
- Thai kỳ và cho con bú
Thời kỳ mang thai
Tốt nhất không dùng trimetazidin trong khi mang thai.
Thời kỳ cho con bú
Không nên cho con bú trong thời gian điều trị bằng trimetazidin.
Thông báo cho bác sỹ bất kỳ tác dụng không mong muốn nào gặp phải liên quan tới việc dùng thuốc.
- Khả năng lái xe và vận hành máy móc
Trimetazidin có thể gây các triệu chứng như chóng mặt và lơ mơ, do vậy có thể ảnh hưởng đến khả năng lái xe và vận hành máy móc.
- Tương tác thuốc
Hiện nay chưa có tương tác với thuốc nào. Trimetazidin không phải là một thuốc gây cảm ứng cũng như không phải là một thuốc gây ức chế enzym chuyển hóa thuốc ở gan và như vậy có nhiều khả năng trimetazidin không tương tác với nhiều thuốc chuyển hóa ở gan.
Dù sao vẫn cần thận trọng theo dõi khi phối hợp với 1 số thuốc khác.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000147'), 'Viên nén giải phóng chậm', '3 vỉ x 10 viên', 'Thuốc cung cấp kali cho cơ thể. Thuốc này được khuyến cáo dùng trong các trường hợp thiếu hụt kali (giảm kali huyết) sau:
- Phòng ngừa tình trạng giảm kali máu ở những bệnh nhân đang điều trị với thuốc lợi tiểu (thuốc lợi tiểu gây giảm kali máu).
- Điều trị giảm kali máu gây ra bởi việc điều trị với thuốc lợi tiểu hoặc corticosteroid và những tình trạng khác gây mất kali nghiêm trọng.', 'Thuốc này không được sử dụng trong các trường hợp sau:
- Được biết mẫn cảm với bất kỳ thành phần nào của thuốc.
- Mất cân bằng điện giải nặng bao gồm: tăng canxi huyết, tăng clo huyết, tăng kali huyết hoặc bất kỳ tình trạng nào có thể dẫn đến tăng kali huyết.
- Suy thận nặng.
- Bệnh suy tuyến thượng thận.
- Thực quản bị chèn ép, dạ dày chậm tiêu, tắc ruột, hẹp môn vị.
Trong trường hợp nghi ngờ, cần tham khảo ý kiến của bác sĩ hoặc dược sĩ.', 'Các tác dụng không mong muốn hiếm xảy ra, bao gồm tăng kali huyết, rối loạn hệ tiêu hóa và các vấn đề về da.
Hệ thống cơ thể
Tần suất
Tác dụng không mong muốn
Rối loạn máu và hệ bạch huyết
Rất hiếm gặp (
Rối loạn về huyết học ảnh hưởng đến bạch cầu (giảm bạch cầu, giảm bạch cầu trung tính, mất bạch cầu hạt)
Rối loạn dinh dưỡng và chuyển hoá
Ít gặp
(> 1/1000 và
Tăng kali huyết
Rối loạn hệ tiêu hoá
Hiếm gặp - Rất hiếm gặp
(
Buồn nôn, đau dạ dày, đau dạ dày co thắt, đầy hơi, tiêu chảy
Loét thực quản, loét dạ dày, loét tá tràng, thủng ruột kết.
Rối loạn về da
Hiếm gặp - Rất hiếm gặp
(
Ngứa, ngoại ban, mề đay.
Sự tắc nghẽn ống tiêu hóa trên và dưới, chảy máu, loét hoặc thủng ruột kết có thể xảy ra, đặc biệt khi uống Kali clorid với ít nước hoặc với những bệnh nhân có sự di chuyển qua ống tiêu hóa bị chậm lại như phụ nữ có thai hoặc bệnh nhân nằm liệt giường.
Thông báo cho bác sĩ bất kỳ tác dụng phụ nào xảy ra khi sử dụng thuốc.', 'Người lớn
Phòng và điều trị giảm kali huyết: 600mg - 6 gam mỗi ngày (tương đương với 1 - 10 viên nén), phụ thuộc vào mức độ giảm kali huyết hoặc tiên lượng về mức độ mất kali. Liều này nếu có thể nên chia làm 2 - 3 lần mỗi ngày.
Cần phải kiểm tra nồng độ kali huyết thanh thường xuyên để điều chỉnh liều dùng theo hiệu quả.
Nên nuốt cả viên với một cốc nước để giảm nguy cơ kích ứng đường tiêu hóa và có thể uống trong bữa ăn (tốt hơn là uống vào cuối bữa ăn).
Trẻ em
Hiệu quả và độ an toàn ở trẻ em chưa được xác lập.
Người cao tuổi
Không có kinh nghiệm lâm sàng cụ thể ở người cao tuổi, tuy nhiên phần lớn những nghiên cứu lâm sàng trên người già đã được thực hiện.
Bệnh nhân bị suy thận
Nên giảm liều ở bệnh nhân bị suy giảm chức năng thận. Thường xuyên kiểm tra nồng độ kali huyết thanh.
Bệnh nhân bị suy gan
Không có kinh nghiệm lâm sàng cụ thể ở bệnh nhân bị suy giảm chức năng gan. Liều khuyến cáo có thể được sử dụng.
- Quá liều
Triệu chứng
Sử dụng quá liều kali dẫn đến tăng kali máu đặc biệt ở bệnh nhân bị suy thận. Các triệu chứng bao gồm: sự suy nhược, rối loạn trí nhớ, cảm giác khác thường của các chi, yếu cơ, chứng liệt, giảm huyết áp, chứng loạn nhịp tim, chẹn tim và sự ngừng tim. Đặc điểm điện tâm đồ cũng có thể thay đổi.
Liều độc
168mmol. Sự ngừng tim có thể xảy ra ở trẻ em nhỏ hơn sau khi uống liều 60mmol. Các triệu chứng nghiêm trọng được thấy sau khi uống khoảng 3 mmol/kg trọng lượng cơ thể, bệnh nhân chết sau khi uống liều 4 - 13 mmol/kg trọng lượng cơ thể.
Xử trí
Làm rỗng dạ dày nếu cần thiết. Dùng Insulin và glucose đường uống hoặc dùng polystyrene sulfat (Resonium) đường trực tràng.
Truyền tĩnh mạch dung dịch Natri bicacbonat hoặc tiêm tĩnh mạch dung dịch canxi clorid hoặc dung dịch canxi gluconat (10 - 20ml dung dịch 1%).', 'Bảo quản dưới 30°C.', '- Thận trọng khi sử dụng
Kali clorid nên được dùng thận trọng với bệnh nhân bị bệnh tim hoặc những tình trạng có thể dẫn đến làm tăng kali máu như suy thận hoặc suy tuyến thượng thận, mất nước cấp tính, phá hủy mô rộng xảy ra khi bị bỏng nặng.
Nên kiểm soát kali huyết trên bệnh nhân bị suy tim hoặc suy thận.
Giảm liều ở những bệnh suy giảm chức năng thận, xem phần "Liều lượng và cách dùng".
Kali clorid nên được dùng thận trọng với những bệnh nhân có sự vận chuyển qua dạ dày - ruột bị chậm lại. Nên ngừng điều trị nếu xảy ra tình trạng buồn nôn, nôn nghiêm trọng hoặc đau ổ bụng tiến triển.
- Thai kỳ và cho con bú
Kali clorid nên được dùng thận trọng với những bệnh nhân có sự vận chuyển qua dạ dày - ruột bị chậm lại như ở phụ nữ mang thai.
Kali clorid có thể được sử dụng trong thời kỳ mang thai và cho con bú. Không có nguy cơ nào được ghi nhận.
- Tương tác thuốc
Điều trị đồng thời với thuốc lợi tiểu giảm kali hoặc chất ức chế men chuyển angiotensin và chất đối kháng thụ thể angiotensin Il làm tăng nguy cơ tăng kali huyết.
Để tránh các tương tác có thể giữa các thuốc dùng cùng, bạn nên thông báo cho bác sĩ hoặc dược sĩ biết về tất cả các điều trị đồng thời khác đặc biệt trong trường hợp điều trị với thuốc lợi tiểu.
Thuốc lợi tiểu có thể có 2 tác dụng, một số thuốc lợi tiểu làm mất kali niệu (thuốc lợi tiểu giảm kali huyết), trong khi một số khác gây tích lũy kali làm tăng kali huyết.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000146'), 'Viên nén bao phim tác dụng kéo dài', '10 vỉ x 10 viên', '- Dự phòng đau thắt ngực, đặc biệt khi có yếu tố co mạch như trong đau thắt ngực kiểu Prinzmetal.
- Điều trị tăng huyết áp.', '- Sốc do tim.
- Hẹp động mạch chủ nặng.
- Nhồi máu cơ tim trong vòng 1 tháng.
- Cơn đau cấp trong đau thắt ngực ổn định mạn tính, đau thắt ngực không ổn định.
- Rối loạn chuyển hóa porphyrin.', 'Các tác dụng không mong muốn thường xảy ra ở giai đoạn đầu dùng thuốc và giảm dần sau vài tuần hoặc sau khi điều chỉnh lại liều điều trị.
Thường gặp (1/100 ≤ ADR
- Toàn thân: Phù mắt cá chân, đau đầu, mệt mỏi, chóng mặt, nóng đỏ bừng mặt.
- Tuần hoàn: Đánh trống ngực, tim đập nhanh.
- Tiêu hóa: Buồn nôn, tiêu chảy hoặc táo bón.
Ít gặp (1/1.000 ≤ ADR
- Tuần hoàn: Hạ huyết áp, tăng nặng cơn đau thắt ngực.
- Da: Ngoại ban, mày đay, ngứa.
Hiếm gặp (1/10.000 ≤ ADR
- Toàn thân: Ban xuất huyết, phản ứng dị ứng.
- Máu: Giảm bạch cầu hạt.
- Tuần hoàn: Ngoại tâm thu, ngất.
- Nội tiết: Chứng vú to ở nam giới có phục hồi.
- Tiêu hóa: Tăng sản nướu răng (phì đại lợi răng).
- Da: Viêm da nhạy cảm ánh sáng, viêm da tróc vẩy.
- Gan: Tăng enzym gan (transaminase), ứ mật trong gan có hồi phục.
- Hô hấp: Khó thở.
- Chuyển hóa: Tăng glucose huyết có hồi phục.
- Cơ-xương: Đau cơ, đau khớp, run.
- Thần kinh: Dị cảm.
- Tâm thần: Lú lẫn, rối loạn giấc ngủ, hồi hộp.', 'Cách dùng
Nifedipin T20 retard được dùng bằng đường uống. Nên uống nguyên viên, không được nhai, bẻ hoặc nghiền.
Liều lượng
- Dự phòng đau thắt ngực: 1 viên x 2 lần/ngày.
- Tăng huyết áp: 1 viên x 2 lần/ngày.
- Quá liều
Trong trường hợp ngộ độc nifedipine nặng có các triệu chứng sau: Buồn nôn, đau đầu, hạ huyết áp, tim đập nhanh hoặc chậm, đỏ bừng mặt, hạ kali máu, blốc nhĩ thất,… Trong trường hợp này phải nhanh chóng rửa dạ dày, uống than hoạt. Dùng các biện pháp điều trị hỗ trợ và triệu chứng.', 'Nhiệt độ không quá 30°C.', '- Thận trọng khi sử dụng
Sau khi bắt đầu điều trị, cơn đau do thiếu máu cục bộ xuất hiện hoặc cơn đau hiện có nặng lên nhanh chóng, cần phải ngừng thuốc.
Bệnh nhân suy tim hoặc suy chức năng thất trái vì suy tim có thể nặng lên.
Phải giảm liều khi có tổn thương gan, đái tháo đường.
Tránh dùng nước ép bưởi trên bệnh nhân đang uống nifedipine.
Nifedipine có thể ức chế chuyển dạ đẻ.
Nifedipin T20 retard có chứa lactose. Không nên dùng thuốc này cho bệnh nhân có các vấn đề về di truyền hiếm gặp không dung nạp galactose, thiếu hụt enzym lactase toàn phần hay kém hấp thu glucose-galactose.
- Thai kỳ và cho con bú
Phụ nữ có thai
Các nghiên cứu trên súc vật cho thấy nifedipin gây độc đối với bào thai và gây quái thai, thường gặp là các biến dạng xương. Vì vậy, không được dùng cho phụ nữ có thai trừ khi thật cần thiết.
Phụ nữ cho con bú
Do nifedipin đạt nồng độ cao trong sữa mẹ nên có thể gặp các tai biến đối với trẻ bú mẹ ngay cả ở liều bình thường. Vì vậy, mà quyết định ngừng cho con bú hoặc không dùng thuốc này. Cân nhắc tầm quan trọng của thuốc đối với người mẹ.
- Khả năng lái xe và vận hành máy móc
Phản ứng đối với thuốc thay đổi tùy theo từng cá nhân, có thể giảm khả năng lái xe hoặc vận hành máy móc. Tác dụng này đặc biệt xảy ra khi bắt đầu điều trị, thay đổi thuốc uống và trong khi dùng đồng thời với rượu.
- Tương tác thuốc
Các thuốc chẹn beta giao cảm: Có thể làm hạ huyết áp quá mức, tăng cơn đau thắt ngực, suy tim sung huyết và loạn nhịp tim, đặc biệt hay gặp ở bệnh nhân chức năng tim giảm.
Các thuốc kháng thụ thể H2 - histamin: Dùng đồng thời nifedipine với cimetidin có thể làm tăng nồng độ trong huyết thanh và tăng tác dụng của nifedipine, do vậy cần giảm liều khi phối hợp. Tuy nhiên với ranitidin thì chỉ có tương tác ít, còn famotidin thì không tương tác với nifedipine.
Fentanyl: Hạ huyết áp nặng xảy ra trong khi phẫu thuật ở những bệnh nhân dùng đồng thời nifedipine và fentanyl. Nếu trong phẫu thuật phải dùng liều cao fentanyl thì phải tạm ngừng nifedipine ít nhất 36 giờ trước khi phẫu thuật, nếu tình trạng bệnh nhân cho phép.
Các thuốc chống động kinh: Dùng nifedipine đồng thời với các thuốc chống động kinh như phenytoin sẽ làm tăng nồng độ phenytoin trong huyết tương, do đó tác dụng và độc tính của phenytoin (như đau đầu, rung giật nhãn cầu, run, rối loạn vận ngôn, trầm cảm) đều tăng lên.
Theophylin: Nifedipine làm giảm nồng độ của theophylin trong huyết tương. Dùng nifedipine cùng với theophylin làm thay đổi kiểm soát hen.
Quinidin: Nifedipine có thể làm giảm đáng kể nồng độ trong huyết thanh của quinidin ở một số bệnh nhân này, nhưng lại không ảnh hưởng với một số bệnh nhân khác.
Digoxin: Nifedipine làm tăng nồng độ trong huyết thanh của digoxin khoảng 15 - 45% khi dùng đồng thời, vì vậy phải theo dõi các dấu hiệu về ngộ độc digoxin và giảm liều nếu cần.
Các thuốc chẹn alpha: Các thuốc chẹn alpha, đặc biệt là prazosin có thể làm tăng tác dụng hạ huyết áp do nifedipine ức chế chuyển hóa của prazosin, phải thận trọng.
Các thuốc chẹn kênh calci: Nồng độ trong huyết tương của cả nifedipine và diltiazem đều tăng khi dùng phối hợp 2 thuốc này với nhau. Điều này có thể là do cả 2 thuốc đều được chuyển hóa bởi cùng một enzym gan, nên làm giảm chuyển hóa của mỗi thuốc.
Các thuốc chống kết tập tiểu cầu: Tác dụng chống kết tập tiểu cầu tăng lên nếu phối hợp nifedipine với aspirin hoặc ticlopidin.
Các chất ức chế miễn dịch: Cyclosporin làm giảm chuyển hóa của nifedipine thông qua ức chế cạnh tranh enzym chuyển hóa cytochrome P450.
Rifampicin: Rifampicin gây cảm ứng enzym cytochrom P450 ở gan, vì vậy làm giảm nồng độ nifedipine trong huyết tương và làm tăng các cơn đau thắt ngực.
Các thuốc chống viêm không steroid: Indomethacin và các thuốc chống viêm không steroid khác có thể đối kháng với tác dụng chống tăng huyết áp của các thuốc chẹn kênh calci thông qua ức chế tổng hợp prostaglandin ở thận, hoặc gây ứ muối và nước.
Nước ép bưởi: Khi uống nước ép bưởi với nifedipine sẽ làm tăng sinh khả dụng của nifedipine. Tương tác này có thể là do một số thành phần trong nước bưởi gây ức chế enzym P450.
Rượu: Rượu làm tăng sinh khả dụng và ức chế chuyển hóa của nifedipine. Kết quả là nồng độ trong huyết thanh và tác dụng của nifedipine tăng lên.
Thận trọng khi dùng đồng thời nifedipine với các thuốc sau: Các thuốc chống đông máu (dẫn chất coumarin và indandion), các thuốc chống co giật (hydantoin), quinidin, các salicylat, sulfinpyrazon, estrogen, amphotericin B, các thuốc ức chế enzym carbonic anhydrase, các corticoid, các thuốc lợi tiểu thải kali (như bumetanid, acid ethacrynic, furosemid), natri phosphat...
Tương kỵ của thuốc
Do không có các nghiên cứu về tính tương kỵ của thuốc, không trộn lẫn thuốc này với các thuốc khác.', NULL),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000105'), 'Viên nén', '2 vỉ x 14 viên', 'Zestoretic được chỉ định điều trị bệnh nhân tăng huyết áp từ nhẹ đến trung bình đang được điều trị ổn định với cùng thuốc đơn lẻ ở từng mức liều tỷ lệ 20 mg/12,5 mg.', '- Quá mẫn với các hoạt chất hoặc bất kỳ tá dược nào được liệt kê trong phần Thành phần tá dược.
- Quá mẫn với bất kỳ các thuốc ức chế men chuyển (ACE) khác.
- Quá mẫn với bất kỳ các thuốc dẫn xuất của sulfonamid.
- Tiền sử phù mạch với liệu pháp ức chế men chuyển trước đó
- Phù mạch di truyền hay vô căn.
- 3 tháng giữa và 3 tháng cuối của thai kỳ (xem phần “Lưu ý đặc biệt và thận trọng khi sử dụng” và “Phụ nữ có thai và cho con bú”).
- Bệnh nhân suy thận nặng (độ thanh thải creatinin &lt; 30 ml/phút)
- Vô niệu.
- Bệnh nhân suy gan nặng.
- Chống chỉ định dùng đồng thời Zestoretic với sản phẩm chứa aliskiren ở bệnh nhân đái tháo đường hoặc bệnh nhân suy thận (GFR &lt; 60ml/phút/1,73m2) (xem phần "Tương tác của thuốc với các thuốc khác và các loại tương tác khác” và “Đặc tính dược lực”).', 'Các tác dụng không mong muốn sau đã được quan sát và ghi nhận trong khi điều trị bằng lisinopril và/hoặc hydrochlorothiazid với tần suất xảy ra như sau: Rất thường gặp (≥ 1/10), thường gặp (≥ 1/100, &lt; 1/10), ít gặp (≥ 1/1000, &lt; 1/100), hiếm gặp (≥ 1/10.000, &lt; 1/1000), rất hiếm gặp (&lt; 1/10.000), chưa rõ (không thể ước tính từ dữ liệu sẵn có).
Các phản ứng ngoại ý thường gặp nhất là ho, chóng mặt, hạ huyết áp, đau đầu có thể xảy ra với 1 đến 10% số bệnh nhân được điều trị. Trong các nghiên cứu lâm sàng, tác dụng không mong muốn thường nhẹ và thoáng qua, và trong hầu hết các trường hợp không yêu cầu gián đoạn điều trị.
Lisinopril:
Rối loạn máu và hệ bạch huyết
Hiếm gặpGiảm hemoglobin, giảm hematocrit.
Rất hiếmSuy tủy xương, thiếu máu, giảm tiểu cầu, giảm bạch cầu, giảm bạch cầu hạt, giảm bạch cầu hạt (xem phần “Lưu ý đặc biệt và thận trọng khi sử dụng”), thiếu máu tán huyết, hạch bạch huyết, bệnh tự miễn.
Rối loạn hệ thống miễn dịch
Không rõPhản vệ/phản ứng phản vệ.
Rối loạn hệ nội tiết
Hiếm gặpHội chứng bài tiết hormon kháng lợi tiểu không thích hợp (SIADH).
Rối loạn chuyển hóa và dinh dưỡng
Rất hiếmHạ đường huyết.
Rối loạn tâm thần và rối loạn hệ thần kinh
Thường gặpChóng mặt, nhức đầu, ngất.
Ít gặpDị cảm, chóng mặt, rối loạn vị giác, rối loạn giấc ngủ, thay đổi tâm trạng, triệu chứng trầm cảm.
Hiếm gặpRối loạn tâm thần, rối loạn khứu giác.
Không rõẢo giác.
Rối loạn tim mạch
Thường gặpTác động tư thế (kể cả hạ huyết áp tư thế đứng).
Ít gặpNhồi máu cơ tim hoặc tai biến mạch máu não, có thể là thứ phát do tụt huyết áp quá mức ở bệnh nhân có nguy cơ cao (xem phần “Lưu ý đặc biệt và thận trọng khi sử dụng”), đánh trống ngực, nhịp tim nhanh, hội chứng Raynaud.
Không rõĐỏ bừng.
Rối loạn hô hấp, lồng ngực và trung thất
Thường gặpHo (xem phần "Lưu ý đặc biệt và thận trọng khi sử dụng").
Ít gặpViêm mũi.
Rất hiếm gặpCo thắt phế quản, viêm xoang, viêm phế quản/viêm phổi tăng bạch cầu ái toan.
Rối loạn tiêu hóa
Thường gặpTiêu chảy, nôn.
Ít gặpBuồn nôn, đau bụng và khó tiêu.
Hiếm gặpKhô miệng.
Rất hiếm gặpViêm tụy, phù mạch tại ruột.
Rối loạn gan-mật
Ít gặpTăng men gan và bilirubin.
Rất hiếmViêm gan (viêm tế bào gan hoặc viêm gan ứ mật), vàng da, suy gan (xem phần "Lưu ý đặc biệt và thận trọng khi sử dụng").
Rối loạn da và mô dưới da
Ít gặpPhát ban, ngứa.
Hiếm gặpQuá mẫn/phù thần kinh-mạch: phù thần kinh-mạch ở mặt, tay chân, môi, lưỡi, thanh môn và/hoặc thanh quản (xem phần "Lưu ý đặc biệt và thận trọng khi sử dụng"), nổi mề đay, rụng tóc, vẩy nến.
Rất hiếm gặpTeo da, pemphigus, hoại tử biểu bì nhiễm độc, Hội chứng Stevens-Johnson, hồng ban đa dạng, u lympho giả trên da**.
Rối loạn thận và tiết niệu
Thường gặpRối loạn chức năng thận.
Hiếm gặpTăng ure máu, suy thận cấp.
Rất hiếm gặpThiểu niệu/vô niệu.
Rối loạn hệ sinh sản và tuyến vú
Ít gặpBất lực
Hiếm gặpNữ hóa tuyến vú.
Các rối loạn tổng quát và tình trạng tại chỗ
Ít gặpSuy nhược, mệt mỏi.
Các kết quả xét nghiệm
Ít gặpTăng ure máu, tăng creatinin huyết thanh, tăng kali máu.
Hiếm gặpHạ natri máu.
* Rất hiếm gặp một vài trường hợp bệnh nhân viêm gan tiến triển thành suy gan. Bệnh nhân đang dùng thuốc lisinopril/hydrochlorothiazid bị vàng da hoặc tăng men gan nên ngưng dùng thuốc lisinopril/hydrochlorothiazid và được theo dõi y tế thích hợp.
** Phức hợp triệu chứng đã được ghi nhận và có thể bao gồm một hoặc nhiều triệu chứng sau đây:
Sốt, viêm mạch máu, đau cơ, đau khớp/viêm khớp, kháng thể kháng nhân (ANA) dương tính, tăng vận tốc lắng máu (ESR), tăng bạch cầu ái toan, tăng bạch cầu, nổi mẩn, nhạy cảm ánh sáng hoặc các biểu hiện khác ở da có thể xảy ra.
Hydrochlorothiazid (tần suất không rõ):
Nhiễm trùng và nhiễm ký sinh trùngViêm tuyến nước bọt.
Rối loạn máu và hệ bạch huyếtGiảm bạch cầu, giảm bạch cầu trung tính/mất bạch cầu hạt, giảm tiểu cầu, thiếu máu bất sản, thiếu máu tán huyết, suy tủy xương.
Rối loạn chuyển hóa và dinh dưỡngBiếng ăn, tăng đường huyết đường niệu, tăng acid uric máu, mất cân bằng điện giải (như hạ natri máu, hạ kali máu, nhiễm kiềm chuyển hóa giảm clor máu và giảm magie máu), tăng cholesterol and triglyceride, bệnh gút.
Rối loạn tâm thầnBồn chồn, trầm cảm, rối loạn giấc ngủ.
Rối loạn hệ thần kinhMất cảm giác ngon miệng, dị cảm, mê sảng.
Rối loạn thị giácNhiễm sắc tố vàng, nhìn mờ thoáng qua, cận thị cấp và glaucoma góc đóng cấp.
Rối loạn tai và tai trongChóng mặt.
Rối loạn timHạ huyết áp tư thế.
Rối loạn mạchViêm mạch hoại tử (viêm mạch, viêm mạch da).
Rối loạn hô hấp, lồng ngực và trung thấtSuy hô hấp kể cả viêm phổi và phù phổi.
Rối loạn tiêu hóaKích thích dạ dày, táo bón, tiêu chảy, viêm tụy.
Rối loạn gan mậtVàng da (vàng da ứ mật trong gan).
Rối loạn da và mô dưới daPhản ứng nhạy cảm ánh sáng, phát ban, lupus ban đỏ hệ thống, phản ứng giống như lupus ban đỏ viêm da, kích hoạt lại lupus ban đỏ viêm da, nổi mề đay, phản ứng phản vệ, hoại tử biểu bì nhiễm độc.
Rối loạn cơ-xương, mô liên kết và xươngCo thắt cơ, yếu cơ.
Rối loạn thận và tiết niệuRối loạn chức năng thận, viêm thận kẽ.
Rối loạn tổng quátSốt, suy nhược.
Báo cáo các phản ứng nghi ngờ
Việc báo cáo phản ứng ngoại ý nghi ngờ sau khi thuốc được cấp phép lưu hành là quan trọng. Điều này cho phép tiếp tục theo dõi cân bằng lợi ích/nguy cơ của thuốc.
6. Lưu ý
- Thận trọng khi sử dụng
Hạ huyết áp có triệu chứng
Hạ huyết áp có triệu chứng hiếm gặp ở những bệnh nhân tăng huyết áp không biến chứng, nhưng khả năng xảy ra nhiều hơn ở bệnh nhân bị giảm thể tích như dùng liệu pháp lợi tiểu, chế độ ăn hạn chế muối, thẩm phân máu, tiêu chảy hoặc nôn mửa, hoặc tăng huyết áp phụ thuộc renin nặng (xem phần "Tương tác của thuốc với các thuốc khác và các loại tương tác khác và Tác dụng không mong muốn"). Đánh giá thường xuyên nồng độ điện giải trong huyết thanh nên được thực hiện ở những bệnh nhân này ở những khoảng thời gian thích hợp. Ở những bệnh nhân có nguy cơ cao bị hạ huyết áp triệu chứng, việc khởi đầu điều trị và điều chỉnh liều cần được giám sát chặt chẽ. Chú ý đặc biệt trên các bệnh nhân bị bệnh tim thiếu máu cục bộ hay bệnh mạch máu não vì hạ huyết áp quá mức có thể dẫn đến nhồi máu cơ tim hay tai biến mạch máu não.
Khi bị hạ huyết áp, nên đặt bệnh nhân ở tư thế nằm ngửa và, nếu cần, truyền tĩnh mạch dung dịch muối sinh lý. Hạ huyết áp thoáng qua không phải là chống chỉ định đối với các liều tiếp theo. Sau khi hồi phục lượng thể tích máu và huyết áp hiệu quả, có thể giảm liều điều trị hoặc sử dụng từng thành phần riêng của phối hợp thuốc.
Ở một số bệnh nhân suy tim có huyết áp bình thường hoặc thấp, việc giảm huyết áp toàn thân có thể xảy ra khi dùng lisinopril. Phản ứng này đã được dự đoán trước và thường không phải lý do để ngừng điều trị. Nếu hạ huyết áp trở nên có triệu chứng, có thể cần giảm liều hoặc ngưng dùng thuốc lisinopril-hydrochlorothiazid.
Hẹp van động mạch chủ và van hai lá/bệnh cơ tim phì đại
Cũng như các thuốc ức chế men chuyển khác, thận trọng khi dùng lisinopril ở bệnh nhân bị hẹp van hai lá và tắc nghẽn dòng chảy của tâm thất trái như hẹp động mạch chủ hoặc bệnh cơ tim phì đại.
Ức chế kép hệ renin-angiotensin-aldosteron (RAAS)
Có bằng chứng cho thấy việc sử dụng đồng thời thuốc ức chế men chuyển, thuốc chẹn thụ thể angiotensin II hoặc aliskiren làm tăng nguy cơ hạ huyết áp, tăng kali máu và giảm chức năng thận (bao gồm suy thận cấp). Vì vậy, không khuyến cáo điều trị với ức chế kép hệ RAAS thông qua phối hợp thuốc ức chế men chuyển, thuốc chẹn thụ thể angiotensin II hoặc aliskiren (xem phần "Tương tác với thuốc khác và các dạng tương tác và Đặc tính dược lực").
Nếu liệu pháp điều trị bằng ức chế kép là hoàn toàn cần thiết thì chỉ thực hiện dưới sự giám sát của chuyên gia và thường xuyên theo dõi chặt chẽ chức năng thận, điện giải, huyết áp.
Không nên sử dụng đồng thời thuốc ức chế men chuyển và thuốc chẹn thụ thể angiotensin II ở bệnh nhân có biến chứng trên thận do đái tháo đường.
Tổn thương chức năng thận
Các thuốc lợi tiểu thiazid có thể không thích hợp ở bệnh nhân tổn thương thận và không hiệu quả ở bệnh nhân có độ thanh thải creatinin ≤ 30 ml/phút (tương đương suy thận từ trung bình đến nặng).
Lisinopril/hydrochlorothiazid không nên dùng cho bệnh nhân suy thận (độ thanh thải creatinin ≤ 80 ml/phút) trừ phi việc điều chỉnh liều của từng thành phần riêng của thuốc cho thấy cần dùng viên phối hợp Zestoretic.
Điều trị khởi đầu thuốc ức chế men chuyển ở những bệnh nhân suy tim, hạ huyết áp có thể dẫn đến suy giảm chức năng thận. Suy thận cấp thường hồi phục đã được ghi nhận trong trường hợp này.
Ở một số bệnh nhân hẹp động mạch thận 2 bên hoặc hẹp động mạch thận của thận đơn độc, được điều trị với thuốc ức chế men chuyển, người ta đã ghi nhận có sự gia tăng urê máu và creatinin huyết thanh, thường sẽ hồi phục khi ngưng điều trị. Điều này đặc biệt dễ xảy ra ở bệnh nhân suy thận. Nếu tăng huyết áp do bệnh lý mạch máu thận cũng hiện diện thì có nguy cơ cao bị hạ huyết áp nặng và suy thận. Ở những bệnh nhân này, nên bắt đầu điều trị ở liều thấp dưới sự giám sát chặt chẽ và điều chỉnh liều lượng cẩn thận. Vì việc điều trị với thuốc lợi tiểu có thể là một yếu tố góp phần gây ra tình trạng nói trên, nên theo dõi chức năng thận trong vài tuần đầu tiên điều trị với lisinopril/hydrochlorothiazid.
Một số bệnh nhân tăng huyết áp mà không có bệnh thận rõ rệt trước đó đã có hiện tượng tăng urê máu và creatinin huyết thanh, thường là nhẹ và thoáng qua, khi lisinopril được dùng đồng thời với thuốc lợi tiểu.
Tình trạng này có nhiều khả năng là xảy ra ở bệnh nhân suy thận từ trước. Có thể cần phải giảm liều và/hoặc ngưng thuốc lợi tiểu và/hoặc lisinopril.
Bệnh nhân điều trị trước đó bằng thuốc lợi tiểu
Nên ngưng các thuốc lợi tiểu khoảng 2-3 ngày trước khi khởi đầu với lisinopril/ hydrochlorothiazide. Nếu không thể, nên bắt đầu điều trị với liều 5 mg lisinopril đơn thuần.
Ghép thận
Không nên sử dụng thuốc này ở bệnh nhân ghép thận vì không có kinh nghiệm ở bệnh nhân vừa được cấy ghép một quả thận.
Phản ứng phản vệ ở bệnh nhân thẩm phân máu
Lisinopril/hydrochlorothiazid không chỉ định cho bệnh nhân suy thận cần thẩm phân.
Các phản ứng phản vệ đã được ghi nhận ở bệnh nhân đang được thẩm phân máu theo một số phương thức (ví dụ với màng thẩm phân có tốc độ thẩm phân cao AN 69 và trong khi ly trích lipoprotein tỷ trọng thấp (LDL) bằng dextran sulfate) và điều trị đồng thời với một thuốc ức chế men chuyển. Ở những bệnh nhân này, cần xem xét việc sử dụng 1 loại màng thẩm phân khác hoặc nhóm thuốc điều trị tăng huyết áp khác.
Phản ứng phản vệ liên quan đến phương pháp gạn tách lipoprotein tỷ trọng thấp (LDL)
Trong vài trường hợp hiếm gặp, bệnh nhân điều trị với thuốc ức chế men chuyển trong quá trình gạn tách thẩm phân lipoprotein tỷ trọng thấp bằng dextran sulfate xảy ra phản ứng phản vệ đe dọa tính mạng. Có thể tránh mắc phải triệu chứng này bằng cách tạm thời ngưng dùng thuốc ức chế men chuyển trước khi thực hiện phương pháp gạn tách.
Suy gan
Các thiazid nên sử dụng thận trọng ở bệnh nhân tổn thương chức năng gan hay bệnh gan tiến triển vì những thay đổi nhỏ trên sự cân bằng nước và điện giải có thể làm hôn mê gan dễ xảy ra hơn (xem phần “Chống chỉ định”). Hiểm khi gặp trường hợp thuốc ức chế men chuyển gây ra hội chứng khởi phát là vàng da ứ mật hoặc viêm gan và tiến triển thành viêm gan ác tính và (đôi khi) dẫn đến tử vong. Cơ chế phản ứng của hội chứng này vẫn chưa rõ ràng. Bệnh nhân dùng lisinopril/hydrochlorothiazid bị vàng da hoặc tăng men gan nên ngưng dùng lisinopril/hydrochlorothiazid và được theo dõi y tế thích hợp.
Phẫu thuật /Gây mê
Ở bệnh nhân đại phẫu hoặc trong khi gây mê bằng các thuốc gây hạ huyết áp, lisinopril có thể ức chế sự tạo thành angiotensin II thứ phát do sự phóng thích renin bù trừ. Nếu hạ huyết áp xảy ra và được nghĩ là do cơ chế này thì có thể điều chỉnh bằng cách bồi hoàn thể tích tuần hoàn.
Ảnh hưởng lên nội tiết và chuyển hóa
Thuốc ức chế men chuyển và các thiazid có thể làm giảm dung nạp glucose. Có thể cần phải điều chỉnh liều các thuốc trị đái tháo đường, kể cả insulin. Ở bệnh nhân đái tháo đường điều trị bằng thuốc chống đái tháo đường dạng uống hoặc insulin, nên theo dõi chặt chẽ nồng độ glucose huyết trong tháng đầu tiên điều trị với thuốc ức chế men chuyển. Trong quá trình điều trị với thuốc nhóm thiazid, đái tháo đường tiềm ẩn có thể trở thành dạng có biểu hiện.
Tăng nồng độ cholesterol và triglycerid có thể do điều trị bằng lợi tiểu thiazid gây ra. Thiazid có thể thúc đẩy tình trạng tăng uric máu và/hoặc bệnh gout ở một số bệnh nhân. Tuy nhiên, lisinopril có thể làm tăng acid uric niệu và vì vậy có thể làm giảm tác động tăng uric máu của hydroclorothiazid.
Mất cân bằng điện giải
Đối với bất kỳ bệnh nhân nào được điều trị bằng thuốc lợi tiểu, nên kiểm tra định kỳ nồng độ chất điện giải trong huyết thanh vào các khoảng thời gian thích hợp.
Thuốc nhóm thiazid, bao gồm hydrochlorothiazid, có thể gây mất cân bằng nước hoặc điện giải (hạ kali máu, hạ natri máu, nhiễm kiềm chuyển hóa giảm clo huyết). Dấu hiệu cảnh báo mất cân bằng nước hoặc điện giải là khô miệng, khát nước, suy nhược, thờ ơ, chóng mặt, đau cơ hoặc chuột rút, mỏi cơ, hạ huyết áp, thiểu niệu, nhịp tim nhanh, rối loạn tiêu hóa như buồn nôn hoặc nôn. Hạ natri máu pha loãng xảy ra ở bệnh nhân phù khi thời tiết nóng. Thiếu hụt clorid nói chung thường nhẹ và không cần điều trị. Thiazid đã được chứng minh làm tăng bài tiết magie qua nước tiểu, có thể dẫn đến hạ magie máu. Thiazid có thể làm giảm bài tiết calci trong nước tiểu và có thể làm tăng nhẹ và không liên tục nồng độ calci trong huyết thanh. Dấu hiệu tăng calci huyết có thể là bằng chứng của bệnh cường cận giáp tiềm ẩn. Nên ngưng dùng thiazid trước khi tiến hành xét nghiệm chức năng cận giáp.
Tăng kali máu
Mức tăng kali huyết thanh đã được ghi nhận ở một số bệnh nhân được điều trị bằng thuốc ức chế men chuyển, kể cả lisinopril. Bệnh nhân có nguy cơ tăng kali máu bao gồm những người có suy thận, đái tháo đường, hoặc những người sử dụng đồng thời thuốc lợi tiểu tiết kiệm kali, bổ sung kali hoặc muối thay thế có chứa kali, hoặc những bệnh nhân đang dùng các thuốc khác có liên quan với tăng kali huyết thanh (ví dụ heparin, thuốc kết hợp trimethoprim/sulfamethoxazole hay được biết đến là co-trimoxazol). Nếu việc sử dụng đồng thời các thuốc nói trên được coi là thích hợp, nên thường xuyên theo dõi kali huyết thanh (xem phần "Tương tác của thuốc với các thuốc khác và các loại tương tác khác")
Bệnh nhân đái tháo đường
Ở những bệnh nhân đái tháo đường được điều trị với các thuốc đái tháo đường dạng uống hoặc insulin, kiểm soát đường huyết nên được theo dõi chặt chẽ trong tháng đầu điều trị bằng thuốc ức chế men chuyển (xem phần "Tương tác của thuốc với các thuốc khác và các loại tương tác khác").
Quá mẫn /Phù mạch
Phù mạch ở mặt, môi, lưỡi, thanh môn và/ hoặc thanh quản đã được ghi nhận ít gặp ở những bệnh nhân được điều trị với thuốc ức chế men chuyển, kể cả lisinopril. Triệu chứng này có thể xảy ra tại bất cứ thời điểm nào trong khi điều trị. Trong trường hợp này, cần ngưng dùng lisinopril ngay lập tức và tiến hành điều trị và theo dõi thích hợp để đảm bảo rằng các triệu chứng được giải quyết hoàn toàn trước khi bệnh nhân xuất viện. Ngay cả trong trường hợp sưng phù chỉ khu trú ở lưỡi, không gây trụy hô hấp, bệnh nhân cần được tiếp tục quan sát vì việc điều trị bằng thuốc kháng histamin và corticosteroid có thể không đáp ứng.
Trong vài trường hợp rất hiếm đã ghi nhận tử vong do phù mạch liên quan đến phù thanh quản hoặc phù lưỡi. Bệnh nhân phù mạch ở lưỡi, thanh môn hoặc thanh quản có thể gây tắc nghẽn đường hô hấp, đặc biệt ở những người có tiền sử phẫu thuật đường hô hấp. Ở những trường hợp này, cần điều trị cấp cứu nhanh chóng. Trường hợp này có thể sử dụng adrenalin và/ hoặc duy trì thông thoáng đường hô hấp. Cần theo dõi bệnh nhân cẩn thận cho đến khi triệu chứng được giải quyết hoàn toàn và ổn định.
Thuốc ức chế men chuyển gây phù mạch ở người da đen với tỷ lệ cao hơn ở người có màu da khác.
Bệnh nhân có tiền sử phù mạch không do thuốc ức chế men chuyển có thể có nguy cơ bị phù mạch nhiều hơn khi dùng thuốc ức chế men chuyển (xem phần “Chống chỉ định”).
Bệnh nhân dùng đồng thời với thuốc ức chế mTOR (ví dụ sirolimus, evertimus, temsirolimus) có thể làm tăng nguy cơ phù mạch (như sưng đường hô hấp hoặc lưỡi, có hoặc không có suy giảm chức năng hô hấp) (xem phần “Tương tác của thuốc với các thuốc khác và các loại tương tác khác”).
Ở bệnh nhân dùng thiazid, phản ứng quá mẫn có thể xảy ra cho dù bệnh nhân có tiền sử dị ứng hay không hoặc ở bệnh nhân bị hen phế quản. Bệnh lupus ban đỏ hệ thống có thể trầm trọng hay bộc phát đã được báo cáo trên vài trường hợp dùng các thiazid.
Giải mẫn cảm
Bệnh nhân dùng thuốc ức chế men chuyển trong quá trình điều trị giải mẫn cảm (ví dụ nọc độc loài hymenoptera) đã có những phản ứng loại phản vệ kéo dài. Ở cùng những bệnh nhân này, các phản ứng này đã không xảy ra khi thuốc ức chế men chuyển được tạm ngưng nhưng đã xuất hiện trở lại khi vô tình sử dụng lại.
Giảm bạch cầu trung tính/mất bạch cầu hạt
Giảm bạch cầu trung tính / mất bạch cầu hạt, giảm tiểu cầu và thiếu máu đã được ghi nhận ở các bệnh nhân đang dùng thuốc ức chế men chuyển angiotensin (ACE). Ở những bệnh nhân có chức năng thận bình thường và không có yếu tố phức tạp khác, hiếm khi xảy ra giảm bạch cầu trung tính. Triệu chứng giảm bạch cầu trung tính và mất bạch cầu hạt có thể phục hồi sau khi ngừng dùng các thuốc ức chế men chuyển angiotensin (ACE). Lisinopril nên được sử dụng hết sức thận trọng ở những bệnh nhân có bệnh collagen mạch máu, liệu pháp điều trị ức chế miễn dịch, điều trị bằng allopurinol hoặc procainamid, hoăc sự kết hợp của các yếu tố phức tạp, đặc biệt là nếu có chức năng thận suy giảm trước đó. Một số bệnh nhân bị nhiễm khuẩn nghiêm trọng, mà trong một số trường hợp không đáp ứng với điều trị tăng liều kháng sinh. Nếu lisinopril được sử dụng ở những bệnh nhân này, theo dõi định kỳ số lượng bạch cầu và bệnh nhân cần được hướng dẫn để báo cáo bất kỳ dấu hiệu của nhiễm khuẩn.
Chủng tộc
Thuốc ức chế men chuyển gây phù mạch ở người da đen với tỉ lệ cao hơn là ở người có màu da khác.
Cũng như các thuốc ức chế men chuyển khác, lisinopril có thể ít có tác động hạ huyết áp trên bệnh nhân da đen so với trên các nhóm bệnh nhân khác, có thể là do trạng thái renin thấp chiếm tỷ lệ cao ở nhóm bệnh nhân da đen tăng huyết áp.
Ho
Ho đã được ghi nhận khi sử dụng thuốc ức chế men chuyển. Điển hình là ho khan, dai dẳng và tự hết khi ngưng thuốc. Ho do thuốc ức chế men chuyển phải được xem xét khi chẩn đoán phân biệt nguyên nhân gây ho.
Lithi
Không khuyến khích phối hợp thuốc ức chế men chuyển angiotensin (ACE) và Lithi (xem phần "Tương tác với các thuốc khác và các dạng tương tác khác").
Xét nghiệm chống doping
Thuốc chứa hydrochlorothiazid có thể cho kết quả dương tính với các xét nghiệm chống doping
Thời kỳ mang thai
Không nên khởi đầu điều trị bằng các thuốc ức chế men chuyển angiotensin trong thời kỳ mang thai. Trừ khi việc tiếp tục điều trị bằng thuốc ức chế men chuyển angiotensin được xem là cần thiết, bệnh nhân có kế hoạch mang thai nên được thay đổi sang liệu pháp điều trị chống tăng huyết áp thay thế mà có dữ liệu an toàn sử dụng trong thời kỳ mang thai được thiết lập. Khi được chẩn đoán là mang thai, nên dừng lại ngay lập tức việc điều trị bằng thuốc ức chế men chuyển angiotensin, và, nếu thích hợp, nên bắt đầu áp dụng liệu pháp điều trị thay thế (xem phần “Chống chỉ định” và “Phụ nữ có thai và cho con bú”).
- Thai kỳ và cho con bú
Phụ nữ có thai
Thuốc ức chế men chuyển:
Không khuyến cáo dùng thuốc ức chế men chuyển trong 3 tháng đầu của thai kỳ.
Chống chỉ định dùng thuốc ức chế men chuyển cho phụ nữ có thai 3 tháng giữa và 3 tháng cuối của thai kỳ (xem phần “Chống chỉ định” và “Lưu ý đặc biệt và thận trọng khi sử dụng”).
Bằng chứng dịch tễ học liên quan đến nguy cơ gây quái thai sau khi dùng thuốc ức chế men chuyển trong ba tháng đầu của thai kỳ chưa được kết luận, tuy nhiên không thể loại trừ khả năng tăng nguy cơ nhẹ.
Trừ khi việc tiếp tục dùng thuốc ức chế men chuyển là cần thiết, bệnh nhân có kế hoạch mang thai nên chuyển sang dùng các thuốc chống tăng huyết áp khác mà có dữ liệu chứng minh an toàn cho phụ nữ có thai. Khi phát hiện mang thai, dừng ngay lập tức việc dùng thuốc ức chế men chuyển, và nên bắt đầu với liệu pháp điều trị thay thế nếu thích hợp.
Dùng thuốc ức chế men chuyển trong 3 tháng giữa và 3 tháng cuối của thai kỳ đã ghi nhận gây độc trên bào thai người (giảm chức năng thận, thiểu ối, chậm cốt hóa xương sọ) và độc tính trên trẻ sơ sinh (suy thận, hạ huyết áp, tăng kali huyết). Nếu dùng thuốc ức chế men chuyển trong 3 tháng giữa của thai kỳ, nên siêu âm kiểm tra chức năng thận và hộp sọ. Trẻ sơ sinh mà người mẹ dùng thuốc ức chế men chuyển phải được theo dõi chặt chẽ đề phòng hạ huyết áp (xem phần “Chống chỉ định” và “Lưu ý đặc biệt và thận trọng khi sử dụng”).
Hydrochlorothiazid:
Kinh nghiệm dùng hydrochlorothiazid trong khi mang thai còn hạn chế, đặc biệt trong 3 tháng đầu thai kỳ. Chưa có đầy đủ nghiên cứu trên động vật.
Hydrochlorothiazid đi qua hàng rào nhau thai. Dựa trên cơ chế tác dụng dược lý của hydrochlorothiazide, dùng hydrochlorothiazid trong 3 tháng giữa và 3 tháng cuối thai kỳ có thể ảnh hưởng đến sự tưới máu qua nhau thai và có thể gây ra tác động trên thai nhi và sơ sinh như vàng da, rối loạn cân bằng điện giải và giảm tiểu cầu.
Không nên dùng hydrochlorothiazide cho bệnh nhân phù trong thai kỳ, tăng huyết áp thai kỳ hoặc tiền sản giật do nguy cơ giảm thể tích huyết tương và giảm tưới máu nhau thai, và không có hiệu quả điều trị bệnh.
Không nên dùng hydrochlorothiazide để điều trị tăng huyết áp nguyên phát ở phụ nữ mang thai ngoại trừ những trường hợp hiếm gặp không thể sử dụng thuốc điều trị khác.
Phụ nữ cho con bú
Thuốc ức chế men chuyển:
Do chưa có thông tin về dùng lisinopril/hydrochlorothiazide trong giai đoạn cho con bú, không khuyến cáo dùng lisinopril/hydrochlorothiazide và nên sử dụng liệu pháp điều trị thay thế mà có dữ liệu an toàn tốt hơn trong giai đoạn cho con bú, đặc biệt khi chăm sóc cho trẻ mới sinh hoặc trẻ sinh non.
Hydrochlorothiazid
Hydrochlorothiazide được bài tiết lượng nhỏ qua sữa mẹ. Thiazid liều cao gây tác dụng bài niệu mạnh có thể ức chế quá trình tạo sữa. Không nên dùng lisinopril/hydrochlorothiazide trong thời gian cho con bú. Nếu lisinopril/hydrochlorothiazide được sử dụng trong thời gian cho con bú, nên sử dụng liều thấp nhất có thể.
- Khả năng lái xe và vận hành máy móc
Cũng như các thuốc chống tăng huyết áp khác, các sản phẩm kết hợp lisinopril/ hydrochlorothiazid có thể gây ảnh hưởng từ nhẹ đến trung bình đến khả năng lái xe và vận hành máy. Đặc biệt khi bắt đầu điều trị hoặc khi thay đổi liều, và khi dùng cùng với rượu, nhưng những ảnh hưởng này phụ thuộc vào sự nhạy cảm của từng bệnh nhân.
Khi lái xe hoặc vận hành máy, nên chú ý là thuốc có thể thỉnh thoảng gây chóng mặt hoặc mệt mỏi.
- Tương tác thuốc
Các thuốc trị tăng huyết áp
Khi kết hợp với các thuốc trị tăng huyết áp khác, tình trạng huyết áp hạ nhiều hơn có thể xảy ra. Sử dụng đồng thời glyceryl trinitrat và các nitrat khác hoặc thuốc giãn mạch có thể gây hạ huyết áp nhiều hơn.
Tránh dùng lisinopril kết hợp với các thuốc chứa aliskiren (xem phần “Chống chỉ định” và “Lưu ý đặc biệt và thận trọng khi sử dụng”).
Dữ liệu thử nghiệm lâm sàng cho thấy việc ức chế kép hệ renin-angiotensin-aldosterone (RAAS) thông qua phối hợp thuốc ức chế men chuyển, thuốc chẹn thụ thể angiotensin II hoặc aliskiren gây ra biến cố bất lợi có tần suất cao hơn như tụt huyết áp, tăng kali máu và suy giảm chức năng thận (bao gồm suy thận cấp) so với khi dùng các thuốc RAAS đơn trị liệu (riêng lẻ) (xem phần “Chống chỉ định”, “Lưu ý đặc biệt và thận trọng khi sử dụng”, "Đặc tính dược lực).
Thuốc có thể làm tăng nguy cơ phù mạch
Điều trị đồng thời thuốc ức chế men chuyển với thuốc ức chế rapamycin trúng đích trên động vật có vú (mTOR) (ví dụ: temsirolimus, sirolimus, everolimus) hoặc thuốc ức chế endopeptidase trung tính (NEP) (ví dụ racecadotril) hoặc thuốc kích hoạt plasminogen mô có thể làm tăng nguy cơ phù mạch.
Lithi
Tăng nồng độ lithi huyết thanh và độc tính có thể hồi phục đã được báo cáo trong khi dùng đồng thời lithi với thuốc ức chế men chuyển. Các thuốc này làm giảm độ thanh thải của lithi qua thận và gây tăng cao nguy cơ gây độc tính của lithi. Do đó, không nên phối hợp lisinopril và hydrochlorothiazid với lithi và theo dõi cẩn thận nồng độ lithi huyết thanh nếu cần thiết phải phối hợp (xem phần “Lưu ý đặc biệt và thận trọng khi sử dụng”).
Chất bổ sung kali, thuốc lợi tiểu giữ kali hoặc các chất thay thế muối kali và các thuốc khác có thể làm tăng nồng độ kali huyết thanh
Tác động mất kali của thuốc lợi tiểu thiazid thường giảm do tác động giữ kali của lisinopril. Sử dụng các thuốc bổ sung kali, thuốc giữ kali hay các chất thay thế muối có chứa kali, và các thuốc có thể làm tăng nồng độ kali huyết thanh, đặc biệt ở bệnh nhân tổn thương chức năng thận hoặc đái tháo đường, có thể làm tăng đáng kể kali huyết thanh. Nếu cần phải dùng phối hợp lisinopril/hydrochlorothiazid với bất kỳ các thuốc nào đã trình bày ở trên, thì cần sử dụng thận trọng và theo dõi thường xuyên nồng độ kali huyết thanh (xem phần “Lưu ý đặc biệt và thận trọng khi sử dụng”).
Thuốc gây xoắn đỉnh
Do có nguy cơ hạ kali máu, nên thận trọng khi dùng đồng thời hydrochlorothiazid với các thuốc gây xoắn đỉnh, ví dụ một số thuốc chống loạn nhịp, một số thuốc chống loạn thần và các thuốc khác đã được biết là gây xoắn đỉnh.
Thuốc chống trầm cảm 3 vòng / thuốc chống loạn thần / thuốc gây mê
Việc dùng đồng thời một số thuốc gây mê, thuốc chống trầm cảm 3 vòng và thuốc chống loạn thần với các thuốc ức chế men chuyển angiotensin có thể làm tiếp tục hạ huyết áp (xem phần “Lưu ý đặc biệt và thận trọng khi sử dụng”).
Thuốc kháng viêm Non-steroid (NSAIDs), bao gồm acid acetylsalicylic
Việc dùng lâu dài các thuốc NSAID (thuốc ức chế chọn lọc cyclooxygenase-2, acid acetylsalicylic &gt; 3 g/ngày và thuốc NSAID không chọn lọc) có thể làm giảm tác dụng hạ huyết áp và lợi tiểu của các thuốc ức chế men chuyển angiotensin và thuốc lợi tiểu thiazid. Thuốc NSAID và thuốc ức chế men chuyển angiotensin có thể gây tác dụng cộng hợp trên sự tăng kali huyết thanh và có thể dẫn đến suy giảm chức năng thận. Những tác động này thường hồi phục. Hiếm khi xảy ra suy thận cấp, nhất là là trên bệnh nhân có chức năng thận bị tổn thương như người cao tuổi hoặc đang bị mất nước.
Vàng
Phản ứng Nitritoid (triệu chứng của sự giãn mạch, mà có thể rất trầm trọng, bao gồm: đỏ bừng, buồn nôn, chóng mặt và hạ huyết áp) sau khi sử dụng Vàng dưới dạng tiêm (ví dụ: natri aurothiomalate) đã được ghi nhận thường xuyên xảy ra ở những bệnh nhân điều trị bằng thuốc ức chế men chuyển.
Thuốc kích thích hệ giao cảm
Thuốc kích thích hệ giao cảm có thể làm giảm tác dụng hạ huyết áp của thuốc ức chế men chuyển angiotensin. Thiazid có thể làm giảm đáp ứng động mạch với noradrenalin, nhưng không đủ làm giảm tác dụng hạ huyết áp của thuốc ức chế men chuyển.
Thuốc điều trị đái tháo đường
Điều trị bằng thuốc lợi tiểu thiazid có thể làm giảm dung nạp glucose. Hiện tượng có khả năng xảy ra trong những tuần đầu điều trị kết hợp và ở bệnh nhân suy thận.
Liều dùng thuốc điều trị đái tháo đường khác kể cả insulin ở bệnh nhân đái tháo đường có thể tăng, giảm, hoặc không đổi.
Thiazid có thể kích thích tác dụng tăng đường huyết của diazoxid.
Amphotericin B (thuốc tiêm/truyền), carbenoxolon, corticosteroid, corticotropin (ACTH) hoặc thuốc nhuận tràng kích thích
Tác dụng làm giảm kali của hydrochlorothiazid có thể tăng lên bởi các thuốc gây giảm kali và hạ kali máu (ví dụ: các thuốc lợi tiểu giữ kali khác, thuốc nhuận tràng, amphotericin, carbenxolon, các dẫn xuất acid salicylic).
Hạ kali máu có thể tăng khi dùng đồng thời với các thuốc steroid hoặc hormon adrenocorticotropic hormone (ACTH).
Các muối calci
Các thuốc lợi tiểu thiazid có thể tăng lên nồng độ calci huyết thanh do giảm bài tiết. Nếu cần bổ sung calci hoặc vitamin D, cần theo dõi nồng độ calci trong máu và điều chỉnh liều cho phù hợp.
Glycosid tim
Hạ kali máu có thể gây nhạy cảm hoặc làm tăng đáp ứng trên tim đối với các tác động gây độc của digitalis (ví dụ: tăng kích thích tâm thất).
Cholestyramine và colestipol
Colestipol hoặc cholestyramin làm giảm hấp thu của hydrochlorothiazid. Vì vậy, thuốc lợi tiểu sulphonamid cần được uống ít nhất trước 1 giờ hoặc sau 4-6 giờ kể từ khi uống các thuốc này.
Thuốc giãn cơ không khử cực
Thiazid có thể làm tăng sự đáp ứng với thuốc giãn cơ không khử cực (như tubocurarin).
Trimethoprim
Dùng đồng thời các thuốc ức chế men chuyển angiotensin và thiazid với trimethoprim làm tăng nguy cơ gia tăng kali máu.
Sotalol
Hạ kali máu do thiazid có thể làm tăng nguy cơ rối loạn nhịp tim do sotalol.
Allopurinol
Dùng đồng thời các chất ức chế men chuyển angiotensin và allopurinol làm tăng nguy cơ tổn thương thận và có thể làm tăng nguy cơ giảm bạch cầu.
Ciclosporin
Dùng đồng thời với ciclosporin có thể làm tăng nguy cơ tăng kali máu và biến chứng của bệnh gút. Điều trị đồng thời với ciclosporin có thể làm tăng nguy cơ tăng acid uric máu và biến chứng của bệnh gút.
Lovastatin
Dùng đồng thời các chất ức chế men chuyển angiotensin và lovastatin làm tăng nguy cơ tăng kali máu.
Thuốc kìm tế bào, thuốc ức chế miễn dịch, procainamid
Thiazid có thể làm giảm sự thải trừ qua thận của các thuốc gây độc tế bào (ví dụ cyclophosphamid, methotrexat) và làm tăng tác dụng ức chế tủy xương (xem phần “Lưu ý đặc biệt và thận trọng khi sử dụng”).
Co-trimoxazole (trimethoprim/sulfamethoxazole)
Bệnh nhân dùng đồng thời cotrimoxazol (trimethoprim/sulfamethoxazole) có thể làm tăng nguy cơ tăng kali máu (xem phần “Lưu ý đặc biệt và thận trọng khi sử dụng”).
Thiazid có thể làm tăng nguy cơ phản ứng ngoại ý của amantadine.
Hạ huyết áp thế đứng có thể trở nên trầm trọng hơn khi dùng đồng thời với rượu, barbiturat hoặc thuốc gây mê.
Khả năng lái xe và vận hành máy
Thuốc kết hợp lisinopril/hydrochlorothiazide có thể tác động từ nhẹ đến trung bình lên khả năng lái xe và vận hành máy (xem phần "Tác dụng không mong muốn”).
7. Dược lý- Dược động học (Tác động của cơ thể với thuốc)
Việc dùng đồng thời lisinopril và hydroclorothiazid có ít hoặc không có ảnh hưởng trên khả dụng sinh học của mỗi thuốc. Viên thuốc phối hợp 2 thành phần thì cân bằng sinh học như là dùng đồng thời 2 thành phần riêng lẻ.
Lisinopril
Hấp thu
Sau một liều uống lisinopril, nồng độ đỉnh của thuốc trong huyết thanh đạt đến trong 7 giờ, mặc dù thuốc có khuynh hướng đạt đến nồng độ đỉnh trong máu chậm hơn ở các bệnh nhân bị nhồi máu cơ tim cấp. Dựa vào lượng thuốc qua đường tiểu, độ hấp thu trung bình của lisinopril xấp xỉ 25%, với sự biến thiên giữa các bệnh nhân (6-60%) ở tất cả các liều lượng được đánh giá (5-80 mg). Độ khả dụng sinh học tuyệt đối giảm khoảng 16% ở bệnh nhân suy tim. Sự hấp thu của lisinopril không bị ảnh hưởng bởi thức ăn trong ống tiêu hóa.
Phân bố
Lisinopril hình như không liên kết với các protein trong huyết thanh ngoài men chuyển angiotensin trong máu (ACE). Nghiên cứu trên chuột cho thấy lisinopril kém qua hàng rào máu não.
Thải trừ
Lisinopril không bị chuyển hóa và được bài tiết dưới dạng không đổi chủ yếu qua nước tiểu. Khi dùng liều lặp lại, lisinopril có thời gian bán hủy có hiệu quả do tích lũy thuốc là 12,6 giờ. Độ thanh thải của lisinopril ở người khoẻ mạnh là khoảng 50 ml/phút. Nồng độ thuốc trong huyết thanh giảm dần cho thấy một giai đoạn cuối kéo dài mà không góp phần vào sự tích lũy thuốc. Giai đoạn cuối này có thể biểu hiện bằng việc gắn kết bão hòa với ACE và không tỷ lệ với liều lượng.
Bệnh nhân suy gan
Tổn thương chức năng gan ở bệnh nhân xơ gan đưa đến giảm hấp thu lisinopril (khoảng 30% được xác định bởi lượng thuốc qua đường tiểu) nhưng làm tăng nồng độ và mức tiếp xúc (khoảng 50%) so với người khoẻ mạnh do giảm độ thanh thải.
Bệnh nhân suy thận
Tổn thương chức năng thận làm giảm thải trừ lisinopril vốn được tiết qua thận nhưng sự giảm này chỉ có ý nghĩa lâm sàng khi mà độ lọc cầu thận dưới 30 ml/phút.
Bảng 1. Biến số dược động học của lisinopril đối với các nhóm bệnh nhân suy thận khác nhau sau khi dùng liều lặp lại 5 mg.
Chức năng thận, xác định theo hệ số thanh thải creatininnCmax
(ng/ml)
Tmax
(giờ)
AUC (0-24 giờ)
(ng/giờ/ml)
t1/2
(giờ)
&gt; 80 ml/phút640,36492+/-1726.0+/-1,1
30-80 ml/phút636,68555+/-36411.8+/-1.9
5-30 ml/phút6106,782228+/-93819.5+/-5.2
Ở bệnh nhân có hệ số thanh thải creatinin 30-80 ml/phút, AUC trung bình chỉ tăng lên 13%, trong khi AUC trung bình tăng gấp 4-5 lần ở bệnh nhân có hệ số thanh thải 5-30 ml/phút. Lisinopril có thể được loại ra khỏi cơ thể bằng thẩm phân. Trong 4 giờ thẩm phân máu, nồng độ lisinopril trong huyết tương giảm trung bình khoảng 60% với độ thanh thải thẩm phân trong khoảng 40 và 55 ml/phút.
Bệnh nhân suy tim
So với người khỏe mạnh, bệnh nhân suy tim có mức tiếp xúc của lisinopril lớn hơn (AUC tăng trung bình 125%), nhưng hấp thu giảm khoảng 16% dựa trên lượng thuốc lisinopril trong nước tiểu.
Người cao tuổi
Bệnh nhân cao tuổi có nồng độ thuốc trong máu và giá trị diện tích dưới đường cong biểu diễn nồng độ thuốc trong huyết tương theo thời gian sẽ cao hơn (tăng khoảng 60%) so với bệnh nhân trẻ tuổi.
Hydroclorothiazid: khi theo dõi nồng độ thuốc trong huyết tương ít nhất 24 giờ, thời gian bán hủy trong huyết tương được ghi nhận là thay đổi từ 5,6 đến 14,8 giờ. Tối thiểu là 61% liều dùng được đào thải dưới dạng không đổi trong vòng 24 giờ. Sau khi uống thuốc lợi tiểu hydroclorothiazid, sự bài niệu bắt đầu trong vòng 2 giờ, nồng độ đỉnh đạt được trong khoảng 4 giờ và kéo dài từ 6-12 giờ. Hydroclorothiazid đi qua nhau thai nhưng không qua hàng rào máu não.
- Dược lực học (Tác động của thuốc lên cơ thể)
Nhóm trị liệu: ức chế men chuyển và lợi tiểu
Mã ATC: C09BA03
Zestoretic là một sản phẩm phối hợp liều cố định chứa lisinopril, một chất ức chế men chuyển angiotensin (ACE), và hydroclorothiazid, thuốc lợi tiểu nhóm thiazid. Cả 2 thành phần đều có tác động tối ưu và tác động hạ huyết áp cộng hợp.
Lisinopril
Cơ chế tác dụng
Lisinopril là chất ức chế men peptidyl dipeptidase. Lisinopril ức chế men chuyển angiotensin (ACE), chất xúc tác sự chuyển đổi angiotensin I thành chất peptid co mạch là angiotensin II. Angiotensin II cũng kích thích sự tiết aldosteron từ vỏ thượng thận. Sự ức chế ACE làm giảm nồng độ angiotensin II dẫn đến giảm hoạt tính co mạch và giảm tiết aldosteron. Sự giảm tiết aldosteron có thể dẫn đến gia tăng nồng độ kali huyết thanh.
Tác dụng dược lực
Trong khi cơ chế tác dụng hạ huyết áp của lisinopril được nghĩ chủ yếu là do sự ức chế hệ thống renin-angiotensin-aldosteron, lisinopril vẫn có tác dụng điều trị tăng huyết áp ngay cả ở những bệnh nhân bị tăng huyết áp có nồng độ renin thấp. ACE hoàn toàn giống kininase II, là men thoái biến bradykinin. Nồng độ gia tăng của bradykinin, một peptid giãn mạch, có đóng vai trò trong hiệu quả điều trị của lisinopril hay không vẫn còn là một vấn đề cần phải làm sáng tỏ.
An toàn hiệu quả và lâm sàng
Thuốc tác động lên hệ thống Renin-angiotensin (RAS)
Hai thử nghiệm lâm sàng lớn ngẫu nhiên có kiểm soát [ONTARGET (ONgoing Telmisartan Alone and in combination with Ramipril global Endpoint Trial) và VA NEPHRON-D (The Veterans Affairs Nephropathy in Diabetes)] đã khảo sát việc dùng kết hợp thuốc ức chế men chuyển và thuốc chẹn thụ thể angiotensin II.
ONTARGET là một nghiên cứu thực hiện trên bệnh nhân có tiền sử bệnh tim mạch hoặc bệnh mạch máu não, hoặc đái tháo đường týp 2 kèm theo bằng chứng tổn thương các cơ quan đích. VA NEPHRON-D là nghiên cứu trên bệnh nhân đái tháo đường týp 2 và bệnh thận do đái tháo đường.
Những nghiên cứu này cho thấy không có lợi ích đáng kể trên thận, tim mạch và tỷ lệ tử vong, trong khi tăng nguy cơ tăng kali máu, tổn thương thận cấp tính và/hoặc hạ huyết áp so với đơn trị liệu. Với đặc tính dược lực học tương tự, những kết quả này cũng liên quan đến thuốc ức chế men chuyển và thuốc chẹn thụ thể angiotensin II.
Vì thế, không nên dùng đồng thời thuốc ức chế men chuyển và thuốc chẹn thụ thể angiotensin II trên bệnh nhân thận do đái tháo đường.
ALITITUDE (Aliskiren Trial in Type 2 Diabetes Using Cardiovascular and Renal Disease Endpoints) là một nghiên cứu được thiết kế để kiểm tra lợi ích của việc bổ sung aliskiren vào liệu pháp thuốc ức chế men chuyển hoặc thuốc chẹn thụ thể angiotensin II chuẩn trên bệnh nhân đái tháo đường týp 2 và bệnh thận mãn tính, bệnh tim mạch hoặc cả hai. Nghiên cứu đã phải kết thúc sớm vì tăng nguy cơ kết quả bất lợi cả hai biến cố. Tử vong do tim mạch và đột quỵ đều xảy ra nhiều hơn ở nhóm dùng aliskiren so với nhóm dùng giả dược. Biến cố bất lợi và biến cố bất lợi nghiêm trọng (tăng kali máu, hạ huyết áp, rối loạn chức năng thận) được báo cáo nhiều hơn ở nhóm aliskiren so với nhóm giả dược.
Hydroclorothiazid
Cơ chế tác dụng
Hydroclorothiazid là thuốc lợi tiểu và điều trị tăng huyết áp. Nó ảnh hưởng đến cơ chế của sự tái hấp thu chất điện giải ở ống lượn xa và làm tăng sự bài tiết natri và clorid với lượng tương đương nhau. Tăng bài tiết natri niệu có thể đi kèm với sự mất kali và bicarbonat. Cơ chế của tác động điều trị tăng huyết áp của thiazid chưa được biết.
Tác dụng dược lực
Thiazid thường không ảnh hưởng đến huyết áp bình thường.
8. Thông tin thêm- Đặc điểm
Viên nén không bao, màu trắng, hình tròn, một mặt được khắc 20 12.5, mặt còn lại có đường bẻ viên.
- Bảo quản
Bảo quản ở nhiệt độ không quá 30°C. Tránh ánh sáng.
- Hạn dùng
36 tháng kể từ ngày sản xuất.
- Quy cách đóng gói
Hộp 2 vỉ x 14 viên.
- Nhà sản xuất
AstraZeneca Pharmaceutical Co., Ltd.', 'Liều thông thường là một viên, dùng một lần/ngày. Cũng như các thuốc khác dùng 1 lần duy nhất/ngày, Zestoretic nên được uống vào cùng 1 thời điểm trong ngày.
Nói chung, nếu không đạt được hiệu quả điều trị mong muốn trong thời gian 2-4 tuần ở liều điều trị này thì có thể tăng liều lên hai viên, 1 lần/ngày.
Liều cho bệnh nhân suy thận:
Các thiazid có thể không phải là thuốc lợi tiểu phù hợp cho bệnh nhân suy thận và không hiệu quả ở mức độ thanh thải creatinin ≤ 30 ml/phút (có nghĩa là suy thận trung bình hay nặng).
Zestoretic không được dùng cho điều trị khởi đầu ở bệnh nhân suy thận.
Ở bệnh nhân có độ thanh thải creatinin từ 30 đến 80 ml/phút, Zestoretic có thể được dùng nhưng chỉ sau khi đã điều chỉnh liều theo từng thành phần riêng của phối hợp thuốc. Liều khởi đầu lisinopril được đề nghị khi sử dụng đơn lẻ ở bệnh nhân suy thận nhẹ là 5-10 mg.
Điều trị bằng lợi tiểu trước đó:
Hạ huyết áp có triệu chứng có thể xảy ra sau liều khởi đầu Zestoretic. Điều này dễ xảy ra ở bệnh nhân bị giảm thể tích nước và/hoặc chất điện giải do điều trị bằng thuốc lợi tiểu trước đó. Nên ngưng điều trị bằng thuốc lợi tiểu 2-3 ngày trước khi dùng Zestoretic.
Nếu không thể ngưng thuốc lợi tiểu, thì chỉ nên bắt đầu điều trị riêng lẻ bằng lisinopril với liều là 5 mg.
Sử dụng thuốc ở trẻ em:
Tính an toàn và hiệu quả của thuốc trên trẻ em chưa được xác lập.
Sử dụng thuốc ở người cao tuổi:
Trong các nghiên cứu lâm sàng, hiệu quả và sự dung nạp của lisinopril và hydroclorothiazid dùng phối hợp thì tương đương nhau ở cả người lớn tuổi và người trẻ bị tăng huyết áp.
Lisinopril với khoảng liều dùng hàng ngày từ 20 mg đến 80 mg cho hiệu quả tương đương ở bệnh nhân cao tuổi bị tăng huyết áp (≥ 65 tuổi) và bệnh nhân tăng huyết áp không thuộc nhóm người cao tuổi. Ở bệnh nhân cao tuổi bị tăng huyết áp, đơn trị liệu bằng lisinopril có hiệu quả trong việc làm giảm huyết áp tâm trương tương đương với đơn trị liệu bằng hydroclorothiazid hoặc atenolol. Các nghiên cứu lâm sàng cho thấy tuổi tác không ảnh hưởng lên sự dung nạp lisinopril.
- Quá liều
Triệu chứng
Dữ liệu quá liều ở người còn hạn chế. Các triệu chứng liên quan đến quá liều thuốc ức chế men chuyển bao gồm tụt huyết áp, sốc tuần hoàn, rối loạn điện giải, suy thận, thở nhanh, nhịp tim nhanh, đánh trống ngực, nhịp tim chậm, chóng mặt, lo lắng và ho.
Các triệu chứng khi dùng quá liều hydrochlorothiazid là tăng bài niệu, suy giảm nhận thức (hôn mê), co giật, liệt, rối loạn nhịp tim và suy thận. Các triệu chứng khác của hydrochlorothiazid là tăng bài niệu, trầm cảm về ý thức (hôn mê), co giật, liệt, rối loạn nhịp tim và suy thận.
Nếu có dùng kèm thuốc trợ tim digitalis, tình trạng hạ kali máu có thể gây nên loạn nhịp tim.
Xử trí
Khuyến cáo xử trí quá liều là truyền tĩnh mạch dung dịch muối sinh lý. Nếu tụt huyết áp nặng xảy ra, nên đặt bệnh nhân ở tư thế nằm ngửa. Cũng có thể xem xét điều trị với angiotensin II đường truyền và/hoặc catecholamin tiêm tĩnh mạch nếu có sẵn. Nếu mới uống thuốc, áp dụng các biện pháp nhằm đào thải lisinopril (như gây nôn, rửa dạ dày, uống chất hấp thụ và natri sulfat). Có thể loại lisinopril ra khỏi hệ tuần hoàn bằng phương pháp thẩm phân máu (xem phần “Lưu ý đặc biệt và thận trọng khi sử dụng”). Đặt máy tạo nhịp được chỉ định trong tình trạng chậm nhịp tim kháng trị. Cần theo dõi thường xuyên các dấu hiệu sinh tồn, nồng độ chất điện giải và creatinin trong huyết thanh.
Nhịp tim chậm hoặc các phản ứng thần kinh phế vị kéo dài nên được điều trị triệu chứng bằng atropin.', 'Bảo quản ở nhiệt độ không quá 30°C. Tránh ánh sáng.', NULL, NULL);

INSERT INTO medicine_group_medicines (group_id, medicine_id) VALUES
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc nhỏ mắt, tra mắt'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000053')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc nhỏ mắt, tra mắt'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000057')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc nhỏ mắt, tra mắt'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000066')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc nhỏ mắt, tra mắt'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000048')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc nhỏ mắt, tra mắt'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000059')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc nhỏ mắt, tra mắt'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000050')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc nhỏ mắt, tra mắt'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000052')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc nhỏ mắt, tra mắt'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000039')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc nhỏ mắt, tra mắt'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000049')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc bổ và vitamin'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000094')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc bổ và vitamin'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000085')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc bổ và vitamin'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000088')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc bổ và vitamin'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193661000083')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc bổ và vitamin'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000788')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc bổ và vitamin'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000829')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc bổ và vitamin'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193689000053')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc bổ và vitamin'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000810')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc bổ và vitamin'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000821')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc bổ và vitamin'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193689000074')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc đau đầu, hạ sốt'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193684000037')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc đau đầu, hạ sốt'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193684000076')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc đau đầu, hạ sốt'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193687000227')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc dị ứng, say xe'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193696000038')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc dị ứng, say xe'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193696000032')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc dị ứng, say xe'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193661000040')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc dị ứng, say xe'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193661000031')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc dị ứng, say xe'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193661000027')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc kháng sinh'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193686000098')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc kháng sinh'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193685000026')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc kháng sinh'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193686000087')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc kháng sinh'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193686000092')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc kháng sinh'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193686000088')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc kháng sinh'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193686000077')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc kháng sinh'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193686000082')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc trị bệnh da liễu'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000102')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc trị bệnh da liễu'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193689000205')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc trị bệnh da liễu'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000113')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc trị bệnh da liễu'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000105')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc trị bệnh da liễu'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000122')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc trị bệnh da liễu'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000119')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc trị bệnh da liễu'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000108')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc trị bệnh da liễu'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000153')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc trị bệnh da liễu'), (SELECT medicine_id FROM medicines WHERE medicine_code = '9253123000095')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc trị bệnh da liễu'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000125')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc trị bệnh da liễu'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000103')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc trị đau dạ dày, cơ trơn'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000108')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc trị đau dạ dày, cơ trơn'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000097')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc trị đau dạ dày, cơ trơn'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000065')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc trị đau dạ dày, cơ trơn'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000088')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc trị đau dạ dày, cơ trơn'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000098')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc trị đau dạ dày, cơ trơn'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000288')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc trị đau dạ dày, cơ trơn'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000126')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc trị đau dạ dày, cơ trơn'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000076')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc tim mạch, huyết áp'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000151')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc tim mạch, huyết áp'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000111')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc tim mạch, huyết áp'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000144')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc tim mạch, huyết áp'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000137')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc tim mạch, huyết áp'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000112')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc tim mạch, huyết áp'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000145')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc tim mạch, huyết áp'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000148')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc tim mạch, huyết áp'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000099')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc tim mạch, huyết áp'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000139')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc tim mạch, huyết áp'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193689000046')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc tim mạch, huyết áp'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000154')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc tim mạch, huyết áp'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000155')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc tim mạch, huyết áp'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000142')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc tim mạch, huyết áp'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000162')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc tim mạch, huyết áp'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000147')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc tim mạch, huyết áp'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000146')),
((SELECT group_id FROM medicine_groups WHERE group_name = 'Thuốc tim mạch, huyết áp'), (SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000105'));

INSERT INTO medicine_ingredient_details (medicine_id, ingredient_id, strength) VALUES
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000053'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Natri clorid'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000057'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Neomycin'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000057'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Dexamethason'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000057'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Polymyxin B'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000066'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Neomycin'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000066'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Dexamethason'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000066'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Polymyxin B'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000048'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Natri clorid'), '90mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000059'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Ofloxacin'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000050'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Ofloxacin'), '15mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000052'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Natri clorid'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000039'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Chlorpheniramine Maleate'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000039'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Acid aminocaproic'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000039'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Sulfamethoxazol'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000039'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Dipotassium Glycyrrhizinate'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193664000049'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Moxifloxacin'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000094'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Calci'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000094'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Vitamin B3'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000094'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Vitamin B5'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000094'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Vitamin B9'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000094'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Biotin'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000094'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Vitamin C'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000094'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Vitamin B6'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000094'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Vitamin B2'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000094'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Vitamin B1'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000094'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Magnesium'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000094'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Kẽm'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000094'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Vitamin B12'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000085'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Vitamin C'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000085'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Calci carbonat'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000088'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Calci cacbonat'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193661000083'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Ascorbic acid'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193668000788'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Kẽm'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193689000053'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Hà thủ ô đỏ'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193689000074'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Phục linh'), '12g'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193689000074'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Hoài sơn'), '16g'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193689000074'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Thục địa'), '32g'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193689000074'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Sơn thù'), '16g'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193689000074'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Trạch tả'), '12g'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193689000074'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Mẫu đơn bì'), '12g'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193684000037'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Paracetamol'), '300 mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193684000076'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Paracetamol'), '325mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193687000227'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Paracetamol'), '650mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193696000038'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Cetirizine dihydrochloride'), '10 mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193696000032'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Loratadin'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193661000040'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Desloratadin'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193661000031'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Loratadine'), '60 mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193661000027'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Desloratadin'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193686000098'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Amoxicillin'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193685000026'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Acid clavulanic'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193685000026'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Amoxicillin'), '250mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193686000087'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Clarithromycin'), '250mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193686000092'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Clindamycin'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193686000088'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Erythromycin'), '500mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193686000077'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Levofloxacin'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193686000082'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Ciprofloxacin'), '500mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000102'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Acyclovir'), '250mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193689000205'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Adapalen'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000113'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Clobetason butyrat'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000105'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Fluocinolon acetonid'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000122'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Betamethason'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000122'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Acid Fusidic'), '20mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000119'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Clotrimazol'), '100mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000119'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Betamethason'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000119'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Gentamicin'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000108'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Clotrimazol'), '100mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000108'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Betamethason'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000108'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Gentamicin'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000153'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Hydrocortison acetat'), '100mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '9253123000095'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Ketoconazol'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000125'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Hydroquinone'), '400mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193678000103'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Clobetasol'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000108'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Omeprazole'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000097'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Lansoprazole'), '30mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000065'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Simethicon'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000065'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Alverin'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000088'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Esomeprazole'), '20mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000098'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Esomeprazol'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000288'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Drotaverine hydrochloride'), '40mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000126'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Esomeprazol'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193682000076'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Trimebutin maleat'), '100mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000151'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Amlodipin'), '5mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000111'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Irbesartan'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000144'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Irbesartan'), '300mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000137'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Candesartan Cilexetil'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000112'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Metoprolol tartrate'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000145'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Bisoprolol fumarat'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000148'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Irbesartan'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000148'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Hydrochlorothiazid'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000099'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Irbesartan'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000099'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Hydrochlorothiazid'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000139'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Amiodarone hydrochloride'), '200mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193689000046'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Natri camphosulfonat'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193689000046'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Lạc tiên'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000154'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Perindopril'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000155'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Valsartan'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000142'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Valsartan'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000162'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Trimetazidin dihydroclorid'), '20mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000147'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Kali clorid'), '600mg'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000146'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Nifedipin'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000105'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Lisinopril'), 'Chưa rõ'),
((SELECT medicine_id FROM medicines WHERE medicine_code = '1193681000105'), (SELECT ingredient_id FROM active_ingredients WHERE ingredient_name = 'Hydrochlorothiazide'), 'Chưa rõ');

