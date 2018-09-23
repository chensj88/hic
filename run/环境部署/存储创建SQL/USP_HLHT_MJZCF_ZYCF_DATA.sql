CREATE PROCEDURE [dbo].[USP_HLHT_MJZCF_ZYCF_DATA]
  @sourceType varchar(64),   --原纪录类型
  @startDate  varchar(20),   --开始日期
  @endDate    varchar(20),   --结束日期
  @syxh       int            --首页序号
  as
  /*
  [创建者] chensj
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
          GETDATE() AS gxsj                                                             AS gxsj
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
