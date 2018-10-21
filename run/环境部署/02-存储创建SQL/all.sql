GO
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

   SELECT QTBLJLXH,QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM INTO #EMR_QTBLJLK_LS FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
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
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] m(nolock) on b.ZYDM=m.MXDM and LBDM = 41
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW
        AND a.bqdm = b.RYBQ
        LEFT JOIN [CIS_HLHT].[dbo].[MBZ_DICT_INFO] i(nolock) ON i.DICT_CODE = 'hospitalInfoName'
        LEFT JOIN [CIS_HLHT].[dbo].[MBZ_DICT_INFO] ii(nolock) ON ii.DICT_CODE = 'hospitalInfoNo'
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] k(nolock) ON b.ZYDM = k.ID



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
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] k(nolock) ON b.ZYDM = k.ID

 --删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
    end

	END

GO

GO
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
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end
end
GO
GO
CREATE PROCEDURE [dbo].[USP_HLHT_MJZBL_MJZBL_DATA]
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


      SELECT t.QTBLJLXH AS yjlxh,
              c.GHXH AS jzlsh,
              c.PATID AS patid,
              c.HZXM AS hzxm,
              c.GHXH AS mjzh,
              c.BLH AS zyh,
              c.SFZH AS sfzhm,
              (
              SELECT CASE c.SEX
              WHEN '女'
              THEN
              '2'
              WHEN '男'
              THEN
              '1'
              ELSE
              '3'
              END
              )  AS xbdm,
              c.SEX AS xbmc,
              CONVERT(DATE, ISNULL(c.BIRTH, '19900101'), 108) AS csrq,
               ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, c.BIRTH)))) ,'0') AS nls,
               DATEDIFF(MONTH,c.BIRTH,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12       AS nly,
              i.DICT_LABEL AS zzjgmc,
              ii.DICT_LABEL AS zzjgdm,
              c.KSDM AS ksdm,
              c.KSMC AS ksmc ,
              CONVERT(datetime,substring(c.GHRQ,1,4)+'-'+substring(c.GHRQ,5,2)+'-'+substring(c.GHRQ,7,2)+' '+substring(c.GHRQ,9,8))
              AS jzrqsj,
              c.CFZBZ AS czbzdm,
              (
              SELECT CASE c.CFZBZ
              WHEN '0'
              THEN
              '初诊'
              WHEN '1'
              THEN
              '复诊'
              ELSE
              '复诊'
              END
              )  AS czbzmc,
              GETDATE() AS gxsj,
               t.YXJL AS yxjl,
              t.SYXH AS syxh,
              t.TJZT as tjzt,
              t.BLMC as blmc,
              t.FSSJ as fssj,
              t.BLNR as blnr
              FROM #EMR_QTBLJLK t
              LEFT JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_JZJLK] c ON t.SYXH = c.EMRXH
              LEFT JOIN [CIS_HLHT].[dbo].[MBZ_DICT_INFO] i ON i.DICT_CODE = 'hospitalInfoName'
              LEFT JOIN [CIS_HLHT].[dbo].[MBZ_DICT_INFO] ii ON ii.DICT_CODE = 'hospitalInfoNo'
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
    SELECT t.QTBLJLXH AS yjlxh,
              c.GHXH AS jzlsh,
              c.PATID AS patid,
              c.HZXM AS hzxm,
              c.GHXH AS mjzh,
              c.BLH AS zyh,
              c.SFZH AS sfzhm,
              (
              SELECT CASE c.SEX
              WHEN '女'
              THEN
              '2'
              WHEN '男'
              THEN
              '1'
              ELSE
              '3'
              END
              )  AS xbdm,
              c.SEX AS xbmc,
              CONVERT(DATE, ISNULL(c.BIRTH, '19900101'), 108) AS csrq,
               ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, c.BIRTH)))) ,'0') AS nls,
               DATEDIFF(MONTH,c.BIRTH,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12       AS nly,
              i.DICT_LABEL AS zzjgmc,
              ii.DICT_LABEL AS zzjgdm,
              c.KSDM AS ksdm,
              c.KSMC AS ksmc ,
              CONVERT(datetime,substring(c.GHRQ,1,4)+'-'+substring(c.GHRQ,5,2)+'-'+substring(c.GHRQ,7,2)+' '+substring(c.GHRQ,9,8))
              AS jzrqsj,
              c.CFZBZ AS czbzdm,
              (
              SELECT CASE c.CFZBZ
              WHEN '0'
              THEN
              '初诊'
              WHEN '1'
              THEN
              '复诊'
              ELSE
              '复诊'
              END
              )  AS czbzmc,
              GETDATE() AS gxsj,
              t.YXJL AS yxjl,
              t.SYXH AS syxh,
              t.TJZT as tjzt,
              t.BLMC as blmc,
              t.FSSJ as fssj,
              t.BLNR as blnr
              FROM #EMR_QTBLJLK_TEMP t
              LEFT JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_JZJLK] c ON t.SYXH = c.EMRXH
              LEFT JOIN [CIS_HLHT].[dbo].[MBZ_DICT_INFO] i ON i.DICT_CODE = 'hospitalInfoName'
              LEFT JOIN [CIS_HLHT].[dbo].[MBZ_DICT_INFO] ii ON ii.DICT_CODE = 'hospitalInfoNo'
		--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end
end

GO
GO
CREATE PROCEDURE [dbo].[USP_HLHT_MJZCF_XYCF_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chensj
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出互联互通西药处方信息年数据 ---USP_HLHT_MJZCF_XYCF_YEAR_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_MJZCF_XYCF_YEAR_DATA '1','2018010100:00:00','2018010323:59:59','1' --通过首页序号提取数据
      exec USP_HLHT_MJZCF_XYCF_YEAR_DATA '1','2018010100:00:00','2018010323:59:59',NULL  --提取当天的数据
[注意事项]
 1、在CIS_HLHT中创建
 2、[HLHT_MZ_HIS].[THIS4].[dbo].[YK_YPCDMLK].yplh 需要根据医院实际情况对该口径进行修改
*/
begin
--判断@syxh是否存在
if @syxh  is null or @syxh = ''
  --不存在首页序号
	begin
    --创建临时表
	SELECT * INTO #YF_MZFYZD FROM [HLHT_MZ_HIS].[THIS4].[dbo].[YF_MZFYZD] T(nolock)
	WHERE T.fyrq BETWEEN  @startDate  AND  @endDate
	--在临时表上增加索引
	CREATE INDEX IDX_YF_MZFYZD_CFXH ON #YF_MZFYZD (cfxh);
	--查询业务数据
     SELECT
        ISNULL(CONVERT(VARCHAR,T4.XH),'NA')                                                                             AS yjlxh,
        ISNULL(CONVERT(VARCHAR,T2.GHXH),'NA')                                                                           AS jzlsh,
        ISNULL(CONVERT(VARCHAR,T2.PATID),'NA')                                                                          AS patid,
        ISNULL(CONVERT(VARCHAR,T2.HZXM ),'NA')                                                                          AS hzxm,
        ISNULL(CONVERT(VARCHAR,T2.GHXH ),'NA')                                                                          AS mjzh,
        CASE WHEN RTRIM(LTRIM(T3.SFZH)) = '' THEN 'NA'
        ELSE ISNULL(CONVERT(VARCHAR,T3.SFZH ),'NA') END                                                            AS sfzhm,
        CASE T3.SEX WHEN '女' THEN '2' WHEN '男' THEN '1' ELSE '3'  END                                                AS xbdm,
        ISNULL(T3.SEX, 'NA')                                                                                            AS xbmc,
        ISNULL(CONVERT (VARCHAR,(YEAR(GETDATE())-YEAR(CONVERT(DATETIME, T3.BIRTH)))) ,'')                              AS nls,
        DATEDIFF(MONTH,T3.BIRTH,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12                                     AS nly,
        ISNULL(T4.CFXH, 'NA')                                                                                           AS cfxh,
        ( SELECT t.DICT_LABEL FROM MBZ_DICT_INFO t
        WHERE t.DICT_CODE = 'hospitalInfoNo' AND t.DICT_VALUE = 1)                                                     AS zzjgdm,
        ( SELECT t.DICT_LABEL FROM MBZ_DICT_INFO t
        WHERE t.DICT_CODE = 'hospitalInfoName' AND t.DICT_VALUE = 1)                                                   AS zzjgmc,
        CONVERT(date,substring(T2.LRRQ,1,4)+'-'+substring(T2.LRRQ,5,2)+'-'+substring(T2.LRRQ,7,2))                     AS cfklrq,
        T4.TS                                                                                                          AS cfyxts,
        T2.KSDM                                                                                                        AS cfklskdm,
        T2.KSMC                                                                                                        AS cfklks,
        ISNULL(
          (SELECT T7.ZDDM FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE T2.GHXH = T7.GHXH AND T7.ZDLB = 0 AND T7.ZDLX = 0),
          (SELECT T8.ZDDM FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NMZBLZDK] T8(nolock)
          WHERE T2.GHXH = T8.GHXH AND T8.ZDLB = 0 AND T8.ZDLX = 0))        AS jbzdbm,
        ISNULL(
          (SELECT T9.ZDMC FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T9(nolock)
          WHERE T2.GHXH = T9.GHXH AND T9.ZDLB = 0 AND T9.ZDLX = 0 ),
          (SELECT T10.ZDMC FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T10(nolock)
          WHERE T2.GHXH = T10.GHXH AND T10.ZDLB = 0 AND T10.ZDLX = 0 ))   AS jbzd,
        T4.YPDM                                                                                                        AS ywdm,
        T4.YPMC                                                                                                        AS ywmc,
        T4.YPGG                                                                                                        AS ywgg,
        T4.JXDM                                                                                                        AS ywjxdm,
        T4.JXMC                                                                                                        AS ywjx,
        T4.YPJL                                                                                                        AS ywsycjl,
        T4.JLDW                                                                                                        AS ywsyjldw,
        T4.PCDM                                                                                                        AS ywsypcdm,
        T4.PCMC                                                                                                        AS ywsypc,
        T4.YPYF                                                                                                        AS ywsytj,
        T4.YPYFMC                                                                                                      AS ywsytjmc,
        T4.YPSL*T4.YPJL                                                                                                AS ywsyzjl,
        T4.FZXH                                                                                                        AS cfypzh,
        T2.YSMC                                                                                                        AS klysqm,
        T2.YSDM                                                                                                        AS ysbm,
        T2.YSMC                                                                                                        AS shyjsbm,
        T2.YSDM                                                                                                        AS shyjsqm,
       CONVERT(datetime,
       substring(T2.LRRQ,1,4)+'-'+substring(T2.LRRQ,5,2)+'-'+substring(T2.LRRQ,7,2)+' '+substring(T2.LRRQ,9,8))      AS shyjsqmsj,
       T1.pyczry                                                                                                      AS tpyjsbm,
       e.name                                                                                                        AS tpyjsqm,
       CONVERT(datetime,
       substring(T1.pyrq,1,4)+'-'+substring(T1.pyrq,5,2)+'-'+substring(T1.pyrq,7,2)+' '+substring(T1.pyrq,9,8))       AS cftpsj,
       T1.fyczyh                                                                                                        AS hdyjsbm,
       f.name                                                                                                         AS hdyjsqm,
       CONVERT(datetime,
       substring(T1.fyrq,1,4)+'-'+substring(T1.fyrq,5,2)+'-'+substring(T1.fyrq,7,2)+' '+substring(T1.fyrq,9,8))       AS cfhdsj,
       T1.fyczyh                                                                                                       AS fyyjsbm,
       f.name                                                                                                         AS fyyjsqm,
       CONVERT(datetime,
       substring(T1.fyrq,1,4)+'-'+substring(T1.fyrq,5,2)+'-'+substring(T1.fyrq,7,2)+' '+substring(T1.fyrq,9,8))       AS cffysj,
       ISNULL(T2.MEMO, 'NA')                                                                                           AS cfbzxx,
       CONVERT(DECIMAL(18,2),(T4.YPSL*T4.YLSJ)/T4.YKXS)                                                               AS cfypje,
       GETDATE()                                                                                                      AS gxsj
       FROM #YF_MZFYZD T1
       left join [HLHT_MZ_HIS].[THIS4].[dbo].[czryk] e(nolock) on T1.pyczry=e.id
	     left join [HLHT_MZ_HIS].[THIS4].[dbo].[czryk] f(nolock) on T1.fyczyh=f.id
		   left join [HLHT_MZ_HIS].[THIS4].[dbo].[SF_MZCFK] c(nolock) on T1.cfxh=c.xh
		   left join [HLHT_MZ_HIS].[THIS4].[dbo].[GH_GHZDK] b(nolock) on b.xh=c.ghxh
       INNER JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDER] T2(nolock) ON b.xh = T2.GHXH
       INNER JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_JZJLK] T3(nolock) ON T2.GHXH = T3.GHXH
       INNER JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDERITEM] T4(nolock) ON T2.XH = T4.CFXH
       INNER JOIN [HLHT_MZ_HIS].[THIS4].[dbo].[YK_YPCDMLK] T6(nolock)  on T4.CD_IDM = T6.idm
       WHERE
        T6.yplh='003'  --需要根据医院实际情况对该口径进行修改
        AND T3.ZDDM IS NOT NULL AND T3.ZDDM != '' AND T4.CD_IDM <> 0
        AND c.fybz=1
		--删除临时表
		DROP TABLE #YF_MZFYZD
	 end
else
  --存在@syxh
	begin
	 --创建临时表
	SELECT * INTO #YF_MZFYZD_TEMP FROM [HLHT_MZ_HIS].[THIS4].[dbo].[YF_MZFYZD] T(nolock)
	WHERE T.fyrq BETWEEN  @startDate  AND  @endDate
	--在临时表上增加索引
	CREATE INDEX IDX_YF_MZFYZD_CFXH ON #YF_MZFYZD_TEMP (cfxh);
	--查询业务数据
     SELECT
        ISNULL(CONVERT(VARCHAR,T4.XH),'NA')                                                                             AS yjlxh,
        ISNULL(CONVERT(VARCHAR,T2.GHXH),'NA')                                                                           AS jzlsh,
        ISNULL(CONVERT(VARCHAR,T2.PATID),'NA')                                                                          AS patid,
        ISNULL(CONVERT(VARCHAR,T2.HZXM ),'NA')                                                                          AS hzxm,
        ISNULL(CONVERT(VARCHAR,T2.GHXH ),'NA')                                                                          AS mjzh,
        CASE WHEN RTRIM(LTRIM(T3.SFZH)) = '' THEN 'NA'
        ELSE ISNULL(CONVERT(VARCHAR,T3.SFZH ),'NA') END                                                            AS sfzhm,
        CASE T3.SEX WHEN '女' THEN '2' WHEN '男' THEN '1' ELSE '3'  END                                                AS xbdm,
        ISNULL(T3.SEX, 'NA')                                                                                            AS xbmc,
        ISNULL(CONVERT (VARCHAR,(YEAR(GETDATE())-YEAR(CONVERT(DATETIME, T3.BIRTH)))) ,'')                              AS nls,
        DATEDIFF(MONTH,T3.BIRTH,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12                                     AS nly,
        ISNULL(T4.CFXH, 'NA')                                                                                           AS cfxh,
        ( SELECT t.DICT_LABEL FROM MBZ_DICT_INFO t
        WHERE t.DICT_CODE = 'hospitalInfoNo' AND t.DICT_VALUE = 1)                                                     AS zzjgdm,
        ( SELECT t.DICT_LABEL FROM MBZ_DICT_INFO t
        WHERE t.DICT_CODE = 'hospitalInfoName' AND t.DICT_VALUE = 1)                                                   AS zzjgmc,
        CONVERT(date,substring(T2.LRRQ,1,4)+'-'+substring(T2.LRRQ,5,2)+'-'+substring(T2.LRRQ,7,2))                     AS cfklrq,
        T4.TS                                                                                                          AS cfyxts,
        T2.KSDM                                                                                                        AS cfklskdm,
        T2.KSMC                                                                                                        AS cfklks,
        ISNULL(
          (SELECT T7.ZDDM FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE T2.GHXH = T7.GHXH AND T7.ZDLB = 0 AND T7.ZDLX = 0),
          (SELECT T8.ZDDM FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NMZBLZDK] T8(nolock)
          WHERE T2.GHXH = T8.GHXH AND T8.ZDLB = 0 AND T8.ZDLX = 0))        AS jbzdbm,
        ISNULL(
          (SELECT T9.ZDMC FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T9(nolock)
          WHERE T2.GHXH = T9.GHXH AND T9.ZDLB = 0 AND T9.ZDLX = 0 ),
          (SELECT T10.ZDMC FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T10(nolock)
          WHERE T2.GHXH = T10.GHXH AND T10.ZDLB = 0 AND T10.ZDLX = 0 ))   AS jbzd,
        T4.YPDM                                                                                                        AS ywdm,
        T4.YPMC                                                                                                        AS ywmc,
        T4.YPGG                                                                                                        AS ywgg,
        T4.JXDM                                                                                                        AS ywjxdm,
        T4.JXMC                                                                                                        AS ywjx,
        T4.YPJL                                                                                                        AS ywsycjl,
        T4.JLDW                                                                                                        AS ywsyjldw,
        T4.PCDM                                                                                                        AS ywsypcdm,
        T4.PCMC                                                                                                        AS ywsypc,
        T4.YPYF                                                                                                        AS ywsytj,
        T4.YPYFMC                                                                                                      AS ywsytjmc,
        T4.YPSL*T4.YPJL                                                                                                AS ywsyzjl,
        T4.FZXH                                                                                                        AS cfypzh,
        T2.YSMC                                                                                                        AS klysqm,
        T2.YSDM                                                                                                        AS ysbm,
        T2.YSMC                                                                                                        AS shyjsbm,
        T2.YSDM                                                                                                        AS shyjsqm,
       CONVERT(datetime,
       substring(T2.LRRQ,1,4)+'-'+substring(T2.LRRQ,5,2)+'-'+substring(T2.LRRQ,7,2)+' '+substring(T2.LRRQ,9,8))      AS shyjsqmsj,
       T1.pyczry                                                                                                      AS tpyjsbm,
       e.name                                                                                                        AS tpyjsqm,
       CONVERT(datetime,
       substring(T1.pyrq,1,4)+'-'+substring(T1.pyrq,5,2)+'-'+substring(T1.pyrq,7,2)+' '+substring(T1.pyrq,9,8))       AS cftpsj,
       T1.fyczyh                                                                                                        AS hdyjsbm,
       f.name                                                                                                         AS hdyjsqm,
       CONVERT(datetime,
       substring(T1.fyrq,1,4)+'-'+substring(T1.fyrq,5,2)+'-'+substring(T1.fyrq,7,2)+' '+substring(T1.fyrq,9,8))       AS cfhdsj,
       T1.fyczyh                                                                                                       AS fyyjsbm,
       f.name                                                                                                         AS fyyjsqm,
       CONVERT(datetime,
       substring(T1.fyrq,1,4)+'-'+substring(T1.fyrq,5,2)+'-'+substring(T1.fyrq,7,2)+' '+substring(T1.fyrq,9,8))       AS cffysj,
       ISNULL(T2.MEMO, 'NA')                                                                                           AS cfbzxx,
       CONVERT(DECIMAL(18,2),(T4.YPSL*T4.YLSJ)/T4.YKXS)                                                               AS cfypje,
       GETDATE()                                                                                                      AS gxsj
       FROM #YF_MZFYZD_TEMP T1
       left join [HLHT_MZ_HIS].[THIS4].[dbo].[czryk] e(nolock) on T1.pyczry=e.id
	   left join [HLHT_MZ_HIS].[THIS4].[dbo].[czryk] f(nolock) on T1.fyczyh=f.id
	   left join [HLHT_MZ_HIS].[THIS4].[dbo].[SF_MZCFK] c(nolock) on T1.cfxh=c.xh
	   left join [HLHT_MZ_HIS].[THIS4].[dbo].[GH_GHZDK] b(nolock) on b.xh=c.ghxh
       INNER JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDER] T2(nolock) ON b.xh = T2.GHXH
       INNER JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_JZJLK] T3(nolock) ON T2.GHXH = T3.GHXH
       INNER JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDERITEM] T4(nolock) ON T2.XH = T4.CFXH
       INNER JOIN [HLHT_MZ_HIS].[THIS4].[dbo].[YK_YPCDMLK] T6(nolock)  on T4.CD_IDM = T6.idm
       WHERE
       T6.yplh='003'  --需要根据医院实际情况对该口径进行修改
       AND T3.ZDDM IS NOT NULL AND T3.ZDDM != '' AND T4.CD_IDM <> 0
       AND c.fybz=1 and T2.GHXH=@syxh
		--删除临时表
	   DROP TABLE #YF_MZFYZD_TEMP
	end
end

GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_MJZCF_XYCF_YEAR_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chensj
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出互联互通西药处方信息年数据 ---USP_HLHT_MJZCF_XYCF_YEAR_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_MJZCF_XYCF_YEAR_DATA '1','2018010100:00:00','2018010323:59:59','1' --通过首页序号提取数据
      exec USP_HLHT_MJZCF_XYCF_YEAR_DATA '1','2018010100:00:00','2018010323:59:59',NULL  --提取当天的数据
[注意事项]
 1、在CIS_HLHT中创建
 2、[HLHT_MZ_HIS].[THIS4].[dbo].[YK_YPCDMLK].yplh 需要根据医院实际情况对该口径进行修改
*/
begin
--判断@syxh是否存在
if @syxh  is null or @syxh = ''
  --不存在首页序号
	begin
    --创建临时表
	SELECT * INTO #YF_NMZFYZD FROM [HLHT_MZ_HIS].[THIS4].[dbo].[YF_NMZFYZD] T(nolock)
	WHERE T.fyrq BETWEEN  @startDate  AND  @endDate
	--在临时表上增加索引
	CREATE INDEX IDX_YF_NMZFYZD_CFXH ON #YF_NMZFYZD (cfxh);
	--查询业务数据
     SELECT
        ISNULL(CONVERT(VARCHAR,T4.XH),'NA')                                                                             AS yjlxh,
        ISNULL(CONVERT(VARCHAR,T2.GHXH),'NA')                                                                           AS jzlsh,
        ISNULL(CONVERT(VARCHAR,T2.PATID),'NA')                                                                          AS patid,
        ISNULL(CONVERT(VARCHAR,T2.HZXM ),'NA')                                                                          AS hzxm,
        ISNULL(CONVERT(VARCHAR,T2.GHXH ),'NA')                                                                          AS mjzh,
        CASE WHEN RTRIM(LTRIM(T3.SFZH)) = '' THEN 'NA'
        ELSE ISNULL(CONVERT(VARCHAR,T3.SFZH ),'NA') END                                                            AS sfzhm,
        CASE T3.SEX WHEN '女' THEN '2' WHEN '男' THEN '1' ELSE '3'  END                                                AS xbdm,
        ISNULL(T3.SEX, 'NA')                                                                                            AS xbmc,
        ISNULL(CONVERT (VARCHAR,(YEAR(GETDATE())-YEAR(CONVERT(DATETIME, T3.BIRTH)))) ,'')                              AS nls,
        DATEDIFF(MONTH,T3.BIRTH,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12                                     AS nly,
        ISNULL(T4.CFXH, 'NA')                                                                                           AS cfxh,
        ( SELECT t.DICT_LABEL FROM MBZ_DICT_INFO t
        WHERE t.DICT_CODE = 'hospitalInfoNo' AND t.DICT_VALUE = 1)                                                     AS zzjgdm,
        ( SELECT t.DICT_LABEL FROM MBZ_DICT_INFO t
        WHERE t.DICT_CODE = 'hospitalInfoName' AND t.DICT_VALUE = 1)                                                   AS zzjgmc,
        CONVERT(date,substring(T2.LRRQ,1,4)+'-'+substring(T2.LRRQ,5,2)+'-'+substring(T2.LRRQ,7,2))                     AS cfklrq,
        T4.TS                                                                                                          AS cfyxts,
        T2.KSDM                                                                                                        AS cfklskdm,
        T2.KSMC                                                                                                        AS cfklks,
        ISNULL((SELECT T7.ZDDM FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
        WHERE T2.GHXH = T7.GHXH AND T7.ZDLB = 0
        AND T7.ZDLX = 0 ),'NA')                                                                                        AS jbzdbm,
        ISNULL((SELECT T8.ZDMC FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T8(nolock)
        WHERE T2.GHXH = T8.GHXH AND T8.ZDLB = 0
        AND T8.ZDLX = 0 ),'NA')                                                                                        AS jbzd,
        T4.YPDM                                                                                                        AS ywdm,
        T4.YPMC                                                                                                        AS ywmc,
        T4.YPGG                                                                                                        AS ywgg,
        T4.JXDM                                                                                                        AS ywjxdm,
        T4.JXMC                                                                                                        AS ywjx,
        T4.YPJL                                                                                                        AS ywsycjl,
        T4.JLDW                                                                                                        AS ywsyjldw,
        T4.PCDM                                                                                                        AS ywsypcdm,
        T4.PCMC                                                                                                        AS ywsypc,
        T4.YPYF                                                                                                        AS ywsytj,
        T4.YPYFMC                                                                                                      AS ywsytjmc,
        T4.YPSL*T4.YPJL                                                                                                AS ywsyzjl,
        T4.FZXH                                                                                                        AS cfypzh,
        T2.YSMC                                                                                                        AS klysqm,
        T2.YSDM                                                                                                        AS ysbm,
        T2.YSMC                                                                                                        AS shyjsbm,
        T2.YSDM                                                                                                        AS shyjsqm,
       CONVERT(datetime,
       substring(T2.LRRQ,1,4)+'-'+substring(T2.LRRQ,5,2)+'-'+substring(T2.LRRQ,7,2)+' '+substring(T2.LRRQ,9,8))      AS shyjsqmsj,
       T1.pyczry                                                                                                      AS tpyjsbm,
       e.name                                                                                                        AS tpyjsqm,
       CONVERT(datetime,
       substring(T1.pyrq,1,4)+'-'+substring(T1.pyrq,5,2)+'-'+substring(T1.pyrq,7,2)+' '+substring(T1.pyrq,9,8))       AS cftpsj,
       T1.fyczyh                                                                                                        AS hdyjsbm,
       f.name                                                                                                         AS hdyjsqm,
       CONVERT(datetime,
       substring(T1.fyrq,1,4)+'-'+substring(T1.fyrq,5,2)+'-'+substring(T1.fyrq,7,2)+' '+substring(T1.fyrq,9,8))       AS cfhdsj,
       T1.fyczyh                                                                                                       AS fyyjsbm,
       f.name                                                                                                         AS fyyjsqm,
       CONVERT(datetime,
       substring(T1.fyrq,1,4)+'-'+substring(T1.fyrq,5,2)+'-'+substring(T1.fyrq,7,2)+' '+substring(T1.fyrq,9,8))       AS cffysj,
       ISNULL(T2.MEMO, 'NA')                                                                                           AS cfbzxx,
       CONVERT(DECIMAL(18,2),(T4.YPSL*T4.YLSJ)/T4.YKXS)                                                               AS cfypje,
       GETDATE()                                                                                                      AS gxsj
       FROM #YF_NMZFYZD T1
       left join [HLHT_MZ_HIS].[THIS4].[dbo].[czryk] e(nolock) on T1.pyczry=e.id
	   left join [HLHT_MZ_HIS].[THIS4].[dbo].[czryk] f(nolock) on T1.fyczyh=f.id
		left join [HLHT_MZ_HIS].[THIS4].[dbo].[SF_NMZCFK] c(nolock) on T1.cfxh=c.xh
		left join [HLHT_MZ_HIS].[THIS4].[dbo].[GH_NGHZDK] b(nolock) on b.xh=c.ghxh
        INNER JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NORDER] T2(nolock) ON b.xh = T2.GHXH
        INNER JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NJZJLK] T3(nolock) ON T2.GHXH = T3.GHXH
        INNER JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NORDERITEM] T4(nolock) ON T2.XH = T4.CFXH
        INNER JOIN [HLHT_MZ_HIS].[THIS4].[dbo].[YK_YPCDMLK] T6(nolock)  on T4.CD_IDM = T6.idm
        WHERE
        T6.yplh='003'  --需要根据医院实际情况对该口径进行修改
        AND T3.ZDDM IS NOT NULL AND T3.ZDDM != '' AND T4.CD_IDM <> 0
        AND c.fybz=1
		--删除临时表
		DROP TABLE #YF_NMZFYZD
	 end
else
  --存在@syxh
	begin
	 --创建临时表
	SELECT * INTO #YF_NMZFYZD_TEMP FROM [HLHT_MZ_HIS].[THIS4].[dbo].[YF_NMZFYZD] T(nolock)
	WHERE T.fyrq BETWEEN  @startDate  AND  @endDate
	--在临时表上增加索引
	CREATE INDEX IDX_YF_NMZFYZD_CFXH ON #YF_NMZFYZD_TEMP (cfxh);
	--查询业务数据
     SELECT
        ISNULL(CONVERT(VARCHAR,T4.XH),'NA')                                                                             AS yjlxh,
        ISNULL(CONVERT(VARCHAR,T2.GHXH),'NA')                                                                           AS jzlsh,
        ISNULL(CONVERT(VARCHAR,T2.PATID),'NA')                                                                          AS patid,
        ISNULL(CONVERT(VARCHAR,T2.HZXM ),'NA')                                                                          AS hzxm,
        ISNULL(CONVERT(VARCHAR,T2.GHXH ),'NA')                                                                          AS mjzh,
        CASE WHEN RTRIM(LTRIM(T3.SFZH)) = '' THEN 'NA'
        ELSE ISNULL(CONVERT(VARCHAR,T3.SFZH ),'NA') END                                                            AS sfzhm,
        CASE T3.SEX WHEN '女' THEN '2' WHEN '男' THEN '1' ELSE '3'  END                                                AS xbdm,
        ISNULL(T3.SEX, 'NA')                                                                                            AS xbmc,
        ISNULL(CONVERT (VARCHAR,(YEAR(GETDATE())-YEAR(CONVERT(DATETIME, T3.BIRTH)))) ,'')                              AS nls,
        DATEDIFF(MONTH,T3.BIRTH,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12                                     AS nly,
        ISNULL(T4.CFXH, 'NA')                                                                                           AS cfxh,
        ( SELECT t.DICT_LABEL FROM MBZ_DICT_INFO t
        WHERE t.DICT_CODE = 'hospitalInfoNo' AND t.DICT_VALUE = 1)                                                     AS zzjgdm,
        ( SELECT t.DICT_LABEL FROM MBZ_DICT_INFO t
        WHERE t.DICT_CODE = 'hospitalInfoName' AND t.DICT_VALUE = 1)                                                   AS zzjgmc,
        CONVERT(date,substring(T2.LRRQ,1,4)+'-'+substring(T2.LRRQ,5,2)+'-'+substring(T2.LRRQ,7,2))                     AS cfklrq,
        T4.TS                                                                                                          AS cfyxts,
        T2.KSDM                                                                                                        AS cfklskdm,
        T2.KSMC                                                                                                        AS cfklks,
        ISNULL((SELECT T7.ZDDM FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
        WHERE T2.GHXH = T7.GHXH AND T7.ZDLB = 0
        AND T7.ZDLX = 0 ),'NA')                                                                                        AS jbzdbm,
        ISNULL((SELECT T8.ZDMC FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T8(nolock)
        WHERE T2.GHXH = T8.GHXH AND T8.ZDLB = 0
        AND T8.ZDLX = 0 ),'NA')                                                                                        AS jbzd,
        T4.YPDM                                                                                                        AS ywdm,
        T4.YPMC                                                                                                        AS ywmc,
        T4.YPGG                                                                                                        AS ywgg,
        T4.JXDM                                                                                                        AS ywjxdm,
        T4.JXMC                                                                                                        AS ywjx,
        T4.YPJL                                                                                                        AS ywsycjl,
        T4.JLDW                                                                                                        AS ywsyjldw,
        T4.PCDM                                                                                                        AS ywsypcdm,
        T4.PCMC                                                                                                        AS ywsypc,
        T4.YPYF                                                                                                        AS ywsytj,
        T4.YPYFMC                                                                                                      AS ywsytjmc,
        T4.YPSL*T4.YPJL                                                                                                AS ywsyzjl,
        T4.FZXH                                                                                                        AS cfypzh,
        T2.YSMC                                                                                                        AS klysqm,
        T2.YSDM                                                                                                        AS ysbm,
        T2.YSMC                                                                                                        AS shyjsbm,
        T2.YSDM                                                                                                        AS shyjsqm,
       CONVERT(datetime,
       substring(T2.LRRQ,1,4)+'-'+substring(T2.LRRQ,5,2)+'-'+substring(T2.LRRQ,7,2)+' '+substring(T2.LRRQ,9,8))      AS shyjsqmsj,
       T1.pyczry                                                                                                      AS tpyjsbm,
       e.name                                                                                                        AS tpyjsqm,
       CONVERT(datetime,
       substring(T1.pyrq,1,4)+'-'+substring(T1.pyrq,5,2)+'-'+substring(T1.pyrq,7,2)+' '+substring(T1.pyrq,9,8))       AS cftpsj,
       T1.fyczyh                                                                                                        AS hdyjsbm,
       f.name                                                                                                         AS hdyjsqm,
       CONVERT(datetime,
       substring(T1.fyrq,1,4)+'-'+substring(T1.fyrq,5,2)+'-'+substring(T1.fyrq,7,2)+' '+substring(T1.fyrq,9,8))       AS cfhdsj,
       T1.fyczyh                                                                                                       AS fyyjsbm,
       f.name                                                                                                         AS fyyjsqm,
       CONVERT(datetime,
       substring(T1.fyrq,1,4)+'-'+substring(T1.fyrq,5,2)+'-'+substring(T1.fyrq,7,2)+' '+substring(T1.fyrq,9,8))       AS cffysj,
       ISNULL(T2.MEMO, 'NA')                                                                                           AS cfbzxx,
       CONVERT(DECIMAL(18,2),(T4.YPSL*T4.YLSJ)/T4.YKXS)                                                               AS cfypje,
       GETDATE()                                                                                                      AS gxsj
       FROM #YF_NMZFYZD_TEMP T1
       left join [HLHT_MZ_HIS].[THIS4].[dbo].[czryk] e(nolock) on T1.pyczry=e.id
	   left join [HLHT_MZ_HIS].[THIS4].[dbo].[czryk] f(nolock) on T1.fyczyh=f.id
		left join [HLHT_MZ_HIS].[THIS4].[dbo].[SF_NMZCFK] c(nolock) on T1.cfxh=c.xh
		left join [HLHT_MZ_HIS].[THIS4].[dbo].[GH_NGHZDK] b(nolock) on b.xh=c.ghxh
        INNER JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NORDER] T2(nolock) ON b.xh = T2.GHXH
        INNER JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NJZJLK] T3(nolock) ON T2.GHXH = T3.GHXH
        INNER JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NORDERITEM] T4(nolock) ON T2.XH = T4.CFXH
        INNER JOIN [HLHT_MZ_HIS].[THIS4].[dbo].[YK_YPCDMLK] T6(nolock)  on T4.CD_IDM = T6.idm
        WHERE
        T6.yplh='003'  --需要根据医院实际情况对该口径进行修改
        AND T3.ZDDM IS NOT NULL AND T3.ZDDM != '' AND T4.CD_IDM <> 0
        AND c.fybz=1 and T2.GHXH=@syxh
		--删除临时表
		DROP TABLE #YF_NMZFYZD_TEMP
	end
end

GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_MJZCF_ZYCF_DATA]
  @sourceType varchar(64),   --原纪录类型
  @startDate  varchar(20),   --开始日期
  @endDate    varchar(20),   --结束日期
  @syxh       int            --首页序号
  as
  /*
  [创建者] chenfeng
  [公司]上海金仕达卫宁软件股份有限公司@2015-2018
  [时间]2018-09-23
  [功能]导出互联互通中药处方信息日数据 ---USP_HLHT_MJZCF_ZYCF_DATA
  [参数]
   @sourceType: 元数据类型
   @startime: 开始时间戳
   @endtime:  结束时间戳
   @syxh：病人首页序号
  [调用实例]
  [调用]:
        exec USP_HLHT_MJZCF_ZYCF_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
        exec USP_HLHT_MJZCF_ZYCF_DATA '1','2018010100:00:00','2018010323:59:59',NULL --提取当天的数据
  [注意事项]
    1、在CIS_HLHT中创建
    2、[HLHT_MZ_HIS].[THIS4].[dbo].[YK_YPCDMLK].yplh 需要根据医院实际情况对该口径进行修改
  */
  begin
  --判断@syxh是否存在
  if @syxh  is null or @syxh = ''
    --不存在首页序号
    begin
      --创建临时表
      SELECT * INTO #OUTP_ORDERITEM FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDERITEM] T(nolock)
      WHERE T.CJRQ BETWEEN  @startDate  AND  @endDate
      --在临时表上增加索引
      CREATE INDEX CD_IDM_INDEX ON #OUTP_ORDERITEM (CD_IDM);
      --查询业务数据
       SELECT
          ISNULL(T1.XH, 'NA') AS yjlxh,
          ISNULL(CONVERT (VARCHAR, T2.GHXH), 'NA') AS jzlsh,
          ISNULL(CONVERT (VARCHAR, T3.PATID),'NA') AS patid,
          ISNULL(CONVERT (VARCHAR, T2.HZXM),'NA') AS hzxm,
          ISNULL(CONVERT (VARCHAR, T2.GHXH),'NA') AS mjzh,
          ISNULL(CONVERT (VARCHAR, T3.SFZH),'NA') AS sfzhm,
          (
          CASE T3.SEX
          WHEN '女' THEN
          '2'
          WHEN '男' THEN
          '1'
          ELSE
          '3'
          END
          ) AS xbdm,
          ISNULL(T3.SEX, 'NA') AS xbmc,
          ISNULL(
          CONVERT (
          VARCHAR,
          (
          YEAR (GETDATE()) - YEAR (CONVERT(DATETIME, T3.BIRTH))
          )
          ),
          ''
          ) AS nls,
          DATEDIFF(MONTH,T3.BIRTH,SUBSTRING (CONVERT (CHAR(8), GETDATE(), 112),1,8)) % 12 AS nly,
          ISNULL(T1.CFXH, 'NA') AS cfxh,
          (
          SELECT
          t.DICT_LABEL
          FROM
          [CIS_HLHT].[dbo].[MBZ_DICT_INFO] t(nolock)
          WHERE
          t.DICT_CODE = 'hospitalInfoNo'
          AND t.DICT_VALUE = 1
          ) AS zzjgdm,
          (
          SELECT
          t.DICT_LABEL
          FROM
          [CIS_HLHT].[dbo].[MBZ_DICT_INFO] t(nolock)
          WHERE
          t.DICT_CODE = 'hospitalInfoName'
          AND t.DICT_VALUE = 1
          ) AS zzjgmc,
          (
          SELECT
          CASE T6.yplh
          WHEN '02' THEN
          '2'
          WHEN '03' THEN
          '1'
          ELSE
          'NA'
          END
          ) AS cflb,
          'NA' AS cflbmc,
          (
          SUBSTRING (T2.LRRQ, 1, 4) + '-' + SUBSTRING (T2.LRRQ, 5, 2) + '-' + SUBSTRING (T2.LRRQ, 7, 2) + ' ' + SUBSTRING (T2.LRRQ, 9, 8)
          ) AS cfklrq,
          T1.TS AS cfyxts,
          T2.KSDM AS cfklksdm,
          T2.KSMC AS cfklks,
          (
          SELECT
          T7.ZDDM
          FROM
          [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE
          T2.GHXH = T7.GHXH
          AND T7.ZDLB = 0
          AND T7.ZDLX = 0
          ) AS jbzdbm,
          (
          SELECT
          T7.ZDMC
          FROM
          [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE
          T2.GHXH = T7.GHXH
          AND T7.ZDLB = 0
          AND T7.ZDLX = 0
          ) AS jbzd,
          ISNULL(
          (
          SELECT
          T7.ZDDM
          FROM
          [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE
          T2.GHXH = T7.GHXH
          AND T7.ZDLB = 1
          AND T7.ZDLX = 0
          ),
          'NA'
          ) AS zybmdm,
          ISNULL(
          (
          SELECT
          T7.ZDMC
          FROM
          [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE
          T2.GHXH = T7.GHXH
          AND T7.ZDLB = 1
          AND T7.ZDLX = 0
          ),
          'NA'
          ) AS zybm,
          ISNULL(
          (
          SELECT
          T7.ZXDM
          FROM
          [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE
          T2.GHXH = T7.GHXH
          AND T7.ZDLB = 1
          AND T7.ZDLX = 0
          ),
          'NA'
          ) AS zyzhdm,
          ISNULL(
          (
          SELECT
          T7.ZXMC
          FROM
          [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE
          T2.GHXH = T7.GHXH
          AND T7.ZDLB = 1
          AND T7.ZDLX = 0
          ),
          'NA'
          ) AS zyzh,
          T1.YPDM AS ywdm,
          T1.YPMC AS ywmc,
          T1.YPGG AS ywgg,
          T1.JXDM AS ywjxdm,
          T1.JXMC AS ywjx,
          T1.YPJL AS ywsycjl,
          T1.JLDW AS ywsyjldw,
          T1.PCDM AS ywsypcdm,
          T1.PCMC AS ywsypc,
          T1.YPYF AS ywsytj,
          T1.YPYFMC AS ywsytjmc,
          (
          SELECT
          CASE T6.yplh
          WHEN '02' THEN
          T1.YPSL * T1.YPJL
          WHEN '03' THEN
          T1.YPSL
          ELSE
          0
          END
          ) AS ywsyzjl,
          T1.FZXH AS cfypzh,
          T1.YPMC AS zyypcf,
          'NA' AS zyypjs,
          'NA' AS zyypjzf,
          T1.PCDM AS zyyyff,
          'NA' AS zfbm,
          'NA' AS zzzf,
          T2.YSMC AS klysqm,
          T2.YSDM AS ysbm,
          'NA' AS shyjsbm,
          'NA' AS shyjsqm,
          'NA' AS tpyjsbm,
          'NA' AS tpyjsqm,
          'NA' AS hdyjsbm,
          'NA' AS hdyjsqm,
          'NA' AS fyyjsbm,
          'NA' AS fyyjsqm,
          ISNULL(T2.MEMO, 'NA') AS cfbzxx,
          CONVERT (
          DECIMAL (18, 2),
          (T1.YPSL * T1.YLSJ) / T1.YKXS
          ) AS cfypje,
          GETDATE() AS gxsj
          FROM #OUTP_ORDERITEM T1
          INNER JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDER] T2(nolock) ON T1.CFXH = T2.XH
          INNER JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_JZJLK] T3(nolock) ON T2.GHXH = T3.GHXH
          INNER JOIN [HLHT_MZ_HIS].[THIS4].[dbo].[YK_YPCDMLK] T6(nolock)  on T1.CD_IDM = T6.idm
          WHERE
          T6.yplh IN ('004','005','006')  --需要根据医院实际情况对该口径进行修改
          AND T3.ZDDM IS NOT NULL AND T3.ZDDM != ''
      --删除临时表
      DROP TABLE #OUTP_ORDERITEM
     end
  else
    --存在@syxh
    begin
     --创建临时表
      SELECT * INTO #OUTP_ORDER_TEMP FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDER] T(nolock)
      WHERE  T.GHXH=@syxh
       --在临时表上增加索引
      CREATE INDEX INDEX_OUTP_ORDER_TEMP ON #OUTP_ORDER_TEMP (GHXH);
      --查询业务数据
      SELECT
                    ISNULL(T1.XH, 'NA') AS yjlxh,
          ISNULL(CONVERT (VARCHAR, T2.GHXH), 'NA') AS jzlsh,
          ISNULL(CONVERT (VARCHAR, T3.PATID),'NA') AS patid,
          ISNULL(CONVERT (VARCHAR, T2.HZXM),'NA') AS hzxm,
          ISNULL(CONVERT (VARCHAR, T2.GHXH),'NA') AS mjzh,
          ISNULL(CONVERT (VARCHAR, T3.SFZH),'NA') AS sfzhm,
          (
          CASE T3.SEX
          WHEN '女' THEN
          '2'
          WHEN '男' THEN
          '1'
          ELSE
          '3'
          END
          ) AS xbdm,
          ISNULL(T3.SEX, 'NA') AS xbmc,
          ISNULL(
          CONVERT (
          VARCHAR,
          (
          YEAR (GETDATE()) - YEAR (CONVERT(DATETIME, T3.BIRTH))
          )
          ),
          ''
          ) AS nls,
          DATEDIFF(MONTH,T3.BIRTH,SUBSTRING (CONVERT (CHAR(8), GETDATE(), 112),1,8)) % 12 AS nly,
          ISNULL(T1.CFXH, 'NA') AS cfxh,
          (
          SELECT
          t.DICT_LABEL
          FROM
          [CIS_HLHT].[dbo].[MBZ_DICT_INFO] t(nolock)
          WHERE
          t.DICT_CODE = 'hospitalInfoNo'
          AND t.DICT_VALUE = 1
          ) AS zzjgdm,
          (
          SELECT
          t.DICT_LABEL
          FROM
          [CIS_HLHT].[dbo].[MBZ_DICT_INFO] t(nolock)
          WHERE
          t.DICT_CODE = 'hospitalInfoName'
          AND t.DICT_VALUE = 1
          ) AS zzjgmc,
          (
          SELECT
          CASE T6.yplh
          WHEN '02' THEN
          '2'
          WHEN '03' THEN
          '1'
          ELSE
          'NA'
          END
          ) AS cflb,
          'NA' AS cflbmc,
          (
          SUBSTRING (T2.LRRQ, 1, 4) + '-' + SUBSTRING (T2.LRRQ, 5, 2) + '-' + SUBSTRING (T2.LRRQ, 7, 2) + ' ' + SUBSTRING (T2.LRRQ, 9, 8)
          ) AS cfklrq,
          T1.TS AS cfyxts,
          T2.KSDM AS cfklksdm,
          T2.KSMC AS cfklks,
          (
          SELECT
          T7.ZDDM
          FROM
          [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE
          T2.GHXH = T7.GHXH
          AND T7.ZDLB = 0
          AND T7.ZDLX = 0
          ) AS jbzdbm,
          (
          SELECT
          T7.ZDMC
          FROM
          [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE
          T2.GHXH = T7.GHXH
          AND T7.ZDLB = 0
          AND T7.ZDLX = 0
          ) AS jbzd,
          ISNULL(
          (
          SELECT
          T7.ZDDM
          FROM
          [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE
          T2.GHXH = T7.GHXH
          AND T7.ZDLB = 1
          AND T7.ZDLX = 0
          ),
          'NA'
          ) AS zybmdm,
          ISNULL(
          (
          SELECT
          T7.ZDMC
          FROM
          [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE
          T2.GHXH = T7.GHXH
          AND T7.ZDLB = 1
          AND T7.ZDLX = 0
          ),
          'NA'
          ) AS zybm,
          ISNULL(
          (
          SELECT
          T7.ZXDM
          FROM
          [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE
          T2.GHXH = T7.GHXH
          AND T7.ZDLB = 1
          AND T7.ZDLX = 0
          ),
          'NA'
          ) AS zyzhdm,
          ISNULL(
          (
          SELECT
          T7.ZXMC
          FROM
          [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE
          T2.GHXH = T7.GHXH
          AND T7.ZDLB = 1
          AND T7.ZDLX = 0
          ),
          'NA'
          ) AS zyzh,
          T1.YPDM AS ywdm,
          T1.YPMC AS ywmc,
          T1.YPGG AS ywgg,
          T1.JXDM AS ywjxdm,
          T1.JXMC AS ywjx,
          T1.YPJL AS ywsycjl,
          T1.JLDW AS ywsyjldw,
          T1.PCDM AS ywsypcdm,
          T1.PCMC AS ywsypc,
          T1.YPYF AS ywsytj,
          T1.YPYFMC AS ywsytjmc,
          (
          SELECT
          CASE T6.yplh
          WHEN '02' THEN
          T1.YPSL * T1.YPJL
          WHEN '03' THEN
          T1.YPSL
          ELSE
          0
          END
          ) AS ywsyzjl,
          T1.FZXH AS cfypzh,
          T1.YPMC AS zyypcf,
          'NA' AS zyypjs,
          'NA' AS zyypjzf,
          T1.PCDM AS zyyyff,
          'NA' AS zfbm,
          'NA' AS zzzf,
          T2.YSMC AS klysqm,
          T2.YSDM AS ysbm,
          'NA' AS shyjsbm,
          'NA' AS shyjsqm,
          'NA' AS tpyjsbm,
          'NA' AS tpyjsqm,
          'NA' AS hdyjsbm,
          'NA' AS hdyjsqm,
          'NA' AS fyyjsbm,
          'NA' AS fyyjsqm,
          ISNULL(T2.MEMO, 'NA') AS cfbzxx,
          CONVERT (
          DECIMAL (18, 2),
          (T1.YPSL * T1.YLSJ) / T1.YKXS
          ) AS cfypje,
          GETDATE() AS gxsj
          FROM #OUTP_ORDER_TEMP T2
          INNER JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDERITEM] T1(nolock) ON T1.CFXH = T2.XH
          INNER JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_JZJLK] T3(nolock) ON T2.GHXH = T3.GHXH
          INNER JOIN [HLHT_MZ_HIS].[THIS4].[dbo].[YK_YPCDMLK] T6(nolock)  on T1.CD_IDM = T6.idm
          WHERE
          T6.yplh IN ('004','005','006')  --需要根据医院实际情况对该口径进行修改
          AND T3.ZDDM IS NOT NULL AND T3.ZDDM != ''
          and T2.CJRQ BETWEEN  @startDate  AND  @endDate
      --删除临时表
      DROP TABLE #OUTP_ORDER_TEMP
    end
  end

  GO
  GO
CREATE PROCEDURE [dbo].[USP_HLHT_MJZCF_ZYCF_YEAR_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chenfeng
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出互联互通中药处方信息年数据 ---USP_HLHT_MJZCF_ZYCF_YEAR_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_MJZCF_ZYCF_YEAR_DATA '1','2018010100:00:00','2018010323:59:59','1' --通过首页序号提取数据
      exec USP_HLHT_MJZCF_ZYCF_YEAR_DATA '1','2018010100:00:00','2018010323:59:59',NULL  --提取当天的数据
[注意事项]
 1、在CIS_HLHT中创建
 2、[HLHT_MZ_HIS].[THIS4].[dbo].[YK_YPCDMLK].yplh 需要根据医院实际情况对该口径进行修改
*/
begin
--判断@syxh是否存在
if @syxh  is null or @syxh = ''
  --不存在首页序号
	begin
    --创建临时表
		SELECT * INTO #OUTP_NORDERITEM FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NORDERITEM] T(nolock)
		WHERE T.CJRQ BETWEEN  @startDate  AND  @endDate
		--在临时表上增加索引
		CREATE INDEX CD_IDM_INDEX ON #OUTP_NORDERITEM (CD_IDM);
		--查询业务数据
     SELECT
        ISNULL(T1.XH, 'NA') AS yjlxh,
          ISNULL(CONVERT (VARCHAR, T2.GHXH), 'NA') AS jzlsh,
          ISNULL(CONVERT (VARCHAR, T3.PATID),'NA') AS patid,
          ISNULL(CONVERT (VARCHAR, T2.HZXM),'NA') AS hzxm,
          ISNULL(CONVERT (VARCHAR, T2.GHXH),'NA') AS mjzh,
          ISNULL(CONVERT (VARCHAR, T3.SFZH),'NA') AS sfzhm,
          (
          CASE T3.SEX
          WHEN '女' THEN
          '2'
          WHEN '男' THEN
          '1'
          ELSE
          '3'
          END
          ) AS xbdm,
          ISNULL(T3.SEX, 'NA') AS xbmc,
          ISNULL(
          CONVERT (
          VARCHAR,
          (
          YEAR (GETDATE()) - YEAR (CONVERT(DATETIME, T3.BIRTH))
          )
          ),
          ''
          ) AS nls,
          DATEDIFF(MONTH,T3.BIRTH,SUBSTRING (CONVERT (CHAR(8), GETDATE(), 112),1,8)) % 12 AS nly,
          ISNULL(T1.CFXH, 'NA') AS cfxh,
          (
          SELECT
          t.DICT_LABEL
          FROM
          [CIS_HLHT].[dbo].[MBZ_DICT_INFO] t(nolock)
          WHERE
          t.DICT_CODE = 'hospitalInfoNo'
          AND t.DICT_VALUE = 1
          ) AS zzjgdm,
          (
          SELECT
          t.DICT_LABEL
          FROM
          [CIS_HLHT].[dbo].[MBZ_DICT_INFO] t(nolock)
          WHERE
          t.DICT_CODE = 'hospitalInfoName'
          AND t.DICT_VALUE = 1
          ) AS zzjgmc,
          (
          SELECT
          CASE T6.yplh
          WHEN '02' THEN
          '2'
          WHEN '03' THEN
          '1'
          ELSE
          'NA'
          END
          ) AS cflb,
          'NA' AS cflbmc,
          (
          SUBSTRING (T2.LRRQ, 1, 4) + '-' + SUBSTRING (T2.LRRQ, 5, 2) + '-' + SUBSTRING (T2.LRRQ, 7, 2) + ' ' + SUBSTRING (T2.LRRQ, 9, 8)
          ) AS cfklrq,
          T1.TS AS cfyxts,
          T2.KSDM AS cfklksdm,
          T2.KSMC AS cfklks,
          (
          SELECT
          T7.ZDDM
          FROM
          [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE
          T2.GHXH = T7.GHXH
          AND T7.ZDLB = 0
          AND T7.ZDLX = 0
          ) AS jbzdbm,
          (
          SELECT
          T7.ZDMC
          FROM
          [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE
          T2.GHXH = T7.GHXH
          AND T7.ZDLB = 0
          AND T7.ZDLX = 0
          ) AS jbzd,
          ISNULL(
          (
          SELECT
          T7.ZDDM
          FROM
          [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE
          T2.GHXH = T7.GHXH
          AND T7.ZDLB = 1
          AND T7.ZDLX = 0
          ),
          'NA'
          ) AS zybmdm,
          ISNULL(
          (
          SELECT
          T7.ZDMC
          FROM
          [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE
          T2.GHXH = T7.GHXH
          AND T7.ZDLB = 1
          AND T7.ZDLX = 0
          ),
          'NA'
          ) AS zybm,
          ISNULL(
          (
          SELECT
          T7.ZXDM
          FROM
          [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE
          T2.GHXH = T7.GHXH
          AND T7.ZDLB = 1
          AND T7.ZDLX = 0
          ),
          'NA'
          ) AS zyzhdm,
          ISNULL(
          (
          SELECT
          T7.ZXMC
          FROM
          [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE
          T2.GHXH = T7.GHXH
          AND T7.ZDLB = 1
          AND T7.ZDLX = 0
          ),
          'NA'
          ) AS zyzh,
          T1.YPDM AS ywdm,
          T1.YPMC AS ywmc,
          T1.YPGG AS ywgg,
          T1.JXDM AS ywjxdm,
          T1.JXMC AS ywjx,
          T1.YPJL AS ywsycjl,
          T1.JLDW AS ywsyjldw,
          T1.PCDM AS ywsypcdm,
          T1.PCMC AS ywsypc,
          T1.YPYF AS ywsytj,
          T1.YPYFMC AS ywsytjmc,
          (
          SELECT
          CASE T6.yplh
          WHEN '02' THEN
          T1.YPSL * T1.YPJL
          WHEN '03' THEN
          T1.YPSL
          ELSE
          0
          END
          ) AS ywsyzjl,
          T1.FZXH AS cfypzh,
          T1.YPMC AS zyypcf,
          'NA' AS zyypjs,
          'NA' AS zyypjzf,
          T1.PCDM AS zyyyff,
          'NA' AS zfbm,
          'NA' AS zzzf,
          T2.YSMC AS klysqm,
          T2.YSDM AS ysbm,
          'NA' AS shyjsbm,
          'NA' AS shyjsqm,
          'NA' AS tpyjsbm,
          'NA' AS tpyjsqm,
          'NA' AS hdyjsbm,
          'NA' AS hdyjsqm,
          'NA' AS fyyjsbm,
          'NA' AS fyyjsqm,
          ISNULL(T2.MEMO, 'NA') AS cfbzxx,
          CONVERT (
          DECIMAL (18, 2),
          (T1.YPSL * T1.YLSJ) / T1.YKXS
          ) AS cfypje,
          GETDATE() AS gxsj
        FROM #OUTP_NORDERITEM T1
        INNER JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NORDER] T2(nolock) ON T1.CFXH = T2.XH
        INNER JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NJZJLK] T3(nolock) ON T2.GHXH = T3.GHXH
        INNER JOIN [HLHT_MZ_HIS].[THIS4].[dbo].[YK_YPCDMLK] T6(nolock)  on T1.CD_IDM = T6.idm
        WHERE
        T6.yplh IN ('004','005','006')  --需要根据医院实际情况对该口径进行修改
        AND T3.ZDDM IS NOT NULL AND T3.ZDDM != ''
		--删除临时表
		DROP TABLE #OUTP_NORDERITEM
	 end
else
  --存在@syxh
	begin
	 --创建临时表
		SELECT * INTO #OUTP_NORDER_TEMP FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NORDER] T(nolock)
		WHERE  T.GHXH=@syxh
		 --在临时表上增加索引
		CREATE INDEX INDEX_OUTP_NORDER_TEMP ON #OUTP_NORDER_TEMP (GHXH);
		--查询业务数据
    SELECT
        ISNULL(T1.XH, 'NA') AS yjlxh,
          ISNULL(CONVERT (VARCHAR, T2.GHXH), 'NA') AS jzlsh,
          ISNULL(CONVERT (VARCHAR, T3.PATID),'NA') AS patid,
          ISNULL(CONVERT (VARCHAR, T2.HZXM),'NA') AS hzxm,
          ISNULL(CONVERT (VARCHAR, T2.GHXH),'NA') AS mjzh,
          ISNULL(CONVERT (VARCHAR, T3.SFZH),'NA') AS sfzhm,
          (
          CASE T3.SEX
          WHEN '女' THEN
          '2'
          WHEN '男' THEN
          '1'
          ELSE
          '3'
          END
          ) AS xbdm,
          ISNULL(T3.SEX, 'NA') AS xbmc,
          ISNULL(
          CONVERT (
          VARCHAR,
          (
          YEAR (GETDATE()) - YEAR (CONVERT(DATETIME, T3.BIRTH))
          )
          ),
          ''
          ) AS nls,
          DATEDIFF(MONTH,T3.BIRTH,SUBSTRING (CONVERT (CHAR(8), GETDATE(), 112),1,8)) % 12 AS nly,
          ISNULL(T1.CFXH, 'NA') AS cfxh,
          (
          SELECT
          t.DICT_LABEL
          FROM
          [CIS_HLHT].[dbo].[MBZ_DICT_INFO] t(nolock)
          WHERE
          t.DICT_CODE = 'hospitalInfoNo'
          AND t.DICT_VALUE = 1
          ) AS zzjgdm,
          (
          SELECT
          t.DICT_LABEL
          FROM
          [CIS_HLHT].[dbo].[MBZ_DICT_INFO] t(nolock)
          WHERE
          t.DICT_CODE = 'hospitalInfoName'
          AND t.DICT_VALUE = 1
          ) AS zzjgmc,
          (
          SELECT
          CASE T6.yplh
          WHEN '02' THEN
          '2'
          WHEN '03' THEN
          '1'
          ELSE
          'NA'
          END
          ) AS cflb,
          'NA' AS cflbmc,
          (
          SUBSTRING (T2.LRRQ, 1, 4) + '-' + SUBSTRING (T2.LRRQ, 5, 2) + '-' + SUBSTRING (T2.LRRQ, 7, 2) + ' ' + SUBSTRING (T2.LRRQ, 9, 8)
          ) AS cfklrq,
          T1.TS AS cfyxts,
          T2.KSDM AS cfklksdm,
          T2.KSMC AS cfklks,
          (
          SELECT
          T7.ZDDM
          FROM
          [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE
          T2.GHXH = T7.GHXH
          AND T7.ZDLB = 0
          AND T7.ZDLX = 0
          ) AS jbzdbm,
          (
          SELECT
          T7.ZDMC
          FROM
          [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE
          T2.GHXH = T7.GHXH
          AND T7.ZDLB = 0
          AND T7.ZDLX = 0
          ) AS jbzd,
          ISNULL(
          (
          SELECT
          T7.ZDDM
          FROM
          [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE
          T2.GHXH = T7.GHXH
          AND T7.ZDLB = 1
          AND T7.ZDLX = 0
          ),
          'NA'
          ) AS zybmdm,
          ISNULL(
          (
          SELECT
          T7.ZDMC
          FROM
          [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE
          T2.GHXH = T7.GHXH
          AND T7.ZDLB = 1
          AND T7.ZDLX = 0
          ),
          'NA'
          ) AS zybm,
          ISNULL(
          (
          SELECT
          T7.ZXDM
          FROM
          [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE
          T2.GHXH = T7.GHXH
          AND T7.ZDLB = 1
          AND T7.ZDLX = 0
          ),
          'NA'
          ) AS zyzhdm,
          ISNULL(
          (
          SELECT
          T7.ZXMC
          FROM
          [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE
          T2.GHXH = T7.GHXH
          AND T7.ZDLB = 1
          AND T7.ZDLX = 0
          ),
          'NA'
          ) AS zyzh,
          T1.YPDM AS ywdm,
          T1.YPMC AS ywmc,
          T1.YPGG AS ywgg,
          T1.JXDM AS ywjxdm,
          T1.JXMC AS ywjx,
          T1.YPJL AS ywsycjl,
          T1.JLDW AS ywsyjldw,
          T1.PCDM AS ywsypcdm,
          T1.PCMC AS ywsypc,
          T1.YPYF AS ywsytj,
          T1.YPYFMC AS ywsytjmc,
          (
          SELECT
          CASE T6.yplh
          WHEN '02' THEN
          T1.YPSL * T1.YPJL
          WHEN '03' THEN
          T1.YPSL
          ELSE
          0
          END
          ) AS ywsyzjl,
          T1.FZXH AS cfypzh,
          T1.YPMC AS zyypcf,
          'NA' AS zyypjs,
          'NA' AS zyypjzf,
          T1.PCDM AS zyyyff,
          'NA' AS zfbm,
          'NA' AS zzzf,
          T2.YSMC AS klysqm,
          T2.YSDM AS ysbm,
          'NA' AS shyjsbm,
          'NA' AS shyjsqm,
          'NA' AS tpyjsbm,
          'NA' AS tpyjsqm,
          'NA' AS hdyjsbm,
          'NA' AS hdyjsqm,
          'NA' AS fyyjsbm,
          'NA' AS fyyjsqm,
          ISNULL(T2.MEMO, 'NA') AS cfbzxx,
          CONVERT (
          DECIMAL (18, 2),
          (T1.YPSL * T1.YLSJ) / T1.YKXS
          ) AS cfypje,
          GETDATE() AS gxsj
        FROM #OUTP_NORDER_TEMP T2
        INNER JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NORDERITEM] T1(nolock) ON T1.CFXH = T2.XH
        INNER JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NJZJLK] T3(nolock) ON T2.GHXH = T3.GHXH
        INNER JOIN [HLHT_MZ_HIS].[THIS4].[dbo].[YK_YPCDMLK] T6(nolock)  on T1.CD_IDM = T6.idm
        WHERE
        T6.yplh IN ('004','005','006')  --需要根据医院实际情况对该口径进行修改
        AND T3.ZDDM IS NOT NULL AND T3.ZDDM != ''
        and T2.CJRQ BETWEEN  @startDate  AND  @endDate
		--删除临时表
		DROP TABLE #OUTP_NORDER_TEMP
	end
end

GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_QUERY_EMR_QTBLJLK_LIST]
@keyWord varchar(64),   --关键字
@syxh       int         --首页序号
as
/*
[创建者] chensj
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]通过首页序号和关键字提取住院病历数据---USP_HLHT_QUERY_EMR_QTBLJLK_LIST
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_QUERY_EMR_QTBLJLK_LIST '入院记录(中医入院记录)',1,'2018-01-03','1' --通过首页序号和关键字提取数据
[注意事项]
 在CIS_HLHT中创建
*/
begin
    --创建临时表
		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM INTO #EMR_QTBLJLK FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE T.SYXH=@syxh AND T.BLMC LIKE '%'+@keyWord+'%'
		  AND T.YXJL = 1
		--查询业务数据
    SELECT * FROM #EMR_QTBLJLK
		--删除临时表
		DROP TABLE #EMR_QTBLJLK
end


GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_QUERY_EMR_QTBLJLK_MZ_LIST]
@keyWord varchar(64),   --关键字
@syxh       int         --首页序号
as
/*
[创建者] chensj
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]通过首页序号和关键字提取门诊病历数据---USP_HLHT_QUERY_EMR_QTBLJLK_MZ_LIST
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_QUERY_EMR_QTBLJLK_MZ_LIST '入院记录(中医入院记录)',1,'2018-01-03','1' --通过首页序号和关键字提取数据
[注意事项]
 在CIS_HLHT中创建
*/
begin
    --创建临时表
		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM INTO #EMR_QTBLJLK FROM [HLHT_MZ_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE T.SYXH=@syxh AND T.BLMC LIKE '%'+@keyWord+'%'
		  AND T.YXJL = 1
		--查询业务数据
    SELECT * FROM #EMR_QTBLJLK
		--删除临时表
		DROP TABLE #EMR_QTBLJLK
end

GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_RYJL_JBXX_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chenfeng
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出入院记录 ---USP_HLHT_RYJL_JBXX_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_RYJL_JBXX_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_RYJL_JBXX_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
[注意事项]
 在CIS_HLHT中创建
*/
begin
--创建临时表
if @syxh  is null or @syxh = ''
	begin
		   SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM INTO #EMR_QTBLJLK_LS FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		 AND T.YXJL=1;
         --在临时表上增加索引
		CREATE INDEX QUERY_INDEX_LS ON #EMR_QTBLJLK_LS (BLDM);

		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM INTO #EMR_QTBLJLK FROM #EMR_QTBLJLK_LS T(nolock)
		LEFT JOIN MBZ_DATA_LIST_SET A(nolock) on T.BLDM=A.MODEL_CODE
		WHERE A.SOURCE_TYPE=@sourceType;

		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK (SYXH);
		 --查询表数据
		 SELECT
				ISNULL(q.QTBLJLXH, 'NA') AS yjlxh,
        c.SYXH AS jzlsh,
        c.PATID AS patid,
        ISNULL(b.ZYHM, 'NA') AS zyh,
        ISNULL(c.BQDM, 'NA') AS bqdm,
        ISNULL(c.BQMC, 'NA') AS bqmc,
        ISNULL(c.KSDM, 'NA') AS ksdm,
        ISNULL(c.KSMC, 'NA') AS ksmc,
        ISNULL(m.fjh, 'NA') AS bfh,
        ISNULL(b.RYCW, 'NA') AS bch,
        ISNULL(b.HZXM, 'NA') AS hzxm,
        ISNULL(b.SFZH, 'NA') AS sfzhm,
        ISNULL(b.BRXB, 'NA') AS xbdm,
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
        ) AS xbmc,
        ISNULL(
        CONVERT(
        VARCHAR,
        (
        YEAR(GETDATE()) - YEAR(CONVERT(datetime, b.CSRQ))
        )
        ),

        '0'
        ) AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        ISNULL(b.MZDM, 'NA') AS mz,
        ISNULL(z.NAME, 'NA') AS mzmc,
        ISNULL(b.HYZK, 'NA') AS hyzkdm,
        (
        SELECT CASE b.HYZK
        WHEN '0'
        THEN
        '未婚'
        WHEN '1'
        THEN
        '已婚'
        WHEN '2'
        THEN
        '离独'
        WHEN '3'
        THEN
        '丧偶'
        ELSE
        '未知 '
        END
        ) AS hyzkmc,
        ISNULL(
        (
        SELECT e.NAME
        FROM
        [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e
        WHERE
        b.SSDM = e.DQDM
        ),
        'NA'
        ) AS dzsf,
        ISNULL(
        (
        SELECT e.NAME
        FROM
        [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e
        WHERE
        b.QXDM = e.DQDM
        ),
        'NA'
        ) AS dzsq,
        ISNULL(
        (
        SELECT e.NAME
        FROM
        [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e
        WHERE
        b.QXDM = e.DQDM
        ),
        'NA'
        ) AS dzx,
        ISNULL(
        (
        SELECT e.NAME
        FROM
        [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e
        WHERE
        b.QXDM = e.DQDM
        ),
        'NA'
        ) AS dzxz,
        'NA' AS dzc,
        'NA' AS dzmphm,
        ISNULL(b.ZYDM, 'NA') AS zylbdm,
        ISNULL(i.NAME, 'NA') AS zylbmc,
        b.RYRQ AS ryrq,
        q.SYXH AS syxh,
        q.TJZT AS tjzt,
        q.YXJL AS yxjl,
        GETDATE() AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] i on b.ZYDM=i.MXDM and LBDM = 41
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_MZDMK] z(nolock) ON z.ID = b.MZDM
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
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
		WHERE A.SOURCE_TYPE=@sourceType;

		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (SYXH);
		 --查询表数据
		 		SELECT
				ISNULL(q.QTBLJLXH, 'NA') AS yjlxh,
        c.SYXH AS jzlsh,
        c.PATID AS patid,
        ISNULL(b.ZYHM, 'NA') AS zyh,
        ISNULL(c.BQDM, 'NA') AS bqdm,
        ISNULL(c.BQMC, 'NA') AS bqmc,
        ISNULL(c.KSDM, 'NA') AS ksdm,
        ISNULL(c.KSMC, 'NA') AS ksmc,
        ISNULL(m.fjh, 'NA') AS bfh,
        ISNULL(b.RYCW, 'NA') AS bch,
        ISNULL(b.HZXM, 'NA') AS hzxm,
        ISNULL(b.SFZH, 'NA') AS sfzhm,
        ISNULL(b.BRXB, 'NA') AS xbdm,
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
        ) AS xbmc,
        ISNULL(
        CONVERT(
        VARCHAR,
        (
        YEAR(GETDATE()) - YEAR(CONVERT(datetime, b.CSRQ))
        )
        ),

        '0'
        ) AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        ISNULL(b.MZDM, 'NA') AS mz,
        ISNULL(z.NAME, 'NA') AS mzmc,
        ISNULL(b.HYZK, 'NA') AS hyzkdm,
        (
        SELECT CASE b.HYZK
        WHEN '0'
        THEN
        '未婚'
        WHEN '1'
        THEN
        '已婚'
        WHEN '2'
        THEN
        '离独'
        WHEN '3'
        THEN
        '丧偶'
        ELSE
        '未知 '
        END
        ) AS hyzkmc,
        ISNULL(
        (
        SELECT e.NAME
        FROM
        [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e
        WHERE
        b.SSDM = e.DQDM
        ),
        'NA'
        ) AS dzsf,
        ISNULL(
        (
        SELECT e.NAME
        FROM
        [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e
        WHERE
        b.QXDM = e.DQDM
        ),
        'NA'
        ) AS dzsq,
        ISNULL(
        (
        SELECT e.NAME
        FROM
        [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e
        WHERE
        b.QXDM = e.DQDM
        ),
        'NA'
        ) AS dzx,
        ISNULL(
        (
        SELECT e.NAME
        FROM
        [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e
        WHERE
        b.QXDM = e.DQDM
        ),
        'NA'
        ) AS dzxz,
        'NA' AS dzc,
        'NA' AS dzmphm,
        ISNULL(b.ZYDM, 'NA') AS zylbdm,
        ISNULL(i.NAME, 'NA') AS zylbmc,
        b.RYRQ AS ryrq,
        q.SYXH AS syxh,
        q.TJZT AS tjzt,
        q.YXJL AS yxjl,
        GETDATE() AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK_TEMP q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] i on b.ZYDM=i.MXDM and LBDM = 41
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_MZDMK] z(nolock) ON z.ID = b.MZDM
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
				--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS

	end

end

GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_RYJL_RCYJL_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chensj
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出互联互通24H出入院记录 ---USP_HLHT_RYJL_RCYJL_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_RYJL_RCYJL_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_RYJL_RCYJL_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
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
		SELECT
				t.QTBLJLXH as yjlxh,
				b.HISSYXH as jzlsh,
				c.PATID as patid,
				b.ZYHM as zyh,
				b.HZXM as hzxm,
				b.SFZH as sfzhm,
				b.BRXB as xbdm,
				(
				SELECT
				CASE b.BRXB
				WHEN '2' THEN
				'女'
				WHEN '1' THEN
				'男'
				ELSE
				'其它'
				END
				) AS xbmc,
				ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'') as nls,
				datediff(month,b.CSRQ,substring(convert(char(8),getdate(),112),1,8)) %12 as nly,
				b.MZDM as mz,
				ISNULL(d.NAME,'NA') as mzmc,
				b.HYZK as hyzkdm,
				(
				SELECT
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
				END
				) AS hyzkmc,
				ISNULL((SELECT e.NAME FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e(nolock) WHERE b.SSDM = e.DQDM),'NA') as dzsf,
				ISNULL((SELECT e.NAME FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e(nolock) WHERE b.QXDM = e.DQDM),'NA') as dzsq,
				ISNULL((SELECT e.NAME FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e(nolock) WHERE b.QXDM = e.DQDM),'NA') as dzx,
				ISNULL((SELECT e.NAME FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e(nolock) WHERE b.QXDM = e.DQDM),'NA') as dzxz,
				'NA' as dzc,
				'NA' as dzmphm,
				case when b.ZYDM = '' or b.ZYDM IS null then 'NA' else b.ZYDM end as zylbdm,
				case when i.NAME = '' or i.NAME IS null then 'NA' else i.NAME end as  zylbmc,
				GETDATE() as gxsj,
				t.SYXH as syxh,
				t.TJZT as tjzt,
				t.YXJL as yxjl,
				t.BLMC as blmc,
				t.FSSJ as fssj,
				t.BLNR as blnr
				FROM #EMR_QTBLJLK t
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_MZDMK] d(nolock) on b.MZDM = d.ID
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] i(nolock) on b.ZYDM=i.MXDM and LBDM = 41
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
		SELECT
				t.QTBLJLXH as yjlxh,
				b.HISSYXH as jzlsh,
				c.PATID as patid,
				b.ZYHM as zyh,
				b.HZXM as hzxm,
				b.SFZH as sfzhm,
				b.BRXB as xbdm,
				(
				SELECT
				CASE b.BRXB
				WHEN '2' THEN
				'女'
				WHEN '1' THEN
				'男'
				ELSE
				'其它'
				END
				) AS xbmc,
				ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'') as nls,
				datediff(month,b.CSRQ,substring(convert(char(8),getdate(),112),1,8)) %12 as nly,
				b.MZDM as mz,
				ISNULL(d.NAME,'NA') as mzmc,
				b.HYZK as hyzkdm,
				(
				SELECT
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
				END
				) AS hyzkmc,
				ISNULL((SELECT e.NAME FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e(nolock) WHERE b.SSDM = e.DQDM),'NA') as dzsf,
				ISNULL((SELECT e.NAME FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e(nolock) WHERE b.QXDM = e.DQDM),'NA') as dzsq,
				ISNULL((SELECT e.NAME FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e(nolock) WHERE b.QXDM = e.DQDM),'NA') as dzx,
				ISNULL((SELECT e.NAME FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e(nolock) WHERE b.QXDM = e.DQDM),'NA') as dzxz,
				'NA' as dzc,
				'NA' as dzmphm,
				case when b.ZYDM = '' or b.ZYDM IS null then 'NA' else b.ZYDM end as zylbdm,
				case when i.NAME = '' or i.NAME IS null then 'NA' else i.NAME end as  zylbmc,
				GETDATE() as gxsj,
			  t.SYXH as syxh,
				t.TJZT as tjzt,
				t.YXJL as yxjl,
				t.BLMC as blmc,
				t.FSSJ as fssj,
				t.BLNR as blnr
				FROM #EMR_QTBLJLK_TEMP t
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_MZDMK] d(nolock) on b.MZDM = d.ID
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] i(nolock) on b.ZYDM=i.MXDM and LBDM = 41
		--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end
end

GO
GO
CREATE PROCEDURE [dbo].[USP_HLHT_RYJL_RYSWJL_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chensj
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出生成入院记录/24小时死亡记录 ---USP_HLHT_RYJL_RYSWJL_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_RYJL_RYSWJL_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_RYJL_RYSWJL_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
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
    SELECT
        t.QTBLJLXH as yjlxh,
        b.HISSYXH as jzlsh,
        c.PATID as patid,
        b.ZYHM as zyh,
        b.HZXM as hzxm,
        b.SFZH as sfzhm,
        b.BRXB as xbdm,
        (
        SELECT
        CASE b.BRXB
        WHEN '2' THEN
        '女'
        WHEN '1' THEN
        '男'
        ELSE
        '其它'
        END
        ) AS xbmc,
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'NA') as nls,
        datediff(month,b.CSRQ,substring(convert(char(8),getdate(),112),1,8)) %12 as nly,
        b.MZDM as mz,
        ISNULL(d.NAME,'NA') as mzmc,
        b.HYZK as hyzkdm,
        (
        SELECT
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
        END
        ) AS hyzkmc,
        ISNULL((SELECT e.NAME FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e(nolock) WHERE b.SSDM = e.DQDM),'NA') as dzsf,
        ISNULL((SELECT e.NAME FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e(nolock) WHERE b.QXDM = e.DQDM),'NA') as dzsq,
        ISNULL((SELECT e.NAME FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e(nolock) WHERE b.QXDM = e.DQDM),'NA') as dzx,
        ISNULL((SELECT e.NAME FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e(nolock) WHERE b.QXDM = e.DQDM),'NA') as dzxz,
        'NA' as dzc,
        'NA' as dzmphm,
        b.ZYDM as zylbdm,
        i.NAME as zylbmc,
        CASE WHEN b.CYRQ IS NULL THEN GETDATE() ELSE b.CYRQ END as cyrq,
        t.TJZT as tjzt,
        GETDATE() as gxsj,
        t.YXJL as yxjl,
        t.SYXH as syxh,
        t.BLMC as blmc,
				t.FSSJ as fssj,
				t.BLNR as blnr
        FROM #EMR_QTBLJLK t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_MZDMK] d(nolock) on b.MZDM = d.ID
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] i(nolock) on b.ZYDM=i.MXDM and LBDM = 41
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
      SELECT
        t.QTBLJLXH as yjlxh,
        b.HISSYXH as jzlsh,
        c.PATID as patid,
        b.ZYHM as zyh,
        b.HZXM as hzxm,
        b.SFZH as sfzhm,
        b.BRXB as xbdm,
        (
        SELECT
        CASE b.BRXB
        WHEN '2' THEN
        '女'
        WHEN '1' THEN
        '男'
        ELSE
        '其它'
        END
        ) AS xbmc,
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'NA') as nls,
        datediff(month,b.CSRQ,substring(convert(char(8),getdate(),112),1,8)) %12 as nly,
        b.MZDM as mz,
        ISNULL(d.NAME,'NA') as mzmc,
        b.HYZK as hyzkdm,
        (
        SELECT
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
        END
        ) AS hyzkmc,
        ISNULL((SELECT e.NAME FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e(nolock) WHERE b.SSDM = e.DQDM),'NA') as dzsf,
        ISNULL((SELECT e.NAME FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e(nolock) WHERE b.QXDM = e.DQDM),'NA') as dzsq,
        ISNULL((SELECT e.NAME FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e(nolock) WHERE b.QXDM = e.DQDM),'NA') as dzx,
        ISNULL((SELECT e.NAME FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] e(nolock) WHERE b.QXDM = e.DQDM),'NA') as dzxz,
        'NA' as dzc,
        'NA' as dzmphm,
        b.ZYDM as zylbdm,
        i.NAME as zylbmc,
        CASE WHEN b.CYRQ IS NULL THEN GETDATE() ELSE b.CYRQ END as cyrq,
        t.TJZT as tjzt,
        GETDATE() as gxsj,
        t.YXJL as yxjl,
        t.SYXH as syxh,
        t.BLMC as blmc,
				t.FSSJ as fssj,
				t.BLNR as blnr
        FROM #EMR_QTBLJLK_TEMP t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_MZDMK] d(nolock) on b.MZDM = d.ID
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] i(nolock) on b.ZYDM=i.MXDM and LBDM = 41
		--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end
end
GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZCJL_PGC_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chenkuai
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出剖宫产记录 ---USP_HLHT_ZCJL_PGC_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZCJL_PGC_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZCJL_PGC_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
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
        DROP TABLE #EMR_QTBLJLK_TEMP_LS


      end

    END

	GO
	GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZCJL_YDFM_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chenfeng
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出阴道分娩记录 ---USP_HLHT_ZCJL_YDFM_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZCJL_YDFM_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZCJL_YDFM_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
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
				ISNULL(q.QTBLJLXH, 'NA')                   AS yjlxh,
        c.SYXH                                    AS jzlsh,
        c.PATID                                   AS patid,
        ISNULL(b.ZYHM, 'NA')                       AS zyh,
        ISNULL(b.HZXM, 'NA')                       AS cfxm,
        ISNULL(b.SFZH, 'NA')                       AS sfzhm,
        ISNULL(c.BQDM, 'NA')                       AS bqdm,
        ISNULL(c.BQMC, 'NA')                       AS bqmc,
        ISNULL(c.KSDM, 'NA')                       AS ksdm,
        ISNULL(c.KSMC, 'NA')                       AS ksmc,
        ISNULL(m.fjh, 'NA')                        AS bfh,
        ISNULL(b.RYCW, 'NA')                       AS bch,
        ISNULL(
        CONVERT(
        VARCHAR,
        (
        YEAR(GETDATE()) - YEAR(CONVERT(datetime, b.CSRQ))
        )
        ),

        '0'
        )                                         AS nls,
        q.SYXH                                AS syxh,
        q.TJZT                                    AS tjzt,
        q.YXJL                                    AS yxjl,
        GETDATE()                                 AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
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
		WHERE A.SOURCE_TYPE=@sourceType;

		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (SYXH);
		 --查询表数据
				SELECT
				ISNULL(q.QTBLJLXH, 'NA')                   AS yjlxh,
        c.SYXH                                    AS jzlsh,
        c.PATID                                   AS patid,
        ISNULL(b.ZYHM, 'NA')                       AS zyh,
        ISNULL(b.HZXM, 'NA')                       AS cfxm,
        ISNULL(b.SFZH, 'NA')                       AS sfzhm,
        ISNULL(c.BQDM, 'NA')                       AS bqdm,
        ISNULL(c.BQMC, 'NA')                       AS bqmc,
        ISNULL(c.KSDM, 'NA')                       AS ksdm,
        ISNULL(c.KSMC, 'NA')                       AS ksmc,
        ISNULL(m.fjh, 'NA')                        AS bfh,
        ISNULL(b.RYCW, 'NA')                       AS bch,
        ISNULL(
        CONVERT(
        VARCHAR,
        (
        YEAR(GETDATE()) - YEAR(CONVERT(datetime, b.CSRQ))
        )
        ),

        '0'
        )                                         AS nls,
        q.SYXH                                AS syxh,
        q.TJZT                                    AS tjzt,
        q.YXJL                                    AS yxjl,
        GETDATE()                                 AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK_TEMP q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
				--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end

end

GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZLCZJL_MZSHFSJL_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chenfeng
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出麻醉术后访视记录 ---USP_HLHT_ZLCZJL_MZSHFSJL_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZLCZJL_MZSHFSJL_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZLCZJL_MZSHFSJL_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
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
				ISNULL(q.QTBLJLXH,'NA') AS yjlxh,
        c.SYXH AS jzlsh,
        c.PATID AS patid,
        ISNULL(b.ZYHM, 'NA') AS zyh,
        (
        SELECT
        t.DICT_LABEL
        FROM
        [MBZ_DICT_INFO] t(nolock)
        WHERE
        t.DICT_CODE = 'hospitalInfoNo'
        AND t.DICT_VALUE = 1
        )  AS zzjgdm,
        (
        SELECT
        t.DICT_LABEL
        FROM
        [MBZ_DICT_INFO] t(nolock)
        WHERE
        t.DICT_CODE = 'hospitalInfoName'
        AND t.DICT_VALUE = 1
        ) AS zzjgmc,
        ISNULL(
        CONVERT (VARCHAR,(o.GHXH)),
        'NA'
        ) AS mjzh,
        ISNULL(
        CONVERT (VARCHAR,(o.GHLB)),
        'NA'
        ) AS jzlb,
        -9 AS tz,
        'NA' AS dzsqsbh,
        ISNULL(c.BQDM, 'NA') AS bqdm,
        ISNULL(c.BQMC, 'NA') AS bqmc,
        ISNULL(c.KSDM, 'NA') AS ksdm,
        ISNULL(c.KSMC, 'NA') AS ksmc,
        ISNULL(m.fjh,'NA') AS bfh,
        ISNULL(b.RYCW, 'NA') AS bch,
        ISNULL(b.HZXM, 'NA') AS hzxm,
        ISNULL(b.SFZH, 'NA') AS sfzhm,
        ISNULL(b.BRXB, 'NA') AS xbdm,
        (
        SELECT
        CASE b.BRXB
        WHEN '2' THEN
        '女'
        WHEN '1' THEN
        '男'
        ELSE
        '其它'
        END
        ) AS xbmc,
        ISNULL(
        CONVERT (
        VARCHAR,
        (
        YEAR (GETDATE()) - YEAR (CONVERT(datetime, b.CSRQ))
        )
        ),

        '0'
        ) AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        q.SYXH AS syxh,
        q.TJZT AS tjzt,
        q.YXJL AS yxjl,
        GETDATE() AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_JZJLK] o(nolock) ON q.SYXH = o.EMRXH
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
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
		WHERE A.SOURCE_TYPE=@sourceType;

		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (SYXH);
		 --查询表数据
		 		SELECT
				ISNULL(q.QTBLJLXH,'NA') AS yjlxh,
        c.SYXH AS jzlsh,
        c.PATID AS patid,
        ISNULL(b.ZYHM, 'NA') AS zyh,
        (
        SELECT
        t.DICT_LABEL
        FROM
        [MBZ_DICT_INFO] t(nolock)
        WHERE
        t.DICT_CODE = 'hospitalInfoNo'
        AND t.DICT_VALUE = 1
        )  AS zzjgdm,
        (
        SELECT
        t.DICT_LABEL
        FROM
        [MBZ_DICT_INFO] t(nolock)
        WHERE
        t.DICT_CODE = 'hospitalInfoName'
        AND t.DICT_VALUE = 1
        ) AS zzjgmc,
        ISNULL(
        CONVERT (VARCHAR,(o.GHXH)),
        'NA'
        ) AS mjzh,
        ISNULL(
        CONVERT (VARCHAR,(o.GHLB)),
        'NA'
        ) AS jzlb,
        -9 AS tz,
        'NA' AS dzsqsbh,
        ISNULL(c.BQDM, 'NA') AS bqdm,
        ISNULL(c.BQMC, 'NA') AS bqmc,
        ISNULL(c.KSDM, 'NA') AS ksdm,
        ISNULL(c.KSMC, 'NA') AS ksmc,
        ISNULL(m.fjh,'NA') AS bfh,
        ISNULL(b.RYCW, 'NA') AS bch,
        ISNULL(b.HZXM, 'NA') AS hzxm,
        ISNULL(b.SFZH, 'NA') AS sfzhm,
        ISNULL(b.BRXB, 'NA') AS xbdm,
        (
        SELECT
        CASE b.BRXB
        WHEN '2' THEN
        '女'
        WHEN '1' THEN
        '男'
        ELSE
        '其它'
        END
        ) AS xbmc,
        ISNULL(
        CONVERT (
        VARCHAR,
        (
        YEAR (GETDATE()) - YEAR (CONVERT(datetime, b.CSRQ))
        )
        ),

        '0'
        ) AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        q.SYXH AS syxh,
        q.TJZT AS tjzt,
        q.YXJL AS yxjl,
        GETDATE() AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK_TEMP q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_JZJLK] o(nolock) ON q.SYXH = o.EMRXH
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
				--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end

end

GO
GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZLCZJL_MZSQFSJL_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chenfeng
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出麻醉术前访视记录 ---USP_HLHT_ZLCZJL_MZSQFSJL_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZLCZJL_MZSQFSJL_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZLCZJL_MZSQFSJL_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
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
				ISNULL(q.QTBLJLXH,'NA') AS yjlxh,
        c.SYXH AS jzlsh,
        c.PATID AS patid,
        ISNULL(b.ZYHM, 'NA') AS zyh,
        ISNULL(
        CONVERT (VARCHAR,(o.GHXH)),
        'NA'
        ) AS mjzh,
        ISNULL(
        CONVERT (VARCHAR,(o.GHLB)),
        'NA'
        ) AS jzlb,
        -9 AS tz,
        'NA' AS dzsqsbh,
        ISNULL(c.BQDM, 'NA') AS bqdm,
        ISNULL(c.BQMC, 'NA') AS bqmc,
        ISNULL(c.KSDM, 'NA') AS ksdm,
        ISNULL(c.KSMC, 'NA') AS ksmc,
        ISNULL(m.fjh,'NA') AS bfh,
        ISNULL(b.RYCW, 'NA') AS bch,
        ISNULL(b.HZXM, 'NA') AS hzxm,
        ISNULL(b.SFZH, 'NA') AS sfzhm,
        ISNULL(b.BRXB, 'NA') AS xbdm,
        (
        SELECT
        CASE b.BRXB
        WHEN '2' THEN
        '女'
        WHEN '1' THEN
        '男'
        ELSE
        '其它'
        END
        ) AS xbmc,
        ISNULL(
        CONVERT (
        VARCHAR,
        (
        YEAR (GETDATE()) - YEAR (CONVERT(datetime, b.CSRQ))
        )
        ),

        '0'
        ) AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        q.SYXH AS syxh,
        q.TJZT AS tjzt,
        q.YXJL AS yxjl,
        GETDATE() AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_JZJLK] o(nolock) ON q.SYXH = o.EMRXH
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
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
		WHERE A.SOURCE_TYPE=@sourceType;

		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (SYXH);
		 --查询表数据
				SELECT
				ISNULL(q.QTBLJLXH,'NA') AS yjlxh,
        c.SYXH AS jzlsh,
        c.PATID AS patid,
        ISNULL(b.ZYHM, 'NA') AS zyh,
        ISNULL(
        CONVERT (VARCHAR,(o.GHXH)),
        'NA'
        ) AS mjzh,
        ISNULL(
        CONVERT (VARCHAR,(o.GHLB)),
        'NA'
        ) AS jzlb,
        -9 AS tz,
        'NA' AS dzsqsbh,
        ISNULL(c.BQDM, 'NA') AS bqdm,
        ISNULL(c.BQMC, 'NA') AS bqmc,
        ISNULL(c.KSDM, 'NA') AS ksdm,
        ISNULL(c.KSMC, 'NA') AS ksmc,
        ISNULL(m.fjh,'NA') AS bfh,
        ISNULL(b.RYCW, 'NA') AS bch,
        ISNULL(b.HZXM, 'NA') AS hzxm,
        ISNULL(b.SFZH, 'NA') AS sfzhm,
        ISNULL(b.BRXB, 'NA') AS xbdm,
        (
        SELECT
        CASE b.BRXB
        WHEN '2' THEN
        '女'
        WHEN '1' THEN
        '男'
        ELSE
        '其它'
        END
        ) AS xbmc,
        ISNULL(
        CONVERT (
        VARCHAR,
        (
        YEAR (GETDATE()) - YEAR (CONVERT(datetime, b.CSRQ))
        )
        ),

        '0'
        ) AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        q.SYXH AS syxh,
        q.TJZT AS tjzt,
        q.YXJL AS yxjl,
        GETDATE() AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK_TEMP q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_JZJLK] o(nolock) ON q.SYXH = o.EMRXH
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
				--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end

end

GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZLCZJL_SXJL_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chenfeng
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出输血记录 ---USP_HLHT_ZLCZJL_SXJL_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZLCZJL_SXJL_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZLCZJL_SXJL_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
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
				ISNULL(q.QTBLJLXH, 'NA') AS yjlxh,
        c.SYXH AS jzlsh,
        c.PATID AS patid,
        ISNULL(b.ZYHM, 'NA') AS zyh,
        ISNULL(
        CONVERT (VARCHAR,(o.GHXH)),
        'NA'
        ) AS mjzh,
        ISNULL(
        CONVERT (VARCHAR,(o.GHLB)),
        'NA'
        ) AS jzlb,
        ISNULL(q.QTBLJLXH, 'NA') AS tysbh,
        ISNULL(c.BQDM, 'NA') AS bqdm,
        ISNULL(c.BQMC, 'NA') AS bqmc,
        ISNULL(c.KSDM, 'NA') AS ksdm,
        ISNULL(c.KSMC, 'NA') AS ksmc,
        ISNULL(m.fjh, 'NA') AS bfh,
        ISNULL(b.RYCW, 'NA') AS bch,
        ISNULL(b.HZXM, 'NA') AS hzxm,
        ISNULL(b.SFZH, 'NA') AS sfzhm,
        ISNULL(b.BRXB, 'NA') AS xbdm,
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
        ) AS xbmc,
        ISNULL(
        CONVERT(
        VARCHAR,
        (
        YEAR(GETDATE()) - YEAR(CONVERT(datetime, b.CSRQ))
        )
        ),

        '0'
        ) AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        ISNULL(
        CONVERT (
        VARCHAR,
        (
        SELECT
        j.SQXH
        FROM
        [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_RIS_BRJCSQD] j(nolock)
        WHERE
        j.BRBS = q.SYXH
        AND j.SQDMBID IN (
        SELECT
        k.sqdmbid
        FROM
        [HLHT_ZY_HIS].[THIS4].[dbo].[CL_Template] k(nolock)
        WHERE
        k.isBloodBanks = 1
        )
        )
        ),
        '无'
        ) AS dzsqdbh,
        q.SYXH AS syxh,
        q.TJZT AS tjzt,
        q.YXJL AS yxjl,
        GETDATE() AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_JZJLK] o(nolock) ON q.SYXH = o.EMRXH
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
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
		WHERE A.SOURCE_TYPE=@sourceType;

		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (SYXH);
		 --查询表数据
				SELECT
								ISNULL(q.QTBLJLXH, 'NA') AS yjlxh,
        c.SYXH AS jzlsh,
        c.PATID AS patid,
        ISNULL(b.ZYHM, 'NA') AS zyh,
        ISNULL(
        CONVERT (VARCHAR,(o.GHXH)),
        'NA'
        ) AS mjzh,
        ISNULL(
        CONVERT (VARCHAR,(o.GHLB)),
        'NA'
        ) AS jzlb,
        ISNULL(q.QTBLJLXH, 'NA') AS tysbh,
        ISNULL(c.BQDM, 'NA') AS bqdm,
        ISNULL(c.BQMC, 'NA') AS bqmc,
        ISNULL(c.KSDM, 'NA') AS ksdm,
        ISNULL(c.KSMC, 'NA') AS ksmc,
        ISNULL(m.fjh, 'NA') AS bfh,
        ISNULL(b.RYCW, 'NA') AS bch,
        ISNULL(b.HZXM, 'NA') AS hzxm,
        ISNULL(b.SFZH, 'NA') AS sfzhm,
        ISNULL(b.BRXB, 'NA') AS xbdm,
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
        ) AS xbmc,
        ISNULL(
        CONVERT(
        VARCHAR,
        (
        YEAR(GETDATE()) - YEAR(CONVERT(datetime, b.CSRQ))
        )
        ),

        '0'
        ) AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        ISNULL(
        CONVERT (
        VARCHAR,
        (
        SELECT
        j.SQXH
        FROM
        [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_RIS_BRJCSQD] j(nolock)
        WHERE
        j.BRBS = q.SYXH
        AND j.SQDMBID IN (
        SELECT
        k.sqdmbid
        FROM
        [HLHT_ZY_HIS].[THIS4].[dbo].[CL_Template] k(nolock)
        WHERE
        k.isBloodBanks = 1
        )
        )
        ),
        '无'
        ) AS dzsqdbh,
        q.SYXH AS syxh,
        q.TJZT AS tjzt,
        q.YXJL AS yxjl,
        GETDATE() AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK_TEMP q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_JZJLK] o(nolock) ON q.SYXH = o.EMRXH
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
				--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end

end

GO
GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZLCZJL_YBSSJL_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chenkuai
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出一般手术记录 ---USP_HLHT_ZLCZJL_YBSSJL_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZLCZJL_YBSSJL_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZLCZJL_YBSSJL_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
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
SELECT t.QTBLJLXH AS yjlxh,
        b.HISSYXH AS jzlsh,
        c.PATID AS patid,
        b.HZXM AS hzxm,
        ISNULL(CONVERT (VARCHAR,(o.GHXH)),'NA') AS mjzh,
        b.ZYHM AS zyh,
        ISNULL(CONVERT (VARCHAR,(o.GHLB)),'2') AS jzlb,
        b.SFZH AS sfzhm,
        b.BRXB AS xbdm,
        c.SEX AS xbmc,
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'''') AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12       AS nly,        'NA' as dzsqsbh,
        c.KSDM AS ksdm,
        c.KSMC AS ksmc ,
        c.BQDM AS bqdm,
        c.BQMC AS bqmc ,
        ISNULL(a.fjh, 'NA') AS bfh,
        c.CWDM AS bch ,
        GETDATE() AS gxsj,
        t.YXJL AS yxjl,
        t.SYXH AS syxh,
        t.TJZT as tjzt,
        t.BLMC as blmc,
        t.FSSJ as fssj,
        t.BLNR as blnr

        FROM #EMR_QTBLJLK t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm=b.RYBQ
        LEFT JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_JZJLK] o(nolock) ON t.SYXH = o.EMRXH


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
SELECT t.QTBLJLXH AS yjlxh,
        b.HISSYXH AS jzlsh,
        c.PATID AS patid,
        b.HZXM AS hzxm,
        ISNULL(CONVERT (VARCHAR,(o.GHXH)),'NA') AS mjzh,
        b.ZYHM AS zyh,
        ISNULL(CONVERT (VARCHAR,(o.GHLB)),'2') AS jzlb,
        b.SFZH AS sfzhm,
        b.BRXB AS xbdm,
        c.SEX AS xbmc,
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'''') AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12       AS nly,        'NA' as dzsqsbh,
        c.KSDM AS ksdm,
        c.KSMC AS ksmc ,
        c.BQDM AS bqdm,
        c.BQMC AS bqmc ,
        ISNULL(a.fjh, 'NA') AS bfh,
        c.CWDM AS bch ,
        GETDATE() AS gxsj,
        t.YXJL AS yxjl,
        t.SYXH AS syxh,
        t.TJZT as tjzt,
        t.BLMC as blmc,
        t.FSSJ as fssj,
        t.BLNR as blnr

        FROM #EMR_QTBLJLK_TEMP t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm=b.RYBQ
        LEFT JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_JZJLK] o(nolock) ON t.SYXH = o.EMRXH


	--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
    end

	END

GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZLCZJL_ZLJL_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chenfeng
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出诊疗记录 ---USP_HLHT_ZLCZJL_ZLJL_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZLCZJL_ZLJL_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZLCZJL_ZLJL_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
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
				ISNULL(q.QTBLJLXH, 'NA')                   AS yjlxh,
        c.SYXH                                    AS jzlsh,
        c.PATID                                   AS patid,
        ISNULL(b.ZYHM, 'NA')                       AS zyh,
        ISNULL(
        CONVERT (VARCHAR,(c.MZH)),
        'NA'
        ) AS mjzh,
        ISNULL(
        CONVERT (VARCHAR,(o.GHLB)),
        '2'
        ) AS jzlb,
        ISNULL(c.BQDM, 'NA')                       AS bqdm,
        ISNULL(c.BQMC, 'NA')                       AS bqmc,
        ISNULL(c.KSDM, 'NA')                       AS ksdm,
        ISNULL(c.KSMC, 'NA')                       AS ksmc,
        ISNULL(m.fjh, 'NA')                        AS bfh,
        ISNULL(b.RYCW, 'NA')                       AS bch,
        ISNULL(b.HZXM, 'NA')                       AS hzxm,
        ISNULL(b.SFZH, 'NA')                       AS sfzhm,
        ISNULL(b.BRXB, 'NA')                       AS xbdm,
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
        )                                         AS xbmc,
        ISNULL(
        CONVERT(
        VARCHAR,
        (
        YEAR(GETDATE()) - YEAR(CONVERT(datetime, b.CSRQ))
        )
        ),

        '0'
        )                                         AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        '0'                                      AS tz,
        'NA'                                     AS dzsqdbh,
        q.FSSJ                                    AS qmrq,
        q.SYXH                                AS syxh,
        q.TJZT                                    AS tjzt,
        q.YXJL                                    AS yxjl,
        GETDATE()                                 AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_JZJLK] o(nolock) ON q.SYXH = o.EMRXH
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
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
		WHERE A.SOURCE_TYPE=@sourceType;

		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (SYXH);
		 --查询表数据
				SELECT
				ISNULL(q.QTBLJLXH, 'NA')                   AS yjlxh,
        c.SYXH                                    AS jzlsh,
        c.PATID                                   AS patid,
        ISNULL(b.ZYHM, 'NA')                       AS zyh,
        ISNULL(
        CONVERT (VARCHAR,(c.MZH)),
        'NA'
        ) AS mjzh,
        ISNULL(
        CONVERT (VARCHAR,(o.GHLB)),
        '2'
        ) AS jzlb,
        ISNULL(c.BQDM, 'NA')                       AS bqdm,
        ISNULL(c.BQMC, 'NA')                       AS bqmc,
        ISNULL(c.KSDM, 'NA')                       AS ksdm,
        ISNULL(c.KSMC, 'NA')                       AS ksmc,
        ISNULL(m.fjh, 'NA')                        AS bfh,
        ISNULL(b.RYCW, 'NA')                       AS bch,
        ISNULL(b.HZXM, 'NA')                       AS hzxm,
        ISNULL(b.SFZH, 'NA')                       AS sfzhm,
        ISNULL(b.BRXB, 'NA')                       AS xbdm,
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
        )                                         AS xbmc,
        ISNULL(
        CONVERT(
        VARCHAR,
        (
        YEAR(GETDATE()) - YEAR(CONVERT(datetime, b.CSRQ))
        )
        ),

        '0'
        )                                         AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        '0'                                      AS tz,
        'NA'                                     AS dzsqdbh,
        q.FSSJ                                    AS qmrq,
        q.SYXH                                AS syxh,
        q.TJZT                                    AS tjzt,
        q.YXJL                                    AS yxjl,
        GETDATE()                                 AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK_TEMP q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_JZJLK] o(nolock) ON q.SYXH = o.EMRXH
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
				--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end

end

GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZQGZXX_BWZTZS_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chenfeng
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出病危重通知书记录 ---USP_HLHT_ZQGZXX_BWZTZS_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZQGZXX_BWZTZS_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZQGZXX_BWZTZS_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
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
				ISNULL(q.QTBLJLXH, 'NA')                   AS yjlxh,
        c.SYXH                                    AS jzlsh,
        c.PATID                                   AS patid,
        ISNULL(
        CONVERT(VARCHAR, (c.MZH)),
        'NA'
        )                                         AS mjzh,
        ISNULL(b.ZYHM, 'NA')                       AS zyh,
        ISNULL(
        CONVERT(VARCHAR, (o.GHLB)),
        '2'
        )                                         AS jzlb,
        ISNULL(q.QTBLJLXH, 'NA')                   AS tysbh,
        ISNULL(c.KSDM, 'NA')                       AS ksdm,
        ISNULL(c.KSMC, 'NA')                       AS ksmc,
        ISNULL(c.BQDM, 'NA')                       AS bqdm,
        ISNULL(c.BQMC, 'NA')                       AS bqmc,
        ISNULL(m.fjh, 'NA')                        AS bfh,
        ISNULL(b.RYCW, 'NA')                       AS bch,
        ISNULL(b.HZXM, 'NA')                       AS hzxm,
        ISNULL(b.SFZH, 'NA')                       AS sfzhm,
        ISNULL(b.BRXB, 'NA')                       AS xbdm,
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
        )                                         AS xbmc,
        ISNULL(
        CONVERT(
        VARCHAR,
        (
        YEAR(GETDATE()) - YEAR(CONVERT(datetime, b.CSRQ))
        )
        ),
        '0'
        )                                         AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        q.SYXH                                AS syxh,
        q.TJZT                                    AS tjzt,
        q.YXJL                                    AS yxjl,
        GETDATE()                                 AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_JZJLK] o(nolock) ON q.SYXH = o.EMRXH
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
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
		WHERE A.SOURCE_TYPE=@sourceType;

		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (SYXH);
		 --查询表数据
				SELECT
				ISNULL(q.QTBLJLXH, 'NA')                   AS yjlxh,
        c.SYXH                                    AS jzlsh,
        c.PATID                                   AS patid,
        ISNULL(
        CONVERT(VARCHAR, (c.MZH)),
        'NA'
        )                                         AS mjzh,
        ISNULL(b.ZYHM, 'NA')                       AS zyh,
        ISNULL(
        CONVERT(VARCHAR, (o.GHLB)),
        '2'
        )                                         AS jzlb,
        ISNULL(q.QTBLJLXH, 'NA')                   AS tysbh,
        ISNULL(c.KSDM, 'NA')                       AS ksdm,
        ISNULL(c.KSMC, 'NA')                       AS ksmc,
        ISNULL(c.BQDM, 'NA')                       AS bqdm,
        ISNULL(c.BQMC, 'NA')                       AS bqmc,
        ISNULL(m.fjh, 'NA')                        AS bfh,
        ISNULL(b.RYCW, 'NA')                       AS bch,
        ISNULL(b.HZXM, 'NA')                       AS hzxm,
        ISNULL(b.SFZH, 'NA')                       AS sfzhm,
        ISNULL(b.BRXB, 'NA')                       AS xbdm,
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
        )                                         AS xbmc,
        ISNULL(
        CONVERT(
        VARCHAR,
        (
        YEAR(GETDATE()) - YEAR(CONVERT(datetime, b.CSRQ))
        )
        ),
        '0'
        )                                         AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        q.SYXH                                AS syxh,
        q.TJZT                                    AS tjzt,
        q.YXJL                                    AS yxjl,
        GETDATE()                                 AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK_TEMP q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_JZJLK] o(nolock) ON q.SYXH = o.EMRXH
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
				--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end

end

GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZQGZXX_MZZQTYS_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chenfeng
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出麻醉知情同意书记录 ---USP_HLHT_ZQGZXX_MZZQTYS_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZQGZXX_MZZQTYS_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZQGZXX_MZZQTYS_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
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
				ISNULL(q.QTBLJLXH, 'NA')                   AS yjlxh,
        c.SYXH                                    AS jzlsh,
        c.PATID                                   AS patid,
        ISNULL(b.ZYHM, 'NA')                       AS zyh,
        ISNULL(
        CONVERT (VARCHAR,(o.GHXH)),
        'NA'
        ) AS mjzh,
        ISNULL(
        CONVERT (VARCHAR,(o.GHLB)),
        'NA'
        ) AS jzlb,
        ISNULL(q.QTBLJLXH, 'NA') AS tysbh,
        ISNULL(c.BQDM, 'NA')                       AS bqdm,
        ISNULL(c.BQMC, 'NA')                       AS bqmc,
        ISNULL(c.KSDM, 'NA')                       AS ksdm,
        ISNULL(c.KSMC, 'NA')                       AS ksmc,
        ISNULL(m.fjh, 'NA')                        AS bfh,
        ISNULL(b.RYCW, 'NA')                       AS bch,
        ISNULL(b.HZXM, 'NA')                       AS hzxm,
        ISNULL(b.SFZH, 'NA')                       AS sfzhm,
        ISNULL(b.BRXB, 'NA')                       AS xbdm,
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
        )                                         AS xbmc,
        ISNULL(
        CONVERT(
        VARCHAR,
        (
        YEAR(GETDATE()) - YEAR(CONVERT(datetime, b.CSRQ))
        )
        ),

        '0'
        )                                         AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        q.SYXH                                AS syxh,
        q.TJZT                                    AS tjzt,
        q.YXJL                                    AS yxjl,
        GETDATE()                                 AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_JZJLK] o(nolock) ON q.SYXH = o.EMRXH
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
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
		WHERE A.SOURCE_TYPE=@sourceType;

		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (SYXH);
		 --查询表数据
				SELECT
				ISNULL(q.QTBLJLXH, 'NA')                   AS yjlxh,
        c.SYXH                                    AS jzlsh,
        c.PATID                                   AS patid,
        ISNULL(b.ZYHM, 'NA')                       AS zyh,
        ISNULL(
        CONVERT (VARCHAR,(o.GHXH)),
        'NA'
        ) AS mjzh,
        ISNULL(
        CONVERT (VARCHAR,(o.GHLB)),
        'NA'
        ) AS jzlb,
        ISNULL(q.QTBLJLXH, 'NA') AS tysbh,
        ISNULL(c.BQDM, 'NA')                       AS bqdm,
        ISNULL(c.BQMC, 'NA')                       AS bqmc,
        ISNULL(c.KSDM, 'NA')                       AS ksdm,
        ISNULL(c.KSMC, 'NA')                       AS ksmc,
        ISNULL(m.fjh, 'NA')                        AS bfh,
        ISNULL(b.RYCW, 'NA')                       AS bch,
        ISNULL(b.HZXM, 'NA')                       AS hzxm,
        ISNULL(b.SFZH, 'NA')                       AS sfzhm,
        ISNULL(b.BRXB, 'NA')                       AS xbdm,
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
        )                                         AS xbmc,
        ISNULL(
        CONVERT(
        VARCHAR,
        (
        YEAR(GETDATE()) - YEAR(CONVERT(datetime, b.CSRQ))
        )
        ),

        '0'
        )                                         AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        q.SYXH                                AS syxh,
        q.TJZT                                    AS tjzt,
        q.YXJL                                    AS yxjl,
        GETDATE()                                 AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK_TEMP q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_JZJLK] o(nolock) ON q.SYXH = o.EMRXH
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
				--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end

end

GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZQGZXX_QTZQTYS_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chenkuai
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出首次病程 ---USP_HLHT_ZQGZXX_QTZQTYS_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZQGZXX_QTZQTYS_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZQGZXX_QTZQTYS_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
[注意事项]
 在CIS_HLHT中创建
*/

begin
--创建临时表
if @syxh  is null or @syxh = ''
	begin

    SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ INTO #EMR_QTBLJLK_LS FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		 AND T.YXJL=1
         --在临时表上增加索引
		CREATE INDEX QUERY_INDEX_LS ON #EMR_QTBLJLK_LS (BLDM);

		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ  INTO #EMR_QTBLJLK FROM #EMR_QTBLJLK_LS T(nolock)
		LEFT JOIN MBZ_DATA_LIST_SET A(nolock) on T.BLDM=A.MODEL_CODE
		WHERE A.SOURCE_TYPE=@sourceType
		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK (SYXH);


     --查询表数据
    SELECT t.QTBLJLXH AS yjlxh,
            b.HISSYXH AS jzlsh,
            c.PATID AS patid,
            ISNULL(CONVERT (VARCHAR,(o.GHXH)),'NA') AS mjzh,
            b.ZYHM AS zyh,
            ISNULL(CONVERT (VARCHAR,(o.GHLB)),'2') AS jzlb,
            t.QTBLJLXH AS tysbh,
            t.BLMC AS tysmc,
            c.KSDM AS ksdm,
            c.KSMC AS ksmc ,
            c.BQDM AS bqdm,
            c.BQMC AS bqmc ,
            ISNULL(a.fjh, 'NA') AS bfh,
            ISNULL(a.fjh, 'NA')+'病房' AS bfmc,
            c.CWDM AS bch ,
            b.HZXM AS hzxm,
            (SELECT CASE b.SFZH WHEN NULL THEN 'NA' WHEN '' THEN 'NA' ELSE b.SFZH END) AS sfzhm,
            t.CJSJ AS jlrq,
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
            ) AS xbmc,
            ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'''') AS nls,
            DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12       AS nly,
            GETDATE() AS gxsj,
            t.YXJL AS yxjl,
            t.SYXH AS syxh,
            t.TJZT as tjzt,
            t.BLMC as blmc,
            t.FSSJ as fssj,
            t.BLNR as blnr

            FROM #EMR_QTBLJLK t
            LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
            LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
            LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm=b.RYBQ
            LEFT JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_JZJLK] o(nolock) ON t.SYXH = o.EMRXH

	--删除临时表
		DROP TABLE #EMR_QTBLJLK
		DROP TABLE #EMR_QTBLJLK_LS

	end
else
	begin



SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ INTO #EMR_QTBLJLK_TEMP_LS FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		 AND T.YXJL=1 AND T.SYXH=@syxh;
         --在临时表上增加索引
		CREATE INDEX QUERY_INDEX_LS ON #EMR_QTBLJLK_TEMP_LS (BLDM);

		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM INTO #EMR_QTBLJLK_TEMP FROM #EMR_QTBLJLK_TEMP_LS T(nolock)
		LEFT JOIN MBZ_DATA_LIST_SET A(nolock) on T.BLDM=A.MODEL_CODE
		WHERE A.SOURCE_TYPE=@sourceType
		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (SYXH);
		 --查询表数据
    SELECT t.QTBLJLXH AS yjlxh,
        b.HISSYXH AS jzlsh,
        c.PATID AS patid,
        ISNULL(CONVERT (VARCHAR,(o.GHXH)),'NA') AS mjzh,
        b.ZYHM AS zyh,
        ISNULL(CONVERT (VARCHAR,(o.GHLB)),'2') AS jzlb,
        t.QTBLJLXH AS tysbh,
        t.BLMC AS tysmc,
        c.KSDM AS ksdm,
        c.KSMC AS ksmc ,
        c.BQDM AS bqdm,
        c.BQMC AS bqmc ,
        ISNULL(a.fjh, 'NA') AS bfh,
        ISNULL(a.fjh, 'NA')+'病房' AS bfmc,
        c.CWDM AS bch ,
        b.HZXM AS hzxm,
        (SELECT CASE b.SFZH WHEN NULL THEN 'NA' WHEN '' THEN 'NA' ELSE b.SFZH END) AS sfzhm,
        t.CJSJ AS jlrq,
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
        ) AS xbmc,
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'''') AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12       AS nly,
        GETDATE() AS gxsj,
        t.YXJL AS yxjl,
        t.SYXH AS syxh,
        t.TJZT as tjzt

        FROM #EMR_QTBLJLK_TEMP t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm=b.RYBQ
        LEFT JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_JZJLK] o(nolock) ON t.SYXH = o.EMRXH
  	--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
    end

	END

	GO

	GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZQGZXX_SSTYS_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chensj
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出手术知情同意书表 ---USP_HLHT_ZQGZXX_SSTYS_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZQGZXX_SSTYS_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZQGZXX_SSTYS_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
[注意事项]
 在CIS_HLHT中创建
*/
begin
--判断@syxh是否存在
if @syxh  is null or @syxh = ''
  --不存在首页序号
	begin
    SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ  INTO #EMR_QTBLJLK_LS FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		 AND T.YXJL=1
         --在临时表上增加索引
		CREATE INDEX QUERY_INDEX_LS ON #EMR_QTBLJLK_LS (BLDM);

		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ  INTO #EMR_QTBLJLK FROM #EMR_QTBLJLK_LS T(nolock)
		LEFT JOIN MBZ_DATA_LIST_SET A(nolock) on T.BLDM=A.MODEL_CODE
		WHERE A.SOURCE_TYPE=@sourceType

		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK (SYXH);
		--查询业务数据
		SELECT
        t.QTBLJLXH as yjlxh,
        b.HISSYXH as jzlsh,
        c.PATID as patid,
        case when c.MZH = '' then 'NA' else ISNULL(c.MZH,'NA') end AS mjzh,
        b.ZYHM as zyh,
        '2' AS jzlb,
        t.QTBLJLXH as zqtysbh,
        ISNULL(t.FSSJ,CONVERT(DATE,'1990-01-01 00:00:00',120)) AS tjsj,
        c.KSDM as ksdm,
        c.KSMC as ksmc,
        c.BQDM as bqdm,
        c.BQMC as bqmc,
        ISNULL(a.fjh,'NA') as bfh,
        ISNULL(a.fjh,'NA') +'病房' as bfmc,
        ISNULL(b.RYCW,'NA') as bch,
        b.HZXM as hzxm,
        case when b.LXDH ='' then 'NA' else isnull(b.LXDH,'NA') end as lxdh,
        b.SFZH as sfzhm,
        b.BRXB as xbdm,
        (SELECT CASE b.BRXB WHEN '2' THEN '女' WHEN '1' THEN '男'ELSE '其它' END) AS xbmc,
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'NA') as nls,
        datediff(month,c.BIRTH,substring(convert(char(8),getdate(),112),1,8)) %12 as nly,
        t.SYXH as syxh,
        t.TJZT as tjzt,
        GETDATE() as gxsj,
        t.YXJL as yxjl,
        t.BLMC as blmc,
				t.FSSJ as fssj,
				t.BLNR as blnr
        FROM #EMR_QTBLJLK t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_MZDMK] d(nolock) on b.MZDM = d.ID
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm = b.RYBQ
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_JZJLK] e(nolock) on t.SYXH = e.EMRXH
		--删除临时表
		DROP TABLE #EMR_QTBLJLK
		DROP TABLE #EMR_QTBLJLK_LS
	 end
else
  --存在@syxh
	begin

       SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ  INTO #EMR_QTBLJLK_TEMP_LS FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		 AND T.YXJL=1 AND T.SYXH=@syxh;
         --在临时表上增加索引
		CREATE INDEX QUERY_INDEX_LS ON #EMR_QTBLJLK_TEMP_LS (BLDM);

		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ  INTO #EMR_QTBLJLK_TEMP FROM #EMR_QTBLJLK_TEMP_LS T(nolock)
		LEFT JOIN MBZ_DATA_LIST_SET A(nolock) on T.BLDM=A.MODEL_CODE
		WHERE A.SOURCE_TYPE=@sourceType
		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (SYXH);
		--查询业务数据
		SELECT
        t.QTBLJLXH as yjlxh,
        b.HISSYXH as jzlsh,
        c.PATID as patid,
        case when c.MZH = '' then 'NA' else ISNULL(c.MZH,'NA') end AS mjzh,
        b.ZYHM as zyh,
        '2' AS jzlb,
        t.QTBLJLXH as zqtysbh,
        ISNULL(t.FSSJ,CONVERT(DATE,'1990-01-01 00:00:00',120)) AS tjsj,
        c.KSDM as ksdm,
        c.KSMC as ksmc,
        c.BQDM as bqdm,
        c.BQMC as bqmc,
        ISNULL(a.fjh,'NA') as bfh,
        ISNULL(a.fjh,'NA') +'病房' as bfmc,
        ISNULL(b.RYCW,'NA') as bch,
        b.HZXM as hzxm,
        case when b.LXDH ='' then 'NA' else isnull(b.LXDH,'NA') end as lxdh,
        b.SFZH as sfzhm,
        b.BRXB as xbdm,
        (SELECT CASE b.BRXB WHEN '2' THEN '女' WHEN '1' THEN '男'ELSE '其它' END) AS xbmc,
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'NA') as nls,
        datediff(month,c.BIRTH,substring(convert(char(8),getdate(),112),1,8)) %12 as nly,
        t.SYXH as syxh,
        t.TJZT as tjzt,
        GETDATE() as gxsj,
        t.YXJL as yxjl,
        t.BLMC as blmc,
				t.FSSJ as fssj,
				t.BLNR as blnr
        FROM #EMR_QTBLJLK_TEMP t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_MZDMK] d(nolock) on b.MZDM = d.ID
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm = b.RYBQ
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_JZJLK] e(nolock) on t.SYXH = e.EMRXH
		--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end
end

GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZQGZXX_SXZLTYS_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chenfeng
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出输血治疗同意书记录 ---USP_HLHT_ZQGZXX_SXZLTYS_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZQGZXX_SXZLTYS_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZQGZXX_SXZLTYS_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
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
				ISNULL(q.QTBLJLXH, 'NA') AS yjlxh,
        c.SYXH AS jzlsh,
        c.PATID AS patid,
        ISNULL(b.ZYHM, 'NA') AS zyh,
        ISNULL(
        CONVERT (VARCHAR,(c.MZH)),
        'NA'
        ) AS mjzh,
        ISNULL(
        CONVERT (VARCHAR,(o.GHLB)),
        '2'
        ) AS jzlb,
        ISNULL(q.QTBLJLXH, 'NA') AS tysbh,
        ISNULL(c.BQDM, 'NA') AS bqdm,
        ISNULL(c.BQMC, 'NA') AS bqmc,
        ISNULL(c.KSDM, 'NA') AS ksdm,
        ISNULL(c.KSMC, 'NA') AS ksmc,
        ISNULL(m.fjh, 'NA') AS bfh,
        ISNULL(b.RYCW, 'NA') AS bch,
        ISNULL(b.HZXM, 'NA') AS hzxm,
        ISNULL(b.SFZH, 'NA') AS sfzhm,
        ISNULL(b.BRXB, 'NA') AS xbdm,
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
        ) AS xbmc,
        ISNULL(
        CONVERT(
        VARCHAR,
        (
        YEAR(GETDATE()) - YEAR(CONVERT(datetime, b.CSRQ))
        )
        ),

        '0'
        ) AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        q.BLDM AS model_code,
        q.SYXH AS syxh,
        q.TJZT AS tjzt,
        q.YXJL AS yxjl,
        GETDATE() AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_JZJLK] o(nolock) ON q.SYXH = o.EMRXH
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
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
		WHERE A.SOURCE_TYPE=@sourceType;

		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (SYXH);
		 --查询表数据
				SELECT
				ISNULL(q.QTBLJLXH, 'NA') AS yjlxh,
        c.SYXH AS jzlsh,
        c.PATID AS patid,
        ISNULL(b.ZYHM, 'NA') AS zyh,
        ISNULL(
        CONVERT (VARCHAR,(c.MZH)),
        'NA'
        ) AS mjzh,
        ISNULL(
        CONVERT (VARCHAR,(o.GHLB)),
        '2'
        ) AS jzlb,
        ISNULL(q.QTBLJLXH, 'NA') AS tysbh,
        ISNULL(c.BQDM, 'NA') AS bqdm,
        ISNULL(c.BQMC, 'NA') AS bqmc,
        ISNULL(c.KSDM, 'NA') AS ksdm,
        ISNULL(c.KSMC, 'NA') AS ksmc,
        ISNULL(m.fjh, 'NA') AS bfh,
        ISNULL(b.RYCW, 'NA') AS bch,
        ISNULL(b.HZXM, 'NA') AS hzxm,
        ISNULL(b.SFZH, 'NA') AS sfzhm,
        ISNULL(b.BRXB, 'NA') AS xbdm,
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
        ) AS xbmc,
        ISNULL(
        CONVERT(
        VARCHAR,
        (
        YEAR(GETDATE()) - YEAR(CONVERT(datetime, b.CSRQ))
        )
        ),

        '0'
        ) AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        q.BLDM AS model_code,
        q.SYXH AS syxh,
        q.TJZT AS tjzt,
        q.YXJL AS yxjl,
        GETDATE() AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK_TEMP q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_JZJLK] o(nolock) ON q.SYXH = o.EMRXH
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
				--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end

end

GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZQGZXX_TSJCZLTYS_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chensj
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出互联互通知情告知信息/特殊检查及特殊治疗同意书---USP_HLHT_ZQGZXX_TSJCZLTYS_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZQGZXX_TSJCZLTYS_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZQGZXX_TSJCZLTYS_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
[注意事项]
 在CIS_HLHT中创建
*/
begin
--判断@syxh是否存在
if @syxh  is null or @syxh = ''
  --不存在首页序号
	begin
   --创建临时表
   	SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ,TJSJ INTO #EMR_QTBLJLK_LS FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE EXISTS (SELECT 1 FROM MBZ_DATA_LIST_SET A(nolock) WHERE A.SOURCE_TYPE=@sourceType and A.MODEL_CODE = T.BLDM)
		 AND T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		  AND T.YXJL = 1
		 --在临时表上增加索引
		 CREATE INDEX QUERY_INDEX_BLDM ON #EMR_QTBLJLK_LS (BLDM);
		 --创建临时表
		 SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ,TJSJ INTO #EMR_QTBLJLK FROM #EMR_QTBLJLK_LS T(nolock)
		  WHERE EXISTS (SELECT 1 FROM MBZ_DATA_LIST_SET A(nolock) WHERE A.SOURCE_TYPE=@sourceType and A.MODEL_CODE = T.BLDM)
		--在临时表上增加索引
		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK (BLDM, YXJL, TJSJ);
		--查询业务数据
      SELECT
        t.QTBLJLXH as yjlxh,
        b.HISSYXH as jzlsh,
        c.PATID as patid,
        case when c.MZH = '' then 'NA' else ISNULL(c.MZH,'NA') end  AS mjzh,
        b.ZYHM as zyh,
        '2' AS jzlb,
        t.QTBLJLXH as tysbh,
        c.KSDM as ksdm,
        c.KSMC as ksmc,
        c.BQDM as bqdm,
        c.BQMC as bqmc,
        ISNULL(a.fjh,'NA') as bfh,
        ISNULL(b.RYCW,'NA') as bch,
        b.HZXM as hzxm,
        (SELECT CASE b.SFZH WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE b.SFZH END) as sfzhm,
        b.BRXB as xbdm,
        (SELECT CASE b.BRXB WHEN '2' THEN '女' WHEN '1' THEN '男'ELSE '其它' END) AS xbmc,
        ISNULL(convert(varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'NA') as nls,
        datediff(month,c.BIRTH,substring(convert(char(8),getdate(),112),1,8)) %12 as nly,
        GETDATE() as gxsj,
        t.SYXH as syxh,
        t.BLMC as blmc,
				t.FSSJ as fssj,
				t.BLNR as blnr
        FROM #EMR_QTBLJLK t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_MZDMK] d(nolock) on b.MZDM = d.ID
        LEFT JOIN [HLHT_ZY_CIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm = b.RYBQ
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_JZJLK] e(nolock) on t.SYXH = e.EMRXH
		--删除临时表
		DROP TABLE #EMR_QTBLJLK
		DROP TABLE #EMR_QTBLJLK_LS
	 end
else
  --存在@syxh
	begin
	 --创建临时表
		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ,TJSJ INTO #EMR_QTBLJLK_TEMP_LS FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE T.TJSJ BETWEEN CONVERT (DATE, @startDate) AND CONVERT (DATE, @endDate)
		  AND T.YXJL = 1 AND T.SYXH=@syxh
		 --在临时表上增加索引
		CREATE INDEX QUERY_INDEX_LS ON #EMR_QTBLJLK_TEMP_LS (BLDM);
		 --创建临时表
		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ,TJSJ INTO #EMR_QTBLJLK_TEMP FROM #EMR_QTBLJLK_TEMP_LS T(nolock)
		WHERE EXISTS (SELECT 1 FROM dbo.MBZ_DATA_LIST_SET A(nolock) WHERE A.SOURCE_TYPE=@sourceType and A.MODEL_CODE = T.BLDM)
		 --在临时表上增加索引
		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (BLDM, YXJL, TJSJ);
		--查询业务数据
    SELECT
        t.QTBLJLXH as yjlxh,
        b.HISSYXH as jzlsh,
        c.PATID as patid,
        case when c.MZH = '' then 'NA' else ISNULL(c.MZH,'NA') end  AS mjzh,
        b.ZYHM as zyh,
        '2' AS jzlb,
        t.QTBLJLXH as tysbh,
        c.KSDM as ksdm,
        c.KSMC as ksmc,
        c.BQDM as bqdm,
        c.BQMC as bqmc,
        ISNULL(a.fjh,'NA') as bfh,
        ISNULL(b.RYCW,'NA') as bch,
        b.HZXM as hzxm,
        (SELECT CASE b.SFZH WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE b.SFZH END) as sfzhm,
        b.BRXB as xbdm,
        (SELECT CASE b.BRXB WHEN '2' THEN '女' WHEN '1' THEN '男'ELSE '其它' END) AS xbmc,
        ISNULL(convert(varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'NA') as nls,
        datediff(month,c.BIRTH,substring(convert(char(8),getdate(),112),1,8)) %12 as nly,
        GETDATE() as gxsj,
        t.SYXH as syxh,
        t.BLMC as blmc,
				t.FSSJ as fssj,
				t.BLNR as blnr
        FROM #EMR_QTBLJLK_TEMP t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_MZDMK] d(nolock) on b.MZDM = d.ID
        LEFT JOIN [HLHT_ZY_CIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm = b.RYBQ
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_JZJLK] e(nolock) on t.SYXH = e.EMRXH
		--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end
end

GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZYBCJL_CYJL_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chenfeng
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出出院记录 ---USP_HLHT_ZYBCJL_CYJL_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZYBCJL_CYJL_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZYBCJL_CYJL_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
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
				ISNULL(q.QTBLJLXH, 'NA')                   AS yjlxh,
        c.SYXH                                    AS jzlsh,
        c.PATID                                   AS patid,
        ISNULL(b.ZYHM, 'NA')                       AS zyh,
        ISNULL(c.KSDM, 'NA')                       AS ksdm,
        ISNULL(c.KSMC, 'NA')                       AS ksmc,
        ISNULL(c.BQDM, 'NA')                       AS bqdm,
        ISNULL(c.BQMC, 'NA')                       AS bqmc,
        ISNULL(m.fjh, 'NA')                        AS bfh,
        ISNULL(m.fjh, 'NA') + '病房'               AS bfmc,
        ISNULL(b.RYCW, 'NA')                       AS bch,
        ISNULL(b.HZXM, 'NA')                       AS hzxm,
        ISNULL(b.SFZH, 'NA')                       AS sfzhm,
        ISNULL(b.BRXB, 'NA')                       AS xbdm,
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
        )                                         AS xbmc,
        ISNULL(
        CONVERT(
        VARCHAR,
        (
        YEAR(GETDATE()) - YEAR(CONVERT(datetime, b.CSRQ))
        )
        ),
        '0'
        )                                         AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        b.RYRQ                                    AS ryrq,
        q.SYXH                                AS syxh,
        q.TJZT                                    AS tjzt,
        q.YXJL                                    AS yxjl,
        GETDATE()                                 AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
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
		WHERE A.SOURCE_TYPE=@sourceType;

		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (SYXH);
		 --查询表数据
				SELECT
				ISNULL(q.QTBLJLXH, 'NA')                   AS yjlxh,
        c.SYXH                                    AS jzlsh,
        c.PATID                                   AS patid,
        ISNULL(b.ZYHM, 'NA')                       AS zyh,
        ISNULL(c.KSDM, 'NA')                       AS ksdm,
        ISNULL(c.KSMC, 'NA')                       AS ksmc,
        ISNULL(c.BQDM, 'NA')                       AS bqdm,
        ISNULL(c.BQMC, 'NA')                       AS bqmc,
        ISNULL(m.fjh, 'NA')                        AS bfh,
        ISNULL(m.fjh, 'NA') + '病房'               AS bfmc,
        ISNULL(b.RYCW, 'NA')                       AS bch,
        ISNULL(b.HZXM, 'NA')                       AS hzxm,
        ISNULL(b.SFZH, 'NA')                       AS sfzhm,
        ISNULL(b.BRXB, 'NA')                       AS xbdm,
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
        )                                         AS xbmc,
        ISNULL(
        CONVERT(
        VARCHAR,
        (
        YEAR(GETDATE()) - YEAR(CONVERT(datetime, b.CSRQ))
        )
        ),
        '0'
        )                                         AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        b.RYRQ                                    AS ryrq,
        q.SYXH                                AS syxh,
        q.TJZT                                    AS tjzt,
        q.YXJL                                    AS yxjl,
        GETDATE()                                 AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK_TEMP q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
				--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end

end

GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZYBCJL_HZJL_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chenkuai
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出会诊记录 ---USP_HLHT_ZYBCJL_HZJL_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZYBCJL_HZJL_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZYBCJL_HZJL_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
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
    SELECT t.QTBLJLXH AS yjlxh,
            b.HISSYXH AS jzlsh,
            c.PATID AS patid,
            b.ZYHM AS zyh,
            'NA' as dzsqsbh,
            c.KSDM AS ksdm,
            c.KSMC AS ksmc ,
            c.BQDM AS bqdm,
            c.BQMC AS bqmc ,
            ISNULL(a.fjh, 'NA') AS bfh,
            ISNULL(a.fjh, 'NA')+'病房' AS bfmc,
            c.CWDM AS bch ,
            b.HZXM AS hzxm,
            (SELECT CASE b.SFZH WHEN NULL THEN 'NA' WHEN '' THEN 'NA' ELSE b.SFZH END) AS sfzhm,
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
            ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'''') AS nls,
            DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12       AS nly,
            i.DICT_LABEL AS hzsqyljgmc,
            ii.DICT_LABEL AS hzsqyljgdm,
            i.DICT_LABEL AS hzysyljgmc,
            ii.DICT_LABEL AS hzyljgdm,
            i.DICT_LABEL AS hzszyljgmc,
            ii.DICT_LABEL AS hzszyljgdm,
            GETDATE() AS gxsj,
            t.YXJL AS yxjl,
            t.SYXH AS syxh,
            t.TJZT as tjzt,
            t.BLMC as blmc,
            t.FSSJ as fssj,
            t.BLNR as blnr
            FROM #EMR_QTBLJLK t
            LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c ON t.SYXH = c.EMRXH
            LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b ON b.SYXH = t.SYXH
            LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a ON a.id = b.RYCW and a.bqdm=b.RYBQ
            LEFT JOIN [CIS_HLHT].[dbo].[MBZ_DICT_INFO] i ON i.DICT_CODE = 'hospitalInfoName'
            LEFT JOIN [CIS_HLHT].[dbo].[MBZ_DICT_INFO] ii ON ii.DICT_CODE = 'hospitalInfoNo'

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
SELECT t.QTBLJLXH AS yjlxh,
            b.HISSYXH AS jzlsh,
            c.PATID AS patid,
            b.ZYHM AS zyh,
            'NA' as dzsqsbh,
            c.KSDM AS ksdm,
            c.KSMC AS ksmc ,
            c.BQDM AS bqdm,
            c.BQMC AS bqmc ,
            ISNULL(a.fjh, 'NA') AS bfh,
            ISNULL(a.fjh, 'NA')+'病房' AS bfmc,
            c.CWDM AS bch ,
            b.HZXM AS hzxm,
            (SELECT CASE b.SFZH WHEN NULL THEN 'NA' WHEN '' THEN 'NA' ELSE b.SFZH END) AS sfzhm,
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
            ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'''') AS nls,
            DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12       AS nly,
            i.DICT_LABEL AS hzsqyljgmc,
            ii.DICT_LABEL AS hzsqyljgdm,
            i.DICT_LABEL AS hzysyljgmc,
            ii.DICT_LABEL AS hzyljgdm,
            i.DICT_LABEL AS hzszyljgmc,
            ii.DICT_LABEL AS hzszyljgdm,
            GETDATE() AS gxsj,
            t.YXJL AS yxjl,
            t.SYXH AS syxh,
            t.TJZT as tjzt,
            t.BLMC as blmc,
            t.FSSJ as fssj,
            t.BLNR as blnr
            FROM #EMR_QTBLJLK_TEMP t
            LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c ON t.SYXH = c.EMRXH
            LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b ON b.SYXH = t.SYXH
            LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a ON a.id = b.RYCW and a.bqdm=b.RYBQ
            LEFT JOIN [CIS_HLHT].[dbo].[MBZ_DICT_INFO] i ON i.DICT_CODE = 'hospitalInfoName'
            LEFT JOIN [CIS_HLHT].[dbo].[MBZ_DICT_INFO] ii ON ii.DICT_CODE = 'hospitalInfoNo'
      --删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
    end

	END

	GO

	GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZYBCJL_JDXJ_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as

/*
[创建者] chenkuai
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出首次病程 ---USP_HLHT_ZYBCJL_JDXJ_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZYBCJL_JDXJ_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZYBCJL_JDXJ_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
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
	SELECT t.QTBLJLXH as yjlxh,b.HISSYXH as jzlsh,c.PATID as patid,
        b.ZYHM as zyh,c.KSDM as ksdm,c.KSMC as ksmc,c.BQDM as bqdm,
        c.BQMC as bqmc ,ISNULL(a.fjh, 'NA') AS bfh,
        ISNULL(a.fjh, 'NA')+'病房' AS bfmc,
        c.CWDM as bch ,b.HZXM as hzxm,
        b.SFZH as sfzhm,b.BRXB as xbdm,
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
        ) AS xbmc,
        b.CSRQ AS csrq,
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'''') as nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,b.RYRQ as ryrq,
        GETDATE() AS gxsj,
        t.FSSJ AS xjrq,
        t.FSSJ AS qmrq,
        t.YXJL AS yxjl,
        t.SYXH AS syxh,
        t.TJZT as tjzt,
        t.BLMC as blmc,
        t.FSSJ as fssj,
        t.BLNR as blnr
        FROM #EMR_QTBLJLK t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a ON a.id = b.RYCW and a.bqdm=b.RYBQ

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
SELECT t.QTBLJLXH as yjlxh,b.HISSYXH as jzlsh,c.PATID as patid,
        b.ZYHM as zyh,c.KSDM as ksdm,c.KSMC as ksmc,c.BQDM as bqdm,
        c.BQMC as bqmc ,ISNULL(a.fjh, 'NA') AS bfh,
        ISNULL(a.fjh, 'NA')+'病房' AS bfmc,
        c.CWDM as bch ,b.HZXM as hzxm,
        b.SFZH as sfzhm,b.BRXB as xbdm,
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
        ) AS xbmc,
        b.CSRQ AS csrq,
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'''') as nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,b.RYRQ as ryrq,
        GETDATE() AS gxsj,
        t.FSSJ AS xjrq,
        t.FSSJ AS qmrq,
        t.YXJL AS yxjl,
        t.SYXH AS syxh,
        t.TJZT as tjzt,
        t.BLMC as blmc,
        t.FSSJ as fssj,
        t.BLNR as blnr
        FROM #EMR_QTBLJLK_TEMP t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a ON a.id = b.RYCW and a.bqdm=b.RYBQ

      	--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS

    end

	END

	GO
	GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZYBCJL_JJBJL_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as

/*
[创建者] chenkuai
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
 在CIS_HLHT中创建
*/


begin
--创建临时表
if @syxh  is null or @syxh = ''
	begin

	    SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ INTO #EMR_QTBLJLK_LS FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		 AND T.YXJL=1
         --在临时表上增加索引
		CREATE INDEX QUERY_INDEX_LS ON #EMR_QTBLJLK_LS (BLDM);

		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ INTO #EMR_QTBLJLK FROM #EMR_QTBLJLK_LS T(nolock)
		LEFT JOIN MBZ_DATA_LIST_SET A(nolock) on T.BLDM=A.MODEL_CODE
		WHERE A.SOURCE_TYPE=@sourceType

		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK (SYXH);

     --查询表数据
		 SELECT t.QTBLJLXH AS yjlxh,
        b.HISSYXH AS jzlsh,
        c.PATID AS patid,
        b.HZXM AS hzxm,
        b.ZYHM AS zyh,
        (SELECT CASE b.SFZH WHEN NULL THEN 'NA' WHEN '' THEN 'NA' ELSE b.SFZH END) AS sfzhm,
        c.KSDM AS ksdm,
        c.KSMC AS ksmc ,
        c.BQDM AS bqdm,
        c.BQMC AS bqmc ,
        ISNULL(a.fjh, 'NA') AS bfh,
        ISNULL(a.fjh, 'NA')+'病房' AS bfmc,
        c.CWDM AS bch ,
        t.CJSJ AS jlrq,
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
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'0') AS nls,
        b.RYRQ as   ryrq,
        GETDATE() AS gxsj,
        t.YXJL AS yxjl,
        t.SYXH AS syxh,
        t.TJZT as tjzt,
        t.BLMC as blmc,
        t.FSSJ as fssj,
        t.BLNR as blnr

        FROM #EMR_QTBLJLK t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm=b.RYBQ
      		--删除临时表
		DROP TABLE #EMR_QTBLJLK
		DROP TABLE #EMR_QTBLJLK_LS
	end
else
	begin


       SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ INTO #EMR_QTBLJLK_TEMP_LS FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		 AND T.YXJL=1 AND T.SYXH=@syxh;
         --在临时表上增加索引
		CREATE INDEX QUERY_INDEX_LS ON #EMR_QTBLJLK_TEMP_LS (BLDM);

		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ INTO #EMR_QTBLJLK_TEMP FROM #EMR_QTBLJLK_TEMP_LS T(nolock)
		LEFT JOIN MBZ_DATA_LIST_SET A(nolock) on T.BLDM=A.MODEL_CODE
		WHERE A.SOURCE_TYPE=@sourceType
		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (SYXH);

		 --查询表数据
   		 SELECT t.QTBLJLXH AS yjlxh,
        b.HISSYXH AS jzlsh,
        c.PATID AS patid,
        b.HZXM AS hzxm,
        b.ZYHM AS zyh,
        (SELECT CASE b.SFZH WHEN NULL THEN 'NA' WHEN '' THEN 'NA' ELSE b.SFZH END) AS sfzhm,
        c.KSDM AS ksdm,
        c.KSMC AS ksmc ,
        c.BQDM AS bqdm,
        c.BQMC AS bqmc ,
        (SELECT CASE WHEN a.fjh = '' THEN 'NA' WHEN a.fjh IS NULL THEN 'NA' ELSE a.fjh END) AS bfh,
          (SELECT CASE WHEN a.fjh = '' THEN 'NA' WHEN a.fjh IS NULL THEN 'NA' ELSE a.fjh END)+'病房' AS bfmc,
        c.CWDM AS bch ,
        t.CJSJ AS jlrq,
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
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'0') AS nls,
        b.RYRQ as ryrq,
        GETDATE() AS gxsj,
        t.YXJL AS yxjl,
        t.SYXH AS syxh,
        t.TJZT as tjzt,
        t.BLMC as blmc,
        t.FSSJ as fssj,
        t.BLNR as blnr

        FROM #EMR_QTBLJLK_TEMP t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm=b.RYBQ

      --删除临时表
      DROP TABLE #EMR_QTBLJLK_TEMP
      DROP TABLE #EMR_QTBLJLK_TEMP_LS
    end

	END


GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZYBCJL_QJJL_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as

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
SELECT t.QTBLJLXH as yjlxh,
        b.HISSYXH as jzlsh,
        c.PATID as patid,
        b.ZYHM as zyh,
        c.KSDM as ksdm,
        c.KSMC as ksmc,
        c.BQDM as bqdm,
        c.BQMC as bqmc ,
        ISNULL(a.fjh, 'NA') AS bfh,
        ISNULL(a.fjh, 'NA')+'病房' AS bfmc,
        c.CWDM as bch,
        b.HZXM as hzxm,
         (SELECT CASE b.SFZH WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE b.SFZH END) as sfzhm
        ,b.BRXB as xbdm,
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
        ) AS xbmc,
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'''') as nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        GETDATE() AS gxsj,
        t.YXJL AS yxjl,
        t.SYXH AS syxh,
        t.TJZT as tjzt,
        t.BLMC as blmc,
        t.FSSJ as fssj,
        t.BLNR as blnr
        FROM #EMR_QTBLJLK t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm=b.RYBQ

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
  SELECT t.QTBLJLXH as yjlxh,
          b.HISSYXH as jzlsh,
          c.PATID as patid,
          b.ZYHM as zyh,
          c.KSDM as ksdm,
          c.KSMC as ksmc,
          c.BQDM as bqdm,
          c.BQMC as bqmc ,
          ISNULL(a.fjh, 'NA') AS bfh,
          ISNULL(a.fjh, 'NA')+'病房' AS bfmc,
          c.CWDM as bch,
          b.HZXM as hzxm,
          (SELECT CASE b.SFZH WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE b.SFZH END) as sfzhm
          ,b.BRXB as xbdm,
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
          ) AS xbmc,
          ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'''') as nls,
          DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
          GETDATE() AS gxsj,
          t.YXJL AS yxjl,
          t.SYXH AS syxh,
          t.TJZT as tjzt,
          t.BLMC as blmc,
          t.FSSJ as fssj,
          t.BLNR as blnr
          FROM #EMR_QTBLJLK_TEMP t
          LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
          LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
          LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm=b.RYBQ

    	--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
    end

	END

	GO

	GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZYBCJL_RCBCJL_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chenfeng
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出日常病程记录 ---USP_HLHT_ZYBCJL_RCBCJL_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZYBCJL_RCBCJL_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZYBCJL_RCBCJL_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
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
				ISNULL(q.QTBLJLXH, 'NA')                         AS yjlxh,
        c.SYXH                                          AS jzlsh,
        c.PATID                                         AS patid,
        ISNULL(b.ZYHM, 'NA')                             AS zyh,
        ISNULL(c.BQDM, 'NA')                             AS bqdm,
        ISNULL(c.BQMC, 'NA')                             AS bqmc,
        ISNULL(c.KSDM, 'NA')                             AS ksdm,
        ISNULL(c.KSMC, 'NA')                             AS ksmc,
        ISNULL(m.fjh, 'NA')                              AS bfh,
        ISNULL(m.fjh, 'NA') + '病房'                     AS bfmc,
        ISNULL(b.RYCW, 'NA')                             AS bch,
        CONVERT(datetime, getdate())                    AS jlrq,
        ISNULL(b.HZXM, 'NA')                             AS hzxm,
        ISNULL(b.SFZH, 'NA')                             AS sfzhm,
        ISNULL(b.BRXB, 'NA')                             AS xbdm,
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
        CONVERT(DATE, ISNULL(c.BIRTH, '19900101'), 108) AS csrq,
        ISNULL(
        CONVERT(
        VARCHAR,
        (
        YEAR(GETDATE()) - YEAR(CONVERT(datetime, b.CSRQ))
        )
        ),
        '0'
        )                                               AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12       AS nly,
        q.FSSJ                                          AS qmrq,
        q.SYXH                                      AS syxh,
        q.TJZT                                          AS tjzt,
        q.YXJL                                          AS yxjl,
        GETDATE()                           AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
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
		WHERE A.SOURCE_TYPE=@sourceType;

		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (SYXH);
		 --查询表数据
				SELECT
				ISNULL(q.QTBLJLXH, 'NA')                         AS yjlxh,
        c.SYXH                                          AS jzlsh,
        c.PATID                                         AS patid,
        ISNULL(b.ZYHM, 'NA')                             AS zyh,
        ISNULL(c.BQDM, 'NA')                             AS bqdm,
        ISNULL(c.BQMC, 'NA')                             AS bqmc,
        ISNULL(c.KSDM, 'NA')                             AS ksdm,
        ISNULL(c.KSMC, 'NA')                             AS ksmc,
        ISNULL(m.fjh, 'NA')                              AS bfh,
        ISNULL(m.fjh, 'NA') + '病房'                     AS bfmc,
        ISNULL(b.RYCW, 'NA')                             AS bch,
        CONVERT(datetime, getdate())                    AS jlrq,
        ISNULL(b.HZXM, 'NA')                             AS hzxm,
        ISNULL(b.SFZH, 'NA')                             AS sfzhm,
        ISNULL(b.BRXB, 'NA')                             AS xbdm,
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
        CONVERT(DATE, ISNULL(c.BIRTH, '19900101'), 108) AS csrq,
        ISNULL(
        CONVERT(
        VARCHAR,
        (
        YEAR(GETDATE()) - YEAR(CONVERT(datetime, b.CSRQ))
        )
        ),
        '0'
        )                                               AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12       AS nly,
        q.FSSJ                                          AS qmrq,
        q.SYXH                                      AS syxh,
        q.TJZT                                          AS tjzt,
        q.YXJL                                          AS yxjl,
        GETDATE()                           AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK_TEMP q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
				--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end

end

GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZYBCJL_SCBCJL_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chenkuai
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出首次病程 ---USP_HLHT_ZYBCJL_SCBCJL_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZYBCJL_SCBCJL_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZYBCJL_SCBCJL_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
[注意事项]
 在CIS_HLHT中创建
*/

begin
--创建临时表
if @syxh  is null or @syxh = ''
	begin

	    SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ INTO #EMR_QTBLJLK_LS FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		 AND T.YXJL=1
         --在临时表上增加索引
		CREATE INDEX QUERY_INDEX_LS ON #EMR_QTBLJLK_LS (BLDM);

		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ INTO #EMR_QTBLJLK FROM #EMR_QTBLJLK_LS T(nolock)
		LEFT JOIN MBZ_DATA_LIST_SET A(nolock) on T.BLDM=A.MODEL_CODE
		WHERE A.SOURCE_TYPE=@sourceType

		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK (SYXH);

     --查询表数据
		 SELECT t.QTBLJLXH AS yjlxh,
        b.HISSYXH AS jzlsh,
        c.PATID AS patid,
        b.HZXM AS hzxm,
        b.ZYHM AS zyh,
        (SELECT CASE b.SFZH WHEN NULL THEN 'NA' WHEN '' THEN 'NA' ELSE b.SFZH END) AS sfzhm,
        c.KSDM AS ksdm,
        c.KSMC AS ksmc ,
        c.BQDM AS bqdm,
        c.BQMC AS bqmc ,
        ISNULL(a.fjh, 'NA') AS bfh,
        ISNULL(a.fjh, 'NA')+'病房' AS bfmc,
        c.CWDM AS bch ,
        t.CJSJ AS jlrq,
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
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'0') AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12       AS nly,
        GETDATE() AS gxsj,
        t.YXJL AS yxjl,
        t.SYXH AS syxh,
        t.TJZT as tjzt,
        t.BLMC as blmc,
        t.FSSJ as fssj,
        t.BLNR as blnr

        FROM #EMR_QTBLJLK t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm=b.RYBQ
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
   SELECT t.QTBLJLXH AS yjlxh,
          b.HISSYXH AS jzlsh,
          c.PATID AS patid,
          b.HZXM AS hzxm,
          b.ZYHM AS zyh,
          (SELECT CASE b.SFZH WHEN NULL THEN 'NA' WHEN '' THEN 'NA' ELSE b.SFZH END) AS sfzhm,
          c.KSDM AS ksdm,
          c.KSMC AS ksmc ,
          c.BQDM AS bqdm,
          c.BQMC AS bqmc ,
          ISNULL(a.fjh, 'NA') AS bfh,
          ISNULL(a.fjh, 'NA')+'病房' AS bfmc,
          c.CWDM AS bch ,
          t.CJSJ AS jlrq,
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
          ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'0') AS nls,
          DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12       AS nly,
          GETDATE() AS gxsj,
          t.YXJL AS yxjl,
          t.SYXH AS syxh,
          t.TJZT as tjzt,
          t.BLMC as blmc,
          t.FSSJ as fssj,
          t.BLNR as blnr

				  FROM #EMR_QTBLJLK_TEMP t
          LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
          LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
          LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm=b.RYBQ
            --删除临时表
      DROP TABLE #EMR_QTBLJLK_TEMP
      DROP TABLE #EMR_QTBLJLK_TEMP_LS
    end

	END







GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZYBCJL_SHSCBCJL_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chensj
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出 获取住院病程/手术术后首次病程数据 ---USP_HLHT_ZYBCJL_SHSCBCJL_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZYBCJL_SHSCBCJL_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZYBCJL_SHSCBCJL_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
[注意事项]
 在CIS_HLHT中创建
*/
begin
--判断@syxh是否存在
if @syxh  is null or @syxh = ''
  --不存在首页序号
	begin
      SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ INTO #EMR_QTBLJLK_LS FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		 AND T.YXJL=1
         --在临时表上增加索引
		CREATE INDEX QUERY_INDEX_LS ON #EMR_QTBLJLK_LS (BLDM);

		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ INTO #EMR_QTBLJLK FROM #EMR_QTBLJLK_LS T(nolock)
		LEFT JOIN MBZ_DATA_LIST_SET A(nolock) on T.BLDM=A.MODEL_CODE
		WHERE A.SOURCE_TYPE=@sourceType

		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK (SYXH);
		--查询业务数据
    SELECT
        t.QTBLJLXH as yjlxh,
        b.HISSYXH as jzlsh,
        c.PATID as patid,
        b.ZYHM as zyh,
        c.KSDM as ksdm,
        c.KSMC as ksmc,
        c.BQDM as bqdm,
        c.BQMC as bqmc,
        ISNULL(a.fjh,'NA') as bfh,
        ISNULL(a.fjh,'NA') +'病房' as bfmc,
        ISNULL(b.RYCW,'NA') as bch,  ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'0') as nls,
        datediff(month,b.CSRQ,substring(convert(char(8),getdate(),112),1,8)) %12 as nly,
        b.HZXM as hzxm,
        convert(datetime,rtrim(ltrim(b.CSRQ))) AS birth,
        b.LXDH  as lxdh,
        ISNULL(b.HYZK,'0') as hyzkdm,
        (
        SELECT
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
        END
        ) AS hyzk,
        isnull(b.MZDM,'NA') as mzdm,
        isnull(d.NAME,'NA') as mz,
        'NA' as hkszd,
        'NA' as csdz,
        'NA' as gzdw,
        'NA' as gzdwdz,
        'NA' as gzdwdh,
        'NA' as jgd,
        CONVERT(VARCHAR,CASE WHEN b.SFZH = '' THEN 'NA' ELSE b.SFZH END)                AS sfzhm,
        b.BRXB as xbdm,
        (
        SELECT
        CASE b.BRXB
        WHEN '2' THEN
        '女'
        WHEN '1' THEN
        '男'
        ELSE
        '其它'
        END
        ) AS xbmc,

        t.SYXH as syxh,
        t.TJZT as tjzt,
        t.CJSJ as jlrq,
        t.FSSJ as qmrq,
        GETDATE() as gxsj,
        t.YXJL as yxjl,
        t.BLMC as blmc,
				t.FSSJ as fssj,
				t.BLNR as blnr
        FROM #EMR_QTBLJLK t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_MZDMK] d(nolock) on b.MZDM = d.ID
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm = b.RYBQ
		--删除临时表
		DROP TABLE #EMR_QTBLJLK
		DROP TABLE #EMR_QTBLJLK_LS
	 end
else
  --存在@syxh
	begin

       SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ INTO #EMR_QTBLJLK_TEMP_LS FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		 AND T.YXJL=1 AND T.SYXH=@syxh;
         --在临时表上增加索引
		CREATE INDEX QUERY_INDEX_LS ON #EMR_QTBLJLK_TEMP_LS (BLDM);

		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ INTO #EMR_QTBLJLK_TEMP FROM #EMR_QTBLJLK_TEMP_LS T(nolock)
		LEFT JOIN MBZ_DATA_LIST_SET A(nolock) on T.BLDM=A.MODEL_CODE
		WHERE A.SOURCE_TYPE=@sourceType
		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (SYXH);
		--查询业务数据
    SELECT
        t.QTBLJLXH as yjlxh,
        b.HISSYXH as jzlsh,
        c.PATID as patid,
        b.ZYHM as zyh,
        c.KSDM as ksdm,
        c.KSMC as ksmc,
        c.BQDM as bqdm,
        c.BQMC as bqmc,
        ISNULL(a.fjh,'NA') as bfh,
        ISNULL(a.fjh,'NA') +'病房' as bfmc,
        ISNULL(b.RYCW,'NA') as bch,  ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'0') as nls,
        datediff(month,b.CSRQ,substring(convert(char(8),getdate(),112),1,8)) %12 as nly,
        b.HZXM as hzxm,
        convert(datetime,rtrim(ltrim(b.CSRQ))) AS birth,
        b.LXDH  as lxdh,
        ISNULL(b.HYZK,'0') as hyzkdm,
        (
        SELECT
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
        END
        ) AS hyzk,
        isnull(b.MZDM,'NA') as mzdm,
        isnull(d.NAME,'NA') as mz,
        'NA' as hkszd,
        'NA' as csdz,
        'NA' as gzdw,
        'NA' as gzdwdz,
        'NA' as gzdwdh,
        'NA' as jgd,
        CONVERT(VARCHAR,CASE WHEN b.SFZH = '' THEN 'NA' ELSE b.SFZH END)                AS sfzhm,
        b.BRXB as xbdm,
        (
        SELECT
        CASE b.BRXB
        WHEN '2' THEN
        '女'
        WHEN '1' THEN
        '男'
        ELSE
        '其它'
        END
        ) AS xbmc,

        t.SYXH as syxh,
        t.TJZT as tjzt,
        t.CJSJ as jlrq,
        t.FSSJ as qmrq,
        GETDATE() as gxsj,
        t.YXJL as yxjl,
        t.BLMC as blmc,
				t.FSSJ as fssj,
				t.BLNR as blnr
        FROM #EMR_QTBLJLK_TEMP t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_MZDMK] d(nolock) on b.MZDM = d.ID
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm = b.RYBQ
		--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end
end

GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZYBCJL_SJYSCFJL_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chensj
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出互联互通上级医师查房记录 ---USP_HLHT_ZYBCJL_SJYSCFJL_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZYBCJL_SJYSCFJL_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZYBCJL_SJYSCFJL_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
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
    SELECT
        t.QTBLJLXH as yjlxh,
        b.HISSYXH as jzlsh,
        c.PATID as patid,
        b.ZYHM as zyh,
        c.KSDM as ksdm,
        c.KSMC as ksmc,
        c.BQDM as bqdm,
        c.BQMC as bqmc,
        ISNULL(a.fjh,'NA') as bfh,
        ISNULL(a.fjh,'NA') +'病房' as bfmc,
        ISNULL(b.RYCW,'NA') as bch,
        CONVERT(DATE,ISNULL(t.FSSJ,'1990-01-01 00:00:00'),120) AS cfrq,
        b.HZXM as hzxm,
        b.SFZH as sfzhm,
        CONVERT(DATE, ISNULL(b.CSRQ, '1990-01-01 00:00:00'), 120) AS csrq,
        b.BRXB as xbdm,
        (SELECT CASE b.BRXB WHEN '2' THEN '女' WHEN '1' THEN '男'ELSE '其它' END) AS xbmc,
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'NA') as nls,
        datediff(month,c.BIRTH,substring(convert(char(8),getdate(),112),1,8)) %12 as nly,
        isnull(f.zljh,'NA')  as yljh,
        t.SYXH as syxh,
        t.TJZT as tjzt,
        t.FSSJ as qmrq,
        GETDATE() as gxsj,
        t.YXJL as yxjl,
        t.BLMC as blmc,
				t.FSSJ as fssj,
				t.BLNR as blnr
        FROM #EMR_QTBLJLK t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_MZDMK] d(nolock) on b.MZDM = d.ID
        LEFT JOIN [HLHT_ZYBCJL_SCBCJL] f(nolock) ON f.jzlsh = b.HISSYXH
        LEFT JOIN [HLHT_ZY_CIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm = b.RYBQ
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
SELECT
        t.QTBLJLXH as yjlxh,
        b.HISSYXH as jzlsh,
        c.PATID as patid,
        b.ZYHM as zyh,
        c.KSDM as ksdm,
        c.KSMC as ksmc,
        c.BQDM as bqdm,
        c.BQMC as bqmc,
        ISNULL(a.fjh,'NA') as bfh,
        ISNULL(a.fjh,'NA') +'病房' as bfmc,
        ISNULL(b.RYCW,'NA') as bch,
        CONVERT(DATE,ISNULL(t.FSSJ,'1990-01-01 00:00:00'),120) AS cfrq,
        b.HZXM as hzxm,
        b.SFZH as sfzhm,
        CONVERT(DATE, ISNULL(b.CSRQ, '1990-01-01 00:00:00'), 120) AS csrq,
        b.BRXB as xbdm,
        (SELECT CASE b.BRXB WHEN '2' THEN '女' WHEN '1' THEN '男'ELSE '其它' END) AS xbmc,
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'NA') as nls,
        datediff(month,c.BIRTH,substring(convert(char(8),getdate(),112),1,8)) %12 as nly,
        isnull(f.zljh,'NA')  as yljh,
        t.SYXH as syxh,
        t.TJZT as tjzt,
        t.FSSJ as qmrq,
        GETDATE() as gxsj,
        t.YXJL as yxjl,
        t.BLMC as blmc,
				t.FSSJ as fssj,
				t.BLNR as blnr
        FROM #EMR_QTBLJLK_TEMP t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_MZDMK] d(nolock) on b.MZDM = d.ID
        LEFT JOIN [HLHT_ZYBCJL_SCBCJL] f(nolock) ON f.jzlsh = b.HISSYXH
        LEFT JOIN [HLHT_ZY_CIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm = b.RYBQ
		--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end
end

GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZYBCJL_SQTL_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chensj
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出获取住院病程/术前讨论病人 ---USP_HLHT_ZYBCJL_SQTL_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZYBCJL_SQTL_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZYBCJL_SQTL_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
[注意事项]
 在CIS_HLHT中创建
*/
begin
--判断@syxh是否存在
if @syxh  is null or @syxh = ''
  --不存在首页序号
	begin
     SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ  INTO #EMR_QTBLJLK_LS FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		 AND T.YXJL=1
         --在临时表上增加索引
		CREATE INDEX QUERY_INDEX_LS ON #EMR_QTBLJLK_LS (BLDM);

		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ  INTO #EMR_QTBLJLK FROM #EMR_QTBLJLK_LS T(nolock)
		LEFT JOIN MBZ_DATA_LIST_SET A(nolock) on T.BLDM=A.MODEL_CODE
		WHERE A.SOURCE_TYPE=@sourceType

		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK (SYXH);
		--查询业务数据
    SELECT
        t.QTBLJLXH as yjlxh,
        b.HISSYXH as jzlsh,
        c.PATID as patid,
        b.ZYHM as zyh,
        c.KSDM as ksdm,
        c.KSMC as ksmc,
        c.BQDM as bqdm,
        c.BQMC as bqmc,
        ISNULL(a.fjh,'NA') as bfh,
        ISNULL(a.fjh,'NA') +'病房'  as bfmc,
        ISNULL(b.RYCW,'NA') as bch,
        b.HZXM as hzxm,
        b.SFZH as sfzhm,
        b.BRXB as xbdm,
        (SELECT CASE b.BRXB WHEN '2' THEN '女' WHEN '1' THEN '男'ELSE '其它' END) AS xbmc,
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'NA') as nls,
        datediff(month,c.BIRTH,substring(convert(char(8),getdate(),112),1,8)) %12 as nly,
        t.SYXH as syxh,
        t.TJZT as tjzt,
        t.CJSJ as xjrq,
        GETDATE() as gxsj,
        t.FSSJ as qmrq,
        t.YXJL as yxjl,
        t.BLMC as blmc,
				t.FSSJ as fssj,
				t.BLNR as blnr
        FROM #EMR_QTBLJLK t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_MZDMK] d(nolock) on b.MZDM = d.ID
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm = b.RYBQ
		--删除临时表
		DROP TABLE #EMR_QTBLJLK
		DROP TABLE #EMR_QTBLJLK_LS
	 end
else
  --存在@syxh
	begin
 SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ  INTO #EMR_QTBLJLK_TEMP_LS FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		 AND T.YXJL=1 AND T.SYXH=@syxh;
         --在临时表上增加索引
		CREATE INDEX QUERY_INDEX_LS ON #EMR_QTBLJLK_TEMP_LS (BLDM);

		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ  INTO #EMR_QTBLJLK_TEMP FROM #EMR_QTBLJLK_TEMP_LS T(nolock)
		LEFT JOIN MBZ_DATA_LIST_SET A(nolock) on T.BLDM=A.MODEL_CODE
		WHERE A.SOURCE_TYPE=@sourceType
		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (SYXH);
		--查询业务数据
       SELECT
        t.QTBLJLXH as yjlxh,
        b.HISSYXH as jzlsh,
        c.PATID as patid,
        b.ZYHM as zyh,
        c.KSDM as ksdm,
        c.KSMC as ksmc,
        c.BQDM as bqdm,
        c.BQMC as bqmc,
        ISNULL(a.fjh,'NA') as bfh,
        ISNULL(a.fjh,'NA') +'病房'  as bfmc,
        ISNULL(b.RYCW,'NA') as bch,
        b.HZXM as hzxm,
        b.SFZH as sfzhm,
        b.BRXB as xbdm,
        (SELECT CASE b.BRXB WHEN '2' THEN '女' WHEN '1' THEN '男'ELSE '其它' END) AS xbmc,
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'NA') as nls,
        datediff(month,c.BIRTH,substring(convert(char(8),getdate(),112),1,8)) %12 as nly,
        t.SYXH as syxh,
        t.TJZT as tjzt,
        t.CJSJ as xjrq,
        GETDATE() as gxsj,
        t.FSSJ as qmrq,
        t.YXJL as yxjl,
        t.BLMC as blmc,
				t.FSSJ as fssj,
				t.BLNR as blnr
        FROM #EMR_QTBLJLK_TEMP t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_MZDMK] d(nolock) on b.MZDM = d.ID
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm = b.RYBQ
		--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE EMR_QTBLJLK_TEMP_LS
	end
end

GO




GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZYBCJL_SQXJ_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chensj
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出获取住院病程/术前小结公共病人数据 ---USP_HLHT_ZYBCJL_SQXJ_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZYBCJL_SQXJ_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZYBCJL_SQXJ_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
[注意事项]
 在CIS_HLHT中创建
*/
begin
--判断@syxh是否存在
if @syxh  is null or @syxh = ''
  --不存在首页序号
	begin
       SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ INTO #EMR_QTBLJLK_LS FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		 AND T.YXJL=1
         --在临时表上增加索引
		CREATE INDEX QUERY_INDEX_LS ON #EMR_QTBLJLK_LS (BLDM);

		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ INTO #EMR_QTBLJLK FROM #EMR_QTBLJLK_LS T(nolock)
		LEFT JOIN MBZ_DATA_LIST_SET A(nolock) on T.BLDM=A.MODEL_CODE
		WHERE A.SOURCE_TYPE=@sourceType

		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK (SYXH);
		--查询业务数据
    SELECT
        t.QTBLJLXH as yjlxh,
        b.HISSYXH as jzlsh,
        c.PATID as patid,
        b.ZYHM as zyh,
        c.KSDM as ksdm,
        c.KSMC as ksmc,
        c.BQDM as bqdm,
        c.BQMC as bqmc,
        ISNULL(a.fjh,'NA') as bfh,
        ISNULL(a.fjh,'NA') +'病房'  as bfmc,
        ISNULL(b.RYCW,'NA') as bch,
        b.HZXM as hzxm,
        b.SFZH as sfzhm,
        b.BRXB as xbdm,
        (SELECT CASE b.BRXB WHEN '2' THEN '女' WHEN '1' THEN '男'ELSE '其它' END) AS xbmc,
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'NA') as nls,
        datediff(month,c.BIRTH,substring(convert(char(8),getdate(),112),1,8)) %12 as nly,
        t.SYXH as syxh,
        t.TJZT as tjzt,
        t.CJSJ as xjrq,
        GETDATE() as gxsj,
        t.FSSJ as qmrq,
        t.YXJL as yxjl,
        t.BLMC as blmc,
				t.FSSJ as fssj,
				t.BLNR as blnr
        FROM #EMR_QTBLJLK t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_MZDMK] d(nolock) on b.MZDM = d.ID
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm = b.RYBQ
		--删除临时表
		DROP TABLE #EMR_QTBLJLK
		DROP TABLE #EMR_QTBLJLK_LS
	 end
else
  --存在@syxh
	begin
    SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ INTO #EMR_QTBLJLK_TEMP_LS FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		 AND T.YXJL=1 AND T.SYXH=@syxh;
         --在临时表上增加索引
		CREATE INDEX QUERY_INDEX_LS ON #EMR_QTBLJLK_TEMP_LS (BLDM);

		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ INTO #EMR_QTBLJLK_TEMP FROM #EMR_QTBLJLK_TEMP_LS T(nolock)
		LEFT JOIN MBZ_DATA_LIST_SET A(nolock) on T.BLDM=A.MODEL_CODE
		WHERE A.SOURCE_TYPE=@sourceType
		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (SYXH);
		--查询业务数据
    SELECT
        t.QTBLJLXH as yjlxh,
        b.HISSYXH as jzlsh,
        c.PATID as patid,
        b.ZYHM as zyh,
        c.KSDM as ksdm,
        c.KSMC as ksmc,
        c.BQDM as bqdm,
        c.BQMC as bqmc,
        ISNULL(a.fjh,'NA') as bfh,
        ISNULL(a.fjh,'NA') +'病房'  as bfmc,
        ISNULL(b.RYCW,'NA') as bch,
        b.HZXM as hzxm,
        b.SFZH as sfzhm,
        b.BRXB as xbdm,
        (SELECT CASE b.BRXB WHEN '2' THEN '女' WHEN '1' THEN '男'ELSE '其它' END) AS xbmc,
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'NA') as nls,
        datediff(month,c.BIRTH,substring(convert(char(8),getdate(),112),1,8)) %12 as nly,
        t.SYXH as syxh,
        t.TJZT as tjzt,
        t.CJSJ as xjrq,
        GETDATE() as gxsj,
        t.FSSJ as qmrq,
        t.YXJL as yxjl,
        t.BLMC as blmc,
				t.FSSJ as fssj,
				t.BLNR as blnr
        FROM #EMR_QTBLJLK_TEMP t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_MZDMK] d(nolock) on b.MZDM = d.ID
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm = b.RYBQ
		--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end
end

GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZYBCJL_SWBLTLJL_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chensj
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出互联互通死亡病历讨论记录数据集表 ---USP_HLHT_ZYBCJL_SWBLTLJL_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZYBCJL_SWBLTLJL_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZYBCJL_SWBLTLJL_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
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
    SELECT
        t.QTBLJLXH as yjlxh,
        b.HISSYXH as jzlsh,
        c.PATID as patid,
        b.ZYHM as zyh,
        c.KSDM as ksdm,
        c.KSMC as ksmc,
        c.BQDM as bqdm,
        c.BQMC as bqmc,
        ISNULL(a.fjh,'NA') as bfh,
        ISNULL(a.fjh,'NA') +'病房' as bfmc,
        ISNULL(b.RYCW,'NA') as bch,
        b.HZXM as hzxm,
        b.SFZH as sfzhm,
        b.BRXB as xbdm,
        (SELECT CASE b.BRXB WHEN '2' THEN '女' WHEN '1' THEN '男'ELSE '其它' END) AS xbmc,
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'NA') as nls,
        datediff(month,c.BIRTH,substring(convert(char(8),getdate(),112),1,8)) %12 as nly,
        b.RYRQ as ryrq,
        t.FSSJ as qmrq,
        t.SYXH as syxh,
        t.TJZT as tjzt,
        GETDATE() as gxsj,
        t.YXJL as yxjl,
        t.BLMC as blmc,
				t.FSSJ as fssj,
				t.BLNR as blnr
        FROM #EMR_QTBLJLK t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_MZDMK] d(nolock) on b.MZDM = d.ID
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm = b.RYBQ
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
      SELECT
        t.QTBLJLXH as yjlxh,
        b.HISSYXH as jzlsh,
        c.PATID as patid,
        b.ZYHM as zyh,
        c.KSDM as ksdm,
        c.KSMC as ksmc,
        c.BQDM as bqdm,
        c.BQMC as bqmc,
        ISNULL(a.fjh,'NA') as bfh,
        ISNULL(a.fjh,'NA') +'病房' as bfmc,
        ISNULL(b.RYCW,'NA') as bch,
        b.HZXM as hzxm,
        b.SFZH as sfzhm,
        b.BRXB as xbdm,
        (SELECT CASE b.BRXB WHEN '2' THEN '女' WHEN '1' THEN '男'ELSE '其它' END) AS xbmc,
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'NA') as nls,
        datediff(month,c.BIRTH,substring(convert(char(8),getdate(),112),1,8)) %12 as nly,
        b.RYRQ as ryrq,
        t.FSSJ as qmrq,
        t.SYXH as syxh,
        t.TJZT as tjzt,
        GETDATE() as gxsj,
        t.YXJL as yxjl,
        t.BLMC as blmc,
				t.FSSJ as fssj,
				t.BLNR as blnr
        FROM #EMR_QTBLJLK_TEMP t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_MZDMK] d(nolock) on b.MZDM = d.ID
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm = b.RYBQ
		--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end
end

GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZYBCJL_SWJL_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chenfeng
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出死亡记录 ---USP_HLHT_ZYBCJL_SWJL_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZYBCJL_SWJL_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZYBCJL_SWJL_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
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
				ISNULL(q.QTBLJLXH, 'NA')                   AS yjlxh,
        c.SYXH                                    AS jzlsh,
        c.PATID                                   AS patid,
        ISNULL(b.ZYHM, 'NA')                       AS zyh,
        (
        SELECT
        t.DICT_LABEL
        FROM
        [MBZ_DICT_INFO] t(nolock)
        WHERE
        t.DICT_CODE = 'hospitalInfoNo'
        AND t.DICT_VALUE = 1
        )                            AS zzjgdm,
        (
        SELECT
        t.DICT_LABEL
        FROM
        [MBZ_DICT_INFO] t(nolock)
        WHERE
        t.DICT_CODE = 'hospitalInfoName'
        AND t.DICT_VALUE = 1
        )                             AS zzjgmc,
        ISNULL(c.BQDM, 'NA')                       AS bqdm,
        ISNULL(c.BQMC, 'NA')                       AS bqmc,
        ISNULL(c.KSDM, 'NA')                       AS ksdm,
        ISNULL(c.KSMC, 'NA')                       AS ksmc,
        ISNULL(m.fjh, 'NA')                        AS bfh,
        ISNULL(m.fjh, 'NA') + '病房'                       AS bfmc,
        ISNULL(b.RYCW, 'NA')                       AS bch,
        ISNULL(b.HZXM, 'NA')                       AS hzxm,
        ISNULL(b.SFZH, 'NA')                       AS sfzhm,
        ISNULL(b.BRXB, 'NA')                       AS xbdm,
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
        )                                         AS xbmc,
        ISNULL(
        CONVERT(
        VARCHAR,
        (
        YEAR(GETDATE()) - YEAR(CONVERT(datetime, b.CSRQ))
        )
        ),

        '0'
        )                                         AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        b.RYRQ                                    AS ryrq,
        q.SYXH                                AS syxh,
        q.TJZT                                    AS tjzt,
        q.YXJL                                    AS yxjl,
        GETDATE()                                  AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
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
		WHERE A.SOURCE_TYPE=@sourceType;

		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (SYXH);
		 --查询表数据
				SELECT
				ISNULL(q.QTBLJLXH, 'NA')                   AS yjlxh,
        c.SYXH                                    AS jzlsh,
        c.PATID                                   AS patid,
        ISNULL(b.ZYHM, 'NA')                       AS zyh,
        (
        SELECT
        t.DICT_LABEL
        FROM
        [MBZ_DICT_INFO] t(nolock)
        WHERE
        t.DICT_CODE = 'hospitalInfoNo'
        AND t.DICT_VALUE = 1
        )                            AS zzjgdm,
        (
        SELECT
        t.DICT_LABEL
        FROM
        [MBZ_DICT_INFO] t(nolock)
        WHERE
        t.DICT_CODE = 'hospitalInfoName'
        AND t.DICT_VALUE = 1
        )                             AS zzjgmc,
        ISNULL(c.BQDM, 'NA')                       AS bqdm,
        ISNULL(c.BQMC, 'NA')                       AS bqmc,
        ISNULL(c.KSDM, 'NA')                       AS ksdm,
        ISNULL(c.KSMC, 'NA')                       AS ksmc,
        ISNULL(m.fjh, 'NA')                        AS bfh,
        ISNULL(m.fjh, 'NA') + '病房'                       AS bfmc,
        ISNULL(b.RYCW, 'NA')                       AS bch,
        ISNULL(b.HZXM, 'NA')                       AS hzxm,
        ISNULL(b.SFZH, 'NA')                       AS sfzhm,
        ISNULL(b.BRXB, 'NA')                       AS xbdm,
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
        )                                         AS xbmc,
        ISNULL(
        CONVERT(
        VARCHAR,
        (
        YEAR(GETDATE()) - YEAR(CONVERT(datetime, b.CSRQ))
        )
        ),

        '0'
        )                                         AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        b.RYRQ                                    AS ryrq,
        q.SYXH                                AS syxh,
        q.TJZT                                    AS tjzt,
        q.YXJL                                    AS yxjl,
        GETDATE()                                  AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK_TEMP q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
				--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end

end


GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZYBCJL_YNBLTLJL_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chenfeng
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出疑难病例讨论记录 ---USP_HLHT_ZYBCJL_YNBLTLJL_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZYBCJL_YNBLTLJL_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZYBCJL_YNBLTLJL_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
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
				ISNULL(q.QTBLJLXH, 'NA')                   AS yjlxh,
        c.SYXH                                     AS jzlsh,
        c.PATID                                    AS patid,
        ISNULL(b.ZYHM, 'NA')                       AS zyh,
        ISNULL(m.fjh, 'NA')+ '病房'                AS rybfmc,
        ISNULL(c.BQDM, 'NA')                       AS bqdm,
        ISNULL(c.BQMC, 'NA')                       AS bqmc,
        ISNULL(c.KSDM, 'NA')                       AS ksdm,
        ISNULL(c.KSMC, 'NA')                       AS ksmc,
        ISNULL(m.fjh, 'NA')                        AS bfh,
        ISNULL(b.RYCW, 'NA')                       AS bch,
        ISNULL(b.HZXM, 'NA')                       AS hzxm,
        ISNULL(b.SFZH, 'NA')                       AS sfzhm,
        ISNULL(b.BRXB, 'NA')                       AS xbdm,

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
        )                                         AS xbmc,
        ISNULL(
        CONVERT(
        VARCHAR,
        (
        YEAR(GETDATE()) - YEAR(CONVERT(datetime, b.CSRQ))
        )
        ),
        '0'
        )                                                 AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        q.SYXH                                AS syxh,
        q.TJZT                                    AS tjzt,
        q.YXJL                                    AS yxjl,
        GETDATE()                                         AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
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
		WHERE A.SOURCE_TYPE=@sourceType;

		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (SYXH);
		 --查询表数据
				SELECT
				ISNULL(q.QTBLJLXH, 'NA')                   AS yjlxh,
        c.SYXH                                     AS jzlsh,
        c.PATID                                    AS patid,
        ISNULL(b.ZYHM, 'NA')                       AS zyh,
        ISNULL(m.fjh, 'NA')+ '病房'                AS rybfmc,
        ISNULL(c.BQDM, 'NA')                       AS bqdm,
        ISNULL(c.BQMC, 'NA')                       AS bqmc,
        ISNULL(c.KSDM, 'NA')                       AS ksdm,
        ISNULL(c.KSMC, 'NA')                       AS ksmc,
        ISNULL(m.fjh, 'NA')                        AS bfh,
        ISNULL(b.RYCW, 'NA')                       AS bch,
        ISNULL(b.HZXM, 'NA')                       AS hzxm,
        ISNULL(b.SFZH, 'NA')                       AS sfzhm,
        ISNULL(b.BRXB, 'NA')                       AS xbdm,

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
        )                                         AS xbmc,
        ISNULL(
        CONVERT(
        VARCHAR,
        (
        YEAR(GETDATE()) - YEAR(CONVERT(datetime, b.CSRQ))
        )
        ),
        '0'
        )                                                 AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
        q.SYXH                                AS syxh,
        q.TJZT                                    AS tjzt,
        q.YXJL                                    AS yxjl,
        GETDATE()                                         AS gxsj,
        q.BLMC as blmc,
        q.FSSJ as fssj,
        q.BLNR as blnr
				FROM #EMR_QTBLJLK_TEMP q
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON q.SYXH = b.SYXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON b.SYXH = c.EMRXH
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_DQDMK] d(nolock) ON b.SSDM = d.DQDM
				LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[PUB_ZYDMK] p(nolock) ON b.ZYDM = p.ID
				LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] m(nolock) ON (m.id = b.RYCW AND m.bqdm = b.RYBQ);
				--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end

end

GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZYBCJL_ZKJL_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chenkuai
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出转科记录 ---USP_HLHT_ZYBCJL_ZKJL_DATA
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec USP_HLHT_ZYBCJL_ZKJL_DATA '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec USP_HLHT_ZYBCJL_ZKJL_DATA '1','2018-01-01','2018-01-03',NULL --提取当天的数据
[注意事项]
 在CIS_HLHT中创建
*/

begin
--创建临时表
if @syxh  is null or @syxh = ''
	begin

   SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ,MXFLDM INTO #EMR_QTBLJLK_LS FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		 AND T.YXJL=1
         --在临时表上增加索引
		CREATE INDEX QUERY_INDEX_LS ON #EMR_QTBLJLK_LS (BLDM);

		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ,MXFLDM INTO #EMR_QTBLJLK FROM #EMR_QTBLJLK_LS T(nolock)
		LEFT JOIN MBZ_DATA_LIST_SET A(nolock) on T.BLDM=A.MODEL_CODE
		WHERE A.SOURCE_TYPE=@sourceType
		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK (SYXH);
     --查询表数据
    SELECT t.QTBLJLXH AS yjlxh,
        b.HISSYXH AS jzlsh,
        c.PATID AS patid,
        b.ZYHM AS zyh,
        c.KSDM AS ksdm,
        c.KSMC AS ksmc ,
        c.BQDM AS bqdm,
        c.BQMC AS bqmc ,
        a.fjh AS rybfmc,
        ISNULL(a.fjh, 'NA') AS bfh,
        ISNULL(a.fjh, 'NA')+'病房' AS bfmc,
        c.CWDM AS bch ,
        b.HZXM AS hzxm,
        (SELECT CASE b.SFZH WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE b.SFZH END) as sfzhm,        CONVERT(datetime,substring( c.BIRTH,1,4)+'-'+substring(c.BIRTH,5,2)+'-'+substring(c.BIRTH,7,2)) AS hzcsrq,
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
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'''') AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12       AS nly,        b.RYRQ AS ryrq,
        GETDATE() AS gxsj,
        t.YXJL AS yxjl,
        t.SYXH AS syxh,
        t.TJZT as tjzt,
        t.BLMC as blmc,
        t.FSSJ as fssj,
        t.BLNR as blnr,
        t.CJSJ as cjsj,
        t.MXFLDM AS mxfldm
        FROM #EMR_QTBLJLK t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm=b.RYBQ
        LEFT JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_JZJLK] o(nolock) ON t.SYXH = o.EMRXH


	--删除临时表
		DROP TABLE #EMR_QTBLJLK
		DROP TABLE #EMR_QTBLJLK_LS
	end
else
	begin
	  SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ,MXFLDM INTO #EMR_QTBLJLK_TEMP_LS FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		 AND T.YXJL=1 AND T.SYXH=@syxh;
         --在临时表上增加索引
		CREATE INDEX QUERY_INDEX_LS ON #EMR_QTBLJLK_TEMP_LS (BLDM);

		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM,CJSJ,MXFLDM INTO #EMR_QTBLJLK_TEMP FROM #EMR_QTBLJLK_TEMP_LS T(nolock)
		LEFT JOIN MBZ_DATA_LIST_SET A(nolock) on T.BLDM=A.MODEL_CODE
		WHERE A.SOURCE_TYPE=@sourceType
		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (SYXH);

		 --查询表数据
    SELECT t.QTBLJLXH AS yjlxh,
        b.HISSYXH AS jzlsh,
        c.PATID AS patid,
        b.ZYHM AS zyh,
        c.KSDM AS ksdm,
        c.KSMC AS ksmc ,
        c.BQDM AS bqdm,
        c.BQMC AS bqmc ,
        a.fjh AS rybfmc,
        ISNULL(a.fjh, 'NA') AS bfh,
        ISNULL(a.fjh, 'NA')+'病房' AS bfmc,
        c.CWDM AS bch ,
        b.HZXM AS hzxm,
        (SELECT CASE b.SFZH WHEN '' THEN 'NA' WHEN NULL THEN 'NA' ELSE b.SFZH END) as sfzhm,        CONVERT(datetime,substring( c.BIRTH,1,4)+'-'+substring(c.BIRTH,5,2)+'-'+substring(c.BIRTH,7,2)) AS hzcsrq,
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
        ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, b.CSRQ)))) ,'''') AS nls,
        DATEDIFF(MONTH,b.CSRQ,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12       AS nly,        b.RYRQ AS ryrq,
        GETDATE() AS gxsj,
        t.YXJL AS yxjl,
        t.SYXH AS syxh,
        t.TJZT as tjzt,
        t.BLMC as blmc,
        t.FSSJ as fssj,
        t.BLNR as blnr,
        t.CJSJ as cjsj,
        t.MXFLDM AS mxfldm
        FROM #EMR_QTBLJLK_TEMP t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm=b.RYBQ
        LEFT JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_JZJLK] o(nolock) ON t.SYXH = o.EMRXH

	--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
    end

	END


GO

GO
CREATE PROCEDURE [dbo].[USP_HLHT_ZZYJL_ZZYJL_DATA]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as

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

     SELECT t.QTBLJLXH AS yjlxh,
        b.HISSYXH AS jzlsh,
        c.PATID AS patid,
        'NA' AS jkkh,
        'NA' AS mjzh,
        b.ZYHM AS zyh,
        '2' AS jzlb,
        b.HZXM AS hzxm,
        b.SFZH AS sfzhm,
        b.BRXB AS xbdm,
        c.SEX AS xbmc,
        c.BIRTH AS csrq,
        GETDATE() AS gxsj,
        t.YXJL AS yxjl,
        t.SYXH AS syxh,
        t.TJZT as tjzt

        FROM #EMR_QTBLJLK t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm=b.RYBQ


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

     SELECT t.QTBLJLXH AS yjlxh,
        b.HISSYXH AS jzlsh,
        c.PATID AS patid,
        'NA' AS jkkh,
        'NA' AS mjzh,
        b.ZYHM AS zyh,
        '2' AS jzlb,
        b.HZXM AS hzxm,
        b.SFZH AS sfzhm,
        b.BRXB AS xbdm,
        c.SEX AS xbmc,
        c.BIRTH AS csrq,
        GETDATE() AS gxsj,
        t.YXJL AS yxjl,
        t.SYXH AS syxh,
        t.TJZT as tjzt

        FROM #EMR_QTBLJLK_TEMP t
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[CPOE_BRSYK] c(nolock) ON t.SYXH = c.EMRXH
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_BRSYK] b(nolock) ON b.SYXH = t.SYXH
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm=b.RYBQ


 --删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
    end

	END
GO


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



