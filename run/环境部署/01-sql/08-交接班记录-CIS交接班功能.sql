CREATE PROCEDURE [dbo].[USP_HLHT_ZYBCJL_JJBJL_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as

/*
[创建者] CHENSJ
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出交接班 ---USP_HLHT_ZYBCJL_JJBJL_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZYBCJL_JJBJL_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZYBCJL_JJBJL_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
[注意事项]
 1、在CIS_HLHT中创建
 2、使用CIS提供的交接班系统完成
*/


begin
--创建临时表
if @syxh  is null or @syxh = ''
	begin
    SELECT
	  b.JBMXXH as yjlxh,
      c.SYXH AS jzlsh,
      c.PATID AS patid,
      c.BLH AS zyh,
      c.KSDM AS ksdm,
      c.KSMC AS ksmc,
      c.BQDM AS bqdm,
      c.BQMC AS bqmc,
      isnull((CASE f.fjh WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE f.fjh END),'NA') AS bfh,
      isnull((CASE f.fjh WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE f.fjh END),'NA')+'病房' AS bfmc,
      c.CWDM AS bch,
      c.HZXM AS hzxm,
      c.SFZH AS sfzhm,
      (SELECT CASE c.SEX WHEN '女' THEN '2' WHEN '男' THEN '1' ELSE '0' END ) AS xbdm,
      c.SEX AS xbmc,
      ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, c.BIRTH)))) ,'''') as nls,
      DATEDIFF(MONTH,c.BIRTH,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
      CONVERT(datetime,substring(c.RYRQ,1,4)+'-'+substring(c.RYRQ,5,2)+'-'+substring(c.RYRQ,7,2)+' '+substring(c.RYRQ,9,8)) AS ryrq,
      'NA' AS zs,
      'NA' AS ryqk,
      'NA' AS zyszgcjg,
      'NA' AS rzxyzdbm,
      isnull(b.RYZD,'NA') AS rzxyzd,
      'NA' AS rzzybmdm,
      'NA' AS rzzybm,
      'NA' AS rzzyzhdm,
      'NA' AS rzzyzh,
      'NA' AS zfbm,
      'NA' AS zzzf,
      CASE WHEN b.CZCS = '' OR b.CZCS is null then 'NA' else b.CZCS end AS zlgcms,
      CASE WHEN b.MQBK = '' OR b.MQBK is null then 'NA' else b.MQBK end AS mqqk,
      'NA' AS mqzdxyzdbm,
      'NA' AS mqzdxyzd,
      'NA' AS mqzdzybmdm,
      'NA' AS mqzdzybm,
      'NA' AS mqzdzyzhdm,
      'NA' AS mqzdzyzh,
      'NA' AS zysx,
      'NA' AS jbzljh,
      a.JBSJ AS jbrq,
      a.JBRY AS jbysbm,
      e.NAME AS jbzqm,
      b.JSSJ AS jbsj,
      b.JSRY AS ysbm,
      g.NAME AS ysxm,
      b.JSRY AS jbrdm,
      g.NAME AS jbrqm,
       GETDATE() AS gxsj,
       '1' AS yxjl,
        b.SYXH AS syxh,
        '4602'  as tjzt,
        '交接班记录'  as blmc,
        a.CJSJ as fssj,
        '' as blnr
     FROM
      [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_JJBJLK] a(nolock)
      INNER JOIN	[HLHT_ZY_CIS].[CISDB].[dbo].[EMR_JJBMXK] b(nolock) on a.JBXH = b.JBXH
      INNER JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) on b.SYXH = c.EMRXH
      INNER JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] d(nolock) on b.SYXH = d.SYXH
      INNER JOIN [HLHT_ZY_HIS].[This40].[dbo].[ZY_BCDMK] f(nolock) ON f.id = d.RYCW and f.bqdm=d.RYBQ
      INNER JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] e(nolock) ON a.JBRY =e.ID
      INNER JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] g(nolock) ON b.JSRY =g.ID
    where a.JBSJ is not null and a.JBSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
	end
else
	begin
SELECT
      b.JBMXXH as yjlxh,
      c.SYXH AS jzlsh,
      c.PATID AS patid,
      c.BLH AS zyh,
      c.KSDM AS ksdm,
      c.KSMC AS ksmc,
      c.BQDM AS bqdm,
      c.BQMC AS bqmc,
      isnull((CASE f.fjh WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE f.fjh END),'NA') AS bfh,
      isnull((CASE f.fjh WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE f.fjh END),'NA')+'病房' AS bfmc,
      c.CWDM AS bch,
      c.HZXM AS hzxm,
      c.SFZH AS sfzhm,
      (SELECT CASE c.SEX WHEN '女' THEN '2' WHEN '男' THEN '1' ELSE '0' END ) AS xbdm,
      c.SEX AS xbmc,
      ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, c.BIRTH)))) ,'''') as nls,
      DATEDIFF(MONTH,c.BIRTH,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
      CONVERT(datetime,substring(c.RYRQ,1,4)+'-'+substring(c.RYRQ,5,2)+'-'+substring(c.RYRQ,7,2)+' '+substring(c.RYRQ,9,8)) AS ryrq,
      'NA' AS zs,
      'NA' AS ryqk,
      'NA' AS zyszgcjg,
      'NA' AS rzxyzdbm,
      isnull(b.RYZD,'NA') AS rzxyzd,
      'NA' AS rzzybmdm,
      'NA' AS rzzybm,
      'NA' AS rzzyzhdm,
      'NA' AS rzzyzh,
      'NA' AS zfbm,
      'NA' AS zzzf,
      CASE WHEN b.CZCS = '' OR b.CZCS is null then 'NA' else b.CZCS end AS zlgcms,
      CASE WHEN b.MQBK = '' OR b.MQBK is null then 'NA' else b.MQBK end AS mqqk,
      'NA' AS mqzdxyzdbm,
      'NA' AS mqzdxyzd,
      'NA' AS mqzdzybmdm,
      'NA' AS mqzdzybm,
      'NA' AS mqzdzyzhdm,
      'NA' AS mqzdzyzh,
      'NA' AS zysx,
      'NA' AS jbzljh,
      a.JBSJ AS jbrq,
      a.JBRY AS jbysbm,
      e.NAME AS jbzqm,
      b.JSSJ AS jbsj,
      b.JSRY AS ysbm,
      g.NAME AS ysxm,
      b.JSRY AS jbrdm,
      g.NAME AS jbrqm,
       GETDATE() AS gxsj,
       '1' AS yxjl,
        b.SYXH AS syxh,
        '4602'  as tjzt,
        '交接班记录'  as blmc,
        a.CJSJ as fssj,
        '' as blnr
     FROM
      [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_JJBJLK] a(nolock)
      INNER JOIN	[HLHT_ZY_CIS].[CISDB].[dbo].[EMR_JJBMXK] b(nolock) on a.JBXH = b.JBXH
      INNER JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) on b.SYXH = c.EMRXH
      INNER JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] d(nolock) on b.SYXH = d.SYXH
      INNER JOIN [HLHT_ZY_HIS].[This40].[dbo].[ZY_BCDMK] f(nolock) ON f.id = d.RYCW and f.bqdm=d.RYBQ
      INNER JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] e(nolock) ON a.JBRY =e.ID
      INNER JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[SYS_ZGDMK] g(nolock) ON b.JSRY =g.ID
    where a.JBSJ is not null and a.JBSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
    and b.SYXH = @syxh
    end

	END



