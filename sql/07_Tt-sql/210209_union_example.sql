
--union
select clubname as bname,buildingnumber as blocation from clubTbl
union
select stdname, region from StdTbl;

--union all
select stdname, region from StdTbl
intersect
select stdname, region from StdTbl;