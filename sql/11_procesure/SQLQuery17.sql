use sqlDB;
go

create or alter procedure usp_ifelse
	@username nvarchar(10) 
as
	declare @birthyear int; --출생년도 저장 변수
	select @birthyear = @birthyear
	  from userTbl
	 where username = @username

	 if(@birthyear >=1980)
	 begin 
		print '아직 젊군요...'
	 end
	 else
	 begin
		print '나이가 지긋...'
	 end
go

exec usp_ifelse '이승기';