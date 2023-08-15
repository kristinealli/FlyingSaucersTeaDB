-- TEA table
CREATE TABLE TEA (
    tea_id SERIAL PRIMARY KEY,
    blend_name VARCHAR(255) NOT NULL,
    tasting_notes TEXT,
    date_of_purchase DATE,
    price VARCHAR(50),
    origin VARCHAR(255),
    caffeine BOOLEAN NOT NULL
);

-- RATING table
CREATE TABLE RATING (
    rating_id SERIAL PRIMARY KEY,
    review_comments TEXT,
    ranking VARCHAR(5)
);

-- SIPPER table
CREATE TABLE SIPPER (
    SIPPER_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- COLLECTION table
CREATE TABLE COLLECTION (
    collection_id SERIAL PRIMARY KEY,
    collection_name VARCHAR(255) NOT NULL,
    date_created DATE
);

-- VARIETY table
CREATE TABLE VARIETY (
    type VARCHAR(255) PRIMARY KEY,
    brewing_temp_F VARCHAR(50),
    brewing_temp_C VARCHAR(50),
    brewing_time VARCHAR(50),
    tsp_per_cup VARCHAR(50)
);

-- SUPPLIER table
CREATE TABLE SUPPLIER (
    supplier_id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    logo VARCHAR(255),
    website VARCHAR(255)
);

-- Relationship tables
CREATE TABLE TEA_SUPPLIER_REL (
    tea_id INT REFERENCES TEA(tea_id),
    supplier_id VARCHAR(255) REFERENCES SUPPLIER(supplier_id),
    PRIMARY KEY (tea_id, supplier_id)
);

CREATE TABLE SIPPER_SUPPLIER_REL (
    SIPPER_id INT REFERENCES SIPPER(SIPPER_id),
    supplier_id VARCHAR(255) REFERENCES SUPPLIER(supplier_id),
    PRIMARY KEY (SIPPER_id, supplier_id)
);

CREATE TABLE SIPPER_COLLECTION_REL (
    SIPPER_id INT REFERENCES SIPPER(SIPPER_id),
    collection_id INT REFERENCES COLLECTION(collection_id),
    PRIMARY KEY (SIPPER_id, collection_id)
);

CREATE TABLE RATING_SIPPER_REL (
    rating_id INT REFERENCES RATING(rating_id),
    SIPPER_id INT REFERENCES SIPPER(SIPPER_id),
    PRIMARY KEY (rating_id, SIPPER_id)
);

CREATE TABLE TEA_RATING_REL (
    tea_id INT REFERENCES TEA(tea_id),
    rating_id INT REFERENCES RATING(rating_id),
    PRIMARY KEY (tea_id, rating_id)
);

CREATE TABLE TEA_SIPPER_REL (
    tea_id INT REFERENCES TEA(tea_id),
    SIPPER_id INT REFERENCES SIPPER(SIPPER_id),
    PRIMARY KEY (tea_id, SIPPER_id)
);

CREATE TABLE TEA_COLLECTION_REL (
    tea_id INT REFERENCES TEA(tea_id),
    collection_id INT REFERENCES COLLECTION(collection_id),
    PRIMARY KEY (tea_id, collection_id)
);

CREATE TABLE TEA_VARIETY_REL (
    tea_id INT REFERENCES TEA(tea_id),
    type VARCHAR(255) REFERENCES VARIETY(type),
    PRIMARY KEY (tea_id, type)
);

CREATE TABLE COLLECTION_SIPPER_REL (
    collection_id INT REFERENCES COLLECTION(collection_id),
    SIPPER_id INT REFERENCES SIPPER(SIPPER_id),
    PRIMARY KEY (collection_id, SIPPER_id)
);
