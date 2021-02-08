--test TBL insert쿼리
use sqlDB;
go

--DML중에서 SELECT
select*from testTBL1;

--DML중에서 INSERT
insert into testTBL1 values(1, '홍길동', 25);
insert into testTBL1 (id, username) values(2, '신민경'); ---pk키는 반드시 있어야 함

insert into testTBL1 values ('성시경',44);
insert into testTBL1 values ('성시경',44);
insert into testTBL1 values ('성시경',44);
insert into testTBL1 values ('성시경',44);


--현재 테이블의 최신 아이덴티티값
exec sp_help 'testTBL1';

select Ident_current('testTBL1');

select @@IDENTITY;


select * from BikeStores.sales.order_items;

select * from ShopDB.dbo.memberTbl;

--sale.order_items 테이블 복사  테이블-우클릭-테이블 스크립팅-create-새쿼리편집창
CREATE TABLE [sales_order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2) NOT NULL
);

insert into sales_order_items
select * from BikeStores.sales.order_items; 

select * from sales_order_items;

--update
select*from testTBL1;

update testTBL1 
   set username='성수경',
       age = 30 --마지막거는 콤마 없애야함
 where id=6; 

--delete
delete from testTBL1 where id=5;


use BikeStores
select * from sales.customers
where last_name like 'S%'
	and state = 'NY'
	and phone is not null
order by first_name asc;
