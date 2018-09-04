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

--术前讨论
  --手术者
  UPDATE A SET A.sszbm = CASE WHEN C.id IS NULL THEN '无' ELSE C.id END,A.sszqm = CASE WHEN C.name IS NULL THEN '无' ELSE C.name END
  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A left join THIS4.dbo.SS_SSDJK B ON A.jzlsh = B.syxh
    LEFT JOIN THIS4.dbo.czryk C ON B.ysdm =C.id WHERE (A.sszbm = 'N' OR A.sszqm ='N');
  --职称数据处理
  if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[f_splitSTR]') and xtype in (N'FN', N'IF', N'TF'))
    drop function [dbo].[f_splitSTR]
  GO
  --方法1：循环截取法
  CREATE FUNCTION f_splitSTR(
    @s   varchar(8000),   --待分拆的字符串
    @split varchar(10)     --数据分隔符
  )RETURNS @re TABLE(col varchar(100))
  AS
    BEGIN
      DECLARE @splitlen int
      SET @splitlen=LEN(@split+'a')-2
      WHILE CHARINDEX(@split,@s)>0
        BEGIN
          INSERT @re VALUES(LEFT(@s,CHARINDEX(@split,@s)-1))
          SET @s=STUFF(@s,1,CHARINDEX(@split,@s)+@splitlen,'')
        END
      INSERT @re VALUES(@s)
      RETURN
    END

  --专业技术职务类别代码/名称
  UPDATE D SET D.zyzwlbdm = isnull(F.dm,'无') ,D.zyzwlbmc = isnull(F.mc,'无')   FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL D LEFT JOIN (
     SELECT  stuff((select ',' + A.ZCDM from CISDB.dbo.SYS_ZGDMK A where A.ID in (select * from CISDB_DATA.dbo.f_splitSTR(C.tlrybm,',')) for xml path('')),1,1,'') as dm,
             stuff((select ',' + B.ZCMC from CISDB.dbo.SYS_ZGDMK B where B.ID in (select * from CISDB_DATA.dbo.f_splitSTR(C.tlrybm,',')) for xml path('')),1,1,'')  as mc,
       C.yjlxh
     from CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL C ) F ON D.yjlxh = F.yjlxh where (D.zyzwlbdm = 'N' OR D.zyzwlbmc='N')
  --拟实施麻醉方法
  UPDATE A SET A.mzffdm = ISNULL(B.MZDM,'无') ,A.mzffmc = ISNULL(B.MZMC,'无') FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A  LEFT JOIN CISDB.dbo.CPOE_SSYZK B ON A.jzlsh = B.SYXH
   WHERE (A.mzffdm = 'N' OR A.mzffmc='N')
  --术前诊断
  UPDATE A SET A.sqzdbm = C.ZDMC,A.sqzdmc = C.ZDDM
  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A LEFT JOIN CISDB.dbo.EMR_BRSYK B ON A.jzlsh =B.HISSYXH
    LEFT JOIN CISDB.dbo.EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 1
  WHERE  ( CONVERT(varchar,A.sqzdbm) ='N' OR CONVERT(varchar,A.sqzdmc) ='N' )
  --拟实施手术及操作名称
  UPDATE A SET A.ssczmc = ISNULL(B.ssmc,'无') FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A LEFT JOIN CISDB_DATA.dbo.HLHT_ZLCZJL_YBSSJL B ON A.jzlsh = B.jzlsh WHERE A.ssczmc = 'N'
  --拟实施手术及操作编码
  UPDATE A SET A.ssczbm = ISNULL(B.ssjczbm,'无') FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A LEFT JOIN CISDB_DATA.dbo.HLHT_ZLCZJL_YBSSJL B ON A.jzlsh = B.jzlsh WHERE A.ssczbm = 'N'
  --拟实施手术目标部位代码
  UPDATE A SET A.ssmbbwdm = ISNULL(B.ssmbbwdm,'无') FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A LEFT JOIN CISDB_DATA.dbo.HLHT_ZLCZJL_YBSSJL B ON A.jzlsh = B.jzlsh WHERE A.ssmbbwdm = 'N'
  --拟实施手术目标部位名称
  UPDATE A SET A.ssbwmc = ISNULL(B.ssmbbw,'无') FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A LEFT JOIN CISDB_DATA.dbo.HLHT_ZLCZJL_YBSSJL B ON A.jzlsh = B.jzlsh WHERE A.ssbwmc = 'N'
  --拟实施手术及操作日期时间
  UPDATE A SET A.ssczrq = ISNULL(B.ssksrq,CONVERT(DATE,'1990-01-01 00:00:00',120)) FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A LEFT JOIN CISDB_DATA.dbo.HLHT_ZLCZJL_YBSSJL B ON A.jzlsh = B.jzlsh WHERE A.ssczrq = '1990-01-01 00:00:00'
  --手术要点
  UPDATE A SET A.ssyd = '无' FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A WHERE A.ssyd = 'N'
  --术前准备
  UPDATE A SET A.sqzb = '无' FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A WHERE A.sqzb = 'N'
  --手术方案
  UPDATE A SET A.ssfa = ISNULL(B.ssmc,'无') FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A LEFT JOIN CISDB_DATA.dbo.HLHT_ZLCZJL_YBSSJL B ON A.jzlsh = B.jzlsh WHERE A.ssfa = 'N'
  --注意事项
  UPDATE A SET A.zysx = '无' FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A  WHERE A.zysx = 'N'
  --讨论意见
  UPDATE A SET A.tlyj = ISNULL(A.tljl,'无') FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A WHERE A.tlyj = 'N'
  --麻醉医师工号 麻醉医师签名
  UPDATE A SET A.mzsqm=CASE WHEN B.MZZDMC = '' THEN '无' ELSE ISNULL(B.MZZDMC,'无') END,A.mzysbm=CASE WHEN B.MZZDYS = '' THEN '无' ELSE ISNULL(B.MZZDYS,'无') END
  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SQTL A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (A.mzsqm = 'N' OR A.mzysbm='N')


-- 死亡记录
  --专业技术职务类别代码/名称
  UPDATE D SET D.zyzwlbdm = CASE WHEN F.dm = '' THEN '无' ELSE ISNULL(F.dm,'无') END ,D.zyzwlbmc = CASE WHEN F.mc = '' THEN '无' ELSE  ISNULL(F.mc,'无') END  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SWBLTLJL D LEFT JOIN (
    SELECT  stuff((select ',' + A.ZCDM from CISDB.dbo.SYS_ZGDMK A where A.ID in (select * from CISDB_DATA.dbo.f_splitSTR(C.tlrybm,',')) for xml path('')),1,1,'') as dm,
    stuff((select ',' + B.ZCMC from CISDB.dbo.SYS_ZGDMK B where B.ID in (select * from CISDB_DATA.dbo.f_splitSTR(C.tlrybm,',')) for xml path('')),1,1,'')  as mc,
    C.yjlxh    from CISDB_DATA.dbo.HLHT_ZYBCJL_SWBLTLJL C ) F ON D.yjlxh = F.yjlxh where (D.zyzwlbdm = 'N' OR D.zyzwlbmc='N')

  --主治医师
  UPDATE A SET A.zzysbm = CASE WHEN B.ZZYSDM = '' THEN '无' ELSE ISNULL(B.ZZYSDM,'无') end ,A.zzysqm = CASE WHEN B.ZZYSXM = '' THEN '无' ELSE ISNULL(B.ZZYSXM,'无') end FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SWBLTLJL A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (A.zzysbm ='N' OR A.zzysqm = 'N');
  --主任医师
  UPDATE A SET A.zrysbm = ISNULL(B.ZRYSDM,'无'),A.zrysqm = ISNULL(B.ZRYSXM,'无')  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SWBLTLJL A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (A.zrysbm ='N' OR A.zrysqm = 'N');
--住院病程记录/上级医师查房记录 医嘱内容 中医“四诊”观察结果  辨证论治详细描述  中药煎煮方法  中药用药方法
  UPDATE A SET yznr='无',zyszgcjg='无',bzlzms='无',zyjzff='无',zyyyff='无'  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SJYSCFJL A  WHERE (convert(varchar,A.yznr) ='N' OR convert(varchar,A.zyszgcjg)='N' OR convert(varchar,A.bzlzms) ='N' OR A.zyjzff ='N' OR convert(varchar,A.zyyyff) ='N');

-- 手术同意书/HLHT_ZQGZXX_SSTYS
  -- 联系电话
    UPDATE A SET A.lxdh='无' FROM CISDB_DATA.dbo.HLHT_ZQGZXX_SSTYS A WHERE A.lxdh='N';
  -- 手术禁忌症
    UPDATE A SET A.ssjjz='无' FROM CISDB_DATA.dbo.HLHT_ZQGZXX_SSTYS A WHERE A.ssjjz='N';
  --手术方式
    UPDATE A SET A.ssfs = ISNULL(B.ssmc,'无')  FROM CISDB_DATA.dbo.HLHT_ZQGZXX_SSTYS A LEFT JOIN CISDB_DATA.dbo.HLHT_ZLCZJL_YBSSJL B ON A.jzlsh =B.jzlsh WHERE A.ssfs ='N';
  --拟实施麻醉方法代码  拟实施麻醉方法名称
    UPDATE A SET A.nmzdm = ISNULL(B.MZDM,'无') ,A.nmzffmc = ISNULL(B.MZMC,'无') FROM CISDB_DATA.dbo.HLHT_ZQGZXX_SSTYS A  LEFT JOIN CISDB.dbo.CPOE_SSYZK B ON A.jzlsh = B.SYXH WHERE (A.nmzdm = 'N' OR A.nmzffmc='N');
  --经治医师/责任医生
    UPDATE A SET A.jzysdm = ISNULL(B.YSDM,'无'),A.jzysqm = ISNULL(B.YSXM,'无')  FROM CISDB_DATA.dbo.HLHT_ZQGZXX_SSTYS A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (A.jzysdm ='N' or A.jzysqm = 'N');
    UPDATE A SET A.zrysdm = ISNULL(B.ZRYSDM,'无'),A.zrysxm = ISNULL(B.ZRYSXM,'无')  FROM CISDB_DATA.dbo.HLHT_ZQGZXX_SSTYS A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (A.zrysdm ='N' or A.zrysxm = 'N')
    UPDATE A SET A.hzqm = ISNULL(A.hzxm,'无')   FROM CISDB_DATA.dbo.HLHT_ZQGZXX_SSTYS A  WHERE (A.hzqm ='N');


--24h内入出院记录
  --地址-村（街、路、弄等）
  UPDATE A SET A.dzc='无'  FROM CISDB_DATA.dbo.HLHT_RYJL_RCYJL A WHERE A.dzc ='N'
  --地址-门牌号码
  UPDATE A SET A.dzmphm='无'  FROM CISDB_DATA.dbo.HLHT_RYJL_RCYJL A WHERE A.dzmphm ='N'
  --接诊医师
  UPDATE A SET A.jzysbm = ISNULL(B.YSDM,'无'),A.jzysqm = ISNULL(B.YSXM,'无')  FROM CISDB_DATA.dbo.HLHT_RYJL_RCYJL A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (A.jzysbm ='N' or A.jzysqm = 'N')
  --住院医师
  UPDATE A SET A.zyysbm = ISNULL(B.YSDM,'无'),A.zyysqm = ISNULL(B.YSXM,'无')  FROM CISDB_DATA.dbo.HLHT_RYJL_RCYJL A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (A.zyysbm ='N' OR A.zyysqm='N')
  --治则治法
  UPDATE A SET A.zfbm = '无',A.zzzf = '无' FROM CISDB_DATA.dbo.HLHT_RYJL_RCYJL A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (A.zfbm ='N' OR A.zzzf='N')
  --中医“四诊”观察结果
  UPDATE A SET A.zyszgcjg = '无' FROM CISDB_DATA.dbo.HLHT_RYJL_RCYJL A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (convert(varchar,A.zyszgcjg) ='N')
  --陈述内容可靠标志 来源入院记录
  UPDATE A SET A.csnrbz=isnull(B.csnrbz,'无')  FROM CISDB_DATA.dbo.HLHT_RYJL_RCYJL A LEFT JOIN CISDB_DATA.dbo.HLHT_RYJL_JBXX B ON A.jzlsh =B.jzlsh WHERE A.csnrbz ='N'
  --现病史 来源入院记录
  UPDATE A SET A.xbs=isnull(B.xbs,'无')  FROM CISDB_DATA.dbo.HLHT_RYJL_RCYJL A LEFT JOIN CISDB_DATA.dbo.HLHT_RYJL_JBXX B ON A.jzlsh =B.jzlsh WHERE A.xbs ='N'

--24小时内入院死亡记录
  --地址-村（街、路、弄等）
  UPDATE A SET A.dzc='无'  FROM CISDB_DATA.dbo.HLHT_RYJL_RYSWJL A WHERE A.dzc ='N'
  --地址-门牌号码
  UPDATE A SET A.dzmphm='无'  FROM CISDB_DATA.dbo.HLHT_RYJL_RYSWJL A WHERE A.dzmphm ='N'
  --陈述内容可靠标志 来源入院记录
  UPDATE A SET A.csnrbz=isnull(B.csnrbz,'无')  FROM CISDB_DATA.dbo.HLHT_RYJL_RYSWJL A LEFT JOIN CISDB_DATA.dbo.HLHT_RYJL_JBXX B ON A.jzlsh =B.jzlsh WHERE A.csnrbz ='N'
  --治则治法
  UPDATE A SET A.zfbm = '无',A.zzzf = '无' FROM CISDB_DATA.dbo.HLHT_RYJL_RYSWJL A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (A.zfbm ='N' OR A.zzzf='N')
  --中医“四诊”观察结果
  UPDATE A SET A.zyszgcjg = '无' FROM CISDB_DATA.dbo.HLHT_RYJL_RYSWJL A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (convert(varchar,A.zyszgcjg) ='N')
  --接诊医师
  UPDATE A SET A.jzysbm = ISNULL(B.YSDM,'无'),A.jzysqm = ISNULL(B.YSXM,'无')  FROM CISDB_DATA.dbo.HLHT_RYJL_RYSWJL A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (A.jzysbm ='N' or A.jzysqm = 'N')
  --住院医师
  UPDATE A SET A.zyysbm = ISNULL(B.YSDM,'无'),A.zyysqm = ISNULL(B.YSXM,'无')  FROM CISDB_DATA.dbo.HLHT_RYJL_RYSWJL A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (A.zyysbm ='N' OR A.zyysqm='N')

--术后首次病程记录
  --户口所在地	hkszd
  UPDATE A SET A.hkszd='无'  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SHSCBCJL A WHERE A.hkszd ='N'
  --出生地址	csdz
  UPDATE A SET A.csdz='无'  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SHSCBCJL A WHERE A.csdz ='N'
  --工作单位名称	gzdw
  UPDATE A SET A.gzdw='无'  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SHSCBCJL A WHERE A.gzdw ='N'
  --工作地点	gzdwdz
  UPDATE A SET A.gzdwdz='无'  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SHSCBCJL A WHERE A.gzdwdz ='N'
  --工作单位电话	gzdwdh
  UPDATE A SET A.gzdwdh='无'  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SHSCBCJL A WHERE A.gzdwdh ='N'
  --籍贯地	jgd
  UPDATE A SET A.jgd='无'  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SHSCBCJL A WHERE A.jgd ='N'
  --接诊开始日期
  UPDATE A SET A.jzkssj =
  CASE WHEN B.RYRQ IS NULL THEN CONVERT(DATE,'1990-01-01 00:00:00') ELSE
    CONVERT(datetime,substring(B.RYRQ,1,4)+'-'+substring(B.RYRQ,5,2)+'-'+substring(B.RYRQ,7,2)+' '+substring(B.RYRQ,9,2)+':'+substring(B.RYRQ,12,2)+':'+substring(B.RYRQ,15,2)) END  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SHSCBCJL A LEFT JOIN  CISDB.dbo.CPOE_BRSYK B ON A.jzlsh = B.SYXH WHERE A.jzkssj = CONVERT(DATE,'1990-01-01 00:00:00')
  --接诊结束日期
  UPDATE A SET A.jzjssj =
  CASE WHEN B.CYRQ IS NULL THEN  CONVERT(DATE,'1990-01-01 00:00:00') ELSE
    CONVERT(datetime,substring(B.CYRQ,1,4)+'-'+substring(B.CYRQ,5,2)+'-'+substring(B.CYRQ,7,2)+' '+substring(B.CYRQ,9,2)+':'+substring(B.CYRQ,12,2)+':'+substring(B.CYRQ,15,2)) END  FROM CISDB_DATA.dbo.HLHT_ZYBCJL_SHSCBCJL A LEFT JOIN  CISDB.dbo.CPOE_BRSYK B ON A.jzlsh = B.SYXH WHERE A.jzjssj = CONVERT(DATE,'1990-01-01 00:00:00')

--特殊检查及特殊治疗同意书
  --疾病诊断
  UPDATE A SET A.jbzd = C.ZDMC,A.jbzdbm = C.ZDDM
  FROM CISDB_DATA.dbo.HLHT_ZQGZXX_TSJCZLTYS A LEFT JOIN CISDB.dbo.EMR_BRSYK B ON A.jzlsh =B.HISSYXH
    LEFT JOIN CISDB.dbo.EMR_BRZDQK C ON B.SYXH = C.SYXH AND C.ZDLB = 1
  WHERE  ( CONVERT(varchar,A.jbzd) ='N' OR CONVERT(varchar,A.jbzdbm) ='N' )
  --医生信息
  UPDATE A SET A.ysbm = ISNULL(B.YSDM,'无'),A.ysqm = ISNULL(B.YSXM,'无')  FROM CISDB_DATA.dbo.HLHT_ZQGZXX_TSJCZLTYS A LEFT JOIN CISDB.dbo.CPOE_BRSYK B ON A.jzlsh =B.SYXH WHERE (A.ysbm ='N' or A.ysqm = 'N');



