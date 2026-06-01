#날짜 : 2026/06/01
#이름 : 김철학
#내용 : JSP 게시판 프로젝트 실습

# 데이터베이스 생성
DROP DATABASE IF EXISTS board;
CREATE DATABASE board;
USE board;

# 사용자 생성 및 권한부여
DROP USER IF EXISTS  'board'@'%';
CREATE USER 'board'@'%' identified BY '1234';
GRANT ALL privileges ON `board`.* TO 'board'@'%';
flush privileges;

# 테이블 생성
CREATE TABLE `User` (
	`userid`	VARCHAR(20) PRIMARY KEY,
    `pass`		VARCHAR(100),
    `name`		VARCHAR(20),
    `nick`		VARCHAR(20) UNIQUE,
    `email`		VARCHAR(40) UNIQUE,
    `hp`		CHAR(13)	UNIQUE,
    `role`		VARCHAR(20) default 'MEMBER',	-- 회원 등급(ADMIN, MEMBER, GUEST)
    `zip`		CHAR(5),
    `addr1`		VARCHAR(100),
    `addr2`		VARCHAR(100),	
    `regip`		DATETIME,		-- 회원 시스템 IP 주소
	`regDate`	DATETIME,		-- 회원가입일
    `leaveDate`	DATETIME		-- 회원 탈퇴일
);
CREATE TABLE `Terms` (
	`no`		INT AUTO_INCREMENT PRIMARY KEY,
    `basic` 	TEXT,		-- 기본약관, 약 64KB 크기 용량
    `privacy` 	TEXT		-- 개인정보 취급방침 약관, 약 64KB 크기 용량
);
CREATE TABLE `Article` (
	`ano`			INT AUTO_INCREMENT PRIMARY KEY,
    `category`		VARCHAR(20),
    `title`			VARCHAR(50),
    `content`		TEXT,
    `comment`		INT DEFAULT 0,
    `file`			TINYINT DEFAULT 0,
    `hit`			INT DEFAULT 0,
    `writer`		VARCHAR(20) NOT NULL,
    `regip`			VARCHAR(20) NOT NULL,
    `wdate`			DATETIME,
    FOREIGN KEY (`writer`) REFERENCES `User` (`userid`)
);
CREATE TABLE `Comment` (
	`cno`		INT AUTO_INCREMENT PRIMARY KEY,
    `parent`	INT NOT NULL,
    `content`	TEXT,
    `writer`	VARCHAR(20) NOT NULL,
    `regip`		VARCHAR(100) NOT NULL,
    `wdate`		DATETIME,
	FOREIGN KEY (`parent`) REFERENCES `Article` (`ano`),
    FOREIGN KEY (`writer`) REFERENCES `User` (`userid`)
);
CREATE TABLE `File` (
	`fno`		INT AUTO_INCREMENT PRIMARY KEY,
    `ano`		INT NOT NULL,
    `oname`		VARCHAR(100) NOT NULL,
    `sname`		VARCHAR(100) NOT NULL,
    `download`  INT DEFAULT 0,
    `rdate` 	DATETIME,
	FOREIGN KEY (`ano`) REFERENCES `Article` (`ano`)
);
