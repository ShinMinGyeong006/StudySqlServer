create or alter view uv_nonrentalmember 
as 
select r.rentalIDX
		   --,r.memberIDX
		   ,m.membername
           --,r.bookIDX
		   ,b.bookname
		   ,b.author
		   --,b.cateIDX
		   ,catename
           ,format(r.rentalDt,'yyyy-MM-dd') as rentalDt
           ,format(r.returenDt,'yyyy-MM-dd') as returnDt
           ,dbo.ufn_getState(r.rentalState) as '대여상태'
	from RentalTbl as r
   right outer join memberTbl as m
	  on r.memberIDX = m.memberIDX
    left outer join BooksTbl as b
	  on r.bookIDX = b.BookIDX
    left outer join cateTbl as c
	  on c.cateIDX = b.cateIDX
   where r.rentalIDX is null;
 go

 select * from uv_nonrentalmember as n
  where n.membername like '최%'
  order by membername;

--데이터 입력
insert into BooksTbl
(		cateidx,
		bookname,
		author,
		company,
		releasedate,
		ISBN,
		price
)
values
(
		'N0002',
		'순수하지 않은 감각',
		'요안나',
		'로코코',
		'2019.10.02',
		'9791135445705',
		 11250

);

--책 테이블 위 책 정보중 설명, 등록일자 수정
begin tran; 

select *
  from BooksTbl;

update BooksTbl  ----update에는 반드시 where 절을 확인해야 한다
   set descriptions = '부명그룹의 브레인이자 핵심 TF팀 리더, 강태욱 수석.'
      ,legdate = '2021-02-18'
 where BookIDX =14
		
rollback;
commit;

--카테고리 입력
begin tran;

insert into cateTbl /*(cateidx, catename)-값들을 다 넣을때는 생략해도 됨*/ values('I0001', '대화/협상'),
																				 ('I0002', '성공/처세'),
																			     ('I0003', '시간관리');

select * from cateTbl;
rollback;
commit;

delete from cateTbl where cateIDX = 'I0003';

delete from cateTbl where cateIDX in ('I0001','I0002');






