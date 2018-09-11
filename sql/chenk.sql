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
UPDATE A SET A.rzzyzh = C.ZDMC,A.rzzyzhdm = C.ZDDM
FROM CISDB_DATA.dbo.HLHT_ZYBCJL_JDXJ A LEFT JOIN CISDB.dbo.EMR_BRSYK B ON A.jzlsh =B.HISSYXH
  LEFT JOIN CISDB.dbo.EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 3
WHERE  ( CONVERT(varchar,A.rzzyzh) ='NA' OR CONVERT(varchar,A.rzzyzhdm) ='NA' ) AND (ZDDM LIKE'A%' OR ZDDM LIKE'Z%') ;
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
UPDATE CISDB_DATA..HLHT_CYXJ_CYXJ SET jkkh='无' WHERE CONVERT(varchar,jkkh)='N' ;
UPDATE CISDB_DATA..HLHT_CYXJ_CYXJ SET dzc='无' WHERE CONVERT(varchar,dzc)='N' ;
UPDATE CISDB_DATA..HLHT_CYXJ_CYXJ SET dzmphm='无' WHERE CONVERT(varchar,dzmphm)='N' ;
UPDATE CISDB_DATA..HLHT_CYXJ_CYXJ SET yzbm='无' WHERE CONVERT(varchar,yzbm)='N' ;
UPDATE CISDB_DATA..HLHT_CYXJ_CYXJ SET yxfzjcjg='无' WHERE CONVERT(varchar,yxfzjcjg)='N' ;
UPDATE CISDB_DATA..HLHT_CYXJ_CYXJ SET zyszgcjg='无' WHERE CONVERT(varchar,zyszgcjg)='N' ;
UPDATE CISDB_DATA..HLHT_CYXJ_CYXJ SET rzxyzdbm='无' WHERE CONVERT(varchar,rzxyzdbm)='N' ;
--入院诊断-中医病名代码 入院诊断-中医病名名称
UPDATE A SET A.rzzybm = C.ZDMC,A.rzzybmdm = C.ZDDM
FROM CISDB_DATA.dbo.HLHT_CYXJ_CYXJ A LEFT JOIN CISDB.dbo.EMR_BRSYK B ON A.jzlsh =B.HISSYXH
  LEFT JOIN CISDB.dbo.EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 3
WHERE  (CONVERT(varchar,A.rzzybmdm) ='N' OR CONVERT(varchar,A.rzzybm) ='N')  AND ZDDM LIKE'B%';
--入院诊断-中医证候代码 入院诊断-中医证候名称
UPDATE A SET A.rzzyzh = C.ZDMC,A.rzzyzhdm = C.ZDDM
FROM CISDB_DATA.dbo.HLHT_CYXJ_CYXJ A LEFT JOIN CISDB.dbo.EMR_BRSYK B ON A.jzlsh =B.HISSYXH
  LEFT JOIN CISDB.dbo.EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 3
WHERE  ( CONVERT(varchar,A.rzzyzh) ='N' OR CONVERT(varchar,A.rzzyzhdm) ='N' ) AND (ZDDM LIKE'A%' OR ZDDM LIKE'Z%') ;

UPDATE CISDB_DATA..HLHT_CYXJ_CYXJ SET czzybmdm='无' WHERE CONVERT(varchar,czzybmdm)='N' ;
UPDATE CISDB_DATA..HLHT_CYXJ_CYXJ SET czzybm='无' WHERE CONVERT(varchar,czzybm)='N' ;
UPDATE CISDB_DATA..HLHT_CYXJ_CYXJ SET czzybmdm='无' WHERE CONVERT(varchar,czzybmdm)='N' ;
UPDATE CISDB_DATA..HLHT_CYXJ_CYXJ SET czzybm='无' WHERE CONVERT(varchar,czzybm)='N' ;
UPDATE CISDB_DATA..HLHT_CYXJ_CYXJ SET czzyzhdm='无' WHERE CONVERT(varchar,czzyzhdm)='N' ;
UPDATE CISDB_DATA..HLHT_CYXJ_CYXJ SET ssqklbdm='无' WHERE CONVERT(varchar,ssqklbdm)='N' ;
UPDATE CISDB_DATA..HLHT_CYXJ_CYXJ SET ssqklbmc='无' WHERE CONVERT(varchar,ssqklbmc)='N' ;
--切口愈合等级代码、名称
UPDATE A SET A.qkyhdjdm = CASE WHEN B.SSDJ IS NULL THEN '无' ELSE B.SSDJ END,A.qkyhdjmc = CASE WHEN B.SSDJMC IS NULL THEN '无' ELSE B.SSDJMC END
FROM CISDB_DATA..HLHT_CYXJ_CYXJ A LEFT JOIN CISDB.dbo.CPOE_SSYZK B ON A.jzlsh = B.SYXH
WHERE (A.qkyhdjmc = 'N' OR A.qkyhdjdm ='N');

---手术编码、手术名称
UPDATE A SET A.mzffdm = CASE WHEN B.SSDM IS NULL THEN '无' ELSE B.SSDM END,A.mzffmc = CASE WHEN B.SSMC IS NULL THEN '无' ELSE B.SSMC END
FROM CISDB_DATA..HLHT_CYXJ_CYXJ A LEFT JOIN CISDB.dbo.CPOE_SSYZK B ON A.jzlsh = B.SYXH
WHERE (A.mzffdm = 'N' OR A.mzffmc ='N');

--麻醉方法代码、名称
UPDATE A SET A.mzffdm = CASE WHEN B.MZDM IS NULL THEN '无' ELSE B.MZDM END,A.mzffmc = CASE WHEN B.MZMC IS NULL THEN '无' ELSE B.MZMC END
FROM CISDB_DATA..HLHT_CYXJ_CYXJ A LEFT JOIN CISDB.dbo.CPOE_SSYZK B ON A.jzlsh = B.SYXH
WHERE (A.mzffdm = 'N' OR A.mzffmc ='N');

UPDATE CISDB_DATA..HLHT_CYXJ_CYXJ SET zfbm='无' WHERE CONVERT(varchar,zfbm)='N' ;
UPDATE CISDB_DATA..HLHT_CYXJ_CYXJ SET zzzf='无' WHERE CONVERT(varchar,zzzf)='N' ;
UPDATE CISDB_DATA..HLHT_CYXJ_CYXJ SET zyjzff='无' WHERE CONVERT(varchar,zyjzff)='N' ;
UPDATE CISDB_DATA..HLHT_CYXJ_CYXJ SET zyyyff='无' WHERE CONVERT(varchar,zyyyff)='N' ;

UPDATE CISDB_DATA..HLHT_CYXJ_CYXJ SET zljgdm='无' WHERE CONVERT(varchar,zljgdm)='N' ;
UPDATE CISDB_DATA..HLHT_CYXJ_CYXJ SET zljgmc='无' WHERE CONVERT(varchar,zljgmc)='N' ;
--治疗结果代码
UPDATE A SET A.zljgdm=CASE WHEN B.ZGQK IS NULL THEN '无' ELSE B.ZGQK END
 FROM CISDB_DATA..HLHT_CYXJ_CYXJ A LEFT JOIN CISDB.dbo.EMR_BASY_ZDK B ON A.jzlsh=B.SYXH;
--治疗结果名称
UPDATE A SET A.zljgmc=CASE WHEN B.NAME IS NULL THEN '无' ELSE B.NAME END
 FROM CISDB_DATA..HLHT_CYXJ_CYXJ A LEFT JOIN CISDB.dbo.EMR_SYS_ZDFLMXK B  ON A.zljgdm=B.MXDM
WHERE B.LBDM=8 AND A.zljgdm !='无' AND A.zljgdm ='N';


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




