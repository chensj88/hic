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
