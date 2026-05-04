# 날짜 : 2026/04/22
# 이름 : 허민재
# 내용 : SQL 고급연산

# 다양한 데이터 조회연산
SELECT * FROM MEMBER WHERE NAME='김유신';
SELECT * FROM MEMBER WHERE POS='차장';
SELECT * FROM MEMBER WHERE NAME != '김춘추'; -- NAME이 '김춘추'를 제외한 모든 직원 조회
SELECT * FROM MEMBER WHERE NAME <> '김춘추'; -- 위와 동일

SELECT * FROM MEMBER WHERE POS = '사원' OR POS = '대리';
SELECT * FROM MEMBER WHERE POS IN ('사원', '대리'); -- 위와 동일한 결과 출력
SELECT * FROM MEMBER where DEP IN (101, 102, 104); -- DEP가 101, 102, 104번 직원 조회

SELECT * FROM MEMBER WHERE NAME LIKE '%신'; -- NAME이 '신'으로 끝나는 직원 조회
SELECT * FROM MEMBER WHERE NAME LIKE '정%'; -- NAME이 '정'으로 시작하는 직원 조회
SELECT * FROM MEMBER WHERE NAME LIKE '정_'; -- NAME이 '정'으로 시작하는 이름이 외자인 직원 조회
SELECT * FROM MEMBER WHERE NAME LIKE '__'; -- 이름이 외자인 직원 조회
SELECT * FROM MEMBER WHERE NAME LIKE '_성_';

SELECT * FROM SALES WHERE SALE > 50000;
SELECT * FROM SALES WHERE SALE < 50000;
SELECT * FROM SALES WHERE SALE >= 50000 AND SALE <= 100000 AND YEAR = 2020;
SELECT * FROM SALES WHERE SALE BETWEEN 50000 AND 100000;

# 데이터 정렬과 갯수 제한 실습
SELECT * FROM SALES; -- 기본은 PK값으로 정렬
SELECT * FROM SALES ORDER BY SALE ASC; -- SALE 열을 기준으로 오름차순, ASC 생략가능
SELECT * FROM SALES ORDER BY SALE DESC; -- SALE 열을 기준으로 내림차순, DESC는 생략 불가능
SELECT * FROM MEMBER ORDER BY NAME;
SELECT * FROM MEMBER ORDER BY NAME DESC;

SELECT * FROM SALES 
WHERE YEAR = 2020 AND SALE >= 50000 AND MONTH = 2 ORDER BY SALE DESC;

SELECT * FROM SALES LIMIT 3; -- 전체 데이터에서 상위 3개의 데이터만 조회
SELECT * FROM SALES ORDER BY SALE ASC LIMIT 3;
SELECT * FROM SALES LIMIT 0, 3; -- 0 : INDEX, 3 : SIZE, 0에서 부터 3개만 조회
SELECT * FROM SALES LIMIT 5, 2; -- 튜플 행 INDEX 5번부터 2개만 조회 6,7 EX) 게시판 페이지

# 다양한 내장함수 실습
SELECT SUM(SALE) AS '합계' FROM SALES;
SELECT AVG(SALE) AS'평균' FROM SALES;
SELECT COUNT(SALE) AS '전체 갯수'  FROM SALES; -- NULL 값은 제외됨
SELECT COUNT(*) AS '전체 갯수' FROM SALES; -- NULL이 있어도 갯수를 셈, NULL값이 있는 컬럼을 카운트하면 NULL값은 제외

SELECT CEILING(1.2); -- 올림
SELECT CEILING(1.8);
SELECT FLOOR(1.2); -- 내림
SELECT RAND(); -- 0~1 사이 임의의 실수값
SELECT RAND()*10; -- 0~10 사이 실수
SELECT CEILING(RAND()*10); -- 0~10 사이 임의의 정수

SELECT LEFT('HELLOWORLD', 5); -- 왼쪽에서 부터 5글자 띄어쓰기도 포함
SELECT RIGHT('HELLOWORLD', 5); 
SELECT SUBSTRING('HELLOWELCOMEWOLRD', 6,7); -- 전체 문자열에서 6번째부터 7개의 문자열 추출

SELECT CURDATE();
SELECT CURTIME();
SELECT SYSDATE();
SELECT NOW();
INSERT INTO MEMBER VALUES ('P101', '안중근', '010-2121-1002' , '대리', '107', NOW());
SELECT * FROM MEMBER;

-- 2020년 1월 매출 총합
SELECT 
	SUM(SALE) AS '2020년 1월 매출총합',
	AVG(SALE) AS '2020년 1월 매출평균',
    COUNT(SALE) AS '2020년 1월 매출건수'
FROM SALES 
WHERE YEAR = 2020 AND MONTH = 1; 

# 데이터 그룹화 실습
 SELECT uid, sum(sale) as '매출' FROM SALES GROUP BY uid; -- uid를 기준으로 그룹화
 SELECT YEAR, COUNT(*) FROM SALES GROUP BY YEAR;
 SELECT UID, YEAR, SUM(SALE) AS '매출합', AVG(SALE) AS '매출평균' FROM SALES group by UID, YEAR;
 
 -- 매출이 50000 이상 데이터를 UID와 YEAR로 그룹핑된 결과에서 매출합계를 내림차순
 SELECT 
 UID, YEAR, SUM(SALE) AS `매출합` 
 FROM SALES 
 WHERE SALE >= 50000 
 GROUP BY UID, YEAR
 HAVING `매출합` >= 100000 -- HAVING절은 그룹핑 결과에 대한 조건 GROUP BY 뒤에 등장 
 order by `매출합` DESC
 LIMIT 3; -- 문법 순서 SELECT FROM WHERE GROUP BY HAVING ORDER BY LIMIT
 
 # 테이블 결합(JOIN) 실습
 select * from sales join member on sales.uid = member.uid; -- 내부 조인
 select * from member join department on member.dep = department.depno;
 
 select 
	* 
 from sales as s 
 join member as m on s.uid = m.uid
 join department as d on m.dep = d.depNo;
 
  select 
	s.uid,
    m.name,
    m.hp,
    m.pos,
    d.depNo,
    d.name,
    sum(s.sale) as `매출 합계`
 from sales as s 
 join member as m on s.uid = m.uid
 join department as d on m.dep = d.depNo
 where s.year = 2019 OR S.YEAR = 2020 -- S.YEAR IN (2019, 2020)
 group by s.uid
 having `매출 합계` >= 100000
 order by `매출 합계` desc
 LIMIT 2,1;
 
 
 