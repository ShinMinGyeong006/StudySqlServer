use sqlDB;

declare @myvar1 int;
declare @myvar2 smallint, @myvar3 decimal(5,2);
declare @myvar4 char(20);

set @myvar1=15424521
set @myvar2= 32450;
set @myvar3=3.14;
set @myvar4='가수 이름==>       ';

select @myvar1;
select @myvar2+ @myvar3;
select @myvar4, username from userTbl where height>180;
