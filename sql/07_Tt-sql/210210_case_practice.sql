use sqlDB;
go

select u.userID, 
       u.username,
       iif (sum(price*amount)is null, 0, sum(price*amount))  as '총 구매금액',
	   case
		when (sum(price*amount) >= 1500) then 'VVIP'
		when (sum(price*amount) >= 1000) then 'VIP'
		when (sum(price*amount) >= 1) then 'Person'
		else 'Ghost'
	   end as '고객레벨'
  from buyTbl as b
  right outer join userTbl as u
	on b.userID = u.userID
 group by u.userID, u.username
 order by sum(price*amount) desc;


select *
  from userTbl;
