use sqlDB;
go

create or alter proc usp_return
	@username nvarchar(10)
as
	declare @userid char(8);
	select @userid=@userid
	  from userTbl
	 where username=@username;
	 
	 if(@userid<> '') return 1; --inline if
	 else return 0;
go

declare @retval int;
exec @retval =usp_return '은지원';
print @retval;
