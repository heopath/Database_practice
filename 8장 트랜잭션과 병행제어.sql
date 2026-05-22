# 날짜 : 2026/05/22
# 이름 : 허민재
# 내용 : 8장 트랜잭션과 병행제어

# 실습 8-1
SELECT * FROM bank_account;
START TRANSACTION;
UPDATE bank_account SET a_balance = a_balance - 10000 where a_no='101-11-1001';
UPDATE bank_account SET a_balance = a_balance + 10000 where a_no='101-11-1003';
-- 작업완료
COMMIT;

SELECT * FROM bank_account;

# 실습 8-2
SELECT * FROM bank_account;

START TRANSACTION;
UPDATE bank_account SET a_balance = a_balance - 10000 where a_no='101-11-1001';
UPDATE bank_account SET a_balance = a_balance + 10000 where a_no='101-11-1003';
-- 작업취소
ROLLBACK;

SELECT * FROM bank_account;

# 실습 8-3
SELECT @@AUTOCOMMIT;

SET AUTOCOMMIT = 0; -- 자동 커밋 OFF
SET AUTOCOMMIT = 1; -- 자동 커밋 ON
	
SELECT * FROM bank_account WHERE a_no = '101-11-1001';

START TRANSACTION;
UPDATE bank_account SET a_balance = a_balance - 10000 WHERE a_no = '101-11-1001';
COMMIT;
