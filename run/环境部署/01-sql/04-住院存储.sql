create PROCEDURE usp_his5_hlht_tsdata_zy
as
--EMR_BRZDQK ZDLB(0:门诊诊断 1:入院诊断 2:出院诊断 3:中医入院诊断 4:中医出院诊断 5:修正诊断 6:最终诊断 7:初步诊断)

------病危重通知书--------------------------------------------------------------------------------------------------
Update A Set A.mjzh='NA' from [HLHT_ZQGZXX_BWZTZS] A(nolock) where A.mjzh='';
Update A Set A.dlrqm='' from [HLHT_ZQGZXX_BWZTZS] A(nolock) where A.dlrqm='N';
--------------------------------------------------------------------------------------------------------------------

------入院记录------------------------------------------------------------------------------------------------------
--UPDATE [HLHT_RYJL_JBXX] SET dzc='无' WHERE CONVERT(varchar,dzc) ='N';
--UPDATE [HLHT_RYJL_JBXX] SET dzmphm='无' WHERE CONVERT(varchar,dzmphm) ='N' ;
--UPDATE [HLHT_RYJL_JBXX] SET zyszgcjg='无' WHERE CONVERT(varchar,zyszgcjg)='N' ;
--UPDATE [HLHT_RYJL_JBXX] SET zfbm='无' WHERE CONVERT(varchar,zfbm)='N' ;
--UPDATE [HLHT_RYJL_JBXX] SET zzzf='无' WHERE CONVERT(varchar,zzzf)='N' ;
--诊断
UPDATE t
SET
--修正诊断
t.xzxyzdbm = (CASE WHEN t.xzxyzdbm = 'NA' AND c.czxyzdbm IS NOT NULL THEN c.czxyzdbm
	ELSE t.xzxyzdbm
	END
),
 t.xzxyzdmc = (CASE WHEN t.xzxyzdmc = 'NA' AND c.czxyzdmc IS NOT NULL THEN c.czxyzdmc
	ELSE t.xzxyzdmc
	END
),
 t.xzzybmdm = (CASE WHEN t.xzzybmdm = 'NA' AND c.czzybmdm IS NOT NULL THEN c.czzybmdm
	ELSE t.xzzybmdm
	END
),
 t.xzzybmmc = (CASE WHEN t.xzzybmmc = 'NA' AND c.czzybmdm IS NOT NULL THEN c.czzybmdm
	ELSE t.xzzybmmc
	END
),
 t.xzzyzhdm = (CASE WHEN t.xzzyzhdm = 'NA' AND c.czzyzhdm IS NOT NULL THEN c.czzyzhdm
	ELSE t.xzzyzhdm
	END
),
 t.xzzyzhmc = (CASE WHEN t.xzzyzhmc = 'NA' AND c.czzyzhmc IS NOT NULL THEN c.czzyzhmc
	ELSE t.xzzyzhmc
	END
),
 t.xzzdrq = (CASE WHEN t.xzzdrq = '1990-01-01' THEN CONVERT(DATE,GETDATE())
	ELSE t.xzzdrq
	END
),
 --确定诊断
t.qzxyzdbm = (CASE WHEN t.qzxyzdbm = 'NA' AND c.czxyzdbm IS NOT NULL AND c.czxyzdbm != 'NA' THEN c.czxyzdbm
	ELSE
		(CASE WHEN t.qzxyzdbm = 'NA' AND t.xzxyzdbm != 'NA' THEN t.xzxyzdbm
			WHEN t.qzxyzdbm = 'NA' AND t.xzxyzdbm = 'NA' THEN t.czxyzdbm
			ELSE t.qzxyzdbm
			END
		)
	END
),
 t.qzxyzdmc = (CASE WHEN t.qzxyzdmc = 'NA' AND c.czxyzdmc IS NOT NULL AND c.czxyzdmc != 'NA' THEN c.czxyzdmc
	ELSE
		(CASE WHEN t.qzxyzdmc = 'NA' AND t.xzxyzdmc != 'NA' THEN t.xzxyzdmc
			WHEN t.qzxyzdmc = 'NA' AND t.xzxyzdmc = 'NA' THEN t.czxyzdmc
			ELSE t.qzxyzdmc
			END
		)
	END
),
 t.qzzybmdm = (CASE WHEN t.qzzybmdm = 'NA' AND c.czzybmdm IS NOT NULL AND c.czzybmdm != 'NA' THEN c.czzybmdm
	ELSE
		(CASE WHEN t.qzzybmdm = 'NA' AND t.xzzybmdm != 'NA' THEN t.xzzybmdm
			WHEN t.qzzybmdm = 'NA' AND t.xzzybmdm = 'NA' THEN t.czzybmdm
			ELSE t.qzzybmdm
			END
		)
	END
),
 t.qzzybmmc = (CASE WHEN t.qzzybmmc = 'NA' AND c.czzybmdm IS NOT NULL AND c.czzybmdm != 'NA' THEN c.czzybmdm
	ELSE
		(CASE WHEN t.qzzybmmc = 'NA' AND t.xzzybmmc != 'NA' THEN t.xzzybmmc
			WHEN t.qzzybmmc = 'NA' AND t.xzzybmmc = 'NA' THEN t.czzybmmc
			ELSE t.qzzybmmc
			END
		)
	END
),
 t.qzzyzhdm = (CASE WHEN t.qzzyzhdm = 'NA' AND c.czzyzhdm IS NOT NULL AND c.czzyzhdm != 'NA' THEN c.czzyzhdm
	ELSE
		(CASE WHEN t.qzzyzhdm = 'NA' AND t.xzzyzhdm != 'NA' THEN t.xzzyzhdm
			WHEN t.qzzyzhdm = 'NA' AND t.xzzyzhdm = 'NA' THEN t.czzyzhdm
			ELSE t.qzzyzhdm
			END
		)
	END
),
 t.qzzyzhmc = (CASE WHEN t.qzzyzhmc = 'NA' AND c.czzyzhmc IS NOT NULL AND c.czzyzhmc != 'NA' THEN c.czzyzhmc
	ELSE
		(CASE WHEN t.qzzyzhmc = 'NA' AND t.xzzyzhmc != 'NA' THEN t.xzzyzhmc
			WHEN t.qzzyzhmc = 'NA' AND t.xzzyzhmc = 'NA' THEN t.czzyzhmc
			ELSE t.qzzyzhmc
			END
		)
	END
),
t.qzrq = (CASE WHEN t.qzrq = '1990-01-01' THEN CONVERT(DATE,GETDATE())
	ELSE t.qzrq
	END
)
FROM
	[HLHT_RYJL_JBXX] t(nolock)
LEFT JOIN [HLHT_ZYBCJL_CYJL] c(nolock) ON t.patid = c.patid;
--住院医师编码--住院医师签名
--UPDATE A SET A.zyysbm = ISNULL(B.YSDM,'NA') FROM [HLHT_RYJL_JBXX] A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B ON A.jzlsh =B.SYXH WHERE A.zyysbm ='NA';
--UPDATE A SET A.zyysqm = ISNULL(B.YSXM,'NA') FROM [HLHT_RYJL_JBXX] A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B ON A.jzlsh =B.SYXH WHERE A.zyysqm ='NA';
UPDATE A
SET
A.zyysqm = (case when C.NAME = '' OR C.NAME IS NULL then 'NA' ELSE ISNULL(C.NAME,'NA') END),
A.zyysbm = (case when C.ID = '' OR C.ID IS NULL then 'NA' ELSE ISNULL(C.ID,'NA') END)
FROM [HLHT_RYJL_JBXX] A(nolock)
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock) ON B.YSDM =C.ID
WHERE A.zyysqm ='NA' or A.zyysbm ='NA';
--接诊医师编码、接诊医师签名
--UPDATE A SET A.jzysbm = ISNULL(B.YSDM,'NA'),A.jzysqm = ISNULL(B.YSXM,'NA')  FROM [HLHT_RYJL_JBXX] A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B ON A.jzlsh =B.SYXH WHERE (A.jzysbm ='N' or A.jzysqm = 'NA');
UPDATE A
SET
A.jzysqm = (case when C.NAME = '' OR C.NAME IS NULL then 'NA' ELSE ISNULL(C.NAME,'NA') END),
A.jzysbm = (case when C.ID = '' OR C.ID IS NULL then 'NA' ELSE ISNULL(C.ID,'NA') END)
FROM [HLHT_RYJL_JBXX] A(nolock)
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock) ON B.YSDM =C.ID
WHERE A.jzysqm ='NA' or A.jzysbm ='NA';
--一般健康标志
UPDATE t SET t.ybjkbz = ( CASE
	WHEN PATINDEX('%一般%', t.ybjkbz) > 0 THEN 'T'
	WHEN PATINDEX('%良好%', t.ybjkbz) > 0 THEN 'T'
	WHEN PATINDEX('%差%', t.ybjkbz) > 0 THEN 'F'
	ELSE 'T'
	END
) FROM [HLHT_RYJL_JBXX] t(nolock);
--患者传染性标志
UPDATE t SET t.hzcrbz = ( CASE
	WHEN PATINDEX('%否%', t.hzcrbz) > 0 THEN 'F'
	WHEN PATINDEX('%有%', t.hzcrbz) > 0 THEN 'T'
	ELSE 'F'
	END
) FROM [HLHT_RYJL_JBXX] t(nolock);
--陈述内容可靠标志
UPDATE t SET t.csnrbz = ( CASE
	WHEN PATINDEX('%不%', t.csnrbz) > 0 THEN 'F'
	ELSE 'T'
	END
) FROM [HLHT_RYJL_JBXX] t(nolock);
--------------------------------------------------------------------------------------------------------------------

------出院记录------------------------------------------------------------------------------------------------------
--中医“四诊”观察结果
UPDATE A SET A.zyszjcjg =isnull(C.zyszgcjg,'NA')
FROM [HLHT_ZYBCJL_CYJL] A(nolock),[HLHT_RYJL_JBXX] C(nolock)
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszjcjg) ='NA';
--住院医师签名
--UPDATE A SET A.zyysqm = ISNULL(B.YSXM,'NA') FROM HLHT_ZYBCJL_CYJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B ON A.jzlsh =B.SYXH WHERE A.zyysqm ='NA';
UPDATE A
SET
A.zyysqm = (case when C.NAME = '' OR C.NAME IS NULL then 'NA' ELSE ISNULL(C.NAME,'NA') END)
FROM [HLHT_ZYBCJL_CYJL] A(nolock)
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock) ON B.YSDM =C.ID
WHERE A.zyysqm ='NA'or A.zyysqm ='';
--主治医师签名
--UPDATE A SET A.zzysqm = ISNULL(B.ZZYSXM,'NA') FROM HLHT_ZYBCJL_CYJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B ON A.jzlsh =B.SYXH WHERE A.zzysqm ='NA';
UPDATE A
SET
A.zzysqm = CASE WHEN C.ID = '' OR C.ID IS NULL  THEN 'NA' ELSE ISNULL(C.NAME,'NA') end
from [HLHT_ZYBCJL_CYJL] A(nolock)
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock) ON B.ZZYSDM =C.ID
WHERE (A.zzysqm ='NA' OR A.zzysqm = '');
--主任医师工号--主任医师签名
--UPDATE A SET A.zrysbm = ISNULL(B.ZRYSDM,'NA') FROM HLHT_ZYBCJL_CYJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B ON A.jzlsh =B.SYXH WHERE A.zrysbm ='NA';
--UPDATE A SET A.zrysqm = ISNULL(B.ZRYSXM,'NA') FROM HLHT_ZYBCJL_CYJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B ON A.jzlsh =B.SYXH WHERE A.zrysqm ='NA';
UPDATE A
SET
A.zrysqm = (case when C.NAME = '' OR C.NAME IS NULL then 'NA' ELSE ISNULL(C.NAME,'NA') END),
A.zrysbm = (case when C.ID = '' OR C.ID IS NULL then 'NA' ELSE ISNULL(C.ID,'NA') END)
FROM [HLHT_ZYBCJL_CYJL] A(nolock)
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock) ON B.ZRYSDM =C.ID
WHERE A.zrysbm ='NA' or A.zrysqm ='NA';
--------------------------------------------------------------------------------------------------------------------

------日常病程记录------------------------------------------------------------------------------------------------------
--中医“四诊”观察结果
UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA')
FROM [HLHT_ZYBCJL_RCBCJL] A(nolock),[HLHT_RYJL_JBXX] C(nolock)
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA';
--医生编码--医生姓名
UPDATE A SET A.ysqm = (case when C.NAME = '' OR C.NAME IS NULL then 'NA' ELSE ISNULL(C.NAME,'NA') END),
A.ysbm = (case when C.ID = '' OR C.ID IS NULL then 'NA' ELSE ISNULL(C.ID,'NA') END)
FROM [HLHT_ZYBCJL_RCBCJL] A(nolock)
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock) ON B.YSDM =C.ID
WHERE A.ysqm ='NA' or A.ysbm ='NA';
--专业技术职务类别代码
UPDATE A SET A.zyzwlbdm = ISNULL(B.ZCDM,'NA') FROM [HLHT_ZYBCJL_RCBCJL] A(nolock) LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] B(nolock) ON A.ysbm =B.ID WHERE A.zyzwlbdm ='NA';
--专业技术职务类别名称
UPDATE A SET A.zyzwlbmc = ISNULL(B.ZCMC,'NA') FROM [HLHT_ZYBCJL_RCBCJL] A(nolock) LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] B(nolock) ON A.ysbm =B.ID WHERE A.zyzwlbmc ='NA';
--医生姓名
--UPDATE A SET A.ysqm = ISNULL(B.NAME,'NA') FROM HLHT_ZYBCJL_RCBCJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] B ON A.ysbm =B.ID WHERE A.ysqm ='NA';
--医嘱内容
UPDATE A SET A.yznr = ISNULL((SELECT LEFT(t.YPMC,LEN(t.YPMC)-1) as YPMC  FROM (SELECT (SELECT
	B.YPMC+','
FROM
[HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_LSYZK] B(nolock) WHERE B.SYXH=A.jzlsh
FOR XML PATH('') ) AS YPMC ) t),'NA') FROM [HLHT_ZYBCJL_RCBCJL] A(nolock) WHERE CONVERT(varchar,A.yznr) ='NA';
--辨证论治详细描述
UPDATE A SET A.bzlzms =isnull(C.bzfx,'NA')
FROM [HLHT_ZYBCJL_RCBCJL] A(nolock),[HLHT_RYJL_JBXX] C(nolock)
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.bzlzms) ='NA';
--------------------------------------------------------------------------------------------------------------------

------死亡记录------------------------------------------------------------------------------------------------------
UPDATE [HLHT_ZYBCJL_SWJL] SET jstysjbz='F' WHERE CONVERT(varchar,jstysjbz) ='NA';
--住院医师工号--住院医师签名
--UPDATE A SET A.zyysbm = ISNULL(B.YSDM,'NA') FROM HLHT_ZYBCJL_SWJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B ON A.jzlsh =B.SYXH WHERE A.zyysbm ='NA';
--UPDATE A SET A.zyysqm = ISNULL(B.YSXM,'NA') FROM HLHT_ZYBCJL_SWJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B ON A.jzlsh =B.SYXH WHERE A.zyysqm ='NA';
UPDATE A
SET
A.zyysqm = (case when C.NAME = '' OR C.NAME IS NULL then 'NA' ELSE ISNULL(C.NAME,'NA') END),
A.zyysbm = (case when C.ID = '' OR C.ID IS NULL then 'NA' ELSE ISNULL(C.ID,'NA') END)
FROM [HLHT_ZYBCJL_SWJL] A(nolock)
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock) ON B.YSDM =C.ID
WHERE A.zyysqm ='NA' or A.zyysbm ='NA';
--主治医师工号--主治医师签名
--UPDATE A SET A.zzysbm = ISNULL(B.ZZYSDM,'NA') FROM HLHT_ZYBCJL_SWJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B ON A.jzlsh =B.SYXH WHERE A.zzysbm ='NA';
--UPDATE A SET A.zzysqm = (case when ISNULL(B.ZZYSXM,'NA') ='' then 'NA' ELSE ISNULL(B.ZZYSXM,'NA') END) FROM HLHT_ZYBCJL_SWJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B ON A.jzlsh =B.SYXH WHERE A.zzysqm ='NA' or A.zzysqm ='';
UPDATE A
SET
A.zzysbm =CASE WHEN C.ID = '' OR C.ID IS NULL THEN 'NA' ELSE ISNULL(C.ID,'NA') end,
A.zzysqm = CASE WHEN C.ID = '' OR C.ID IS NULL  THEN 'NA' ELSE ISNULL(C.NAME,'NA') end
from [HLHT_ZYBCJL_SWJL] A(nolock)
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock) ON B.ZZYSDM =C.ID
WHERE (A.zzysbm ='NA' OR A.zzysqm = 'NA');
--主任医师工号--主任医师签名
--UPDATE A SET A.zrysbm = ISNULL(B.ZRYSDM,'NA') FROM HLHT_ZYBCJL_SWJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B ON A.jzlsh =B.SYXH WHERE A.zrysbm ='NA';
--UPDATE A SET A.zrysqm = (case when ISNULL(B.ZRYSXM,'NA')='' then 'NA' ELSE ISNULL(B.ZRYSXM,'NA') END) FROM HLHT_ZYBCJL_SWJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B ON A.jzlsh =B.SYXH WHERE A.zrysqm ='NA' or A.zrysqm ='';
UPDATE A
SET
A.zrysqm = (case when C.NAME = '' OR C.NAME IS NULL then 'NA' ELSE ISNULL(C.NAME,'NA') END),
A.zrysbm = (case when C.ID = '' OR C.ID IS NULL then 'NA' ELSE ISNULL(C.ID,'NA') END)
FROM [HLHT_ZYBCJL_SWJL] A(nolock)
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock) ON B.ZRYSDM =C.ID
WHERE A.zrysbm ='NA' or A.zrysqm ='NA';
--------------------------------------------------------------------------------------------------------------------

------疑难病例讨论------------------------------------------------------------------------------------------------------
--中医“四诊”观察结果
UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA')
FROM [HLHT_ZYBCJL_YNBLTLJL] A(nolock),[HLHT_RYJL_JBXX] C(nolock)
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA';
--讨论地点代码
UPDATE A SET A.tldddm ='1'  FROM  [HLHT_ZYBCJL_YNBLTLJL] A(nolock) WHERE CHARINDEX('科',A.tldd) > 0
UPDATE A SET A.tldddm ='2'  FROM  [HLHT_ZYBCJL_YNBLTLJL] A(nolock) WHERE CHARINDEX('病房',A.tldd) > 0
UPDATE A SET A.tldddm ='9'  FROM  [HLHT_ZYBCJL_YNBLTLJL] A(nolock) WHERE CHARINDEX('病房',A.tldd) = 0 AND CHARINDEX('科',A.tldd) = 0
--主治医师工号--主治医师签名
--UPDATE A SET A.zzysbm = ISNULL(B.ZZYSDM,'NA') FROM HLHT_ZYBCJL_YNBLTLJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B ON A.jzlsh =B.SYXH WHERE A.zzysbm ='NA' or A.zzysbm ='';
--UPDATE A SET A.zzysqm =(case when ISNULL(B.ZZYSXM,'NA') ='' then 'NA' ELSE ISNULL(B.ZZYSXM,'NA') END) FROM HLHT_ZYBCJL_YNBLTLJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B ON A.jzlsh =B.SYXH WHERE A.zzysqm ='NA' or A.zzysbm ='';
UPDATE A SET A.zzysbm =
CASE WHEN C.ID = '' OR C.ID IS NULL THEN 'NA' ELSE ISNULL(C.ID,'NA') end,
A.zzysqm = CASE WHEN C.ID = '' OR C.ID IS NULL  THEN 'NA' ELSE ISNULL(C.NAME,'NA') end
from [HLHT_ZYBCJL_YNBLTLJL] A(nolock)
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock) ON B.ZZYSDM =C.ID
WHERE (A.zzysbm ='NA' OR A.zzysqm = 'NA');
--主任医师工号--主任医师签名
--UPDATE A SET A.zrysbm = ISNULL(B.ZRYSDM,'NA') FROM HLHT_ZYBCJL_YNBLTLJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B ON A.jzlsh =B.SYXH WHERE A.zrysbm ='NA' or A.zzysbm ='';
--UPDATE A SET A.zrysqm = (case when ISNULL(B.ZRYSXM,'NA')='' then 'NA' ELSE ISNULL(B.ZRYSXM,'NA') END) FROM HLHT_ZYBCJL_YNBLTLJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B ON A.jzlsh =B.SYXH WHERE A.zrysqm ='NA' or A.zrysqm ='';
UPDATE A SET A.zrysqm = (case when C.NAME = '' OR C.NAME IS NULL then 'NA' ELSE ISNULL(C.NAME,'NA') END),
A.zrysbm = (case when C.ID = '' OR C.ID IS NULL then 'NA' ELSE ISNULL(C.ID,'NA') END)
FROM [HLHT_ZYBCJL_YNBLTLJL] A(nolock)
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock) ON B.ZRYSDM =C.ID
WHERE A.zrysbm ='NA' or A.zrysqm ='NA';
--疑难病例讨论 住院医生
UPDATE A SET A.ysqm = (case when C.NAME = '' OR C.NAME IS NULL then 'NA' ELSE ISNULL(C.NAME,'NA') END),
A.ysbm = (case when C.ID = '' OR C.ID IS NULL then 'NA' ELSE ISNULL(C.ID,'NA') END)
FROM [HLHT_ZYBCJL_YNBLTLJL] A(nolock)
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock) ON B.YSDM =C.ID
WHERE A.ysqm ='NA' or A.ysbm ='NA';
--------------------------------------------------------------------------------------------------------------------

------诊疗记录------------------------------------------------------------------------------------------------------
--患者传染性标志
UPDATE t SET t.gmsbz = ( CASE
	WHEN PATINDEX('%有%', t.gms) > 0 THEN 'T'
	ELSE 'F'
	END
) FROM [HLHT_ZLCZJL_ZLJL] t(nolock);
--有创诊疗操作标志
UPDATE t SET t.yczlczbz ='F'
FROM [HLHT_ZLCZJL_ZLJL] t(nolock) WHERE t.yczlczbz='NA'
--操作次数
UPDATE t SET t.czcs = 1
FROM [HLHT_ZLCZJL_ZLJL] t(nolock) WHERE t.czcs=0
--药物代码
UPDATE A SET A.ywdm = T.ywdm FROM [HLHT_ZLCZJL_ZLJL] A(nolock)
LEFT JOIN (SELECT STUFF((SELECT ',' + C.YPDM FROM [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_ORDERITEM] C(nolock)
	WHERE C.CFXH
	IN (SELECT B.XH FROM [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_ORDER] B(nolock) WHERE A.jzlsh = B.GHXH) FOR xml path ('')),1,1,'') AS ywdm,A.yjlxh
	FROM
	[HLHT_ZLCZJL_ZLJL] A(nolock)
) T ON A.yjlxh = T.yjlxh
WHERE A.ywdm = 'NA'
--药物名称
UPDATE A SET A.ywmc = T.ywmc FROM [HLHT_ZLCZJL_ZLJL] A(nolock)
LEFT JOIN (SELECT STUFF((SELECT ',' + C.YPMC FROM [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_ORDERITEM] C(nolock)
	WHERE C.CFXH
	IN (SELECT B.XH FROM [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_ORDER] B(nolock) WHERE A.jzlsh = B.GHXH) FOR xml path ('')),1,1,'') AS ywmc,A.yjlxh
	FROM
	[HLHT_ZLCZJL_ZLJL] A(nolock)
) T ON A.yjlxh = T.yjlxh
WHERE A.ywmc = 'NA'
--药物代码
UPDATE A set A.ywdm=ISNULL(C.YPDM,'NA')
FROM
	[HLHT_ZLCZJL_ZLJL] A(nolock)
LEFT JOIN  [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_CQYZK] C(nolock)  on A.jzlsh = C.SYXH WHERE  C.IDM<>0;
--药物名称
UPDATE A set A.ywmc=ISNULL(C.YPMC,'NA')
FROM
	[HLHT_ZLCZJL_ZLJL] A(nolock)
LEFT JOIN  [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_CQYZK] C(nolock)  on A.jzlsh = C.SYXH WHERE  C.IDM<>0;
--药物用法
UPDATE A set A.ywyf=ISNULL(C.YPYF,'NA')
FROM
	[HLHT_ZLCZJL_ZLJL] A(nolock)
LEFT JOIN  [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_CQYZK] C(nolock)  on A.jzlsh = C.SYXH WHERE  C.IDM<>0;
--中药使用类别代码
UPDATE A set A.zysylb=ISNULL(C.CYYPYF,'NA')
FROM
	[HLHT_ZLCZJL_ZLJL] A(nolock)
LEFT JOIN  [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_ORDER] C(nolock)  on A.jzlsh = C.SYXH;
--中药使用类别名称
UPDATE A set A.zysylbmc=ISNULL(C.CYYFMC,'NA')
FROM
	[HLHT_ZLCZJL_ZLJL] A(nolock)
LEFT JOIN  [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_ORDER] C(nolock)  on A.jzlsh = C.SYXH;
--	药物使用频率
UPDATE A set A.ywsypl=ISNULL(C.PCDM,'NA')
FROM
	[HLHT_ZLCZJL_ZLJL] A(nolock)
LEFT JOIN  [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_CQYZK] C(nolock)  on A.jzlsh = C.SYXH WHERE  C.IDM<>0;
--药物使用频率名称
UPDATE A set A.ywsyplmc=ISNULL(C.PCMC,'NA')
FROM
	[HLHT_ZLCZJL_ZLJL] A(nolock)
LEFT JOIN  [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_CQYZK] C(nolock)  on A.jzlsh = C.SYXH WHERE  C.IDM<>0;
--药物剂型代码
UPDATE A set A.ywjxdm=ISNULL(C.JXDM,'NA')
FROM
	[HLHT_ZLCZJL_ZLJL] A(nolock)
LEFT JOIN  [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_CQYZK] C(nolock)  on A.jzlsh = C.SYXH WHERE  C.IDM<>0;
--药物剂型
UPDATE A set A.ywjx=ISNULL(C.JXMC,'NA')
FROM
	[HLHT_ZLCZJL_ZLJL] A(nolock)
LEFT JOIN  [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_CQYZK] C(nolock)  on A.jzlsh = C.SYXH WHERE  C.IDM<>0;
--药物使用剂量单位
UPDATE A set A.ywsyjldw=ISNULL(C.JLDW,'NA')
FROM
	[HLHT_ZLCZJL_ZLJL] A(nolock)
LEFT JOIN  [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_CQYZK] C(nolock)  on A.jzlsh = C.SYXH WHERE  C.IDM<>0;
--药物使用次剂量
UPDATE A set A.ywsycjl=ISNULL(CONVERT(NUMERIC,C.YPJL),0)
FROM
	[HLHT_ZLCZJL_ZLJL] A(nolock)
LEFT JOIN  [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_CQYZK] C(nolock)  on A.jzlsh = C.SYXH WHERE  C.IDM<>0;
--药物使用总剂量
UPDATE A set A.ywsyzjl=ISNULL(CONVERT(NUMERIC,C.YPJL),0)*ISNULL(CONVERT(NUMERIC,C.PCDM),0)
FROM
	[HLHT_ZLCZJL_ZLJL] A(nolock)
LEFT JOIN  [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_CQYZK] C(nolock)  on A.jzlsh = C.SYXH WHERE  C.IDM<>0;
--ywsytj药物使用途径代码
--ywsytjmc药物使用途径
--今后治疗方案
UPDATE A SET A.jhzlfa =isnull(C.zljh,'NA')
FROM [HLHT_ZLCZJL_ZLJL] A,[HLHT_ZYBCJL_SCBCJL] C
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.jhzlfa) ='NA';
--随访方式代码
UPDATE A SET A.sffsdm ='3'
FROM [HLHT_ZLCZJL_ZLJL] A(nolock)
WHERE CONVERT(varchar,A.sffsdm) ='NA';
--随访方式名称
UPDATE A SET A.sffsmc ='电话'
FROM [HLHT_ZLCZJL_ZLJL] A(nolock)
WHERE CONVERT(varchar,A.sffsmc) ='NA';
--随访日期
--随访周期建议代码
UPDATE A SET A.sfzqjy ='01'
FROM [HLHT_ZLCZJL_ZLJL] A(nolock)
WHERE CONVERT(varchar,A.sfzqjy) ='NA';
--随访周期建议名称
UPDATE A SET A.sfzqjymc ='每2周'
FROM [HLHT_ZLCZJL_ZLJL] A(nolock)
WHERE CONVERT(varchar,A.sfzqjymc) ='NA';
--随访日期
UPDATE A SET A.sfrq =DATEADD(dd,14,C.TJSJ)
FROM [HLHT_ZLCZJL_ZLJL] A(nolock) LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] C(nolock)
ON A.yjlxh =C.QTBLJLXH
--- -----------------------------------------------------------------------------------------------------------------

------输血治疗同意书表------------------------------------------------------------------------------------------------------
--门（急）诊号
UPDATE A SET A.mjzh ='NA' FROM [HLHT_ZQGZXX_SXZLTYS] A(nolock) WHERE A.mjzh =''
--输血品种代码
UPDATE A
SET A.sxpzdm =(CASE WHEN
A.model_code='ecc13c89-87df-4151-b7ad-3142ff4b9321'
or A.model_code='67624f22-e968-4b00-9e45-e6a4a1b81b65'
THEN '3'
WHEN A.model_code='5dd97bd6-7168-4f58-a5fc-24e0c94d08db'
THEN '2'
ELSE A.sxpzdm
END)
FROM [HLHT_ZQGZXX_SXZLTYS] A(nolock) WHERE A.sxpzdm ='NA'
--输血品种名称
UPDATE A
SET A.sxpzmc =(CASE WHEN
A.model_code='ecc13c89-87df-4151-b7ad-3142ff4b9321'
or A.model_code='67624f22-e968-4b00-9e45-e6a4a1b81b65'
THEN '血小板'
WHEN A.model_code='5dd97bd6-7168-4f58-a5fc-24e0c94d08db'
THEN '全血'
ELSE A.sxpzmc
END)
FROM [HLHT_ZQGZXX_SXZLTYS] A(nolock) WHERE A.sxpzmc ='NA'
--输血方式
UPDATE A
SET A.sxfs =(CASE WHEN
A.model_code='ecc13c89-87df-4151-b7ad-3142ff4b9321'
or A.model_code='67624f22-e968-4b00-9e45-e6a4a1b81b65'
THEN '异体输血'
WHEN A.model_code='5dd97bd6-7168-4f58-a5fc-24e0c94d08db'
THEN '自体输血'
ELSE '异体输血'
END)
FROM [HLHT_ZQGZXX_SXZLTYS] A(nolock) WHERE A.sxfs ='NA'
--医疗机构意见
UPDATE A
SET A.yljgyj =(CASE WHEN
A.model_code='ecc13c89-87df-4151-b7ad-3142ff4b9321'
THEN '这是一份有关输血的告知书，目的是告诉您有关Rh阴性患者输注Rh阳性献血员血小板的相关事宜'
WHEN A.model_code='67624f22-e968-4b00-9e45-e6a4a1b81b65'
THEN '这是一份有关输血的告知书，目的是告诉您有关Rh阴性患者输注Rh阳性献血员血小板的相关事宜'
WHEN A.model_code='51e798c7-0486-4b30-8aa0-08b80d86893f'
THEN '已告知输注血液制品存在一定风险，有可能发生输液反应'
WHEN A.model_code='c148fde3-20b3-449c-ab0b-dcaaa71207c8'
THEN '输血或血液制品治疗是临床治疗、抢救急危重患者生命的重要措施之一，但也存在一定的风险'
WHEN A.model_code='711b5e0c-d5de-4db4-b0f1-fb440981cf87'
THEN '这是一份有关输血的告知书，目的是告诉您有关输血治疗的相关事宜'
WHEN A.model_code='5dd97bd6-7168-4f58-a5fc-24e0c94d08db'
THEN '自主决定是否接受自体输血'
ELSE A.yljgyj
END)
FROM [HLHT_ZQGZXX_SXZLTYS] A(nolock) WHERE CONVERT(VARCHAR,A.yljgyj) ='NA'
--法定代理人与患者的关系代码
UPDATE A SET A.dlrhzgxdm ='8' FROM [HLHT_ZQGZXX_SXZLTYS] A(nolock) WHERE A.dlrhzgxdm ='NA'
--法定代理人与患者的关系名称
UPDATE A SET A.dlrhzgxmc ='其他' FROM [HLHT_ZQGZXX_SXZLTYS] A(nolock) WHERE A.dlrhzgxmc ='NA'
--------------------------------------------------------------------------------------------------------------------

--------------------------------------------------  chen kuai-------------------------------------------------------------------
----首次病程
UPDATE A SET A.sjysbm =isnull(C.ZRYSDM,'NA'),A.sjysqm=isnull(C.ZRYSXM,'NA')
FROM [HLHT_ZYBCJL_SCBCJL] A(nolock),[HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] C(nolock)
WHERE A.jzlsh=C.SYXH AND (A.sjysbm ='NA' OR A.sjysqm ='NA' )

--中医四诊
UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA')
FROM [HLHT_ZYBCJL_SCBCJL] A(nolock),[HLHT_RYJL_JBXX] C(nolock)
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA';

UPDATE [HLHT_ZYBCJL_SCBCJL] SET jzxyzdbm =czxyzdbm, jzxyzdmc=czxyzd
WHERE CONVERT(varchar,jzxyzdbm) ='NA' AND CONVERT(varchar,jzxyzdmc)='NA';

-- 其他知情告知同意书
-- UPDATE A SET A.jbzd = C.ZDMC,A.jbzdbm = C.ZDDM
--   FROM [HLHT_ZQGZXX_QTZQTYS] A(nolock) LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] B(nolock) ON A.jzlsh =B.HISSYXH
--     LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRZDQK] C ON B.SYXH = C.SYXH AND C.ZDLB = 1
--   WHERE  ( CONVERT(varchar,A.jbzd) ='NA' OR CONVERT(varchar,A.jbzdbm) ='NA' );

  UPDATE [HLHT_ZQGZXX_QTZQTYS] SET hzqm=dlrqm WHERE CONVERT(varchar,hzqm)='NA' ;

-- 出院小结
--中医四诊
UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA')
FROM [HLHT_CYXJ_CYXJ] A(nolock),[HLHT_RYJL_JBXX] C(nolock)
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA';

--入院诊断-中医病名代码 入院诊断-中医病名名称
UPDATE A SET A.rzzybm =isnull(B.czzybmmc,'NA')  ,A.rzzybmdm=isnull(B.czzybmdm,'NA')
FROM [HLHT_CYXJ_CYXJ] A(nolock)
LEFT JOIN [HLHT_RYJL_JBXX] B(nolock) ON A.jzlsh =B.jzlsh
WHERE  ( CONVERT(varchar,A.rzzybmdm) ='NA' OR CONVERT(varchar,A.rzzybm) ='NA') ;

UPDATE A SET A.rzzyzh = isnull(B.czzyzhmc,'NA') ,A.rzzyzhdm=isnull(B.czzyzhdm,'NA')
FROM [HLHT_CYXJ_CYXJ] A(nolock)
LEFT JOIN [HLHT_RYJL_JBXX] B(nolock) ON A.jzlsh =B.jzlsh
WHERE  ( CONVERT(varchar,A.rzzyzh) ='NA' OR CONVERT(varchar,A.rzzyzhdm) ='NA') ;



------阶段小结------------------------------------------------------------------------------------------------------
--入院诊断-中医病名代码 入院诊断-中医病名名称
UPDATE A SET A.rzzybm =isnull(B.czzybmmc,'NA')  ,A.rzzybmdm=isnull(B.czzybmdm,'NA')
FROM [HLHT_ZYBCJL_JDXJ] A(nolock)
LEFT JOIN [HLHT_RYJL_JBXX] B(nolock) ON A.jzlsh =B.jzlsh
WHERE  ( CONVERT(varchar,A.rzzybmdm) ='NA' OR CONVERT(varchar,A.rzzybm) ='NA') ;

UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA')
FROM [HLHT_ZYBCJL_JDXJ] A(nolock),[HLHT_RYJL_JBXX] C(nolock)
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA';

UPDATE [HLHT_ZYBCJL_SCBCJL] SET jzxyzdbm =czxyzdbm, jzxyzdmc=czxyzd
WHERE CONVERT(varchar,jzxyzdbm)='NA' AND CONVERT(varchar,jzxyzdmc)='NA';

UPDATE A SET A.zs=isnull(B.zs,'NA')  FROM [HLHT_ZYBCJL_JDXJ] A(nolock) LEFT JOIN [HLHT_ZYBCJL_SCBCJL] B(nolock) ON A.jzlsh=B.jzlsh
--入院诊断-中医证候代码 入院诊断-中医证候名称

UPDATE A SET A.rzzyzh = isnull(B.czzyzhmc,'NA') ,A.rzzyzhdm=isnull(B.czzyzhdm,'NA')
FROM [HLHT_ZYBCJL_JDXJ] A(nolock)
LEFT JOIN [HLHT_RYJL_JBXX] B(nolock) ON A.jzlsh =B.jzlsh
WHERE  ( CONVERT(varchar,A.rzzyzh) ='NA' OR CONVERT(varchar,A.rzzyzhdm) ='NA') ;
--医嘱内容
UPDATE A SET A.yznr = ISNULL((SELECT LEFT(t.YPMC,LEN(t.YPMC)-1) as YPMC
FROM (SELECT (SELECT YPMC+',' FROM [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_LSYZK] B(nolock) WHERE B.SYXH=A.jzlsh FOR XML PATH('') ) AS YPMC ) t),'NA')
FROM [HLHT_ZYBCJL_JDXJ] A(nolock) WHERE CONVERT(varchar,A.yznr) ='NA'

--目前诊断中医、症候
UPDATE A SET A.mqzdzybm =isnull(B.czzybmmc,'NA')  ,A.mqzdzybmdm=isnull(B.czzybmdm,'NA')
FROM [HLHT_ZYBCJL_JDXJ] A(nolock)
LEFT JOIN [HLHT_RYJL_JBXX] B(nolock) ON A.jzlsh =B.jzlsh
WHERE  ( CONVERT(varchar,A.mqzdzybmdm) ='NA' OR CONVERT(varchar,A.mqzdzybm) ='NA') ;

UPDATE A SET A.mqzdzyzh = isnull(B.czzyzhmc,'NA') ,A.mqzdzyzhdm=isnull(B.czzyzhdm,'NA')
FROM [HLHT_ZYBCJL_JDXJ] A(nolock)
LEFT JOIN [HLHT_RYJL_JBXX] B(nolock) ON A.jzlsh =B.jzlsh
WHERE  ( CONVERT(varchar,A.mqzdzyzhdm) ='NA' OR CONVERT(varchar,A.mqzdzyzh) ='NA') ;


------抢救记录------------------------------------------------------------------------------------------------------
UPDATE A SET A.jbzdmc = C.ZDMC,A.jbzdbm = C.ZDDM
FROM [HLHT_ZYBCJL_QJJL] A(nolock)
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] B(nolock) ON A.jzlsh =B.HISSYXH
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRZDQK] C(nolock) ON B.SYXH = C.SYXH AND C.ZDLB = 1
WHERE  ( CONVERT(varchar,A.jbzdmc) ='NA' OR CONVERT(varchar,A.jbzdbm) ='NA' ) and  C.ZDMC is not NULL and C.ZDDM is not NULL

UPDATE 	A SET A.qmrq=B.FSSJ from  [HLHT_ZYBCJL_QJJL] A(nolock)
LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] B(nolock) ON A.yjlxh =B.QTBLJLXH
WHERE A.qmrq='1990-01-01 00:00:00.000' ;
--专业技术职务类别代码/名称
UPDATE D SET D.zyzwlbdm =  isnull(F.dm,'无') ,D.zyzwlbmc = isnull(F.mc,'无')   FROM [HLHT_ZYBCJL_QJJL] D(nolock) LEFT JOIN (
   SELECT  stuff((select ',' + A.ZCDM from [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] A(nolock) where A.ID in (
select * from f_splitSTR(C.cjqjrydm,',')) for xml path('')),1,1,'') as dm,
           stuff((select ',' + B.ZCMC from [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] B(nolock) where B.ID in (
select * from f_splitSTR(C.cjqjrydm,',')) for xml path('')),1,1,'')  as mc,
     C.yjlxh
   from [HLHT_ZYBCJL_QJJL] C(nolock) ) F ON D.yjlxh = F.yjlxh where (D.zyzwlbdm = 'NA' OR D.zyzwlbmc='NA')


--出院诊断-中医病名代码

UPDATE A SET A.czzybm =isnull(B.czzybmmc,'NA')  ,A.czzybmdm=isnull(B.czzybmdm,'NA')
FROM [HLHT_CYXJ_CYXJ] A(nolock)
LEFT JOIN [HLHT_RYJL_JBXX] B(nolock) ON A.jzlsh =B.jzlsh
WHERE  ( CONVERT(varchar,A.czzybmdm) ='NA' OR CONVERT(varchar,A.czzybm) ='NA') ;

UPDATE A SET A.czzyzh = isnull(B.czzyzhmc,'NA') ,A.czzyzhdm=isnull(B.czzyzhdm,'NA')
FROM [HLHT_CYXJ_CYXJ] A(nolock)
LEFT JOIN [HLHT_RYJL_JBXX] B(nolock) ON A.jzlsh =B.jzlsh
WHERE  ( CONVERT(varchar,A.czzyzh) ='NA' OR CONVERT(varchar,A.czzyzhdm) ='NA') ;

--切口愈合等级代码、名称
UPDATE A SET A.qkyhdjdm = CASE WHEN B.SSDJ IS NULL THEN 'NA' ELSE B.SSDJ END,A.qkyhdjmc = CASE WHEN B.SSDJMC IS NULL THEN 'NA' ELSE B.SSDJMC END
FROM [HLHT_CYXJ_CYXJ] A(nolock) LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_SSYZK] B(nolock) ON A.jzlsh = B.SYXH
WHERE (A.qkyhdjmc = 'NA' OR A.qkyhdjdm ='NA');

--麻醉方法代码、名称
--UPDATE A SET A.mzffdm = CASE WHEN B.MZDM IS NULL THEN 'NA' ELSE B.MZDM END,A.mzffmc = CASE WHEN B.MZMC IS NULL THEN 'NA' ELSE B.MZMC END
--FROM [HLHT_CYXJ_CYXJ] A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_SSYZK] B ON A.jzlsh = B.SYXH
--WHERE (A.mzffdm = 'NA' OR A.mzffmc ='NA');


--治疗结果代码
UPDATE A SET A.zljgdm=CASE WHEN B.ZGQK IS NULL THEN '1' ELSE B.ZGQK END
 FROM [HLHT_CYXJ_CYXJ] A(nolock) LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BASY_ZDK] B (nolock)ON A.jzlsh=B.SYXH;
--治疗结果名称
UPDATE A SET A.zljgmc='治愈'
 FROM [HLHT_CYXJ_CYXJ] A(nolock) LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] B(nolock)  ON A.zljgdm=B.MXDM
WHERE  A.zljgdm ='1';

---------------------------------------------------------------------------------------------------------------------------------------------------------
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
  UPDATE A SET A.gms =B.gms FROM [HLHT_ZYBCJL_SQXJ] A(nolock) left join [HLHT_RYJL_JBXX] B(nolock)  ON A.jzlsh =B.jzlsh where CONVERT(VARCHAR,A.gms) ='NA' and B.gms is not null
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
 UPDATE A SET A.tlrybm=isnull(T.dm,'NA') FROM [HLHT_ZYBCJL_SWBLTLJL] A LEFT JOIN (
 SELECT  stuff((select ',' + rtrim(A.ID) from [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] A where A.NAME in (select * from f_splitSTR(C.cjtlmd,'、')) for xml path('')),1,1,'') as dm,
    C.yjlxh    from [HLHT_ZYBCJL_SWBLTLJL] C) T ON A.yjlxh = T.yjlxh WHERE A.tlrybm != 'NA'
  --专业技术职务类别代码/名称
  UPDATE D SET D.zyzwlbdm = CASE WHEN F.dm = '' THEN 'NA' ELSE ISNULL(F.dm,'NA') END ,D.zyzwlbmc = CASE WHEN F.mc = '' THEN 'NA' ELSE  ISNULL(F.mc,'NA') END  FROM [HLHT_ZYBCJL_SWBLTLJL] D LEFT JOIN (
    SELECT  stuff((select ',' + A.ZCDM from [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] A where A.ID in (select * from f_splitSTR(C.tlrybm,',')) for xml path('')),1,1,'') as dm,
    stuff((select ',' + B.ZCMC from [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] B where B.ID in (select * from f_splitSTR(C.tlrybm,',')) for xml path('')),1,1,'')  as mc,
    C.yjlxh    from [HLHT_ZYBCJL_SWBLTLJL] C ) F ON D.yjlxh = F.yjlxh where (D.zyzwlbdm = 'NA' OR D.zyzwlbmc='NA')
  --主治医师
  UPDATE A SET A.zzysbm = CASE WHEN B.ZZYSDM = '' THEN 'NA' ELSE ISNULL(B.ZZYSDM,'NA') end ,
		           A.zzysqm = CASE WHEN B.ZZYSXM = '' THEN 'NA' ELSE ISNULL(B.ZZYSXM,'NA') end
	FROM [HLHT_ZYBCJL_SWBLTLJL] A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B ON A.jzlsh =B.SYXH WHERE (A.zzysbm ='NA' OR A.zzysqm = 'NA')

	UPDATE A SET A.zzysbm = CASE WHEN C.ID = '' OR C.ID IS NULL THEN 'NA' ELSE ISNULL(C.ID,'NA') end,
		           A.zzysqm = CASE WHEN C.ID = '' OR C.ID IS NULL  THEN 'NA' ELSE ISNULL(C.NAME,'NA') end
	from [HLHT_ZYBCJL_SWBLTLJL] A
		LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
		LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock) ON B.ZZYSDM =C.ID
	WHERE (A.zzysbm ='NA' OR A.zzysqm = 'NA');
  --主任医师
	UPDATE A SET A.zrysbm =CASE WHEN C.ID = '' OR C.ID IS NULL THEN 'NA' ELSE ISNULL(C.ID,'NA') end,
							 A.zrysqm = CASE WHEN C.ID = '' OR C.ID IS NULL  THEN 'NA' ELSE ISNULL(C.NAME,'NA') end
	from [HLHT_ZYBCJL_SWBLTLJL] A
		LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
		LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] C(nolock) ON B.ZRYSDM =C.ID
	WHERE (A.zrysbm ='NA' OR A.zrysqm = 'NA');
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

---------------------------------------------------------------------------------------------------------------------------------------------------------

-- 转科记录
--中医“四诊”观察结果
UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA')
FROM [HLHT_ZYBCJL_ZKJL] A(nolock),[HLHT_RYJL_JBXX] C(nolock)
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA';
--入院诊断-中医病名代码 入院诊断-中医病名名称
UPDATE A SET A.rzzybm = C.ZDMC,A.rzzybmdm = C.ZDDM
FROM [HLHT_ZYBCJL_ZKJL] A(nolock) LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] B(nolock) ON A.jzlsh =B.HISSYXH
  LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRZDQK] C(nolock) ON B.SYXH = C.SYXH AND C.ZDLB = 3
WHERE  (CONVERT(varchar,A.rzzybmdm) ='NA' OR CONVERT(varchar,A.rzzybm) ='NA')  AND ZDDM LIKE'B%';
--入院诊断-中医证候代码 入院诊断-中医证候名称
UPDATE A SET A.rzzyzh = C.ZDMC,A.rzzyzhdm = C.ZDDM
FROM [HLHT_ZYBCJL_ZKJL] A(nolock) LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] B(nolock) ON A.jzlsh =B.HISSYXH
  LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRZDQK] C(nolock) ON B.SYXH = C.SYXH AND C.ZDLB = 3
WHERE  ( CONVERT(varchar,A.rzzyzh) ='NA' OR CONVERT(varchar,A.rzzyzhdm) ='NA' ) AND (ZDDM LIKE'A%' OR ZDDM LIKE'Z%') ;

--目前诊断-中医病名代码、名称
UPDATE A SET A.mqzdzybm = CASE WHEN C.ZDMC IS NULL THEN 'NA' ELSE C.ZDMC END,A.mqzdzybmdm = CASE WHEN C.ZDDM IS NULL THEN 'NA' ELSE C.ZDDM END
FROM [HLHT_ZYBCJL_ZKJL] A(nolock) LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] B(nolock) ON A.jzlsh =B.HISSYXH
  LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRZDQK] C(nolock) ON B.SYXH = C.SYXH AND C.ZDLB = 8
WHERE  ( CONVERT(varchar,A.mqzdzybmdm) ='NA' OR CONVERT(varchar,A.mqzdzybm) ='NA' ) AND (ZDDM LIKE'A%' OR ZDDM LIKE'Z%') ;

--入院诊断-中医证候代码 入院诊断-中医证候名称
UPDATE A SET A.mqzdzybm = CASE WHEN C.ZDMC IS NULL THEN 'NA' ELSE C.ZDMC END,A.mqzdzyzhdm = CASE WHEN C.ZDDM IS NULL THEN 'NA' ELSE C.ZDDM END
FROM [HLHT_ZYBCJL_ZKJL] A(nolock) LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] B(nolock) ON A.jzlsh =B.HISSYXH
  LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRZDQK] C(nolock) ON B.SYXH = C.SYXH AND C.ZDLB = 8
WHERE  ( CONVERT(varchar,A.mqzdzybm) ='NA' OR CONVERT(varchar,A.mqzdzyzhdm) ='NA' ) AND (ZDDM LIKE'A%' OR ZDDM LIKE'Z%') ;


---会诊记录
--中医“四诊”观察结果
UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA')
FROM [HLHT_ZYBCJL_HZJL] A(nolock),[HLHT_RYJL_JBXX] C(nolock)
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA';


UPDATE A SET A.xyzdmc =isnull(C.czxyzdmc,'NA'),A.xyzdbm =isnull(C.czxyzdbm,'NA')
FROM [HLHT_ZYBCJL_HZJL] A(nolock),[HLHT_RYJL_JBXX] C(nolock)
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.xyzdmc) ='NA' OR CONVERT(varchar,A.xyzdbm) ='NA';

UPDATE A SET A.zybmmc =isnull(C.czzybmmc,'NA'),A.zybmdm =isnull(C.czzybmdm,'NA')
FROM [HLHT_ZYBCJL_HZJL] A(nolock),[HLHT_RYJL_JBXX] C(nolock)
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zybmmc) ='NA' OR CONVERT(varchar,A.zybmdm) ='NA';

UPDATE A SET A.zyzhmc =isnull(C.czzyzhmc,'NA'),A.zyzhdm =isnull(C.czzyzhdm,'NA')
FROM [HLHT_ZYBCJL_HZJL] A(nolock),[HLHT_RYJL_JBXX] C(nolock)
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyzhmc) ='NA' OR CONVERT(varchar,A.zyzhdm) ='NA';

UPDATE [HLHT_ZYBCJL_HZJL] SET hzyy =ISNULL(hzmd, 'NA') WHERE hzyy='NA';

--术前讨论
--拟实施麻醉方法代码  拟实施麻醉方法名称
    UPDATE A SET A.mzffdm = ISNULL(B.MZDM,'NA') ,
	A.mzffmc = ISNULL(B.MZMC,'NA') FROM
	[HLHT_ZYBCJL_SQTL] A(nolock)
	LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_SSYZK] B(nolock) ON A.jzlsh = B.SYXH
	WHERE (A.mzffdm = 'NA' OR A.mzffmc='NA');
--拟实施手术及操作名称
	UPDATE A SET A.ssczmc = CASE WHEN C.id IS NULL THEN 'NA' ELSE C.id END,A.ssczbm = CASE WHEN C.name IS NULL THEN 'NA' ELSE C.name END
    FROM [HLHT_ZYBCJL_SQTL] A(nolock) left join [HLHT_ZY_HIS].[This40].[dbo].[SS_SSDJK] B(nolock) ON A.jzlsh = B.syxh
    LEFT JOIN [HLHT_ZY_HIS].[This40].[dbo].[czryk] C(nolock) ON B.ysdm =C.id WHERE (A.ssczmc = 'NA' OR A.ssczbm ='NA');
 -- 拟实施手术及操作日期时间
   UPDATE A SET A.ssczrq=
    ISNULL(CONVERT(datetime,substring(B.aprq,1,4)+'-'+substring(B.aprq,5,2)+'-'+substring(B.aprq,7,2)+' '+substring(B.aprq,9,8)),'1990-01-01 00:00:00')
     FROM [HLHT_ZYBCJL_SQTL] A(nolock) left join [HLHT_ZY_HIS].[This40].[dbo].[SS_SSDJK] B(nolock) ON A.jzlsh = B.syxh
     WHERE (A.ssczrq = '1990-01-01 00:00:00');
--手术者
	UPDATE A SET A.sszbm = CASE WHEN C.id IS NULL THEN 'NA' ELSE C.id END,A.sszqm = CASE WHEN C.name IS NULL THEN 'NA' ELSE C.name END
	FROM [HLHT_ZYBCJL_SQTL] A(nolock) left join [HLHT_ZY_HIS].[This40].[dbo].[SS_SSDJK] B(nolock) ON A.jzlsh = B.syxh
	LEFT JOIN [HLHT_ZY_HIS].[This40].[dbo].[czryk] C(nolock) ON B.ysdm =C.id WHERE (A.sszbm = 'NA' OR A.sszqm ='NA')

--参加讨论人员工号
 UPDATE A SET A.tlrybm=isnull(T.dm,'NA') FROM [HLHT_ZYBCJL_SQTL] A LEFT JOIN (
 SELECT  stuff((select ',' + rtrim(A.ID) from [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] A where A.NAME in (select * from f_splitSTR(C.cjtlmd,'，')) for xml path('')),1,1,'') as dm,
    C.yjlxh    from [HLHT_ZYBCJL_SQTL] C) T ON A.yjlxh = T.yjlxh WHERE A.tlrybm != 'NA'
--专业技术职务类别代码/名称
  UPDATE D SET D.zyzwlbdm = CASE WHEN F.dm = '' THEN 'NA' ELSE ISNULL(F.dm,'NA') END ,D.zyzwlbmc = CASE WHEN F.mc = '' THEN 'NA' ELSE  ISNULL(F.mc,'NA') END  FROM [HLHT_ZYBCJL_SQTL] D LEFT JOIN (
    select (SELECT top 1 A.ZCDM from [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] A where A.NAME = C.zcrxm  ) as dm,
     (select top 1 B.ZCMC from [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] B where B.NAME = C.zcrxm )  as mc,
    C.yjlxh    from [HLHT_ZYBCJL_SQTL] C ) F ON D.yjlxh = F.yjlxh where (D.zyzwlbdm = 'NA' OR D.zyzwlbmc='NA');