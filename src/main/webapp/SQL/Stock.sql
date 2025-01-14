drop table stock;

-- 1. 테이블 생성
CREATE TABLE Stock (
    stock_id NUMBER PRIMARY KEY, -- 수동 관리 기본 키
    stock_code VARCHAR2(8) UNIQUE NOT NULL, -- 고유 주식 코드
    company_name VARCHAR2(100) NOT NULL, -- 회사 이름
    ticker_symbol VARCHAR2(255) UNIQUE NOT NULL, -- 고유 티커 심볼
    sector VARCHAR2(100) NOT NULL, -- 산업 섹터
    initial_price NUMBER NOT NULL, -- 초기 가격
    current_price NUMBER NOT NULL, -- 현재 가격
    total_shares NUMBER NOT NULL, -- 전체 주식 수
    available_shares NUMBER NOT NULL, -- 유통 가능한 주식 수
    is_active NUMBER DEFAULT 1 NOT NULL, -- 활성 상태
    created_date DATE DEFAULT SYSDATE NOT NULL -- 생성 날짜
);



-- 예시 데이터 삽입
INSERT INTO Stock (stock_code, company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES ('01000001', 'Apple Inc.', 'AAPL', 'Technology', 150.0, 150.0, 1000000, 800000);

INSERT INTO Stock (stock_code, company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES ('01000002', 'Microsoft Corp.', 'MSFT', 'Technology', 250.0, 250.0, 1200000, 950000);

INSERT INTO Stock (stock_code, company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES ('02000001', 'JPMorgan Chase', 'JPM', 'Finance', 120.0, 120.0, 2000000, 1800000);

INSERT INTO Stock (stock_code, company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES ('02000002', 'Goldman Sachs', 'GS', 'Finance', 320.0, 320.0, 1500000, 1300000);

INSERT INTO Stock (stock_code, company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES ('03000001', 'Pfizer', 'PFE', 'HealthCare', 50.0, 50.0, 3000000, 2500000);

INSERT INTO Stock (stock_code, company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES ('03000002', 'Johnson & Johnson', 'JNJ', 'HealthCare', 180.0, 180.0, 2000000, 1700000);

INSERT INTO Stock (stock_code, company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES ('04000001', 'Exxon Mobil', 'XOM', 'Energy', 100.0, 100.0, 2500000, 2000000);

INSERT INTO Stock (stock_code, company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES ('04000002', 'Chevron', 'CVX', 'Energy', 110.0, 110.0, 2400000, 1900000);

INSERT INTO Stock (stock_code, company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES ('05000001', 'Procter & Gamble', 'PG', 'Consumer Goods', 140.0, 140.0, 1500000, 1200000);

INSERT INTO Stock (stock_code, company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES ('05000002', 'Coca-Cola', 'KO', 'Consumer Goods', 60.0, 60.0, 1800000, 1500000);

INSERT INTO Stock (stock_code, company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES ('06000001', 'Amazon', 'AMZN', 'Retail', 3400.0, 3400.0, 1000000, 800000);

INSERT INTO Stock (stock_code, company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES ('06000002', 'Walmart', 'WMT', 'Retail', 150.0, 150.0, 2000000, 1800000);


