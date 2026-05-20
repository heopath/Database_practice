# 날짜 : 2026/05/20
# 이름 : 허민재
# 내용 : ShopERD 실습

# 실습 6-2



INSERT INTO `Customer` (`custId`, `name`, `hp`, `addr`, `rdate`) VALUES
('c101', '김유신', '010-1234-1001', '경남 김해시', '2023-01-01'),
('c102', '김춘추', '010-1234-1002', '경남 경주시', '2023-01-02'),
('c103', '장보고', '010-1234-1003', '전남 완도군', '2023-01-03'),
('c104', '강감찬', '010-1234-1004', '서울시 관악구', '2023-01-04'),
('c105', '이순신', '010-1234-1005', '부산시 금정구', '2023-01-05');

INSERT INTO `Product` (`prodNo`, `prodName`, `stock`, `price`, `company`) VALUES
(1, '새우깡', 5000, 1500, '농심'),
(2, '초코파이', 2500, 2500, '오리온'),
(3, '포카칩', 3600, 1700, '오리온'),
(4, '양파링', 1250, 1800, '농심'),
(5, '죠리퐁', 2200, NULL, '크라운');


INSERT INTO `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) VALUES
('c102', 3, 2, '2023-01-01 13:15:10'),
('c101', 4, 1, '2023-01-01 13:15:12'),
('c102', 1, 1, '2023-01-01 13:15:14'),
('c103', 5, 5, '2023-01-01 13:15:16'),
('c105', 2, 1, '2023-01-01 13:15:18');


#실습 6-3
SELECT 
	o.orderNo,
    c.name,
    p.prodName,
    o.orderCount,
    o.orderDate
	FROM `Order` AS o
    JOIN `Customer` AS c ON o.orderId = c.custId
    JOIN `Product` AS p ON o.orderProduct = p.prodNo;
    
SELECT 
	o.orderNo,
    o.orderProduct,    
    p.prodName,
    p.price,
    o.orderCount,
    o.orderDate
	FROM `Order` AS o
    JOIN `Customer` AS c ON o.orderId = c.custId
    JOIN `Product` AS p ON o.orderProduct = p.prodNo
    WHERE name = '김유신';

SELECT SUM(price * orderCount) as `총주문금액`
	FROM `Order` AS o
    JOIN `Product` AS p ON o.orderProduct = p.prodNo;
    
    
#실습 6-4
-- Bank ERD 실습하기

USE BankERD;

#실습 6-5
insert into `bank_customer` values ('730423-1000001', '김유신', 1, '010-1234-1001', '경남 김해시');
insert into `bank_customer` values ('730423-1000002', '김춘추', 1, '010-1234-1002', '경남 경주시');
insert into `bank_customer` values ('750423-1000003', '장보고', 1, '010-1234-1003', '전남 완도군');
insert into `bank_customer` values ('102-12-51094', '(주)정보산업', 2, '051-500-1004', '부산시 부산진구');
insert into `bank_customer` values ('930423-1000005', '이순신', 1, '010-1234-1005', '서울 종로구');
select * from `bank_customer`;

insert into `bank_account` values ('101-11-1001', 'S1', '자유저축예금', '730423-1000001', 1550000, '2011-04-11');
insert into `bank_account` values ('101-11-1002', 'S1', '자유저축예금', '930423-1000005', 260000, '2011-05-12');
insert into `bank_account` values ('101-11-1003', 'S1', '자유저축예금', '750423-1000003', 75000, '2011-06-13');
insert into `bank_account` values ('101-12-1001', 'S2', '기업저축예금', '102-12-51094', 15000000, '2011-07-14');
insert into `bank_account` values ('101-13-1001', 'S3', '정기저축예금', '730423-1000002', 1200000, '2011-08-15');
select * from `bank_account`;

insert into `bank_transaction` set `t_a_no`='101-11-1001', `t_dist`=1, `t_amount`=50000, `t_datetime`=NOW();
insert into `bank_transaction` set `t_a_no`='101-12-1001', `t_dist`=2, `t_amount`=1000000, `t_datetime`=NOW();
insert into `bank_transaction` set `t_a_no`='101-11-1002', `t_dist`=3, `t_amount`=260000, `t_datetime`=NOW();
insert into `bank_transaction` set `t_a_no`='101-11-1002', `t_dist`=2, `t_amount`=100000, `t_datetime`=NOW();
insert into `bank_transaction` set `t_a_no`='101-11-1003', `t_dist`=3, `t_amount`=750000, `t_datetime`=NOW();
insert into `bank_transaction` set `t_a_no`='101-11-1001', `t_dist`=1, `t_amount`=150000, `t_datetime`=NOW();
select * from `bank_transaction`;

#실습 6-6
SELECT * FROM bank_customer c, bank_account a WHERE c.c_no = a.a_c_no;

SELECT * FROM bank_transaction 
	WHERE t_a_no = (SELECT a_no FROM bank_account 
							WHERE a_c_no = (SELECT c_no FROM bank_customer 
														WHERE c_name = '이순신'));

SELECT * 
	FROM bank_customer AS c
    JOIN bank_account AS a ON c.c_no = a.a_c_no
    WHERE c_dist = 1
    ORDER BY a_balance DESC
    LIMIT 1;

#실습 6-7
-- College ERD 실습하기
USE collegeERD;

# 실습 6-8
insert into `Student` values ('20201011', '김유신', '010-1234-1001', 3, '경남 김해시');
insert into `Student` values ('20201122', '김춘추', '010-1234-1002', 3, '경남 경주시');
insert into `Student` values ('20210213', '장보고', '010-1234-1003', 2, '전남 완도군');
insert into `Student` values ('20210324', '강감찬', '010-1234-1004', 2, '서울 관악구');
insert into `Student` values ('20220415', '이순신', '010-1234-1005', 1, '서울 종로구');
select * from Student;

insert into `Lecture` values (101, '컴퓨터과학 개론', 2, 40, '본301');
insert into `Lecture` values (102, '프로그래밍 언어', 3, 52, '본302');
insert into `Lecture` values (103, '데이터베이스', 3, 56, '본303');
insert into `Lecture` values (104, '자료구조', 3, 60, '본304');
insert into `Lecture` values (105, '운영체제', 3, 52, '본305');
select * from Lecture;

insert into `Register` values ('20220415', 101, 60, 30, null, null);
insert into `Register` values ('20210324', 103, 54, 36, null, null);
insert into `Register` values ('20201011', 105, 52, 28, null, null);
insert into `Register` values ('20220415', 102, 38, 40, null, null);
insert into `Register` values ('20210324', 104, 56, 32, null, null);
insert into `Register` values ('20210213', 103, 48, 40, null, null);
select * from Register;

#실습 6-9
select 
	stdNo,
    stdName,
    stdHp,
    stdYear
    from student as s
    LEFT JOIN Register as r ON s.stdNo = r.regStdNo
    WHERE r.regStdNo is null;


select 
	`regStdNo`, 
    `regLecNo`, 
    `regMidScore`,
    `regFinalScore`,
    `regMidScore` + `regFinalScore` as `합`,
    case
		when (`regMidScore` + `regFinalScore` >= 90) then 'A'
		when (`regMidScore` + `regFinalScore` >= 80) then 'B'
		when (`regMidScore` + `regFinalScore` >= 70) then 'C'
		when (`regMidScore` + `regFinalScore` >= 60) then 'D'
	else 'F'
    end as `등급`
from `Register`;


SELECT 
	`stdNo`,
    `stdName`,
    `stdYear`,
    `lecName`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
	FROM Student AS s
    JOIN Register AS r ON s.stdNo = r.regStdNo
    JOIN Lecture AS l ON r.regLecNo = l.lecNo
    WHERE stdYear = 2;

