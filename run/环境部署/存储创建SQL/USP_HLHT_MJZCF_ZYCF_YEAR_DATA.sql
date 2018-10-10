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
	SELECT * INTO #YF_NMZFYZD FROM [HLHT_MZ_HIS].[THIS4].[dbo].[YF_NMZFYZD] T(nolock)
	WHERE T.fyrq BETWEEN  @startDate  AND  @endDate
	--在临时表上增加索引
	CREATE INDEX IDX_YF_NMZFYZD_CFXH ON #YF_NMZFYZD (cfxh);
		--查询业务数据
     SELECT
          ISNULL(CONVERT(VARCHAR,T4.XH),'NA') AS yjlxh,
          ISNULL(CONVERT(VARCHAR,T2.GHXH),'NA') AS jzlsh,
          ISNULL(CONVERT(VARCHAR,T2.PATID),'NA') AS patid,
          ISNULL(CONVERT(VARCHAR,T2.HZXM ),'NA') AS hzxm,
          ISNULL(CONVERT(VARCHAR,T2.GHXH ),'NA') AS mjzh,
          CASE WHEN RTRIM(LTRIM(T3.SFZH)) = '' THEN 'NA'
          ELSE ISNULL(CONVERT(VARCHAR,T3.SFZH ),'NA') END  AS sfzhm,
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
          ISNULL(T4.CFXH, 'NA') AS cfxh,
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
          T4.TS AS cfyxts,
          T2.KSDM AS cfklksdm,
          T2.KSMC AS cfklks,
          ISNULL(
          (SELECT TOP 1 T7.ZDDM FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE T2.GHXH = T7.GHXH AND T7.ZDLB = 0 AND T7.ZDLX = 0),
          (SELECT TOP 1 T8.ZDDM FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NMZBLZDK] T8(nolock)
          WHERE T2.GHXH = T8.GHXH AND T8.ZDLB = 0 AND T8.ZDLX = 0)) AS jbzdbm,
          ISNULL(
          (SELECT TOP 1 T9.ZDMC FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T9(nolock)
          WHERE T2.GHXH = T9.GHXH AND T9.ZDLB = 0 AND T9.ZDLX = 0 ),
          (SELECT TOP 1 T10.ZDMC FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NMZBLZDK] T10(nolock)
          WHERE T2.GHXH = T10.GHXH AND T10.ZDLB = 0 AND T10.ZDLX = 0 )) AS jbzd,
          ISNULL(
          (SELECT TOP 1 T11.ZDDM FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T11(nolock)
          WHERE T2.GHXH = T11.GHXH AND T11.ZDLB = 0 AND T11.ZDLX = 0),
          (SELECT TOP 1 T12.ZDDM FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NMZBLZDK] T12(nolock)
          WHERE T2.GHXH = T12.GHXH AND T12.ZDLB = 0 AND T12.ZDLX = 0)) AS zybmdm,
          ISNULL(
          (SELECT TOP 1 T13.ZDMC FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T13(nolock)
          WHERE T2.GHXH = T13.GHXH AND T13.ZDLB = 0 AND T13.ZDLX = 0 ),
          (SELECT TOP 1 T14.ZDMC FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NMZBLZDK] T14(nolock)
          WHERE T2.GHXH = T14.GHXH AND T14.ZDLB = 0 AND T14.ZDLX = 0 )) AS zybm,
          ISNULL(
          (SELECT T15.ZXDM FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T15(nolock)
          WHERE T2.GHXH = T15.GHXH AND T15.ZDLB = 1 AND T15.ZDLX = 0),
          (SELECT T16.ZXDM FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NMZBLZDK] T16(nolock)
          WHERE T2.GHXH = T16.GHXH AND T16.ZDLB = 1 AND T16.ZDLX = 0 )) AS zyzhdm,
          ISNULL(
          (SELECT T17.ZXMC FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T17(nolock)
          WHERE T2.GHXH = T17.GHXH AND T17.ZDLB = 1 AND T17.ZDLX = 0),
          (SELECT T18.ZXMC FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NMZBLZDK] T18(nolock)
          WHERE T2.GHXH = T18.GHXH AND T18.ZDLB = 1 AND T18.ZDLX = 0)) AS zyzh,
          T4.YPDM AS ywdm,
          T4.YPMC AS ywmc,
          T4.YPGG AS ywgg,
          T4.JXDM AS ywjxdm,
          T4.JXMC AS ywjx,
          T4.YPJL AS ywsycjl,
          T4.JLDW AS ywsyjldw,
          T4.PCDM AS ywsypcdm,
          T4.PCMC AS ywsypc,
          T4.YPYF AS ywsytj,
          T4.YPYFMC AS ywsytjmc,
          (
          SELECT
          CASE T6.yplh
          WHEN '02' THEN
          T4.YPSL * T4.YPJL
          WHEN '03' THEN
          T4.YPSL
          ELSE
          0
          END
          ) AS ywsyzjl,
          T4.FZXH AS cfypzh,
          T4.YPMC AS zyypcf,
          'NA' AS zyypjs,
          'NA' AS zyypjzf,
          T4.PCDM AS zyyyff,
          'NA' AS zfbm,
          'NA' AS zzzf,
          T2.YSMC AS klysqm,
          T2.YSDM AS ysbm,
          T2.YSDM AS shyjsbm,
          T2.YSMC AS shyjsqm,
          T1.pyczry AS tpyjsbm,
          e.name AS tpyjsqm,
          T1.fyczyh AS hdyjsbm,
          f.name AS hdyjsqm,
          T1.fyczyh AS fyyjsbm,
          f.name AS fyyjsqm,
          ISNULL(T2.MEMO, 'NA') AS cfbzxx,
          CONVERT (
          DECIMAL (18, 2),
          (T4.YPSL * T4.YLSJ) / T4.YKXS
          ) AS cfypje,
          GETDATE() AS gxsj
         FROM #YF_NMZFYZD T1
         LEFT JOIN [HLHT_MZ_HIS].[THIS4].[dbo].[czryk] e(nolock) on T1.pyczry=e.id
         LEFT JOIN [HLHT_MZ_HIS].[THIS4].[dbo].[czryk] f(nolock) on T1.fyczyh=f.id
         LEFT JOIN [HLHT_MZ_HIS].[THIS4].[dbo].[SF_MZCFK] c(nolock) on T1.cfxh=c.xh
         LEFT JOIN [HLHT_MZ_HIS].[THIS4].[dbo].[GH_GHZDK] b(nolock) on b.xh=c.ghxh
         INNER JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDER] T2(nolock) ON b.xh = T2.GHXH
         LEFT JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_JZJLK] T3(nolock) ON T2.GHXH = T3.GHXH
         LEFT JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDERITEM] T4(nolock) ON T2.XH = T4.CFXH
         LEFT JOIN [HLHT_MZ_HIS].[THIS4].[dbo].[YK_YPCDMLK] T6(nolock)  on T4.CD_IDM = T6.idm
          WHERE
          --T6.yplh IN ('004','005','006')  --需要根据医院实际情况对该口径进行修改
          T6.yplh IN ('02','03')
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
          ISNULL(CONVERT(VARCHAR,T4.XH),'NA') AS yjlxh,
          ISNULL(CONVERT(VARCHAR,T2.GHXH),'NA') AS jzlsh,
          ISNULL(CONVERT(VARCHAR,T2.PATID),'NA') AS patid,
          ISNULL(CONVERT(VARCHAR,T2.HZXM ),'NA') AS hzxm,
          ISNULL(CONVERT(VARCHAR,T2.GHXH ),'NA') AS mjzh,
          CASE WHEN RTRIM(LTRIM(T3.SFZH)) = '' THEN 'NA'
          ELSE ISNULL(CONVERT(VARCHAR,T3.SFZH ),'NA') END  AS sfzhm,
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
          ISNULL(T4.CFXH, 'NA') AS cfxh,
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
          T4.TS AS cfyxts,
          T2.KSDM AS cfklksdm,
          T2.KSMC AS cfklks,
          ISNULL(
          (SELECT TOP 1 T7.ZDDM FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T7(nolock)
          WHERE T2.GHXH = T7.GHXH AND T7.ZDLB = 0 AND T7.ZDLX = 0),
          (SELECT TOP 1 T8.ZDDM FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NMZBLZDK] T8(nolock)
          WHERE T2.GHXH = T8.GHXH AND T8.ZDLB = 0 AND T8.ZDLX = 0)) AS jbzdbm,
          ISNULL(
          (SELECT TOP 1 T9.ZDMC FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T9(nolock)
          WHERE T2.GHXH = T9.GHXH AND T9.ZDLB = 0 AND T9.ZDLX = 0 ),
          (SELECT TOP 1 T10.ZDMC FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NMZBLZDK] T10(nolock)
          WHERE T2.GHXH = T10.GHXH AND T10.ZDLB = 0 AND T10.ZDLX = 0 )) AS jbzd,
          ISNULL(
          (SELECT TOP 1 T11.ZDDM FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T11(nolock)
          WHERE T2.GHXH = T11.GHXH AND T11.ZDLB = 0 AND T11.ZDLX = 0),
          (SELECT TOP 1 T12.ZDDM FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NMZBLZDK] T12(nolock)
          WHERE T2.GHXH = T12.GHXH AND T12.ZDLB = 0 AND T12.ZDLX = 0)) AS zybmdm,
          ISNULL(
          (SELECT TOP 1 T13.ZDMC FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T13(nolock)
          WHERE T2.GHXH = T13.GHXH AND T13.ZDLB = 0 AND T13.ZDLX = 0 ),
          (SELECT TOP 1 T14.ZDMC FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NMZBLZDK] T14(nolock)
          WHERE T2.GHXH = T14.GHXH AND T14.ZDLB = 0 AND T14.ZDLX = 0 )) AS zybm,
          ISNULL(
          (SELECT T15.ZXDM FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T15(nolock)
          WHERE T2.GHXH = T15.GHXH AND T15.ZDLB = 1 AND T15.ZDLX = 0),
          (SELECT T16.ZXDM FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NMZBLZDK] T16(nolock)
          WHERE T2.GHXH = T16.GHXH AND T16.ZDLB = 1 AND T16.ZDLX = 0 )) AS zyzhdm,
          ISNULL(
          (SELECT T17.ZXMC FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_MZBLZDK] T17(nolock)
          WHERE T2.GHXH = T17.GHXH AND T17.ZDLB = 1 AND T17.ZDLX = 0),
          (SELECT T18.ZXMC FROM [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_NMZBLZDK] T18(nolock)
          WHERE T2.GHXH = T18.GHXH AND T18.ZDLB = 1 AND T18.ZDLX = 0)) AS zyzh,
          T4.YPDM AS ywdm,
          T4.YPMC AS ywmc,
          T4.YPGG AS ywgg,
          T4.JXDM AS ywjxdm,
          T4.JXMC AS ywjx,
          T4.YPJL AS ywsycjl,
          T4.JLDW AS ywsyjldw,
          T4.PCDM AS ywsypcdm,
          T4.PCMC AS ywsypc,
          T4.YPYF AS ywsytj,
          T4.YPYFMC AS ywsytjmc,
          (
          SELECT
          CASE T6.yplh
          WHEN '02' THEN
          T4.YPSL * T4.YPJL
          WHEN '03' THEN
          T4.YPSL
          ELSE
          0
          END
          ) AS ywsyzjl,
          T4.FZXH AS cfypzh,
          T4.YPMC AS zyypcf,
          'NA' AS zyypjs,
          'NA' AS zyypjzf,
          T4.PCDM AS zyyyff,
          'NA' AS zfbm,
          'NA' AS zzzf,
          T2.YSMC AS klysqm,
          T2.YSDM AS ysbm,
          T2.YSDM AS shyjsbm,
          T2.YSMC AS shyjsqm,
          T1.pyczry AS tpyjsbm,
          e.name AS tpyjsqm,
          T1.fyczyh AS hdyjsbm,
          f.name AS hdyjsqm,
          T1.fyczyh AS fyyjsbm,
          f.name AS fyyjsqm,
          ISNULL(T2.MEMO, 'NA') AS cfbzxx,
          CONVERT (
          DECIMAL (18, 2),
          (T4.YPSL * T4.YLSJ) / T4.YKXS
          ) AS cfypje,
          GETDATE() AS gxsj
         FROM #YF_NMZFYZD_TEMP T1
         LEFT JOIN [HLHT_MZ_HIS].[THIS4].[dbo].[czryk] e(nolock) on T1.pyczry=e.id
         LEFT JOIN [HLHT_MZ_HIS].[THIS4].[dbo].[czryk] f(nolock) on T1.fyczyh=f.id
         LEFT JOIN [HLHT_MZ_HIS].[THIS4].[dbo].[SF_MZCFK] c(nolock) on T1.cfxh=c.xh
         LEFT JOIN [HLHT_MZ_HIS].[THIS4].[dbo].[GH_GHZDK] b(nolock) on b.xh=c.ghxh
         INNER JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDER] T2(nolock) ON b.xh = T2.GHXH
         LEFT JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_JZJLK] T3(nolock) ON T2.GHXH = T3.GHXH
         LEFT JOIN [HLHT_MZ_CIS].[CISDB].[dbo].[OUTP_ORDERITEM] T4(nolock) ON T2.XH = T4.CFXH
         LEFT JOIN [HLHT_MZ_HIS].[THIS4].[dbo].[YK_YPCDMLK] T6(nolock)  on T4.CD_IDM = T6.idm
          WHERE
          --T6.yplh IN ('004','005','006')  --需要根据医院实际情况对该口径进行修改
          T6.yplh IN ('02','03')
          AND T3.ZDDM IS NOT NULL AND T3.ZDDM != ''
          AND T4.CD_IDM <> 0
          AND c.fybz=1 and T2.GHXH=@syxh
		--删除临时表
		DROP TABLE #YF_NMZFYZD_TEMP
	end
end
