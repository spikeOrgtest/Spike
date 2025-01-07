CREATE TABLE Account (
    account_id NUMBER PRIMARY KEY,
    user_id NUMBER,
    account_number VARCHAR2(20) NOT NULL UNIQUE,
    account_type VARCHAR2(20) NOT NULL,
    balance NUMBER(15) DEFAULT 0,
    created_date DATE DEFAULT SYSDATE
);
	
CREATE TABLE Savings (
    savings_id NUMBER PRIMARY KEY,
    account_id NUMBER,
    monthly_amount NUMBER(15) NOT NULL,
    total_amount NUMBER(15) DEFAULT 0,
    interest_rate NUMBER(5, 2) NOT NULL,
    maturity_date DATE NOT NULL
);
