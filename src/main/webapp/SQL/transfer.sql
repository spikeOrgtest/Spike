select * from user_info;
select * from account;
select * from transaction;

delete from account;

select * from sampleaccount;
insert into transaction values();
truncate table transaction;
drop table sampleaccount cascade constraint;
DESC sampleaccount;

--샘플 데이터 insert
INSERT INTO sampleaccount (
    DTYPE, ID, OWNER_USER_ID, ACCOUNT_NUMBER, ACCOUNT_TYPE, BALANCE, 
    CURRENCY, CREATED_AT, UPDATED_AT, ACCOUNT_PWD
) VALUES (
    'SampleBasicAccount', 10, 21, '123-456-789', 
    '입출금계좌', 1000000.00, 'KRW', SYSDATE, SYSDATE, '1111'
);

INSERT INTO sampleaccount (
    DTYPE, ID, OWNER_USER_ID, ACCOUNT_NUMBER, ACCOUNT_TYPE, BALANCE, 
    CURRENCY, CREATED_AT, UPDATED_AT, ACCOUNT_PWD
) VALUES (
    'SampleBasicAccount', 20, 21, '987-654-321', 
    '입출금계좌', 1000000.00, 'KRW', SYSDATE, SYSDATE, '2222'
);

update  sampleaccount set owner_user_id = 21;

SELECT * FROM sampleaccount WHERE owner_user_id = 21;

SELECT * FROM user_info WHERE user_id = 21;
SELECT * FROM sampleaccount WHERE owner_user_id = 21 AND dtype = 'SampleBasicAccount';

SELECT count(*) FROM sampleaccount WHERE owner_user_id = 21 AND dtype = 'SampleBasicAccount';

SELECT constraint_name, table_name
FROM user_constraints
WHERE table_name = 'SAMPLEACCOUNT';

SELECT constraint_name, constraint_type, r_constraint_name
FROM user_constraints
WHERE table_name = 'SAMPLEACCOUNT';

SELECT a.constraint_name, a.table_name, a.column_name, b.r_constraint_name, c.table_name AS referenced_table, c.column_name AS referenced_column
FROM user_cons_columns a
JOIN user_constraints b ON a.constraint_name = b.constraint_name
JOIN user_cons_columns c ON b.r_constraint_name = c.constraint_name
WHERE a.table_name = 'SAMPLEACCOUNT';

SELECT owner_user_id FROM sampleaccount WHERE dtype = 'SampleBasicAccount';


