ALTER PROCEDURE "dbo"."usp_his5_hlht_tsdata_zy" 
as  
--EMR_BRZDQK ZDLB(0:������� 1:��Ժ��� 2:��Ժ��� 3:��ҽ��Ժ��� 4:��ҽ��Ժ��� 5:������� 6:������� 7:�������)

------��Σ��֪ͨ��--------------------------------------------------------------------------------------------------
Update A 
Set A.mjzh='NA'
from [HLHT_ZQGZXX_BWZTZS] A(nolock)
where A.mjzh='';
Update A 
Set A.dlrqm=''
from [HLHT_ZQGZXX_BWZTZS] A(nolock)
where A.dlrqm='N';
--------------------------------------------------------------------------------------------------------------------

------��Ժ��¼------------------------------------------------------------------------------------------------------
--UPDATE HLHT_RYJL_JBXX SET dzc='��' WHERE CONVERT(varchar,dzc) ='N'; 
--UPDATE HLHT_RYJL_JBXX SET dzmphm='��' WHERE CONVERT(varchar,dzmphm) ='N' ;
--UPDATE HLHT_RYJL_JBXX SET zyszgcjg='��' WHERE CONVERT(varchar,zyszgcjg)='N' ;
--UPDATE HLHT_RYJL_JBXX SET zfbm='��' WHERE CONVERT(varchar,zfbm)='N' ;
--UPDATE HLHT_RYJL_JBXX SET zzzf='��' WHERE CONVERT(varchar,zzzf)='N' ;
--���
UPDATE t
SET 
--�������
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
 t.xzzdrq = (CASE WHEN t.xzzdrq = '1990-01-01' THEN GETDATE()
	ELSE t.xzzdrq
	END
),
 --ȷ�����
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
t.qzrq = (CASE WHEN t.qzrq = '1990-01-01' THEN t.gxsj
	ELSE t.qzrq
	END
)
FROM
	[HLHT_RYJL_JBXX] t(nolock)
LEFT JOIN [HLHT_ZYBCJL_CYJL] c(nolock) ON t.patid = c.patid;
--סԺҽʦ����
UPDATE A SET A.zyysbm = ISNULL(B.YSDM,'NA') FROM [HLHT_RYJL_JBXX] A(nolock) LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE A.zyysbm ='NA'; 
--סԺҽʦǩ��
UPDATE A SET A.zyysqm = ISNULL(B.YSXM,'NA') FROM [HLHT_RYJL_JBXX] A(nolock) LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE A.zyysqm ='NA';
--����ҽʦ���롢����ҽʦǩ��
UPDATE A SET A.jzysbm = ISNULL(B.YSDM,'NA'),A.jzysqm = ISNULL(B.YSXM,'NA')  FROM [HLHT_RYJL_JBXX] A(nolock) LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE (A.jzysbm ='N' or A.jzysqm = 'NA');
--һ�㽡����־
UPDATE t SET t.ybjkbz = ( CASE
	WHEN PATINDEX('%һ��%', t.ybjkbz) > 0 THEN 'T'
	WHEN PATINDEX('%����%', t.ybjkbz) > 0 THEN 'T'
	WHEN PATINDEX('%��%', t.ybjkbz) > 0 THEN 'F'
	ELSE 'T'
	END
) FROM [HLHT_RYJL_JBXX] t(nolock);
--���ߴ�Ⱦ�Ա�־
UPDATE t SET t.hzcrbz = ( CASE
	WHEN PATINDEX('%��%', t.hzcrbz) > 0 THEN 'F'
	WHEN PATINDEX('%��%', t.hzcrbz) > 0 THEN 'T'
	ELSE 'F'
	END
) FROM [HLHT_RYJL_JBXX] t(nolock);
--�������ݿɿ���־
UPDATE t SET t.csnrbz = ( CASE
	WHEN PATINDEX('%��%', t.csnrbz) > 0 THEN 'F'
	ELSE 'T'
	END
) FROM [HLHT_RYJL_JBXX] t(nolock);
--------------------------------------------------------------------------------------------------------------------

------��Ժ��¼------------------------------------------------------------------------------------------------------
UPDATE [HLHT_ZYBCJL_CYJL] (nolock) SET yxfzjcjg='��' WHERE CONVERT(varchar,yxfzjcjg) ='N'; 
UPDATE [HLHT_ZYBCJL_CYJL] (nolock) SET zyszjcjg='��' WHERE CONVERT(varchar,zyszjcjg) ='N' ;
UPDATE [HLHT_ZYBCJL_CYJL] (nolock) SET zfbm='��' WHERE zfbm='N' ;
UPDATE [HLHT_ZYBCJL_CYJL] (nolock) SET zzzf='��' WHERE zzzf='N' ;
UPDATE [HLHT_ZYBCJL_CYJL] (nolock) SET zyjzff='��' WHERE zyjzff='N' ;
UPDATE [HLHT_ZYBCJL_CYJL] (nolock) SET zyyyff='��' WHERE zyyyff='N' ;
--��ҽ������۲���
UPDATE A SET A.zyszjcjg =isnull(C.zyszgcjg,'NA')
FROM [HLHT_ZYBCJL_CYJL] A(nolock),[HLHT_RYJL_JBXX]  C(nolock) 
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszjcjg) ='NA';
--סԺҽʦǩ��
UPDATE A SET A.zyysqm = ISNULL(B.YSXM,'NA') FROM [HLHT_ZYBCJL_CYJL] A(nolock) LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE A.zyysqm ='NA';
--����ҽʦǩ��
UPDATE A SET A.zzysqm = ISNULL(B.ZZYSXM,'NA') FROM [HLHT_ZYBCJL_CYJL] A(nolock) LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE A.zzysqm ='NA';
--����ҽʦ����
UPDATE A SET A.zrysbm = ISNULL(B.ZRYSDM,'NA') FROM [HLHT_ZYBCJL_CYJL] A(nolock) LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE A.zrysbm ='NA';
--����ҽʦǩ��
UPDATE A SET A.zrysqm = ISNULL(B.ZRYSXM,'NA') FROM [HLHT_ZYBCJL_CYJL] A(nolock) LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE A.zrysqm ='NA';
--------------------------------------------------------------------------------------------------------------------

------�ճ����̼�¼------------------------------------------------------------------------------------------------------
UPDATE [HLHT_ZYBCJL_RCBCJL] (nolock) SET yznr='��' WHERE CONVERT(varchar,yznr) ='N'; 
UPDATE [HLHT_ZYBCJL_RCBCJL] (nolock) SET zyszgcjg='��' WHERE CONVERT(varchar,zyszgcjg) ='N' ;
UPDATE [HLHT_ZYBCJL_RCBCJL] (nolock) SET bzlzms='��' WHERE CONVERT(varchar,bzlzms)='N' ;
UPDATE [HLHT_ZYBCJL_RCBCJL] (nolock) SET zyjzff='��' WHERE CONVERT(varchar,zyjzff)='N' ;
UPDATE [HLHT_ZYBCJL_RCBCJL] (nolock) SET zyyyff='��' WHERE CONVERT(varchar,zyyyff)='N' ;
--��ҽ������۲���
UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA')
FROM [HLHT_ZYBCJL_RCBCJL]  A(nolock),[HLHT_RYJL_JBXX]  C(nolock) 
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA';
--רҵ����ְ��������
UPDATE A SET A.zyzwlbdm = ISNULL(B.ZCDM,'NA') FROM [HLHT_ZYBCJL_RCBCJL]  A(nolock) LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] B(nolock) ON A.ysbm =B.ID WHERE A.zyzwlbdm ='NA';
--רҵ����ְ���������
UPDATE A SET A.zyzwlbmc = ISNULL(B.ZCMC,'NA') FROM [HLHT_ZYBCJL_RCBCJL]  A(nolock) LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] B(nolock) ON A.ysbm =B.ID WHERE A.zyzwlbmc ='NA';
--ҽ������
UPDATE A SET A.ysqm = ISNULL(B.NAME,'NA') FROM [HLHT_ZYBCJL_RCBCJL]  A(nolock) LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] B(nolock) ON A.ysbm =B.ID WHERE A.ysqm ='NA';
--ҽ������
UPDATE A SET A.yznr = ISNULL((SELECT LEFT(t.YPMC,LEN(t.YPMC)-1) as YPMC  FROM (SELECT (SELECT
	B.YPMC+','
FROM
CISDB.dbo.CPOE_LSYZK B WHERE B.SYXH=A.jzlsh
FOR XML PATH('') ) AS YPMC ) t),'NA') FROM [HLHT_ZYBCJL_RCBCJL]  A(nolock) WHERE CONVERT(varchar,A.yznr) ='NA';
--��֤������ϸ����
UPDATE A SET A.bzlzms =isnull(C.bzfx,'NA')
FROM [HLHT_ZYBCJL_RCBCJL]  A(nolock),[HLHT_RYJL_JBXX]  C(nolock) 
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.bzlzms) ='NA';
--------------------------------------------------------------------------------------------------------------------

------������¼------------------------------------------------------------------------------------------------------
UPDATE HLHT_ZYBCJL_SWJL SET jstysjbz='F' WHERE CONVERT(varchar,jstysjbz) ='NA';
--סԺҽʦ����
UPDATE A SET A.zyysbm = ISNULL(B.YSDM,'NA') FROM HLHT_ZYBCJL_SWJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE A.zyysbm ='NA'; 
--סԺҽʦǩ��
UPDATE A SET A.zyysqm = ISNULL(B.YSXM,'NA') FROM HLHT_ZYBCJL_SWJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE A.zyysqm ='NA';
--����ҽʦ����
UPDATE A SET A.zzysbm = ISNULL(B.ZZYSDM,'NA') FROM HLHT_ZYBCJL_SWJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE A.zzysbm ='NA';
--����ҽʦǩ��
UPDATE A SET A.zzysqm = (case when ISNULL(B.ZZYSXM,'NA') ='' then 'NA' ELSE ISNULL(B.ZZYSXM,'NA') END) FROM HLHT_ZYBCJL_SWJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE A.zzysqm ='NA' or A.zzysqm ='';
--����ҽʦ����
UPDATE A SET A.zrysbm = ISNULL(B.ZRYSDM,'NA') FROM HLHT_ZYBCJL_SWJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE A.zrysbm ='NA';
--����ҽʦǩ��
UPDATE A SET A.zrysqm = (case when ISNULL(B.ZRYSXM,'NA')='' then 'NA' ELSE ISNULL(B.ZRYSXM,'NA') END) FROM HLHT_ZYBCJL_SWJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE A.zrysqm ='NA' or A.zrysqm ='';
--------------------------------------------------------------------------------------------------------------------

------���Ѳ�������------------------------------------------------------------------------------------------------------
UPDATE HLHT_ZYBCJL_YNBLTLJL SET tldddm='��' WHERE CONVERT(varchar,tldddm) ='N'; 
UPDATE HLHT_ZYBCJL_YNBLTLJL SET zyszgcjg='��' WHERE CONVERT(varchar,zyszgcjg) ='N' ;
UPDATE HLHT_ZYBCJL_YNBLTLJL SET bzlzms='��' WHERE CONVERT(varchar,bzlzms)='N' ;
UPDATE HLHT_ZYBCJL_YNBLTLJL SET zycfyznr='��' WHERE CONVERT(varchar,zycfyznr)='N' ;
UPDATE HLHT_ZYBCJL_YNBLTLJL SET zyyyff='��' WHERE CONVERT(varchar,zyyyff)='N' ;
--��ҽ������۲���
UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA')
FROM HLHT_ZYBCJL_YNBLTLJL A,[HLHT_RYJL_JBXX]  C(nolock) 
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA';
--���۵ص����
UPDATE A SET A.tldddm ='1'  FROM  HLHT_ZYBCJL_YNBLTLJL A WHERE CHARINDEX('��',A.tldd) > 0
UPDATE A SET A.tldddm ='2'  FROM  HLHT_ZYBCJL_YNBLTLJL A WHERE CHARINDEX('����',A.tldd) > 0
UPDATE A SET A.tldddm ='9'  FROM  HLHT_ZYBCJL_YNBLTLJL A WHERE CHARINDEX('����',A.tldd) = 0 AND CHARINDEX('��',A.tldd) = 0
--����ҽʦ����
UPDATE A SET A.zzysbm = ISNULL(B.ZZYSDM,'NA') FROM HLHT_ZYBCJL_YNBLTLJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE A.zzysbm ='NA' or A.zzysbm ='';
--����ҽʦǩ��
UPDATE A SET A.zzysqm =(case when ISNULL(B.ZZYSXM,'NA') ='' then 'NA' ELSE ISNULL(B.ZZYSXM,'NA') END) FROM HLHT_ZYBCJL_YNBLTLJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE A.zzysqm ='NA' or A.zzysbm ='';
--����ҽʦ����
UPDATE A SET A.zrysbm = ISNULL(B.ZRYSDM,'NA') FROM HLHT_ZYBCJL_YNBLTLJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE A.zrysbm ='NA' or A.zzysbm ='';
--����ҽʦǩ��
UPDATE A SET A.zrysqm = (case when ISNULL(B.ZRYSXM,'NA')='' then 'NA' ELSE ISNULL(B.ZRYSXM,'NA') END) FROM HLHT_ZYBCJL_YNBLTLJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE A.zrysqm ='NA' or A.zrysqm ='';
--------------------------------------------------------------------------------------------------------------------

------���Ƽ�¼------------------------------------------------------------------------------------------------------
--���ߴ�Ⱦ�Ա�־
UPDATE t SET t.gmsbz = ( CASE
	WHEN PATINDEX('%��%', t.gms) > 0 THEN 'T'
	ELSE 'F'
	END
) FROM HLHT_ZLCZJL_ZLJL t;
--�д����Ʋ�����־
UPDATE t SET t.yczlczbz ='F'
FROM HLHT_ZLCZJL_ZLJL t WHERE t.yczlczbz='NA'
--��������
UPDATE t SET t.czcs = 1
FROM HLHT_ZLCZJL_ZLJL t WHERE t.czcs=0
--ҩ�����
UPDATE A SET A.ywdm = T.ywdm FROM HLHT_ZLCZJL_ZLJL A
LEFT JOIN (SELECT STUFF((SELECT ',' + C.YPDM FROM CISDB..OUTP_ORDERITEM C 
	WHERE C.CFXH 
	IN (SELECT B.XH FROM CISDB..OUTP_ORDER B WHERE A.jzlsh = B.GHXH) FOR xml path ('')),1,1,'') AS ywdm,A.yjlxh
	FROM
	HLHT_ZLCZJL_ZLJL A
) T ON A.yjlxh = T.yjlxh
WHERE A.ywdm = 'NA'
--ҩ������
UPDATE A SET A.ywmc = T.ywmc FROM HLHT_ZLCZJL_ZLJL A
LEFT JOIN (SELECT STUFF((SELECT ',' + C.YPMC FROM CISDB..OUTP_ORDERITEM C 
	WHERE C.CFXH 
	IN (SELECT B.XH FROM CISDB..OUTP_ORDER B WHERE A.jzlsh = B.GHXH) FOR xml path ('')),1,1,'') AS ywmc,A.yjlxh
	FROM
	HLHT_ZLCZJL_ZLJL A
) T ON A.yjlxh = T.yjlxh
WHERE A.ywmc = 'NA'
--ҩ�����
UPDATE A set A.ywdm=ISNULL(C.YPDM,'NA')
FROM
	HLHT_ZLCZJL_ZLJL A
LEFT JOIN  CISDB.dbo.CPOE_CQYZK C  on A.jzlsh = C.SYXH WHERE  C.IDM<>0;
--ҩ������
UPDATE A set A.ywmc=ISNULL(C.YPMC,'NA')
FROM
	HLHT_ZLCZJL_ZLJL A
LEFT JOIN  CISDB.dbo.CPOE_CQYZK C  on A.jzlsh = C.SYXH WHERE  C.IDM<>0;
--ҩ���÷�
UPDATE A set A.ywyf=ISNULL(C.YPYF,'NA')
FROM
	HLHT_ZLCZJL_ZLJL A
LEFT JOIN  CISDB.dbo.CPOE_CQYZK C  on A.jzlsh = C.SYXH WHERE  C.IDM<>0;
--��ҩʹ��������
UPDATE A set A.zysylb=ISNULL(C.CYYPYF,'NA')
FROM
	HLHT_ZLCZJL_ZLJL A
LEFT JOIN  CISDB.dbo.CPOE_ORDER C  on A.jzlsh = C.SYXH;
--��ҩʹ���������
UPDATE A set A.zysylbmc=ISNULL(C.CYYFMC,'NA')
FROM
	HLHT_ZLCZJL_ZLJL A
LEFT JOIN  CISDB.dbo.CPOE_ORDER C  on A.jzlsh = C.SYXH;
--	ҩ��ʹ��Ƶ��
UPDATE A set A.ywsypl=ISNULL(C.PCDM,'NA')
FROM
	HLHT_ZLCZJL_ZLJL A
LEFT JOIN  CISDB.dbo.CPOE_CQYZK C  on A.jzlsh = C.SYXH WHERE  C.IDM<>0;
--ҩ��ʹ��Ƶ������
UPDATE A set A.ywsyplmc=ISNULL(C.PCMC,'NA')
FROM
	HLHT_ZLCZJL_ZLJL A
LEFT JOIN  CISDB.dbo.CPOE_CQYZK C  on A.jzlsh = C.SYXH WHERE  C.IDM<>0;
--ҩ����ʹ���
UPDATE A set A.ywjxdm=ISNULL(C.JXDM,'NA')
FROM
	HLHT_ZLCZJL_ZLJL A
LEFT JOIN  CISDB.dbo.CPOE_CQYZK C  on A.jzlsh = C.SYXH WHERE  C.IDM<>0;
--ҩ�����
UPDATE A set A.ywjx=ISNULL(C.JXMC,'NA')
FROM
	HLHT_ZLCZJL_ZLJL A
LEFT JOIN  CISDB.dbo.CPOE_CQYZK C  on A.jzlsh = C.SYXH WHERE  C.IDM<>0;
--ҩ��ʹ�ü�����λ
UPDATE A set A.ywsyjldw=ISNULL(C.JLDW,'NA')
FROM
	HLHT_ZLCZJL_ZLJL A
LEFT JOIN  CISDB.dbo.CPOE_CQYZK C  on A.jzlsh = C.SYXH WHERE  C.IDM<>0;
--ҩ��ʹ�ôμ���
UPDATE A set A.ywsycjl=ISNULL(CONVERT(NUMERIC,C.YPJL),0)
FROM
	HLHT_ZLCZJL_ZLJL A
LEFT JOIN  CISDB.dbo.CPOE_CQYZK C  on A.jzlsh = C.SYXH WHERE  C.IDM<>0;
--ҩ��ʹ���ܼ���
UPDATE A set A.ywsyzjl=ISNULL(CONVERT(NUMERIC,C.YPJL),0)*ISNULL(CONVERT(NUMERIC,C.PCDM),0)
FROM
	HLHT_ZLCZJL_ZLJL A
LEFT JOIN  CISDB.dbo.CPOE_CQYZK C  on A.jzlsh = C.SYXH WHERE  C.IDM<>0;
--ywsytjҩ��ʹ��;������
--ywsytjmcҩ��ʹ��;��
--������Ʒ���
UPDATE A SET A.jhzlfa =isnull(C.zljh,'NA')
FROM HLHT_ZLCZJL_ZLJL A,HLHT_ZYBCJL_SCBCJL C 
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.jhzlfa) ='NA';
--��÷�ʽ����
UPDATE A SET A.sffsdm ='3'
FROM HLHT_ZLCZJL_ZLJL A
WHERE CONVERT(varchar,A.sffsdm) ='NA';
--��÷�ʽ����
UPDATE A SET A.sffsmc ='�绰'
FROM HLHT_ZLCZJL_ZLJL A
WHERE CONVERT(varchar,A.sffsmc) ='NA';
--�������
--������ڽ������
UPDATE A SET A.sfzqjy ='01'
FROM HLHT_ZLCZJL_ZLJL A
WHERE CONVERT(varchar,A.sfzqjy) ='NA';
--������ڽ�������
UPDATE A SET A.sfzqjymc ='ÿ2��'
FROM HLHT_ZLCZJL_ZLJL A
WHERE CONVERT(varchar,A.sfzqjymc) ='NA';
--�������
UPDATE A SET A.sfrq =DATEADD(dd,14,C.TJSJ)
FROM HLHT_ZLCZJL_ZLJL A LEFT JOIN CISDB.dbo.EMR_QTBLJLK C 
ON A.yjlxh =C.QTBLJLXH
--- -----------------------------------------------------------------------------------------------------------------

------��Ѫ����ͬ�����------------------------------------------------------------------------------------------------------
--�ţ��������
UPDATE A SET A.mjzh ='NA' FROM HLHT_ZQGZXX_SXZLTYS A WHERE A.mjzh =''
--��ѪƷ�ִ���
UPDATE A 
SET A.sxpzdm =(CASE WHEN 
A.model_code='ecc13c89-87df-4151-b7ad-3142ff4b9321' 
or A.model_code='67624f22-e968-4b00-9e45-e6a4a1b81b65'
THEN '3'
WHEN A.model_code='5dd97bd6-7168-4f58-a5fc-24e0c94d08db'
THEN '2'
ELSE A.sxpzdm
END) 
FROM HLHT_ZQGZXX_SXZLTYS A WHERE A.sxpzdm ='NA'
--��ѪƷ������
UPDATE A 
SET A.sxpzmc =(CASE WHEN 
A.model_code='ecc13c89-87df-4151-b7ad-3142ff4b9321' 
or A.model_code='67624f22-e968-4b00-9e45-e6a4a1b81b65'
THEN 'ѪС��'
WHEN A.model_code='5dd97bd6-7168-4f58-a5fc-24e0c94d08db'
THEN 'ȫѪ'
ELSE A.sxpzmc
END) 
FROM HLHT_ZQGZXX_SXZLTYS A WHERE A.sxpzmc ='NA'
--��Ѫ��ʽ
UPDATE A 
SET A.sxfs =(CASE WHEN 
A.model_code='ecc13c89-87df-4151-b7ad-3142ff4b9321' 
or A.model_code='67624f22-e968-4b00-9e45-e6a4a1b81b65'
THEN '������Ѫ'
WHEN A.model_code='5dd97bd6-7168-4f58-a5fc-24e0c94d08db'
THEN '������Ѫ'
ELSE '������Ѫ'
END) 
FROM HLHT_ZQGZXX_SXZLTYS A WHERE A.sxfs ='NA'
--ҽ�ƻ������
UPDATE A 
SET A.yljgyj =(CASE WHEN 
A.model_code='ecc13c89-87df-4151-b7ad-3142ff4b9321' 
THEN '����һ���й���Ѫ�ĸ�֪�飬Ŀ���Ǹ������й�Rh���Ի�����עRh������ѪԱѪС����������'
WHEN A.model_code='67624f22-e968-4b00-9e45-e6a4a1b81b65'
THEN '����һ���й���Ѫ�ĸ�֪�飬Ŀ���Ǹ������й�Rh���Ի�����עRh������ѪԱѪС����������'
WHEN A.model_code='51e798c7-0486-4b30-8aa0-08b80d86893f' 
THEN '�Ѹ�֪��עѪҺ��Ʒ����һ�����գ��п��ܷ�����Һ��Ӧ'
WHEN A.model_code='c148fde3-20b3-449c-ab0b-dcaaa71207c8'
THEN '��Ѫ��ѪҺ��Ʒ�������ٴ����ơ����ȼ�Σ�ػ�����������Ҫ��ʩ֮һ����Ҳ����һ���ķ���'
WHEN A.model_code='711b5e0c-d5de-4db4-b0f1-fb440981cf87'
THEN '����һ���й���Ѫ�ĸ�֪�飬Ŀ���Ǹ������й���Ѫ���Ƶ��������'
WHEN A.model_code='5dd97bd6-7168-4f58-a5fc-24e0c94d08db'
THEN '���������Ƿ����������Ѫ'
ELSE A.yljgyj
END) 
FROM HLHT_ZQGZXX_SXZLTYS A WHERE CONVERT(VARCHAR,A.yljgyj) ='NA'
--�����������뻼�ߵĹ�ϵ����
UPDATE A SET A.dlrhzgxdm ='8' FROM HLHT_ZQGZXX_SXZLTYS A WHERE A.dlrhzgxdm ='NA'
--�����������뻼�ߵĹ�ϵ����
UPDATE A SET A.dlrhzgxmc ='����' FROM HLHT_ZQGZXX_SXZLTYS A WHERE A.dlrhzgxmc ='NA'
--------------------------------------------------------------------------------------------------------------------

------�׶�С��------------------------------------------------------------------------------------------------------
--��Ժ���-��ҽ�������� ��Ժ���-��ҽ��������
UPDATE A SET A.rzzybm =isnull(B.czzybmmc,'NA')  ,A.rzzybmdm=isnull(B.czzybmdm,'NA')
FROM HLHT_ZYBCJL_JDXJ A
LEFT JOIN HLHT_RYJL_JBXX B ON A.jzlsh =B.jzlsh
WHERE  ( CONVERT(varchar,A.rzzybmdm) ='NA' OR CONVERT(varchar,A.rzzybm) ='NA') ;

UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA')
FROM HLHT_ZYBCJL_JDXJ A,[HLHT_RYJL_JBXX]  C(nolock)
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA';

UPDATE HLHT_ZYBCJL_SCBCJL SET jzxyzdbm =czxyzdbm, jzxyzdmc=czxyzd
WHERE jzxyzdbm='NA' AND jzxyzdmc='NA';

UPDATE A SET A.zs=isnull(B.zs,'NA')  FROM HLHT_ZYBCJL_JDXJ A LEFT JOIN HLHT_ZYBCJL_SCBCJL B ON A.jzlsh=B.jzlsh
UPDATE HLHT_ZYBCJL_JDXJ SET zyszgcjg='��' WHERE CONVERT(varchar,zyszgcjg) ='N'
--��Ժ���-��ҽ֤����� ��Ժ���-��ҽ֤������

UPDATE A SET A.rzzyzh = isnull(B.czzyzhmc,'NA') ,A.rzzyzhdm=isnull(B.czzyzhdm,'NA')
FROM HLHT_ZYBCJL_JDXJ A
LEFT JOIN HLHT_RYJL_JBXX B ON A.jzlsh =B.jzlsh
WHERE  ( CONVERT(varchar,A.rzzyzh) ='NA' OR CONVERT(varchar,A.rzzyzhdm) ='NA') ;
--ҽ������
UPDATE A SET A.yznr = ISNULL((SELECT LEFT(t.YPMC,LEN(t.YPMC)-1) as YPMC
FROM (SELECT (SELECT YPMC+',' FROM CISDB..CPOE_LSYZK B WHERE B.SYXH=A.jzlsh FOR XML PATH('') ) AS YPMC ) t),'NA')
FROM HLHT_ZYBCJL_JDXJ A WHERE CONVERT(varchar,A.yznr) ='NA'

--Ŀǰ�����ҽ��֢��
UPDATE A SET A.mqzdzybm =isnull(B.czzybmmc,'NA')  ,A.mqzdzybmdm=isnull(B.czzybmdm,'NA')
FROM HLHT_ZYBCJL_JDXJ A
LEFT JOIN HLHT_RYJL_JBXX B ON A.jzlsh =B.jzlsh
WHERE  ( CONVERT(varchar,A.mqzdzybmdm) ='NA' OR CONVERT(varchar,A.mqzdzybm) ='NA') ;

UPDATE A SET A.mqzdzyzh = isnull(B.czzyzhmc,'NA') ,A.mqzdzyzhdm=isnull(B.czzyzhdm,'NA')
FROM HLHT_ZYBCJL_JDXJ A
LEFT JOIN HLHT_RYJL_JBXX B ON A.jzlsh =B.jzlsh
WHERE  ( CONVERT(varchar,A.mqzdzyzhdm) ='NA' OR CONVERT(varchar,A.mqzdzyzh) ='NA') ;


---------------------------------------------------------------------------------------------------------------------
------���ȼ�¼------------------------------------------------------------------------------------------------------
UPDATE A SET A.jbzdmc = C.ZDMC,A.jbzdbm = C.ZDDM
FROM HLHT_ZYBCJL_QJJL A LEFT JOIN CISDB.dbo.EMR_BRSYK B ON A.jzlsh =B.HISSYXH
  LEFT JOIN CISDB.dbo.EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 1
WHERE  ( CONVERT(varchar,A.jbzdmc) ='NA' OR CONVERT(varchar,A.jbzdbm) ='NA' )

UPDATE HLHT_ZYBCJL_QJJL SET jcjyxmmc='��' WHERE CONVERT(varchar,jcjyxmmc) ='N'
UPDATE HLHT_ZYBCJL_QJJL SET jrwdm=NULL
UPDATE HLHT_ZYBCJL_QJJL SET jcjyjg='��' WHERE CONVERT(varchar,jcjyjg) ='N'
UPDATE HLHT_ZYBCJL_QJJL SET jcjydljg='0.0000' WHERE jcjydljg ='-9.0000'
UPDATE HLHT_ZYBCJL_QJJL SET jcjyjgdm='��' WHERE CONVERT(varchar,jcjyjgdm) ='N'
UPDATE HLHT_ZYBCJL_QJJL SET zysx='��' WHERE CONVERT(varchar,zysx) ='N'

UPDATE 	A SET A.qmrq=B.FSSJ from  HLHT_ZYBCJL_QJJL A
LEFT JOIN CISDB.dbo.EMR_QTBLJLK B ON A.yjlxh =B.QTBLJLXH
WHERE A.qmrq='1990-01-01 00:00:00.000' ;
--רҵ����ְ��������/����
UPDATE D SET D.zyzwlbdm =  isnull(F.dm,'��') ,D.zyzwlbmc = isnull(F.mc,'��')   FROM HLHT_ZYBCJL_QJJL D LEFT JOIN (
   SELECT  stuff((select ',' + A.ZCDM from CISDB.dbo.SYS_ZGDMK A where A.ID in (
select * from f_splitSTR(C.cjqjrydm,',')) for xml path('')),1,1,'') as dm,
           stuff((select ',' + B.ZCMC from [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] B(nolock) where B.ID in (
select * from f_splitSTR(C.cjqjrydm,',')) for xml path('')),1,1,'')  as mc,
     C.yjlxh
   from HLHT_ZYBCJL_QJJL C ) F ON D.yjlxh = F.yjlxh where (D.zyzwlbdm = 'NA' OR D.zyzwlbmc='NA') 
---------------------------------------------------------------------------------------------------------------------
----�״β���
UPDATE A SET A.sjysbm =isnull(C.ZRYSDM,'NA'),A.sjysqm=isnull(C.ZRYSXM,'NA')
FROM HLHT_ZYBCJL_SCBCJL A,CISDB..CPOE_BRSYK C 
WHERE A.jzlsh=C.SYXH AND (A.sjysbm ='NA' OR A.sjysqm ='NA' )

--��ҽ����
UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA')
FROM HLHT_ZYBCJL_SCBCJL A,[HLHT_RYJL_JBXX]  C(nolock) 
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA';
UPDATE HLHT_ZYBCJL_SCBCJL SET jzxyzdbm =czxyzdbm, jzxyzdmc=czxyzd 
WHERE jzxyzdbm='NA' AND jzxyzdmc='NA';


-- ����֪���֪ͬ����
UPDATE A SET A.jbzd = C.ZDMC,A.jbzdbm = C.ZDDM
  FROM HLHT_ZQGZXX_QTZQTYS A LEFT JOIN CISDB.dbo.EMR_BRSYK B ON A.jzlsh =B.HISSYXH
    LEFT JOIN CISDB.dbo.EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 1
  WHERE  ( CONVERT(varchar,A.jbzd) ='NA' OR CONVERT(varchar,A.jbzdbm) ='NA' );

UPDATE HLHT_ZQGZXX_QTZQTYS SET yljgyj='��' WHERE CONVERT(varchar,yljgyj)='N' ;
UPDATE HLHT_ZQGZXX_QTZQTYS SET dlryj='��' WHERE CONVERT(varchar,dlryj)='N' ;
UPDATE HLHT_ZQGZXX_QTZQTYS SET hzqm=dlrqm WHERE CONVERT(varchar,hzqm)='N' ;
UPDATE HLHT_ZQGZXX_QTZQTYS SET dlrhzgx='��' WHERE CONVERT(varchar,dlrhzgx)='N' ;
UPDATE HLHT_ZQGZXX_QTZQTYS SET dlrhzmc='��' WHERE CONVERT(varchar,dlrhzmc)='N' ;

-- ��ԺС��
--��ҽ����
UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA')
FROM HLHT_CYXJ_CYXJ A,[HLHT_RYJL_JBXX]  C(nolock)
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA';

--��Ժ���-��ҽ�������� ��Ժ���-��ҽ��������
UPDATE A SET A.rzzybm =isnull(B.czzybmmc,'NA')  ,A.rzzybmdm=isnull(B.czzybmdm,'NA')
FROM HLHT_CYXJ_CYXJ A
LEFT JOIN HLHT_RYJL_JBXX B ON A.jzlsh =B.jzlsh
WHERE  ( CONVERT(varchar,A.rzzybmdm) ='NA' OR CONVERT(varchar,A.rzzybm) ='NA') ;

UPDATE A SET A.rzzyzh = isnull(B.czzyzhmc,'NA') ,A.rzzyzhdm=isnull(B.czzyzhdm,'NA')
FROM HLHT_CYXJ_CYXJ A
LEFT JOIN HLHT_RYJL_JBXX B ON A.jzlsh =B.jzlsh
WHERE  ( CONVERT(varchar,A.rzzyzh) ='NA' OR CONVERT(varchar,A.rzzyzhdm) ='NA') ;

--��Ժ���-��ҽ��������

UPDATE A SET A.czzybm =isnull(B.czzybmmc,'NA')  ,A.czzybmdm=isnull(B.czzybmdm,'NA')
FROM HLHT_CYXJ_CYXJ A
LEFT JOIN HLHT_RYJL_JBXX B ON A.jzlsh =B.jzlsh
WHERE  ( CONVERT(varchar,A.czzybmdm) ='NA' OR CONVERT(varchar,A.czzybm) ='NA') ;

UPDATE A SET A.czzyzh = isnull(B.czzyzhmc,'NA') ,A.czzyzhdm=isnull(B.czzyzhdm,'NA')
FROM HLHT_CYXJ_CYXJ A
LEFT JOIN HLHT_RYJL_JBXX B ON A.jzlsh =B.jzlsh
WHERE  ( CONVERT(varchar,A.czzyzh) ='NA' OR CONVERT(varchar,A.czzyzhdm) ='NA') ;

--�п����ϵȼ����롢����
UPDATE A SET A.qkyhdjdm = CASE WHEN B.SSDJ IS NULL THEN 'NA' ELSE B.SSDJ END,A.qkyhdjmc = CASE WHEN B.SSDJMC IS NULL THEN 'NA' ELSE B.SSDJMC END
FROM HLHT_CYXJ_CYXJ A LEFT JOIN CISDB.dbo.CPOE_SSYZK B ON A.jzlsh = B.SYXH
WHERE (A.qkyhdjmc = 'NA' OR A.qkyhdjdm ='NA');

--���������롢����
--UPDATE A SET A.mzffdm = CASE WHEN B.MZDM IS NULL THEN 'NA' ELSE B.MZDM END,A.mzffmc = CASE WHEN B.MZMC IS NULL THEN 'NA' ELSE B.MZMC END
--FROM HLHT_CYXJ_CYXJ A LEFT JOIN CISDB.dbo.CPOE_SSYZK B ON A.jzlsh = B.SYXH
--WHERE (A.mzffdm = 'NA' OR A.mzffmc ='NA');


--���ƽ������
UPDATE A SET A.zljgdm=CASE WHEN B.ZGQK IS NULL THEN '1' ELSE B.ZGQK END
 FROM HLHT_CYXJ_CYXJ A LEFT JOIN CISDB.dbo.EMR_BASY_ZDK B ON A.jzlsh=B.SYXH;
--���ƽ������
UPDATE A SET A.zljgmc='����'
 FROM HLHT_CYXJ_CYXJ A LEFT JOIN CISDB.dbo.EMR_SYS_ZDFLMXK B  ON A.zljgdm=B.MXDM
WHERE  A.zljgdm ='1';

---------------------------------------------------------------------------------------------------------------------------------------------------------
--�ϼ�ҽʦ�鷿��¼
        --ҽ������
        UPDATE A SET A.yznr = ISNULL((SELECT LEFT(t.YPMC,LEN(t.YPMC)-1) as YPMC  FROM (SELECT (SELECT YPMC+',' FROM CISDB..CPOE_LSYZK B WHERE B.SYXH=A.jzlsh FOR XML PATH('') ) AS YPMC ) t),'NA') 
        FROM HLHT_ZYBCJL_SJYSCFJL A WHERE CONVERT(varchar,A.yznr) ='NA'
        --��ҽ����
        UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA') FROM HLHT_ZYBCJL_SJYSCFJL A,[HLHT_RYJL_JBXX]  C(nolock) WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA'
--��ǰС��
  --�Ӳ�������л�ȡ������ݱ�����������
  UPDATE A SET A.zdyj = C.ZDMC,A.zdyjdm = C.ZDDM
  FROM HLHT_ZYBCJL_SQXJ A LEFT JOIN CISDB.dbo.EMR_BRSYK B ON A.jzlsh =B.HISSYXH
    LEFT JOIN CISDB.dbo.EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 1
  WHERE  ( CONVERT(varchar,A.zdyj) ='NA' OR CONVERT(varchar,A.zdyjdm) ='NA' )
  --����Ժ��Ϣ��ȡ����ʷ���ݴ���
  UPDATE A SET A.gmsbz ='F' FROM HLHT_ZYBCJL_SQXJ A left join HLHT_RYJL_JBXX B  on  A.jzlsh =B.jzlsh where A.gmsbz='NA' and (B.gms is null OR CHARINDEX('����',convert(varchar,B.gms)) > 0)
  UPDATE A SET A.gmsbz ='T' FROM HLHT_ZYBCJL_SQXJ A left join HLHT_RYJL_JBXX B  ON  A.jzlsh =B.jzlsh where A.gmsbz='NA' and B.gms is not null and CHARINDEX('����',convert(varchar,B.gms)) = 0
  UPDATE A SET A.gms =B.gms FROM HLHT_ZYBCJL_SQXJ A left join HLHT_RYJL_JBXX B  ON A.jzlsh =B.jzlsh where CONVERT(VARCHAR,A.gms) ='NA'
  --ȡ����С������ָ����ֵ��������Ӧ֢
  UPDATE A SET A.sssyz = CASE WHEN sszz = 'NA' THEN 'NA' else sszz END  FROM HLHT_ZYBCJL_SQXJ A  WHERE A.sssyz = 'NA'
  --������� ������ȡ�����������֮Ϊ��
  UPDATE A SET A.hzyj = CASE WHEN CONVERT(VARCHAR,B.hzyj) = 'NA' THEN 'NA'  WHEN B.hzyj IS NULL THEN 'NA'  else B.hzyj END
  FROM HLHT_ZYBCJL_SQXJ A LEFT JOIN  HLHT_ZYBCJL_HZJL B ON A.jzlsh =B.jzlsh WHERE CONVERT(VARCHAR,A.hzyj)='NA'
  --������
  UPDATE A SET A.sszbm = CASE WHEN C.id IS NULL THEN 'NA' ELSE C.id END,A.sszqm = CASE WHEN C.name IS NULL THEN 'NA' ELSE C.name END
  FROM HLHT_ZYBCJL_SQXJ A left join THIS4.dbo.SS_SSDJK B ON A.jzlsh = B.syxh
    LEFT JOIN THIS4.dbo.czryk C ON B.ysdm =C.id WHERE (A.sszbm = 'NA' OR A.sszqm ='NA')

--��ǰ����
  --������
  UPDATE A SET A.sszbm = CASE WHEN C.id IS NULL THEN 'NA' ELSE C.id END,A.sszqm = CASE WHEN C.name IS NULL THEN 'NA' ELSE C.name END
  FROM HLHT_ZYBCJL_SQTL A left join THIS4.dbo.SS_SSDJK B ON A.jzlsh = B.syxh
    LEFT JOIN THIS4.dbo.czryk C ON B.ysdm =C.id WHERE (A.sszbm = 'NA' OR A.sszqm ='NA')
  --רҵ����ְ��������/����
  UPDATE D SET D.zyzwlbdm = isnull(F.dm,'NA') ,D.zyzwlbmc = isnull(F.mc,'NA')   FROM HLHT_ZYBCJL_SQTL D LEFT JOIN (
     SELECT  stuff((select ',' + A.ZCDM from CISDB.dbo.SYS_ZGDMK A where A.ID in (select * from f_splitSTR(C.tlrybm,',')) for xml path('')),1,1,'') as dm,
             stuff((select ',' + B.ZCMC from [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] B(nolock) where B.ID in (select * from f_splitSTR(C.tlrybm,',')) for xml path('')),1,1,'')  as mc,
       C.yjlxh
     from HLHT_ZYBCJL_SQTL C ) F ON D.yjlxh = F.yjlxh where (D.zyzwlbdm = 'NA' OR D.zyzwlbmc='NA')
  --��ʵʩ������
  UPDATE A SET A.mzffdm = ISNULL(B.MZDM,'NA') ,A.mzffmc = ISNULL(B.MZMC,'NA') FROM HLHT_ZYBCJL_SQTL A  LEFT JOIN CISDB.dbo.CPOE_SSYZK B ON A.jzlsh = B.SYXH
   WHERE (A.mzffdm = 'NA' OR A.mzffmc='NA')
  --��ǰ���
  UPDATE A SET A.sqzdbm = C.ZDDM,A.sqzdmc = C.ZDMC
  FROM HLHT_ZYBCJL_SQTL A LEFT JOIN CISDB.dbo.EMR_BRSYK B ON A.jzlsh =B.HISSYXH
    LEFT JOIN CISDB.dbo.EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 1
  WHERE  ( CONVERT(varchar,A.sqzdbm) ='NA' OR CONVERT(varchar,A.sqzdmc) ='NA' )
  --��ʵʩ��������������
  UPDATE A SET A.ssczmc = ISNULL(B.ssmc,'NA') FROM HLHT_ZYBCJL_SQTL A LEFT JOIN HLHT_ZLCZJL_YBSSJL B ON A.jzlsh = B.jzlsh WHERE A.ssczmc = 'NA'
  --��ʵʩ��������������
  UPDATE A SET A.ssczbm = ISNULL(B.ssjczbm,'NA') FROM HLHT_ZYBCJL_SQTL A LEFT JOIN HLHT_ZLCZJL_YBSSJL B ON A.jzlsh = B.jzlsh WHERE A.ssczbm = 'NA'
  --��ʵʩ����Ŀ�겿λ����
  UPDATE A SET A.ssmbbwdm = ISNULL(B.ssmbbwdm,'NA') FROM HLHT_ZYBCJL_SQTL A LEFT JOIN HLHT_ZLCZJL_YBSSJL B ON A.jzlsh = B.jzlsh WHERE A.ssmbbwdm = 'NA'
  --��ʵʩ����Ŀ�겿λ����
  UPDATE A SET A.ssbwmc = ISNULL(B.ssmbbw,'NA') FROM HLHT_ZYBCJL_SQTL A LEFT JOIN HLHT_ZLCZJL_YBSSJL B ON A.jzlsh = B.jzlsh WHERE A.ssbwmc = 'NA'
  --��ʵʩ��������������ʱ��
  UPDATE A SET A.ssczrq = ISNULL(B.ssksrq,CONVERT(DATE,'1990-01-01 00:00:00',120)) FROM HLHT_ZYBCJL_SQTL A LEFT JOIN HLHT_ZLCZJL_YBSSJL B ON A.jzlsh = B.jzlsh WHERE A.ssczrq = '1990-01-01 00:00:00'
  --��������
  UPDATE A SET A.ssfa = ISNULL(B.ssmc,'NA') FROM HLHT_ZYBCJL_SQTL A LEFT JOIN HLHT_ZLCZJL_YBSSJL B ON A.jzlsh = B.jzlsh WHERE CONVERT(varchar,A.ssfa) = 'NA'
  --�������
  UPDATE A SET A.tlyj = ISNULL(A.tljl,'NA') FROM HLHT_ZYBCJL_SQTL A WHERE CONVERT(varchar,A.tlyj) = 'NA'
  --����ҽʦ���� ����ҽʦǩ��
  UPDATE A SET A.mzsqm=CASE WHEN B.MZZDMC = '' THEN 'NA' ELSE ISNULL(B.MZZDMC,'NA') END,A.mzysbm=CASE WHEN B.MZZDYS = '' THEN 'NA' ELSE ISNULL(B.MZZDYS,'NA') END
  FROM HLHT_ZYBCJL_SQTL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE (A.mzsqm = 'NA' OR A.mzysbm='NA')


-- �����������ۼ�¼
 --�μ�������Ա����
 UPDATE A SET A.tlrybm=isnull(T.dm,'NA') FROM HLHT_ZYBCJL_SWBLTLJL A LEFT JOIN (
 SELECT  stuff((select ',' + rtrim(A.ID) from CISDB.dbo.SYS_ZGDMK A where A.NAME in (select * from f_splitSTR(C.cjtlmd,'��')) for xml path('')),1,1,'') as dm,
    C.yjlxh    from HLHT_ZYBCJL_SWBLTLJL C) T ON A.yjlxh = T.yjlxh WHERE A.tlrybm != 'NA'
  --רҵ����ְ��������/����
  UPDATE D SET D.zyzwlbdm = CASE WHEN F.dm = '' THEN 'NA' ELSE ISNULL(F.dm,'NA') END ,D.zyzwlbmc = CASE WHEN F.mc = '' THEN 'NA' ELSE  ISNULL(F.mc,'NA') END  FROM HLHT_ZYBCJL_SWBLTLJL D LEFT JOIN (
    SELECT  stuff((select ',' + A.ZCDM from CISDB.dbo.SYS_ZGDMK A where A.ID in (select * from f_splitSTR(C.tlrybm,',')) for xml path('')),1,1,'') as dm,
    stuff((select ',' + B.ZCMC from [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] B(nolock) where B.ID in (select * from f_splitSTR(C.tlrybm,',')) for xml path('')),1,1,'')  as mc,
    C.yjlxh    from HLHT_ZYBCJL_SWBLTLJL C ) F ON D.yjlxh = F.yjlxh where (D.zyzwlbdm = 'NA' OR D.zyzwlbmc='NA')
  --����ҽʦ
  UPDATE A SET A.zzysbm = CASE WHEN B.ZZYSDM = '' THEN 'NA' ELSE ISNULL(B.ZZYSDM,'NA') end ,A.zzysqm = CASE WHEN B.ZZYSXM = '' THEN 'NA' ELSE ISNULL(B.ZZYSXM,'NA') end FROM HLHT_ZYBCJL_SWBLTLJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE (A.zzysbm ='NA' OR A.zzysqm = 'NA')
  --����ҽʦ
  UPDATE A SET A.zrysbm = ISNULL(B.ZRYSDM,'NA'),A.zrysqm = ISNULL(B.ZRYSXM,'NA')  FROM HLHT_ZYBCJL_SWBLTLJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE (A.zrysbm ='NA' OR A.zrysqm = 'NA')
  --���۵ص����
  UPDATE A SET A.tldddm ='1'  FROM  HLHT_ZYBCJL_SWBLTLJL A WHERE CHARINDEX('��',A.tldd) > 0
  UPDATE A SET A.tldddm ='2'  FROM  HLHT_ZYBCJL_SWBLTLJL A WHERE CHARINDEX('����',A.tldd) > 0
  UPDATE A SET A.tldddm ='9'  FROM  HLHT_ZYBCJL_SWBLTLJL A WHERE CHARINDEX('����',A.tldd) = 0 AND CHARINDEX('��',A.tldd) = 0
  --����ҽʦ����
   UPDATE A SET A.zrysbm =
    CASE WHEN B.ZRYSDM IS NULL or B.ZRYSDM  = '' THEN C.ZRYS WHEN B.ZRYSDM IS NOT NULL or B.ZRYSDM  != '' THEN B.ZRYSDM ELSE 'NA' END
    FROM HLHT_ZYBCJL_SWBLTLJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
    LEFT JOIN CISDB.dbo.EMR_BASYK C on B.EMRXH = C.SYXH
    LEFT JOIN CISDB.dbo.SYS_ZGDMK D ON C.ZRYS =D.ID
    WHERE A.zrysbm ='NA';
   --����ҽʦǩ��
     UPDATE A SET A.zrysqm = CASE WHEN B.ZRYSXM IS NULL or B.ZRYSXM  = '' THEN D.NAME WHEN B.ZRYSXM IS NOT NULL or B.ZRYSXM  != '' THEN B.ZRYSXM ELSE 'NA' END
     FROM HLHT_ZYBCJL_SWBLTLJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
     LEFT JOIN CISDB.dbo.EMR_BASYK C on B.EMRXH = C.SYXH
     LEFT JOIN CISDB.dbo.SYS_ZGDMK D ON C.ZRYS =D.ID
     WHERE A.zrysqm ='NA' or  A.zrysqm = ''
    --����ҽʦ
   UPDATE A SET A.zzysbm = CASE WHEN B.ZZYSDM IS NULL or B.ZZYSDM  = '' THEN C.ZZYS WHEN B.ZZYSDM IS NOT NULL or B.ZZYSDM  != '' THEN B.ZZYSDM ELSE 'NA' END
    FROM HLHT_ZYBCJL_SWBLTLJL A
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
    LEFT JOIN CISDB.dbo.EMR_BASYK C on B.EMRXH = C.SYXH
    LEFT JOIN CISDB.dbo.SYS_ZGDMK D ON C.ZZYS =D.ID
    WHERE A.zzysbm ='NA'
    --����ҽʦ
    UPDATE A SET A.zzysqm = CASE WHEN B.ZZYSXM IS NULL or B.ZZYSXM  = '' THEN D.NAME WHEN B.ZZYSXM IS NOT NULL or B.ZZYSXM  != '' THEN B.ZZYSXM ELSE 'NA' END
    FROM HLHT_ZYBCJL_SWBLTLJL A
    LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
    LEFT JOIN CISDB.dbo.EMR_BASYK C on B.EMRXH = C.SYXH
    LEFT JOIN CISDB.dbo.SYS_ZGDMK D ON C.ZZYS =D.ID
    WHERE A.zzysqm ='NA' or A.zzysqm =''
-- ����ͬ����/HLHT_ZQGZXX_SSTYS
  --������ʽ
    UPDATE A SET A.ssfs = ISNULL(B.ssmc,'NA')  FROM HLHT_ZQGZXX_SSTYS A LEFT JOIN HLHT_ZLCZJL_YBSSJL B ON A.jzlsh =B.jzlsh WHERE A.ssfs ='NA'
  --��ʵʩ����������  ��ʵʩ����������
    UPDATE A SET A.nmzdm = ISNULL(B.MZDM,'NA') ,A.nmzffmc = ISNULL(B.MZMC,'NA') FROM HLHT_ZQGZXX_SSTYS A  LEFT JOIN CISDB.dbo.CPOE_SSYZK B ON A.jzlsh = B.SYXH WHERE (A.nmzdm = 'NA' OR A.nmzffmc='NA')
  --����ҽʦ/����ҽ��
    UPDATE A SET A.jzysdm = ISNULL(B.YSDM,'NA'),A.jzysqm = ISNULL(B.YSXM,'NA')  FROM HLHT_ZQGZXX_SSTYS A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE (A.jzysdm ='NA' or A.jzysqm = 'NA')
  --����ҽ��
    UPDATE A SET A.zrysdm = ISNULL(B.YSDM,'NA'),A.zrysxm = ISNULL(B.YSXM,'NA')  FROM HLHT_ZQGZXX_SSTYS A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE (A.zrysdm ='NA' or A.zrysxm = 'NA')
    UPDATE A SET A.hzqm = ISNULL(A.hzxm,'NA')   FROM HLHT_ZQGZXX_SSTYS A  WHERE (A.hzqm ='NA')

--24h�����Ժ��¼
--��Ժҽ����������ʱ��  ҽ������ҽʦ
  UPDATE A SET
    A.yzklysbm = CASE WHEN T.cqyzrq > T.lsyzrq THEN T.cqysdm ELSE T.lsysdm END ,
    A.cyyzklrqm = CASE WHEN T.cqyzrq > T.lsyzrq THEN T.cqysmc ELSE T.lsysmc END ,
    A.cyyzklrq = CASE WHEN T.cqyzrq > T.lsyzrq THEN T.cqyzrq ELSE T.lsyzrq END
   FROM HLHT_RYJL_RCYJL A LEFT JOIN (
      SELECT
            (SELECT top 1 CONVERT(datetime,substring(B.LRRQ,1,4)+'-'+substring(B.LRRQ,5,2)+'-'+substring(B.LRRQ,7,2)+' '+substring(B.LRRQ,9,8)) yzrq
            FROM  CISDB..CPOE_CQYZK B WHERE A.jzlsh = B.SYXH  order by yzrq DESC) cqyzrq,
           (SELECT top 1 B.YSDM FROM  CISDB..CPOE_CQYZK B WHERE A.jzlsh = B.SYXH
            order by CONVERT(datetime,substring(B.LRRQ,1,4)+'-'+substring(B.LRRQ,5,2)+'-'+substring(B.LRRQ,7,2)+' '+substring(B.LRRQ,9,8)) DESC) cqysdm,
           (SELECT top 1 B.YSMC FROM  CISDB..CPOE_CQYZK B WHERE A.jzlsh = B.SYXH
            order by CONVERT(datetime,substring(B.LRRQ,1,4)+'-'+substring(B.LRRQ,5,2)+'-'+substring(B.LRRQ,7,2)+' '+substring(B.LRRQ,9,8)) DESC) cqysmc,
           (SELECT top 1 B.YSDM FROM  CISDB..CPOE_LSYZK B WHERE A.jzlsh = B.SYXH
            order by CONVERT(datetime,substring(B.LRRQ,1,4)+'-'+substring(B.LRRQ,5,2)+'-'+substring(B.LRRQ,7,2)+' '+substring(B.LRRQ,9,8)) DESC) lsysdm,
           (SELECT top 1 B.YSMC FROM  CISDB..CPOE_LSYZK B WHERE A.jzlsh = B.SYXH
            order by CONVERT(datetime,substring(B.LRRQ,1,4)+'-'+substring(B.LRRQ,5,2)+'-'+substring(B.LRRQ,7,2)+' '+substring(B.LRRQ,9,8)) DESC) lsysmc,
           (SELECT top 1 CONVERT(datetime,substring(B.LRRQ,1,4)+'-'+substring(B.LRRQ,5,2)+'-'+substring(B.LRRQ,7,2)+' '+substring(B.LRRQ,9,8)) yzrq
            FROM  CISDB..CPOE_LSYZK B WHERE A.jzlsh = B.SYXH  order by yzrq DESC) lsyzrq,A.jzlsh
        FROM HLHT_RYJL_RCYJL A) T ON A.jzlsh = T.jzlsh
  --����ҽʦ
  UPDATE A SET A.jzysbm = ISNULL(B.YSDM,'NA'),A.jzysqm = ISNULL(B.YSXM,'NA')  FROM HLHT_RYJL_RCYJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE (A.jzysbm ='NA' or A.jzysqm = 'NA')
  --סԺҽʦ
  UPDATE A SET A.zyysbm = ISNULL(B.YSDM,'NA'),A.zyysqm = ISNULL(B.YSXM,'NA')  FROM HLHT_RYJL_RCYJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE (A.zyysbm ='NA' OR A.zyysqm='NA')
  --�������ݿɿ���־ ��Դ��Ժ��¼
  UPDATE A SET A.csnrbz=isnull(B.csnrbz,'NA')  FROM HLHT_RYJL_RCYJL A LEFT JOIN HLHT_RYJL_JBXX B ON A.jzlsh =B.jzlsh WHERE A.csnrbz ='NA'
  --�ֲ�ʷ ��Դ��Ժ��¼
  UPDATE A SET A.xbs=isnull(B.xbs,'NA')  FROM HLHT_RYJL_RCYJL A LEFT JOIN HLHT_RYJL_JBXX B ON A.jzlsh =B.jzlsh WHERE convert(varchar,A.xbs) ='NA'
--�����߹�ϵ
  UPDATE A SET A.cszhzgxdm= T.cszhzgxdm,A.cszhzgxmc = T.cszhzgxmc FROM HLHT_RYJL_RCYJL A
   LEFT JOIN (
    SELECT CASE  WHEN A.cszhzgxdm IN ('����','ĸ��') THEN '2'
           WHEN A.cszhzgxdm IN ('����','����') THEN '0'
           WHEN A.cszhzgxdm IN ('��Ů','��Ů') THEN '3'
           WHEN A.cszhzgxdm IN ('����') THEN '1'
           WHEN A.cszhzgxdm IN ('�游','��ĸ') THEN '5'
           WHEN A.cszhzgxdm IN ('���游','����ĸ') THEN '6'
           WHEN A.cszhzgxdm IN ('����') THEN '7'
           else '8' end cszhzgxdm,
           CASE  WHEN A.cszhzgxdm IN ('����','ĸ��') THEN '��'
           WHEN A.cszhzgxdm IN ('����','����') THEN '���˻���'
           WHEN A.cszhzgxdm IN ('��Ů','��Ů') THEN 'Ů'
           WHEN A.cszhzgxdm IN ('����') THEN '��ż'
           WHEN A.cszhzgxdm IN ('�游','��ĸ') THEN '��ĸ'
           WHEN A.cszhzgxdm IN ('���游','����ĸ') THEN '�游ĸ�����游ĸ'
           WHEN A.cszhzgxdm IN ('����') THEN '�֡��ܡ��㡢��'
           else '����' end cszhzgxmc,A.jzlsh
    FROM HLHT_RYJL_RCYJL A) T ON A.jzlsh =T.jzlsh
  --�������ݿɿ���־
  UPDATE A SET A.csnrbz = 'T'   FROM HLHT_RYJL_RCYJL A
  --��ҽ������۲���
  UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA') FROM HLHT_RYJL_RCYJL A,[HLHT_RYJL_JBXX]  C(nolock) WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA'
  --֢״����
   UPDATE A SET A.zzms =A.xbs   FROM HLHT_RYJL_RCYJL A where CONVERT(varchar,A.zzms) = 'NA'

   --����ҽʦ����
   UPDATE A SET A.zrysbm =
    CASE WHEN B.ZRYSDM IS NULL or B.ZRYSDM  = '' THEN C.ZRYS WHEN B.ZRYSDM IS NOT NULL or B.ZRYSDM  != '' THEN B.ZRYSDM ELSE 'NA' END
    FROM HLHT_RYJL_RCYJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
    LEFT JOIN CISDB.dbo.EMR_BASYK C on B.EMRXH = C.SYXH
    LEFT JOIN CISDB.dbo.SYS_ZGDMK D ON C.ZRYS =D.ID
    WHERE A.zrysbm ='NA';
   --����ҽʦǩ��
     UPDATE A SET A.zrysqm = CASE WHEN B.ZRYSXM IS NULL or B.ZRYSXM  = '' THEN D.NAME WHEN B.ZRYSXM IS NOT NULL or B.ZRYSXM  != '' THEN B.ZRYSXM ELSE 'NA' END
     FROM HLHT_RYJL_RCYJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
     LEFT JOIN CISDB.dbo.EMR_BASYK C on B.EMRXH = C.SYXH
     LEFT JOIN CISDB.dbo.SYS_ZGDMK D ON C.ZRYS =D.ID
     WHERE A.zrysqm ='NA' or  A.zrysqm = ''
   --ְҵ���
   UPDATE A SET A.zylbdm =  '90' FROM HLHT_RYJL_RCYJL A  WHERE A.zylbdm IS NULL
   UPDATE A SET A.zylbmc = '����' FROM HLHT_RYJL_RCYJL A  WHERE A.zylbmc IS NULL
--24Сʱ����Ժ������¼
  --�������ݿɿ���־
  UPDATE A SET A.csnrbz = 'T'   FROM HLHT_RYJL_RYSWJL A
  --�����߹�ϵ
  UPDATE A SET A.cszhzgxdm= T.cszhzgxdm,A.cszhzgxmc = T.cszhzgxmc FROM HLHT_RYJL_RYSWJL A
    LEFT JOIN (
                SELECT CASE  WHEN A.cszhzgxdm IN ('����','ĸ��') THEN '2'
                 WHEN A.cszhzgxdm IN ('����','����') THEN '0'
                 WHEN A.cszhzgxdm IN ('��Ů','��Ů') THEN '3'
                 WHEN A.cszhzgxdm IN ('����') THEN '1'
                 WHEN A.cszhzgxdm IN ('�游','��ĸ') THEN '5'
                 WHEN A.cszhzgxdm IN ('���游','����ĸ') THEN '6'
                 WHEN A.cszhzgxdm IN ('����') THEN '7'
                 else '8' end cszhzgxdm,
                 CASE  WHEN A.cszhzgxdm IN ('����','ĸ��') THEN '��'
                 WHEN A.cszhzgxdm IN ('����','����') THEN '���˻���'
                 WHEN A.cszhzgxdm IN ('��Ů','��Ů') THEN 'Ů'
                 WHEN A.cszhzgxdm IN ('����') THEN '��ż'
                 WHEN A.cszhzgxdm IN ('�游','��ĸ') THEN '��ĸ'
                 WHEN A.cszhzgxdm IN ('���游','����ĸ') THEN '�游ĸ�����游ĸ'
                 WHEN A.cszhzgxdm IN ('����') THEN '�֡��ܡ��㡢��'
                 else '����' end cszhzgxmc,A.jzlsh
                FROM HLHT_RYJL_RYSWJL A) T ON A.jzlsh =T.jzlsh
  --��ҽ������۲���
  UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA') FROM HLHT_RYJL_RYSWJL A,[HLHT_RYJL_JBXX]  C(nolock) WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA';

  --����ҽʦ
  UPDATE A SET A.jzysbm = ISNULL(B.YSDM,'NA'),A.jzysqm = ISNULL(B.YSXM,'NA')  FROM HLHT_RYJL_RYSWJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE (A.jzysbm ='NA' or A.jzysqm = 'NA')
  --סԺҽʦ
  UPDATE A SET A.zyysbm = ISNULL(B.YSDM,'NA'),A.zyysqm = ISNULL(B.YSXM,'NA')  FROM HLHT_RYJL_RYSWJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE (A.zyysbm ='NA' OR A.zyysqm='NA')

   --����ҽʦ����
   UPDATE A SET A.zrysbm =
    CASE WHEN B.ZRYSDM IS NULL or B.ZRYSDM  = '' THEN C.ZRYS WHEN B.ZRYSDM IS NOT NULL or B.ZRYSDM  != '' THEN B.ZRYSDM ELSE 'NA' END
    FROM HLHT_RYJL_RYSWJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
    LEFT JOIN CISDB.dbo.EMR_BASYK C on B.EMRXH = C.SYXH
    LEFT JOIN CISDB.dbo.SYS_ZGDMK D ON C.ZRYS =D.ID
    WHERE A.zrysbm ='NA';
   --����ҽʦǩ��
     UPDATE A SET A.zrysqm = CASE WHEN B.ZRYSXM IS NULL or B.ZRYSXM  = '' THEN D.NAME WHEN B.ZRYSXM IS NOT NULL or B.ZRYSXM  != '' THEN B.ZRYSXM ELSE 'NA' END
     FROM HLHT_RYJL_RYSWJL A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH
     LEFT JOIN CISDB.dbo.EMR_BASYK C on B.EMRXH = C.SYXH
     LEFT JOIN CISDB.dbo.SYS_ZGDMK D ON C.ZRYS =D.ID
     WHERE A.zrysqm ='NA' or  A.zrysqm = ''

--�����״β��̼�¼
  --���￪ʼ����
  UPDATE A SET A.jzkssj =
  CASE WHEN B.RYRQ IS NULL THEN CONVERT(DATE,'1990-01-01 00:00:00') ELSE
    CONVERT(datetime,substring(B.RYRQ,1,4)+'-'+substring(B.RYRQ,5,2)+'-'+substring(B.RYRQ,7,2)+' '+substring(B.RYRQ,9,2)+':'+substring(B.RYRQ,12,2)+':'+substring(B.RYRQ,15,2)) END  FROM HLHT_ZYBCJL_SHSCBCJL A LEFT JOIN  [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh = B.SYXH WHERE A.jzkssj = CONVERT(DATE,'1990-01-01 00:00:00')
  --�����������
  UPDATE A SET A.jzjssj =
  CASE WHEN B.CYRQ IS NULL THEN  CONVERT(DATE,'1990-01-01 00:00:00') ELSE
    CONVERT(datetime,substring(B.CYRQ,1,4)+'-'+substring(B.CYRQ,5,2)+'-'+substring(B.CYRQ,7,2)+' '+substring(B.CYRQ,9,2)+':'+substring(B.CYRQ,12,2)+':'+substring(B.CYRQ,15,2)) END  FROM HLHT_ZYBCJL_SHSCBCJL A LEFT JOIN  [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh = B.SYXH WHERE A.jzjssj = CONVERT(DATE,'1990-01-01 00:00:00')

--�����鼰��������ͬ����
  --�������
   UPDATE QT SET QT.jbzd = CT.MC, QT.jbzdbm = CT.DM FROM HLHT_ZQGZXX_TSJCZLTYS QT
   LEFT JOIN (
    SELECT 
    stuff((SELECT ','+C.ZDDM  FROM  CISDB..EMR_BRSYK B
    LEFT JOIN CISDB..EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 1 WHERE B.HISSYXH = A.jzlsh FOR XML PATH('')),1,1,'') DM,
    stuff((SELECT ','+C.ZDMC  FROM  CISDB..EMR_BRSYK B
    LEFT JOIN CISDB..EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 1 WHERE B.HISSYXH = A.jzlsh FOR XML PATH('')),1,1,'') MC,
    A.yjlxh
    FROM HLHT_ZQGZXX_TSJCZLTYS A) CT ON QT.yjlxh = CT.yjlxh WHERE  ( CONVERT(varchar,QT.jbzd) ='NA' OR CONVERT(varchar,QT.jbzdbm) ='NA' )
  --ҽ����Ϣ
  UPDATE A SET A.ysbm = ISNULL(B.YSDM,'NA'),A.ysqm = ISNULL(B.YSXM,'NA')
  FROM HLHT_ZQGZXX_TSJCZLTYS A LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock) ON A.jzlsh =B.SYXH WHERE (A.ysbm ='NA' or A.ysqm = 'NA')

---------------------------------------------------------------------------------------------------------------------------------------------------------

-- ת�Ƽ�¼
--��ҽ������۲���
UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA')
FROM HLHT_ZYBCJL_ZKJL A,[HLHT_RYJL_JBXX]  C(nolock) 
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA';
--��Ժ���-��ҽ�������� ��Ժ���-��ҽ��������
UPDATE A SET A.rzzybm = C.ZDMC,A.rzzybmdm = C.ZDDM
FROM HLHT_ZYBCJL_ZKJL A LEFT JOIN CISDB.dbo.EMR_BRSYK B ON A.jzlsh =B.HISSYXH
  LEFT JOIN CISDB.dbo.EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 3
WHERE  (CONVERT(varchar,A.rzzybmdm) ='NA' OR CONVERT(varchar,A.rzzybm) ='NA')  AND ZDDM LIKE'B%';
--��Ժ���-��ҽ֤����� ��Ժ���-��ҽ֤������
UPDATE A SET A.rzzyzh = C.ZDMC,A.rzzyzhdm = C.ZDDM
FROM HLHT_ZYBCJL_ZKJL A LEFT JOIN CISDB.dbo.EMR_BRSYK B ON A.jzlsh =B.HISSYXH
  LEFT JOIN CISDB.dbo.EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 3
WHERE  ( CONVERT(varchar,A.rzzyzh) ='NA' OR CONVERT(varchar,A.rzzyzhdm) ='NA' ) AND (ZDDM LIKE'A%' OR ZDDM LIKE'Z%') ;

--Ŀǰ���-��ҽ�������롢����
UPDATE A SET A.mqzdzybm = CASE WHEN C.ZDMC IS NULL THEN 'NA' ELSE C.ZDMC END,A.mqzdzybmdm = CASE WHEN C.ZDDM IS NULL THEN 'NA' ELSE C.ZDDM END
FROM HLHT_ZYBCJL_ZKJL A LEFT JOIN CISDB.dbo.EMR_BRSYK B ON A.jzlsh =B.HISSYXH
  LEFT JOIN CISDB.dbo.EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 8
WHERE  ( CONVERT(varchar,A.mqzdzybmdm) ='NA' OR CONVERT(varchar,A.mqzdzybm) ='NA' ) AND (ZDDM LIKE'A%' OR ZDDM LIKE'Z%') ;

--��Ժ���-��ҽ֤����� ��Ժ���-��ҽ֤������
UPDATE A SET A.mqzdzybm = CASE WHEN C.ZDMC IS NULL THEN 'NA' ELSE C.ZDMC END,A.mqzdzyzhdm = CASE WHEN C.ZDDM IS NULL THEN 'NA' ELSE C.ZDDM END
FROM HLHT_ZYBCJL_ZKJL A LEFT JOIN CISDB.dbo.EMR_BRSYK B ON A.jzlsh =B.HISSYXH
  LEFT JOIN CISDB.dbo.EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 8
WHERE  ( CONVERT(varchar,A.mqzdzybm) ='NA' OR CONVERT(varchar,A.mqzdzyzhdm) ='NA' ) AND (ZDDM LIKE'A%' OR ZDDM LIKE'Z%') ;


---�����¼
--��ҽ������۲���
UPDATE A SET A.zyszgcjg =isnull(C.zyszgcjg,'NA')
FROM HLHT_ZYBCJL_HZJL A,[HLHT_RYJL_JBXX]  C(nolock) 
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyszgcjg) ='NA';


UPDATE A SET A.xyzdmc =isnull(C.czxyzdmc,'NA'),A.xyzdbm =isnull(C.czxyzdbm,'NA') 
FROM HLHT_ZYBCJL_HZJL A,[HLHT_RYJL_JBXX]  C(nolock) 
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.xyzdmc) ='NA' OR CONVERT(varchar,A.xyzdbm) ='NA';

UPDATE A SET A.zybmmc =isnull(C.czzybmmc,'NA'),A.zybmdm =isnull(C.czzybmdm,'NA') 
FROM HLHT_ZYBCJL_HZJL A,[HLHT_RYJL_JBXX]  C(nolock) 
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zybmmc) ='NA' OR CONVERT(varchar,A.zybmdm) ='NA';

UPDATE A SET A.zyzhmc =isnull(C.czzyzhmc,'NA'),A.zyzhdm =isnull(C.czzyzhdm,'NA') 
FROM HLHT_ZYBCJL_HZJL A,[HLHT_RYJL_JBXX]  C(nolock) 
WHERE A.jzlsh=C.jzlsh AND CONVERT(varchar,A.zyzhmc) ='NA' OR CONVERT(varchar,A.zyzhdm) ='NA';

UPDATE HLHT_ZYBCJL_HZJL SET hzyy =ISNULL(hzmd, 'NA') WHERE hzyy='NA';

