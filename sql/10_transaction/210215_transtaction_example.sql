USE [sqlDB]
GO

BEGIN TRY

 BEGIN TRAN;

INSERT INTO [dbo].[userTbl]
           ([userID]
           ,[username]
           ,[birthYear]
           ,[addr]
           ,[mobile1]
           ,[mobile2]
           ,[height]
           ,[mDate])
     VALUES
           ('GJY'
           ,'권지용'
           ,1988
           ,'한양'
           ,'010'
           ,'45447846'
           ,175
           ,GETDATE())

INSERT INTO [dbo].[buyTbl]
           ([userID]
           ,[prodName]
           ,[groupName]
           ,[price]
           ,[amount])
     VALUES
           ('GJY'
           ,'선글라스'
           ,NULL
           ,8000000
           ,1)

  COMMIT
END TRY
BEGIN CATCH
ROLLBACK
END CATCH
GO



