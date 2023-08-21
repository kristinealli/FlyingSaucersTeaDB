-- Create tables

CREATE TABLE TEA (
    tea_id SERIAL PRIMARY KEY,
    blend_name VARCHAR(255) NOT NULL,
    tasting_notes VARCHAR(255),
    date_of_purchase DATE,
    price DECIMAL,
    origin VARCHAR(255),
    caffeine BOOLEAN NOT NULL,
    supplier_id VARCHAR(255) REFERENCES SUPPLIER(supplier_id),
    variety_type VARCHAR(255) REFERENCES VARIETY(type),
);

CREATE TABLE RATING (
    rating_id SERIAL PRIMARY KEY,
    review_comments VARCHAR(255),
    ranking TINYINT CHECK (ranking BETWEEN 1 and 5),
    tea_id INTEGER REFERENCES TEA(tea_id),
    user_id INTEGER REFERENCES USER(user_id)
);

CREATE TABLE USER (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE COLLECTION (
    collection_id SERIAL PRIMARY KEY,
    collection_name VARCHAR(255) NOT NULL,
    date_created DATE,
    created_by_user_id INTEGER REFERENCES USER(user_id)
);

CREATE TABLE VARIETY (
    type VARCHAR(255) PRIMARY KEY,
    brewing_temp_F DECIMAL(5,2),
    brewing_temp_C DECIMAL(5,2),
    brewing_time_minutes TINYINT,
    tsp_per_cup TINYINT
);

CREATE TABLE SUPPLIER (
    supplier_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    location VARCHAR(255),
    logo_path VARCHAR(255),
    website VARCHAR(255)
);

-- Create relationships

-- Create relationships
ALTER TABLE TEA ADD CONSTRAINT fk_tea_supplier FOREIGN KEY (supplier_id) REFERENCES SUPPLIER(supplier_id);
ALTER TABLE TEA ADD CONSTRAINT fk_tea_variety FOREIGN KEY (variety_type) REFERENCES VARIETY(type);
ALTER TABLE COLLECTION ADD CONSTRAINT fk_collection_user FOREIGN KEY (user_id) REFERENCES USER(user_id);
ALTER TABLE RATING ADD CONSTRAINT fk_rating_tea FOREIGN KEY (tea_id) REFERENCES TEA(tea_id);
ALTER TABLE RATING ADD CONSTRAINT fk_rating_user FOREIGN KEY (user_id) REFERENCES USER(user_id);
