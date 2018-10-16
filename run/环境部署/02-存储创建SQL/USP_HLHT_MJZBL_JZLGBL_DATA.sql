GO
create PROCEDURE [dbo].[USP_HLHT_MJZBL_JZLGBL_DATA]
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
      SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM INTO #EMR_QTBLJLK_LS FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		 AND T.YXJL=1
         --在临时表上增加索引
		CREATE INDEX QUERY_INDEX_LS ON #EMR_QTBLJLK_LS (BLDM);

		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM INTO #EMR_QTBLJLK FROM #EMR_QTBLJLK_LS T(nolock)
		LEFT JOIN MBZ_DATA_LIST_SET A(nolock) on T.BLDM=A.MODEL_CODE
		WHERE A.SOURCE_TYPE=@sourceType

		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK (SYXH);
		--查询业务数据
      select
        a.QTBLJLXH                                                                        as yjlxh,
        ISNULL(b.GHXH, c.GHXH)                                                                         as jzlsh,
        ISNULL(b.PATID,c.PATID )                                                                          as patid,
        ISNULL(b.HZXM ,c.HZXM  )                                                                          as hzxm,
        ISNULL(b.GHXH, c.GHXH  )                                                                         as mjzh,
        ISNULL(ISNULL(b.BLH,c.BLH),'NA')                                                                 as zyh,
        ISNULL(isnull(b.SFZH,c.SFZH),'NA')                                                                as sfzhm,
        ISNULL(b.KSDM,c.KSDM)                                                                            as ksdm,
        ISNULL(b.KSMC,c.KSMC)                                                                            as ksmc,
        ISNULL(b.SEX ,c.SEX )                                                                            as xbmc,
        CASE ISNULL(b.SEX,c.SEX) WHEN '女' THEN '2' WHEN '男' THEN '1'ELSE '3' END                      as xbdm,
        CONVERT(DATE, ISNULL(ISNULL(b.BIRTH,c.BIRTH), '1990-01-01 00:00:00'), 120)                        AS csrq,
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, ISNULL(b.BIRTH,c.BIRTH))))) ,'NA') as nls,
        datediff(month,ISNULL(b.BIRTH,c.BIRTH),substring(convert(char(8),getdate(),112),1,8)) %12         as nly,
        CONVERT(datetime,substring( ISNULL(b.JZRQ,c.JZRQ),1,4)+'-'+substring(ISNULL(b.JZRQ,c.JZRQ),5,2)+'-'+
                 substring(ISNULL(b.JZRQ,c.JZRQ),7,2)+' ' +substring(ISNULL(b.JZRQ,c.JZRQ),9,8) )                       as jzrqsj,
        case when ISNULL(b.CFZBZ,c.CFZBZ) = '0' then 1 else 2 end                                         as czbzdm,
        case when ISNULL(b.CFZBZ,c.CFZBZ) = '0' then '初诊' else '复诊' end                                as czbzmc,
        a.FSSJ                                                                            as jlrqsj,
        GETDATE()                                                             as gxsj,
        a.SYXH as syxh,
        a.BLMC as blmc,
		    a.FSSJ as fssj,
		    a.BLNR as blnr
        from #EMR_QTBLJLK a
        left join [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_JZJLK] b(nolock) on a.SYXH = b.EMRXH
        left join [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NJZJLK] c(nolock) on a.SYXH = c.EMRXH
		--删除临时表
		DROP TABLE #EMR_QTBLJLK
		DROP TABLE #EMR_QTBLJLK_LS
	 end
else
  --存在@syxh
	begin
	   SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM INTO #EMR_QTBLJLK_TEMP_LS FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		 AND T.YXJL=1 AND T.SYXH=@syxh;
         --在临时表上增加索引
		CREATE INDEX QUERY_INDEX_LS ON #EMR_QTBLJLK_TEMP_LS (BLDM);

		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM INTO #EMR_QTBLJLK_TEMP FROM #EMR_QTBLJLK_TEMP_LS T(nolock)
		LEFT JOIN MBZ_DATA_LIST_SET A(nolock) on T.BLDM=A.MODEL_CODE
		WHERE A.SOURCE_TYPE=@sourceType
		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (SYXH);
		--查询业务数据
    select
        a.QTBLJLXH                                                                        as yjlxh,
        ISNULL(b.GHXH, c.GHXH)                                                                         as jzlsh,
        ISNULL(b.PATID,c.PATID )                                                                          as patid,
        ISNULL(b.HZXM ,c.HZXM  )                                                                          as hzxm,
        ISNULL(b.GHXH, c.GHXH  )                                                                         as mjzh,
        ISNULL(ISNULL(b.BLH,c.BLH),'NA')                                                                 as zyh,
        ISNULL(isnull(b.SFZH,c.SFZH),'NA')                                                                as sfzhm,
        ISNULL(b.KSDM,c.KSDM)                                                                            as ksdm,
        ISNULL(b.KSMC,c.KSMC)                                                                            as ksmc,
        ISNULL(b.SEX ,c.SEX )                                                                            as xbmc,
        CASE ISNULL(b.SEX,c.SEX) WHEN '女' THEN '2' WHEN '男' THEN '1'ELSE '3' END                      as xbdm,
        CONVERT(DATE, ISNULL(ISNULL(b.BIRTH,c.BIRTH), '1990-01-01 00:00:00'), 120)                        AS csrq,
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, ISNULL(b.BIRTH,c.BIRTH))))) ,'NA') as nls,
        datediff(month,ISNULL(b.BIRTH,c.BIRTH),substring(convert(char(8),getdate(),112),1,8)) %12         as nly,
        CONVERT(datetime,substring( ISNULL(b.JZRQ,c.JZRQ),1,4)+'-'+substring(ISNULL(b.JZRQ,c.JZRQ),5,2)+'-'+
                 substring(ISNULL(b.JZRQ,c.JZRQ),7,2)+' ' +substring(ISNULL(b.JZRQ,c.JZRQ),9,8) )                       as jzrqsj,
        case when ISNULL(b.CFZBZ,c.CFZBZ) = '0' then 1 else 2 end                                         as czbzdm,
        case when ISNULL(b.CFZBZ,c.CFZBZ) = '0' then '初诊' else '复诊' end                                as czbzmc,
        a.FSSJ                                                                            as jlrqsj,
        GETDATE()                                                             as gxsj,
        a.SYXH as syxh,
        a.BLMC as blmc,
		    a.FSSJ as fssj,
		    a.BLNR as blnr
        from #EMR_QTBLJLK a
        left join [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_JZJLK] b(nolock) on a.SYXH = b.EMRXH
        left join [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NJZJLK] c(nolock) on a.SYXH = c.EMRXH
        where isnull(b.EMRXH,c.EMRXH)=@syxh
		--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end
end
