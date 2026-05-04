# 날짜 : 2026/05/04
# 이름 : 허민재
# 내용 : 2장 SQL 기초

# 테이블 생성
CREATE TABLE User1 (
	userid VARCHAR(20),
    name VARCHAR(20),
    hp   CHAR(13),
    age  INT
);

# 테이블 삭제
DROP TABLE User1;

# 실습 2-2, 데이터 삽입 (워크북 p4)
INSERT INTO User1 VALUES ('A101', '김유신', '010-1234-1111', 25);
INSERT INTO User1 VALUES ('A102', '김춘추', '010-1234-2222', 23);
INSERT INTO User1 VALUES ('A103', '장보고', '010-1234-3333', 32);
INSERT INTO User1 (userid, name, age) VALUES ('A104', '강감찬', 45);
INSERT INTO User1 SET userid='A105', name='이순신', hp='010-1234-5555';

# 실습 2-3, 데이터 조회
SELECT * FROM User1;
SELECT * FROM User1 WHERE userid = 'A101';
SELECT * FROM User1 WHERE name = '김춘추';
SELECT * FROM User1 WHERE age < 30;
SELECT * FROM User1 WHERE age >= 30;
SELECT userid, name, age FROM User1;

# 실습 2-4, 데이터 수정
UPDATE User1 SET hp='010-1234-4444' WHERE userid = 'A104';
UPDATE User1 SET age=51 WHERE userid = 'A105';
UPDATE User1 SET hp='010-1234-1001', age=27 WHERE userid='A101';

# 실습 2-5, 데이터 삭제
DELETE FROM User1 WHERE userid='A101';
DELETE FROM User1 WHERE userid='A102' AND age=25;
DELETE FROM User1 WHERE age >= 30;

# 실습 2-6 테이블 컬럼 수정
ALTER TABLE User1 ADD gender TINYINT;
ALTER TABLE User1 ADD birth CHAR(10) AFTER name;
ALTER TABLE User1 MODIFY gender CHAR(1);
ALTER TABLE User1 MODIFY age TINYINT;
ALTER TABLE User1 DROP gender;
ALTER TABLE User1 DROP birth;

# 실습 2-7, 테이블 복사
CREATE TABLE User1_1 LIKE User1; -- User1 테이블을 가지고 User1_1 테이블 복사, 데이터는 복사 안됨
INSERT INTO user1_1 SELECT * FROM User1; -- User1 테이블 데이터를 User1_1로 복사
SELECT * FROM user1_1;

