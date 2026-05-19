# 날짜 : 2026/05/18
# 이름 : 허민재
# 내용 : SQL 연습문제

# 실습 3-1
CREATE DATABASE `College`;
CREATE USER 'college'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON College.* TO 'college'@'%';
FLUSH PRIVILEGES;

# 실습 3-2
CREATE TABLE Student (
    stdNo       CHAR(8)      NOT NULL,
    stdName     VARCHAR(20)  NOT NULL,
    stdHp       VARCHAR(13)  NOT NULL,
    stdYear     INT          NOT NULL,
    stdAddress  VARCHAR(100) NULL,
    PRIMARY KEY (stdNo),
    UNIQUE KEY (stdHp)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Lecture (
    lecNo       INT          NOT NULL,
    lecName     VARCHAR(20)  NOT NULL,
    lecCredit   INT          NOT NULL,
    lecTime     INT          NOT NULL,
    lecClass    VARCHAR(10)  NULL,
    PRIMARY KEY (lecNo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Register (
    regStdNo        CHAR(8)    NOT NULL,
    regLecNo        INT        NOT NULL,
    regMidScore     INT        NULL,
    regFinalScore   INT        NULL,
    regTotalScore   INT        NULL,
    regGrade        CHAR(1)    NULL,
    PRIMARY KEY (regStdNo, regLecNo),
    CONSTRAINT fk_reg_std FOREIGN KEY (regStdNo) REFERENCES Student(stdNo),
    CONSTRAINT fk_reg_lec FOREIGN KEY (regLecNo) REFERENCES Lecture(lecNo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

# 실습 3-3
INSERT INTO Student (stdNo, stdName, stdHp, stdYear, stdAddress) VALUES
('20201016', '김유신', '010-1234-1001', 3, NULL),
('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시'),
('20210216', '장보고', '010-1234-1003', 2, '전라남도 완도시'),
('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구'),
('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구'),
('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구');

INSERT INTO Lecture (lecNo, lecName, lecCredit, lecTime, lecClass) VALUES
(159, '인지행동심리학', 3, 40, '본304'),
(167, '운영체제론', 3, 25, '본B05'),
(234, '중급 영문법', 3, 20, '본201'),
(239, '세법개론', 3, 40, '본204'),
(248, '빅데이터 개론', 3, 20, '본B01'),
(253, '컴퓨팅사고와 코딩', 2, 10, '본B02'),
(349, '사회복지 마케팅', 2, 50, '본301');

INSERT INTO Register (regStdNo, regLecNo, regMidScore, regFinalScore, regTotalScore, regGrade) VALUES
('20201126', 234, NULL, NULL, NULL, NULL),
('20201016', 248, NULL, NULL, NULL, NULL),
('20201016', 253, NULL, NULL, NULL, NULL),
('20201126', 239, NULL, NULL, NULL, NULL),
('20210216', 349, NULL, NULL, NULL, NULL),
('20210326', 349, NULL, NULL, NULL, NULL),
('20201016', 167, NULL, NULL, NULL, NULL),
('20220416', 349, NULL, NULL, NULL, NULL);

# 실습 3-4
SELECT * FROM `Lecture`;

# 실습 3-5
SELECT * FROM Student;

# 실습 3-6
SELECT * FROM Register;

# 실습 3-7
SELECT * FROM `Student` where stdYear = 3;

# 실습 3-8
SELECT * FROM `Lecture` WHERE lecCredit = 2;

# 실습 3-9
update `Register` SET `regMidScore` = 36, `regFinalScore`= 42 WHERE `regStdNo`='20201126' AND `regLecNo`=234;
update `Register` SET `regMidScore` = 24, `regFinalScore`= 62 WHERE `regStdNo`='20201016' AND `regLecNo`=248;
update `Register` SET `regMidScore` = 28, `regFinalScore`= 40 WHERE `regStdNo`='20201016' AND `regLecNo`=253;
update `Register` SET  `regMidScore` = 37, `regFinalScore`= 57 WHERE `regStdNo`='20201126' AND `regLecNo`=239;
update `Register` SET `regMidScore` = 28, `regFinalScore`= 68 WHERE `regStdNo`='20210216' AND `regLecNo`=349;
update `Register` SET `regMidScore` = 16, `regFinalScore`= 65 WHERE `regStdNo`='20210326' AND `regLecNo`=349;
update `Register` SET `regMidScore` = 18, `regFinalScore`= 38 WHERE `regStdNo`='20201016' AND `regLecNo`=167;
update `Register` SET  `regMidScore` = 25, `regFinalScore`= 58 WHERE `regStdNo`='20220416' AND `regLecNo`=349;
 SELECT * FROM `Register`;

# 실습 3-10
update `Register` set `regTotalScore`= `regMidScore` + `regFinalScore`,
`regGrade` = if(`regTotalScore` >= 90, 'A', 
     if(`regTotalScore` >= 80, 'B',
                                     if(`regTotalScore` >= 70, 'C',
     if(`regTotalScore` >= 60, 'D', 'F'))));
SELECT * FROM `Register`;

# 실습 3-11
SELECT * FROM `Register` ORDER BY regTotalScore desc;

# 실습 3-12
SELECT * FROM `Register` WHERE regLecNo = 349 order by regTotalScore desc;

# 실습 3-13
SELECT * FROM `Lecture` WHERE lecTime >= 30;

# 실습 3-14
SELECT lecName, lecClass FROM `Lecture`;

# 실습 3-15
SELECT stdNo, stdName FROM `Student`;

# 실습 3-16
SELECT * FROM `Student` WHERE stdAddress is null;

# 실습 3-17
SELECT * FROM `Student` WHERE stdAddress LIKE "%부산시%";

# 실습 3-18
SELECT * FROM `Student` AS a JOIN `Register` AS b ON a.stdNo = b.regStdNo;

# 실습 3-19
SELECT 
	stdNo,
    stdName,
    regLecNo,
    regMidScore,
    regFinalScore,
    regTotalScore,
    regGrade
FROM `Student` AS a, `Register` AS b WHERE a.stdNo = b.regStdNo;

# 실습 3-20
SELECT `stdName`, `stdNo`, `regLecNo` 
FROM `Student` AS a 
JOIN `Register` AS b 
ON a.stdNo = b.regStdno;

# 실습 3-21
SELECT
	`stdNo`,
	`stdName`,
	COUNT(`stdNo`) AS `수강신청 건수`,
	SUM(`regTotalScore`) AS `종합점수`,
	SUM(`regTotalScore`) / COUNT(`stdNo`) AS `평균`
FROM `Student` AS a
JOIN `Register` AS b 
ON a.stdNo = b.regStdNo
group by stdNo;

# 실습 3-22
SELECT * FROM `Register` AS a
JOIN `Lecture` as b on a.regLecno = b.lecNo;

# 실습 3-23
SELECT 
	`regStdNo`,
	`regLecNo`,
	`lecName`,
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`
FROM `register` AS a JOIN `Lecture` AS b ON a.regLecNo = b.Lecno ;

# 실습 3-24
SELECT
	COUNT(*) AS `사회복지 마케팅 수강 신청건수`,
	AVG(`regTotalScore`) AS `사회복지 마케팅 평균`
FROM `Register` AS a JOIN `Lecture` AS b ON a.regLecNo = b.Lecno
GROUP BY regLecNo having regLecNo = 349;

# 실습 3-25
SELECT 
	`regStdNo`,
	`lecName`
FROM `Register` AS a JOIN `Lecture` AS b ON a.regLecNo = b.lecNo
WHERE a.regGrade = 'A';

# 실습 3-26
SELECT * FROM `Student` AS a
JOIN `Register` AS b on a.Stdno = b.regStdNo
JOIN `Lecture` AS c on b.regLecNo = c.LecNo;

# 실습 3-27
SELECT 
	`stdNo`,
	`stdName`,
	`lecNo`,
	`lecName`,
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`
FROM `Student` AS a
JOIN `Register` AS b on a.Stdno = b.regStdNo
JOIN `Lecture` AS c on b.regLecNo = c.LecNo
ORDER BY regGrade, regFinalScore desc;

# 실습 3-28
SELECT
`stdNo`,
`stdName`,
`lecName`,
`regTotalScore`,
`regGrade`
FROM `Student` AS a
JOIN `Register` AS b on a.Stdno = b.regStdNo
JOIN `Lecture` AS c on b.regLecNo = c.LecNo
WHERE regGrade = 'F';

# 실습 3-29
SELECT 
`stdNo`,
`stdName`,
SUM(`lecCredit`) AS `이수학점`
FROM `Student` AS a
JOIN `Register` AS b on a.Stdno = b.regStdNo
JOIN `Lecture` AS c on b.regLecNo = c.LecNo
WHERE regGrade != 'F'
group by stdNo, stdName;

# 실습 3-30
SELECT 
	`stdNo`,
	`stdName`,
	GROUP_CONCAT(`lecName`) AS `신청과목`,
	GROUP_CONCAT(if(`regTotalScore` >= 60, `lecName`, null)) AS `이수과목`
FROM `Student` AS a
JOIN `Register` AS b on a.Stdno = b.regStdNo
JOIN `Lecture` AS c on b.regLecNo = c.LecNo
group by stdNo, stdName;


