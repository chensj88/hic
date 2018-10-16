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
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm = b.RYBQ
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
        LEFT JOIN [HLHT_ZY_HIS].[THIS4].[dbo].[ZY_BCDMK] a(nolock) ON a.id = b.RYCW and a.bqdm = b.RYBQ
        LEFT JOIN [HLHT_ZY_CIS].[CISDB].[dbo].[OUTP_JZJLK] e(nolock) on t.SYXH = e.EMRXH
		--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
		DROP TABLE #EMR_QTBLJLK_TEMP_LS
	end
end
