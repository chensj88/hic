CREATE PROCEDURE [dbo].[usp_his5_hlht_tsdata_mz]
as
--门急诊病历记录
--过敏史
UPDATE [HLHT_MJZBL_MJZBL] SET gmsbz ='F';
UPDATE [HLHT_MJZBL_MJZBL] SET gmsbz ='T' WHERE CONVERT(varchar,gms) ='有';
--医嘱项目类型代码、名称
UPDATE [HLHT_MJZBL_MJZBL] SET yzxmlx ='01',yzxmlxmc ='药品类医嘱' WHERE CONVERT(varchar,yzxmlx) ='NA';
--医嘱备注信息
UPDATE A SET A.yzbzxx = isnull(T.yzbzxx,'NA') FROM [HLHT_MJZBL_MJZBL] A LEFT JOIN (SELECT
    ISNULL(STUFF((SELECT ''+ B.MEMO  FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDER] B(nolock) WHERE  A.jzlsh = B.GHXH FOR xml path('')),1,1,''),
           STUFF((SELECT ''+ B.MEMO  FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NORDER] B(nolock) WHERE  A.jzlsh = B.GHXH FOR xml path('')),1,1,'')) yzbzxx,A.yjlxh
    FROM  [HLHT_MJZBL_MJZBL] A(nolock)) T  ON A.yjlxh = T.yjlxh WHERE A.yzbzxx = 'NA'
 --医嘱开立科室
  UPDATE A SET A.yzklksdm = isnull((
    ISNULL((SELECT top 1 B.KSDM  FROM    [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDER] B(nolock) WHERE A.jzlsh = B.GHXH),
       (SELECT top 1 B.KSDM  FROM    [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NORDER] B(nolock) WHERE A.jzlsh = B.GHXH))
       ),'NA'),
    A.yzklks = isnull(
	   isnull((SELECT top 1 B.KSMC  FROM    [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDER] B(nolock) WHERE A.jzlsh = B.GHXH),
	          (SELECT top 1 B.KSMC  FROM    [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NORDER] B(nolock) WHERE A.jzlsh = B.GHXH)),'NA')
  FROM [HLHT_MJZBL_MJZBL] A(nolock) WHERE (A.yzklksdm = 'NA' or A.yzklks = 'NA')
 --医嘱开立者
  UPDATE A SET A.yzklzdm =
    isnull(isnull((SELECT TOP 1 B.YSDM  FROM    [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDER] B(nolock) WHERE A.jzlsh = B.GHXH),
	   (SELECT TOP 1 B.YSDM  FROM    [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NORDER] B(nolock) WHERE A.jzlsh = B.GHXH)),'NA'),
    A.yzklzqm = isnull(
	  isnull((SELECT top 1 B.YSMC FROM    [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDER] B(nolock) WHERE A.jzlsh = B.GHXH),
	   (SELECT top 1 B.YSMC FROM    [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NORDER] B(nolock) WHERE A.jzlsh = B.GHXH)),'NA')
  FROM [HLHT_MJZBL_MJZBL] A(nolock) WHERE (A.yzklzdm = 'NA' or A.yzklzqm = 'NA')
 --医嘱开立日期时间
  UPDATE B SET B.yzklrq =  isnull(isnull(
  (
    SELECT  TOP 1 CONVERT(datetime,substring(A.LRRQ,1,4)+'-'+substring(A.LRRQ,5,2)+'-'+substring(A.LRRQ,7,2)+' '+substring(A.LRRQ,9,8) )
	FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDER] A(nolock) WHERE A.GHXH=B.jzlsh
  ),( SELECT  TOP 1 CONVERT(datetime,substring(A.LRRQ,1,4)+'-'+substring(A.LRRQ,5,2)+'-'+substring(A.LRRQ,7,2)+' '+substring(A.LRRQ,9,8) )
	FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NORDER] A(nolock) WHERE A.GHXH=B.jzlsh)), '1990-01-01 00:00:00')
  FROM [HLHT_MJZBL_MJZBL] B(nolock) WHERE (B.yzklrq = '1990-01-01 00:00:00' )

--门诊留观
 --医嘱项目类型
  UPDATE A SET A.yzxmlx = '01' ,A.yzxmlxmc='药品类医嘱'  FROM  [HLHT_MJZBL_JZLGBL] A WHERE A.yzxmlx = 'NA' OR A.yzxmlxmc = 'NA'
  --医嘱项目内容
  UPDATE A SET A.yzxmnr = isnull(T.yzxmnr,'NA') FROM [HLHT_MJZBL_JZLGBL] A LEFT JOIN (SELECT
      isnull(STUFF((SELECT ','+C.YPMC  FROM  [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDERITEM] C(nolock)
	    WHERE C.CFXH IN (SELECT B.XH  FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDER] B(nolock) WHERE  A.jzlsh = B.GHXH) FOR xml path('')),1,1,''),
      STUFF((SELECT ','+C.YPMC  FROM  [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NORDERITEM] C(nolock)
	    WHERE C.CFXH IN (SELECT B.XH  FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NORDER] B(nolock) WHERE  A.jzlsh = B.GHXH) FOR xml path('')),1,1,''))
      yzxmnr,A.yjlxh
     FROM  [HLHT_MJZBL_JZLGBL] A(nolock) ) T  ON A.yjlxh = T.yjlxh WHERE A.yzxmnr = 'NA'
  --医嘱备注信息
  UPDATE A SET A.yzbzxx = isnull(T.yzbzxx,'NA') FROM [HLHT_MJZBL_JZLGBL] A LEFT JOIN (SELECT
    ISNULL(STUFF((SELECT ''+ B.MEMO  FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDER] B(nolock) WHERE  A.jzlsh = B.GHXH FOR xml path('')),1,1,''),
           STUFF((SELECT ''+ B.MEMO  FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NORDER] B(nolock) WHERE  A.jzlsh = B.GHXH FOR xml path('')),1,1,'')) yzbzxx,A.yjlxh
    FROM  [HLHT_MJZBL_JZLGBL] A(nolock)) T  ON A.yjlxh = T.yjlxh WHERE A.yzbzxx = 'NA'
  --医嘱开立科室
  UPDATE A SET A.yzklksdm = isnull((
    ISNULL((SELECT top 1 B.KSDM  FROM    [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDER] B(nolock) WHERE A.jzlsh = B.GHXH),
       (SELECT top 1 B.KSDM  FROM    [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NORDER] B(nolock) WHERE A.jzlsh = B.GHXH))
       ),'NA'),
    A.yzklks = isnull(
	   isnull((SELECT top 1 B.KSMC  FROM    [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDER] B(nolock) WHERE A.jzlsh = B.GHXH),
	          (SELECT top 1 B.KSMC  FROM    [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NORDER] B(nolock) WHERE A.jzlsh = B.GHXH)),'NA')
  FROM [HLHT_MJZBL_JZLGBL] A(nolock) WHERE (A.yzklksdm = 'NA' or A.yzklks = 'NA')
 --医嘱开立者
  UPDATE A SET A.yzklzdm =
    isnull(isnull((SELECT TOP 1 B.YSDM  FROM    [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDER] B(nolock) WHERE A.jzlsh = B.GHXH),
	   (SELECT TOP 1 B.YSDM  FROM    [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NORDER] B(nolock) WHERE A.jzlsh = B.GHXH)),'NA'),
    A.yzklzqm = isnull(
	  isnull((SELECT top 1 B.YSMC FROM    [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDER] B(nolock) WHERE A.jzlsh = B.GHXH),
	   (SELECT top 1 B.YSMC FROM    [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NORDER] B(nolock) WHERE A.jzlsh = B.GHXH)),'NA')
  FROM [HLHT_MJZBL_JZLGBL] A(nolock) WHERE (A.yzklzdm = 'NA' or A.yzklzqm = 'NA')
 --医嘱开立日期时间
  UPDATE B SET B.yzklrq =  isnull(isnull(
  (
    SELECT  TOP 1 CONVERT(datetime,substring(A.LRRQ,1,4)+'-'+substring(A.LRRQ,5,2)+'-'+substring(A.LRRQ,7,2)+' '+substring(A.LRRQ,9,8) )
	FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDER] A(nolock) WHERE A.GHXH=B.jzlsh
  ),( SELECT  TOP 1 CONVERT(datetime,substring(A.LRRQ,1,4)+'-'+substring(A.LRRQ,5,2)+'-'+substring(A.LRRQ,7,2)+' '+substring(A.LRRQ,9,8) )
	FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NORDER] A(nolock) WHERE A.GHXH=B.jzlsh)), '1990-01-01 00:00:00')
  FROM [HLHT_MJZBL_JZLGBL] B(nolock) WHERE (B.yzklrq = '1990-01-01 00:00:00' )
  --专业技术职务类别
  UPDATE A SET A.zyjszwlb = ISNULL(B.ZCDM,'NA'),A.zyjszwlbmc = ISNULL(B.ZCMC,'NA') FROM [HLHT_MJZBL_JZLGBL] A(nolock) LEFT JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[SYS_ZGDMK] B(nolock) ON B.ID = A.ysbm WHERE (A.zyjszwlb = 'NA' OR A.zyjszwlbmc ='NA')
  --用户去向
  UPDATE A SET A.hzqxdm='1',A.hzqxmc='治愈' FROM [HLHT_MJZBL_JZLGBL] A(nolock) WHERE (A.hzqxdm = 'NA' or A.hzqxmc='NA')