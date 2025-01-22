-- 사용자 데이터 삽입
INSERT INTO User_Info (
    user_id, login_id, password, name, email_id, email_domain, phone, phone01, phone02, phone03,
    birth_date, postcode, road_address, jibun_address, detail_address, references, profile_image_uri,
    is_minor, status, last_login, registration_date
) VALUES
(
    1, 'testuser', 'password', 'Test User', 'test', 'email.com', '010-1234-5678', '010', '1234', '5678',
    TO_DATE('1990-01-01', 'YYYY-MM-DD'), '12345', '123 Test St.', '123 Jibun St.', 'Apartment 1', NULL, NULL,
    'N', 'Active', NULL, SYSDATE
);

-- 증권 계좌 데이터 삽입
INSERT INTO securities_account (
    account_id, account_number, balance, currency, status, created_date, user_id
) VALUES
(
    1, '123-456-789', 1000.0, 'USD', 'Active', SYSDATE, 1
);
