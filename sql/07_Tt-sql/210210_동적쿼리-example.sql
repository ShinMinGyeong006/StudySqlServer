use sqlDB;
go

declare @sql varchar(100);
set @sql = 'select * from usertbl where userid=''EJW'' ';

exec (@sql);

