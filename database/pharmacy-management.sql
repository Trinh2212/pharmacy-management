CREATE DATABASE pharmacy_management;
USE pharmacy_management;

CREATE TABLE medicine_groups (
    group_id        INT AUTO_INCREMENT PRIMARY KEY,
    group_name      VARCHAR(50) NOT NULL UNIQUE,
    description     VARCHAR(255),

    created_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at      TIMESTAMP   NULL DEFAULT NULL
);

CREATE TABLE suppliers (
    supplier_id     INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name   VARCHAR(50) NOT NULL UNIQUE,
    address         VARCHAR(255) ,
    email           VARCHAR(100) NOT NULL,
    phone_number    VARCHAR(10) NOT NULL,

    created_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at      TIMESTAMP   NULL DEFAULT NULL
);

CREATE TABLE active_ingredients (
    ingredient_id   INT AUTO_INCREMENT PRIMARY KEY,
    ingredient_name VARCHAR(100) NOT NULL UNIQUE,

    created_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at      TIMESTAMP   NULL DEFAULT NULL
);

CREATE TABLE employees (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    employee_code   VARCHAR(10)  NOT NULL UNIQUE,    
    full_name       VARCHAR(50)  NOT NULL,
    dob             DATE,
    gender          ENUM('nam', 'nữ', 'khác') NOT NULL DEFAULT 'khác',
    address         VARCHAR(100),
    phone_number    VARCHAR(10)  NOT NULL UNIQUE,
    email           VARCHAR(100) NOT NULL UNIQUE,
    password        VARCHAR(255) NOT NULL,
    avatar_url      TEXT,
    role            ENUM('admin', 'employee') NOT NULL DEFAULT 'employee',
    is_locked       BOOLEAN NOT NULL DEFAULT false,
    hire_date       DATE,
    
    created_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at      TIMESTAMP   NULL DEFAULT NULL
);

-- sl của thuốc thì tính tổng sl tồn kho của thuốc với tất cả batch của thuốc đó
CREATE TABLE medicines (
    medicine_id     INT AUTO_INCREMENT PRIMARY KEY,
    medicine_code   VARCHAR(50) NOT NULL UNIQUE,  -- mã nội bộ để hiển thị
    brand_name      VARCHAR(100)  NOT NULL,
    image_url       TEXT,                   -- lưu đường dẫn ảnh
    origin          VARCHAR(50),
    status          ENUM('đang cung cấp', 'ngừng cung cấp')
                        NOT NULL DEFAULT 'đang cung cấp',
    price           DECIMAL(12,2) NOT NULL CHECK (price >= 0),
    registration_number VARCHAR(50)   NOT NULL UNIQUE,
    unit            ENUM('Viên','Vỉ','Hộp','Chai','Lọ','Tuýp','Gói','Ống','Bình xịt','Miếng dán')   NOT NULL,                        
	embedding_vector JSON,

    created_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at      TIMESTAMP   NULL DEFAULT NULL
);

CREATE TABLE medicine_group_medicines (
    group_id INT NOT NULL,
    medicine_id INT NOT NULL,

    PRIMARY KEY (group_id, medicine_id),

    FOREIGN KEY (group_id) REFERENCES medicine_groups(group_id),
    FOREIGN KEY (medicine_id) REFERENCES medicines(medicine_id)
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
    medicine_id     INT NOT NULL UNIQUE,   

    dosage_form     TEXT, -- dạng bào chế
    packaging       TEXT, -- quy cách đóng gói 
    uses            TEXT, -- công dụng
    contraindications    TEXT, -- chống chỉ định 
    side_effects    TEXT, -- tác dụng phụ 
    dosage_administration          TEXT, -- liều dùng & cách dùng 
    storage_condition    TEXT, -- bảo quản 
    warning         TEXT, -- cảnh báo - thận trọng 
    document        TEXT,

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
    CONSTRAINT chk_expiry_date CHECK (expiry_date > production_date),
    CONSTRAINT unique_med_batch UNIQUE (medicine_id, batch_number)
);

CREATE TABLE warehouse_receipts (
    receipt_id      INT     NOT NULL AUTO_INCREMENT PRIMARY KEY,
    receipt_code    VARCHAR(20)   NOT NULL UNIQUE,  
    receipt_date    DATE          NOT NULL DEFAULT (CURRENT_DATE),
    total_price     DECIMAL(15,2) NOT NULL DEFAULT 0 CHECK (total_price >= 0),
    supplier_id     INT           NOT NULL,       
    employee_id     INT NOT NULL,                            

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
