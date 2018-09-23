CREATE PROCEDURE [dbo].[USP_HLHT_CYXJ_CYXJ_DATA]
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
SELECT
        t.QTBLJLXH AS yjlxh,
        b.HISSYXH AS jzlsh,
        c.PATID AS patid,
        b.ZYHM AS zyh,
        i.DICT_LABEL AS zzjgmc,
        ii.DICT_LABEL AS zzjgdm,
        'NA' AS jkkh,
        c.KSDM AS ksdm,
        c.KSMC AS ksmc,
        c.BQDM AS bqdm,
        c.BQMC AS bqmc,
        ISNULL(a.fjh, 'NA') AS bfh,
        ISNULL(a.fjh, 'NA')+'病房' AS bfmc,
        c.CWDM AS bch,
        b.HZXM AS hzxm,
        b.SFZH AS sfzhm,
        b.BRXB AS xbdm,
        (
        SELECT CASE b.BRXB
        WHEN '2'
        THEN
        '女'
        WHEN '1'
        THEN
        '男'
        ELSE
        '其它'
        END
        )                                               AS xbmc,
        ISNULL(
        CONVERT (
        VARCHAR,
        (
        YEAR (GETDATE()) - YEAR (CONVERT(datetime, b.CSRQ))
        )
        ),
        ''''
        ) AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        b.HYZK AS hyzkdm,
        CASE b.HYZK
        WHEN '0' THEN
        '未婚'
        WHEN '1' THEN
        '已婚'
        WHEN '2' THEN
        '离独'
        WHEN '3' THEN
        '丧偶'
        ELSE
        '未知 '
        END AS hyzkmc,
        b.ZYDM AS zylbdm,
        m.NAME AS zylbmc,
        (CASE b.LXDH WHEN '' THEN 'NA' ELSE b.LXDH END)AS hzdhhm,
        ISNULL(
        (SELECT TOP 1 e.SSDQDM FROM EMR_SYS_DQDMK e WHERE e.SSDQDM = b.SSDM  ),'NA') AS zzlbdm,
        ISNULL(
        (SELECT TOP 1 e.SSDQMC FROM EMR_SYS_DQDMK e WHERE e.SSDQDM = b.SSDM  ),'NA') AS zzlbmc,
        ISNULL(
        (SELECT e.NAME FROM EMR_SYS_DQDMK e WHERE b.SSDM = e.DQDM),'NA') AS dzsf,
        ISNULL(
        (SELECT e.NAME FROM EMR_SYS_DQDMK e WHERE b.QXDM = e.DQDM),'NA') AS dzsq,
        ISNULL(
        (SELECT e.NAME FROM EMR_SYS_DQDMK e WHERE b.QXDM = e.DQDM),'NA') AS dzx,
        ISNULL(
        (
        SELECT
        e.NAME
        FROM
        EMR_SYS_DQDMK e
        WHERE
        b.QXDM = e.DQDM
        ),
        'NA'
        ) AS dzxz,

        'NA' AS dzc,
        'NA' AS dzmphm,
        'NA' AS yzbm,
        CASE WHEN c.LXR ='' THEN 'NA' ELSE  c.LXR END as lxrxm,
        CASE WHEN c.LXRDH ='' THEN 'NA' ELSE  c.LXRDH END as lxrdhhm,
        b.RYRQ as ryrq,
        CASE WHEN b.CYRQ ='' THEN GETDATE() ELSE  b.CYRQ END as cyrq,
        DATEDIFF( day ,  CONVERT(varchar(100), b.RYRQ, 23),  CONVERT(varchar(100), GETDATE(), 23))  AS sjzyts,
        t.FSSJ AS qmrq,
        GETDATE() AS gxsj,
        t.YXJL AS yxjl,
        t.QTBLJLXH AS syxh,
        t.TJZT AS tjzt,
        t.BLMC as blmc,
        t.FSSJ as fssj,
        t.BLNR as blnr
        FROM #EMR_QTBLJLK t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] m(nolock) on b.ZYDM=m.MXDM and LBDM = 41
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW
        AND a.bqdm = b.RYBQ
        LEFT JOIN [CIS_HLHT].[dbo].[MBZ_DICT_INFO] i(nolock) ON i.DICT_CODE = 'hospitalInfoName'
        LEFT JOIN [CIS_HLHT].[dbo].[MBZ_DICT_INFO] ii(nolock) ON ii.DICT_CODE = 'hospitalInfoNo'
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] k(nolock) ON b.ZYDM = k.ID



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
SELECT
        t.QTBLJLXH AS yjlxh,
        b.HISSYXH AS jzlsh,
        c.PATID AS patid,
        b.ZYHM AS zyh,
        i.DICT_LABEL AS zzjgmc,
        ii.DICT_LABEL AS zzjgdm,
        'NA' AS jkkh,
        c.KSDM AS ksdm,
        c.KSMC AS ksmc,
        c.BQDM AS bqdm,
        c.BQMC AS bqmc,
        ISNULL(a.fjh, 'NA') AS bfh,
        ISNULL(a.fjh, 'NA')+'病房' AS bfmc,
        c.CWDM AS bch,
        b.HZXM AS hzxm,
        b.SFZH AS sfzhm,
        b.BRXB AS xbdm,
        (
        SELECT CASE b.BRXB
        WHEN '2'
        THEN
        '女'
        WHEN '1'
        THEN
        '男'
        ELSE
        '其它'
        END
        )                                               AS xbmc,
        ISNULL(
        CONVERT (
        VARCHAR,
        (
        YEAR (GETDATE()) - YEAR (CONVERT(datetime, b.CSRQ))
        )
        ),
        ''''
        ) AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        b.HYZK AS hyzkdm,
        CASE b.HYZK
        WHEN '0' THEN
        '未婚'
        WHEN '1' THEN
        '已婚'
        WHEN '2' THEN
        '离独'
        WHEN '3' THEN
        '丧偶'
        ELSE
        '未知 '
        END AS hyzkmc,
        b.ZYDM AS zylbdm,
        m.NAME AS zylbmc,
        (CASE b.LXDH WHEN '' THEN 'NA' ELSE b.LXDH END)AS hzdhhm,
        ISNULL(
        (SELECT TOP 1 e.SSDQDM FROM EMR_SYS_DQDMK e WHERE e.SSDQDM = b.SSDM  ),'NA') AS zzlbdm,
        ISNULL(
        (SELECT TOP 1 e.SSDQMC FROM EMR_SYS_DQDMK e WHERE e.SSDQDM = b.SSDM  ),'NA') AS zzlbmc,
        ISNULL(
        (SELECT e.NAME FROM EMR_SYS_DQDMK e WHERE b.SSDM = e.DQDM),'NA') AS dzsf,
        ISNULL(
        (SELECT e.NAME FROM EMR_SYS_DQDMK e WHERE b.QXDM = e.DQDM),'NA') AS dzsq,
        ISNULL(
        (SELECT e.NAME FROM EMR_SYS_DQDMK e WHERE b.QXDM = e.DQDM),'NA') AS dzx,
        ISNULL(
        (
        SELECT
        e.NAME
        FROM
        EMR_SYS_DQDMK e
        WHERE
        b.QXDM = e.DQDM
        ),
        'NA'
        ) AS dzxz,

        'NA' AS dzc,
        'NA' AS dzmphm,
        'NA' AS yzbm,
        CASE WHEN c.LXR ='' THEN 'NA' ELSE  c.LXR END as lxrxm,
        CASE WHEN c.LXRDH ='' THEN 'NA' ELSE  c.LXRDH END as lxrdhhm,
        b.RYRQ as ryrq,
        CASE WHEN b.CYRQ ='' THEN GETDATE() ELSE  b.CYRQ END as cyrq,
        DATEDIFF( day ,  CONVERT(varchar(100), b.RYRQ, 23),  CONVERT(varchar(100), GETDATE(), 23))  AS sjzyts,
        t.FSSJ AS qmrq,
        GETDATE() AS gxsj,
        t.YXJL AS yxjl,
        t.QTBLJLXH AS syxh,
        t.TJZT AS tjzt,
        t.BLMC as blmc,
        t.FSSJ as fssj,
        t.BLNR as blnr
        FROM #EMR_QTBLJLK_TEMP t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] m(nolock) on b.ZYDM=m.MXDM and LBDM = 41
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW
        AND a.bqdm = b.RYBQ
        LEFT JOIN [CIS_HLHT].[dbo].[MBZ_DICT_INFO] i(nolock) ON i.DICT_CODE = 'hospitalInfoName'
        LEFT JOIN [CIS_HLHT].[dbo].[MBZ_DICT_INFO] ii(nolock) ON ii.DICT_CODE = 'hospitalInfoNo'
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] k(nolock) ON b.ZYDM = k.ID

 --删除临时表
      DROP TABLE #EMR_QTBLJLK_TEMP
    end

	END

