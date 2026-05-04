-- 날짜 : 2026/05/04
-- 이름 : 허민재
-- 내용 : 1장 데이터베이스 개요 및 설치

# MySQL 접속
#> mysql -u root -p
#> -u: user, 사용자 계정
#> -p: password, 비밀번호

# 데이터베이스 생성, 제거
CREATE DATABASE mydb;
DROP DATABASE mydb; -- 실행 단축키 : Ctrl + Enter

# 데이터베이스 목록 조회
SHOW DATABASES;

# 직접 데이터베이스 선택
 USE MYDB;
USE STUDYDB;

# ---------------------------------
# 일반 관리자 생성, 권한부여, 반영
CREATE USER 'admin'@'%' IDENTIFIED BY '1234'; -- admin 계정 생성, %는 외부접속 IP를 의미
GRANT ALL PRIVILEGES ON MYDB.* TO 'admin'@'%'; -- amdin에게 mydb의 모든권한(읽기/쓰기/수정/삭제) 부여
FLUSH PRIVILEGES; -- admin 계정권한 반영

# 계정삭제
DROP USER 'admin'@'%';
