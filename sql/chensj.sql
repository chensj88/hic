--从首次病程中获取诊断依据编码和诊断依据
UPDATE A SET A.zdyj = B.zdyj,A.zdyjdm = B.zdyjdm
FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQXJ A,CISDB_DATA.dbo.HLHT_ZYBCJL_SCBCJL B
WHERE A.jzlsh = B.jzlsh AND ( CONVERT(varchar,A.zdyj) ='N' OR CONVERT(varchar,A.zdyjdm) ='N' );
--从入院信息获取过敏史数据处理
UPDATE A SET A.gmsbz ='F' FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQXJ A ,CISDB_DATA.dbo.HLHT_RYJL_JBXX B  WHERE A.jzlsh =B.jzlsh AND ( B.gms is null OR CHARINDEX('否认',convert(varchar,B.gms)) > 0);
UPDATE A SET A.gmsbz ='T' FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQXJ A ,CISDB_DATA.dbo.HLHT_RYJL_JBXX B  WHERE A.jzlsh =B.jzlsh AND B.gms is not null and CHARINDEX('否认',convert(varchar,B.gms)) = 0;
UPDATE A SET A.gms =B.gms FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQXJ A ,CISDB_DATA.dbo.HLHT_RYJL_JBXX B  WHERE A.jzlsh =B.jzlsh ;
