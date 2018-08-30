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

