select * from user_info;
select * from sampleaccount;
select * from transaction;
insert into transaction values();
truncate table transaction;
drop table sampleaccount cascade constraint;
DESC sampleaccount;

--샘플 계좌 insert
INSERT INTO sampleaccount (
    DTYPE, ID, OWNER_USER_ID, ACCOUNT_NUMBER, ACCOUNT_TYPE, BALANCE, 
    CURRENCY, CREATED_AT, UPDATED_AT, ACCOUNT_PWD
) VALUES (
    'SampleBasicAccount', 10, 2, '123-456-789', 
    '기본입출금계좌', 1000000.00, 'KRW', SYSDATE, SYSDATE, '1111'
);

INSERT INTO sampleaccount (
    DTYPE, ID, OWNER_USER_ID, ACCOUNT_NUMBER, ACCOUNT_TYPE, BALANCE, 
    CURRENCY, CREATED_AT, UPDATED_AT, ACCOUNT_PWD
) VALUES (
    'SampleBasicAccount', 20, 2, '987-654-321', 
    '기본입출금계좌', 1000000.00, 'KRW', SYSDATE, SYSDATE, '2222'
);
