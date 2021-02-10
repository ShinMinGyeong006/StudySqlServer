declare @curdate date;
declare @curyear varchar(4), @curMonth varchar(2), @curday varchar(2);
declare @sql varchar(2000);

set @curdate = getDate();
set @curyear = year(@curDate);
set @curMonth = month(@curDate);
set @curday = day(@curdate);

print @curyear;
print replicate('0',2 - len(@curmonth)) + @curmonth;
print right(('00'+@curmonth),2);
print @curday;

print format(@curdate,'yyyy-MM-dd'); --제일 쉬운 방법 

set @sql = 'create table backup_' + format(@curdate,'yyyy_MM_dd');
set @sql += ' (id int not null primary key, bNam varchar(100) not null); ';

exec(@sql);