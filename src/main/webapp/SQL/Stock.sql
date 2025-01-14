CREATE TABLE Stock (
    stock_id NUMBER PRIMARY KEY, -- 기본 키
    company_name VARCHAR2(100) NOT NULL, -- 회사 이름
    ticker_symbol VARCHAR2(255) UNIQUE NOT NULL, -- 고유 티커 심볼
    sector VARCHAR2(100) NOT NULL, -- 산업 섹터
    initial_price NUMBER NOT NULL, -- 초기 가격
    current_price NUMBER NOT NULL, -- 현재 가격
    total_shares NUMBER NOT NULL, -- 전체 주식 수
    available_shares NUMBER NOT NULL, -- 유통 가능한 주식 수
    is_active NUMBER DEFAULT 1, -- 활성 상태 (1: 활성, 0: 비활성)
    created_date DATE DEFAULT SYSDATE -- 생성 날짜
);

select * from Stock;

--주식 회사 정보 삽입

-- Technology
INSERT INTO Stock (stock_id, company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES (1, 'Apple', 'AAPL', 'Technology', 150, 150, 1000000, 800000);

-- Finance
INSERT INTO Stock (stock_id, company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES (2, 'JPMorgan Chase', 'JPM', 'Finance', 150, 150, 500000, 400000);

-- Healthcare
INSERT INTO Stock (stock_id, company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES (3, 'Pfizer', 'PFE', 'Healthcare', 45, 45, 300000, 250000);

-- Energy
INSERT INTO Stock (stock_id, company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES (4, 'ExxonMobil', 'XOM', 'Energy', 100, 100, 200000, 150000);

-- Consumer Goods
INSERT INTO Stock (stock_id, company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES (5, 'Procter & Gamble', 'PG', 'Consumer Goods', 150, 150, 400000, 300000);

-- Retail
INSERT INTO Stock (stock_id, company_name, ticker_symbol, sector, initial_price, current_price, total_shares, available_shares)
VALUES (6, 'Walmart', 'WMT', 'Retail', 140, 140, 600000, 500000);



