# 날짜 : 2026/05/08
# 이름 : 허민재
# 내용 : SQL 연습문제1

# 실습 1-1
CREATE DATABASE Shop;
CREATE USER 'shop'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON Shop.* TO 'shop'@'%';
FLUSH PRIVILEGES; -- 현재 세션에 반영

USE SHOP;

# 실습 1-2
CREATE TABLE Customer (
	custid VARCHAR(10) PRIMARY KEY NOT NULL,
    name VARCHAR(10) NOT NULL,
    hp VARCHAR(13) UNIQUE DEFAULT NULL,
    addr VARCHAR(100) DEFAULT NULL,
    rdate date NOT NULL
);

CREATE TABLE Product (
	prodNo INT PRIMARY KEY NOT NULL,
    prodName VARCHAR(10) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    price INT DEFAULT NULL,
    company VARCHAR(20) NOT NULL
);

CREATE TABLE `Order` (
		orderNo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        orderId VARCHAR(10) NOT NULL,
        orderProduct INT NOT NULL,
        orderCount INT NOT NULL,
        orderDate datetime NOT NULL
);

# 실습 1-3
INSERT INTO Customer VALUES
('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01'),
('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-01-02'),
('c103', '장보고', '010-1234-1003', '완도군 청산면', '2022-01-03'),
('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-04'),
('c105', '이성계', NULL, NULL, '2022-01-05'),
('c106', '정철', '010-1234-1006', '경기도 용인시', '2022-01-06'),
('c107', '허준', NULL, NULL, '2022-01-07'),
('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-08'),
('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-09'),
('c110', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-10');

INSERT INTO Product VALUES
(1, '새우깡', 5000, 1500, '농심'),
(2, '초코파이', 2500, 2500, '오리온'),
(3, '포카칩', 3600, 1700, '오리온'),
(4, '양파링', 1250, 1800, '농심'),
(5, '죠리퐁', 2200, NULL, '크라운'),
(6, '마가렛트', 3500, 3500, '롯데'),
(7, '뿌셔뿌셔', 1650, 1200, '오뚜기');

INSERT INTO `Order` VALUES
(1, 'c102', 3, 2, '2022-07-01 13:15:10'),
(2, 'c101', 4, 1, '2022-07-01 14:16:11'),
(3, 'c108', 1, 1, '2022-07-01 17:23:18'),
(4, 'c109', 6, 5, '2022-07-02 10:46:36'),
(5, 'c102', 2, 1, '2022-07-03 09:15:37'),
(6, 'c101', 7, 3, '2022-07-03 12:35:12'),
(7, 'c110', 1, 2, '2022-07-03 16:55:36'),
(8, 'c104', 2, 4, '2022-07-04 14:23:23'),
(9, 'c102', 1, 3, '2022-07-04 21:54:34'),
(10, 'c107', 6, 1, '2022-07-05 14:21:03');

# 실습 1-4
SELECT * FROM Customer;

# 실습 1-5
SELECT custid, name, hp FROM Customer;

# 실습 1-6
SELECT * FROM Product;

# 실습 1-7
SELECT company FROM Product; 

# 실습 1-8
SELECT distinct(company) FROM Product;

# 실습 1-9
SELECT prodName, price FROM Product;

# 실습 1-10
SELECT prodName, price AS 조정단가 FROM Product;

# 실습 1-11
SELECT prodName, stock, price FROM Product WHERE company = '오리온';

# 실습 1-12
SELECT orderProduct, orderCount, orderDate FROM `Order` WHERE orderId = 'c102';

# 실습 1-13
SELECT orderProduct, orderCount, orderDate FROM `Order` WHERE orderId = 'C102' AND orderCount >= 2; 

# 실습 1-14
SELECT * FROM Product WHERE price BETWEEN 1000 and 2000;

# 실습 1-15
SELECT custid, name, hp, addr FROM Customer WHERE name like '김%';

# 실습 1-16
SELECT custid, name, hp, addr FROM Customer WHERE name like '__';

# 실습 1-17
SELECT * FROM Customer WHERE hp is null;

# 실습 1-18
SELECT * FROM Customer WHERE addr is not null;

# 실습 1-19
SELECT * FROM Customer order by rdate desc;

# 실습 1-20
SELECT * FROM `Order` WHERE orderCount >= 3 order by orderCount DESC, orderNo ASC;

# 실습 1-21
SELECT AVG(price) FROM Product;

# 실습 1-22
SELECT sum(stock) AS `재고량 합계` FROM product WHERE company = '농심';

# 실습 1-23
SELECT count(custid)  AS 고객수 FROM Customer;

# 실습 1-24
SELECT COUNT(DISTINCT(company)) AS `제조업체 수` FROM Product;

# 실습 1-25
SELECT orderProduct AS `주문 상품번호`, SUM(orderCount) AS `총 주문수량` FROM 
`Order` GROUP BY orderProduct order by orderProduct;

# 실습 1-26
SELECT company AS 제조업체, COUNT(*) AS `제품 수`, MAX(price) AS 최고가 FROM
Product group by company  having 최고가 or 최고가 is null order by 최고가 desc;

# 실습 1-27
SELECT company AS 제조업체, COUNT(*) AS 제품수, MAX(price) AS 최고가 FROM
Product GROUP BY company having 제품수 >= 2;

# 실습 1-28
SELECT orderProduct, orderId, SUM(orderCount) AS `총 주문수량` FROM `Order`
group by orderProduct, orderId order by orderProduct asc;

# 실습 1-29
SELECT a.orderId, b.prodName FROM `Order` AS a
JOIN product b 
ON a.orderProduct = b.prodNo
WHERE orderid = 'c102';

# 실습 1-30
SELECT orderid, name, prodName, orderDate 
FROM `Order` AS a 
JOIN Customer AS b
ON a.orderId = b.custId
JOIN Product AS C
ON a.orderProduct = c.prodNo
WHERE date(a.orderDate) = '2022-07-03';