use sqlDB;
go

select rank() over(partition by addr order by height desc) as '키 큰 순위',
       username, addr, height
  from userTbl;

 create table pivotTbl
 (
	username nvarchar(10),
	season nvarchar(2),
	amount int
 );

 insert into pivotTbl values ('김범수','겨울',10),
							 ('윤종신','여름',15),
							 ('김범수','가을',25),
							 ('김범수','봄',3),
							 ('김범수','봄',37),
							 ('윤종신','겨울',40),
							 ('김범수','여름',14),
							 ('김범수','겨울',22),
							 ('윤종신','여름',64);

select * from pivotTbl;

select * from pivotTbl
	pivot(sum(amount)
		  for season
		  in ([봄],[여름],[가을],[겨울])) as resultPivot;


--Jason
select username, height 
  from userTbl
 where height>180
   for json auto;