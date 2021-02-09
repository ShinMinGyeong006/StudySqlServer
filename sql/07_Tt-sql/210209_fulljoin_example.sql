select * 
  from StdTbl as S
  left outer join ClublegTbl as r
	on S.id=r.std_id
  full outer join clubTbl as c
    on r.club_id = c.id;

--쪼개면?
select * 
  from StdTbl as S
  left outer join ClublegTbl as r
	on S.id=r.std_id;

select * 
  from ClublegTbl as r
  right outer join clubTbl as c
    on r.club_id = c.id;
