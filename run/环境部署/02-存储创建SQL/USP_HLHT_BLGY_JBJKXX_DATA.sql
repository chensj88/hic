USE [CIS_HLHT]
GO
/****** Object:  StoredProcedure [dbo].[USP_HLHT_BLGY_JBJKXX_DATA]    Script Date: 2018/10/15 14:00:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[USP_HLHT_BLGY_JBJKXX_DATA]
@sourceType varchar(64),   --抽取数据类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chensj
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]基本健康信息 ---USP_HLHT_BLGY_JBJKXX_DATA
[参数]
 @sourceType: 抽取数据类型 0 门诊  1 住院
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_BLGY_JBJKXX_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_BLGY_JBJKXX_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
[注意事项]
 在CIS_HLHT中创建
*/
begin
--创建临时表
if @syxh  is null or @syxh = ''
	begin
    if @sourceType = '1'
     begin
       SELECT
        A.GHXH                                                                      AS yjlxh,
        A.GHXH                                                                      AS jzlsh,
        A.PATID                                                                     AS patid,
        A.HZXM                                                                      AS hzxm,
        A.GHXH                                                                      AS mjzh,
        'NA'                                                                        AS zyh,
        '1'                                                                         AS jzlb,
        A.SEX                                                                       AS xbmc,
        CASE A.SEX WHEN '男' THEN '1' WHEN '女' THEN '2' ELSE '3' END               AS xbdm,
        convert(varchar(18),isnull(A.SFZH,''))                                      AS sfzhm,
        A.YBDM                                                                      AS jkkh,
        ISNULL(B.XXDM,'NA')                                                         AS aboxxdm,
        ISNULL(E.NAME,'NA')                                                         AS aboxxmc,
        ISNULL(B.RHJY,'NA')                                                         AS rhxxdm,
        ISNULL(F.NAME,'NA')                                                         AS rhxxmc,
        ISNULL(H.xbs,'NA')                                                          AS jbs,
        'NA'                                                                                         AS crbs,
        'NA'                                                                                         AS yfjzs,
        'NA'                                                                                         AS sss,
        'NA'                                                                                         AS sxs,
        ISNULL(H.gms,'NA')                                                                           AS gms,
        'NA'                                                                                         AS grs,
        'NA'                                                                                         AS hys,
        'NA'                                                                                         AS yjs,
        'NA'                                                                                         AS jzs,
        GETDATE()                                                                                    AS gxsj,
        CONVERT(VARCHAR,ISNULL(A.EMRXH,'0'))                                                        AS syxh
        FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_JZJLK] A(nolock)
        LEFT JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[EMR_BASYK] B(nolock) ON A.EMRXH  = B.SYXH
        LEFT JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] E(nolock) ON B.XXDM = E.MXDM AND E.LBDM = '96'
        LEFT JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] F(nolock) ON B.RHJY = F.MXDM AND F.LBDM = '97'
        LEFT JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[EMR_QTBLJLK] G(nolock) ON  G.SYXH = A.EMRXH AND G.MXFLDM LIKE 'B+9868%' AND G.YXJL = 1
        LEFT JOIN [HLHT_MJZBL_JZLGBL] H(nolock) ON  G.QTBLJLXH = H.yjlxh
         where
        CONVERT(date,substring(A.GHRQ,1,4)+'-'+substring(A.GHRQ,5,2)+'-'+substring(A.GHRQ,7,2))
        between  @startDate and @endDate
     end
    else
      begin
      SELECT
        A.SYXH                                                         AS yjlxh,
        A.SYXH                                                         AS jzlsh,
        A.PATID                                                        AS patid,
        A.HZXM                                                         AS hzxm,
        case when A.MZH = '' then 'NA' else ISNULL(A.MZH,'NA') end                      AS mjzh,
        B.ZYHM                                                          AS zyh,
        '2'                                                             AS jzlb,
        A.SEX                                                           AS xbmc,
        CASE A.SEX WHEN '男' THEN '1' WHEN '女' THEN '2' ELSE '3' END  AS xbdm,
        convert(varchar(18),isnull(A.SFZH,''))                         AS sfzhm,
        A.YBDM                                                         AS jkkh,
        ISNULL(C.XXDM,'NA')                                            AS aboxxdm,
        ISNULL(E.NAME,'NA')                                            AS aboxxmc,
        ISNULL(C.RHJY,'NA')                                            AS rhxxdm,
        ISNULL(F.NAME,'NA')                                            AS rhxxmc,
        ISNULL(H.jbs  ,'NA')                                           AS jbs,
        ISNULL(H.crbs ,'NA')                                           AS crbs,
        ISNULL(H.yfjzs,'NA')                                           AS yfjzs,
        ISNULL(H.sss  ,'NA')                                           AS sss,
        ISNULL(H.sxs  ,'NA')                                           AS sxs,
        ISNULL(H.gms  ,'NA')                                           AS gms,
        ISNULL(H.grs  ,'NA')                                           AS grs,
        ISNULL(H.hys  ,'NA')                                           AS hys,
        ISNULL(H.yjs  ,'NA')                                           AS yjs,
        ISNULL(H.jzs  ,'NA')                                           AS jzs,
        GETDATE()                                                                       AS gxsj,
        ISNULL(CONVERT(varchar,A.SYXH),'NA')                            AS syxh
        FROM [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] A(nolock)
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] B(nolock) ON A.EMRXH = B.SYXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BASYK] C(nolock) ON C.SYXH = B.SYXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] E(nolock) ON C.XXDM = E.MXDM AND E.LBDM = '96'
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] F(nolock) ON C.RHJY = F.MXDM AND F.LBDM = '97'
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] G(nolock) ON  G.SYXH = A.EMRXH AND G.MXFLDM LIKE 'B-1020%' AND G.YXJL = 1
        LEFT JOIN [HLHT_RYJL_JBXX] H(nolock) ON  G.QTBLJLXH = H.yjlxh
        where
        CONVERT(date,substring(A.RYRQ,1,4)+'-'+substring(A.RYRQ,5,2)+'-'+substring(A.RYRQ,7,2))
        between  @startDate and @endDate
      end
	end
else
 if @sourceType = '1'
     begin
       SELECT
        A.GHXH                                                                      AS yjlxh,
        A.GHXH                                                                      AS jzlsh,
        A.PATID                                                                     AS patid,
        A.HZXM                                                                      AS hzxm,
        A.GHXH                                                                      AS mjzh,
        'NA'                                                                        AS zyh,
        '1'                                                                         AS jzlb,
        A.SEX                                                                       AS xbmc,
        CASE A.SEX WHEN '男' THEN '1' WHEN '女' THEN '2' ELSE '3' END               AS xbdm,
        convert(varchar(18),isnull(A.SFZH,''))                         AS sfzhm,
        A.YBDM                                                                      AS jkkh,
        ISNULL(B.XXDM,'NA')                                                         AS aboxxdm,
        ISNULL(E.NAME,'NA')                                                         AS aboxxmc,
        ISNULL(B.RHJY,'NA')                                                         AS rhxxdm,
        ISNULL(F.NAME,'NA')                                                         AS rhxxmc,
        ISNULL(H.xbs,'NA')                                                          AS jbs,
        'NA'                                                                                         AS crbs,
        'NA'                                                                                         AS yfjzs,
        'NA'                                                                                         AS sss,
        'NA'                                                                                         AS sxs,
        ISNULL(H.gms,'NA')                                                                           AS gms,
        'NA'                                                                                         AS grs,
        'NA'                                                                                         AS hys,
        'NA'                                                                                         AS yjs,
        'NA'                                                                                         AS jzs,
        GETDATE()                                                                                    AS gxsj,
        CONVERT(VARCHAR,ISNULL(A.EMRXH,'0'))                                                        AS syxh
        FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_JZJLK] A(nolock)
        LEFT JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[EMR_BASYK] B(nolock) ON A.EMRXH  = B.SYXH
        LEFT JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] E(nolock) ON B.XXDM = E.MXDM AND E.LBDM = '96'
        LEFT JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] F(nolock) ON B.RHJY = F.MXDM AND F.LBDM = '97'
        LEFT JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[EMR_QTBLJLK] G(nolock) ON  G.SYXH = A.EMRXH AND G.MXFLDM LIKE 'B+9868%' AND G.YXJL = 1
        LEFT JOIN [HLHT_MJZBL_JZLGBL] H(nolock) ON  G.QTBLJLXH = H.yjlxh
        where
        CONVERT(date,substring(A.GHRQ,1,4)+'-'+substring(A.GHRQ,5,2)+'-'+substring(A.GHRQ,7,2))
        between  @startDate and @endDate
     end
    else
      begin
      SELECT
        A.SYXH                                                         AS yjlxh,
        A.SYXH                                                         AS jzlsh,
        A.PATID                                                        AS patid,
        A.HZXM                                                         AS hzxm,
        case when A.MZH = '' then 'NA' else ISNULL(A.MZH,'NA') end                      AS mjzh,
        B.ZYHM                                                          AS zyh,
        '2'                                                             AS jzlb,
        A.SEX                                                           AS xbmc,
        CASE A.SEX WHEN '男' THEN '1' WHEN '女' THEN '2' ELSE '3' END  AS xbdm,
        convert(varchar(18),isnull(A.SFZH,''))                         AS sfzhm,
        A.YBDM                                                         AS jkkh,
        ISNULL(C.XXDM,'NA')                                            AS aboxxdm,
        ISNULL(E.NAME,'NA')                                            AS aboxxmc,
        ISNULL(C.RHJY,'NA')                                            AS rhxxdm,
        ISNULL(F.NAME,'NA')                                            AS rhxxmc,
        ISNULL(H.jbs  ,'NA')                                           AS jbs,
        ISNULL(H.crbs ,'NA')                                           AS crbs,
        ISNULL(H.yfjzs,'NA')                                           AS yfjzs,
        ISNULL(H.sss  ,'NA')                                           AS sss,
        ISNULL(H.sxs  ,'NA')                                           AS sxs,
        ISNULL(H.gms  ,'NA')                                           AS gms,
        ISNULL(H.grs  ,'NA')                                           AS grs,
        ISNULL(H.hys  ,'NA')                                           AS hys,
        ISNULL(H.yjs  ,'NA')                                           AS yjs,
        ISNULL(H.jzs  ,'NA')                                           AS jzs,
        GETDATE()                                                                       AS gxsj,
        ISNULL(CONVERT(varchar,A.SYXH),'NA')                            AS syxh
        FROM [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] A(nolock)
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] B(nolock) ON A.EMRXH = B.SYXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BASYK] C(nolock) ON C.SYXH = B.SYXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] E(nolock) ON C.XXDM = E.MXDM AND E.LBDM = '96'
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] F(nolock) ON C.RHJY = F.MXDM AND F.LBDM = '97'
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] G(nolock) ON  G.SYXH = A.EMRXH AND G.MXFLDM LIKE 'B-1020%' AND G.YXJL = 1
        LEFT JOIN [HLHT_RYJL_JBXX] H(nolock) ON  G.QTBLJLXH = H.yjlxh
        where
        CONVERT(date,substring(A.RYRQ,1,4)+'-'+substring(A.RYRQ,5,2)+'-'+substring(A.RYRQ,7,2))
        between  @startDate and @endDate
      end
END

