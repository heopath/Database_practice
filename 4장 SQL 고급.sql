# 날짜 : 2026/05/06
# 이름 : 허민재
# 내용 : 4장 SQL 고급

# 실습 4-1. 테이블 생성
CREATE TABLE Employee (
	empno INT primary KEY,
    name VARCHAR(10) NOT NULL,
    gender CHAR(1) NOT NULL,
    hp CHAR(13) UNIQUE NOT NULL,
    job VARCHAR(10) DEFAULT NULL,
    depno INT DEFAULT NULL,
    regdate DATE NOT NULL
);

CREATE TABLE Dept(
	depno INT PRIMARY KEY,
    dname VARCHAR(10) NOT NULL,
    tel VARCHAR(12) NOT NULL
);

CREATE TABLE Sale(
	no INT PRIMARY KEY AUTO_INCREMENT,
    empno INT NOT NULL,
    year YEAR NOT NULL,
    month TINYINT NOT NULL,
    price INT NOT NULL DEFAULT 0
);

# 실습 4-2
INSERT INTO Employee VALUES ('1001', '김유신', 'M', '010-1234-1001', '부장', 101, '2025-11-19');
INSERT INTO Employee VALUES ('1002', '김춘추', 'M', '010-1234-1002', '차장', 104, '2025-11-19');
INSERT INTO Employee VALUES ('1003', '장보고', 'M', '010-1234-1003', '사원', 101, '2025-11-19');
INSERT INTO Employee VALUES ('1004', '강감찬', 'M', '010-1234-1004', '대리', 102, '2025-11-19');
INSERT INTO Employee VALUES ('1005', '신사임당', 'F', '010-1234-1005', '과장', 102, '2025-11-19');
INSERT INTO Employee VALUES ('1006', '이황', 'M', '010-1234-1006', '차장', 103, '2025-11-19');
INSERT INTO Employee VALUES ('1007', '이이', 'M', '010-1234-1007', '사원', 105, '2025-11-19');
INSERT INTO Employee VALUES ('1008', '이순신', 'M', '010-1234-1008', '차장', 103, '2025-11-19');
INSERT INTO Employee VALUES ('1009', '허난설현', 'F', '010-1234-1009', '사원', 104, '2025-11-19');
INSERT INTO Employee VALUES ('1010', '정약용', 'M', '010-1234-1010', '대리', 104, '2025-11-19');

INSERT INTO Dept VALUES ('101', '경영지원부', '051-512-1001');
INSERT INTO Dept VALUES ('102', '영업부', '051-512-1002');
INSERT INTO Dept VALUES ('103', '개발부', '051-512-1003');
INSERT INTO Dept VALUES ('104', '인사부', '051-512-1004');
INSERT INTO Dept VALUES ('105', '기획부', '051-512-1005');

INSERT INTO Sale (empno, year, month, price) VALUES ('1001', '2018', 1, '98100');
INSERT INTO Sale (empno, year, month, price) VALUES ('1002', '2018', 1, '136000');
INSERT INTO Sale (empno, year, month, price) VALUES ('1003', '2018', 1, '80000');
INSERT INTO Sale (empno, year, month, price) VALUES ('1004', '2018', 1, '78000');
INSERT INTO Sale (empno, year, month, price) VALUES ('1005', '2018', 1, '93100');
INSERT INTO Sale (empno, year, month, price) VALUES ('1001', '2018', 2, '24100');
INSERT INTO Sale (empno, year, month, price) VALUES ('1002', '2018', 2, '126100');
INSERT INTO Sale (empno, year, month, price) VALUES ('1003', '2018', 2, '19100');
INSERT INTO Sale (empno, year, month, price) VALUES ('1005', '2018', 2, '19100');
INSERT INTO Sale (empno, year, month, price) VALUES ('1006', '2018', 2, '53100');
INSERT INTO Sale (empno, year, month, price) VALUES ('1001', '2019', 2, '24100');
INSERT INTO Sale (empno, year, month, price) VALUES ('1002', '2019', 1, '109100');

INSERT INTO Sale (empno, year, month, price) VALUES ('1003', '2019', 1, 101000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1004', '2019', 1, 53000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1007', '2019', 1, 24000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1002', '2019', 2, 160000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1003', '2019', 2, 101000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1004', '2019', 2, 43000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1005', '2019', 2, 24000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1006', '2019', 2, 109000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1002', '2020', 1, 201000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1004', '2020', 1, 63000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1005', '2020', 1, 74000);

INSERT INTO Sale (empno, year, month, price) VALUES ('1006', '2020', 1, 122000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1007', '2020', 1, 111000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1002', '2020', 2, 120000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1003', '2020', 2, 93000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1004', '2020', 2, 84000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1005', '2020', 2, 180000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1008', '2020', 2, 76000);

INSERT INTO Sale (empno, year, month, price) VALUES ('1001', '2021', 1, 56000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1002', '2021', 1, 123000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1005', '2021', 1, 91000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1007', '2021', 1, 78000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1002', '2021', 2, 32000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1003', '2021', 2, 148000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1004', '2021', 2, 106000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1005', '2021', 2, 112000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1001', '2021', 3, 47000);
INSERT INTO Sale (empno, year, month, price) VALUES ('1006', '2021', 3, 36000);

SELECT * FROM Employee;
SELECT * FROM Dept;
SELECT * FROM Sale;


# 실습 4-3
SELECT * FROM Employee WHERE name != '김춘추';
SELECT * FROM Employee WHERE name <> '김춘추'; -- != 연산자와 동일
SELECT * FROM Employee WHERE job = '사원' OR job = '대리';
SELECT * FROM Employee WHERE job IN ('사원', '대리'); -- 위 OR 조건절과동일
SELECT * FROM Employee WHERE name LIKE '김%'; -- % : 와일드칻, 아무 문자열
SELECT * FROM Employee WHERE name LIKE '%신';
SELECT * FROM Employee WHERE name LIKE '이__';
SELECT * FROM Employee WHERE name LIKE '_순%';
SELECT * FROM Employee WHERE hp LIKE '010-%';
SELECT * FROM Employee WHERE DEPNO IS NULL;
SELECT * FROM Employee WHERE DEPNO IS NOT NULL;
SELECT * FROM Employee WHERE EMPNO >= 1005;
SELECT * FROM DEPT WHERE DEPTNO = 10;
SELECT * FROM DEPT WHERE DNAME = '개발부';
SELECT * FROM DEPT WHERE TEL LIKE '%30%';
SELECT * FROM DEPT WHERE DEPTNO IN (10,30);
SELECT * FROM DEPT WHERE DNAME LIKE '경영__';
SELECT * FROM SALE WHERE PRICE > 50000;
SELECT * FROM SALE WHERE PRICE >= 50000 AND PRICE < 100000 AND MONTH = 1;
SELECT * FROM SALE WHERE PRICE BETWEEN 50000 AND 100000;
SELECT * FROM SALE WHERE PRICE NOT BETWEEN 50000 AND 100000;
SELECT * FROM SALE WHERE YEAR = 2024;
SELECT * FROM SALE WHERE YEAR = 2024 AND MONTH = 2;
SELECT * FROM SALE WHERE MONTH IN (1, 2);


# 실습 4-4
SELECT * FROM SALE ORDER BY price;
SELECT * FROM SALE ORDER BY price DESC;
SELECT * FROM Employee ORDER BY name;
SELECT * FROM Employee ORDER BY name DESC;
SELECT * FROM Employee ORDER BY regdate ASC;
select * FROM Sale WHERE price > 50000 ORDER BY year DESC, MONTH, price DESC;

# 실습 4-5
SELECT * FROM Sale LIMIT 3;
SELECT * FROM Sale LIMIT 0, 3;
SELECT * FROM Sale LIMIT 1, 2;
SELECT * FROM Sale LIMIT 5, 3;
SELECT * FROM Sale ORDER BY price DESC LIMIT 3, 5;
SELECT * FROM Sale WHERE price < 50000 ORDER BY price DESC LIMIT 3;
SELECT * FROM Sale 
	WHERE price > 50000 
	ORDER BY year DESC, month, price DESC 
	LIMIT 5;

# 실습 4-6
select SUM(PRICE) AS 합계 FROM SALE;
SELECT AVG(price) AS 평균 FROM Sale;
SELECT MAX(price) AS 최대값 FROM Sale;
SELECT MIN(price) AS 최소값 FROM Sale;
SELECT CEILING(1.2);
SELECT ceiling(1.8);
SELECT FLOOR(1.2);
SELECT FLOOR(1.8);
SELECT ROUND(1.2);
SELECT ROUND(1.8);
SELECT RAND(); -- 0 ~ 1 사이 정수
SELECT CEILING(RAND() * 10); -- 1 ~ 45 사이 정수
SELECT COUNT(price) AS 갯수 FROM Sale; -- NULL 값은 COUNT에서 제외
SELECT COUNT(*) AS 튜플갯수 FROM Sale;

SELECT LEFT('HelloWorld', 5);
SELECT RIGHT('HelloWorld', 5);
SELECT SUBSTRING('HelloWorld', 6, 5);
SELECT CONCAT('Hello', 'World');
SELECT CONCAT(empno, name, hp) FROM Employee WHERE empno='1008';

SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();

INSERT INTO Employee SET
	empno = '1012',
    name = '을지문덕',
    gender = 'F',
    hp = '010-1234-1012',
    regdate = NOW();

# 실습 4-7
SELECT SUM(price) AS SUM from Sale WHERE year = '2018' AND month = '1';
select * from sale;

# 실습 4-8
SELECT SUM(price) AS SUM, AVG(price) AS AVG from Sale WHERE year = '2019' AND month = '2' AND price >= 50000;

# 실습 4-9
SELECT MIN(price) AS 최저, MAX(price) AS 최고, SUM(price) AS 매출 FROM Sale WHERE year = '2020'; 

# 실습 4-10
SELECT empno FROM Sale GROUP BY empno; -- group by 절에서 사용한 컬럼을 SELECT 조회
SELECT year FROM Sale GROUP BY year;
SELECT empno, year FROM Sale GROUP BY empno, year; -- EMPNO, YEAR 컬럼을 그룹으로 묶어서 조회
SELECT empno, COUNT(*) AS 건수 FROM Sale group by EMPNO;
SELECT empno, SUM(price) AS 합계 FROM Sale group by EMPNO;
SELECT empno, AVG(price) AS 평균 FROM Sale GROUP BY EMPNO;

SELECT 
	empno, 
    year,
    SUM(price) AS 합계
    FROM Sale
    WHERE price >= 100000
    GROUP BY empno, year
    ORDER BY 합계 DESC;

# 실습 4-11
SELECT empno, SUM(price) AS 합계 FROM sale
	GROUP BY empno
    HAVING 합계 >= 200000;
    
SELECT 
	empno, 
    year,
    SUM(price) AS 합계
    FROM Sale
    WHERE price >= 100000
    GROUP BY empno, year
    HAVING 합계 >= 200000
    ORDER BY 합계 DESC;

# 실습 4-12
CREATE TABLE Sale2 LIKE Sale;
SELECT * FROM Sale2;
INSERT INTO Sale2 SELECT * FROM Sale;
UPDATE Sale2 SET year = year + 4;

SELECT * FROM Sale UNION SELECT * FROM Sale2;

SELECT * FROM Sale WHERE price >= 100000
UNION
SELECT * FROM Sale2 WHERE price >= 100000;

SELECT empno, year, price FROM sale 
UNION
SELECT empno, year, price FROM sale2;

SELECT empno, year, SUM(price) AS 합계
FROM sale
GROUP BY empno, year
UNION
select empno, year, SUM(price) AS 합계
FROM sale2
GROUP BY empno, year
ORDER BY year ASC, 합계 DESC;

# 실습 4-13
SELECT * FROM Sale INNER JOIN employee ON Sale.empno = employee.empno;
SELECT * FROM Employee INNER JOIN Department ON Employee.depno = department.depno;

SELECT * FROM Sale AS A JOIN employee AS B ON A.EMPNO = B.EMPNO;
SELECT * FROM Employee AS A JOIN department AS B ON A.DEPNO = B.depNo;

SELECT * FROM Sale AS A, Employee AS B WHERE A.empno = B.empno;

SELECT * FROM Sale a JOIN employee b on a.empno = b.empno;
SELECT * FROM Sale as a JOIN employee as b USING(EMPNO); -- 두 테이블의 컴럼명이 동일한 경우 using 사용

SELECT A.NO, A.empno, price, name, job FROM sale AS A JOIN Employee AS B ON A.empno = B.empno
	WHERE price >= 100000;
    
SELECT a.no, a.empno, b.name, B.job, year, SUM(price) AS 합계 FROM Sale A 
JOIN Employee AS B ON A.empno = B.empno
GROUP BY A.empno, A.year HAVING 합계 >= 100000
ORDER BY A.year asc, 합계 desc;

SELECT A.empno, A.price, B.name, B.job, C.dname FROM Sale AS A 
	JOIN Employee AS B ON A.empno = B.empno
	JOIN dept AS C ON B.depno = c.depno
    WHERE price > 100000
    ORDER BY price DESC;
    

# 실습 4-14
SELECT * FROM Sale AS A
				LEFT JOIN Employee AS B
					ON A.empno = B.empno;
                    
SELECT * FROM Sale AS A
				right JOIN Employee AS B
					ON A.empno = B.empno;

# 실습 4-15
SELECT A.empno, A.NAME, A.JOB, B.name FROM employee AS A JOIN department AS B ON A.depNo = B.depno;

# 실습 4-16
SELECT B.name, SUM(A.PRICE) FROM Sale AS A JOIN employee AS B ON A.empno = B.empno WHERE B.NAME = '김유신' AND A.year = '2019';
SELECT A.name, SUM(B.PRICE) AS 매출의합 FROM employee AS A JOIN Sale AS B ON A.empno = B.empno WHERE A.NAME = '김유신' AND B.year = '2019'; 

SELECT * FROM sale;

# 실습 4-17
SELECT * FROM Sale AS A JOIN employee AS B ON A.empno = B.empno WHERE A.year = '2019' AND A.price >= 50000 ORDER BY price DESC;

SELECT 
A.empno,
B.name,
c.dname,
b.job,
a.year,
SUM(price) AS 총합
FROM Sale as A
JOIN Employee AS B ON A.empno = b.empno
join Dept AS C ON B.depno = C.depno
WHERE year = '2019' AND price >= 50000 
GROUP BY empno
HAVING 총합 >= 100000
ORDER BY 총합 DESC;

