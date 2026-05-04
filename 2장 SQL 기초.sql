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


