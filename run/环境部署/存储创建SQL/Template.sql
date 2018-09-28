CREATE PROCEDURE [dbo].[template]
@sourceType varchar(64),   --原纪录类型
@startDate  varchar(20),   --开始日期
@endDate    varchar(20),   --结束日期
@syxh       int            --首页序号
as
/*
[创建者] chensj
[公司]上海金仕达卫宁软件股份有限公司@2015-2018
[时间]2018-09-23
[功能]导出互联互通24H出入院记录 ---template
[参数]
 @sourceType: 元数据类型
 @startime: 开始时间戳
 @endtime:  结束时间戳
 @syxh：病人首页序号
[调用实例]
[调用]:
      exec template '1','2018-01-01','2018-01-03','1' --通过首页序号提取数据
      exec template '1','2018-01-01','2018-01-03',NULL --提取当天的数据
[注意事项]
 在CIS_HLHT中创建
*/
begin
--判断@syxh是否存在
if @syxh  is null or @syxh = ''
  --不存在首页序号
	begin
    --创建临时表
		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM INTO #EMR_QTBLJLK FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE EXISTS (SELECT 1 FROM MBZ_DATA_LIST_SET A(nolock) WHERE A.SOURCE_TYPE=@sourceType and A.MODEL_CODE = T.BLDM)
		 AND T.TJSJ BETWEEN CONVERT(DATE, ltrim(@startDate)) AND CONVERT(DATE, ltrim(@endDate))
		  AND T.YXJL = 1
		--在临时表上增加索引
		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK (BLDM, YXJL, TJSJ);
		--查询业务数据

		--删除临时表
		DROP TABLE #EMR_QTBLJLK
	 end
else
  --存在@syxh
	begin
	 --创建临时表
		SELECT QTBLJLXH,SYXH,TJZT,YXJL,BLMC,FSSJ,BLNR,BLDM INTO #EMR_QTBLJLK_TEMP FROM [HLHT_ZY_CIS].[CISDB].[dbo].[EMR_QTBLJLK] T(nolock)
		WHERE EXISTS (SELECT 1 FROM dbo.MBZ_DATA_LIST_SET A(nolock) WHERE A.SOURCE_TYPE=@sourceType and A.MODEL_CODE = T.BLDM)
		 AND T.TJSJ BETWEEN CONVERT (DATE, @startDate) AND CONVERT (DATE, @endDate)
		  AND T.YXJL = 1 AND T.SYXH=@syxh
		 --在临时表上增加索引
		CREATE INDEX QUERY_INDEX ON #EMR_QTBLJLK_TEMP (BLDM, YXJL, TJSJ);
		--查询业务数据

		--删除临时表
		DROP TABLE #EMR_QTBLJLK_TEMP
	end
end
