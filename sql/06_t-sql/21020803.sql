use sqlDB;
go

--이름이 김경호인 사람 조회
select  * from userTbl
where username='김경호';

--1970이후 출생, 키가 182 이상인 사람 아이디, 이름만 조회
select userId, userName, height
  from userTbl 
 where birthYear >=1970 
		and height >=182;

--1970이후 출생이거나 키가 182 이상인 사람 아이디, 이름만 조회
select userId, userName, height
  from userTbl 
 where birthYear >=1970 
		or height >=182;

--키가 180~183인 사람조회

select userId, userName, height
  from userTbl 
 where height >=180
      and height <=183;

select userId, userName, height
  from userTbl 
 where height between 180 and 183;

--지역이 경남, 전남, 경북
select userId, userName, addr
  from userTbl 
 where addr='경남'
	   or addr='전남'
	   or addr='경북';

select userId, userName, addr
  from userTbl 
 where addr in ('경남','전남', '경북');

	---like
select userid, username,addr
  from userTbl
 where username like '김%';

select userid, username,addr
  from userTbl
 where username like '_종신';

--SUB

select username, height 
  from userTbl
 where height > 177

---'김경호'보다 키가 큰 사람들
select username, height 
  from userTbl
 where height > 
		( select height from userTbl where username ='김경호');
--하위쿼리에서 any를 쓰면 여러값을 추출할 수 있음
select username, height 
  from userTbl
 where height >= any
		( select height from userTbl where addr ='경남');

select username, height 
  from userTbl
 where height in
		( select height from userTbl where addr ='경남');

---order by 정렬
select username, mdate 
  from userTbl
 order by mDate asc; --asc 오름차순 desc 내림차순
 
select *
  from userTbl
 order by userid desc;

 ---distinct(중복된 데이터 제거)

 select distinct addr
   from userTbl;


select top(5) *
  from userTbl
  order by mdate desc;

--복사

select * into buytbl2 from buyTbl;
select userid, prodname into buytbl3 from buyTbl;


--group by
select userid, amount 
  from buyTbl
  order by userid;

select userid, sum(prodName) as '구매 합계'
  from buyTbl
  group by userid;

--min/max
select userID, username,  min(height) as '작은키', max(height) as '큰 키'
  from userTbl
 group by userid, username;

 select userID, username
   from userTbl
  where height = (select min(height) from userTbl)
     or height = (select max(height) from userTbl);

--총 데이터의 개수
select count(*) as '회원수' from userTbl;
select count(*) as '구매내역수' from buyTbl;


--잘못된 필터링
select userid, sum(price*amount) as '아이디별 구매금액',
  from buyTbl
 --where sum(price*amount)>1000
 group by userid 
having sum(price*amount)>1000
 order by sum(price*amount);

 --roll up /cube
select num,groupname, sum(price*amount) as '비용',
	   grouping_ID (groupname, num)
  from buyTbl
 group by rollup(groupname, num);
  
 --userId, groupname을 가지고 cube 다차원 합계

select userid, groupname, sum(price*amount) as '비용',
	   grouping_ID (groupname)
  from buyTbl
 group by cube(groupname, userID);
----->리포트 할때는 따로 떼서 씀


---without CTE
select userid, sum(price*amount) as 'total'
 from buyTbl
group by userid
order by sum(price*amount) desc;

---with CTE
with cte_tmp (userid, total)
 as 
    (select userid, sum(price*amount) as 'total'
	  from buyTbl
	 group by userid)
select * from cte_tmp order by total desc;
















