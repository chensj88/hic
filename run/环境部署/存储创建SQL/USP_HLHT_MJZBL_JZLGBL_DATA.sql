CREATE PROCEDURE [dbo].[USP_HLHT_MJZBL_JZLGBL_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chensj
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出互联互通24H出入院记录 ---USP_HLHT_MJZBL_JZLGBL_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_MJZBL_JZLGBL_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_MJZBL_JZLGBL_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
[注意事项]
 在CIS_HLHT中创建
*/
begin
--判断@syxh是否存在
if @syxh  is null or @syxh = ''
  --不存在首页序号
	begin
    --创建临时表
		SELECT * INTO #EMR_QTBLJLK FROM [HLHT_MZ_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE EXISTS (SELECT 1 FROM MBZ_DATA_LIST_SET A(nolock) WHERE A.SOURCE_TYPE=@sourceType and A.MODEL_CODE = T.BLDM)
		 AND T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		 AND T.TJSJ IS NOT NULL  AND T.TJSJ !='' AND T.YXJL = 1
		--在临时表上增加索引
		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK (BLDM, YXJL, TJSJ);
		--查询业务数据
      select
        a.QTBLJLXH                                                                        as yjlxh,
        b.GHXH                                                                            as jzlsh,
        b.PATID                                                                           as patid,
        b.HZXM                                                                            as hzxm,
        b.GHXH                                                                            as mjzh,
        ISNULL(b.BLH,'NA')                                                                 as zyh,
        isnull(b.SFZH,'NA')                                                                as sfzhm,
        b.KSDM                                                                            as ksdm,
        b.KSMC                                                                            as ksmc,
        b.SEX                                                                             as xbmc,
        CASE b.SEX WHEN '女' THEN '2' WHEN '男' THEN '1'ELSE '3' END                      as xbdm,
        CONVERT(DATE, ISNULL(b.BIRTH, '1990-01-01 00:00:00'), 120)                        AS csrq,
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.BIRTH)))) ,'NA') as nls,
        datediff(month,b.BIRTH,substring(convert(char(8),getdate(),112),1,8)) %12         as nly,
        CONVERT(datetime,substring( b.JZRQ,1,4)+'-'+substring(b.JZRQ,5,2)+'-'+
                 substring(b.JZRQ,7,2)+' ' +substring(b.JZRQ,9,8) )                       as jzrqsj,
        case when b.CFZBZ = '0' then 1 else 2 end                                         as czbzdm,
        case when b.CFZBZ = '0' then '初诊' else '复诊' end                                as czbzmc,
        a.FSSJ                                                                            as jlrqsj,
        GETDATE()                                                             as gxsj,
        a.SYXH as syxh,
        a.BLMC as blmc,
		a.FSSJ as fssj,
		a.BLNR as blnr
        from #EMR_QTBLJLK a
        left join [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_JZJLK] b(nolock) on a.SYXH = b.EMRXH
		--删除临时表
		DROP TABLE #EMR_QTBLJLK
	 end
else
  --存在@syxh
	begin
	 --创建临时表
		SELECT * INTO #EMR_QTBLJLK_TEMP FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE EXISTS (SELECT 1 FROM dbo.MBZ_DATA_LIST_SET A(nolock) WHERE A.SOURCE_TYPE=@sourceType and A.MODEL_CODE = T.BLDM)
		 AND T.TJSJ BETWEEN CONVERT (DATE, @startDate) AND CONVERT (DATE, @endDate)
		 AND T.TJSJ IS NOT NULL  AND T.TJSJ !='' AND T.YXJL = 1 AND T.SYXH=@syxh
		 --在临时表上增加索引
		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (BLDM, YXJL, TJSJ);
		--查询业务数据
    select
        a.QTBLJLXH                                                                        as yjlxh,
        b.GHXH                                                                            as jzlsh,
        b.PATID                                                                           as patid,
        b.HZXM                                                                            as hzxm,
        b.GHXH                                                                            as mjzh,
        ISNULL(b.BLH,'NA')                                                                 as zyh,
        isnull(b.SFZH,'NA')                                                                as sfzhm,
        b.KSDM                                                                            as ksdm,
        b.KSMC                                                                            as ksmc,
        b.SEX                                                                             as xbmc,
        CASE b.SEX WHEN '女' THEN '2' WHEN '男' THEN '1'ELSE '3' END                      as xbdm,
        CONVERT(DATE, ISNULL(b.BIRTH, '1990-01-01 00:00:00'), 120)                        AS csrq,
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.BIRTH)))) ,'NA') as nls,
        datediff(month,b.BIRTH,substring(convert(char(8),getdate(),112),1,8)) %12         as nly,
        CONVERT(datetime,substring( b.JZRQ,1,4)+'-'+substring(b.JZRQ,5,2)+'-'+
                 substring(b.JZRQ,7,2)+' ' +substring(b.JZRQ,9,8) )                       as jzrqsj,
        case when b.CFZBZ = '0' then 1 else 2 end                                         as czbzdm,
        case when b.CFZBZ = '0' then '初诊' else '复诊' end                                as czbzmc,
        a.FSSJ                                                                            as jlrqsj,
        GETDATE()                                                             as gxsj,
        a.SYXH as syxh,
        a.BLMC as blmc,
		a.FSSJ as fssj,
		a.BLNR as blnr
        from #EMR_QTBLJLK_TEMP a
        left join [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_JZJLK] b(nolock) on a.SYXH = b.EMRXH
		--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
	end
end
