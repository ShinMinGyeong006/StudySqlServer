
---형 변환함수
select avg(CONVERT(float,amount)) as amount from buyTbl;
select TRY_CONVERT(float,amount) as amount from buyTbl;
select avg(convert(decimal, amount)) as '평균 구매 개수' from buyTbl;


select price,amount, price/amount as [단가/수량] from buyTbl;

-----
'1000'---> 숫자
select parse('2021년 2월 9일'as date);

select parse('123.45' as int); --오류
select try_parse('123.45' as int); --null값
select parse('123.45' as decimal(5,2));

select cast('11' as int);

--스칼라 함수(단일 리턴함수)
select getdate() as '현재날짜';        
select year(GETDATE()) as '금년';      
select month(GETDATE()) as '이번달';  
select day(GETDATE()) as '오늘일';   

select abs(-100);        

select round(3.1415,1);						
select round(1234.5678,-1);

select cast((rand()*100) as int);

select iif(20<10,'참','거짓');

------****문자열함수****----
--<빈도 하>
select ASCII('a'),ASCII('A');
select char(98),char(66);
select unicode('가');
select NCHAR(45909);

--<빈도 상>
--문자열 결합
select CONCAT('SQL  ','Server',2019);
--문자의 시작위치 리턴
select CHARINDEX('server', 'SQL server 2019');
--left, right
select left('SQL server 2019',3),right('SQL server 2019',4);
--substring
select SUBSTRING('Hello World',7,5);
select SUBSTRING('안녕하세요, sql서버입니다!',11,2);
--len
select len('안녕하세요'), len('Hello World');
--lower, upper
select lower('a,b,C,D,e,F,g'), upper('a,b,C,D,e,F,g');
--ltrim, rtrim
select LEN(ltrim('   Hello World    ')),
	   LEN(rtrim('   Hello World    ')),
	    LEN(trim('   Hello World    '));
--REPLACE
select replace('(2016년 발표)SQL Server 2016','2016','2019');
--format(정말 많이 씀)
select format(getdate(), ''); --기본
select format(getdate(), 'dd/mm/yyyy');
select format(getdate(), 'yyyy-MM-dd hh:mm:ss:ms');
select format(getdate(), 'yyyy-MM-dd');
select format(getdate(), 'hh:mm:ss');
select getdate();



