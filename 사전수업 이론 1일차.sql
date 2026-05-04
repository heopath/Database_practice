-------------------------------
# 날짜 : 2026/04/20
# 이름 : 허민재
# 내용 : 내용 SQL 실습
------------------------------

create database studydb;

# 작업 DB 확인
use studydb;


# 테이블 생성tb1usertb1usertb1user
CREATE TABLE Tb1User (
	user_id VARCHAR(10), -- 아이디 최대 10 가변 문자열
    user_name VARCHAR(10), -- 이름 최대 10 가변 문자열
    user_hp CHAR(13), -- 휴대폰 고정 길이 문자열
    user_age INT, -- 나이 정수 숫자
    user_addr VARCHAR(100) -- 주소 길이 100 가변길이 문자열
);

CREATE TABLE Tb1Product (
	prod_no int, 
    prod_name varchar(10),
    prod_price int,
    prod_stock int,
    prod_company varchar(10),
    prod_date DATE
);

# 데이터 삽입
INSERT INTO tb1user values ('a101', '김유신', '010-1234-1001', 25, '경남 김해시');
INSERT INTO tb1user (user_id, user_name, user_age, user_addr) values ('a103', '장보고', 31, '경남 완도군');
INSERT INTO tb1user values ('p102', '김춘추', '010-1234-1002', 23, '경남 경주시');
INSERT INTO tb1user (user_id, user_name, user_addr) values ('p104', '강감찬', '서울시 중구');
INSERT INTO tb1user (user_id, user_name, user_hp, user_age) values ('p105', '이순신', '010-1234-1005', 50);

INSERT INTO tb1product values (1001, '냉장고', 800000, 25, 'LG전자', '2022-01-06');
INSERT INTO tb1product values (1002, '노트북', 1200000, 100, '삼성전자', '2023-01-07');
INSERT INTO tb1product values (1003, '모니터', 350000, 35, 'LG전자', '2023-01-13');
INSERT INTO tb1product values (1004, '세탁기', 1000000, 80, '삼성전자', '2021-01-01');
INSERT INTO tb1product values (1005, '컴퓨터', 1500000, 30, '삼성전자', '2023-10-01');
INSERT INTO tb1product (prod_no, prod_name, prod_price, prod_stock) values (1006, '휴대폰', 950000, 102);

UPDATE tb1product set
			prod_company='삼성전자',
            prod_date='2024-01-01'
            where 
            prod_no=1006;
            
use studydb;



