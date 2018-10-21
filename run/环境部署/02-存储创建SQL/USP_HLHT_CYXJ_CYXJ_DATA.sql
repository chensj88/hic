GO
CREATE PROCEDURE [dbo].[USP_HLHT_CYXJ_CYXJ_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chenkuai
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出出院小结 ---USP_HLHT_CYXJ_CYXJ_DATA
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

   SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM INTO #EMR_QTBLJLK_LS FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		 AND T.YXJL=1
         --在临时表上增加索引
		CREATE INDEX QUERY_INDEX_LS ON #EMR_QTBLJLK_LS (BLDM);

		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM INTO #EMR_QTBLJLK FROM #EMR_QTBLJLK_LS T(nolock)
		LEFT JOIN MBZ_DATA_LIST_SET A(nolock) on T.BLDM=A.MODEL_CODE
		WHERE A.SOURCE_TYPE=@sourceType
		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK (SYXH);

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
        (SELECT CASE WHEN a.fjh = '' THEN 'NA' WHEN a.fjh IS NULL THEN 'NA' ELSE a.fjh END) AS bfh,
          (SELECT CASE WHEN a.fjh = '' THEN 'NA' WHEN a.fjh IS NULL THEN 'NA' ELSE a.fjh END)+'病房' AS bfmc,
        c.CWDM AS bch,
        b.HZXM AS hzxm,
        (SELECT CASE b.SFZH WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE b.SFZH END) as sfzhm,
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
        ISNULL(b.HYZK,'NA') AS hyzkdm,
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
        ISNULL(b.ZYDM,'90') AS zylbdm,
        ISNULL(m.NAME,'其他') AS zylbmc,
        (CASE b.LXDH WHEN '' THEN 'NA' ELSE b.LXDH END)AS hzdhhm,
        ISNULL(
        (SELECT TOP 1 e.SSDQDM FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e WHERE e.SSDQDM = b.SSDM  ),'NA') AS zzlbdm,
        ISNULL(
        (SELECT TOP 1 e.SSDQMC FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e WHERE e.SSDQDM = b.SSDM  ),'NA') AS zzlbmc,
        ISNULL(
        (SELECT e.NAME FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e WHERE b.SSDM = e.DQDM),'NA') AS dzsf,
        ISNULL(
        (SELECT e.NAME FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e WHERE b.QXDM = e.DQDM),'NA') AS dzsq,
        ISNULL(
        (SELECT e.NAME FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e WHERE b.QXDM = e.DQDM),'NA') AS dzx,
        ISNULL(
        (
        SELECT
        e.NAME
        FROM
        [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e
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
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] m(nolock) on b.ZYDM=m.MXDM and m.LBDM = 41
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW
        AND a.bqdm = b.RYBQ
        LEFT JOIN [CIS_HLHT].[dbo].[MBZ_DICT_INFO] i(nolock) ON i.DICT_CODE = 'hospitalInfoName'
        LEFT JOIN [CIS_HLHT].[dbo].[MBZ_DICT_INFO] ii(nolock) ON ii.DICT_CODE = 'hospitalInfoNo'
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] k(nolock) ON b.ZYDM = k.MXDM and k.LBDM = 42



	--删除临时表
		DROP TABLE #EMR_QTBLJLK
		DROP TABLE #EMR_QTBLJLK_LS
	end
else
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
        (SELECT CASE WHEN a.fjh = '' THEN 'NA' WHEN a.fjh IS NULL THEN 'NA' ELSE a.fjh END) AS bfh,
          (SELECT CASE WHEN a.fjh = '' THEN 'NA' WHEN a.fjh IS NULL THEN 'NA' ELSE a.fjh END)+'病房' AS bfmc,
        c.CWDM AS bch,
        b.HZXM AS hzxm,
        (SELECT CASE b.SFZH WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE b.SFZH END) as sfzhm,
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
        ISNULL(b.HYZK,'NA') AS hyzkdm,
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
        ISNULL(b.ZYDM,'90') AS zylbdm,
        ISNULL(m.NAME,'其他') AS zylbmc,
        (CASE b.LXDH WHEN '' THEN 'NA' ELSE b.LXDH END)AS hzdhhm,
        ISNULL(
        (SELECT TOP 1 e.SSDQDM FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e WHERE e.SSDQDM = b.SSDM  ),'NA') AS zzlbdm,
        ISNULL(
        (SELECT TOP 1 e.SSDQMC FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e WHERE e.SSDQDM = b.SSDM  ),'NA') AS zzlbmc,
        ISNULL(
        (SELECT e.NAME FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e WHERE b.SSDM = e.DQDM),'NA') AS dzsf,
        ISNULL(
        (SELECT e.NAME FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e WHERE b.QXDM = e.DQDM),'NA') AS dzsq,
        ISNULL(
        (SELECT e.NAME FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e WHERE b.QXDM = e.DQDM),'NA') AS dzx,
        ISNULL(
        (
        SELECT
        e.NAME
        FROM
        [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e
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
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] k(nolock) ON b.ZYDM = k.MXDM and k.LBDM = 42

 --删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
    end

	END

