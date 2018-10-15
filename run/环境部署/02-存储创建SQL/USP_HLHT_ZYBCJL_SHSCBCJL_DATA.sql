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
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] d(nolock) on b.MZDM = d.MXDM AND d.LBDM = 42
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
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_SYS_ZDFLMXK] d(nolock) on b.MZDM = d.MXDM AND d.LBDM = 42
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm = b.RYBQ
		--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end
end
