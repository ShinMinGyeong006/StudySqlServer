use sqlDB;
go

create or alter procedure usp_error
	@userid char(8),
	@username nvarchar(10),
	@birthyear int = 1900,
	@addr nchar(2)='서울',
	@mobile1 char(3)=null,
	@mobile2 char(8)=null,
	@height smallint =170,
	@mdate date = '2021-02-15'
as
	declare @err int;
	begin try
		begin tran
		 insert into userTbl values
			(@userid
			,@username
			,@birthyear
			,@addr
			,@mobile1
			,@mobile2
			,@height
			,@mdate);
		commit
	end try
	begin catch
		select @err = ERROR_NUMBER();
		rollback;
	end catch 
	
	select @err = @@ERROR;
	if @err != 0
	begin
		print '###' +@username+' 을(를) INSERT에 실패했습니다';
	end

	return @err; --오류번호 돌려줌
go

exec usp_error 'WDT', '우당탕', 1988, '부산', '019', '45216631',190, '2021-02-14';
exec usp_error 'WDD','우당당';