--24h内入出院记录
--出院医嘱开立日期时间  医嘱开立医师
  UPDATE A SET
    A.yzklysbm = CASE WHEN T.cqyzrq > T.lsyzrq THEN T.cqysdm ELSE T.lsysdm END ,
    A.cyyzklrqm = CASE WHEN T.cqyzrq > T.lsyzrq THEN T.cqysmc ELSE T.lsysmc END ,
    A.cyyzklrq = CASE WHEN T.cqyzrq > T.lsyzrq THEN T.cqyzrq ELSE T.lsyzrq END
   FROM [HLHT_RYJL_RCYJL] A(nolock) LEFT JOIN (
     SELECT
            (SELECT top 1 CONVERT(datetime,substring(B.LRRQ,1,4)+'-'+substring(B.LRRQ,5,2)+'-'+substring(B.LRRQ,7,2)+' '+substring(B.LRRQ,9,8)) yzrq
            FROM  [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_CQYZK] B(nolock) WHERE A.jzlsh = B.SYXH  order by yzrq DESC) cqyzrq,
           (SELECT top 1 B.YSDM FROM  [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_CQYZK] B(nolock) WHERE A.jzlsh = B.SYXH
            order by CONVERT(datetime,substring(B.LRRQ,1,4)+'-'+substring(B.LRRQ,5,2)+'-'+substring(B.LRRQ,7,2)+' '+substring(B.LRRQ,9,8)) DESC) cqysdm,
           (SELECT top 1 B.YSMC FROM  [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_CQYZK] B(nolock) WHERE A.jzlsh = B.SYXH
            order by CONVERT(datetime,substring(B.LRRQ,1,4)+'-'+substring(B.LRRQ,5,2)+'-'+substring(B.LRRQ,7,2)+' '+substring(B.LRRQ,9,8)) DESC) cqysmc,
           (SELECT top 1 B.YSDM FROM  [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_LSYZK] B(nolock) WHERE A.jzlsh = B.SYXH
            order by CONVERT(datetime,substring(B.LRRQ,1,4)+'-'+substring(B.LRRQ,5,2)+'-'+substring(B.LRRQ,7,2)+' '+substring(B.LRRQ,9,8)) DESC) lsysdm,
           (SELECT top 1 B.YSMC FROM  [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_LSYZK] B(nolock) WHERE A.jzlsh = B.SYXH
            order by CONVERT(datetime,substring(B.LRRQ,1,4)+'-'+substring(B.LRRQ,5,2)+'-'+substring(B.LRRQ,7,2)+' '+substring(B.LRRQ,9,8)) DESC) lsysmc,
           (SELECT top 1 CONVERT(datetime,substring(B.LRRQ,1,4)+'-'+substring(B.LRRQ,5,2)+'-'+substring(B.LRRQ,7,2)+' '+substring(B.LRRQ,9,8)) yzrq
            FROM  [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_LSYZK] B(nolock) WHERE A.jzlsh = B.SYXH  order by yzrq DESC) lsyzrq,A.jzlsh
        FROM [HLHT_RYJL_RCYJL] A(nolock)) T ON A.jzlsh = T.jzlsh
  --陈述内容可靠标志 来源入院记录
  UPDATE A SET A.csnrbz=isnull(B.csnrbz,'NA')  FROM [HLHT_RYJL_RCYJL] A(nolock) LEFT JOIN [HLHT_RYJL_JBXX] B(nolock) ON A.jzlsh =B.jzlsh WHERE A.csnrbz ='NA'
  --现病史 来源入院记录
  UPDATE A SET A.xbs=isnull(B.xbs,'NA')  FROM [HLHT_RYJL_RCYJL] A(nolock) LEFT JOIN [HLHT_RYJL_JBXX] B(nolock) ON A.jzlsh =B.jzlsh WHERE convert(varchar,A.xbs) ='NA'
--陈述者关系
  UPDATE A SET A.cszhzgxdm= T.cszhzgxdm,A.cszhzgxmc = T.cszhzgxmc FROM [HLHT_RYJL_RCYJL] A(nolock)
   LEFT JOIN (
    SELECT CASE  WHEN A.cszhzgxdm IN ('父子','母子') THEN '2'
           WHEN A.cszhzgxdm IN ('本人','户主','本人或户主') THEN '0'
           WHEN A.cszhzgxdm IN ('父女','父女') THEN '3'
           WHEN A.cszhzgxdm IN ('夫妻') THEN '1'
           WHEN A.cszhzgxdm IN ('祖父','祖母') THEN '5'
           WHEN A.cszhzgxdm IN ('外祖父','外祖母') THEN '6'
           WHEN A.cszhzgxdm IN ('弟兄') THEN '7'
           else '8' end cszhzgxdm,
           CASE  WHEN A.cszhzgxdm IN ('父子','母子') THEN '子'
           WHEN A.cszhzgxdm IN ('本人','户主','本人或户主') THEN '本人或户主'
           WHEN A.cszhzgxdm IN ('父女','父女') THEN '女'
           WHEN A.cszhzgxdm IN ('夫妻') THEN '配偶'
           WHEN A.cszhzgxdm IN ('祖父','祖母') THEN '父母'
           WHEN A.cszhzgxdm IN ('外祖父','外祖母') THEN '祖父母或外祖父母'
           WHEN A.cszhzgxdm IN ('弟兄') THEN '兄、弟、姐、妹'
           else '其他' end cszhzgxmc,A.jzlsh
    FROM [HLHT_RYJL_RCYJL] A(nolock)) T ON A.jzlsh =T.jzlsh
  --陈述内容可靠标志
  UPDATE A SET A.csnrbz = 'T'   FROM [HLHT_RYJL_RCYJL] A(nolock)
  --中医“四诊”观察结果
  UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA') FROM [HLHT_RYJL_RCYJL] A(nolock),[HLHT_RYJL_JBXX] C(nolock) WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA'
  --症状描述
   UPDATE A SET A.zzms =A.xbs   FROM [HLHT_RYJL_RCYJL] A(nolock) where CONVERT(varchar,A.zzms) = 'NA'
     WHERE A.zrysqm ='NA' or  A.zrysqm = ''
   --职业类别
   UPDATE A SET A.zylbdm =  '90' FROM [HLHT_RYJL_RCYJL] A(nolock)  WHERE A.zylbdm IS NULL
   UPDATE A SET A.zylbmc = '其他' FROM [HLHT_RYJL_RCYJL] A(nolock)  WHERE A.zylbmc IS NULL
    --接诊医师签名与工号
    UPDATE A SET
    A.jzysqm = (case when C.NAME = '' OR C.NAME IS NULL then 'NA' ELSE ISNULL(C.NAME,'NA') END),
    A.jzysbm = (case when C.ID = '' OR C.ID IS NULL then 'NA' ELSE ISNULL(C.ID,'NA') END)
    FROM [HLHT_RYJL_RCYJL] A(nolock)
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock)  ON A.jzlsh =B.SYXH
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock)  ON B.YSDM =C.ID
    WHERE A.jzysbm ='NA' or A.jzysqm ='NA' or  A.jzysbm ='' or A.jzysqm ='';
    --住院医师签名与工号
    UPDATE A SET
    A.zyysqm = (case when C.NAME = '' OR C.NAME IS NULL then 'NA' ELSE ISNULL(C.NAME,'NA') END),
    A.zyysbm = (case when C.ID = '' OR C.ID IS NULL then 'NA' ELSE ISNULL(C.ID,'NA') END)
    FROM [HLHT_RYJL_RCYJL] A(nolock)
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock)  ON A.jzlsh =B.SYXH
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock)  ON B.YSDM =C.ID
    WHERE A.zyysqm ='NA' or A.zyysbm ='NA' or  A.zyysqm ='' or A.zyysbm ='';
    --主治医师签名与工号
    UPDATE A SET
    A.zzysqm = (case when C.NAME = '' OR C.NAME IS NULL then 'NA' ELSE ISNULL(C.NAME,'NA') END),
    A.zzysbm = (case when C.ID = '' OR C.ID IS NULL then 'NA' ELSE ISNULL(C.ID,'NA') END)
    FROM [HLHT_RYJL_RCYJL] A(nolock)
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock)  ON A.jzlsh =B.SYXH
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock)  ON B.ZZYSDM =C.ID
    WHERE A.zzysqm ='NA' or A.zzysbm ='NA' or  A.zzysqm ='' or A.zzysbm ='';
    --主任医师签名与工号
    UPDATE A SET
    A.zrysqm = (case when C.NAME = '' OR C.NAME IS NULL then 'NA' ELSE ISNULL(C.NAME,'NA') END),
    A.zrysbm = (case when C.ID = '' OR C.ID IS NULL then 'NA' ELSE ISNULL(C.ID,'NA') END)
    FROM [HLHT_RYJL_RCYJL] A(nolock)
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock)  ON A.jzlsh =B.SYXH
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock)  ON B.ZRYSDM =C.ID
    WHERE A.zrysqm ='NA' or A.zrysbm ='NA' or  A.zrysqm ='' or A.zrysbm ='';

--24小时内入院死亡记录
  --陈述内容可靠标志
  UPDATE A SET A.csnrbz = 'T'   FROM [HLHT_RYJL_RYSWJL] A(nolock)
  --陈述者关系
  UPDATE A SET A.cszhzgxdm= T.cszhzgxdm,A.cszhzgxmc = T.cszhzgxmc FROM [HLHT_RYJL_RYSWJL] A(nolock)
    LEFT JOIN (
                SELECT CASE  WHEN A.cszhzgxdm IN ('父子','母子') THEN '2'
                     WHEN A.cszhzgxdm IN ('本人','户主','本人或户主') THEN '0'
                     WHEN A.cszhzgxdm IN ('父女','父女') THEN '3'
                     WHEN A.cszhzgxdm IN ('夫妻') THEN '1'
                     WHEN A.cszhzgxdm IN ('祖父','祖母') THEN '5'
                     WHEN A.cszhzgxdm IN ('外祖父','外祖母') THEN '6'
                     WHEN A.cszhzgxdm IN ('弟兄') THEN '7'
                     else '8' end cszhzgxdm,
                     CASE  WHEN A.cszhzgxdm IN ('父子','母子') THEN '子'
                     WHEN A.cszhzgxdm IN ('本人','户主','本人或户主') THEN '本人或户主'
                     WHEN A.cszhzgxdm IN ('父女','父女') THEN '女'
                     WHEN A.cszhzgxdm IN ('夫妻') THEN '配偶'
                     WHEN A.cszhzgxdm IN ('祖父','祖母') THEN '父母'
                     WHEN A.cszhzgxdm IN ('外祖父','外祖母') THEN '祖父母或外祖父母'
                     WHEN A.cszhzgxdm IN ('弟兄') THEN '兄、弟、姐、妹'
                     else '其他' end cszhzgxmc,A.jzlsh
                FROM [HLHT_RYJL_RYSWJL] A(nolock)) T ON A.jzlsh =T.jzlsh
  --中医“四诊”观察结果
  UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA') FROM [HLHT_RYJL_RYSWJL] A(nolock),[HLHT_RYJL_JBXX] C(nolock) WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA';
 --接诊医师签名与工号
    UPDATE A SET
    A.jzysqm = (case when C.NAME = '' OR C.NAME IS NULL then 'NA' ELSE ISNULL(C.NAME,'NA') END),
    A.jzysbm = (case when C.ID = '' OR C.ID IS NULL then 'NA' ELSE ISNULL(C.ID,'NA') END)
    FROM [HLHT_RYJL_RYSWJL] A(nolock)
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock)  ON A.jzlsh =B.SYXH
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock)  ON B.YSDM =C.ID
    WHERE A.jzysbm ='NA' or A.jzysqm ='NA' or  A.jzysbm ='' or A.jzysqm ='';
    --住院医师签名与工号
    UPDATE A SET
    A.zyysqm = (case when C.NAME = '' OR C.NAME IS NULL then 'NA' ELSE ISNULL(C.NAME,'NA') END),
    A.zyysbm = (case when C.ID = '' OR C.ID IS NULL then 'NA' ELSE ISNULL(C.ID,'NA') END)
    FROM [HLHT_RYJL_RYSWJL] A(nolock)
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock)  ON A.jzlsh =B.SYXH
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock)  ON B.YSDM =C.ID
    WHERE A.zyysqm ='NA' or A.zyysbm ='NA' or  A.zyysqm ='' or A.zyysbm ='';
    --主治医师签名与工号
    UPDATE A SET
    A.zzysqm = (case when C.NAME = '' OR C.NAME IS NULL then 'NA' ELSE ISNULL(C.NAME,'NA') END),
    A.zzysbm = (case when C.ID = '' OR C.ID IS NULL then 'NA' ELSE ISNULL(C.ID,'NA') END)
    FROM [HLHT_RYJL_RYSWJL] A(nolock)
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock)  ON A.jzlsh =B.SYXH
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock)  ON B.ZZYSDM =C.ID
    WHERE A.zzysqm ='NA' or A.zzysbm ='NA' or  A.zzysqm ='' or A.zzysbm ='';
    --主任医师签名与工号
    UPDATE A SET
    A.zrysqm = (case when C.NAME = '' OR C.NAME IS NULL then 'NA' ELSE ISNULL(C.NAME,'NA') END),
    A.zrysbm = (case when C.ID = '' OR C.ID IS NULL then 'NA' ELSE ISNULL(C.ID,'NA') END)
    FROM [HLHT_RYJL_RYSWJL] A(nolock)
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock)  ON A.jzlsh =B.SYXH
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock)  ON B.ZRYSDM =C.ID
    WHERE A.zrysqm ='NA' or A.zrysbm ='NA' or  A.zrysqm ='' or A.zrysbm ='';


--术后首次病程记录
  --接诊开始日期
  UPDATE A SET A.jzkssj =
  CASE WHEN B.RYRQ IS NULL THEN CONVERT(DATE,'1990-01-01 00:00:00') ELSE
    CONVERT(datetime,substring(B.RYRQ,1,4)+'-'+substring(B.RYRQ,5,2)+'-'+substring(B.RYRQ,7,2)+' '+substring(B.RYRQ,9,2)+':'+substring(B.RYRQ,12,2)+':'+substring(B.RYRQ,15,2)) END  FROM [HLHT_ZYBCJL_SHSCBCJL] A(nolock) LEFT JOIN  [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh = B.SYXH WHERE A.jzkssj = CONVERT(DATE,'1990-01-01 00:00:00')
  --接诊结束日期
  UPDATE A SET A.jzjssj =
  CASE WHEN B.CYRQ IS NULL THEN  CONVERT(DATE,'1990-01-01 00:00:00') ELSE
    CONVERT(datetime,substring(B.CYRQ,1,4)+'-'+substring(B.CYRQ,5,2)+'-'+substring(B.CYRQ,7,2)+' '+substring(B.CYRQ,9,2)+':'+substring(B.CYRQ,12,2)+':'+substring(B.CYRQ,15,2)) END  FROM [HLHT_ZYBCJL_SHSCBCJL] A(nolock) LEFT JOIN  [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh = B.SYXH WHERE A.jzjssj = CONVERT(DATE,'1990-01-01 00:00:00')

--特殊检查及特殊治疗同意书
  --疾病诊断
   UPDATE QT SET QT.jbzd = CT.MC, QT.jbzdbm = CT.DM FROM [HLHT_ZQGZXX_TSJCZLTYS] QT(nolock)
   LEFT JOIN (
    SELECT
    stuff((SELECT ','+C.ZDDM  FROM  [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] B(nolock)
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRZDQK] C ON B.SYXH = C.SYXH AND C.ZDLB = 1 WHERE B.HISSYXH = A.jzlsh FOR XML PATH('')),1,1,'') DM,
    stuff((SELECT ','+C.ZDMC  FROM  [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] B(nolock)
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRZDQK] C(nolock) ON B.SYXH = C.SYXH AND C.ZDLB = 1 WHERE B.HISSYXH = A.jzlsh FOR XML PATH('')),1,1,'') MC,
    A.yjlxh
    FROM [HLHT_ZQGZXX_TSJCZLTYS] A(nolock)) CT ON QT.yjlxh = CT.yjlxh WHERE  ( CONVERT(varchar,QT.jbzd) ='NA' OR CONVERT(varchar,QT.jbzdbm) ='NA' )
  --医生信息
  UPDATE A SET A.ysbm = ISNULL(C.ID,'NA'),A.ysqm = ISNULL(C.NAME,'NA')
  FROM [HLHT_ZQGZXX_TSJCZLTYS] A(nolock)
  LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
  LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock)  ON B.YSDM =C.ID
  WHERE (A.ysbm ='NA' or A.ysqm = 'NA')

--上级医师查房记录
	--医嘱内容
	UPDATE A SET A.yznr = ISNULL(
	(SELECT LEFT(t.YPMC,LEN(t.YPMC)-1) as YPMC  FROM
	(SELECT (SELECT YPMC+',' FROM [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_LSYZK] B(nolock)
	WHERE B.SYXH=A.jzlsh FOR XML PATH('') ) AS YPMC ) t),'NA')
	FROM [HLHT_ZYBCJL_SJYSCFJL] A(nolock) WHERE CONVERT(varchar,A.yznr) ='NA'
	--中医四诊
	UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA') FROM [HLHT_ZYBCJL_SJYSCFJL] A(nolock),[HLHT_RYJL_JBXX] C(nolock) WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA'
	--上级医师查房 主治医生
  UPDATE A SET A.zzysbm =
  CASE WHEN C.ID = '' OR C.ID IS NULL THEN 'NA' ELSE ISNULL(C.ID,'NA') end,
  A.zzysqm = CASE WHEN C.ID = '' OR C.ID IS NULL  THEN 'NA' ELSE ISNULL(C.NAME,'NA') end
  from [HLHT_ZYBCJL_SJYSCFJL] A
  LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
  LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock) ON B.ZZYSDM =C.ID
  WHERE (A.zzysbm ='NA' OR A.zzysqm = 'NA');

  --上级医师查房 记录人
  UPDATE A SET A.jlrbm =
  CASE WHEN C.ID = '' OR C.ID IS NULL THEN 'NA' ELSE ISNULL(C.ID,'NA') end,
  A.jlrqm = CASE WHEN C.ID = '' OR C.ID IS NULL  THEN 'NA' ELSE ISNULL(C.NAME,'NA') end
  from [HLHT_ZYBCJL_SJYSCFJL] A
  LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
  LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock) ON B.YSDM =C.ID
  WHERE (A.jlrbm ='NA' OR A.jlrqm = 'NA');

  --上级医师查房 主任医师
  UPDATE A SET A.zrysbm =
  CASE WHEN C.ID = '' OR C.ID IS NULL THEN 'NA' ELSE ISNULL(C.ID,'NA') end,
  A.zrysqm = CASE WHEN C.ID = '' OR C.ID IS NULL  THEN 'NA' ELSE ISNULL(C.NAME,'NA') end
  from [HLHT_ZYBCJL_SJYSCFJL] A
  LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
  LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock) ON B.ZRYSDM =C.ID
  WHERE (A.zrysbm ='NA' OR A.zrysqm = 'NA');



--术前小结
  --从病人诊断中获取诊断依据编码和诊断依据
  UPDATE A SET A.zdyj = isnull(C.ZDMC,'NA'),A.zdyjdm = ISNULL(C.ZDDM,'NA')
  FROM [HLHT_ZYBCJL_SQXJ] A(nolock) LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] B(nolock) ON A.jzlsh =B.HISSYXH
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRZDQK] C ON B.SYXH = C.SYXH AND C.ZDLB = 1
  WHERE  ( CONVERT(varchar,A.zdyj) ='NA' OR CONVERT(varchar,A.zdyjdm) ='NA' )
  --从入院信息获取过敏史数据处理
  UPDATE A SET A.gmsbz ='F' FROM [HLHT_ZYBCJL_SQXJ] A(nolock) left join [HLHT_RYJL_JBXX] B(nolock)  on  A.jzlsh =B.jzlsh where A.gmsbz='NA' and (B.gms is null OR CHARINDEX('否认',convert(varchar,B.gms)) > 0)
  UPDATE A SET A.gmsbz ='T' FROM [HLHT_ZYBCJL_SQXJ] A(nolock) left join [HLHT_RYJL_JBXX] B(nolock)  ON  A.jzlsh =B.jzlsh where A.gmsbz='NA' and B.gms is not null and CHARINDEX('否认',convert(varchar,B.gms)) = 0
  UPDATE A SET A.gms =B.gms FROM [HLHT_ZYBCJL_SQXJ] A(nolock) left join [HLHT_RYJL_JBXX] B(nolock)  ON A.jzlsh =B.jzlsh where CONVERT(VARCHAR,A.gms) ='NA'
  --取手术小结手术指征赋值给手术适应症
  UPDATE A SET A.sssyz = CASE WHEN sszz = 'NA' THEN 'NA' else sszz END  FROM [HLHT_ZYBCJL_SQXJ] A(nolock)  WHERE A.sssyz = 'NA'
  --会诊意见 存在则取会诊意见，反之为无
  UPDATE A SET A.hzyj = CASE WHEN CONVERT(VARCHAR,B.hzyj) = 'NA' THEN 'NA'  WHEN B.hzyj IS NULL THEN 'NA'  else B.hzyj END
  FROM [HLHT_ZYBCJL_SQXJ] A(nolock) LEFT JOIN  [HLHT_ZYBCJL_HZJL] B(nolock) ON A.jzlsh =B.jzlsh WHERE CONVERT(VARCHAR,A.hzyj)='NA'
  --手术者
  UPDATE A SET A.sszbm = CASE WHEN C.id IS NULL THEN 'NA' ELSE C.id END,A.sszqm = CASE WHEN C.name IS NULL THEN 'NA' ELSE C.name END
  FROM [HLHT_ZYBCJL_SQXJ] A(nolock) left join [HLHT_ZY_HIS].[THIS4].[dbo].[SS_SSDJK] B(nolock) ON A.jzlsh = B.syxh
    LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[czryk] C(nolock) ON B.ysdm =C.id WHERE (A.sszbm = 'NA' OR A.sszqm ='NA')
  --医师信息
  UPDATE A SET A.ysqm = (case when C.NAME = '' OR C.NAME IS NULL then 'NA' ELSE ISNULL(C.NAME,'NA') END),
  A.ysbm = (case when C.ID = '' OR C.ID IS NULL then 'NA' ELSE ISNULL(C.ID,'NA') END)
  FROM [HLHT_ZYBCJL_SQXJ] A(nolock)
  LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
  LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock) ON B.YSDM =C.ID
  WHERE A.ysqm ='NA' or A.ysbm ='NA';

-- 死亡病例讨论记录
 --参加讨论人员工号
 UPDATE A SET A.tlrybm=isnull(T.dm,'NA') FROM [HLHT_ZYBCJL_SWBLTLJL] A(nolock) LEFT JOIN (
 SELECT  stuff((select ',' + rtrim(A.ID) from [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] A(nolock) where A.NAME in
 (select * from f_splitSTR(C.cjtlmd,'、')) for xml path('')),1,1,'') as dm,
    C.yjlxh    from [HLHT_ZYBCJL_SWBLTLJL] C(nolock)) T ON A.yjlxh = T.yjlxh WHERE A.tlrybm != 'NA'
  --专业技术职务类别代码/名称
  UPDATE D SET D.zyzwlbdm = CASE WHEN F.dm = '' THEN 'NA' ELSE ISNULL(F.dm,'NA') END ,D.zyzwlbmc = CASE WHEN F.mc = '' THEN 'NA' ELSE  ISNULL(F.mc,'NA') END  FROM [HLHT_ZYBCJL_SWBLTLJL] D(nolock) LEFT JOIN (
    SELECT  stuff((select ',' + A.ZCDM from [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] A(nolock) where A.ID in (select * from f_splitSTR(C.tlrybm,',')) for xml path('')),1,1,'') as dm,
    stuff((select ',' + B.ZCMC from [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] B(nolock) where B.ID in (select * from f_splitSTR(C.tlrybm,',')) for xml path('')),1,1,'')  as mc,
    C.yjlxh    from [HLHT_ZYBCJL_SWBLTLJL] C(nolock) ) F ON D.yjlxh = F.yjlxh where (D.zyzwlbdm = 'NA' OR D.zyzwlbmc='NA')
  --主治医师
  UPDATE A SET
  A.zzysbm = CASE WHEN C.ID = '' OR C.ID IS NULL  THEN 'NA' ELSE ISNULL(C.ID,'NA') end ,
  A.zzysqm = CASE WHEN C.NAME = '' OR C.NAME IS NULL  THEN 'NA' ELSE ISNULL(C.NAME,'NA') end
  FROM [HLHT_ZYBCJL_SWBLTLJL] A(nolock)
  LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
  LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock) ON B.ZZYSDM =C.ID
  WHERE (A.zzysbm ='NA' OR A.zzysqm = 'NA')
  --主任医师
  UPDATE A SET
  A.zrysbm = CASE WHEN C.ID = '' OR C.ID IS NULL  THEN 'NA' ELSE ISNULL(C.ID,'NA') end ,
  A.zrysqm = CASE WHEN C.NAME = '' OR C.NAME IS NULL  THEN 'NA' ELSE ISNULL(C.NAME,'NA') end
  FROM [HLHT_ZYBCJL_SWBLTLJL] A(nolock)
  LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
  LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock) ON B.ZZYSDM =C.ID
  WHERE (A.zrysbm ='NA' OR A.zrysqm = 'NA')
  --讨论地点编码
  UPDATE A SET A.tldddm ='1'  FROM  [HLHT_ZYBCJL_SWBLTLJL] A WHERE CHARINDEX('科',A.tldd) > 0
  UPDATE A SET A.tldddm ='2'  FROM  [HLHT_ZYBCJL_SWBLTLJL] A WHERE CHARINDEX('病房',A.tldd) > 0
  UPDATE A SET A.tldddm ='9'  FROM  [HLHT_ZYBCJL_SWBLTLJL] A WHERE CHARINDEX('病房',A.tldd) = 0 AND CHARINDEX('科',A.tldd) = 0

-- 手术同意书/[HLHT_ZQGZXX_SSTYS]
  --手术方式
    UPDATE A SET A.ssfs = ISNULL(B.ssmc,'NA')  FROM [HLHT_ZQGZXX_SSTYS] A(nolock)
    LEFT JOIN [HLHT_ZLCZJL_YBSSJL] B(nolock) ON A.jzlsh =B.jzlsh WHERE A.ssfs ='NA'
  --拟实施麻醉方法代码  拟实施麻醉方法名称
    UPDATE A SET A.nmzdm = ISNULL(B.MZDM,'NA') ,
    A.nmzffmc = ISNULL(B.MZMC,'NA') FROM
    [HLHT_ZQGZXX_SSTYS] A(nolock)
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_SSYZK] B(nolock) ON A.jzlsh = B.SYXH
    WHERE (A.nmzdm = 'NA' OR A.nmzffmc='NA')
  --经治医师/责任医生
    UPDATE A SET
    A.jzysdm = CASE WHEN C.ID = '' OR C.ID IS NULL  THEN 'NA' ELSE ISNULL(C.ID,'NA') end ,
    A.jzysqm = CASE WHEN C.NAME = '' OR C.NAME IS NULL  THEN 'NA' ELSE ISNULL(C.NAME,'NA') end
    FROM [HLHT_ZQGZXX_SSTYS] A(nolock)
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock) ON B.ZZYSDM =C.ID
    WHERE (A.jzysdm ='NA' or A.jzysqm = 'NA')
  --责任医生
    UPDATE A SET
    A.zrysdm = CASE WHEN C.ID = '' OR C.ID IS NULL  THEN 'NA' ELSE ISNULL(C.ID,'NA') end ,
    A.zrysxm = CASE WHEN C.NAME = '' OR C.NAME IS NULL  THEN 'NA' ELSE ISNULL(C.NAME,'NA') end
    FROM [HLHT_ZQGZXX_SSTYS] A(nolock)
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock) ON B.ZZYSDM =C.ID
    WHERE (A.zrysdm ='NA' or A.zrysxm = 'NA')
	--患者签名
    UPDATE A SET A.hzqm = ISNULL(A.hzxm,'NA')
    FROM [HLHT_ZQGZXX_SSTYS] A(nolock)  WHERE (A.hzqm ='NA')
