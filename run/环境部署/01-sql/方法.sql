 --����1��ѭ����ȡ��
  CREATE FUNCTION f_splitSTR(
    @s   varchar(8000),   --���ֲ���ַ���
    @split varchar(10)     --���ݷָ���
  )RETURNS @re TABLE(col varchar(100))
  AS
    BEGIN
      DECLARE @splitlen int
      SET @splitlen=LEN(@split+'a')-2
      WHILE CHARINDEX(@split,@s)>0
        BEGIN
          INSERT @re VALUES(LEFT(@s,CHARINDEX(@split,@s)-1))
          SET @s=STUFF(@s,1,CHARINDEX(@split,@s)+@splitlen,'')
        END
      INSERT @re VALUES(@s)
      RETURN
    END