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

	 SELECT * INTO #EMR_QTBLJLK_LS FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		AND T.TJSJ IS NOT NULL  AND T.TJSJ !='' AND T.YXJL=1
         --在临时表上增加索引
		CREATE INDEX QUERY_INDEX_LS ON #EMR_QTBLJLK_LS (BLDM);

		SELECT * INTO #EMR_QTBLJLK FROM #EMR_QTBLJLK_LS T(nolock)
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
              ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, c.BIRTH)))) ,'''') AS nls,
              DATEDIFF(MONTH,c.BIRTH,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
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
	   SELECT * INTO #EMR_QTBLJLK_TEMP_LS FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		AND T.TJSJ IS NOT NULL  AND T.TJSJ !='' AND T.YXJL=1 AND T.SYXH=@syxh;
         --在临时表上增加索引
		CREATE INDEX QUERY_INDEX_LS ON #EMR_QTBLJLK_TEMP_LS (BLDM);

		SELECT * INTO #EMR_QTBLJLK_TEMP FROM #EMR_QTBLJLK_TEMP_LS T(nolock)
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
              ISNULL(convert (varchar,(YEAR(GETDATE())-YEAR(convert(datetime, c.BIRTH)))) ,'''') AS nls,
              DATEDIFF(MONTH,c.BIRTH,SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,8)) %12 AS nly,
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











