use sqlDB;
go
create or alter function ufn_getZodiac(@birthyear int)
returns nchar(3) 
as
begin
	declare @result nchar(3);
	
	set @result = 
		case
			when (@birthyear%12 = 0) then '원숭이'
			when (@birthyear%12 = 1) then '닭'
			when (@birthyear%12 = 2) then '개'
			when (@birthyear%12 = 3) then '돼지'
			when (@birthyear%12 = 4) then '쥐'
			when (@birthyear%12 = 5) then '소'
			when (@birthyear%12 = 6) then '호랑이'
			when (@birthyear%12 = 7) then '토끼'
			when (@birthyear%12 = 8) then '용'
			when (@birthyear%12 = 9) then '뱀'
			when (@birthyear%12 = 10) then '말'
			else '양'
		end;
	return @result;
end
go

select *,
	dbo.ufn_getAge(birthyear) as 나이,
	dbo.ufn_getZodiac