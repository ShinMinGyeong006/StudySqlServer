--실제 회원정보 불러오기 레벨순, 이름순
select memberID,membername,levels,mobile,email
 from memberTbl
 where levels <> 'S'
 order by levels asc, membername asc;


--책정보
select cateIDX,bookname,author,interpreter,company,price
 from BooksTbl
 order by price desc;

 select * from cateTbl;

 --시스템 함수사용 쿼리
 select memberID,
		concat(right(membername,2), ', ',  left(membername,1)) as '미국식이름', 
		case levels
			 when 'A' then '골드회원'
			 when 'B' then '실버회원'
			 when 'c' then '브론즈회원'
			 when 'D' then '철회원'
			 when 'S' then '관리자'
			 else '비회원'
		end as '회원레벨',
		mobile,
		upper(email) as '이메일'
 from memberTbl
 where levels <> 'S'
 order by levels asc, membername;

 --사용자 정의 함수사용 쿼리 
 select memberID,
		concat(right(membername,2), ', ',  left(membername,1)) as '미국식이름', 
		dbo.ufn_getLevel(levels)
		as '회원레벨',
		mobile,
		upper(email) as '이메일'
 from memberTbl
 where levels <> 'S'
 order by levels asc, membername;


 --책 정보, 시스템 함수, 포맷 함수 쿼리
 SELECT BookIDX
      , cateIDX
      , concat (N'책 제목 > ',bookname) as bookname
      , author
      , isnull (interpreter, '(역자없음)') as '번역가'
      , company
      , format (releaseDate, 'yyyy년 MM월 dd일') as '출판일'
      , format (price, '#,#0원') as '가격'
   FROM BooksTbl

 --책정보 조인
 SELECT b.BookIDX
      --, b.cateIDX
	  , c.catename
      , b.bookname
      , b.author
      , b.interpreter
      , b.company    
  FROM dbo.BooksTbl as b
 inner join cateTbl as c
		 on b.cateIDX = c.cateIDX;

--대여된 책의 정보 쿼리 조인
SELECT r.rentalIDX
      ,r.memberIDX
      --,r.bookIDX
	  ,b.bookname
	  ,b.author
      ,format(r.rentalDt,'yyyy-MM-dd') as '대여일'
      ,format(r.returenDt,'yyyy-MM-dd') as '반납일'
      ,dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.RentalTbl as r
 inner join BooksTbl as b
	on r.bookIDX = b.BookIDX
 inner join memberTbl as m
	on r.memberIDX = m.memberIDX;




--책을 안 빌린 회원 조회 
SELECT r.rentalIDX
      --,r.memberIDX
      --,r.bookIDX
	  ,m.membername
	  ,b.bookname
	  ,b.author
      ,format(r.rentalDt,'yyyy-MM-dd') as '대여일'
      ,dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.RentalTbl as r
  left outer join BooksTbl as b
	on r.bookIDX = b.BookIDX
 right outer join memberTbl as m
	on r.memberIDX = m.memberIDX
 where r.rentalIDX is null;


 --우리 책 대여점에 없는 소설 장르
 select c.cateIDX
	   ,c.catename
	   ,b.bookname
   from cateTbl as c
   left outer join BooksTbl as b
     on c.cateIDX = b.cateIDX