----首次病程
UPDATE A SET A.sjysbm =isnull(C.ZRYSDM,'NA'),A.sjysqm=isnull(C.ZRYSXM,'NA')
FROM CISDB_DATA..HLHT_ZYBCJL_SCBCJL A,CISDB..CPOE_BRSYK C
WHERE A.jzlsh=C.SYXH AND (A.sjysbm ='NA' OR A.sjysqm ='NA' )

--中医四诊
UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA')
FROM CISDB_DATA..HLHT_ZYBCJL_SCBCJL A,HLHT_RYJL_JBXX C
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA';
UPDATE CISDB_DATA..HLHT_ZYBCJL_SCBCJL SET jzxyzdbm =czxyzdbm, jzxyzdmc=czxyzd
WHERE jzxyzdbm='NA' AND jzxyzdmc='NA';

UPDATE CISDB_DATA..HLHT_ZYBCJL_SCBCJL SET zyszgcjg='无' WHERE CONVERT(varchar,zyszgcjg) ='N'
UPDATE CISDB_DATA..HLHT_ZYBCJL_SCBCJL SET zdyjdm=NULL WHERE zdyjdm='N'
UPDATE CISDB_DATA..HLHT_ZYBCJL_SCBCJL SET czzybmdm=NULL WHERE czzybmdm='N'
UPDATE CISDB_DATA..HLHT_ZYBCJL_SCBCJL SET czzybm=NULL WHERE czzybm='N'
UPDATE CISDB_DATA..HLHT_ZYBCJL_SCBCJL SET czzyzhdm=NULL WHERE czzyzhdm='N'
UPDATE CISDB_DATA..HLHT_ZYBCJL_SCBCJL SET czzyzh=NULL WHERE czzyzh='N'
UPDATE CISDB_DATA..HLHT_ZYBCJL_SCBCJL SET jzzybmdm=NULL WHERE jzzybmdm='N'
UPDATE CISDB_DATA..HLHT_ZYBCJL_SCBCJL SET jzzybmmc=NULL WHERE jzzybmmc='N'
UPDATE CISDB_DATA..HLHT_ZYBCJL_SCBCJL SET jzzyzhbm=NULL WHERE jzzyzhbm='N'
UPDATE CISDB_DATA..HLHT_ZYBCJL_SCBCJL SET jzzyzhmc=NULL WHERE jzzyzhmc='N'
UPDATE CISDB_DATA..HLHT_ZYBCJL_SCBCJL SET zfbm='无' WHERE zfbm='N'
UPDATE CISDB_DATA..HLHT_ZYBCJL_SCBCJL SET zzzf='无' WHERE zzzf='N'

------阶段小结------------------------------------------------------------------------------------------------------
--入院诊断-中医病名代码 入院诊断-中医病名名称
UPDATE A SET A.rzzybm = C.ZDMC,A.rzzybmdm = C.ZDDM

FROM CISDB_DATA.dbo.HLHT_ZYBCJL_JDXJ A LEFT JOIN CISDB.dbo.EMR_BRSYK B ON A.jzlsh =B.HISSYXH
  LEFT JOIN CISDB.dbo.EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 3
WHERE  (CONVERT(varchar,A.rzzybmdm) ='NA' OR CONVERT(varchar,A.rzzybm) ='NA')  AND ZDDM LIKE'B%';

UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA')
FROM CISDB_DATA..HLHT_ZYBCJL_JDXJ A,HLHT_RYJL_JBXX C
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA';

UPDATE CISDB_DATA..HLHT_ZYBCJL_SCBCJL SET jzxyzdbm =czxyzdbm, jzxyzdmc=czxyzd
WHERE jzxyzdbm='NA' AND jzxyzdmc='NA';

UPDATE A SET A.zs=isnull(B.zs,'NA')  FROM CISDB_DATA..HLHT_ZYBCJL_JDXJ A LEFT JOIN CISDB_DATA..HLHT_ZYBCJL_SCBCJL B ON A.jzlsh=B.jzlsh
UPDATE CISDB_DATA..HLHT_ZYBCJL_JDXJ SET zyszgcjg='无' WHERE CONVERT(varchar,zyszgcjg) ='N'
--入院诊断-中医证候代码 入院诊断-中医证候名称
UPDATE A SET A.rzzybm =isnull(B.czzybmmc,'NA')  ,A.rzzybmdm=isnull(B.czzybmdm,'NA')
FROM CISDB_DATA.dbo.HLHT_ZYBCJL_JDXJ A
LEFT JOIN CISDB_DATA.dbo.HLHT_RYJL_JBXX B ON A.jzlsh =B.jzlsh
WHERE  ( CONVERT(varchar,A.rzzybmdm) ='NA' OR CONVERT(varchar,A.rzzybm) ='NA') ;

UPDATE A SET A.rzzyzh = isnull(B.czzyzhmc,'NA') ,A.rzzyzhdm=isnull(B.czzyzhdm,'NA')
FROM CISDB_DATA.dbo.HLHT_ZYBCJL_JDXJ A
LEFT JOIN CISDB_DATA.dbo.HLHT_RYJL_JBXX B ON A.jzlsh =B.jzlsh
WHERE  ( CONVERT(varchar,A.rzzyzh) ='NA' OR CONVERT(varchar,A.rzzyzhdm) ='NA') ;
--医嘱内容
UPDATE A SET A.yznr = ISNULL((SELECT LEFT(t.YPMC,LEN(t.YPMC)-1) as YPMC
FROM (SELECT (SELECT YPMC+',' FROM CISDB..CPOE_LSYZK B WHERE B.SYXH=A.jzlsh FOR XML PATH('') ) AS YPMC ) t),'NA')
FROM CISDB_DATA..HLHT_ZYBCJL_JDXJ A WHERE CONVERT(varchar,A.yznr) ='NA'

--目前诊断中医、症候
UPDATE A SET A.mqzdzybm =isnull(B.czzybmmc,'NA')  ,A.mqzdzybmdm=isnull(B.czzybmdm,'NA')
FROM CISDB_DATA.dbo.HLHT_ZYBCJL_JDXJ A
LEFT JOIN CISDB_DATA.dbo.HLHT_RYJL_JBXX B ON A.jzlsh =B.jzlsh
WHERE  ( CONVERT(varchar,A.mqzdzybmdm) ='NA' OR CONVERT(varchar,A.mqzdzybm) ='NA') ;

UPDATE A SET A.mqzdzyzh = isnull(B.czzyzhmc,'NA') ,A.mqzdzyzhdm=isnull(B.czzyzhdm,'NA')
FROM CISDB_DATA.dbo.HLHT_ZYBCJL_JDXJ A
LEFT JOIN CISDB_DATA.dbo.HLHT_RYJL_JBXX B ON A.jzlsh =B.jzlsh
WHERE  ( CONVERT(varchar,A.mqzdzyzhdm) ='NA' OR CONVERT(varchar,A.mqzdzyzh) ='NA') ;


--抢救记录

UPDATE A SET A.jbzdmc = C.ZDMC,A.jbzdbm = C.ZDDM
FROM CISDB_DATA..HLHT_ZYBCJL_QJJL A LEFT JOIN CISDB.dbo.EMR_BRSYK B ON A.jzlsh =B.HISSYXH
  LEFT JOIN CISDB.dbo.EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 1
WHERE  ( CONVERT(varchar,A.jbzdmc) ='N' OR CONVERT(varchar,A.jbzdbm) ='N' );

UPDATE CISDB_DATA..HLHT_ZYBCJL_QJJL SET jcjyxmmc='无' WHERE CONVERT(varchar,jcjyxmmc) ='N'
UPDATE CISDB_DATA..HLHT_ZYBCJL_QJJL SET jrwdm=NULL
UPDATE CISDB_DATA..HLHT_ZYBCJL_QJJL SET jcjyjg='无' WHERE CONVERT(varchar,jcjyjg) ='N'
UPDATE CISDB_DATA..HLHT_ZYBCJL_QJJL SET jcjydljg='0.0000' WHERE jcjydljg ='-9.0000'
UPDATE CISDB_DATA..HLHT_ZYBCJL_QJJL SET jcjyjgdm='无' WHERE CONVERT(varchar,jcjyjgdm) ='N'
UPDATE CISDB_DATA..HLHT_ZYBCJL_QJJL SET zysx='无' WHERE CONVERT(varchar,zysx) ='N'

UPDATE 	A SET A.qmrq=B.FSSJ from  CISDB_DATA..HLHT_ZYBCJL_QJJL A
LEFT JOIN CISDB.dbo.EMR_QTBLJLK B ON A.yjlxh =B.QTBLJLXH
WHERE A.qmrq='1990-01-01 00:00:00.000' ;
UPDATE D SET D.zyzwlbdm = F.dm ,D.zyzwlbmc = F.mc   FROM CISDB_DATA.dbo.HLHT_ZYBCJL_QJJL D LEFT JOIN (
   SELECT  stuff((select ',' + A.ZCDM from CISDB.dbo.SYS_ZGDMK A where A.ID in (
select * from f_splitSTR(C.cjqjrydm,',')) for xml path('')),1,1,'') as dm,
           stuff((select ',' + B.ZCMC from CISDB.dbo.SYS_ZGDMK B where B.ID in (
select * from f_splitSTR(C.cjqjrydm,',')) for xml path('')),1,1,'')  as mc,
     C.yjlxh
   from CISDB_DATA.dbo.HLHT_ZYBCJL_QJJL C ) F ON D.yjlxh = F.yjlxh where (D.zyzwlbdm = 'N' OR D.zyzwlbmc='N')

-- 其他知情告知同意书
UPDATE A SET A.jbzd = C.ZDMC,A.jbzdbm = C.ZDDM
  FROM CISDB_DATA.dbo.HLHT_ZQGZXX_QTZQTYS A LEFT JOIN CISDB.dbo.EMR_BRSYK B ON A.jzlsh =B.HISSYXH
    LEFT JOIN CISDB.dbo.EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 1
  WHERE  ( CONVERT(varchar,A.jbzd) ='N' OR CONVERT(varchar,A.jbzdbm) ='N' );

UPDATE CISDB_DATA..HLHT_ZQGZXX_QTZQTYS SET yljgyj='无' WHERE CONVERT(varchar,yljgyj)='N' ;
UPDATE CISDB_DATA..HLHT_ZQGZXX_QTZQTYS SET dlryj='无' WHERE CONVERT(varchar,dlryj)='N' ;
UPDATE CISDB_DATA..HLHT_ZQGZXX_QTZQTYS SET hzqm=dlrqm WHERE CONVERT(varchar,hzqm)='N' ;
UPDATE CISDB_DATA..HLHT_ZQGZXX_QTZQTYS SET dlrhzgx='无' WHERE CONVERT(varchar,dlrhzgx)='N' ;
UPDATE CISDB_DATA..HLHT_ZQGZXX_QTZQTYS SET dlrhzmc='无' WHERE CONVERT(varchar,dlrhzmc)='N' ;



-- 出院小结
--中医四诊
UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA')
FROM CISDB_DATA..HLHT_CYXJ_CYXJ A,HLHT_RYJL_JBXX C
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA';

--入院诊断-中医病名代码 入院诊断-中医病名名称
UPDATE A SET A.rzzybm =isnull(B.czzybmmc,'NA')  ,A.rzzybmdm=isnull(B.czzybmdm,'NA')
FROM CISDB_DATA.dbo.HLHT_CYXJ_CYXJ A
LEFT JOIN CISDB_DATA.dbo.HLHT_RYJL_JBXX B ON A.jzlsh =B.jzlsh
WHERE  ( CONVERT(varchar,A.rzzybmdm) ='NA' OR CONVERT(varchar,A.rzzybm) ='NA') ;

UPDATE A SET A.rzzyzh = isnull(B.czzyzhmc,'NA') ,A.rzzyzhdm=isnull(B.czzyzhdm,'NA')
FROM CISDB_DATA.dbo.HLHT_CYXJ_CYXJ A
LEFT JOIN CISDB_DATA.dbo.HLHT_RYJL_JBXX B ON A.jzlsh =B.jzlsh
WHERE  ( CONVERT(varchar,A.rzzyzh) ='NA' OR CONVERT(varchar,A.rzzyzhdm) ='NA') ;

--出院诊断-中医病名代码

UPDATE A SET A.czzybm =isnull(B.czzybmmc,'NA')  ,A.czzybmdm=isnull(B.czzybmdm,'NA')
FROM CISDB_DATA.dbo.HLHT_CYXJ_CYXJ A
LEFT JOIN CISDB_DATA.dbo.HLHT_RYJL_JBXX B ON A.jzlsh =B.jzlsh
WHERE  ( CONVERT(varchar,A.czzybmdm) ='NA' OR CONVERT(varchar,A.czzybm) ='NA') ;

UPDATE A SET A.czzyzh = isnull(B.czzyzhmc,'NA') ,A.czzyzhdm=isnull(B.czzyzhdm,'NA')
FROM CISDB_DATA.dbo.HLHT_CYXJ_CYXJ A
LEFT JOIN CISDB_DATA.dbo.HLHT_RYJL_JBXX B ON A.jzlsh =B.jzlsh
WHERE  ( CONVERT(varchar,A.czzyzh) ='NA' OR CONVERT(varchar,A.czzyzhdm) ='NA') ;

--切口愈合等级代码、名称
UPDATE A SET A.qkyhdjdm = CASE WHEN B.SSDJ IS NULL THEN 'NA' ELSE B.SSDJ END,A.qkyhdjmc = CASE WHEN B.SSDJMC IS NULL THEN 'NA' ELSE B.SSDJMC END
FROM CISDB_DATA..HLHT_CYXJ_CYXJ A LEFT JOIN CISDB.dbo.CPOE_SSYZK B ON A.jzlsh = B.SYXH
WHERE (A.qkyhdjmc = 'NA' OR A.qkyhdjdm ='NA');

--麻醉方法代码、名称
--UPDATE A SET A.mzffdm = CASE WHEN B.MZDM IS NULL THEN 'NA' ELSE B.MZDM END,A.mzffmc = CASE WHEN B.MZMC IS NULL THEN 'NA' ELSE B.MZMC END
--FROM CISDB_DATA..HLHT_CYXJ_CYXJ A LEFT JOIN CISDB.dbo.CPOE_SSYZK B ON A.jzlsh = B.SYXH
--WHERE (A.mzffdm = 'NA' OR A.mzffmc ='NA');


--治疗结果代码
UPDATE A SET A.zljgdm=CASE WHEN B.ZGQK IS NULL THEN '1' ELSE B.ZGQK END
 FROM CISDB_DATA..HLHT_CYXJ_CYXJ A LEFT JOIN CISDB.dbo.EMR_BASY_ZDK B ON A.jzlsh=B.SYXH;
--治疗结果名称
UPDATE A SET A.zljgmc='治愈'
 FROM CISDB_DATA..HLHT_CYXJ_CYXJ A LEFT JOIN CISDB.dbo.EMR_SYS_ZDFLMXK B  ON A.zljgdm=B.MXDM
WHERE  A.zljgdm ='1';

-- 转科记录
--中医“四诊”观察结果
UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA')
FROM CISDB_DATA..HLHT_ZYBCJL_ZKJL A,CISDB_DATA..HLHT_RYJL_JBXX C
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA';
--入院诊断-中医病名代码 入院诊断-中医病名名称
UPDATE A SET A.rzzybm = C.ZDMC,A.rzzybmdm = C.ZDDM
FROM CISDB_DATA.dbo.HLHT_ZYBCJL_ZKJL A LEFT JOIN CISDB.dbo.EMR_BRSYK B ON A.jzlsh =B.HISSYXH
  LEFT JOIN CISDB.dbo.EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 3
WHERE  (CONVERT(varchar,A.rzzybmdm) ='NA' OR CONVERT(varchar,A.rzzybm) ='NA')  AND ZDDM LIKE'B%';
--入院诊断-中医证候代码 入院诊断-中医证候名称
UPDATE A SET A.rzzyzh = C.ZDMC,A.rzzyzhdm = C.ZDDM
FROM CISDB_DATA.dbo.HLHT_ZYBCJL_ZKJL A LEFT JOIN CISDB.dbo.EMR_BRSYK B ON A.jzlsh =B.HISSYXH
  LEFT JOIN CISDB.dbo.EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 3
WHERE  ( CONVERT(varchar,A.rzzyzh) ='NA' OR CONVERT(varchar,A.rzzyzhdm) ='NA' ) AND (ZDDM LIKE'A%' OR ZDDM LIKE'Z%') ;

--目前诊断-中医病名代码、名称
UPDATE A SET A.mqzdzybm = CASE WHEN C.ZDMC IS NULL THEN 'NA' ELSE C.ZDMC END,A.mqzdzybmdm = CASE WHEN C.ZDDM IS NULL THEN 'NA' ELSE C.ZDDM END
FROM CISDB_DATA.dbo.HLHT_ZYBCJL_ZKJL A LEFT JOIN CISDB.dbo.EMR_BRSYK B ON A.jzlsh =B.HISSYXH
  LEFT JOIN CISDB.dbo.EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 8
WHERE  ( CONVERT(varchar,A.mqzdzybmdm) ='NA' OR CONVERT(varchar,A.mqzdzybm) ='NA' ) AND (ZDDM LIKE'A%' OR ZDDM LIKE'Z%') ;

--入院诊断-中医证候代码 入院诊断-中医证候名称
UPDATE A SET A.mqzdzybm = CASE WHEN C.ZDMC IS NULL THEN 'NA' ELSE C.ZDMC END,A.mqzdzyzhdm = CASE WHEN C.ZDDM IS NULL THEN 'NA' ELSE C.ZDDM END
FROM CISDB_DATA.dbo.HLHT_ZYBCJL_ZKJL A LEFT JOIN CISDB.dbo.EMR_BRSYK B ON A.jzlsh =B.HISSYXH
  LEFT JOIN CISDB.dbo.EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 8
WHERE  ( CONVERT(varchar,A.mqzdzybm) ='NA' OR CONVERT(varchar,A.mqzdzyzhdm) ='NA' ) AND (ZDDM LIKE'A%' OR ZDDM LIKE'Z%') ;


---会诊记录
--中医“四诊”观察结果
UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA')
FROM CISDB_DATA..HLHT_ZYBCJL_HZJL A,CISDB_DATA..HLHT_RYJL_JBXX C
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA';


UPDATE A SET A.xyzdmc =isnull(C.czxyzdmc,'NA'),A.xyzdbm =isnull(C.czxyzdbm,'NA')
FROM CISDB_DATA..HLHT_ZYBCJL_HZJL A,CISDB_DATA..HLHT_RYJL_JBXX C
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.xyzdmc) ='NA' OR CONVERT(varchar,A.xyzdbm) ='NA';

UPDATE A SET A.zybmmc =isnull(C.czzybmmc,'NA'),A.zybmdm =isnull(C.czzybmdm,'NA')
FROM CISDB_DATA..HLHT_ZYBCJL_HZJL A,CISDB_DATA..HLHT_RYJL_JBXX C
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zybmmc) ='NA' OR CONVERT(varchar,A.zybmdm) ='NA';

UPDATE A SET A.zyzhmc =isnull(C.czzyzhmc,'NA'),A.zyzhdm =isnull(C.czzyzhdm,'NA')
FROM CISDB_DATA..HLHT_ZYBCJL_HZJL A,CISDB_DATA..HLHT_RYJL_JBXX C
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyzhmc) ='NA' OR CONVERT(varchar,A.zyzhdm) ='NA';

UPDATE CISDB_DATA..HLHT_ZYBCJL_HZJL SET hzyy =ISNULL(hzmd, 'NA') WHERE hzyy='NA';




--门急诊病历记录
--过敏史
UPDATE CISDB_DATA..HLHT_MJZBL_MJZBL SET gmsbz ='F';
UPDATE CISDB_DATA..HLHT_MJZBL_MJZBL SET gmsbz ='T' WHERE CONVERT(varchar,gms) ='有';
--医嘱项目类型代码、名称
UPDATE CISDB_DATA..HLHT_MJZBL_MJZBL SET yzxmlx ='01',yzxmlxmc ='药品类医嘱' WHERE CONVERT(varchar,yzxmlx) ='NA';
--医嘱备注信息
UPDATE A SET A.yzbzxx =
CASE WHEN C.MEMO IS NULL THEN 'NA' WHEN C.MEMO ='' THEN 'NA' ELSE C.MEMO END
FROM CISDB_DATA..HLHT_MJZBL_MJZBL A,CISDB.dbo.OUTP_ORDER C WHERE A.jzlsh=C.GHXH and A.yzbzxx ='NA';
--医嘱开立科室代码、名称
UPDATE A SET A.yzklksdm =C.KSDM,A.yzklks=C.KSMC
FROM CISDB_DATA..HLHT_MJZBL_MJZBL A,CISDB.dbo.OUTP_ORDER C
WHERE A.jzlsh=C.GHXH and A.yzklksdm ='NA' OR A.yzklks ='NA';

--医嘱开立者工号、姓名
UPDATE A SET A.yzklzdm =C.YSDM,A.yzklzqm=C.YSMC
FROM CISDB_DATA..HLHT_MJZBL_MJZBL A,CISDB.dbo.OUTP_ORDER C
WHERE A.jzlsh=C.GHXH and A.yzklzdm ='NA' OR A.yzklzqm ='NA';

--医嘱开立日期时间
UPDATE A SET A.yzklrq = CONVERT(datetime,substring(C.LRRQ,1,4)+'-'+substring(C.LRRQ,5,2)+'-'+substring(C.LRRQ,7,2)+' '+substring(C.LRRQ,9,8))
FROM CISDB_DATA..HLHT_MJZBL_MJZBL A,CISDB.dbo.OUTP_ORDER C
WHERE A.jzlsh=C.GHXH ;

