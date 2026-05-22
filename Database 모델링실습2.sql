
CREATE USER 'university'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON university.* TO 'university'@'%';
FLUSH PRIVILEGES;

# 데이터 간의 외래키(FK) 제약 조건 순서를 고려하여, 에러 없이 한 번에 실행되도록 
# Department ➔ Professor ➔ Student ➔ Lecture ➔ Register 순서대로 정렬

INSERT INTO `University`.`Department` (`depNo`, `depName`, `depTel`) VALUES
(10, '국어국문학과', '051-510-1010'),
(11, '영어영문학과', '051-510-1011'),
(20, '경영학과', '051-510-1020'),
(21, '경제학과', '051-510-1021'),
(22, '정치외교학과', '051-510-1022'),
(23, '사회복지학과', '051-510-1023'),
(30, '수학과', '051-510-1030'),
(31, '통계학과', '051-510-1031'),
(32, '생명과학과', '051-510-1032'),
(40, '기계공학과', '051-510-1040'),
(41, '전자공학과', '051-510-1041'),
(42, '컴퓨터공학과', '051-510-1042');

INSERT INTO `University`.`Professor` (`proNo`, `depNo`, `proName`, `proJumin`, `proHp`, `proEmail`, `proAddr`) VALUES
('P10101', 10, '김유신', '750120-1234567', '010-1101-1976', 'kimys@hg.ac.kr', '서울'),
('P10102', 10, '계백', '740610-1234567', '010-1102-1975', 'gaeback@hg.ac.kr', '서울'),
('P11101', 11, '김관창', '880529-1234567', '010-1103-1989', 'kwanch@hg.ac.kr', '대전'),
('P11103', 11, '김춘추', '780412-1234567', '010-2101-1979', 'kimcc@hg.ac.kr', '대전'),
('P11104', 11, '이사부', '650911-1234567', '010-2104-1966', 'leesabu@hg.ac.kr', '대전'),
('P22110', 22, '장보고', '780727-1234567', '010-3101-1979', 'jangbg@hg.ac.kr', '대구'),
('P23102', 23, '선덕여왕', '830614-1234567', '010-4101-1984', 'gueen@hg.ac.kr', '대구'),
('P31101', 31, '강감찬', '641020-1234567', '010-5101-1965', 'kang@hg.ac.kr', '대구'),
('P31104', 31, '신사임당', '711227-1234567', '010-6101-1972', 'sinsa@hg.ac.kr', '부산'),
('P40101', 40, '이이', '910906-1234567', '010-7103-1992', 'leelee@hg.ac.kr', '부산'),
('P40102', 40, '이황', '881208-1234567', '010-7104-1989', 'hwang@hg.ac.kr', '광주'),
('P42103', 42, '송상현', '760313-1234567', '010-8101-1977', 'ssh@hg.ac.kr', '광주');

INSERT INTO `University`.`Student` (
    `stdNo`, 
    `depNo`, 
    `proNo`, 
    `stdName`, 
    `stdJumin`, 
    `stdHp`, 
    `stdEmail`, 
    `stdAddr`
) VALUES
('20101001', 10, 'P10101', '정우성', '760121-1234567', '010-1101-7601', NULL, '서울'),
('20101002', 10, 'P10101', '이정재', '750611-1234567', '010-1102-7506', NULL, '서울'),
('20111011', 11, 'P11103', '전지현', '890530-1234567', '010-1103-8905', 'jjh@naver.com', '대전'),
('20111013', 11, 'P11103', '이나영', '790413-1234567', '010-2101-7904', 'lee@naver.com', '대전'),
('20111014', 11, 'P11104', '원빈', '660912-1234567', '010-2104-6609', 'one@daum.net', '대전'),
('20122110', 22, 'P22110', '장동건', '790728-1234567', '010-3101-7907', 'jang@naver.com', '대구'),
('20123102', 23, 'P23102', '고소영', '840615-1234567', '010-4101-8406', 'goso@daum.net', '대구'),
('20231101', 31, 'P31104', '김연아', '651021-1234567', '010-5101-6510', 'yuna@daum.net', '대구'),
('20231104', 31, 'P31104', '유재석', '721128-1234567', '010-6101-7211', NULL, '부산'),
('20240101', 40, 'P40101', '강호동', '920907-1234567', '010-7103-9209', NULL, '부산'),
('20240102', 40, 'P40101', '조인성', '891209-1234567', '010-7104-8912', 'join@gmail.com', '광주'),
('20242103', 42, 'P42103', '강동원', '770314-1234567', '010-8101-7703', 'dong@naver.com', '광주');

INSERT INTO `University`.`Lecture` (`lecNo`, `proNo`, `lecName`, `lecCredit`, `lecTime`, `lecClass`) VALUES
('101001', 'P10101', '대학 글쓰기', 2, 10, '본102'),
('101002', 'P10102', '한국어음운론', 3, 30, '본102'),
('101003', 'P10102', '한국현대문학사', 3, 30, '본103'),
('111011', 'P11103', '중세영문학', 3, 25, '본201'),
('111012', 'P11104', '영미시', 3, 25, '본201'),
('231110', 'P23102', '사회복지학개론', 1, 8, '별관103'),
('311002', 'P31101', '통계학의 이해', 2, 16, '별관303'),
('311003', 'P31104', '기초 통계학', 3, 26, '별관303'),
('401019', 'P40101', '기계역학', 3, 36, '공학관 102'),
('421012', 'P42103', '데이터베이스', 3, 32, '공학관 103');


INSERT INTO `University`.`Register` (
    `stdNo`, 
    `lecNo`, 
    `proNo`, 
    `regAttenScore`, 
    `regMidScore`, 
    `regFinalScore`, 
    `regTotal`, 
    `regGrade`
) VALUES 
('20101001', '101001', 'P10101', NULL, NULL, NULL, NULL, NULL), -- 정우성
('20101001', '101002', 'P10102', NULL, NULL, NULL, NULL, NULL), -- 정우성
('20111013', '111011', 'P11103', NULL, NULL, NULL, NULL, NULL), -- 이나영
('20123102', '231110', 'P23102', NULL, NULL, NULL, NULL, NULL), -- 고소영
('20240101', '401019', 'P40101', NULL, NULL, NULL, NULL, NULL), -- 강호동 
('20240101', '421012', 'P42103', NULL, NULL, NULL, NULL, NULL), -- 강호동
('20101001', '101003', 'P10102', NULL, NULL, NULL, NULL, NULL), -- 정우성
('20242103', '311003', 'P31104', NULL, NULL, NULL, NULL, NULL), -- 강동원
('20242103', '421012', 'P42103', NULL, NULL, NULL, NULL, NULL), -- 강동원
('20111013', '111012', 'P11104', NULL, NULL, NULL, NULL, NULL); -- 이나영

# 문제1. 모든 학생의 학생번호, 이름, 휴대폰, 학과번호, 학과명을 조회하시오. 
SELECT 
	stdNo,
	stdName,
    stdHp,
    stdEmail,
    depName
	FROM Student AS a JOIN department AS b ON a.depNo = b.depNo;
    
# 문제2. 모든 교수의 교수번호, 이름, 휴대폰, 학과번호, 학과명을 조회하시오.
SELECT 
	proNo,
    proName,
    proHp,
    a.depNo,
    depName
	FROM professor AS a JOIN department AS b ON a.depNo = b.depNo;

# 문제3. 모든 강좌의 강좌번호, 강좌명, 담당교수명, 휴대폰을 조회하시오.
SELECT 
	lecNo,
    lecName,
    proName,
    proHp
	FROM Lecture AS a JOIN professor AS b ON a.proNo = b.proNo; 

# 문제4. 모든 강좌의 강좌번호, 강좌명, 담당교수 번호, 담당교수명, 휴대폰, 학과번호, 학과명을 조회하시오.  
SELECT 
	lecNo,
    lecName,
    proHp,
    proName,
    proHp,
    b.depNo,
    depName
	FROM lecture AS a JOIN professor AS b ON a.proNo = b.prono
	JOIN department AS C ON b.depNo = c.depNo;

# 문제5. 모든 수강 내역에서 학생번호, 학생명, 강좌번호, 강좌명, 교수번호, 교수명을 조회하시오.
SELECT 
	stdNo,
    stdName,
    lecNo,
    lecName,
    b.proNo,
    proName
	FROM Lecture AS a JOIN professor AS b ON a.proNo = b.proNo
    JOIN student AS c ON b.proNo = c.proNo;

# 문제6. 수강 테이블에 출석점수, 중간고사점수, 기말고사 점수를 임의로 입력하시오.(1~100 사이)
UPDATE `University`.`Register`
SET `regAttenScore` = FLOOR(RAND() * 100) + 1,
    `regMidScore` = FLOOR(RAND() * 100) + 1,
    `regFinalScore` = FLOOR(RAND() * 100) + 1;

SELECT * FROM Department;
SELECT * FROM Professor;
SELECT * FROM Student;
SELECT * FROM Lecture;
select * from register;

# 문제7. 수강 테이블에 출석점수, 중간고사점수, 기말고사 점수를 모두 더한 평균을 구해 총점에 입력하시오.
SELECT SUM(regAttenScore + regMidScore + regFinalScore) FROM Register;

# 문제8. 수강 테이블에 총점을 기준으로 A ~ F 등급을 입력하시오.

# 문제9. 수강 테이블에서 총점이 가장 큰 점수를 조회하시오.

# 문제10. 수강 테이블에서 정우성 학생의 총점의 평균을 조회하시오.
