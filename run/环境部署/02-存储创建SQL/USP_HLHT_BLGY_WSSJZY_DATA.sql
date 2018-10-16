USE [CIS_HLHT]
GO
/****** Object:  StoredProcedure [dbo].[USP_HLHT_BLGY_JBJKXX_DATA]    Script Date: 2018/10/15 14:00:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_HLHT_BLGY_WSSJZY_DATA]
@sourceType varchar(64),   --抽取数据类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chenkuai
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出卫生事件 ---USP_HLHT_BLGY_WSSJZY_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_CYXJ_CYXJ_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_CYXJ_CYXJ_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
[注意事项]
 在CIS_HLHT中创建
*/

begin
--创建临时表
if @syxh  is null or @syxh = ''
	begin
    SELECT
            T.XH as yjlxh,
            T.GHXH as jzlsh,
            T.PATID as patid,
            T.HZXM as hzxm,
            CONVERT(varchar,T.GHXH) as mjzh,
            '0' as zyh,
            1 as jzlb,
            (SELECT CASE T.SFZH WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE T.SFZH END) as sfzhm,
            (SELECT CASE T.SEX WHEN '男' THEN '1' WHEN '女' THEN '2' ELSE '3' END) as xbdm,
            T.SEX as xbmc,
            'NA' as jmjkkh,
            ii.DICT_LABEL AS zzjgdm,
            i.DICT_LABEL AS zzjgmc,
            T.KSDM as ksdm,
            T.KSMC as ksmc,
            1 as hzlxdm,
            '门诊' as hzlxmc,
            ISNULL(CONVERT(datetime,substring(T.CZRQ,1,4)+'-'+substring(T.CZRQ,5,2)+'-'+substring(T.CZRQ,7,2)+' '+substring(T.CZRQ,9,8)),'1990-01-01 00:00:00.000') as jzrqsj,
            ISNULL(CONVERT(datetime,substring(T.GHRQ,1,4)+'-'+substring(T.GHRQ,5,2)+'-'+substring(T.GHRQ,7,2)+' '+substring(T.GHRQ,9,8)),'1990-01-01 00:00:00.000') as ryrqsj,
            --ISNULL(CONVERT(datetime,substring(T.JZRQ,1,4)+'-'+substring(T.JZRQ,5,2)+'-'+substring(T.JZRQ,7,2)+' '+substring(T.JZRQ,9,8)),'1990-01-01 00:00:00.000') as cyrqsj,
            ISNULL(CONVERT(datetime,substring(T.ZJRQ,1,4)+'-'+substring(T.ZJRQ,5,2)+'-'+substring(T.ZJRQ,7,2)+' '+substring(T.ZJRQ,9,8)),'1990-01-01 00:00:00.000') as cyrqsj,
            ISNULL(CONVERT(datetime,substring(T.LRRQ,1,4)+'-'+substring(T.LRRQ,5,2)+'-'+substring(T.LRRQ,7,2)),'1990-01-01 00:00:00.000') as fbrqsj,
            (SELECT CASE T.ZDMC WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE T.ZDMC END) as jzyy,
            T.ZDDM as xyzd,
            T.ZDMC as xyzdmc,
            'NA' as zybm,
            'NA' as zybmmc,
            'NA' as zyzh,
            'NA' as zyzhmc,
            ISNULL(T.DBZDDM,'NA') as qtxyzd,
            ISNULL(T.DBZDMC, 'NA') as qtxyzdmc,
            'NA' as ssjcz,
            'NA' as ssjczmc,
            'NA' AS gjywdm,
            'NA' AS gjywmc,
            'NA' AS gjywyf,
            '无不良反应' as ywblfy,
            ISNULL(zycf.cflb, '1') AS zysylb,
            (SELECT CASE zycf.cflb WHEN '1' THEN '未使用' WHEN '2' THEN '中成药' WHEN '3' THEN '中草药' WHEN '9' THEN '其他中药' ELSE '未使用' END ) as zysylbmc,
            '无' as qtyxcz,
            'NA' as gbsy,
            'NA' as gbsymc,
            1 as zljg,
            '治愈' as zljgmc,
            ISNULL(T.YSDM, 'NA') as zrysbm,
            (SELECT CASE T.YSMC WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE T.YSMC END) as zrys,
            GETDATE() AS gxsj,T.GHXH as syxh
            FROM  [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_NJZJLK] T(nolock)
            LEFT JOIN [CIS_HLHT].[dbo].[MBZ_DICT_INFO] i(nolock) ON i.DICT_CODE = 'hospitalInfoName'
            LEFT JOIN [CIS_HLHT].[dbo].[MBZ_DICT_INFO] ii(nolock) ON ii.DICT_CODE = 'hospitalInfoNo'
            LEFT JOIN [CIS_HLHT].[dbo].[HLHT_MJZCF_ZYCF] zycf(nolock) ON zycf.jzlsh = T.GHXH
            WHERE T.JLZT='1' AND T.FZBZ >1 AND
            CONVERT(date,substring(T.GHRQ,1,4)+'-'+substring(T.GHRQ,5,2)+'-'+substring(T.GHRQ,7,2))
            between  @startDate and @endDate

    UNION ALL
    SELECT
            B.EMRXH as yjlxh,
            B.SYXH as jzlsh,
            B.PATID as patid,
            B.HZXM as hzxm,
            (SELECT CASE CONVERT(varchar,B.MZH) WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE CONVERT(varchar,B.MZH) END) as mjzh,
            B.BLH as zyh,
            2 as jzlb,
            (SELECT CASE B.SFZH WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE B.SFZH END) as sfzhm,
            (SELECT CASE B.SEX WHEN '男' THEN '1' WHEN '女' THEN '2' ELSE '3' END) as xbdm,
            B.SEX as xbmc,
            'NA' as jmjkkh,
            ii.DICT_LABEL AS zzjgdm,
            i.DICT_LABEL AS zzjgmc,
            B.KSDM as ksdm,
            B.KSMC as ksmc,
            3 as hzlxdm,
            '住院' as hzlxmc,
            ISNULL(CONVERT(datetime,substring(B.LRRQ,1,4)+'-'+substring(B.LRRQ,5,2)+'-'+substring(B.LRRQ,7,2)+' '+substring(B.LRRQ,9,8)),'1990-01-01 00:00:00.000') as jzrqsj,
            ISNULL(CONVERT(datetime,substring(B.RYRQ,1,4)+'-'+substring(B.RYRQ,5,2)+'-'+substring(B.RYRQ,7,2)+' '+substring(B.RYRQ,9,8)),'1990-01-01 00:00:00.000') as ryrqsj,
            ISNULL(CONVERT(datetime,substring(B.CYRQ,1,4)+'-'+substring(B.CYRQ,5,2)+'-'+substring(B.CYRQ,7,2)+' '+substring(B.CYRQ,9,8)),'1990-01-01 00:00:00.000') as cyrqsj,
            '1990-01-01 00:00:00.000' as fbrqsj,
            (SELECT CASE B.ZDMC WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE B.ZDMC END) as jzyy,
            ISNULL(tt.czxyzdbm,'NA') AS xyzd,
            ISNULL(tt.czxyzdmc,'NA') AS xyzdmc,
            ISNULL(tt.czzybmdm,'NA') AS zybm,
            ISNULL(tt.czzybmmc,'NA') AS zybmmc,
            ISNULL(tt.czzyzhdm,'NA') AS zyzh,
            ISNULL(tt.czzyzhmc,'NA') AS zyzhmc,
            ISNULL(B.CYZDDM, 'NA') as qtxyzd,
            ISNULL(B.CYZDMC , 'NA') as qtxyzdmc,
            'NA' as ssjcz,
            'NA' as ssjczmc,
            'NA' AS gjywdm,
            'NA' AS gjywmc,
            'NA' AS gjywyf,
            '无不良反应' as ywblfy,
            1 as zysylb,
            '未使用' as zysylbmc,
            '无' as qtyxcz,
            'NA' as gbsy,
            'NA' as gbsymc,
            ISNULL(cyxj.zljgdm,'1') AS zljg,
            ISNULL(cyxj.zljgmc,'治愈') AS zljgmc,
            ISNULL(B.YSDM, 'NA') as zrysbm,
            (SELECT CASE B.YSXM WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE B.YSXM END) as zrys,
            GETDATE() AS gxsj,
            B.SYXH as syxh
            FROM [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock)
            LEFT JOIN [CIS_HLHT].[dbo].[MBZ_DICT_INFO] i(nolock) ON i.DICT_CODE = 'hospitalInfoName'
            LEFT JOIN [CIS_HLHT].[dbo].[MBZ_DICT_INFO] ii(nolock) ON ii.DICT_CODE = 'hospitalInfoNo'
            LEFT JOIN [CIS_HLHT].[dbo].[HLHT_RYJL_JBXX] tt(nolock) ON tt.jzlsh = B.SYXH
            LEFT JOIN [CIS_HLHT].[dbo].[HLHT_CYXJ_CYXJ] cyxj(nolock) ON cyxj.jzlsh = B.SYXH
            WHERE B.BRZT !=9 AND CONVERT(date,substring(B.RYRQ,1,4)+'-'+substring(B.RYRQ,5,2)+'-'+substring(B.RYRQ,7,2))
            between  @startDate and @endDate
    END

  ELSE
    BEGIN

     SELECT
            T.XH as yjlxh,
            T.GHXH as jzlsh,
            T.PATID as patid,
            T.HZXM as hzxm,
            CONVERT(varchar,T.GHXH) as mjzh,
            '0' as zyh,
            1 as jzlb,
            (SELECT CASE T.SFZH WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE T.SFZH END) as sfzhm,
            (SELECT CASE T.SEX WHEN '男' THEN '1' WHEN '女' THEN '2' ELSE '3' END) as xbdm,
            T.SEX as xbmc,
            'NA' as jmjkkh,
            ii.DICT_LABEL AS zzjgdm,
            i.DICT_LABEL AS zzjgmc,
            T.KSDM as ksdm,
            T.KSMC as ksmc,
            1 as hzlxdm,
            '门诊' as hzlxmc,
            ISNULL(CONVERT(datetime,substring(T.CZRQ,1,4)+'-'+substring(T.CZRQ,5,2)+'-'+substring(T.CZRQ,7,2)+' '+substring(T.CZRQ,9,8)),'1990-01-01 00:00:00.000') as jzrqsj,
            ISNULL(CONVERT(datetime,substring(T.GHRQ,1,4)+'-'+substring(T.GHRQ,5,2)+'-'+substring(T.GHRQ,7,2)+' '+substring(T.GHRQ,9,8)),'1990-01-01 00:00:00.000') as ryrqsj,
            --ISNULL(CONVERT(datetime,substring(T.JZRQ,1,4)+'-'+substring(T.JZRQ,5,2)+'-'+substring(T.JZRQ,7,2)+' '+substring(T.JZRQ,9,8)),'1990-01-01 00:00:00.000') as cyrqsj,
            ISNULL(CONVERT(datetime,substring(T.ZJRQ,1,4)+'-'+substring(T.ZJRQ,5,2)+'-'+substring(T.ZJRQ,7,2)+' '+substring(T.ZJRQ,9,8)),'1990-01-01 00:00:00.000') as cyrqsj,
            ISNULL(CONVERT(datetime,substring(T.LRRQ,1,4)+'-'+substring(T.LRRQ,5,2)+'-'+substring(T.LRRQ,7,2)),'1990-01-01 00:00:00.000') as fbrqsj,
            (SELECT CASE T.ZDMC WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE T.ZDMC END) as jzyy,
            T.ZDDM as xyzd,
            T.ZDMC as xyzdmc,
            'NA' as zybm,
            'NA' as zybmmc,
            'NA' as zyzh,
            'NA' as zyzhmc,
            ISNULL(T.DBZDDM,'NA') as qtxyzd,
            ISNULL(T.DBZDMC, 'NA') as qtxyzdmc,
            'NA' as ssjcz,
            'NA' as ssjczmc,
            'NA' AS gjywdm,
            'NA' AS gjywmc,
            'NA' AS gjywyf,
            '无不良反应' as ywblfy,
            ISNULL(zycf.cflb, '1') AS zysylb,
            (SELECT CASE zycf.cflb WHEN '1' THEN '未使用' WHEN '2' THEN '中成药' WHEN '3' THEN '中草药' WHEN '9' THEN '其他中药' ELSE '未使用' END ) as zysylbmc,
            '无' as qtyxcz,
            'NA' as gbsy,
            'NA' as gbsymc,
            1 as zljg,
            '治愈' as zljgmc,
            ISNULL(T.YSDM, 'NA') as zrysbm,
            (SELECT CASE T.YSMC WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE T.YSMC END) as zrys,
            GETDATE() AS gxsj,T.GHXH as syxh
            FROM  [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_NJZJLK] T(nolock)
            LEFT JOIN [CIS_HLHT].[dbo].[MBZ_DICT_INFO] i(nolock) ON i.DICT_CODE = 'hospitalInfoName'
            LEFT JOIN [CIS_HLHT].[dbo].[MBZ_DICT_INFO] ii(nolock) ON ii.DICT_CODE = 'hospitalInfoNo'
            LEFT JOIN [CIS_HLHT].[dbo].[HLHT_MJZCF_ZYCF] zycf(nolock) ON zycf.jzlsh = T.GHXH
            WHERE T.JLZT='1' AND T.FZBZ >1 AND
            CONVERT(date,substring(T.GHRQ,1,4)+'-'+substring(T.GHRQ,5,2)+'-'+substring(T.GHRQ,7,2))
            between  @startDate and @endDate AND  T.EMRXH =@syxh

    UNION ALL
    SELECT
            B.EMRXH as yjlxh,
            B.SYXH as jzlsh,
            B.PATID as patid,
            B.HZXM as hzxm,
            (SELECT CASE CONVERT(varchar,B.MZH) WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE CONVERT(varchar,B.MZH) END) as mjzh,
            B.BLH as zyh,
            2 as jzlb,
            (SELECT CASE B.SFZH WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE B.SFZH END) as sfzhm,
            (SELECT CASE B.SEX WHEN '男' THEN '1' WHEN '女' THEN '2' ELSE '3' END) as xbdm,
            B.SEX as xbmc,
            'NA' as jmjkkh,
            ii.DICT_LABEL AS zzjgdm,
            i.DICT_LABEL AS zzjgmc,
            B.KSDM as ksdm,
            B.KSMC as ksmc,
            3 as hzlxdm,
            '住院' as hzlxmc,
            ISNULL(CONVERT(datetime,substring(B.LRRQ,1,4)+'-'+substring(B.LRRQ,5,2)+'-'+substring(B.LRRQ,7,2)+' '+substring(B.LRRQ,9,8)),'1990-01-01 00:00:00.000') as jzrqsj,
            ISNULL(CONVERT(datetime,substring(B.RYRQ,1,4)+'-'+substring(B.RYRQ,5,2)+'-'+substring(B.RYRQ,7,2)+' '+substring(B.RYRQ,9,8)),'1990-01-01 00:00:00.000') as ryrqsj,
            ISNULL(CONVERT(datetime,substring(B.CYRQ,1,4)+'-'+substring(B.CYRQ,5,2)+'-'+substring(B.CYRQ,7,2)+' '+substring(B.CYRQ,9,8)),'1990-01-01 00:00:00.000') as cyrqsj,
            '1990-01-01 00:00:00.000' as fbrqsj,
            (SELECT CASE B.ZDMC WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE B.ZDMC END) as jzyy,
            ISNULL(tt.czxyzdbm,'NA') AS xyzd,
            ISNULL(tt.czxyzdmc,'NA') AS xyzdmc,
            ISNULL(tt.czzybmdm,'NA') AS zybm,
            ISNULL(tt.czzybmmc,'NA') AS zybmmc,
            ISNULL(tt.czzyzhdm,'NA') AS zyzh,
            ISNULL(tt.czzyzhmc,'NA') AS zyzhmc,
            ISNULL(B.CYZDDM, 'NA') as qtxyzd,
            ISNULL(B.CYZDMC , 'NA') as qtxyzdmc,
            'NA' as ssjcz,
            'NA' as ssjczmc,
            'NA' AS gjywdm,
            'NA' AS gjywmc,
            'NA' AS gjywyf,
            '无不良反应' as ywblfy,
            1 as zysylb,
            '未使用' as zysylbmc,
            '无' as qtyxcz,
            'NA' as gbsy,
            'NA' as gbsymc,
            ISNULL(cyxj.zljgdm,'1') AS zljg,
            ISNULL(cyxj.zljgmc,'治愈') AS zljgmc,
            ISNULL(B.YSDM, 'NA') as zrysbm,
            (SELECT CASE B.YSXM WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE B.YSXM END) as zrys,
            GETDATE() AS gxsj,
            B.SYXH as syxh
            FROM [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] B(nolock)
            LEFT JOIN [CIS_HLHT].[dbo].[MBZ_DICT_INFO] i(nolock) ON i.DICT_CODE = 'hospitalInfoName'
            LEFT JOIN [CIS_HLHT].[dbo].[MBZ_DICT_INFO] ii(nolock) ON ii.DICT_CODE = 'hospitalInfoNo'
            LEFT JOIN [CIS_HLHT].[dbo].[HLHT_RYJL_JBXX] tt(nolock) ON tt.jzlsh = B.SYXH
            LEFT JOIN [CIS_HLHT].[dbo].[HLHT_CYXJ_CYXJ] cyxj(nolock) ON cyxj.jzlsh = B.SYXH
            WHERE B.BRZT !=9 AND CONVERT(date,substring(B.RYRQ,1,4)+'-'+substring(B.RYRQ,5,2)+'-'+substring(B.RYRQ,7,2))
            between  @startDate and @endDate AND  B.SYXH =@syxh
    END

END
