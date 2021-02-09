select * from userTbl;
select * from buyTbl;

select * from userTbl where userid='Jyp';
select * from buyTbl where userid='Jyp';

select * from buyTbl where userid='bbk';


--inner join
select u.username,u.addr,
	   concat(u.mobile1,'-', left(u.mobile2,4),'-',right(u.mobile2,4)) as mobile,
	   b.prodName,b.price,b.amount
  from buyTbl as b
 inner join userTbl as u
	on b.userID = u.userID
 where b.userID = 'jyp';
