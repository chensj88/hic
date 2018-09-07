--24h内入出院记录----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--出院医嘱开立日期时间  医嘱开立医师
UPDATE A SET
    A.yzklysbm = CASE WHEN T.cqyzrq > T.lsyzrq THEN T.cqysdm ELSE T.lsysdm END ,
    A.cyyzklrqm = CASE WHEN T.cqyzrq > T.lsyzrq THEN T.cqysmc ELSE T.lsysmc END ,
    A.cyyzklrq = CASE WHEN T.cqyzrq > T.lsyzrq THEN T.cqyzrq ELSE T.lsyzrq END
   FROM CISDB_DATA..HLHT_RYJL_RCYJL A LEFT JOIN (
      SELECT
            (SELECT top 1 CONVERT(datetime,substring(B.LRRQ,1,4)+'-'+substring(B.LRRQ,5,2)+'-'+substring(B.LRRQ,7,2)+' '+substring(B.LRRQ,9,8)) yzrq
            FROM  CISDB..CPOE_CQYZK B WHERE A.jzlsh = B.SYXH  order by yzrq DESC) cqyzrq,
           (SELECT top 1 B.YSDM FROM  CISDB..CPOE_CQYZK B WHERE A.jzlsh = B.SYXH
            order by CONVERT(datetime,substring(B.LRRQ,1,4)+'-'+substring(B.LRRQ,5,2)+'-'+substring(B.LRRQ,7,2)+' '+substring(B.LRRQ,9,8)) DESC) cqysdm,
           (SELECT top 1 B.YSMC FROM  CISDB..CPOE_CQYZK B WHERE A.jzlsh = B.SYXH
            order by CONVERT(datetime,substring(B.LRRQ,1,4)+'-'+substring(B.LRRQ,5,2)+'-'+substring(B.LRRQ,7,2)+' '+substring(B.LRRQ,9,8)) DESC) cqysmc,
           (SELECT top 1 B.YSDM FROM  CISDB..CPOE_LSYZK B WHERE A.jzlsh = B.SYXH
            order by CONVERT(datetime,substring(B.LRRQ,1,4)+'-'+substring(B.LRRQ,5,2)+'-'+substring(B.LRRQ,7,2)+' '+substring(B.LRRQ,9,8)) DESC) lsysdm,
           (SELECT top 1 B.YSMC FROM  CISDB..CPOE_LSYZK B WHERE A.jzlsh = B.SYXH
            order by CONVERT(datetime,substring(B.LRRQ,1,4)+'-'+substring(B.LRRQ,5,2)+'-'+substring(B.LRRQ,7,2)+' '+substring(B.LRRQ,9,8)) DESC) lsysmc,
           (SELECT top 1 CONVERT(datetime,substring(B.LRRQ,1,4)+'-'+substring(B.LRRQ,5,2)+'-'+substring(B.LRRQ,7,2)+' '+substring(B.LRRQ,9,8)) yzrq
            FROM  CISDB..CPOE_LSYZK B WHERE A.jzlsh = B.SYXH  order by yzrq DESC) lsyzrq,A.jzlsh
FROM CISDB_DATA..HLHT_RYJL_RCYJL A) T ON A.jzlsh = T.jzlsh
--接诊医师
UPDATE A SET A.jzysbm = ISNULL(B.YSDM,'NA'),A.jzysqm = ISNULL(B.YSXM,'NA')  FROM CISDB_DATA.dbo.HLHT_RYJL_RCYJL A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (A.jzysbm ='NA' or A.jzysqm = 'NA')
--住院医师
UPDATE A SET A.zyysbm = ISNULL(B.YSDM,'NA'),A.zyysqm = ISNULL(B.YSXM,'NA')  FROM CISDB_DATA.dbo.HLHT_RYJL_RCYJL A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (A.zyysbm ='NA' OR A.zyysqm='NA')
--治则治法
--UPDATE A SET A.zfbm = '无',A.zzzf = '无' FROM CISDB_DATA.dbo.HLHT_RYJL_RCYJL A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (A.zfbm ='NA' OR A.zzzf='NA')
--中医“四诊”观察结果
UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA') FROM CISDB_DATA..HLHT_RYJL_RCYJL A,CISDB_DATA.dbo.HLHT_RYJL_JBXX C WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA';
--陈述内容可靠标志 来源入院记录
UPDATE A SET A.csnrbz=isnull(B.csnrbz,'NA')  FROM CISDB_DATA.dbo.HLHT_RYJL_RCYJL A LEFT JOIN CISDB_DATA.dbo.HLHT_RYJL_JBXX B ON A.jzlsh =B.jzlsh WHERE A.csnrbz ='NA'
--现病史 来源入院记录
UPDATE A SET A.xbs=isnull(B.xbs,'NA')  FROM CISDB_DATA.dbo.HLHT_RYJL_RCYJL A LEFT JOIN CISDB_DATA.dbo.HLHT_RYJL_JBXX B ON A.jzlsh =B.jzlsh WHERE convert(varchar,A.xbs) ='NA'
--陈述者关系
UPDATE A SET A.cszhzgxdm= T.cszhzgxdm,A.cszhzgxmc = T.cszhzgxmc FROM CISDB_DATA..HLHT_RYJL_RCYJL A
  LEFT JOIN (
              SELECT CASE  WHEN A.cszhzgxdm IN ('父子','母子') THEN '2'
                     WHEN A.cszhzgxdm IN ('父女','父女') THEN '3'
                     WHEN A.cszhzgxdm IN ('夫妻') THEN '1'
                     WHEN A.cszhzgxdm IN ('祖父','祖母') THEN '5'
                     WHEN A.cszhzgxdm IN ('外祖父','外祖母') THEN '6'
                     WHEN A.cszhzgxdm IN ('弟兄') THEN '7'
                     else '8' end cszhzgxdm,
                     CASE  WHEN A.cszhzgxdm IN ('父子','母子') THEN '子'
                     WHEN A.cszhzgxdm IN ('父女','父女') THEN '女'
                     WHEN A.cszhzgxdm IN ('夫妻') THEN '配偶'
                     WHEN A.cszhzgxdm IN ('祖父','祖母') THEN '父母'
                     WHEN A.cszhzgxdm IN ('外祖父','外祖母') THEN '祖父母或外祖父母'
                     WHEN A.cszhzgxdm IN ('弟兄') THEN '兄、弟、姐、妹'
                     else '其他' end cszhzgxmc,A.jzlsh
              FROM CISDB_DATA..HLHT_RYJL_RCYJL A) T ON A.jzlsh =T.jzlsh
--陈述内容可靠标志
UPDATE A SET A.csnrbz = 'T'   FROM CISDB_DATA..HLHT_RYJL_RCYJL A
--症状描述
UPDATE A SET A.zzms = a.xbs   FROM CISDB_DATA..HLHT_RYJL_RCYJL A where a.zzms = 'NA'
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--## 24小时内入院死亡记录 ##---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--陈述内容可靠标志
UPDATE A SET A.csnrbz = 'T'   FROM CISDB_DATA..HLHT_RYJL_RYSWJL A
--陈述者关系
UPDATE A SET A.cszhzgxdm= T.cszhzgxdm,A.cszhzgxmc = T.cszhzgxmc FROM CISDB_DATA..HLHT_RYJL_RYSWJL A
  LEFT JOIN (
              SELECT CASE  WHEN A.cszhzgxdm IN ('父子','母子') THEN '2'
                     WHEN A.cszhzgxdm IN ('父女','父女') THEN '3'
                     WHEN A.cszhzgxdm IN ('夫妻') THEN '1'
                     WHEN A.cszhzgxdm IN ('祖父','祖母') THEN '5'
                     WHEN A.cszhzgxdm IN ('外祖父','外祖母') THEN '6'
                     WHEN A.cszhzgxdm IN ('弟兄') THEN '7'
                     else '8' end cszhzgxdm,
                     CASE  WHEN A.cszhzgxdm IN ('父子','母子') THEN '子'
                     WHEN A.cszhzgxdm IN ('父女','父女') THEN '女'
                     WHEN A.cszhzgxdm IN ('夫妻') THEN '配偶'
                     WHEN A.cszhzgxdm IN ('祖父','祖母') THEN '父母'
                     WHEN A.cszhzgxdm IN ('外祖父','外祖母') THEN '祖父母或外祖父母'
                     WHEN A.cszhzgxdm IN ('弟兄') THEN '兄、弟、姐、妹'
                     else '其他' end cszhzgxmc,A.jzlsh
              FROM CISDB_DATA..HLHT_RYJL_RYSWJL A) T ON A.jzlsh =T.jzlsh
--中医“四诊”观察结果
UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA') FROM CISDB_DATA..HLHT_RYJL_RYSWJL A,CISDB_DATA.dbo.HLHT_RYJL_JBXX C WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA'
--接诊医师
UPDATE A SET A.jzysbm = ISNULL(B.YSDM,'NA'),A.jzysqm = ISNULL(B.YSXM,'NA')  FROM CISDB_DATA.dbo.HLHT_RYJL_RYSWJL A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (A.jzysbm ='NA' or A.jzysqm = 'NA')
--住院医师
UPDATE A SET A.zyysbm = ISNULL(B.YSDM,'NA'),A.zyysqm = ISNULL(B.YSXM,'NA')  FROM CISDB_DATA.dbo.HLHT_RYJL_RYSWJL A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (A.zyysbm ='NA' OR A.zyysqm='NA')
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--术前小结
  --从病人诊断中获取诊断依据编码和诊断依据
  UPDATE A SET A.zdyj = C.ZDMC,A.zdyjdm = C.ZDDM
  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQXJ A LEFT JOIN CISDB.dbo.EMR_BRSYK B ON A.jzlsh =B.HISSYXH
    LEFT JOIN CISDB.dbo.EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 1
  WHERE  ( CONVERT(varchar,A.zdyj) ='NA' OR CONVERT(varchar,A.zdyjdm) ='NA' )
  --从入院信息获取过敏史数据处理
  UPDATE A SET A.gmsbz ='F' FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQXJ A left join CISDB_DATA.dbo.HLHT_RYJL_JBXX B  on  A.jzlsh =B.jzlsh where A.gmsbz='NA' and (B.gms is null OR CHARINDEX('否认',convert(varchar,B.gms)) > 0)
  UPDATE A SET A.gmsbz ='T' FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQXJ A left join CISDB_DATA.dbo.HLHT_RYJL_JBXX B  ON  A.jzlsh =B.jzlsh where A.gmsbz='NA' and B.gms is not null and CHARINDEX('否认',convert(varchar,B.gms)) = 0
  UPDATE A SET A.gms =B.gms FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQXJ A left join CISDB_DATA.dbo.HLHT_RYJL_JBXX B  ON A.jzlsh =B.jzlsh where CONVERT(VARCHAR,A.gms) ='NA'
  --取手术小结手术指征赋值给手术适应症
  UPDATE A SET A.sssyz = CASE WHEN sszz = 'NA' THEN 'NA' else sszz END  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQXJ A
  --会诊意见 存在则取会诊意见，反之为无
  UPDATE A SET A.hzyj = CASE WHEN CONVERT(VARCHAR,B.hzyj) = 'NA' THEN 'NA'  WHEN B.hzyj IS NULL THEN 'NA'  else B.hzyj END
  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQXJ A LEFT JOIN  CISDB_DATA.dbo.HLHT_ZYBCJL_HZJL B ON A.jzlsh =B.jzlsh WHERE CONVERT(VARCHAR,A.hzyj)='NA'
  --手术者
  UPDATE A SET A.sszbm = CASE WHEN C.id IS NULL THEN 'NA' ELSE C.id END,A.sszqm = CASE WHEN C.name IS NULL THEN 'NA' ELSE C.name END
  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQXJ A left join THIS4.dbo.SS_SSDJK B ON A.jzlsh = B.syxh
    LEFT JOIN THIS4.dbo.czryk C ON B.ysdm =C.id WHERE (A.sszbm = 'NA' OR A.sszqm ='NA')

--术前讨论
  --手术者
  UPDATE A SET A.sszbm = CASE WHEN C.id IS NULL THEN 'NA' ELSE C.id END,A.sszqm = CASE WHEN C.name IS NULL THEN 'NA' ELSE C.name END
  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A left join THIS4.dbo.SS_SSDJK B ON A.jzlsh = B.syxh
    LEFT JOIN THIS4.dbo.czryk C ON B.ysdm =C.id WHERE (A.sszbm = 'NA' OR A.sszqm ='NA')
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
  UPDATE D SET D.zyzwlbdm = isnull(F.dm,'NA') ,D.zyzwlbmc = isnull(F.mc,'NA')   FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL D LEFT JOIN (
     SELECT  stuff((select ',' + A.ZCDM from CISDB.dbo.SYS_ZGDMK A where A.ID in (select * from CISDB_DATA.dbo.f_splitSTR(C.tlrybm,',')) for xml path('')),1,1,'') as dm,
             stuff((select ',' + B.ZCMC from CISDB.dbo.SYS_ZGDMK B where B.ID in (select * from CISDB_DATA.dbo.f_splitSTR(C.tlrybm,',')) for xml path('')),1,1,'')  as mc,
       C.yjlxh
     from CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL C ) F ON D.yjlxh = F.yjlxh where (D.zyzwlbdm = 'NA' OR D.zyzwlbmc='NA')
  --拟实施麻醉方法
  UPDATE A SET A.mzffdm = ISNULL(B.MZDM,'NA') ,A.mzffmc = ISNULL(B.MZMC,'NA') FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A  LEFT JOIN CISDB.dbo.CPOE_SSYZK B ON A.jzlsh = B.SYXH
   WHERE (A.mzffdm = 'NA' OR A.mzffmc='NA')
  --术前诊断
  UPDATE A SET A.sqzdbm = C.ZDMC,A.sqzdmc = C.ZDDM
  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A LEFT JOIN CISDB.dbo.EMR_BRSYK B ON A.jzlsh =B.HISSYXH
    LEFT JOIN CISDB.dbo.EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 1
  WHERE  ( CONVERT(varchar,A.sqzdbm) ='NA' OR CONVERT(varchar,A.sqzdmc) ='NA' )
  --拟实施手术及操作名称
  UPDATE A SET A.ssczmc = ISNULL(B.ssmc,'NA') FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A LEFT JOIN CISDB_DATA.dbo.HLHT_ZLCZJL_YBSSJL B ON A.jzlsh = B.jzlsh WHERE A.ssczmc = 'NA'
  --拟实施手术及操作编码
  UPDATE A SET A.ssczbm = ISNULL(B.ssjczbm,'NA') FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A LEFT JOIN CISDB_DATA.dbo.HLHT_ZLCZJL_YBSSJL B ON A.jzlsh = B.jzlsh WHERE A.ssczbm = 'NA'
  --拟实施手术目标部位代码
  UPDATE A SET A.ssmbbwdm = ISNULL(B.ssmbbwdm,'NA') FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A LEFT JOIN CISDB_DATA.dbo.HLHT_ZLCZJL_YBSSJL B ON A.jzlsh = B.jzlsh WHERE A.ssmbbwdm = 'NA'
  --拟实施手术目标部位名称
  UPDATE A SET A.ssbwmc = ISNULL(B.ssmbbw,'NA') FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A LEFT JOIN CISDB_DATA.dbo.HLHT_ZLCZJL_YBSSJL B ON A.jzlsh = B.jzlsh WHERE A.ssbwmc = 'NA'
  --拟实施手术及操作日期时间
  UPDATE A SET A.ssczrq = ISNULL(B.ssksrq,CONVERT(DATE,'1990-01-01 00:00:00',120)) FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A LEFT JOIN CISDB_DATA.dbo.HLHT_ZLCZJL_YBSSJL B ON A.jzlsh = B.jzlsh WHERE A.ssczrq = '1990-01-01 00:00:00'
  --手术要点
  --UPDATE A SET A.ssyd = 'NA' FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A WHERE A.ssyd = 'NA'
  --术前准备
  --UPDATE A SET A.sqzb = 'NA' FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A WHERE A.sqzb = 'NA'
  --手术方案
  UPDATE A SET A.ssfa = ISNULL(B.ssmc,'NA') FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A LEFT JOIN CISDB_DATA.dbo.HLHT_ZLCZJL_YBSSJL B ON A.jzlsh = B.jzlsh WHERE CONVERT(varchar,A.ssfa) = 'NA'
  --注意事项
  --UPDATE A SET A.zysx = 'NA' FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A  WHERE A.zysx = 'NA'
  --讨论意见
  UPDATE A SET A.tlyj = ISNULL(A.tljl,'NA') FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A WHERE A.tlyj = 'NA'
  --麻醉医师工号 麻醉医师签名
  UPDATE A SET A.mzsqm=CASE WHEN B.MZZDMC = '' THEN 'NA' ELSE ISNULL(B.MZZDMC,'NA') END,A.mzysbm=CASE WHEN B.MZZDYS = '' THEN 'NA' ELSE ISNULL(B.MZZDYS,'NA') END
  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (A.mzsqm = 'NA' OR A.mzysbm='NA')


-- 死亡病例讨论记录
  --专业技术职务类别代码/名称
  UPDATE D SET D.zyzwlbdm = CASE WHEN F.dm = '' THEN 'NA' ELSE ISNULL(F.dm,'NA') END ,D.zyzwlbmc = CASE WHEN F.mc = '' THEN 'NA' ELSE  ISNULL(F.mc,'NA') END  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SWBLTLJL D LEFT JOIN (
    SELECT  stuff((select ',' + A.ZCDM from CISDB.dbo.SYS_ZGDMK A where A.ID in (select * from CISDB_DATA.dbo.f_splitSTR(C.tlrybm,',')) for xml path('')),1,1,'') as dm,
    stuff((select ',' + B.ZCMC from CISDB.dbo.SYS_ZGDMK B where B.ID in (select * from CISDB_DATA.dbo.f_splitSTR(C.tlrybm,',')) for xml path('')),1,1,'')  as mc,
    C.yjlxh    from CISDB_DATA.dbo.HLHT_ZYBCJL_SWBLTLJL C ) F ON D.yjlxh = F.yjlxh where (D.zyzwlbdm = 'NA' OR D.zyzwlbmc='NA')

  --主治医师
  UPDATE A SET A.zzysbm = CASE WHEN B.ZZYSDM = '' THEN 'NA' ELSE ISNULL(B.ZZYSDM,'NA') end ,A.zzysqm = CASE WHEN B.ZZYSXM = '' THEN 'NA' ELSE ISNULL(B.ZZYSXM,'NA') end FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SWBLTLJL A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (A.zzysbm ='NA' OR A.zzysqm = 'NA')
  --主任医师
  UPDATE A SET A.zrysbm = ISNULL(B.ZRYSDM,'NA'),A.zrysqm = ISNULL(B.ZRYSXM,'NA')  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SWBLTLJL A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (A.zrysbm ='NA' OR A.zrysqm = 'NA')
  --讨论地点编码
  UPDATE A SET A.tldddm ='1'  FROM  CISDB_DATA.dbo.HLHT_ZYBCJL_SWBLTLJL A WHERE CHARINDEX('科',A.tldd) > 0
  UPDATE A SET A.tldddm ='2'  FROM  CISDB_DATA.dbo.HLHT_ZYBCJL_SWBLTLJL A WHERE CHARINDEX('病房',A.tldd) > 0
  UPDATE A SET A.tldddm ='9'  FROM  CISDB_DATA.dbo.HLHT_ZYBCJL_SWBLTLJL A WHERE CHARINDEX('病房',A.tldd) = 0 AND CHARINDEX('科',A.tldd) = 0
--住院病程记录/上级医师查房记录 医嘱内容 中医“四诊”观察结果  辨证论治详细描述  中药煎煮方法  中药用药方法
  --医嘱内容
  UPDATE A SET A.yznr = ISNULL((SELECT LEFT(t.YPMC,LEN(t.YPMC)-1) as YPMC  FROM (SELECT (SELECT YPMC+',' FROM CISDB..CPOE_LSYZK B WHERE B.SYXH=A.jzlsh FOR XML PATH('') ) AS YPMC ) t),'NA')
  FROM CISDB_DATA..HLHT_ZYBCJL_SJYSCFJL A WHERE CONVERT(varchar,A.yznr) ='NA'
  --中医四诊
  UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA') FROM CISDB_DATA..HLHT_ZYBCJL_SJYSCFJL A,CISDB_DATA..HLHT_RYJL_JBXX C WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA'
-- 手术同意书/HLHT_ZQGZXX_SSTYS
  -- 联系电话
    --UPDATE A SET A.lxdh='无' FROM CISDB_DATA.dbo.HLHT_ZQGZXX_SSTYS A WHERE A.lxdh='NA'
  -- 手术禁忌症
    --UPDATE A SET A.ssjjz='无' FROM CISDB_DATA.dbo.HLHT_ZQGZXX_SSTYS A WHERE A.ssjjz='NA'
  --手术方式
    UPDATE A SET A.ssfs = ISNULL(B.ssmc,'NA')  FROM CISDB_DATA.dbo.HLHT_ZQGZXX_SSTYS A LEFT JOIN CISDB_DATA.dbo.HLHT_ZLCZJL_YBSSJL B ON A.jzlsh =B.jzlsh WHERE A.ssfs ='NA'
  --拟实施麻醉方法代码  拟实施麻醉方法名称
    UPDATE A SET A.nmzdm = ISNULL(B.MZDM,'NA') ,A.nmzffmc = ISNULL(B.MZMC,'NA') FROM CISDB_DATA.dbo.HLHT_ZQGZXX_SSTYS A  LEFT JOIN CISDB.dbo.CPOE_SSYZK B ON A.jzlsh = B.SYXH WHERE (A.nmzdm = 'NA' OR A.nmzffmc='NA')
  --经治医师
    UPDATE A SET A.jzysdm = ISNULL(B.YSDM,'NA'),A.jzysqm = ISNULL(B.YSXM,'NA')  FROM CISDB_DATA.dbo.HLHT_ZQGZXX_SSTYS A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (A.jzysdm ='NA' or A.jzysqm = 'NA')
  --责任医生
   UPDATE A SET A.zrysdm = ISNULL(B.YSDM,'NA'),A.zrysxm = ISNULL(B.YSXM,'NA')  FROM CISDB_DATA.dbo.HLHT_ZQGZXX_SSTYS A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (A.zrysdm ='NA' or A.zrysxm = 'NA')
    UPDATE A SET A.hzqm = ISNULL(A.hzxm,'NA')   FROM CISDB_DATA.dbo.HLHT_ZQGZXX_SSTYS A  WHERE (A.hzqm ='NA')

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--
  --地址-村（街、路、弄等）
  --UPDATE A SET A.dzc='无'  FROM CISDB_DATA.dbo.HLHT_RYJL_RYSWJL A WHERE A.dzc ='NA'
  --地址-门牌号码
  --UPDATE A SET A.dzmphm='无'  FROM CISDB_DATA.dbo.HLHT_RYJL_RYSWJL A WHERE A.dzmphm ='NA'


--术后首次病程记录
  /*
  --户口所在地	hkszd
  UPDATE A SET A.hkszd='无'  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SHSCBCJL A WHERE A.hkszd ='NA'
  --出生地址	csdz
  UPDATE A SET A.csdz='无'  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SHSCBCJL A WHERE A.csdz ='NA'
  --工作单位名称	gzdw
  UPDATE A SET A.gzdw='无'  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SHSCBCJL A WHERE A.gzdw ='NA'
  --工作地点	gzdwdz
  UPDATE A SET A.gzdwdz='无'  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SHSCBCJL A WHERE A.gzdwdz ='NA'
  --工作单位电话	gzdwdh
  UPDATE A SET A.gzdwdh='无'  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SHSCBCJL A WHERE A.gzdwdh ='NA'
  --籍贯地	jgd
  UPDATE A SET A.jgd='无'  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SHSCBCJL A WHERE A.jgd ='NA'*/
  --接诊开始日期
  UPDATE A SET A.jzkssj =
  CASE WHEN B.RYRQ IS NULL THEN CONVERT(DATE,'1990-01-01 00:00:00') ELSE
    CONVERT(datetime,substring(B.RYRQ,1,4)+'-'+substring(B.RYRQ,5,2)+'-'+substring(B.RYRQ,7,2)+' '+substring(B.RYRQ,9,2)+':'+substring(B.RYRQ,12,2)+':'+substring(B.RYRQ,15,2)) END  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SHSCBCJL A LEFT JOIN  CISDB.dbo.CPOE_BRSYK B ON A.jzlsh = B.SYXH WHERE A.jzkssj = CONVERT(DATE,'1990-01-01 00:00:00')
  --接诊结束日期
  UPDATE A SET A.jzjssj =
  CASE WHEN B.CYRQ IS NULL THEN  CONVERT(DATE,'1990-01-01 00:00:00') ELSE
    CONVERT(datetime,substring(B.CYRQ,1,4)+'-'+substring(B.CYRQ,5,2)+'-'+substring(B.CYRQ,7,2)+' '+substring(B.CYRQ,9,2)+':'+substring(B.CYRQ,12,2)+':'+substring(B.CYRQ,15,2)) END  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SHSCBCJL A LEFT JOIN  CISDB.dbo.CPOE_BRSYK B ON A.jzlsh = B.SYXH WHERE A.jzjssj = CONVERT(DATE,'1990-01-01 00:00:00')

--特殊检查及特殊治疗同意书
    --疾病诊断
  UPDATE A SET A.jbzd = C.ZDMC,A.jbzdbm = C.ZDDM
  FROM CISDB_DATA.dbo.HLHT_ZQGZXX_TSJCZLTYS A LEFT JOIN CISDB.dbo.EMR_BRSYK B ON A.jzlsh =B.HISSYXH
    LEFT JOIN CISDB.dbo.EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 1
  WHERE  ( CONVERT(varchar,A.jbzd) ='NA' OR CONVERT(varchar,A.jbzdbm) ='NA' )
  --医生信息
  UPDATE A SET A.ysbm = ISNULL(B.YSDM,'NA'),A.ysqm = ISNULL(B.YSXM,'NA')
  FROM CISDB_DATA.dbo.HLHT_ZQGZXX_TSJCZLTYS A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (A.ysbm ='NA' or A.ysqm = 'NA')

--急诊留观
  /*
  --中医“四诊”观察结果
  UPDATE A SET A.zyszgcjg='无' FROM CISDB_DATA.dbo.HLHT_MJZBL_JZLGBL A WHERE CONVERT(varchar,A.zyszgcjg)='N'
  --治则治法
  UPDATE A SET A.zfbm='无' FROM CISDB_DATA.dbo.HLHT_MJZBL_JZLGBL A WHERE A.zfbm='N'
  UPDATE A SET A.zzzf='无' FROM CISDB_DATA.dbo.HLHT_MJZBL_JZLGBL A WHERE A.zzzf='N'
  --中医病名
  UPDATE A SET A.zybmdm='无',A.zybmmc='无' FROM CISDB_DATA.dbo.HLHT_MJZBL_JZLGBL A WHERE (A.zybmdm='N' or A.zybmmc='N')
  --中医症候
  UPDATE A SET A.zyzhdm='无',A.zyzhmc='无' FROM CISDB_DATA.dbo.HLHT_MJZBL_JZLGBL A WHERE (A.zyzhdm='N' or A.zyzhmc='N' )
  --辨证依据
  UPDATE A SET A.bzyj='无' FROM CISDB_DATA.dbo.HLHT_MJZBL_JZLGBL A WHERE (A.bzyj='N')*/

  --医嘱项目类型
  UPDATE A SET A.yzxmlx = '01' ,A.yzxmlxmc='药品类医嘱'  FROM  CISDB_DATA.dbo.HLHT_MJZBL_JZLGBL A WHERE A.yzxmlx = 'NA' OR A.yzxmlxmc = 'NA'
  --医嘱项目内容
  UPDATE A SET A.yzxmnr = T.yzxmnr FROM CISDB_DATA.dbo.HLHT_MJZBL_JZLGBL A LEFT JOIN (SELECT
       STUFF((SELECT ','+C.YPMC  FROM  CISDB.dbo.OUTP_ORDERITEM C WHERE C.CFXH IN (SELECT B.XH  FROM CISDB.dbo.OUTP_ORDER B WHERE  A.jzlsh = B.GHXH) FOR xml path('')),1,1,'') yzxmnr,A.yjlxh
     FROM  CISDB_DATA.dbo.HLHT_MJZBL_JZLGBL A ) T  ON A.yjlxh = T.yjlxh WHERE A.yzxmnr = 'NA'
  --医嘱备注信息
  UPDATE A SET A.yzbzxx = isnull(T.yzbzxx,'NA') FROM CISDB_DATA.dbo.HLHT_MJZBL_JZLGBL A LEFT JOIN (SELECT
    STUFF((SELECT ''+ B.MEMO  FROM CISDB.dbo.OUTP_ORDER B WHERE  A.jzlsh = B.GHXH FOR xml path('')),1,1,'') yzbzxx,A.yjlxh
    FROM  CISDB_DATA.dbo.HLHT_MJZBL_JZLGBL A) T  ON A.yjlxh = T.yjlxh WHERE A.yzbzxx = 'NA'
  --医嘱开立科室
  UPDATE A SET A.yzklksdm = isnull((SELECT top 1 B.KSDM  FROM    CISDB.dbo.OUTP_ORDER B WHERE A.jzlsh = B.GHXH),'NA'),
    A.yzklks = isnull((SELECT top 1 B.KSMC  FROM    CISDB.dbo.OUTP_ORDER B WHERE A.jzlsh = B.GHXH),'NA')
  FROM CISDB_DATA.dbo.HLHT_MJZBL_JZLGBL A WHERE (A.yzklksdm = 'NA' or A.yzklks = 'NA')
 --医嘱开立者
  UPDATE A SET A.yzklzdm = isnull((SELECT TOP 1 B.YSDM  FROM    CISDB.dbo.OUTP_ORDER B WHERE A.jzlsh = B.GHXH),'NA'),
    A.yzklzqm = isnull((SELECT top 1 B.YSMC FROM    CISDB.dbo.OUTP_ORDER B WHERE A.jzlsh = B.GHXH),'NA')
  FROM CISDB_DATA.dbo.HLHT_MJZBL_JZLGBL A WHERE (A.yzklzdm = 'NA' or A.yzklzqm = 'NA')
 --医嘱开立日期时间
  UPDATE B SET B.yzklrq =  (
    SELECT  TOP 1 CONVERT(datetime,substring(A.LRRQ,1,4)+'-'+substring(A.LRRQ,5,2)+'-'+substring(A.LRRQ,7,2)+' '+substring(A.LRRQ,9,8) ) FROM CISDB.dbo.OUTP_ORDER A WHERE A.GHXH=B.jzlsh
  )
  FROM CISDB_DATA.dbo.HLHT_MJZBL_JZLGBL B WHERE (B.yzklrq = '1990-01-01 00:00:00' )
 --专业技术职务类别
  UPDATE A SET A.zyjszwlb = ISNULL(B.ZCDM,'NA'),A.zyjszwlbmc = ISNULL(B.ZCMC,'NA') FROM CISDB_DATA.dbo.HLHT_MJZBL_JZLGBL A LEFT JOIN CISDB.dbo.SYS_ZGDMK B ON B.ID = A.ysbm WHERE (A.zyjszwlb = 'NA' OR A.zyjszwlbmc ='NA')


