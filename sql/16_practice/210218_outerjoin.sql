--outer join 쿼리

     select r.rentalIDX
		   --,r.memberIDX
		   ,m.membername
           --,r.bookIDX
		   ,b.bookname
		   ,b.author
		   --,b.cateIDX
		   ,catename
           ,format(r.rentalDt,'yyyy-MM-dd') as rentalDt
           ,format(r.returenDt,'yyyy-MM-dd') as returnDt
           ,dbo.ufn_getState(r.rentalState) as '대여상태'
	from RentalTbl as r
   right outer join memberTbl as m
	  on r.memberIDX = m.memberIDX
    left outer join BooksTbl as b
	  on r.bookIDX = b.BookIDX
    left outer join cateTbl as c
	  on c.cateIDX = b.cateIDX
   where r.rentalIDX is null; 
