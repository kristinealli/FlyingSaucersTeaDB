-- Create tables

CREATE TABLE TEA (
    tea_id SERIAL PRIMARY KEY,
    blend_name VARCHAR(100) NOT NULL,
    tasting_notes VARCHAR(1000),
    date_of_purchase DATE,
    price DECIMAL,
    origin VARCHAR(128),
    caffeine BOOLEAN NOT NULL,
    supplier_id TINYINT REFERENCES SUPPLIER(supplier_id),
    variety_type TINYINT REFERENCES VARIETY(type),
    brewing_temp_F DECIMAL(3),
    brewing_temp_C DECIMAL(3),
    brewing_time_min TINYINT,
    tsp_per_cup TINYINT,
    collection_id TINYINT REFERENCES COLLECTION(collection_id)
);

CREATE TABLE RATING (
    rating_id SERIAL PRIMARY KEY,
    review_comments VARCHAR(1000),
    ranking TINYINT CHECK (ranking BETWEEN 1 and 5),
    tea_id TINYINT REFERENCES TEA(tea_id),
    user_id TINYINT REFERENCES USER(user_id)
);

CREATE TABLE USER (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL
);

CREATE TABLE COLLECTION (
    collection_id SERIAL PRIMARY KEY,
    collection_name VARCHAR(255) NOT NULL,
    date_created DATE,
    created_by_user_id TINYINT REFERENCES USER(user_id)
);

CREATE TABLE VARIETY (
    type VARCHAR(50) PRIMARY KEY,
    standard_brewing_temp_F DECIMAL(3),
    standard_brewing_temp_C DECIMAL(3),
    standard_brewing_time_minutes TINYINT,
    standard_tsp_per_cup TINYINT
);

CREATE TABLE SUPPLIER (
    supplier_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    location VARCHAR(255),
    logo_path VARCHAR(255),
    website VARCHAR(255)
);

-- Create relationships
ALTER TABLE TEA ADD CONSTRAINT fk_tea_supplier FOREIGN KEY (supplier_id) REFERENCES SUPPLIER(supplier_id);
ALTER TABLE TEA ADD CONSTRAINT fk_tea_variety FOREIGN KEY (variety_type) REFERENCES VARIETY(type);
ALTER TABLE RATING ADD CONSTRAINT fk_rating_tea FOREIGN KEY (tea_id) REFERENCES TEA(tea_id);
ALTER TABLE RATING ADD CONSTRAINT fk_rating_user FOREIGN KEY (user_id) REFERENCES USER(user_id);
ALTER TABLE COLLECTION ADD CONSTRAINT fk_collection_user FOREIGN KEY (user_id) REFERENCES USER(user_id);

