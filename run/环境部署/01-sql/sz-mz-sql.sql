create PROCEDURE "dbo"."usp_his5_hlht_tsdata_mz" 
as  
--门急诊病历记录
--过敏史
UPDATE CIS_HLHT..HLHT_MJZBL_MJZBL SET gmsbz ='F';
UPDATE CIS_HLHT..HLHT_MJZBL_MJZBL SET gmsbz ='T' WHERE CONVERT(varchar,gms) ='有';
--医嘱项目类型代码、名称
UPDATE CIS_HLHT..HLHT_MJZBL_MJZBL SET yzxmlx ='01',yzxmlxmc ='药品类医嘱' WHERE CONVERT(varchar,yzxmlx) ='NA';
--医嘱备注信息
UPDATE A SET A.yzbzxx =
CASE WHEN C.MEMO IS NULL THEN 'NA' WHEN C.MEMO ='' THEN 'NA' ELSE C.MEMO END
FROM CIS_HLHT..HLHT_MJZBL_MJZBL A,CISDB_SZ.dbo.OUTP_ORDER C WHERE A.jzlsh=C.GHXH and A.yzbzxx ='NA';
--医嘱开立科室代码、名称
UPDATE A SET A.yzklksdm =C.KSDM,A.yzklks=C.KSMC
FROM CIS_HLHT..HLHT_MJZBL_MJZBL A,CISDB_SZ.dbo.OUTP_ORDER C 
WHERE A.jzlsh=C.GHXH and A.yzklksdm ='NA' OR A.yzklks ='NA';

--医嘱开立者工号、姓名
UPDATE A SET A.yzklzdm =C.YSDM,A.yzklzqm=C.YSMC
FROM CIS_HLHT..HLHT_MJZBL_MJZBL A,CISDB_SZ.dbo.OUTP_ORDER C 
WHERE A.jzlsh=C.GHXH and A.yzklzdm ='NA' OR A.yzklzqm ='NA';

--医嘱开立日期时间
UPDATE A SET A.yzklrq = CONVERT(datetime,substring(C.LRRQ,1,4)+'-'+substring(C.LRRQ,5,2)+'-'+substring(C.LRRQ,7,2)+' '+substring(C.LRRQ,9,8))
FROM CIS_HLHT..HLHT_MJZBL_MJZBL A,CISDB_SZ.dbo.OUTP_ORDER C 
WHERE A.jzlsh=C.GHXH ;

--门诊留观
 --医嘱项目类型
  UPDATE A SET A.yzxmlx = '01' ,A.yzxmlxmc='药品类医嘱'  FROM  CIS_HLHT.dbo.HLHT_MJZBL_JZLGBL A WHERE A.yzxmlx = 'NA' OR A.yzxmlxmc = 'NA'
  --医嘱项目内容
  UPDATE A SET A.yzxmnr = T.yzxmnr FROM CIS_HLHT.dbo.HLHT_MJZBL_JZLGBL A LEFT JOIN (SELECT
       STUFF((SELECT ','+C.YPMC  FROM  CISDB_SZ.dbo.OUTP_ORDERITEM C WHERE C.CFXH IN (SELECT B.XH  FROM CISDB_SZ.dbo.OUTP_ORDER B WHERE  A.jzlsh = B.GHXH) FOR xml path('')),1,1,'') yzxmnr,A.yjlxh
     FROM  CIS_HLHT.dbo.HLHT_MJZBL_JZLGBL A ) T  ON A.yjlxh = T.yjlxh WHERE A.yzxmnr = 'NA'
  --医嘱备注信息
  UPDATE A SET A.yzbzxx = isnull(T.yzbzxx,'NA') FROM CIS_HLHT.dbo.HLHT_MJZBL_JZLGBL A LEFT JOIN (SELECT
    STUFF((SELECT ''+ B.MEMO  FROM CISDB_SZ.dbo.OUTP_ORDER B WHERE  A.jzlsh = B.GHXH FOR xml path('')),1,1,'') yzbzxx,A.yjlxh
    FROM  CIS_HLHT.dbo.HLHT_MJZBL_JZLGBL A) T  ON A.yjlxh = T.yjlxh WHERE A.yzbzxx = 'NA'
  --医嘱开立科室
  UPDATE A SET A.yzklksdm = isnull((SELECT top 1 B.KSDM  FROM    CISDB_SZ.dbo.OUTP_ORDER B WHERE A.jzlsh = B.GHXH),'NA'),
    A.yzklks = isnull((SELECT top 1 B.KSMC  FROM    CISDB_SZ.dbo.OUTP_ORDER B WHERE A.jzlsh = B.GHXH),'NA')
  FROM CIS_HLHT.dbo.HLHT_MJZBL_JZLGBL A WHERE (A.yzklksdm = 'NA' or A.yzklks = 'NA')
 --医嘱开立者
  UPDATE A SET A.yzklzdm = isnull((SELECT TOP 1 B.YSDM  FROM    CISDB_SZ.dbo.OUTP_ORDER B WHERE A.jzlsh = B.GHXH),'NA'),
    A.yzklzqm = isnull((SELECT top 1 B.YSMC FROM    CISDB_SZ.dbo.OUTP_ORDER B WHERE A.jzlsh = B.GHXH),'NA')
  FROM CIS_HLHT.dbo.HLHT_MJZBL_JZLGBL A WHERE (A.yzklzdm = 'NA' or A.yzklzqm = 'NA')
 --医嘱开立日期时间
  UPDATE B SET B.yzklrq =  (
    SELECT  TOP 1 CONVERT(datetime,substring(A.LRRQ,1,4)+'-'+substring(A.LRRQ,5,2)+'-'+substring(A.LRRQ,7,2)+' '+substring(A.LRRQ,9,8) ) FROM CISDB_SZ.dbo.OUTP_ORDER A WHERE A.GHXH=B.jzlsh
  )
  FROM CIS_HLHT.dbo.HLHT_MJZBL_JZLGBL B WHERE (B.yzklrq = '1990-01-01 00:00:00' )
  --专业技术职务类别
  UPDATE A SET A.zyjszwlb = ISNULL(B.ZCDM,'NA'),A.zyjszwlbmc = ISNULL(B.ZCMC,'NA') FROM CIS_HLHT.dbo.HLHT_MJZBL_JZLGBL A LEFT JOIN CISDB_SZ.dbo.SYS_ZGDMK B ON B.ID = A.ysbm WHERE (A.zyjszwlb = 'NA' OR A.zyjszwlbmc ='NA')
  --用户去向
  UPDATE A SET A.hzqxdm='1',A.hzqxmc='治愈' FROM CIS_HLHT..HLHT_MJZBL_JZLGBL A WHERE (A.hzqxdm = 'NA' or A.hzqxmc='NA')