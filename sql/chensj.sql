--术前小结
  --从病人诊断中获取诊断依据编码和诊断依据
  UPDATE A SET A.zdyj = C.ZDMC,A.zdyjdm = C.ZDDM
  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQXJ A LEFT JOIN CISDB.dbo.EMR_BRSYK B ON A.jzlsh =B.HISSYXH
    LEFT JOIN CISDB.dbo.EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 1
  WHERE  ( CONVERT(varchar,A.zdyj) ='N' OR CONVERT(varchar,A.zdyjdm) ='N' );
  --从入院信息获取过敏史数据处理
  UPDATE A SET A.gmsbz ='F' FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQXJ A left join CISDB_DATA.dbo.HLHT_RYJL_JBXX B  on  A.jzlsh =B.jzlsh where A.gmsbz='N' and (B.gms is null OR CHARINDEX('否认',convert(varchar,B.gms)) > 0);
  UPDATE A SET A.gmsbz ='T' FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQXJ A left join CISDB_DATA.dbo.HLHT_RYJL_JBXX B  ON  A.jzlsh =B.jzlsh where A.gmsbz='N' and B.gms is not null and CHARINDEX('否认',convert(varchar,B.gms)) = 0;
  UPDATE A SET A.gms =B.gms FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQXJ A left join CISDB_DATA.dbo.HLHT_RYJL_JBXX B  ON A.jzlsh =B.jzlsh where CONVERT(VARCHAR,A.gms) ='N';
  --取手术小结手术指征赋值给手术适应症
  UPDATE A SET A.sssyz = CASE WHEN sszz = 'N' THEN '无' else sszz END  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQXJ A;
  --会诊意见 存在则取会诊意见，反之为无
  UPDATE A SET A.hzyj = CASE WHEN CONVERT(VARCHAR,B.hzyj) = 'N' THEN '无'  WHEN B.hzyj IS NULL THEN '无'  else B.hzyj END
  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQXJ A LEFT JOIN  CISDB_DATA.dbo.HLHT_ZYBCJL_HZJL B ON A.jzlsh =B.jzlsh WHERE CONVERT(VARCHAR,A.hzyj)='N';
  --手术者
  UPDATE A SET A.sszbm = CASE WHEN C.id IS NULL THEN '无' ELSE C.id END,A.sszqm = CASE WHEN C.name IS NULL THEN '无' ELSE C.name END
  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQXJ A left join THIS4.dbo.SS_SSDJK B ON A.jzlsh = B.syxh
    LEFT JOIN THIS4.dbo.czryk C ON B.ysdm =C.id WHERE (A.sszbm = 'N' OR A.sszqm ='N');

--术前讨论
  --手术者
  UPDATE A SET A.sszbm = CASE WHEN C.id IS NULL THEN '无' ELSE C.id END,A.sszqm = CASE WHEN C.name IS NULL THEN '无' ELSE C.name END
  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A left join THIS4.dbo.SS_SSDJK B ON A.jzlsh = B.syxh
    LEFT JOIN THIS4.dbo.czryk C ON B.ysdm =C.id WHERE (A.sszbm = 'N' OR A.sszqm ='N');
  --职称数据处理
  if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[f_splitSTR]') and xtype in (N'FN', N'IF', N'TF'))
    drop function [dbo].[f_splitSTR]
  GO
  --方法1：循环截取法
  CREATE FUNCTION f_splitSTR(
    @s   varchar(8000),   --待分拆的字符串
    @split varchar(10)     --数据分隔符
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

  --专业技术职务类别代码/名称
  UPDATE D SET D.zyzwlbdm = isnull(F.dm,'无') ,D.zyzwlbmc = isnull(F.mc,'无')   FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL D LEFT JOIN (
     SELECT  stuff((select ',' + A.ZCDM from CISDB.dbo.SYS_ZGDMK A where A.ID in (select * from CISDB_DATA.dbo.f_splitSTR(C.tlrybm,',')) for xml path('')),1,1,'') as dm,
             stuff((select ',' + B.ZCMC from CISDB.dbo.SYS_ZGDMK B where B.ID in (select * from CISDB_DATA.dbo.f_splitSTR(C.tlrybm,',')) for xml path('')),1,1,'')  as mc,
       C.yjlxh
     from CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL C ) F ON D.yjlxh = F.yjlxh where (D.zyzwlbdm = 'N' OR D.zyzwlbmc='N')

