# 날짜 : 2026/05/18
# 이름 : 허민재
# 내용 : SQL 연습문제

# 실습 2-1
CREATE DATABASE `Bank`;
CREATE USER 'bank'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON Bank.* TO 'bank'@'%';
FLUSH PRIVILEGES;

# 실습 2-2
-- 고객 테이블
CREATE TABLE bank_customer (
    c_no        CHAR(14)        PRIMARY KEY,
    c_name      VARCHAR(20)     NOT NULL,
    c_dist      INT             NOT NULL DEFAULT 0,
    c_phone     VARCHAR(20)     NOT NULL UNIQUE,
    c_addr      VARCHAR(100)    DEFAULT NULL
);

-- 계좌 테이블
CREATE TABLE bank_account (
    a_no         CHAR(11)        PRIMARY KEY,
    a_item_dist  CHAR(2)         NOT NULL,
    a_item_name  VARCHAR(20)     NOT NULL,
    a_c_no       CHAR(14)        NOT NULL,
    a_balance    INT             NOT NULL DEFAULT 0,
    a_open_date  DATE            NOT NULL,

    CONSTRAINT fk_account_customer
        FOREIGN KEY (a_c_no)
        REFERENCES bank_customer(c_no)
);

-- 거래 테이블
CREATE TABLE bank_transaction (
    t_no         INT AUTO_INCREMENT PRIMARY KEY,
    t_a_no       CHAR(11)        NOT NULL,
    t_dist       INT             NOT NULL,
    t_amount     INT             NOT NULL DEFAULT 0,
    t_datetime   DATETIME        NOT NULL,

    CONSTRAINT fk_transaction_account
        FOREIGN KEY (t_a_no)
        REFERENCES bank_account(a_no)
);
# 실습 2-3
-- 고객 테이블 데이터
INSERT INTO bank_customer VALUES
('102-22-51094', '부산의원', 2, '051-518-1010', '부산시 남구'),
('220-82-52237', '(주)한국전산', 2, '02-134-1045', '서울시 강서구'),
('361-22-42687', '(주)부산산업', 2, '031-563-1253', '경기도 광명시'),
('730423-1000001', '김유신', 1, '010-1234-1001', '경기도 수원시'),
('750210-1000002', '김춘추', 1, '010-1234-1002', '경기도 광주시'),
('830513-2000003', '선덕여왕', 1, '010-1234-1003', '서울시 마포구'),
('870830-1000004', '강감찬', 1, '010-1234-1004', '서울시 영등포구'),
('910912-2000005', '신사임당', 1, '010-1234-1005', '강원도 강릉시'),
('941127-1000006', '이순신', 1, '010-1234-1006', '부산시 영도구');

-- 계좌 테이블 데이터
INSERT INTO bank_account VALUES
('101-11-1001', 'S1', '자유저축예금', '730423-1000001', 420000, '2005-07-21'),
('101-11-1003', 'S1', '자유저축예금', '870830-1000004', 53000, '2007-02-17'),
('101-11-2001', 'S1', '자유저축예금', '220-82-52237', 23000000, '2003-04-14'),
('101-11-2002', 'S1', '자유저축예금', '361-22-42687', 4201000, '2008-12-30'),
('101-11-2003', 'S1', '자유저축예금', '102-22-51094', 8325010, '2010-06-07'),
('101-12-1002', 'S2', '정기적립예금', '830513-2000003', 1020000, '2011-05-13'),
('101-13-1005', 'S3', '주택청약예금', '941127-1000006', 720800, '2012-10-15'),
('101-21-1004', 'L1', '고객신용대출', '910912-2000005', 1200500, '2009-08-25'),
('101-22-1006', 'L2', '예금담보대출', '730423-1000001', 25000, '2013-12-11'),
('101-23-1007', 'L3', '주택담보대출', '750210-1000002', 2700000, '2020-09-23');

-- 거래 테이블 데이터
INSERT INTO bank_transaction (t_no, t_a_no, t_dist, t_amount, t_datetime) VALUES
(1, '101-11-1001', 1, 50000, '2022-08-21 04:26:52'),
(2, '101-11-1003', 2, 120000, '2022-08-21 04:26:52'),
(3, '101-11-2001', 2, 300000, '2022-08-21 04:26:52'),
(4, '101-12-1002', 1, 1000000, '2022-08-21 04:26:52'),
(5, '101-11-1001', 3, 0, '2022-08-21 04:26:52'),
(6, '101-13-1005', 1, 200000, '2022-08-21 04:26:52'),
(7, '101-11-1001', 1, 450000, '2022-08-21 04:26:52'),
(8, '101-11-2002', 2, 32000, '2022-08-21 04:26:52'),
(9, '101-11-2003', 3, 0, '2022-08-21 04:26:52'),
(10, '101-11-1003', 1, 75000, '2022-08-21 04:26:52');
# 실습 2-4
SELECT * FROM bank_account;

# 실습 2-5
SELECT * FROM bank_customer;

# 실습 2-6
SELECT * FROM bank_transaction;

# 실습 2-7
SELECT c_name, c_no FROM bank_customer;

# 실습 2-8
SELECT a_item_dist, a_item_name FROM bank_account;

# 실습 2-9
SELECT distinct `a_item_dist`, `a_item_name` FROM `bank_account`;

# 실습 2-10
SELECT * FROM `bank_account` WHERE `a_item_name` = '자유저축예금' and `a_balance` >= 1000000;

# 실습 2-11
SELECT * FROM `bank_customer` WHERE c_addr LIKE '%경기도%';

# 실습 2-12
SELECT * FROM `bank_customer` WHERE c_dist =2;

# 실습 2-13
SELECT * FROM `bank_transaction` WHERE t_dist=1;

# 실습 2-14
SELECT * FROM `bank_transaction` WHERE t_dist = 2 ORDER BY t_amount desc;

# 실습 2-15
SELECT SUM(t_amount) AS 입금총합
, AVG(t_amount) AS 임금평균
FROM `bank_transaction`
WHERE `t_dist` = 1;

# 실습 2-16
SELECT MAX(t_amount) AS `큰 금액`
, MIN(t_amount) AS `작은 금액`
FROM `bank_transaction`
WHERE `t_dist` = 2;

# 실습 2-17
SELECT * FROM `bank_account` WHERE a_item_name LIKE '%저축예금%' ORDER BY a_balance desc;

# 실습 2-18
SELECT * FROM `bank_account` WHERE a_item_name LIKE '%저축예금%' 
ORDER BY a_balance desc
LIMIT 1;

# 실습 2-19
SELECT * FROM `bank_transaction` WHERE  t_amount > 0
ORDER BY `t_dist`, `t_amount` DESC;


# 실습 2-20
SELECT
COUNT(CASE WHEN t_dist = 1 THEN 1 END) AS `입금 건수`,
COUNT(CASE WHEN t_dist = 2 THEN 1 END) AS `출금 건수`,
COUNT(CASE WHEN t_dist = 3 THEN 1 END) AS `조회 건수`
FROM `bank_transaction`;

select * from bank_transaction;
# 실습 2-21
SELECT
    t_dist,
    CASE
        WHEN t_dist = 1 THEN '입금'
        WHEN t_dist = 2 THEN '출금'
        WHEN t_dist = 3 THEN '조회'
    END AS `type`,
    t_a_no,
    t_amount
FROM bank_transaction;

# 실습 2-22
SELECT t_dist, COUNT(`t_no`) FROM `bank_transaction` group by `t_dist`;

# 실습 2-23
SELECT `t_a_no`, `t_dist`, SUM(`t_amount`) 
FROM `bank_transaction`
WHERE `t_dist` = 1
group by `t_a_no`;

# 실습 2-24
SELECT 
	`t_a_no`, 
	`t_dist`,
	SUM(`t_amount`) AS `합계` 
FROM `bank_transaction`
WHERE `t_dist` = 1
group by `t_a_no` having `합계` >= 100000 order by `합계` desc;

# 실습 2-25
SELECT * FROM `bank_account` AS a
left join `bank_customer` AS b on 
a.a_c_no = b.c_no;

# 실습 2-26
 SELECT
 a.a_no AS 계좌번호, 
 a.a_c_no AS 계좌이름,
 b.c_no AS 주민번호,
 b.c_name AS 고객명,
 a.a_balance AS 현재잔액
FROM `bank_account` AS a 
JOIN `bank_customer` AS b 
ON a.a_c_no = b.c_no;

# 실습 2-27
SELECT * FROM `bank_transaction` AS a
JOIN `bank_account` AS b
ON a.t_a_no = b.a_no;

# 실습 2-28
 SELECT 
	`t_no` AS `거래번호`,
	`t_a_no` AS `계좌번호`,
	`a_c_no` AS `고객번호(주민번호)`,
	`t_dist` AS `거래구분`,
	`t_amount` AS `거래금액`,
	`t_datetime` AS `거래일자`
FROM `bank_account` AS a
JOIN `bank_transaction` AS b
on a.a_no = b.t_a_no order by `거래번호`;

# 실습 2-29
SELECT
	`t_no`,
	`a_no`,
	`c_no`,
	`t_dist`,
	`a_item_name`,
	`c_name`,
	`t_amount`,
	`t_datetime`
FROM `bank_transaction` AS a
JOIN `bank_account` AS b on a.t_a_no = b.a_no 
JOIN `bank_customer` AS c on b.a_c_no = c.c_no
WHERE `t_dist` = 1
ORDER BY `t_amount` DESC;

# 실습 2-30
-- SELECT
--     MIN(a.t_no) AS t_no,
--     b.a_no,
--     c.c_no,
--     a.t_dist,
--     b.a_item_name,
--     c.c_name,
--     COUNT(a.t_no) AS 거래건수
-- FROM bank_transaction AS a
-- JOIN bank_account AS b ON a.t_a_no = b.a_no 
-- JOIN bank_customer AS c ON b.a_c_no = c.c_no
-- WHERE a.t_dist IN (1, 2) AND c.c_dist = 1
-- GROUP BY b.a_no, c.c_no, a.t_dist, b.a_item_name, c.c_name
-- ORDER BY a.t_dist, 거래건수 DESC;

#실습 2-30
SELECT 
	ANY_VALUE(`t_no`) AS `번호`,
	ANY_VALUE(`a_no`) AS `계좌번호`,
	`c_no`,
	ANY_VALUE(`t_dist`) AS `구분`,
	ANY_VALUE(`a_item_name`) AS `계좌이름`,
	ANY_VALUE(`c_name`) AS `고객명`,
    COUNT(`t_no`) AS `거래건수`
FROM `bank_transaction` AS a
JOIN `bank_account` AS b ON a.t_a_no = b.a_no
JOIN `bank_customer` AS c ON b.a_c_no = c.c_no
WHERE `t_dist` IN (1, 2) AND `c_dist` = 1
GROUP BY `c_no`
ORDER BY `구분`, `거래건수` DESC;
