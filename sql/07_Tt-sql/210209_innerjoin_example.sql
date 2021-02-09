/*select * from stdtbl;
select * from clubtbl;
select * from clublegtbl;*/

--표준 SQL(inner join-내부조인)
select S.id, S.stdname, C.clubname, C.buildingnumber
  from ClublegTbl as r
 inner join stdtbl as S
    on S.id = r.std_id
 inner join clubtbl as C
	on r.club_id = c.id;

--inner join 약식 (SQL Server T-SQL)
select S.id, S.stdname, C.clubname, C.buildingnumber
  from ClublegTbl as r,stdtbl as S,clubtbl as C
 where S.id = r.std_id
   and r.club_id = c.id;

--outer join(외부조인)
select S.id, S.stdname, C.clubname, C.buildingnumber
  from ClublegTbl as r
  left outer join stdtbl as S
    on S.id = r.std_id
  left outer join clubtbl as C
	on r.club_id = c.id;

--usertbl/buytbl
select u.username,u.addr,b.prodName,b.price
  from userTbl as u
  left outer join buyTbl as b
    on u.userID = b.userID; 
 
