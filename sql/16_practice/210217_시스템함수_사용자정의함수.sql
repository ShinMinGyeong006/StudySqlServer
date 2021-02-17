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
      , bookname
      , author
      , interpreter
      , company
      , releaseDate
      , ISBN
      , price
      , descriptions
      , legdate
  FROM BooksTbl


