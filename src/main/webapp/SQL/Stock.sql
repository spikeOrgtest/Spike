CREATE TABLE Stock (
    stock_id NUMBER PRIMARY KEY, -- 기본 키
    company_name VARCHAR2(100) NOT NULL, -- 회사 이름
    ticker_symbol VARCHAR2(255) UNIQUE NOT NULL, -- 고유 티커 심볼
    sector VARCHAR2(100) NOT NULL, -- 산업 섹터
    initial_price NUMBER NOT NULL, -- 초기 가격
    current_price NUMBER NOT NULL, -- 현재 가격
    total_shares NUMBER NOT NULL, -- 전체 주식 수
    available_shares NUMBER NOT NULL, -- 유통 가능한 주식 수
    dividend_yield NUMBER DEFAULT 0, -- 배당 수익률
    is_active NUMBER DEFAULT 1, -- 활성 상태 (1: 활성, 0: 비활성)
    created_date DATE DEFAULT SYSDATE -- 생성 날짜
);
