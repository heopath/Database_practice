# 날짜 : 2026/04/21
# 이름 : 허민재
# 내용 : SQL 실습

drop table member;
CREATE TABLE MEMBER (
	uid varCHAR(10) primary key not null,
    name varchar(10) not null,
    hp varchar(13) unique not null,
    pos varchar(10) not null default('사원'),
    dep int default null,
    rdate date not null
);

CREATE TABLE Department (
	depNo int primary key,
    name varchar(10) not null,
    tel varchar(12) not null
);

create TABLE Sales (
	seq int not null auto_increment primary key,
    uid varchar(10) not null,
    `year` year not null,
    `month` tinyint not null,
    sale int 
);

#데이터 입력
INSERT INTO MEMBER VALUES ('A101', '박혁거세', '010-1234-1001', '부장', 101, '2026-04-21');
INSERT INTO MEMBER VALUES ('A102', '김유신', '010-1234-1002', '차장', 101, '2026-04-21');
INSERT INTO MEMBER VALUES ('A103', '김춘추', '010-1234-1003', '사원', 101, '2026-04-21');
INSERT INTO MEMBER VALUES ('A104', '장보고', '010-1234-1004', '대리', 102, '2026-04-21');
INSERT INTO MEMBER VALUES ('A105', '강감찬', '010-1234-1005', '과장', 102, '2026-04-21');
INSERT INTO MEMBER VALUES ('A106', '이성계', '010-1234-1006', '차장', 103, '2026-04-21');
INSERT INTO MEMBER VALUES ('A107', '정철', '010-1234-1007', '차장', 103, '2026-04-21');
INSERT INTO MEMBER VALUES ('A108', '이순신', '010-1234-1008', '부장', 104, '2026-04-21');
INSERT INTO MEMBER VALUES ('A109', '허균', '010-1234-1009', '사원', 105, '2026-04-21');
INSERT INTO MEMBER VALUES ('A110', '정약용', '010-1234-1010', '사원', 105, '2026-04-21');

INSERT INTO Department VALUES (101, '영업1부', '051-512-1001');
INSERT INTO Department VALUES (102, '영업2부', '051-512-1002');
INSERT INTO Department VALUES (103, '영업3부', '051-512-1003');
INSERT INTO Department VALUES (104, '영업4부', '051-512-1004');
INSERT INTO Department VALUES (105, '영업5부', '051-512-1005');
INSERT INTO Department VALUES (106, '영업지원부', '051-512-1006');
INSERT INTO Department VALUES (107, '인사부', '051-512-1007');

INSERT INTO Sales (uid, year, month, sale) VALUES ('a101', 2018, 1, 98100);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a102', 2018, 1, 136000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a103', 2018, 1, 80100);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a104', 2018, 1, 78000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a105', 2018, 1, 93000);

INSERT INTO Sales (uid, year, month, sale) VALUES ('a101', 2018, 2, 23500);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a102', 2018, 2, 126000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a103', 2018, 2, 18500);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a104', 2018, 2, 19000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a105', 2018, 2, 53000);

INSERT INTO Sales (uid, year, month, sale) VALUES ('a101', 2019, 1, 24000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a102', 2019, 1, 109000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a103', 2019, 1, 101000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a104', 2019, 1, 53500);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a107', 2019, 1, 24000);

INSERT INTO Sales (uid, year, month, sale) VALUES ('a102', 2019, 2, 160000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a103', 2019, 2, 101000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a104', 2019, 2, 43000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a105', 2019, 2, 24000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a106', 2019, 2, 109000);

INSERT INTO Sales (uid, year, month, sale) VALUES ('a102', 2020, 1, 201000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a104', 2020, 1, 63000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a105', 2020, 1, 74000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a106', 2020, 1, 122000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a107', 2020, 1, 111000);

INSERT INTO Sales (uid, year, month, sale) VALUES ('a102', 2020, 2, 120000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a103', 2020, 2, 93000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a104', 2020, 2, 84000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a105', 2020, 2, 180000);
INSERT INTO Sales (uid, year, month, sale) VALUES ('a108', 2020, 2, 76000);

