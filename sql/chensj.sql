--从首次病程中获取诊断依据编码和诊断依据
UPDATE A SET A.zdyj = B.zdyj,A.zdyjdm = B.zdyjdm
FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQXJ A,CISDB_DATA.dbo.HLHT_ZYBCJL_SCBCJL B
WHERE A.jzlsh = B.jzlsh AND ( CONVERT(varchar,A.zdyj) ='N' OR CONVERT(varchar,A.zdyjdm) ='N' );
