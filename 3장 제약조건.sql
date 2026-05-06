# 날짜 : 2026/05/06
# 이름 : 허민재
# 내용 : 3장 제약 조건

# 실습 3-1. 기본키 실습
CREATE TABLE User2 (
	userid VARCHAR(10) PRIMARY KEY,
    name VARCHAR(10),
    birth CHAR(10),
    addr VARCHAR(50)
);

# 실습 User2 데이터 추가하기
INSERT INTO User2 VALUES ('A101', '김유신','1968-05-09', '경남 김해시');
INSERT INTO User2 VALUES ('A102', '김춘추','1972-11-23', "경남 경주시");
INSERT INTO User2 VALUES ('A103', '장보고','1978-03-01', "전남 완도군");
INSERT INTO User2 VALUES ('A104', '강감찬','1979-08-16', "서울시 관악구");
INSERT INTO User2 VALUES ('A105', '이순신','1981-05-23', "부산시 진구");

SELECT * FROM USER2;
# 실습 3-3. 고유키 실습
CREATE TABLE User3 (
	userid VARCHAR(10) PRIMARY KEY,
	name VARCHAR(10),
    birth CHAR(10),
    hp CHAR(13) UNIQUE,
    addr VARCHAR(50)
);

# 실습 3-4. User3 데이터 추가하기
INSERT INTO User3 VALUES ('A101', '김유신','1968-05-09','010-1234-1001','경남 김해시');
INSERT INTO User3 VALUES ('A102', '김춘추','1972-11-23','010-1234-1002', "경남 경주시");
INSERT INTO User3 VALUES ('A103', '장보고','1978-03-01','010-1234-1003', "전남 완도군");
INSERT INTO User3 VALUES ('A104', '강감찬','1979-08-16','010-1234-1004', "서울시 관악구");
INSERT INTO User3 VALUES ('A105', '이순신','1981-05-23','010-1234-1005', "부산시 진구");
INSERT INTO User3 VALUES ('A106', '을지문덕','1981-05-23',NULL, "부산시 진구");
INSERT INTO User3 (userid, birth, addr, name) VALUES ('A107', '1983-03-22', '부산 동래구', '송상현');
INSERT INTO User3 SET
					userid = 'b101',
                    name = '홍길동',
                    birth = '1992-05-09',
                    addr = '부산 연제구';
                    
SELECT * FROM USER3;

# 실습 3-5. 외래키 실습하기
CREATE TABLE Parent (
	pid VARCHAR(10) PRIMARY KEY,
	name VARCHAR(10),
	birth CHAR(10),
	addr VARCHAR(100)
);

CREATE TABLE Child (
	cid VARCHAR(10) PRIMARY KEY,
	name VARCHAR(10),  
	hp CHAR(13) UNIQUE,
	parent VARCHAR(10),
	FOREIGN KEY (parent) REFERENCES Parent (pid)
);

# 실습 3-6. Parent, Child 데이터 추가하기
INSERT INTO parent VALUES ('P101', '김유신','1968-05-09','경남 김해시');
INSERT INTO parent VALUES ('P102', '김춘추','1972-11-23', "경남 경주시");
INSERT INTO parent VALUES ('P103', '장보고','1978-03-01', "전남 완도군");
INSERT INTO parent VALUES ('P104', '강감찬','1979-08-16', "서울시 관악구");
INSERT INTO parent VALUES ('P105', '이순신','1981-05-23', "부산시 진구");

INSERT INTO child VALUES ('C101', '김철수','010-1234-1001', 'P101');
INSERT INTO child VALUES ('C102', '김영희','010-1234-1002', 'P101');
INSERT INTO child VALUES ('C103', '강철수','010-1234-1003', 'P103');
INSERT INTO child VALUES ('C104', '이철수','010-1234-1004', 'P105');
INSERT INTO child VALUES ('C105', '최영','010-1234-1005', null);

SELECT * FROM PARENT;
SELECT * FROM CHILD;

# 실습 3-7 DEFAULT와 NOT NULL 실습
CREATE TABLE User4(
	userid VARCHAR(10) PRIMARY KEY,
	name VARCHAR(10) NOT NULL,
	gender CHAR(1),
	age INT DEFAULT 1,
	hp CHAR(13) UNIQUE, 
	addr VARCHAR(20)
);

# 실습 3-8 User4 데이터 추가
INSERT INTO User4 VALUES ('A101', '김유신', 'M', 25,'010-1234-1111','경남 김해시');
INSERT INTO User4 VALUES ('A102', '김춘추', 'M', 23,'010-1234-2222', "경남 경주시");
INSERT INTO User4 VALUES ('A103', '장보고', 'M', 35,'010-1234-3333', "전남 완도군");
INSERT INTO User4 VALUES ('A104', '강감찬', 'M', 42,'010-1234-4444', "서울시 관악구");
DELETE FROM USER4 WHERE USERID = 'A105';
INSERT INTO User4 (USERID, NAME, GENDER, HP, ADDR)
VALUES ('A105', '이순신', 'M','010-1234-5555', "부산시 진구");
INSERT INTO User4 VALUES ('A106', '신사임당', 'F', 32, NULL, "강릉시");
INSERT INTO User4 VALUES ('A107', '허난설현', 'F', 27, NULL, "경기도 광주시");

SELECT * FROM USER4;

# 실습 3-9 CHECK와 AUTO_INCREMENT
CREATE TABLE User5 (
	seq INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(10) NOT NULL,
	gender CHAR(1) CHECK (gender IN ('M', 'F')),
	age INT DEFAULT 1 CHECK (age > 0 AND age < 100),
	addr VARCHAR(20) 
);


# 실습 3-10. User5 데이터 추가하기
INSERT INTO User5 (name, gender, age, addr) VALUES ('김유신', 'M', 25, '경남 김해시');
INSERT INTO User5 VALUES (2, '김춘추', 'M', 23, "경남 경주시");
INSERT INTO User5 (name, gender, age, addr) VALUES ('장보고', 'M', 35, "전남 완도군");
INSERT INTO User5 (name, gender, age, addr) VALUES ('강감찬', 'M', 42, "서울시 관악구");
INSERT INTO User5 (name, gender, age, addr) VALUES ('이순신', 'M', 51,"부산시");
INSERT INTO User5 (name, gender, addr) VALUES ('신사임당', 'F', "강릉시");

select * from user5;

