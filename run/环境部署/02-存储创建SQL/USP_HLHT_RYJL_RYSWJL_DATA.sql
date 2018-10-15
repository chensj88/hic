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
        ISNULL(i.NAME,'NA') as zylbmc,
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
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] d(nolock) on b.MZDM = d.MXDM AND d.LBDM = 42
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] i(nolock) on b.ZYDM=i.MXDM and i.LBDM = 41
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
        ISNULL(i.NAME,'NA') as zylbmc,
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
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] d(nolock) on b.MZDM = d.MXDM AND d.LBDM = 42
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] i(nolock) on b.ZYDM=i.MXDM and i.LBDM = 41
		--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end
end
