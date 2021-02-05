/*
select memberID,membername 
 from memberTbl
where memberID like 'h%';*/

use [BikeStores];
select * from sales.customers;

select * from production.products;

--스키마 DB조회
exec sp_helpdb;
-- 테이블 조회
exec sp_tables @table_type="'table'";
--열이름 조회
exec sp_columns @table_name='stocks',
				@table_owner='production';