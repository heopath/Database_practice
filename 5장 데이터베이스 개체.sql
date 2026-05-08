# 날짜 : 2026/05/08
# 이름 : 허민재
# 내용 : 5장 데이터베이스 개체

# 실습 5-1
SHOW INDEX FROM User1;
SHOW INDEX FROM User2;
SHOW INDEX FROM user3;
SELECT * FROM User3;

# 실습 5-2
CREATE INDEX idx_user1_userid ON User1(userid);
ANALYZE TABLE User1;

# 실습 5-3
DROP INDEX idx_user1_userid ON User1;

# 실습 5-4
CREATE VIEW vw_user1 AS (SELECT name, hp, age FROM User1);
CREATE VIEW vw_user4_age_under30 AS (SELECT * FROM User4 WHERE age < 30);
CREATE VIEW vw_Employee_with_sales AS (
	SELECT
    a.empno AS 직원아이디,
    b.name AS 직원이름,
    b.job AS 직급,
    c.name AS 부서명,
    a.year AS 월,
    a.month AS 매출액
FROM Sale AS a
JOIN Employee AS b ON a.empno = b.empno
JOIN Department AS c ON b.depNo = c.depNo
);

# 실습 5-5
SELECT * FROM vw_user1;
SELECT * FROM vw_user4_age_under30;

# 실습 5-6
DROP VIEW vw_user1;
DROP VIEW vw_user4_age_under30;
DROP VIEW vw_Employee_with_sales;

# 실습 5-7
DELIMITER $$
	CREATE PROCEDURE proc_test1()
    BEGIN
		SELECT * FROM Employee;
        SELECT * FROM Department;
	END $$
DELIMITER ;

CALL proc_test1();

# 실습 5-8
DELIMITER $$
	CREATE PROCEDURE proc_test2(IN _userName VARCHAR(10))
    BEGIN
		SELECT * FROM Employee WHERE name=_userName;
	END $$
    DELIMITER ;
    
CALL proc_test2('김유신');

DELIMITER $$
	CREATE PROCEDURE proc_test3(IN _job VARCHAR(10), IN _depno TINYINT)
    BEGIN
		SELECT * FROM Employee WHERE job=_job AND depno=_depno;
	END $$
    DELIMITER ;
    
CALL proc_test3('차장', 103);

DELIMITER $$
	CREATE PROCEDURE proc_test4(IN _job VARCHAR(10), OUT _count INT)
    BEGIN
		SELECT COUNT(*) INTO _count FROM Employee WHERE job=_job;
END $$
DELIMITER ;

CALL proc_test4('대리', @_count);
SELECT CONCAT('_count : ', @_count);

# 실습 5-9
DELIMITER $$
	CREATE PROCEDURE proc_test5(IN _name VARCHAR(10))
	BEGIN
		DECLARE userId VARCHAR(10);
        select empno into userId from Employee where name = _name;
        select * from sale where userid = userId;
END $$
DELIMITER ;

CALL proc_test5('김유신');

DELIMITER $$
	CREATE PROCEDURE proc_test6()
    BEGIN
		DECLARE num1 INT;
		DECLARE num2 INT;
    
		SET num1 = 1;
		SET num2 = 2;
    
		IF (NUM1 > NUM2) THEN
			SELECT 'NUM1이 NUM2보다 크다.' AS 결과2;
		ELSE
			SELECT 'NUM1이 NUM2보다 작다.' AS 결과2;
    END IF;
END $$
DELIMITER ;

CALL proc_test6();

DELIMITER $$
	CREATE PROCEDURE proc_test7()
    BEGIN
		DECLARE sum INT;
        DECLARE num INT;
        
        SET sum = 0;
        SET num = 1;
        
        WHILE (num <= 10) DO
			SET sum = sum + num;
            SET num = num + 1;
		END WHILE;
        
        SELECT sum AS '1부터 10까지 합계';
	END $$
    DELIMITER ;

CALL proc_test7();

# 실습 5-10. 커서를 활용한 프로시저
DELIMITER $$
	CREATE PROCEDURE proc_test8()
    BEGIN
		# 변수 선언
        DECLARE total INT DEFAULT 0;
        DECLARE v_price INT;
        DECLARE endOfRow BOOLEAN DEFAULT false;
        
        # 커서 선언 : 테이블의 특정 컬럼을 포인팅하는 가상 객체
        DECLARE saleCursor CURSOR FOR
			SELECT price FROM sale;
            
		# 반복 조건
        DECLARE CONTINUE handler 
			FOR NOT FOUND SET endOfRow = TRUE;
            
		# 커서 열기
			OPEN saleCursor;
            
		cursor_loop : LOOP
			-- 커서가 가리키는 현재 행의 값을 v_price 변수에 저장, 한번 반복마다 한행씩 이동
			FETCH saleCursor INTO v_price;
            
		IF endOfRow THEN
			LEAVE cursor_loop;
		END IF;
        
        SET total = total + IFNULL(v_price, 0);
		END LOOP;
        
        SELECT total AS '전체 합계';
        
        CLOSE saleCursor;
	END $$
DELIMITER ;



select price from sale;

CALL proc_test8();

# 실습 5-11. 저장 함수 생성 및 호출
-- root로 접속해서 SET GLOBAL log_bin_trust_function_creators = 1; 실행 - 바이너리 로그가 켜져 있으면 제한됨
DROP FUNCTION IF EXISTS func_test1;

SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$
	CREATE FUNCTION func_test1(_userid VARCHAR(10)) 
    RETURNS int
    READS SQL DATA
    BEGIN
		DECLARE total INT;
        
        SELECT SUM(price) INTO total FROM sale WHERE empno=_userid;
        
        RETURN total;
END $$
DELIMITER ;

SELECT func_test1('1001'); -- 함수는 SELECT, 프로시저는 CALL

DELIMITER $$
CREATE FUNCTION func_test2(_price INT) RETURNS DOUBLE
BEGIN
    DECLARE bonus DOUBLE;
    
    IF (_price >= 100000) THEN
   SET bonus = _price * 0.1;
       ELSE
   SET bonus = _price * 0.05;   
       END IF;
       
RETURN bonus;
END $$
DELIMITER 

SELECT 
	empno,
    year,
    month,
    price,
    func_test2(price) as bonus
FROM sale;

SELECT func_test2(price) as bonus from sale;

