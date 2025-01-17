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

CREATE TABLE Deposit(
	deposit_id NUMBER PRIMARY KEY,
	account_id NUMBER,
	principal_amount NUMBER(15) NOT NULL,
	interest_rate NUMBER(5, 2) NOT NULL,
	maturity_date DATE NOT NULL
);

CREATE TABLE Loan(
	loan_id	NUMBER PRIMARY KEY, 
	account_id	NUMBER,
	principal_amount NUMBER(15, 2)	NOT NULL,
	interest_rate NUMBER(5, 2)	NOT NULL,
	repayment_schedule VARCHAR2(500),
	remaining_balance NUMBER(15, 2)	NOT NULL
);

CREATE TABLE Card(
	card_id	NUMBER PRIMARY KEY,
	user_id NUMBER,
	card_number VARCHAR2(20) NOT NULL UNIQUE,
	card_type VARCHAR2(20) NOT NULL,
	credit_limit NUMBER(15, 2),
	expiration_date	DATE NOT NULL,
	created_date DATE
);