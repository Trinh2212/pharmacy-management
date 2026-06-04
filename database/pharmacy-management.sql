CREATE DATABASE pharmacy_management;
USE pharmacy_management;

CREATE TABLE medicine_groups (
    group_id        INT AUTO_INCREMENT PRIMARY KEY,
    group_name      VARCHAR(50) NOT NULL,
    description     VARCHAR(255),

    created_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at      TIMESTAMP   NULL DEFAULT NULL
);

CREATE TABLE suppliers (
    supplier_id     INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name   VARCHAR(50) NOT NULL,
    address         VARCHAR(255),
    email           VARCHAR(100),
    phone_number    VARCHAR(10),

    created_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at      TIMESTAMP   NULL DEFAULT NULL
);

CREATE TABLE active_ingredients (
    ingredient_id   INT AUTO_INCREMENT PRIMARY KEY,
    ingredient_name VARCHAR(100) NOT NULL,

    created_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at      TIMESTAMP   NULL DEFAULT NULL
);

CREATE TABLE employees (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    employee_code   VARCHAR(10)  NOT NULL UNIQUE,    
    full_name       VARCHAR(50)  NOT NULL,
    dob             DATE,
    gender          ENUM('nam', 'nữ', 'khác'),
    address         VARCHAR(100),
    phone_number    VARCHAR(10)  NOT NULL,
    hire_date       DATE,

    created_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at      TIMESTAMP   NULL DEFAULT NULL
);

CREATE TABLE accounts (
    account_id      INT AUTO_INCREMENT PRIMARY KEY,
    user_name        VARCHAR(100) NOT NULL UNIQUE,
    password        VARCHAR(255) NOT NULL,              
    email           VARCHAR(100) UNIQUE,
    avatar_url      TEXT,
    role            ENUM('admin', 'nhân viên kho', 'nhân viên quản lý sản phẩm')
                        NOT NULL DEFAULT 'nhân viên quản lý sản phẩm',
    status          ENUM('hoạt động', 'bị khóa')    NOT NULL DEFAULT 'hoạt động',
    id              INT UNIQUE NOT NULL,                

    created_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at      TIMESTAMP   NULL DEFAULT NULL,

    CONSTRAINT fk_accounts_employees FOREIGN KEY (id)   REFERENCES employees(id)    
        ON UPDATE CASCADE ON DELETE RESTRICT
);

-- sl của thuốc thì tính tổng sl tồn kho của thuốc với tất cả batch của thuốc đó
CREATE TABLE medicines (
    medicine_id     INT AUTO_INCREMENT PRIMARY KEY,
    medicine_code   VARCHAR(50) NOT NULL UNIQUE,  -- mã nội bộ để hiển thị
    brand_name      VARCHAR(100)    NOT NULL,
    image_url       TEXT,                   -- lưu đường dẫn ảnh
    origin          VARCHAR(50),
    status          ENUM('đang cung cấp', 'ngừng cung cấp', 'hết hàng')
                        NOT NULL DEFAULT 'đang cung cấp',
    price           DECIMAL(12,2) NOT NULL CHECK (price >= 0),
    registration_number VARCHAR(50)   NOT NULL UNIQUE,
    unit            ENUM('Viên','Vỉ','Hộp','Chai','Lọ','Tuýp','Gói','Ống','Bình xịt','Miếng dán')   NOT NULL,
    group_id        INT,                            

    created_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at      TIMESTAMP   NULL DEFAULT NULL,

    CONSTRAINT fk_medicines_groups FOREIGN KEY (group_id)   REFERENCES medicine_groups(group_id)
        ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE medicine_ingredient_details (
    medicine_id     INT          NOT NULL,
    ingredient_id   INT          NOT NULL,
    strength        VARCHAR(50)  NOT NULL,     -- hàm lượng / nồng độ         

    PRIMARY KEY (medicine_id, ingredient_id),
    CONSTRAINT fk_mid_medicines    FOREIGN KEY (medicine_id)
        REFERENCES medicines(medicine_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_mid_ingredients FOREIGN KEY (ingredient_id)
        REFERENCES active_ingredients(ingredient_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE usage_instructions (
    instruction_id  INT AUTO_INCREMENT PRIMARY KEY,
    medicine_id     INT NOT NULL,   

    dosage_form     VARCHAR(100), -- dạng bào chế 
    packaging       TEXT, -- quy cách đóng gói 
    uses            TEXT, -- công dụng
    indications     TEXT, -- chỉ định 
    contraindications    TEXT, -- chống chỉ định 
    side_effects    TEXT, -- tác dụng phụ 
    dosage          TEXT, -- liều dùng 
    administration  TEXT,   -- cách dùng 
    storage_condition    TEXT, -- bảo quản 
    warning         TEXT, -- cảnh báo

    CONSTRAINT fk_ui_medicines FOREIGN KEY (medicine_id)
        REFERENCES medicines(medicine_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE batches (
    batch_id        INT          AUTO_INCREMENT PRIMARY KEY,
    medicine_id     INT          NOT NULL,          
    batch_number    VARCHAR(50)  NOT NULL,
    production_date DATE         NOT NULL,
    expiry_date     DATE         NOT NULL,
    stock_quantity  INT          NOT NULL DEFAULT 0 CHECK (stock_quantity >= 0),

    created_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at      TIMESTAMP   NULL DEFAULT NULL,

    CONSTRAINT fk_batches_medicines    FOREIGN KEY (medicine_id)
        REFERENCES medicines(medicine_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_expiry_date CHECK (expiry_date > production_date)
);

CREATE TABLE warehouse_receipts (
    receipt_id      INT     NOT NULL AUTO_INCREMENT PRIMARY KEY,
    receipt_code    VARCHAR(20)   NOT NULL UNIQUE,  
    receipt_date    DATE          NOT NULL DEFAULT (CURRENT_DATE),
    total_price     DECIMAL(15,2) NOT NULL DEFAULT 0 CHECK (total_price >= 0),
    supplier_id     INT           NOT NULL,       
    employee_id     INT,                            

    created_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_wr_suppliers  FOREIGN KEY (supplier_id)
        REFERENCES suppliers(supplier_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_wr_employees FOREIGN KEY (employee_id)
        REFERENCES employees(id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE warehouse_receipt_details (
    receipt_id     INT           NOT NULL,
    batch_id           INT           NOT NULL,
    import_quantity     INT           NOT NULL CHECK (import_quantity > 0),
    import_price      DECIMAL(12,2) NOT NULL CHECK (import_price >= 0),

    PRIMARY KEY (receipt_id, batch_id),
    CONSTRAINT fk_wrd_wr FOREIGN KEY (receipt_id)
        REFERENCES warehouse_receipts(receipt_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_wrd_batches    FOREIGN KEY (batch_id)
        REFERENCES batches(batch_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);


DELIMITER $$

CREATE TRIGGER generate_employee_code
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    DECLARE new_code INT;
    SELECT AUTO_INCREMENT INTO new_code
    FROM information_schema.TABLES
    WHERE TABLE_SCHEMA = 'pharmacy_management'
      AND TABLE_NAME = 'employees';
    SET NEW.employee_code = CONCAT('NV', LPAD(new_code, 3, '0'));
END$$

DELIMITER ;
