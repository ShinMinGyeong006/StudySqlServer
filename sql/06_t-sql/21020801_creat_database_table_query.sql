﻿use tempdb;
go

create database sqlDB;
go 

---DB생성
use sqlDB; --반드시 입력 
go

create table userTbl--회원테이블
(
	userID char(8) not null primary key,--사용자아이디
	username  nvarchar(10) not null,--이름
	birthYear  int not null,--출생연도
	addr   nchar(2) not null,--지역
	mobile1  char(3), --휴대폰 국번 (010~019)
	mobile2  char(8),--휴대폰 나머지(하이픈 제외)
	height  smallint, --키
	mDate   date ---회원가입일
);
go

create table buyTbl--구매테이블
(
	num int identity not null primary key,--순번(pk)
	userID char(8) not null --사용자 아이디(Ffk)
		foreign key references  userTBL(userID),
	prodName nvarchar(20) not null, --물품명
	groupName nchar(4),--분류
	price int not null,--단가
	amount smallint not null--수량
 );
 go