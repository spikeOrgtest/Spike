-- [1] 기존 테이블 삭제
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Stock CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Table Stock does not exist or could not be dropped.');
END;
/

-- [2] 기존 시퀀스 삭제
BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE Stock_Id_Seq';
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Sequence Stock_Id_Seq does not exist or could not be dropped.');
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE Stock_Code_Seq';
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Sequence Stock_Code_Seq does not exist or could not be dropped.');
END;
/

-- [3] 기존 트리거 삭제
BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER trg_generate_stock_code';
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Trigger trg_generate_stock_code does not exist or could not be dropped.');
END;
/

-- [4] 테이블 생성
CREATE TABLE Stock (
    stock_id NUMBER PRIMARY KEY,                   -- 자동 증가 기본 키
    stock_code VARCHAR2(8) UNIQUE NOT NULL,        -- 8자리 고유 코드
    company_name VARCHAR2(100) NOT NULL,           -- 회사 이름
    ticker_symbol VARCHAR2(255) UNIQUE NOT NULL,   -- 고유 티커 심볼
    sector VARCHAR2(100) NOT NULL,                 -- 산업 섹터
    initial_price NUMBER NOT NULL,                 -- 초기 가격
    current_price NUMBER NOT NULL,                 -- 현재 가격
    total_shares NUMBER NOT NULL,                  -- 전체 주식 수
    available_shares NUMBER NOT NULL,              -- 유통 가능한 주식 수
    is_active NUMBER DEFAULT 1 NOT NULL,           -- 활성 상태 (1: 활성, 0: 비활성)
    created_date DATE DEFAULT SYSDATE NOT NULL     -- 생성 날짜
);

-- [5] 시퀀스 생성
CREATE SEQUENCE Stock_Id_Seq 
START WITH 1 
INCREMENT BY 1 
NOCACHE;

CREATE SEQUENCE Stock_Code_Seq 
START WITH 1 
INCREMENT BY 1 
NOCACHE;

-- [6] 트리거 생성
CREATE OR REPLACE TRIGGER trg_generate_stock_code
BEFORE INSERT ON Stock
FOR EACH ROW
BEGIN
    -- stock_id 자동 생성
    IF :NEW.stock_id IS NULL THEN
        SELECT Stock_Id_Seq.NEXTVAL INTO :NEW.stock_id FROM DUAL;
    END IF;

    -- stock_code 자동 생성 (8자리로 패딩)
    IF :NEW.stock_code IS NULL THEN
        SELECT LPAD(Stock_Code_Seq.NEXTVAL, 8, '0') INTO :NEW.stock_code FROM DUAL;
    END IF;
END;
/

-- [7] 트리거 상태 확인
SELECT TRIGGER_NAME, TABLE_NAME, STATUS
FROM USER_TRIGGERS
WHERE TRIGGER_NAME = 'TRG_GENERATE_STOCK_CODE';

-- [8] 데이터 삽입
-- Technology 분야
INSERT INTO Stock (company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES ('Apple Inc.', 'AAPL', 'Technology', 150.0, 150.0, 1000000, 800000);

INSERT INTO Stock (company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES ('Microsoft Corp.', 'MSFT', 'Technology', 250.0, 250.0, 1200000, 950000);

-- Consumer Goods 분야
INSERT INTO Stock (company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES ('Procter Gamble', 'PG', 'Consumer Goods', 140.0, 140.0, 1500000, 1200000);

INSERT INTO Stock (company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES ('Coca-Cola', 'KO', 'Consumer Goods', 60.0, 60.0, 1800000, 1500000);

-- Finance 분야
INSERT INTO Stock (company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES ('JPMorgan Chase', 'JPM', 'Finance', 120.0, 120.0, 2000000, 1800000);

INSERT INTO Stock (company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES ('Goldman Sachs', 'GS', 'Finance', 320.0, 320.0, 1500000, 1300000);

-- HealthCare 분야
INSERT INTO Stock (company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES ('Pfizer', 'PFE', 'HealthCare', 50.0, 50.0, 3000000, 2500000);

INSERT INTO Stock (company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES ('Johnson Johnson', 'JNJ', 'HealthCare', 180.0, 180.0, 2000000, 1700000);

-- Energy 분야
INSERT INTO Stock (company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES ('Exxon Mobil', 'XOM', 'Energy', 100.0, 100.0, 2500000, 2000000);

INSERT INTO Stock (company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES ('Chevron', 'CVX', 'Energy', 110.0, 110.0, 2400000, 1900000);

-- Retail 분야
INSERT INTO Stock (company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES ('Amazon', 'AMZN', 'Retail', 3400.0, 3400.0, 1000000, 800000);

INSERT INTO Stock (company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES ('Walmart', 'WMT', 'Retail', 150.0, 150.0, 2000000, 1800000);

-- [9] 데이터 확인
SELECT * FROM Stock;

commit;


