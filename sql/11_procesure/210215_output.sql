USE [sqlDB]
GO

/****** Object:  StoredProcedure [dbo].[usp_users]    Script Date: 2021-02-15 오후 2:13:59 ******/


create or alter procedure usp_users4
	@txtvalue nvarchar(20),
	@outvalue int output --리턴받은 매개변수(파라미터)
as
	insert into testTbl values (@txtvalue);
	select @outvalue = ident_current('testTbl'); --testTbl의 현재 identity 값
GO


declare @myvalue int;
exec usp_users4 '테스트값1', @myvalue output;

print concat('현재 입력된 값은 ==>', @myvalue);
select @myvalue;

