Use sqlDB;
go

create table bankbook
           (uname nvarchar(10),
		    umoney int,
					constraint CK_money
					check (umoney>=0));
go

insert into bankbook values ('구매자',1000);
insert into bankbook values ('판매자',0);

begin try
	begin tran
		update bankbook set umoney = umoney-600 where uname='구매자'
		update bankbook set umoney = umoney+600 where uname='판매자'
	commit tran
end try
begin catch 
	rollback tran
end catch

select * from bankbook;