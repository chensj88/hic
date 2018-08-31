----首次病程
UPDATE A SET A.sjysbm =C.ZRYSDM,A.sjysqm=C.ZRYSXM
FROM CISDB_DATA..HLHT_ZYBCJL_SCBCJL A,CISDB..CPOE_BRSYK C
WHERE A.jzlsh=C.SYXH AND (A.sjysbm ='N' OR A.sjysqm ='N' )

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

--阶段小结
UPDATE A SET A.zs=B.zs
FROM CISDB_DATA..HLHT_ZYBCJL_JDXJ A LEFT JOIN CISDB_DATA..HLHT_ZYBCJL_SCBCJL B ON A.jzlsh=B.jzlsh;

UPDATE CISDB_DATA..HLHT_ZYBCJL_JDXJ SET zyszgcjg='无' WHERE CONVERT(varchar,zyszgcjg) ='N'



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

