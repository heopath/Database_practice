# 날짜 : 2026/05/22
# 이름 : 허민재
# 내용 : 7장 정규화 실습

# 실습 7-1 비정규형 릴레이션에 대해 제1정규화를 수행
CREATE TABLE BookOrder (
	`orderNo`		INT,
    `orderDate`		DATE,
    `custId`		VARCHAR(10),
    `name`			VARCHAR(10),
    `addr`			VARCHAR(20),
    `bookNo`		INT,
    `bookName`		VARCHAR(20),
    `count`			INT,
    `price`			INT
);

INSERT INTO `bookorder` values 
(10001, '2026-05-22', 'a101', '깅유신', '김해', 101, '프로그래밍', 1, 28000),
(10002, '2026-05-22', 'a102', '김춘추', '경주', 101102 , '프로그래밍', 1, 28000),
(10002, '2026-05-22', 'a102', '김춘추', '경주', 102 , '자료구조', 2, 32000),
(10003, '2026-05-22', 'a103', '장보고', '완도', 101, '자료구조', 2, 32000),
(10004, '2026-05-22', 'a104', '강감찬', '서울', 110, '데이터베이스', 1, 25000),
(10005, '2026-05-22', 'a105', '이순신', '서울', 110, '데이터베이스', 1, 25000),
(10005, '2026-05-22', 'a105', '이순신', '서울', 102, '자료구조', 1, 16000)
;
update bookorder set  bookNo = '102' where name = '김춘추' and bookName = '자료구조' ;
select * from bookorder;

# 실습 7-2 1NF를 만족하는 릴레이션에 대해 제2정규화를 수행
CREATE TABLE `Order` (
	`orderNo`		INT PRIMARY KEY,
    `orderDate`		DATE,
    `custId`	VARCHAR(10)
);

CREATE TABLE `OrderCutomer` (
	`custId`	VARCHAR(10) primary key,
    `name`			VARCHAR(10),
    `addr`			VARCHAR(20)
);

CREATE TABLE `OrderBook` (
	`orderNo`		INT PRIMARY KEY,
	`bookNo`		INT,
	`count`			INT,
    `price`			INT
);

# 실습 7-3 2NF를 만족하는 릴레이션에 대해 제3정규화를 수행
CREATE TABLE `Book` (
	`bookNo`		INT PRIMARY KEY,
	`bookName`		VARCHAR(20)
);

CREATE TABLE `OrderCutomer` (
	`orderNo`		INT PRIMARY KEY,
    `orderDate`		DATE,
    `custId`	VARCHAR(10),
    `name`			VARCHAR(10),
    `addr`			VARCHAR(20)
);

CREATE TABLE `OrderBook` (
	`orderNo`		INT PRIMARY KEY,
	`bookNo`		INT,
	`count`			INT,
    `price`			INT
);