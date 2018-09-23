CREATE PROCEDURE [dbo].[USP_HLHT_ZCJL_PGC_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as

begin
--创建临时表
if @syxh  is null or @syxh = ''
	begin

  SELECT * INTO #EMR_QTBLJLK FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE EXISTS (SELECT 1 FROM MBZ_DATA_LIST_SET A(nolock) WHERE A.SOURCE_TYPE=@sourceType and A.MODEL_CODE = T.BLDM)
		 AND T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		 AND T.TJSJ IS NOT NULL  AND T.TJSJ !=''
		 AND T.YXJL=1;
		 --在临时表上增加索引
		 CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK (BLDM, YXJL, TJSJ);
     --查询表数据
      SELECT t.QTBLJLXH AS yjlxh,
        b.HISSYXH AS jzlsh,
        c.PATID AS patid,
        b.HZXM AS cfxm,
        b.ZYHM AS zyh,
        b.SFZH AS sfzhm,
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'''') AS nls,
        c.KSDM AS ksdm,
        c.KSMC AS ksmc ,
        c.BQDM AS bqdm,
        c.BQMC AS bqmc,
        ISNULL(a.fjh, 'NA') AS bfh,
        c.CWDM AS bch,
        GETDATE() AS gxsj,
        t.BLMC as blmc,
        t.FSSJ as fssj,
        t.BLNR as blnr
        FROM #EMR_QTBLJLK t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm=b.RYBQ


		--删除临时表
		DROP TABLE #EMR_QTBLJLK
	end
else
	begin
	  SELECT * INTO #EMR_QTBLJLK_TEMP FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE EXISTS (SELECT 1 FROM dbo.MBZ_DATA_LIST_SET A(nolock) WHERE A.SOURCE_TYPE=@sourceType and A.MODEL_CODE = T.BLDM)
		 AND T.TJSJ BETWEEN CONVERT (DATE, @startDate) AND CONVERT (DATE, @endDate)
		 AND T.TJSJ IS NOT NULL  AND T.TJSJ !=''
		 AND T.YXJL=1
		 AND T.SYXH=@syxh;
		 --在临时表上增加索引
		 CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (BLDM, YXJL, TJSJ);
		 --查询表数据
    SELECT t.QTBLJLXH AS yjlxh,
        b.HISSYXH AS jzlsh,
        c.PATID AS patid,
        b.HZXM AS cfxm,
        b.ZYHM AS zyh,
        b.SFZH AS sfzhm,
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'''') AS nls,
        c.KSDM AS ksdm,
        c.KSMC AS ksmc ,
        c.BQDM AS bqdm,
        c.BQMC AS bqmc,
        ISNULL(a.fjh, 'NA') AS bfh,
        c.CWDM AS bch,
        GETDATE() AS gxsj,
        t.BLMC as blmc,
        t.FSSJ as fssj,
        t.BLNR as blnr
        FROM #EMR_QTBLJLK_TEMP t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm=b.RYBQ

  --删除临时表
        DROP TABLE #EMR_QTBLJLK_TEMP
      end

    END