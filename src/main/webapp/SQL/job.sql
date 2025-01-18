create table notice(
 notice_id number(38) primary key -- 공지사항 고유ID
 ,title varchar2(255) not null -- 공지제목
 ,content varchar2(2000) not null -- 공지내용
 ,author varchar2(100) not null -- 작성자
 ,created_date date default sysdate -- 공지등록일
 ,updated_date date null --최근업데이트 일시
);

create sequence notice_id_seq
start with 1 -- 시퀀스 시작 값
increment by 1 -- 시퀀스 증가 값
nocache -- 캐시 사용 안함
nocycle; -- 값이 최대값에 도달하면 에러 발생

select notice_id_seq.nextval from dual;

select * from notice;

drop table notice;

DROP SEQUENCE notice_id_seq;