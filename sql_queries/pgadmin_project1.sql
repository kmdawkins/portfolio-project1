-- Database and table creation

CREATE  DATABASE budget;

CREATE TABLE pmo (
    transaction_date DATE,
    cost_center SMALLINT,
    budget_account VARCHAR(50),
    region_name VARCHAR(50),
    market VARCHAR(50),
    description TEXT,
    payment_no VARCHAR(50) PRIMARY KEY,
    contract_no VARCHAR(20),
    contract_name VARCHAR(100),
    purchase_order VARCHAR(20),
    purchase_requisition VARCHAR(20),
    project_no VARCHAR(20),
    project_name VARCHAR (100),
    payment_entity VARCHAR(50),
    company_name VARCHAR(100),
    company_legal_entity VARCHAR(150),
    amount_usd DECIMAL(15,2),
    amount_cny DECIMAL(15,2)
);

-- CSV Import Query

COPY pmo FROM 'C:/data/portfolio.pmo_fy22_v3.csv'
DELIMITER ',' CSV HEADER;

-- Initial test queries

SELECT COUNT (*) FROM pmo; -- 255,000 rows
