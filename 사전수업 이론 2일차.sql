-------------------------------
# 날짜 : 2026/04/21
# 이름 : 허민재
# 내용 : 테이블 제약조건 실습
------------------------------

CREATE TABLE USER2 (
	userid VARCHAR(10) primary key, -- 기본키(PK) 제약조건 설정, 첫번째 컬럼은 무조건 PK
    name VARCHAR(10),
    birth CHAR(10),
    hp CHAR(13),
    addr VARCHAR(100)
);

INSERT INTO `user2` values ('A101', '김유신', '1968-05-09', '010-1234-1001', '경남 김해시'); -- 백틱처리`` 개체명 구분
INSERT INTO user2 values ('A102', '김춘추', '1972-11-23', '010-1234-1002', '경남 경주시');
INSERT INTO user2 values ('A103', '장보고', '1978-03-01', '010-1234-1003', '전남 완도시');
INSERT INTO user2 values ('A104', '강감찬', '1979-08-16', '010-1234-1004', '서울시 관악구');
INSERT INTO user2 values ('A105', '이순신', '1981-05-23', '010-1234-1005', '부산시 진구');

# 고유키 테이블 생성
CREATE TABLE `USER3` (
	`userid` VARCHAR(10) primary key,
    `name` VARCHAR(10), 
    `birth` CHAR(10),
    `hp` CHAR(13) unique, -- 고유키 제약조건 설정, 중복 허용안함 
    `addr` VARCHAR(100)
);

INSERT INTO `user3` values ('A101', '김유신', '1968-05-09', '010-1234-1001', '경남 김해시');
INSERT INTO `user3` values ('A102', '김춘추', '1972-11-23', '010-1234-1002', '경남 경주시');
INSERT INTO `user3` values ('A103', '장보고', '1978-03-01', '010-1234-1003', '전남 완도시');
INSERT INTO `user3` values ('A104', '강감찬', '1979-08-16', '010-1234-1004', '서울시 관악구');
INSERT INTO `user3` values ('A105', '이순신', '1981-05-23', '010-1234-1005', '부산시 진구');

# DEFAULT와 NOT NULL 제약조건 실습

DROP TABLE USER4;
CREATE TABLE `USER4` (
	`userid` VARCHAR(20) primary key,
    `name` VARCHAR(10) NOT NULL, -- NOT NULL 제약조건, 반드시 커럶에 값 입력(NULL 허용안함) 
    `gender` CHAR(1),
    `age` tinyint default 0, -- DEFAULT 제약조건, 컬럼의 기본값 설정
    `hp` CHAR(13) unique NOT NULL, 
    `addr` VARCHAR(100)
);

INSERT INTO `user4` values ('A101', '김유신', 'M', 25, '010-1234-1111', '경남 김해시');
INSERT INTO `user4` values ('A102', '김춘추', 'M', 23, '010-1234-2222', '경남 경주시');
INSERT INTO `user4` values ('A103', '장보고', 'M', 35, '010-1234-3333', '전남 완도시');
INSERT INTO `user4` values ('A104', '강감찬', 'M', 42, '010-1234-4444', '서울시 관악구');
INSERT INTO `user4` (userid, name, gender, hp, addr) values ('A105', '이순신', 'M', '010-1234-5555', '부산시 진구');

INSERT INTO `user4` (userid, name, gender, age, hp, addr) 
			values ('A107', '신사임당', 'F', 32, '010-2222-3333', '강릉시');
INSERT INTO `user4` (userid, name, gender, age, hp, addr) 
			values ('A108', '허난설현', 'F', 27, '010-1234-7777', '경기도 광주시');

CREATE TABLE `USER5` (
	`seq` INT auto_increment primary key, -- 기본키를 지정하기 위한 자동증가 컬럼 추가
	`name` VARCHAR(10) NOT NULL,
    `gender` CHAR(1) CHECK (`gender` IN ('M', 'F')), -- CHECK 제약조건으로 입력되는 값을 검사
    `age` tinyint default 0 CHECK (`AGE` > 0 AND `AGE` < 100), -- CHECK 제약조건으로 입력되는 값을 검사
    `addr` VARCHAR(100)
);

INSERT INTO user5 (`name`, `gender`, `age`, `addr`) values ('김유신', 'M', 25, '경남 김해시');
INSERT INTO user5 (`name`, `gender`, `age`, `addr`) values ('김춘추', 'M', 23, '경남 경주시');
INSERT INTO user5 (`name`, `gender`, `age`, `addr`) values ('장보고', 'M', 35, '전남 완도시');
INSERT INTO user5 (`name`, `gender`, `age`, `addr`) values ('강감찬', 'M', 25, '서울시 관악구');
INSERT INTO user5 (`name`, `gender`, `age`, `addr`) values ('이순신', 'M', 42, '부산 부산 징구');
INSERT INTO user5 (`name`, `gender`, `age`, `addr`) values ('신사임당', 'F', 32, '경남 김해시');


