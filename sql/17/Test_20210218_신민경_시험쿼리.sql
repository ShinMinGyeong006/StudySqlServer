--1-1번
use bookrentalshop;
go

select lower(Email) as Email,Mobile,Names,Addr 
  from membertbl
 order by Names desc;
 

--1-2번

use bookrentalshop;
go

select Names,Author,ReleaseDate,Price
  from bookstbl;

--2-1번

use bookrentalshop;
go

select 
   top 10 
		concat(right(names,2), ',' ,left(names,1)) as '변경이름',
		levels,
		left(addr,2) as '도시',
		lower(email) as '이메일'
  from membertbl
 order by Names asc;

 --2-2번

use bookrentalshop;
go

select 
	  idx,
	  concat(N'제목 : ',names) as Names,
	  concat(N'저자 > ',author) as Authour,
	  format(releasedate,'yyyy년 MM월 dd일') as '출판일',
	  ISBN,
	  format(price,'#,#원') as '가격'
  from bookstbl
 order by idx desc;

 --3-1번

use bookrentalshop;
go

select 
	   b.Idx as '번호',
	   b.Division as '장르번호',
	   d.Names as '장르',
	   b.Names as '책제목',
	   b.Author as '저자'
  from bookstbl as b
  inner join divtbl as d
    on b.division = d.division
 where b.Division = 'B002';

 --3-1번 다르게 풀기 1

 select 
	   b.Idx  번호,
	   b.Division  '장르 번호',
	   d.Names  장르,
	   b.Names  책제목,
	   b.Author  저자
  from bookstbl  b   --inner join대신에 콤마로 연결
      ,divtbl  d
 where b.division = d.division --on을 쓸 수 없으므로 where로 교체, where절이 두 개면 안되니까 and 로 연결
   and b.Division = 'B002';



 --3-1번 다르게 풀기2 (서브쿼리 이용)

 select 
	   b.Idx as '번호',
	   b.Division as '장르번호',
	   --d.Names as '장르',
	   (select names from divtbl where Division=b.Division) as 장르,
	   b.Names as '책제목',
	   b.Author as '저자'
  from bookstbl as b
 where b.Division = 'B002';




 --3-2번

use bookrentalshop;
go

select 
	  m.Names,
	  m.Levels,
	  m.Addr,
	  r.rentalDate
 from membertbl as m
 left outer join rentaltbl as r
   on m.Idx=r.memberIdx
where r.rentalDate is null;


 --3-2번 다르게 풀기 



--4-1번 
use bookrentalshop;
go

insert into divtbl
(	
	Division,
	Names
) 
values
(
	'I002',
	'자기개발서'
);

--4-2번
use bookrentalshop;
go


begin tran
select *
 from membertbl

 update membertbl
    set addr = '부산시 해운대구',
		mobile = '010-6883-7732'
  where Names = '성명건'

rollback;
commit tran;

--5번 

use bookrentalshop;
go

select  
	   d.Names,
	   sum(b.Price) as '총합계금액'
  from divtbl as d
  inner join bookstbl as b
    on d.Division=b.Division
 group by rollup (d.Names);

