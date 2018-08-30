
ALTER PROCEDURE "dbo"."usp_his5_hlht_tsdata"
as
  --EMR_BRZDQK ZDLB(0:门诊诊断 1:入院诊断 2:出院诊断 3:中医入院诊断 4:中医出院诊断 5:修正诊断 6:最终诊断 7:初步诊断)

  ------24小时入出院记录------------------------------------------------------------------------------------------
  ----入院诊断1
  --  Update A
  --  Set A.rzxyzdmc=B.ZDMC,A.rzxzzdbm=B.ZDDM,tszd=isnull(tszd,'')+'rzxyzdmc,rzxzzdbm,'
  --  from [dbo].[WN_RYJL_RCYJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1 and A.rzxzzdbm is null
  ----入院诊断2(若入院诊断没有，直接取CPOE_BRSYK诊断)
  --  Update A
  --  Set A.rzxyzdmc=B.ZDMC,A.rzxzzdbm=B.ZDDM,tszd=isnull(tszd,'')+'rzxyzdmc,rzxzzdbm,'
  --  from [dbo].[WN_RYJL_RCYJL] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.rzxzzdbm is null

  ----入院中医诊断
  --  Update A
  --  Set A.rzzybmmc=B.ZDMC,A.rzzybmdm=B.ZDDM,tszd=isnull(tszd,'')+'rzzybmmc,rzzybmdm,'
  --  from [dbo].[WN_RYJL_RCYJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=3 and A.rzzybmdm is null


  ----出院诊断1
  --  Update A
  --  Set A.czxyzdmc=B.ZDMC,A.czxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'czxyzdmc,czxyzdbm,'
  --  from [dbo].[WN_RYJL_RCYJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=2 and A.czxyzdbm is null

  ----出院诊断2(若出院诊断没有，直接取入院的诊断)
  --  Update A
  --  Set A.czxyzdmc=B.ZDMC,A.czxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'czxyzdmc,czxyzdbm,'
  --  from [dbo].[WN_RYJL_RCYJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1 and A.czxyzdbm is null

  ----出院诊断3(若出院诊断没有，直接取CPOE_BRSYK诊断)
  --  Update A
  --  Set A.czxyzdmc=B.ZDMC,A.czxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'czxyzdmc,czxyzdbm,'
  --  from [dbo].[WN_RYJL_RCYJL] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.czxyzdbm is null

  ----出院中医诊断
  --  Update A
  --  Set A.czzybmmc=B.ZDMC,A.czzybmdm=B.ZDDM,tszd=isnull(tszd,'')+'czzybmmc,czzybmdm,'
  --  from [dbo].[WN_RYJL_RCYJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=4  and A.czzybmdm is null

  ----出院中医诊断(若出院中医诊断没有，直接取入院的中医诊断)
  --  Update A
  --  Set A.czzybmmc=B.ZDMC,A.czzybmdm=B.ZDDM,tszd=isnull(tszd,'')+'czzybmmc,czzybmdm,'
  --  from [dbo].[WN_RYJL_RCYJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=3  and A.czzybmdm is null


  --更新24小时入出院记录>>住院医师、主治医师、主任医师的ID，取自病案首页
  Update A
  Set A.zyysbm=B.ZYYS,A.zzysbm=B.ZZYS,A.zrysbm=B.ZRYS
  from [dbo].[HLHT_RYJL_RCYJL] A(nolock),CIS_1507..EMR_BASYK B(nolock)
  where A.syxh=B.SYXH

  ----更新24小时入出院记录>>住院医师、主治医师、主任医师的name
  Update a
  set a.zyysqm=b.name,a.zzysqm=c.name,a.zrysqm=d.name
  from  HLHT_RYJL_RCYJL a
    left join THIS4_1507..YY_ZGBMK b on a.zyysbm=b.id
    left join THIS4_1507..YY_ZGBMK c on a.zzysbm=c.id
    left join THIS4_1507..YY_ZGBMK d on a.zrysbm=d.id

  -------------------------------------------------------------------------------------------------------------------

  ------24小时入院死亡记录-------------------------------------------------------------------------------------------
  ----入院西医诊断
  --  Update A
  --  Set A.rzxyzdmc=B.ZDMC,A.rzxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'rzxyzdmc,rzxyzdbm,'
  --  from [dbo].[WN_RYJL_RYSWJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1  and A.rzxyzdbm is null

  ----入院西医诊断2(若入院诊断没有，直接取CPOE_BRSYK诊断)
  --  Update A
  --  Set A.rzxyzdmc=B.ZDMC,A.rzxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'rzxyzdmc,rzxyzdbm,'
  --  from [dbo].[WN_RYJL_RYSWJL] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.rzxyzdbm is null  and A.rzxyzdbm is null

  ----入院中医诊断
  --  Update A
  --  Set A.rzzybmmc=B.ZDMC,A.rzzybmdm=B.ZDDM,tszd=isnull(tszd,'')+'rzzybmmc,rzzybmdm,'
  --  from [dbo].[WN_RYJL_RYSWJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=3  and A.rzzybmdm is null

  ----死亡西医诊断1(直接取出院西医诊断)
  --  Update A
  --  Set A.szxyzdmc=B.ZDMC,A.szxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'szxyzdmc,szxyzdbm,'
  --  from [dbo].[WN_RYJL_RYSWJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1   and A.szxyzdbm is null

  ----死亡西医诊断2(若出院西医诊断没有，直接取CPOE_BRSYK诊断)
  --  Update A
  --  Set A.szxyzdmc=B.ZDMC,A.szxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'szxyzdmc,szxyzdbm,'
  --  from [dbo].[WN_RYJL_RYSWJL] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.szxyzdbm is null


  ----死亡中医诊断(直接取出院中医诊断)
  --  Update A
  --  Set A.szzybmmc=B.ZDMC,A.szzybmdm=B.ZDDM,tszd=isnull(tszd,'')+'szzybmmc,szzybmdm,'
  --  from [dbo].[WN_RYJL_RYSWJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=4 and A.szzybmdm is null
  -------------------------------------------------------------------------------------------------------------------

  ------病危重通知书--------------------------------------------------------------------------------------------------

  ----疾病诊断1(直接取CPOE_BRSYK诊断)
  --  Update A
  --  Set A.jbzd=B.ZDMC,A.jbzdbm=B.ZDDM,tszd=isnull(tszd,'')+'jbzd,jbzdbm,'
  --  from [dbo].[WN_ZQGZXX_BWZTZS] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.jbzdbm is null

  --------------------------------------------------------------------------------------------------------------------
  ------出院记录------------------------------------------------------------------------------------------------------
  --  --入院诊断1
  --  Update A
  --  Set A.ryzdmc=B.ZDMC,A.ryzdbm=B.ZDDM,tszd=isnull(tszd,'')+'ryzdmc,ryzdbm,'
  --  from [dbo].[WN_ZYBCJL_CYJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1 and A.ryzdbm is null

  --  --入院诊断2:入院诊断取不到,取CPOE_BRSYK
  --  Update A
  --  Set A.ryzdmc=B.ZDMC,A.ryzdbm=B.ZDDM,tszd=isnull(tszd,'')+'ryzdmc,ryzdbm,'
  --  from [dbo].[WN_ZYBCJL_CYJL] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.ryzdbm is null

  --  --出院诊断1
  --  Update A
  --  Set A.czxyzdmc=B.ZDMC,A.czxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'czxyzdmc,czxyzdbm,'
  --  from [dbo].[WN_ZYBCJL_CYJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=2 and A.czxyzdbm is null

  --  --出院诊断2(若出院诊断没有，直接取入院的诊断)
  --  Update A
  --  Set A.czxyzdmc=B.ZDMC,A.czxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'czxyzdmc,czxyzdbm,'
  --  from [dbo].[WN_ZYBCJL_CYJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1  and A.czxyzdbm is null

  --  --出院诊断3(若还没有,取CPOE_BRSYK)
  --  Update A
  --  Set A.czxyzdmc=B.ZDMC,A.czxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'czxyzdmc,czxyzdbm,'
  --  from [dbo].[WN_ZYBCJL_CYJL] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.czxyzdbm is null

  ----出院中医诊断
  --  Update A
  --  Set A.czzybmmc=B.ZDMC,A.czzybmdm=B.ZDDM,tszd=isnull(tszd,'')+'czzybmmc,czzybmdm,'
  --  from [dbo].[WN_ZYBCJL_CYJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=4  and A.czzybmdm is null

  ----出院中医诊断(若出院中医诊断没有，直接取入院的中医诊断)
  --  Update A
  --  Set A.czzybmmc=B.ZDMC,A.czzybmdm=B.ZDDM,tszd=isnull(tszd,'')+'czzybmmc,czzybmdm,'
  --  from [dbo].[WN_ZYBCJL_CYJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=3  and A.czzybmdm is null

  --------------------------------------------------------------------------------------------------------------------
  ------入院记录------------------------------------------------------------------------------------------------------
  --  --初步诊断(初步诊断CIS不分中医和西医)
  --  Update A
  --  Set A.czxyzdmc=B.ZDMC,A.czxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'czxyzdmc,czxyzdbm,'
  --  from [dbo].[WN_RYJL_JBXX] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=7  and A.czxyzdbm is null

  --  --初步诊断2:初步诊断取不到,取CPOE_BRSYK
  --  Update A
  --  Set A.czxyzdmc=B.ZDMC,A.czxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'czxyzdmc,czxyzdbm,'
  --  from [dbo].[WN_RYJL_JBXX] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.czxyzdbm is null

  --  --确定西医诊断1(最终诊断,不分中医和西医)
  --  Update A
  --  Set A.qzxyzdmc=B.ZDMC,A.qzxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'qzxyzdmc,qzxyzdbm,'
  --  from [dbo].[WN_RYJL_JBXX] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=6  and A.qzxyzdbm is null

  ----确定西医诊断2(若无最终诊断,取出院西医诊断)
  --  Update A
  --  Set A.qzxyzdmc=B.ZDMC,A.qzxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'qzxyzdmc,qzxyzdbm,'
  --  from [dbo].[WN_RYJL_JBXX] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=2  and A.qzxyzdbm is null

  --  --确定西医诊断3:出院西医诊断取不到,取CPOE_BRSYK
  --  Update A
  --  Set A.qzxyzdmc=B.ZDMC,A.qzxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'qzxyzdmc,qzxyzdbm,'
  --  from [dbo].[WN_RYJL_JBXX] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.qzxyzdbm is null


  ----确定中医诊断(若无最终诊断,取出院中医诊断)
  --  Update A
  --  Set A.qzxyzdmc=B.ZDMC,A.qzxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'qzxyzdmc,qzxyzdbm,'
  --  from [dbo].[WN_RYJL_JBXX] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=4  and qzxyzdbm is null
  --------------------------------------------------------------------------------------------------------------------
  ------首次病程------------------------------------------------------------------------------------------------------
  --  --初步诊断(初步诊断CIS不分中医和西医)
  --  Update A
  --  Set A.czxyzd=B.ZDMC,A.czxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'czxyzd,czxyzdbm,'
  --  from [dbo].[WN_ZYBCJL_SCBCJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=7  and (A.czxyzdbm='' or A.czxyzdbm is null)

  --  --初步诊断2:初步诊断取不到,取CPOE_BRSYK
  --  Update A
  --  Set A.czxyzd=B.ZDMC,A.czxyzdbm=B.ZDDM--,tszd=isnull(tszd,'')+'czxyzd,czxyzdbm,'
  --  from [dbo].[WN_ZYBCJL_SCBCJL] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and (A.czxyzdbm is null or A.czxyzdbm='')


  --  --鉴别诊断:取CPOE_BRSYK
  --  Update A
  --  Set A.jzxyzdmc=B.ZDMC,A.jzxyzdbm=B.ZDDM--,A.tszd='jzxyzdmc,jzxyzdbm,'
  --  from [dbo].[WN_ZYBCJL_SCBCJL] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.jzxyzdbm is null


  --    --诊断依据:取诊断
  --  Update A
  --  Set A.zdyj=A.czxyzd,A.zdyjdm=A.czxyzdbm--,tszd=isnull(tszd,'')+'zdyj,zdyjdm,'
  --  from [dbo].[WN_ZYBCJL_SCBCJL] A
  --  where A.zdyjdm='' or  A.zdyjdm is null

  --------------------------------------------------------------------------------------------------------------------
  ------交接班记录----------------------------------------------------------------------------------------------------
  ----入院诊断
  --  Update A
  --  Set A.rzxyzd=B.ZDMC,A.rzxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'rzxyzd,rzxyzdbm,'
  --  from [dbo].[WN_ZYBCJL_JJBJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1 and A.rzxyzdbm is null

  --  --入院诊断2:入院诊断取不到,取CPOE_BRSYK
  --  Update A
  --  Set A.rzxyzd=B.ZDMC,A.rzxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'rzxyzd,rzxyzdbm,'
  --  from [dbo].[WN_ZYBCJL_JJBJL] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.rzxyzdbm is null

  ----入院中医诊断
  --  Update A
  --  Set A.rzzybm=B.ZDMC,A.rzzybmdm=B.ZDDM,tszd=isnull(tszd,'')+'rzzybm,rzzybmdm,'
  --  from [dbo].[WN_ZYBCJL_JJBJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=3 and A.rzzybmdm is null

  ----目前诊断(取入院西医诊断)
  --  Update A
  --  Set A.mqzdxyzd=B.ZDMC,A.mqzdxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'mqzdxyzd,mqzdxyzdbm,'
  --  from [dbo].[WN_ZYBCJL_JJBJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1 and A.mqzdxyzdbm is null

  -- --目前诊断2:入院西医诊断取不到,取CPOE_BRSYK
  --  Update A
  --  Set A.mqzdxyzd=B.ZDMC,A.mqzdxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'mqzdxyzd,mqzdxyzdbm,'
  --  from [dbo].[WN_ZYBCJL_JJBJL] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.mqzdxyzdbm is null



  ----目前中医诊断(取入院中医诊断)
  --  Update A
  --  Set A.mqzdzybm=B.ZDMC,A.mqzdzybmdm=B.ZDDM,tszd=isnull(tszd,'')+'mqzdzybm,mqzdzybmdm,'
  --  from [dbo].[WN_ZYBCJL_JJBJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=3  and A.mqzdzybmdm is null
  --------------------------------------------------------------------------------------------------------------------

  ------阶段小结------------------------------------------------------------------------------------------------------
  -- --入院诊断
  --  Update A
  --  Set A.rzxyzd=B.ZDMC,A.rzxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'rzxyzd,rzxyzdbm,'
  --  from [dbo].[WN_ZYBCJL_JDXJ] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1 and A.rzxyzdbm is null

  --  --入院诊断2:入院诊断取不到,取CPOE_BRSYK
  --  Update A
  --  Set A.rzxyzd=B.ZDMC,A.rzxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'rzxyzd,rzxyzdbm,'
  --  from [dbo].[WN_ZYBCJL_JDXJ] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.rzxyzdbm is null
  --  --入院诊断3:入院诊断取不到，取出院诊断
  --  Update A
  --  Set A.rzxyzd=B.ZDMC,A.rzxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'rzxyzd,rzxyzdbm,'
  --  from [dbo].[WN_ZYBCJL_JDXJ] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=2 and A.rzxyzd=''


  --  --入院中医诊断
  --  Update A
  --  Set A.rzzybm=B.ZDMC,A.rzzybmdm=B.ZDDM,tszd=isnull(tszd,'')+'rzzybm,rzzybmdm,'
  --  from [dbo].[WN_ZYBCJL_JDXJ] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=3 and A.rzzybmdm is null

  --  --目前诊断(取入院西医诊断)
  --  Update A
  --  Set A.mqzdxyzd=B.ZDMC,A.mqzdxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'mqzdxyzd,mqzdxyzdbm,'
  --  from [dbo].[WN_ZYBCJL_JDXJ] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1 and A.mqzdxyzdbm is null

  --  --目前诊断2:入院西医诊断取不到,取CPOE_BRSYK
  --  Update A
  --  Set A.mqzdxyzd=B.ZDMC,A.mqzdxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'mqzdxyzd,mqzdxyzdbm,'
  --  from [dbo].[WN_ZYBCJL_JDXJ] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.mqzdxyzdbm is null

  ----目前中医诊断(取入院中医诊断)
  --  Update A
  --  Set A.mqzdzybm=B.ZDMC,A.mqzdxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'mqzdzybm,mqzdxyzdbm,'
  --  from [dbo].[WN_ZYBCJL_JDXJ] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=3  and A.mqzdxyzdbm is null

  --   --目前中医诊断(取最终诊断)
  --  Update A
  --  Set A.mqzdzybm=B.ZDMC,A.mqzdxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'mqzdzybm,mqzdxyzdbm,'
  --  from [dbo].[WN_ZYBCJL_JDXJ] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=6  and A.mqzdxyzdbm is null



  ---------------------------------------------------------------------------------------------------------------------
  ------抢救记录------------------------------------------------------------------------------------------------------
  ----疾病诊断
  --  Update A
  --  Set A.jbzdmc=B.ZDMC,A.jbzdbm=B.ZDDM,tszd=isnull(tszd,'')+'jbzdmc,jbzdbm,'
  --  from [dbo].[WN_ZYBCJL_QJJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1 and A.jbzdbm is null

  --  --疾病诊断2:入院西医诊断取不到,取CPOE_BRSYK
  --  Update A
  --  Set A.jbzdmc=B.ZDMC,A.jbzdbm=B.ZDDM,tszd=isnull(tszd,'')+'jbzdmc,jbzdbm,'
  --  from [dbo].[WN_ZYBCJL_QJJL] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.jbzdbm is null

  --  --手术名称\手术代码(从BRSYK中找到SYXH,术前讨论表里的SYXH是EMRXH)
  --  Update A
  --  Set A.ssczmc=B.ssmc,A.ssczbm=B.ssdm,tszd=isnull(A.tszd,'')+'ssczmc,ssczbm,'
  --  from (select C.SYXH as HISXH,W.ssczmc,W.ssczbm,W.tszd from [dbo].[WN_ZYBCJL_QJJL] W(nolock) left join CIS_HFTEST..CPOE_BRSYK C(nolock) on W.syxh=C.EMRXH) A,THIS4..SS_SSDJK B(nolock)
  --  where A.HISXH=B.syxh and (A.ssczbm is null or A.ssczbm=A.ssczmc)

  ---------------------------------------------------------------------------------------------------------------------
  -----死亡病例讨论记录------------------------------------------------------------------------------------------------
  ----死亡诊断1(取出院诊断)
  --  Update A
  --  Set A.swzdmc=B.ZDMC,A.swzdbm=B.ZDDM,A.zjswyymc=B.ZDMC,A.zjswyybm=B.ZDDM,tszd=isnull(tszd,'')+'swzdmc,swzdbm,zjswyymc,zjswyybm'
  --  from [dbo].[WN_ZYBCJL_SWBLTLJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=2  and (A.swzdbm is null  or A.zjswyybm is null)


  --  --死亡诊断2(若出院诊断没有，直接取入院的诊断)
  --  Update A
  --  Set A.swzdmc=B.ZDMC,A.swzdbm=B.ZDDM,A.zjswyymc=B.ZDMC,A.zjswyybm=B.ZDDM,tszd=isnull(tszd,'')+'swzdmc,swzdbm,zjswyymc,zjswyymc'
  --  from [dbo].[WN_ZYBCJL_SWBLTLJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1  and  (A.swzdbm is null  or A.zjswyybm is null)

  --  --死亡诊断3:入院诊断取不到,取CPOE_BRSYK
  --  Update A
  --  Set A.swzdmc=B.ZDMC,A.swzdbm=B.ZDDM,A.zjswyymc=B.ZDMC,A.zjswyybm=B.ZDDM,tszd=isnull(tszd,'')+'swzdmc,swzdbm,zjswyymc,zjswyybm'
  --  from [dbo].[WN_ZYBCJL_SWBLTLJL] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and (A.swzdbm is null  or A.zjswyybm is null)
  ---------------------------------------------------------------------------------------------------------------------
  -----死亡记录--------------------------------------------------------------------------------------------------------
  ----入院诊断
  --  Update A
  --  Set A.ryzdmc=B.ZDMC,A.zjswyymc=B.ZDMC,A.ryzdbm=B.ZDDM,A.zjswyybm=B.ZDDM,tszd=isnull(tszd,'')+'ryzdmc,zjswyymc,ryzdbm,zjswyybm'
  --  from [dbo].[WN_ZYBCJL_SWJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1 and (A.ryzdbm is null or A.zjswyybm is null)

  --  --入院诊断2:入院诊断取不到,取CPOE_BRSYK
  --  Update A
  --  Set A.ryzdmc=B.ZDMC,A.zjswyymc=B.ZDMC,A.ryzdbm=B.ZDDM,A.zjswyybm=B.ZDDM,tszd=isnull(tszd,'')+'ryzdmc,zjswyymc,ryzdbm,zjswyybm'
  --  from [dbo].[WN_ZYBCJL_SWJL] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and (A.ryzdbm is null or A.zjswyybm is null)

  ----死亡诊断1(取出院诊断)
  --  Update A
  --  Set A.swzdmc=B.ZDMC,A.zjswyymc=B.ZDMC,A.swzdbm=B.ZDDM,A.zjswyybm=B.ZDDM,tszd=isnull(tszd,'')+'swzdmc,zjswyymc,swzdbm,zjswyybm'
  --  from [dbo].[WN_ZYBCJL_SWJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=2 and A.swzdbm is null

  ----死亡诊断2(若出院诊断没有，直接取入院的诊断)
  --  Update A
  --  Set A.swzdmc=B.ZDMC,A.zjswyymc=B.ZDMC,A.swzdbm=B.ZDDM,A.zjswyybm=B.ZDDM,tszd=isnull(tszd,'')+'swzdmc,zjswyymc,swzdbm,zjswyybm'
  --  from [dbo].[WN_ZYBCJL_SWJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1   and (A.ryzdbm is null or A.zjswyybm is null)

  --  --死亡诊断3:入院诊断取不到,取CPOE_BRSYK
  --  Update A
  --  Set A.swzdmc=B.ZDMC,A.zjswyymc=B.ZDMC,A.swzdbm=B.ZDDM,A.zjswyybm=B.ZDDM,tszd=isnull(tszd,'')+'swzdmc,zjswyymc,swzdbm,zjswyybm'
  --  from [dbo].[WN_ZYBCJL_SWJL] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH  and (A.ryzdbm is null or A.zjswyybm is null)
  ---------------------------------------------------------------------------------------------------------------------

  -----会诊记录--------------------------------------------------------------------------------------------------------
  ----西医诊断(取入院诊断)
  --  Update A
  --  Set A.xyzdmc=B.ZDMC,A.xyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'xyzdmc,xyzdbm,'
  --  from [dbo].[WN_ZYBCJL_HZJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1 and A.xyzdbm is null

  --  --西医诊断2:入院诊断取不到,取CPOE_BRSYK
  --  Update A
  --  Set A.xyzdmc=B.ZDMC,A.xyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'xyzdmc,xyzdbm,'
  --  from [dbo].[WN_ZYBCJL_HZJL] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.xyzdbm is null

  ----西医中医诊断(取入院中医诊断)
  --  Update A
  --  Set A.zybmmc=B.ZDMC,A.zybmdm=B.ZDDM,tszd=isnull(tszd,'')+'zybmmc,zybmdm,'
  --  from [dbo].[WN_ZYBCJL_HZJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=3  and A.zybmdm is null

  ---------------------------------------------------------------------------------------------------------------------
  -----出院小结--------------------------------------------------------------------------------------------------------
  ----入院诊断
  --  Update A
  --  Set A.rzxyzd=B.ZDMC,A.rzxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'rzxyzd,rzxyzdbm,'
  --  from [dbo].[WN_CYXJ_CYXJ] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1 and A.rzxyzdbm is null

  --  --入院诊断2:入院诊断取不到,取CPOE_BRSYK
  --  Update A
  --  Set A.rzxyzd=B.ZDMC,A.rzxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'rzxyzd,rzxyzdbm,'
  --  from [dbo].[WN_CYXJ_CYXJ] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.rzxyzdbm is null

  ----入院中医诊断
  --  Update A
  --  Set A.rzzybm=B.ZDMC,A.rzzybmdm=B.ZDDM,tszd=isnull(tszd,'')+'rzzybm,rzzybmdm,'
  --  from [dbo].[WN_CYXJ_CYXJ] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=3 and A.rzzybmdm is null

  ----出院诊断1
  --  Update A
  --  Set A.czxyzd=B.ZDMC,A.czxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'czxyzd,czxyzdbm,'
  --  from [dbo].[WN_CYXJ_CYXJ] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=2  and A.czxyzdbm is null

  ----出院诊断2(若出院诊断没有，直接取入院的诊断)
  --  Update A
  --  Set A.czxyzd=B.ZDMC,A.czxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'czxyzd,czxyzdbm,'
  --  from [dbo].[WN_CYXJ_CYXJ] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1  and A.czxyzdbm is null

  --  --入院诊断3:入院诊断取不到,取CPOE_BRSYK
  --  Update A
  --  Set A.czxyzd=B.ZDMC,A.czxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'czxyzd,czxyzdbm,'
  --  from [dbo].[WN_CYXJ_CYXJ] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.czxyzdbm is null

  --  --出院中医诊断
  --  Update A
  --  Set A.czzybm=B.ZDMC,A.czzybmdm=B.ZDDM,tszd=isnull(tszd,'')+'czzybm,czzybmdm,'
  --  from [dbo].[WN_CYXJ_CYXJ] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=4 and A.czzybmdm is null

  --  --出院中医诊断(若出院中医诊断没有，直接取入院的中医诊断)
  --  Update A
  --  Set A.czzybm=B.ZDMC,A.czzybmdm=B.ZDDM,tszd=isnull(tszd,'')+'czzybm,czzybmdm,'
  --  from [dbo].[WN_CYXJ_CYXJ] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=3  and A.czzybmdm is null

  --  --手术名称\手术代码\麻醉代码\麻醉名称(从BRSYK中找到SYXH,术前讨论表里的SYXH是EMRXH)
  --  Update A
  --  Set A.ssjczmc=B.ssmc,A.ssczbm=B.ssdm,A.mzffdm=B.mzdm,A.mzffmc=B.mzmc,tszd=isnull(A.tszd,'')+'ssjczmc,ssczbm,mzffdm,mzffmc,'
  --  from (select C.SYXH as HISXH,W.ssjczmc,W.ssczbm,W.mzffdm,W.mzffmc,W.tszd from [dbo].[WN_CYXJ_CYXJ] W(nolock) left join CIS_HFTEST..CPOE_BRSYK C(nolock) on W.syxh=C.EMRXH) A,THIS4..SS_SSDJK B(nolock)
  --  where A.HISXH=B.syxh and (A.ssczbm is null or A.ssczbm=A.ssjczmc)


  ---------------------------------------------------------------------------------------------------------------------
  -----手术记录--------------------------------------------------------------------------------------------------------
  --  --手术名称\手术代码\手术级别代码\麻醉代码\麻醉名称
  --  Update A
  --  Set A.ssmc=B.ssmc,A.ssjczbm=B.ssdm,A.ssjbdm=B.ssdj,A.mzff=B.mzdm,A.mzffmc=B.mzmc,tszd=isnull(A.tszd,'')+'ssmc,ssjczbm,ssjbdm,mzff,mzffmc,'
  --  from (select C.SYXH as HISXH,W.ssmc,W.ssjczbm,W.ssjbdm,W.mzff,W.mzffmc,W.tszd from [dbo].[WN_ZLCZJL_YBSSJL] W(nolock) left join CIS_HFTEST..CPOE_BRSYK C(nolock) on W.syxh=C.EMRXH) A,THIS4..SS_SSDJK B(nolock)
  --  where A.HISXH=B.syxh and (A.ssjczbm is null or A.ssjczbm=A.ssmc)


  --  --术前诊断和术后诊断1(取入院诊断)
  --  Update A
  --  Set A.sqzdmc=B.ZDMC,A.sqzdbm=B.ZDDM,A.shzdmc=B.ZDMC,A.shzdbm=B.ZDDM,tszd=isnull(tszd,'')+'sqzdmc,sqzdbm,shzdmc,shzdbm,'
  --  from [dbo].[WN_ZLCZJL_YBSSJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1  and A.sqzdbm is null

  --  --术前诊断和术后诊断2
  --  Update A
  --  Set A.sqzdmc=B.ZDMC,A.sqzdbm=B.ZDDM,A.shzdmc=B.ZDMC,A.shzdbm=B.ZDDM,tszd=isnull(tszd,'')+'sqzdmc,sqzdbm,shzdmc,shzdbm,'
  --  from [dbo].[WN_ZLCZJL_YBSSJL] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.sqzdbm is null and A.sqzdbm is null



  ---------------------------------------------------------------------------------------------------------------------
  -----术后首次病程----------------------------------------------------------------------------------------------------

  --  --手术名称\手术代码\麻醉代码\麻醉名称(从BRSYK中找到SYXH,术前讨论表里的SYXH是EMRXH)
  --  Update A
  --  Set A.ssmc=B.ssmc,A.ssczbm=B.ssdm,A.mzffdm=B.mzdm,A.mzffmc=B.mzmc,tszd=isnull(A.tszd,'')+'ssmc,ssczbm,mzffdm,mzffmc,'
  --  from (select C.SYXH as HISXH,W.ssmc,W.ssczbm,W.mzffdm,W.mzffmc,W.tszd from [dbo].[WN_ZYBCJL_SHSCBCJL] W(nolock) left join CIS_HFTEST..CPOE_BRSYK C(nolock) on W.syxh=C.EMRXH) A,THIS4..SS_SSDJK B(nolock)
  --  where A.HISXH=B.syxh and (A.ssczbm is null or A.ssczbm=A.ssmc)

  --  --术后诊断(取入院诊断)
  --  Update A
  --  Set A.shzdmc=B.ZDMC,A.shzdbm=B.ZDDM,tszd=isnull(tszd,'')+'shzdmc,shzdbm,'
  --  from [dbo].[WN_ZYBCJL_SHSCBCJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1  and A.shzdbm is null

  --  --术后诊断2:入院诊断取不到,取CPOE_BRSYK
  --  Update A
  --  Set A.shzdmc=B.ZDMC,A.shzdbm=B.ZDDM,tszd=isnull(tszd,'')+'shzdmc,shzdbm,'
  --  from [dbo].[WN_ZYBCJL_SHSCBCJL] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.shzdbm is null

  --    --诊断依据:取诊断
  --  Update A
  --  Set A.zdyj=A.shzdmc,A.zdyjdm=A.shzdbm,tszd=isnull(tszd,'')+'zdyj,zdyjdm,'
  --  from [dbo].[WN_ZYBCJL_SHSCBCJL] A
  --  where A.zdyjdm='' or  A.zdyjdm is null

  ---------------------------------------------------------------------------------------------------------------------
  -----术前小结----------------------------------------------------------------------------------------------------
  --  --手术名称\手术代码\麻醉代码\麻醉名称(从BRSYK中找到SYXH,术前讨论表里的SYXH是EMRXH)
  --  Update A
  --  Set A.ssczmc=B.ssmc,A.ssczbm=B.ssdm,A.mzffdm=B.mzdm,A.mzffmc=B.mzmc,tszd=isnull(A.tszd,'')+'ssczmc,ssczbm,mzffdm,mzffmc,'
  --  from (select C.SYXH as HISXH,ssczmc,ssczbm,mzffdm,mzffmc,tszd from [dbo].[WN_ZYBCJL_SQXJ] W(nolock) left join CIS_HFTEST..CPOE_BRSYK C(nolock) on W.syxh=C.EMRXH) A,THIS4..SS_SSDJK B(nolock)
  --  where A.HISXH=B.syxh and (A.ssczbm is null or A.ssczbm=A.ssczmc)

  --  --术前诊断1(取入院诊断)
  --  Update A
  --  Set A.sqzdmc=B.ZDMC,A.sqzdbm=B.ZDDM,tszd=isnull(tszd,'')+'sqzdmc,sqzdbm,'
  --  from [dbo].[WN_ZYBCJL_SQXJ] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1  and A.sqzdbm is null

  --  --术前诊断2(若入院诊断,取CPOE_BRSYK)
  --  Update A
  --  Set A.sqzdmc=B.ZDMC,A.sqzdbm=B.ZDDM,tszd=isnull(tszd,'')+'sqzdmc,sqzdbm,'
  --  from [dbo].[WN_ZYBCJL_SQXJ] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.sqzdbm is null

  --    --诊断依据:取诊断
  --  Update A
  --  Set A.zdyj=A.sqzdmc,A.zdyjdm=A.sqzdbm,tszd=isnull(tszd,'')+'zdyj,zdyjdm,'
  --  from [dbo].[WN_ZYBCJL_SQXJ] A
  --  where A.zdyjdm='' or  A.zdyjdm is null

  ---------------------------------------------------------------------------------------------------------------------

  -----术前讨论----------------------------------------------------------------------------------------------------
  --  --手术名称\手术代码\麻醉代码\麻醉名称(从BRSYK中找到SYXH,术前讨论表里的SYXH是EMRXH)
  --  Update A
  --  Set A.ssczmc=B.ssmc,A.ssczbm=B.ssdm,A.mzffdm=B.mzdm,A.mzffmc=B.mzmc,tszd=isnull(A.tszd,'')+'ssczmc,ssczbm,mzffdm,mzffmc,'
  --  from (select C.SYXH as HISXH,ssczmc,ssczbm,mzffdm,mzffmc,tszd from [dbo].[WN_ZYBCJL_SQTL] W(nolock) left join CIS_HFTEST..CPOE_BRSYK C(nolock) on W.syxh=C.EMRXH) A,THIS4..SS_SSDJK B(nolock)
  --  where A.HISXH=B.syxh and (A.ssczbm is null or A.ssczbm=A.ssczmc)

  ----术前诊断(取入院诊断)
  --  Update A
  --  Set A.sqzdmc=B.ZDMC,A.sqzdbm=B.ZDDM,tszd=isnull(tszd,'')+'sqzdmc,sqzdbm,'
  --  from [dbo].[WN_ZYBCJL_SQTL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1  and A.sqzdbm is null

  --  --术前诊断2(若入院诊断,取CPOE_BRSYK)
  --  Update A
  --  Set A.sqzdmc=B.ZDMC,A.sqzdbm=B.ZDDM,tszd=isnull(tszd,'')+'sqzdmc,sqzdbm,'
  --  from [dbo].[WN_ZYBCJL_SQTL] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.sqzdbm is null

  ---------------------------------------------------------------------------------------------------------------------
  -----输血治疗同意书不在用--------------------------------------------------------------------------------------------------
  --  --疾病诊断：取CPOE_BRSYK
  --  Update A
  --  Set A.jbzd=B.ZDMC,A.jbzdbm=B.ZDDM,tszd=isnull(tszd,'')+'jbzd,jbzdbm,'
  --  from [dbo].[WN_ZQGZXX_SXZLTYS] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.jbzdbm is null

  ---------------------------------------------------------------------------------------------------------------------
  -----手术知情同意书--------------------------------------------------------------------------------------------------
  ----疾病诊断1(取入院诊断)
  --  Update A
  --  Set A.sqzdmc=B.ZDMC,A.sqzd=B.ZDDM,tszd=isnull(tszd,'')+'sqzdmc,sqzd,'
  --  from [dbo].[WN_ZQGZXX_SSTYS] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1  and A.sqzd is null

  --  --疾病诊断2(若入院诊断,取CPOE_BRSYK)
  --  Update A
  --  Set A.sqzdmc=B.ZDMC,A.sqzd=B.ZDDM,tszd=isnull(tszd,'')+'sqzdmc,sqzd,'
  --  from [dbo].[WN_ZQGZXX_SSTYS] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.sqzd is null


  --  Update A
  --  Set A.nssczmc=B.ssmc,A.nssbm=B.ssdm,A.nmzdm=B.mzdm,A.nmzffmc=B.mzmc,tszd=isnull(A.tszd,'')+'nssczmc,nssbm,nmzdm,nmzffmc,'
  --  from (select C.SYXH as HISXH,nssczmc,nssbm,nmzdm,nmzffmc,tszd from [dbo].[WN_ZQGZXX_SSTYS] W(nolock) left join CIS_HFTEST..CPOE_BRSYK C(nolock) on W.syxh=C.EMRXH) A,THIS4..SS_SSDJK B(nolock)
  --  where A.HISXH=B.syxh and A.nssbm is null
  ---------------------------------------------------------------------------------------------------------------------
  -----转出入记录------------------------------------------------------------------------------------------------------

  -- --入院诊断
  --  Update A
  --  Set A.rzxyzd=B.ZDMC,A.rzxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'rzxyzd,rzxyzdbm,'
  --  from [dbo].[WN_ZYBCJL_ZKJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1 and A.rzxyzdbm is null

  --  --入院诊断2:入院诊断取不到,取CPOE_BRSYK
  --  Update A
  --  Set A.rzxyzd=B.ZDMC,A.rzxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'rzxyzd,rzxyzdbm,'
  --  from [dbo].[WN_ZYBCJL_ZKJL] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.rzxyzd is null


  --  --入院中医诊断
  --  Update A
  --  Set A.rzzybm=B.ZDMC,A.rzzybmdm=B.ZDDM,tszd=isnull(tszd,'')+'rzzybm,rzzybmdm,'
  --  from [dbo].[WN_ZYBCJL_ZKJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=3 and A.rzzybmdm is null

  --  --目前诊断(取入院西医诊断)
  --  Update A
  --  Set A.mqzdxyzd=B.ZDMC,A.mqzdxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'mqzdxyzd,mqzdxyzdbm,'
  --  from [dbo].[WN_ZYBCJL_ZKJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1  and A.mqzdxyzdbm is null

  --  --目前诊断2:入院西医诊断取不到,取CPOE_BRSYK
  --  Update A
  --  Set A.mqzdxyzd=B.ZDMC,A.mqzdxyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'mqzdxyzd,mqzdxyzdbm,'
  --  from [dbo].[WN_ZYBCJL_ZKJL] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.mqzdxyzdbm is null

  ----目前中医诊断(取入院中医诊断)
  --  Update A
  --  Set A.mqzdzybm=B.ZDMC,A.mqzdzybmdm=B.ZDDM,tszd=isnull(tszd,'')+'mqzdzybm,mqzdzybmdm,'
  --  from [dbo].[WN_ZYBCJL_ZKJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=3 and A.mqzdzybmdm is null
  ---------------------------------------------------------------------------------------------------------------------
  -----转院记录------------------------------------------------------------------------------------------------------
  --  --疾病诊断1:取入院诊断
  --  Update A
  --  Set A.jbzd=B.ZDMC,A.jbzdbm=B.ZDDM,tszd=isnull(tszd,'')+'jbzd,jbzdbm,'
  --  from [dbo].[WN_ZZYJL_ZZYJL] A(nolock),CIS_HFTEST..EMR_BRZDQK B(nolock)
  --  where A.syxh=B.SYXH and B.ZDLB=1 and A.jbzdbm is null

  --  --疾病诊断2:入院诊断取不到,取CPOE_BRSYK
  --  Update A
  --  Set A.jbzd=B.ZDMC,A.jbzdbm=B.ZDDM,tszd=isnull(tszd,'')+'jbzd,jbzdbm,'
  --  from [dbo].[WN_ZZYJL_ZZYJL] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.jbzdbm is null

  --  --手术名称\手术代码
  --  Update A
  --  Set A.ssjczmc=B.ssmc,A.ssczbm=B.ssdm,tszd=isnull(A.tszd,'')+'ssjczmc,ssczbm,'
  --  from (select C.SYXH as HISXH,ssjczmc,ssczbm,tszd from [dbo].[WN_ZZYJL_ZZYJL] W(nolock) left join CIS_HFTEST..CPOE_BRSYK C(nolock) on W.syxh=C.EMRXH) A,THIS4..SS_SSDJK B(nolock)
  --  where A.HISXH=B.syxh and (A.ssczbm is null or A.ssczbm=A.ssjczmc)

  ---------------------------------------------------------------------------------------------------------------------
  -----输血病程录--------------------------------------------------------------------------------------------------
  ----疾病诊断

  --  --疾病诊断：取CPOE_BRSYK
  --  Update A
  --  Set A.jbzd=B.ZDMC,A.jbzdbm=B.ZDDM,tszd=isnull(tszd,'')+'jbzd,jbzdbm,'
  --  from [dbo].[WN_ZLCZJL_SXJL] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.jbzdbm is null
  ---------------------------------------------------------------------------------------------------------------------

  -----门诊病历--------------------------------------------------------------------------------------------------------
  ----初步诊断西医(门诊的诊断都存入JZJLK.ZDDM,门诊可以选中医也可以选西医)
  --  Update A
  --  Set A.xyzdmc=B.ZDMC,A.xyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'xyzdmc,xyzdbm,'
  --  from [dbo].[WN_MJZBL_MJZBL] A(nolock),CIS_HFTEST..OUTP_JZJLK B(nolock)
  --  where A.syxh=B.EMRXH and A.xyzdbm is null
  ---------------------------------------------------------------------------------------------------------------------
  -----急诊留观--------------------------------------------------------------------------------------------------------
  ----初步诊断西医(门诊的诊断都存入JZJLK.ZDDM,门诊可以选中医也可以选西医)
  --  Update A
  --  Set A.xyzdmc=B.ZDMC,A.xyzdbm=B.ZDDM,tszd=isnull(tszd,'')+'xyzdmc,xyzdbm,'
  --  from [dbo].[WN_MJZBL_JZLGBL] A(nolock),CIS_HFTEST..OUTP_JZJLK B(nolock)
  --  where A.syxh=B.EMRXH and A.xyzdbm is null
  ---------------------------------------------------------------------------------------------------------------------
  -----特殊检查与特殊治疗同意书----------------------------------------------------------------------------------------
  ----疾病诊断取CPOE_BRSYK
  --  Update A
  --  Set A.jbzd=B.ZDMC,A.jbzdbm=B.ZDDM,tszd=isnull(tszd,'')+'jbzd,jbzdbm,'
  --  from [dbo].[WN_ZQGZXX_TSJCZLTYS] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.jbzdbm is null
  ---------------------------------------------------------------------------------------------------------------------

  -----麻醉手术同意书----------------------------------------------------------------------------------------
  ----疾病诊断取CPOE_BRSYK
  --  Update A
  --  Set A.sqzdmc=B.ZDMC,A.sqzd=B.ZDDM,tszd=isnull(tszd,'')+'sqzdmc,sqzd,'
  --  from [dbo].[WN_ZQGZXX_MZZQTYS] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.sqzd is null
  ---------------------------------------------------------------------------------------------------------------------
  -----其他知情同意同意书----------------------------------------------------------------------------------------
  ----疾病诊断取CPOE_BRSYK
  --  Update A
  --  Set A.jbzd=B.ZDMC,A.jbzdbm=B.ZDDM,tszd=isnull(tszd,'')+'jbzd,jbzdbm,'
  --  from [dbo].[WN_ZQGZXX_QTZQTYS] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.syxh=B.EMRXH and A.jbzdbm is null
  ---------------------------------------------------------------------------------------------------------------------
  -----诊疗记录单----------------------------------------------------------------------------------------
  ----疾病诊断

  --  Update A
  --  Set A.jbzdbm=B.ZDDM,A.jbzd=B.ZDMC
  --  from [dbo].[WN_ZLCZJL_ZLJL] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
  --  where A.hissyxh=B.SYXH and (A.jbzdbm is null or A.jbzdbm='')

  --  Update A
  --  Set A.czbm=B.ssdm,A.czmc=B.ssmc,tszd=isnull(A.tszd,'')+'czbm,czmc,'
  --  from (select C.SYXH as HISXH,czmc,czbm,tszd from [dbo].[WN_ZLCZJL_ZLJL] W(nolock) left join CIS_HFTEST..CPOE_BRSYK C(nolock) on W.syxh=C.EMRXH) A,THIS4..SS_SSDJK B(nolock)
  --  where A.HISXH=B.syxh and (A.czbm is null or A.czbm=A.czmc)

  --  update WN_ZLCZJL_ZLJL set czbm='44.1301' where czmc='胃镜' or czmc='胃镜检查术' or czmc='胃镜记录' or czmc='胃镜肠镜' or czmc='胃镜+肠镜'

  ---------------------------------------------------------------------------------------------------------------------


  ----处理与患者的关系
  --update WN_RYJL_RCYJL set cszhzgxdm=8,tszd=isnull(tszd,'')+'cszhzgxdm' where cszhzgxdm is null or cszhzgxdm=''
  --update WN_RYJL_RYSWJL set cszhzgxdm=8,tszd=isnull(tszd,'')+'cszhzgxdm' where cszhzgxdm is null or cszhzgxdm=''
  --update WN_ZQGZXX_BWZTZS  set dlrhzgxdm=8,tszd=isnull(tszd,'')+'dlrhzgxdm' where dlrhzgxdm is null or dlrhzgxdm=''
  --update WN_RYJL_JBXX   set cszhzgxdm=8,tszd=isnull(tszd,'')+'cszhzgxdm' where cszhzgxdm is null or cszhzgxdm=''
  --update WN_ZQGZXX_MZZQTYS   set dlrhzgxdm=8,tszd=isnull(tszd,'')+'dlrhzgxdm' where dlrhzgxdm is null or dlrhzgxdm=''
  --update WN_ZQGZXX_QTZQTYS  set dlrhzgx=8,tszd=isnull(tszd,'')+'dlrhzgx' where dlrhzgx is null or dlrhzgx=''
  --update WN_ZQGZXX_SSTYS  set dlrhzgxdm=8,tszd=isnull(tszd,'')+'dlrhzgxdm' where dlrhzgxdm is null or dlrhzgxdm=''
  --update WN_ZQGZXX_SXZLTYS  set dlrhzgxdm=8,tszd=isnull(tszd,'')+'dlrhzgxdm' where dlrhzgxdm is null or dlrhzgxdm=''
  --update WN_ZQGZXX_TSJCZLTYS   set hzdlrgxdm=8,tszd=isnull(tszd,'')+'hzdlrgxdm' where hzdlrgxdm is null or hzdlrgxdm=''


  ----转科记录类型（1：转入 2:转出）
  --update WN_ZYBCJL_ZKJL set zkjllx=2,zkjllxmc='转出记录' where zcrq is not null and zkjllx is  null
  --update WN_ZYBCJL_ZKJL set zkjllx=1,zkjllxmc='转入记录'  where zrrq is not null and zkjllx is  null

  ----出院记录（出院日期，因历史数据有出院日期是空的，现在界面已控制成必填）
  --  Update A
  --  Set A.cyrq=B.CYRQ,tszd=isnull(tszd,'')+'cyrq'
  --  from [dbo].[WN_ZYBCJL_CYJL] A(nolock),CIS_HFTEST..EMR_BRSYK B(nolock)
  --  where A.syxh=B.SYXH and A.cyrq is null

  --  --手术记录（手术结束日期为空）
  --  update WN_ZLCZJL_YBSSJL set ssjsrq=DATEADD(hour,3, ssksrq),tszd=isnull(tszd,'')+'ssjsrq'  where ssjsrq is null


  ------处理症候代码不在EMR_SYS_ZYZDK问题--------------------------------------------------------------------------------------------
  --  update WN_RYJL_RCYJL set rzzyzhdm=NULL,rzzyzhmc=NULL  where rzzyzhdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',rzzyzhdm)=0
  --  update WN_RYJL_RCYJL set czzyzhdm=NULL,czzyzhmc=NULL  where czzyzhdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',czzyzhdm)=0
  --  update WN_RYJL_RYSWJL set rzzyzhdm=NULL,rzzyzhmc=NULL  where rzzyzhdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',rzzyzhdm)=0
  --  update WN_RYJL_RYSWJL set szzyzhdm=NULL,szzyzhmc=NULL  where szzyzhdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',szzyzhdm)=0
  --  update WN_ZYBCJL_CYJL set czzyzhdm=NULL,czzyzhmc=NULL  where czzyzhdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',czzyzhdm)=0
  --  update WN_RYJL_JBXX set czzyzhdm=NULL,czzyzhmc=NULL  where czzyzhdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',czzyzhdm)=0
  --  update WN_RYJL_JBXX set xzzyzhdm=NULL,xzzyzhmc=NULL  where xzzyzhdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',xzzyzhdm)=0
  --  update WN_RYJL_JBXX set qzzyzhdm=NULL,qzzyzhmc=NULL  where qzzyzhdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',qzzyzhdm)=0
  --  update WN_ZYBCJL_SCBCJL set czzyzhdm=NULL,czzyzh=NULL  where czzyzhdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',czzyzhdm)=0
  --  update WN_ZYBCJL_SCBCJL set jzzyzhbm=NULL,jzzyzhmc=NULL  where jzzyzhbm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',jzzyzhbm)=0
  --  update WN_ZYBCJL_JJBJL set rzzyzhdm=NULL,rzzyzh=NULL  where rzzyzhdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK)   and charindex(',',rzzyzhdm)=0
  --  update WN_ZYBCJL_JJBJL set mqzdzyzhdm=NULL,mqzdzyzh=NULL  where mqzdzyzhdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',mqzdzyzhdm)=0
  --  update WN_ZYBCJL_JDXJ set rzzyzhdm=NULL,rzzyzh=NULL  where rzzyzhdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',rzzyzhdm)=0
  --  update WN_ZYBCJL_JDXJ set mqzdzyzhdm=NULL,mqzdzyzh=NULL  where mqzdzyzhdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',mqzdzyzhdm)=0
  --  update WN_ZYBCJL_HZJL set zyzhdm=NULL,zyzhmc=NULL  where zyzhdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',zyzhdm)=0
  --  update WN_CYXJ_CYXJ set rzzyzhdm=NULL,rzzyzh=NULL  where rzzyzhdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',rzzyzhdm)=0
  --  update WN_CYXJ_CYXJ set czzyzhdm=NULL,czzyzh=NULL  where czzyzhdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',czzyzhdm)=0
  --  update WN_ZYBCJL_ZKJL set rzzyzhdm=NULL,rzzyzh=NULL  where rzzyzhdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK)  and charindex(',',rzzyzhdm)=0
  --  update WN_ZYBCJL_ZKJL set mqzdzyzhdm=NULL,mqzdzyzh=NULL  where mqzdzyzhdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',mqzdzyzhdm)=0
  --  update WN_MJZBL_MJZBL set zyzhdm=NULL,zyzhmc=NULL  where zyzhdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',zyzhdm)=0
  --  update WN_MJZBL_JZLGBL set zyzhdm=NULL,zyzhmc=NULL  where zyzhdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',zyzhdm)=0

  ------处理中医病名代码不在EMR_SYS_ZYZDK问题--------------------------------------------------------------------------------------------
  --update WN_RYJL_RCYJL set rzzybmdm=NULL,rzzybmmc=NULL  where rzzybmdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',rzzybmdm)=0
  --update WN_RYJL_RCYJL set czzybmdm=NULL,czzybmmc=NULL  where czzybmdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',czzybmdm)=0
  --update WN_RYJL_RYSWJL set rzzybmdm=NULL,rzzybmmc=NULL  where rzzybmdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',rzzybmdm)=0
  --update WN_RYJL_RYSWJL set szzybmdm=NULL,szzybmmc=NULL  where szzybmdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',szzybmdm)=0
  --update WN_ZYBCJL_CYJL set czzybmdm=NULL,czzybmmc=NULL  where czzybmdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',czzybmdm)=0
  --update WN_RYJL_JBXX set czzybmdm=NULL,czzybmmc=NULL  where czzybmdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',czzybmdm)=0
  --update WN_RYJL_JBXX set xzzybmdm=NULL,xzzybmmc=NULL  where xzzybmdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',xzzybmdm)=0
  --update WN_RYJL_JBXX set qzzybmdm=NULL,qzzybmmc=NULL  where qzzybmdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',qzzybmdm)=0
  --update WN_ZYBCJL_SCBCJL set czzybmdm=NULL,czzybm=NULL  where czzybmdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',czzybmdm)=0
  --update WN_ZYBCJL_SCBCJL set jzzybmdm=NULL,jzzybmmc=NULL  where jzzybmdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',jzzybmdm)=0
  --update WN_ZYBCJL_JJBJL set rzzybmdm=NULL,rzzybm=NULL  where rzzybmdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',rzzybmdm)=0
  --update WN_ZYBCJL_JJBJL set mqzdzybmdm=NULL,mqzdzybm=NULL  where mqzdzybmdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',mqzdzybmdm)=0
  --update WN_ZYBCJL_JDXJ set rzzybmdm=NULL,rzzybm=NULL  where rzzybmdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',rzzybmdm)=0
  --update WN_ZYBCJL_JDXJ set mqzdzybmdm=NULL,mqzdzybm=NULL  where mqzdzybmdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',mqzdzybmdm)=0
  --update WN_ZYBCJL_HZJL set zybmdm=NULL,zybmmc=NULL  where zybmdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',zybmdm)=0
  --update WN_CYXJ_CYXJ set rzzybmdm=NULL,rzzybm=NULL  where rzzybmdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',rzzybmdm)=0
  --update WN_CYXJ_CYXJ set czzybmdm=NULL,czzybm=NULL  where czzybmdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',czzybmdm)=0
  --update WN_ZYBCJL_ZKJL set rzzybmdm=NULL,rzzybm=NULL  where rzzybmdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',rzzybmdm)=0
  --update WN_ZYBCJL_ZKJL set mqzdzybmdm=NULL,mqzdzybm=NULL  where mqzdzybmdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',mqzdzybmdm)=0
  --update WN_MJZBL_MJZBL set zybmdm=NULL,zybmmc=NULL  where zybmdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',zybmdm)=0
  --update WN_MJZBL_JZLGBL set zybmdm=NULL,zybmmc=NULL  where zybmdm not in(select ZYZDDM from CIS_HFTEST..EMR_SYS_ZYZDK) and charindex(',',zybmdm)=0

  ------处理多个诊断--------------------------------------------------------------------------------------------
  --Update A Set A.rzxzzdbm=substring(A.rzxzzdbm,1,(charindex(',',A.rzxzzdbm)-1)) from [dbo].[WN_RYJL_RCYJL] A(nolock)  where charindex(',',rzxzzdbm)>0
  --Update A Set A.rzzybmdm=substring(A.rzzybmdm,1,(charindex(',',A.rzzybmdm)-1)) from [dbo].[WN_RYJL_RCYJL] A(nolock)  where charindex(',',rzzybmdm)>0
  --Update A Set A.rzzyzhdm=substring(A.rzzyzhdm,1,(charindex(',',A.rzzyzhdm)-1)) from [dbo].[WN_RYJL_RCYJL] A(nolock)  where charindex(',',rzzyzhdm)>0
  --Update A Set A.czxyzdbm=substring(A.czxyzdbm,1,(charindex(',',A.czxyzdbm)-1)) from [dbo].[WN_RYJL_RCYJL] A(nolock)  where charindex(',',czxyzdbm)>0
  --Update A Set A.czzybmdm=substring(A.czzybmdm,1,(charindex(',',A.czzybmdm)-1)) from [dbo].[WN_RYJL_RCYJL] A(nolock)  where charindex(',',czzybmdm)>0
  --Update A Set A.czzyzhdm=substring(A.czzyzhdm,1,(charindex(',',A.czzyzhdm)-1)) from [dbo].[WN_RYJL_RCYJL] A(nolock)  where charindex(',',czzyzhdm)>0
  --Update A Set A.rzxyzdbm=substring(A.rzxyzdbm,1,(charindex(',',A.rzxyzdbm)-1)) from [dbo].[WN_RYJL_RYSWJL] A(nolock)  where charindex(',',rzxyzdbm)>0
  --Update A Set A.rzzybmdm=substring(A.rzzybmdm,1,(charindex(',',A.rzzybmdm)-1)) from [dbo].[WN_RYJL_RYSWJL] A(nolock)  where charindex(',',rzzybmdm)>0
  --Update A Set A.rzzyzhdm=substring(A.rzzyzhdm,1,(charindex(',',A.rzzyzhdm)-1)) from [dbo].[WN_RYJL_RYSWJL] A(nolock)  where charindex(',',rzzyzhdm)>0
  --Update A Set A.szxyzdbm=substring(A.szxyzdbm,1,(charindex(',',A.szxyzdbm)-1)) from [dbo].[WN_RYJL_RYSWJL] A(nolock)  where charindex(',',szxyzdbm)>0
  --Update A Set A.szzybmdm=substring(A.szzybmdm,1,(charindex(',',A.szzybmdm)-1)) from [dbo].[WN_RYJL_RYSWJL] A(nolock)  where charindex(',',szzybmdm)>0
  --Update A Set A.szzyzhdm=substring(A.szzyzhdm,1,(charindex(',',A.szzyzhdm)-1)) from [dbo].[WN_RYJL_RYSWJL] A(nolock)  where charindex(',',szzyzhdm)>0
  --Update A Set A.jbzdbm=substring(A.jbzdbm,1,(charindex(',',A.jbzdbm)-1)) from [dbo].[WN_ZQGZXX_BWZTZS] A(nolock)  where charindex(',',jbzdbm)>0
  --Update A Set A.ryzdbm=substring(A.ryzdbm,1,(charindex(',',A.ryzdbm)-1)) from [dbo].[WN_ZYBCJL_CYJL] A(nolock)  where charindex(',',ryzdbm)>0
  --Update A Set A.czxyzdbm=substring(A.czxyzdbm,1,(charindex(',',A.czxyzdbm)-1)) from [dbo].[WN_ZYBCJL_CYJL] A(nolock)  where charindex(',',czxyzdbm)>0
  --Update A Set A.czzybmdm=substring(A.czzybmdm,1,(charindex(',',A.czzybmdm)-1)) from [dbo].[WN_ZYBCJL_CYJL] A(nolock)  where charindex(',',czzybmdm)>0
  --Update A Set A.czzyzhdm=substring(A.czzyzhdm,1,(charindex(',',A.czzyzhdm)-1)) from [dbo].[WN_ZYBCJL_CYJL] A(nolock)  where charindex(',',czzyzhdm)>0
  --Update A Set A.czxyzdbm=substring(A.czxyzdbm,1,(charindex(',',A.czxyzdbm)-1)) from [dbo].[WN_RYJL_JBXX] A(nolock)  where charindex(',',czxyzdbm)>0
  --Update A Set A.czzybmdm=substring(A.czzybmdm,1,(charindex(',',A.czzybmdm)-1)) from [dbo].[WN_RYJL_JBXX] A(nolock)  where charindex(',',czzybmdm)>0
  --Update A Set A.czzyzhdm=substring(A.czzyzhdm,1,(charindex(',',A.czzyzhdm)-1)) from [dbo].[WN_RYJL_JBXX] A(nolock)  where charindex(',',czzyzhdm)>0
  --Update A Set A.xzxyzdbm=substring(A.xzxyzdbm,1,(charindex(',',A.xzxyzdbm)-1)) from [dbo].[WN_RYJL_JBXX] A(nolock)  where charindex(',',xzxyzdbm)>0
  --Update A Set A.xzzybmdm=substring(A.xzzybmdm,1,(charindex(',',A.xzzybmdm)-1)) from [dbo].[WN_RYJL_JBXX] A(nolock)  where charindex(',',xzzybmdm)>0
  --Update A Set A.xzzyzhdm=substring(A.xzzyzhdm,1,(charindex(',',A.xzzyzhdm)-1)) from [dbo].[WN_RYJL_JBXX] A(nolock)  where charindex(',',xzzyzhdm)>0
  --Update A Set A.qzxyzdbm=substring(A.qzxyzdbm,1,(charindex(',',A.qzxyzdbm)-1)) from [dbo].[WN_RYJL_JBXX] A(nolock)  where charindex(',',qzxyzdbm)>0
  --Update A Set A.qzzybmdm=substring(A.qzzybmdm,1,(charindex(',',A.qzzybmdm)-1)) from [dbo].[WN_RYJL_JBXX] A(nolock)  where charindex(',',qzzybmdm)>0
  --Update A Set A.qzzyzhdm=substring(A.qzzyzhdm,1,(charindex(',',A.qzzyzhdm)-1)) from [dbo].[WN_RYJL_JBXX] A(nolock)  where charindex(',',qzzyzhdm)>0
  --Update A Set A.bzbm=substring(A.bzbm,1,(charindex(',',A.bzbm)-1)) from [dbo].[WN_RYJL_JBXX] A(nolock)  where charindex(',',bzbm)>0
  --Update A Set A.czxyzdbm=substring(A.czxyzdbm,1,(charindex(',',A.czxyzdbm)-1)) from [dbo].[WN_ZYBCJL_SCBCJL] A(nolock)  where charindex(',',czxyzdbm)>0
  --Update A Set A.czzybmdm=substring(A.czzybmdm,1,(charindex(',',A.czzybmdm)-1)) from [dbo].[WN_ZYBCJL_SCBCJL] A(nolock)  where charindex(',',czzybmdm)>0
  --Update A Set A.czzyzhdm=substring(A.czzyzhdm,1,(charindex(',',A.czzyzhdm)-1)) from [dbo].[WN_ZYBCJL_SCBCJL] A(nolock)  where charindex(',',czzyzhdm)>0
  --Update A Set A.jzxyzdbm=substring(A.jzxyzdbm,1,(charindex(',',A.jzxyzdbm)-1)) from [dbo].[WN_ZYBCJL_SCBCJL] A(nolock)  where charindex(',',jzxyzdbm)>0
  --Update A Set A.jzzybmdm=substring(A.jzzybmdm,1,(charindex(',',A.jzzybmdm)-1)) from [dbo].[WN_ZYBCJL_SCBCJL] A(nolock)  where charindex(',',jzzybmdm)>0
  --Update A Set A.jzzyzhbm=substring(A.jzzyzhbm,1,(charindex(',',A.jzzyzhbm)-1)) from [dbo].[WN_ZYBCJL_SCBCJL] A(nolock)  where charindex(',',jzzyzhbm)>0
  --Update A Set A.rzxyzdbm=substring(A.rzxyzdbm,1,(charindex(',',A.rzxyzdbm)-1)) from [dbo].[WN_ZYBCJL_JJBJL] A(nolock)  where charindex(',',rzxyzdbm)>0
  --Update A Set A.rzzybmdm=substring(A.rzzybmdm,1,(charindex(',',A.rzzybmdm)-1)) from [dbo].[WN_ZYBCJL_JJBJL] A(nolock)  where charindex(',',rzzybmdm)>0
  --Update A Set A.rzzyzhdm=substring(A.rzzyzhdm,1,(charindex(',',A.rzzyzhdm)-1)) from [dbo].[WN_ZYBCJL_JJBJL] A(nolock)  where charindex(',',rzzyzhdm)>0
  --Update A Set A.mqzdxyzdbm=substring(A.mqzdxyzdbm,1,(charindex(',',A.mqzdxyzdbm)-1)) from [dbo].[WN_ZYBCJL_JJBJL] A(nolock)  where charindex(',',mqzdxyzdbm)>0
  --Update A Set A.mqzdzybmdm=substring(A.mqzdzybmdm,1,(charindex(',',A.mqzdzybmdm)-1)) from [dbo].[WN_ZYBCJL_JJBJL] A(nolock)  where charindex(',',mqzdzybmdm)>0
  --Update A Set A.mqzdzyzhdm=substring(A.mqzdzyzhdm,1,(charindex(',',A.mqzdzyzhdm)-1)) from [dbo].[WN_ZYBCJL_JJBJL] A(nolock)  where charindex(',',mqzdzyzhdm)>0
  --Update A Set A.rzxyzdbm=substring(A.rzxyzdbm,1,(charindex(',',A.rzxyzdbm)-1)) from [dbo].[WN_ZYBCJL_JDXJ] A(nolock)  where charindex(',',rzxyzdbm)>0
  --Update A Set A.rzzybmdm=substring(A.rzzybmdm,1,(charindex(',',A.rzzybmdm)-1)) from [dbo].[WN_ZYBCJL_JDXJ] A(nolock)  where charindex(',',rzzybmdm)>0
  --Update A Set A.rzzyzhdm=substring(A.rzzyzhdm,1,(charindex(',',A.rzzyzhdm)-1)) from [dbo].[WN_ZYBCJL_JDXJ] A(nolock)  where charindex(',',rzzyzhdm)>0
  --Update A Set A.mqzdxyzdbm=substring(A.mqzdxyzdbm,1,(charindex(',',A.mqzdxyzdbm)-1)) from [dbo].[WN_ZYBCJL_JDXJ] A(nolock)  where charindex(',',mqzdxyzdbm)>0
  --Update A Set A.mqzdzybmdm=substring(A.mqzdzybmdm,1,(charindex(',',A.mqzdzybmdm)-1)) from [dbo].[WN_ZYBCJL_JDXJ] A(nolock)  where charindex(',',mqzdzybmdm)>0
  --Update A Set A.mqzdzyzhdm=substring(A.mqzdzyzhdm,1,(charindex(',',A.mqzdzyzhdm)-1)) from [dbo].[WN_ZYBCJL_JDXJ] A(nolock)  where charindex(',',mqzdzyzhdm)>0
  --Update A Set A.jbzdbm=substring(A.jbzdbm,1,(charindex(',',A.jbzdbm)-1)) from [dbo].[WN_ZYBCJL_QJJL] A(nolock)  where charindex(',',jbzdbm)>0
  --Update A Set A.shzdbm=substring(A.shzdbm,1,(charindex(',',A.shzdbm)-1)) from [dbo].[WN_ZYBCJL_SHSCBCJL] A(nolock)  where charindex(',',shzdbm)>0
  --Update A Set A.sqzdbm=substring(A.sqzdbm,1,(charindex(',',A.sqzdbm)-1)) from [dbo].[WN_ZYBCJL_SQXJ] A(nolock)  where charindex(',',sqzdbm)>0
  --Update A Set A.sqzdbm=substring(A.sqzdbm,1,(charindex(',',A.sqzdbm)-1)) from [dbo].[WN_ZYBCJL_SQTL] A(nolock)  where charindex(',',sqzdbm)>0
  --Update A Set A.zjswyybm=substring(A.zjswyybm,1,(charindex(',',A.zjswyybm)-1)) from [dbo].[WN_ZYBCJL_SWBLTLJL] A(nolock)  where charindex(',',zjswyybm)>0
  --Update A Set A.swzdbm=substring(A.swzdbm,1,(charindex(',',A.swzdbm)-1)) from [dbo].[WN_ZYBCJL_SWBLTLJL] A(nolock)  where charindex(',',swzdbm)>0
  --Update A Set A.ryzdbm=substring(A.ryzdbm,1,(charindex(',',A.ryzdbm)-1)) from [dbo].[WN_ZYBCJL_SWJL] A(nolock)  where charindex(',',ryzdbm)>0
  --Update A Set A.zjswyybm=substring(A.zjswyybm,1,(charindex(',',A.zjswyybm)-1)) from [dbo].[WN_ZYBCJL_SWJL] A(nolock)  where charindex(',',zjswyybm)>0
  --Update A Set A.swzdbm=substring(A.swzdbm,1,(charindex(',',A.swzdbm)-1)) from [dbo].[WN_ZYBCJL_SWJL] A(nolock)  where charindex(',',swzdbm)>0
  --Update A Set A.sqzdbm=substring(A.sqzdbm,1,(charindex(',',A.sqzdbm)-1)) from [dbo].[WN_ZLCZJL_MZSQFSJL] A(nolock)  where charindex(',',sqzdbm)>0
  --Update A Set A.sqzdbm=substring(A.sqzdbm,1,(charindex(',',A.sqzdbm)-1)) from [dbo].[WN_ZLCZJL_MZSHFSJL] A(nolock)  where charindex(',',sqzdbm)>0
  --Update A Set A.sqzd=substring(A.sqzd,1,(charindex(',',A.sqzd)-1)) from [dbo].[WN_ZQGZXX_MZZQTYS] A(nolock)  where charindex(',',sqzd)>0
  --Update A Set A.jbzdbm=substring(A.jbzdbm,1,(charindex(',',A.jbzdbm)-1)) from [dbo].[WN_ZQGZXX_QTZQTYS] A(nolock)  where charindex(',',jbzdbm)>0
  --Update A Set A.sqzdbm=substring(A.sqzdbm,1,(charindex(',',A.sqzdbm)-1)) from [dbo].[WN_ZLCZJL_YBSSJL] A(nolock)  where charindex(',',sqzdbm)>0
  --Update A Set A.shzdbm=substring(A.shzdbm,1,(charindex(',',A.shzdbm)-1)) from [dbo].[WN_ZLCZJL_YBSSJL] A(nolock)  where charindex(',',shzdbm)>0
  --Update A Set A.xyzdbm=substring(A.xyzdbm,1,(charindex(',',A.xyzdbm)-1)) from [dbo].[WN_ZYBCJL_HZJL] A(nolock)  where charindex(',',xyzdbm)>0
  --Update A Set A.zybmdm=substring(A.zybmdm,1,(charindex(',',A.zybmdm)-1)) from [dbo].[WN_ZYBCJL_HZJL] A(nolock)  where charindex(',',zybmdm)>0
  --Update A Set A.zyzhdm=substring(A.zyzhdm,1,(charindex(',',A.zyzhdm)-1)) from [dbo].[WN_ZYBCJL_HZJL] A(nolock)  where charindex(',',zyzhdm)>0
  --Update A Set A.rzxyzdbm=substring(A.rzxyzdbm,1,(charindex(',',A.rzxyzdbm)-1)) from [dbo].[WN_CYXJ_CYXJ] A(nolock)  where charindex(',',rzxyzdbm)>0
  --Update A Set A.rzzybmdm=substring(A.rzzybmdm,1,(charindex(',',A.rzzybmdm)-1)) from [dbo].[WN_CYXJ_CYXJ] A(nolock)  where charindex(',',rzzybmdm)>0
  --Update A Set A.rzzyzhdm=substring(A.rzzyzhdm,1,(charindex(',',A.rzzyzhdm)-1)) from [dbo].[WN_CYXJ_CYXJ] A(nolock)  where charindex(',',rzzyzhdm)>0
  --Update A Set A.czxyzdbm=substring(A.czxyzdbm,1,(charindex(',',A.czxyzdbm)-1)) from [dbo].[WN_CYXJ_CYXJ] A(nolock)  where charindex(',',czxyzdbm)>0
  --Update A Set A.czzybmdm=substring(A.czzybmdm,1,(charindex(',',A.czzybmdm)-1)) from [dbo].[WN_CYXJ_CYXJ] A(nolock)  where charindex(',',czzybmdm)>0
  --Update A Set A.czzyzhdm=substring(A.czzyzhdm,1,(charindex(',',A.czzyzhdm)-1)) from [dbo].[WN_CYXJ_CYXJ] A(nolock)  where charindex(',',czzyzhdm)>0
  --Update A Set A.sqzd=substring(A.sqzd,1,(charindex(',',A.sqzd)-1)) from [dbo].[WN_ZQGZXX_SSTYS] A(nolock)  where charindex(',',sqzd)>0
  --Update A Set A.jbzdbm=substring(A.jbzdbm,1,(charindex(',',A.jbzdbm)-1)) from [dbo].[WN_ZQGZXX_SXZLTYS] A(nolock)  where charindex(',',jbzdbm)>0
  --Update A Set A.rzxyzdbm=substring(A.rzxyzdbm,1,(charindex(',',A.rzxyzdbm)-1)) from [dbo].[WN_ZYBCJL_ZKJL] A(nolock)  where charindex(',',rzxyzdbm)>0
  --Update A Set A.rzzybmdm=substring(A.rzzybmdm,1,(charindex(',',A.rzzybmdm)-1)) from [dbo].[WN_ZYBCJL_ZKJL] A(nolock)  where charindex(',',rzzybmdm)>0
  --Update A Set A.rzzyzhdm=substring(A.rzzyzhdm,1,(charindex(',',A.rzzyzhdm)-1)) from [dbo].[WN_ZYBCJL_ZKJL] A(nolock)  where charindex(',',rzzyzhdm)>0
  --Update A Set A.mqzdxyzdbm=substring(A.mqzdxyzdbm,1,(charindex(',',A.mqzdxyzdbm)-1)) from [dbo].[WN_ZYBCJL_ZKJL] A(nolock)  where charindex(',',mqzdxyzdbm)>0
  --Update A Set A.mqzdzybmdm=substring(A.mqzdzybmdm,1,(charindex(',',A.mqzdzybmdm)-1)) from [dbo].[WN_ZYBCJL_ZKJL] A(nolock)  where charindex(',',mqzdzybmdm)>0
  --Update A Set A.mqzdzyzhdm=substring(A.mqzdzyzhdm,1,(charindex(',',A.mqzdzyzhdm)-1)) from [dbo].[WN_ZYBCJL_ZKJL] A(nolock)  where charindex(',',mqzdzyzhdm)>0
  --Update A Set A.jbzdbm=substring(A.jbzdbm,1,(charindex(',',A.jbzdbm)-1)) from [dbo].[WN_ZZYJL_ZZYJL] A(nolock)  where charindex(',',jbzdbm)>0
  --Update A Set A.jbzdbm=substring(A.jbzdbm,1,(charindex(',',A.jbzdbm)-1)) from [dbo].[WN_ZQGZXX_TSJCZLTYS] A(nolock)  where charindex(',',jbzdbm)>0
  --Update A Set A.jbzdbm=substring(A.jbzdbm,1,(charindex(',',A.jbzdbm)-1)) from [dbo].[WN_ZLCZJL_SXJL] A(nolock)  where charindex(',',jbzdbm)>0
  --Update A Set A.xyzdbm=substring(A.xyzdbm,1,(charindex(',',A.xyzdbm)-1)) from [dbo].[WN_MJZBL_MJZBL] A(nolock)  where charindex(',',xyzdbm)>0
  --Update A Set A.zybmdm=substring(A.zybmdm,1,(charindex(',',A.zybmdm)-1)) from [dbo].[WN_MJZBL_MJZBL] A(nolock)  where charindex(',',zybmdm)>0
  --Update A Set A.zyzhdm=substring(A.zyzhdm,1,(charindex(',',A.zyzhdm)-1)) from [dbo].[WN_MJZBL_MJZBL] A(nolock)  where charindex(',',zyzhdm)>0
  --Update A Set A.xyzdbm=substring(A.xyzdbm,1,(charindex(',',A.xyzdbm)-1)) from [dbo].[WN_MJZBL_JZLGBL] A(nolock)  where charindex(',',xyzdbm)>0
  --Update A Set A.zybmdm=substring(A.zybmdm,1,(charindex(',',A.zybmdm)-1)) from [dbo].[WN_MJZBL_JZLGBL] A(nolock)  where charindex(',',zybmdm)>0
  --Update A Set A.zyzhdm=substring(A.zyzhdm,1,(charindex(',',A.zyzhdm)-1)) from [dbo].[WN_MJZBL_JZLGBL] A(nolock)  where charindex(',',zyzhdm)>0
  --Update A Set A.jbzdbm=substring(A.jbzdbm,1,(charindex(',',A.jbzdbm)-1)) from [dbo].[WN_ZLCZJL_ZLJL] A(nolock)  where charindex(',',jbzdbm)>0


  ----select 'Update A Set A.'+a.YBZDBM+'=substring(A.'+a.YBZDBM+',1,(charindex('','',A.'+a.YBZDBM+')-1)) from [dbo].['+b.MBBM+'] A(nolock)
  ----where charindex('','','+a.YBZDBM+')>0'
  ----from EMR_MXBQDYB a left join EMR_MXSZB b on a.MXSZID=b.ID where a.ZHSJLB=2 or a.ZHSJLB=4

  ----抢救记录，手术\部位
  --Update A
  --Set A.ssczmc=B.SSMC,A.ssczbm=B.SSDM,A.tszd=tszd+'ssczmc,ssczbm,'
  --from  [dbo].[WN_ZYBCJL_QJJL] A(nolock) ,CIS_HFTEST..CPOE_SSYZK B(nolock)
  --where A.hissyxh=B.SYXH  and A.ssczbm is null

  --Update A
  --Set A.ssczbwmc=B.BWMC,A.ssczbwdm=B.SSZLID,A.tszd=tszd+'ssczbwmc,ssczbwdm,'
  --from  [dbo].[WN_ZYBCJL_QJJL] A(nolock) ,CIS_HFTEST..CPOE_SSYZK B(nolock)
  --where A.hissyxh=B.SYXH and A.ssczbm =B.SSDM and A.ssczbwdm is null

  --Update A
  --Set A.ssczbwmc=B.BWMC,A.ssczbwdm=B.SSZLID,A.tszd=tszd+'ssczbwmc,ssczbwdm,'
  --from  [dbo].[WN_ZYBCJL_QJJL] A(nolock) ,CIS_HFTEST..CPOE_SSYZK B(nolock)
  --where A.hissyxh=B.SYXH and A.ssczbwdm is null


  ----术后首次病程，手术\部位
  --Update A
  --Set A.ssmc=B.SSMC,A.ssczbm=B.SSDM,A.ssrq=substring(B.SQRQ,1,4)+'-'+substring(B.SQRQ,5,2)+'-'+substring(B.SQRQ,7,2)+' '+substring(B.SQRQ,9,10),A.tszd=tszd+'ssmc,ssczbm,ssrq,'
  --from  [dbo].[WN_ZYBCJL_SHSCBCJL] A(nolock) ,CIS_HFTEST..CPOE_SSYZK B(nolock)
  --where A.hissyxh=B.SYXH  and A.ssczbm is null
  ----wyz
  --Update A
  --Set A.ssbwmc=B.BWMC,A.ssmbbwdm=B.SSZLID,A.ssrq=substring(B.SQRQ,1,4)+'-'+substring(B.SQRQ,5,2)+'-'+substring(B.SQRQ,7,2)+' '+substring(B.SQRQ,9,10),A.tszd=tszd+'ssbwmc,ssbwdm,ssrq,'
  --from  [dbo].[WN_ZYBCJL_SHSCBCJL] A(nolock) ,CIS_HFTEST..CPOE_SSYZK B(nolock)
  --where A.hissyxh=B.SYXH and A.ssczbm =B.SSDM and A.ssmbbwdm is null


  --Update A
  --Set A.ssbwmc=B.BWMC,A.ssmbbwdm=B.SSZLID,A.ssrq=substring(B.SQRQ,1,4)+'-'+substring(B.SQRQ,5,2)+'-'+substring(B.SQRQ,7,2)+' '+substring(B.SQRQ,9,10),A.tszd=tszd+'ssbwmc,ssbwdm,ssrq,'
  --from  [dbo].[WN_ZYBCJL_SHSCBCJL] A(nolock) ,CIS_HFTEST..CPOE_SSYZK B(nolock)
  --where A.hissyxh=B.SYXH and A.ssmbbwdm is null

  --Update A
  --Set A.ssrq=substring(B.SQRQ,1,4)+'-'+substring(B.SQRQ,5,2)+'-'+substring(B.SQRQ,7,2)+' '+substring(B.SQRQ,9,10),A.tszd=tszd+'ssrq,'
  --from  [dbo].[WN_ZYBCJL_SHSCBCJL] A(nolock) ,CIS_HFTEST..CPOE_SSYZK B(nolock)
  --where A.hissyxh=B.SYXH and A.ssrq is null
  ----术前小结，手术\部位

  --Update A
  --Set A.ssczmc=B.SSMC,A.ssczbm=B.SSDM,A.tszd=tszd+'ssczmc,ssczbm,'
  --from  [dbo].[WN_ZYBCJL_SQXJ] A(nolock) ,CIS_HFTEST..CPOE_SSYZK B(nolock)
  --where A.hissyxh=B.SYXH  and A.ssczbm is null

  --Update A
  --Set A.ssbwmc=B.BWMC,A.ssmbbwdm=B.SSZLID,A.ssczrq=CONVERT(datetime,substring(B.SQRQ,1,4)+'-'+substring(B.SQRQ,5,2)+'-'+substring(B.SQRQ,7,2)+' '+substring(B.SQRQ,9,8)) ,A.tszd='ssbwmc,ssmbbwdm,ssczrq,'
  --from  [dbo].[WN_ZYBCJL_SQXJ] A(nolock) ,CIS_HFTEST..CPOE_SSYZK B(nolock)
  --where A.hissyxh=B.SYXH  and A.ssczbm =B.SSDM and A.ssmbbwdm is null

  --Update A
  --Set A.ssbwmc=B.BWMC,A.ssmbbwdm=B.SSZLID,A.ssczrq=CONVERT(datetime,substring(B.SQRQ,1,4)+'-'+substring(B.SQRQ,5,2)+'-'+substring(B.SQRQ,7,2)+' '+substring(B.SQRQ,9,8)) ,A.tszd='ssbwmc,ssmbbwdm,ssczrq,'
  --from  [dbo].[WN_ZYBCJL_SQXJ] A(nolock) ,CIS_HFTEST..CPOE_SSYZK B(nolock)
  --where A.hissyxh=B.SYXH  and A.ssmbbwdm is null

  ----术前讨论，手术\部位
  --Update A
  --Set A.ssczmc=B.SSMC,A.ssczbm=B.SSDM,A.tszd=tszd+'ssczmc,ssczbm,'
  --from  [dbo].[WN_ZYBCJL_SQTL] A(nolock) ,CIS_HFTEST..CPOE_SSYZK B(nolock)
  --where A.hissyxh=B.SYXH  and A.ssczbm is null

  --Update A
  --Set A.ssbwmc=B.BWMC,A.ssmbbwdm=B.SSZLID,A.ssczrq=CONVERT(datetime,substring(B.SQRQ,1,4)+'-'+substring(B.SQRQ,5,2)+'-'+substring(B.SQRQ,7,2)+' '+substring(B.SQRQ,9,8)) ,A.tszd='ssbwmc,ssmbbwdm,ssczrq,'
  --from  [dbo].[WN_ZYBCJL_SQTL] A(nolock) ,CIS_HFTEST..CPOE_SSYZK B(nolock)
  --where A.hissyxh=B.SYXH and A.ssczbm =B.SSDM and A.ssmbbwdm is null

  --Update A
  --Set A.ssbwmc=B.BWMC,A.ssmbbwdm=B.SSZLID,A.ssczrq=CONVERT(datetime,substring(B.SQRQ,1,4)+'-'+substring(B.SQRQ,5,2)+'-'+substring(B.SQRQ,7,2)+' '+substring(B.SQRQ,9,8)) ,A.tszd='ssbwmc,ssmbbwdm,ssczrq,'
  --from  [dbo].[WN_ZYBCJL_SQTL] A(nolock) ,CIS_HFTEST..CPOE_SSYZK B(nolock)
  --where A.hissyxh=B.SYXH and A.ssmbbwdm is null

  ----抢救记录
  --Update A
  --Set A.ssczbwmc=B.BWMC,A.ssczbwdm=B.SSZLID,A.tszd='ssczbwdm,ssczbwmc,'
  --from  [dbo].[WN_ZYBCJL_QJJL] A(nolock) ,CIS_HFTEST..CPOE_SSYZK B(nolock)
  --where A.hissyxh=B.SYXH and A.ssczbwdm =B.SSDM and A.ssczbwdm is null

  --Update A
  --Set A.ssczbwmc=B.BWMC,A.ssczbwdm=B.SSZLID,A.tszd='ssczbwdm,ssczbwmc,'
  --from  [dbo].[WN_ZYBCJL_QJJL] A(nolock) ,CIS_HFTEST..CPOE_SSYZK B(nolock)
  --where A.hissyxh=B.SYXH and A.ssczbwdm is null

  ----24小时入出院记录
  ----1.陈述内容可靠标志
  --update WN_RYJL_RCYJL set csnrbz='T',tszd=tszd+'csnrbz,'  where csnrbz is null
  ----2.住院医师签名
  --Update A
  --Set A.zyysqm=C.name
  --from WN_RYJL_RCYJL A(nolock),THIS4..BQ_BRCWXXK B(nolock) ,THIS4..YY_ZGBMK C(nolock)
  --where A.hissyxh=B.syxh  and B.zyysdm=C.id and (A.zyysqm is null or A.zyysqm='')


  ----24小时入院死亡记录
  ----1.死亡原因
  --update WN_RYJL_RYSWJL set swyy=szxyzdmc,tszd=tszd+'swyy,' where swyy is null or swyy=''
  ----2.住院医师签名
  --Update A
  --Set A.zyysqm=C.name
  --from WN_RYJL_RYSWJL A(nolock),THIS4..BQ_BRCWXXK B(nolock) ,THIS4..YY_ZGBMK C(nolock)
  --where A.hissyxh=B.syxh  and B.zyysdm=C.id and (A.zyysqm is null or A.zyysqm='')

  ----出院记录
  ----1.出院情况
  --update WN_ZYBCJL_CYJL set cyzztz=cyqk
  ----2.住院医师签名
  --Update A
  --Set A.zyysqm=C.name
  --from WN_ZYBCJL_CYJL A(nolock),THIS4..ZY_BCDMK B(nolock) ,THIS4..YY_ZGBMK C(nolock)
  --where A.bch=B.id and A.bqdm=B.bqdm  and B.zyysdm=C.id and (A.zyysqm is null or A.zyysqm='')
  ----3.主治医师签名
  --Update A
  --Set A.zzysqm=C.name
  --from WN_ZYBCJL_CYJL A(nolock),THIS4..ZY_BCDMK B(nolock) ,THIS4..YY_ZGBMK C(nolock)
  --where A.bch=B.id  and A.bqdm=B.bqdm and B.zzysdm=C.id and (A.zzysqm is null or A.zzysqm='')


  ----入院记录
  ----1.陈述内容可靠标志
  --update WN_RYJL_JBXX set csnrbz='T'
  ----2.体格检查（体温、脉率、呼吸频率、收缩压、舒张压、皮肤和黏膜检查结果、全身浅表淋巴结检查结果、头部及其器官检查结果、颈部检查结果、胸部检查结果、腹部检查结果、脊柱检查结果、四肢检查结果、神经系统检查结果）
  --update WN_RYJL_JBXX set tjtw='36.6', tjml='76',tjhxpl='18',tjssy='123',tjszy='70',
  --tjplmjg='全身皮肤黏膜无黄染，无瘀点，无瘀斑，肝掌(-)，蜘蛛痣(-)，无皮疹，无色素沉着，无面部毛细血管扩张',
  --tjqblbjg='浅表淋巴结：无肿大',
  --tjtbqgjg='头颅：大小正常，头颅无畸形，无压痛，无包块，无凹陷',
  --tjjbjg='颈部无抵抗，双侧对称，颈动脉正常搏动，颈静脉无怒张，气管居中，肝颈静脉回流征(-)，双侧甲状腺无肿大。',
  --tjxbjg='胸壁无静脉显露，胸廓正常、对称，呼吸平稳、节律规则',
  --tjfbjg='腹部平坦，未见手术疤痕，无腹壁静脉曲张，无胃肠型，无蠕动波，无疝气',
  --tjjzjg='脊柱正常，无畸形，活动度正常，无压痛，无叩击痛。双下肢无水肿，四肢正常，无杵状指(趾)，关节无红肿、无压痛，活动正常。',
  ----tjszjg='',
  --tjsjxtjg='膝腱反射正常，跟腱反射正常，Babinski征(-)，Kernig征(-)，扑翼样震颤(-)',
  --tszd=tszd+'tjtw,tjml,tjhxpl,tjssy,tjszy,tjplmjg,'
  --where tjtw is null
  ----3.住院医师
  --Update A
  --Set A.zyysqm=C.name
  --from WN_RYJL_JBXX A(nolock),THIS4..ZY_BCDMK B(nolock) ,THIS4..YY_ZGBMK C(nolock)
  --where A.bch=B.id and A.bqdm=B.bqdm  and B.zyysdm=C.id and (A.zyysqm is null or A.zyysqm='')
  ----4.主治医师
  --Update A
  --Set A.zzysqm=C.name
  --from WN_RYJL_JBXX A(nolock),THIS4..ZY_BCDMK B(nolock) ,THIS4..YY_ZGBMK C(nolock)
  --where A.bch=B.id  and A.bqdm=B.bqdm and B.zzysdm=C.id and (A.zzysqm is null or A.zzysqm='')

  ----首次病程
  UPDATE A SET A.sjysbm =C.ZRYSDM,A.sjysqm=C.ZRYSXM
  FROM CISDB_DATA..HLHT_ZYBCJL_SCBCJL A,CISDB..CPOE_BRSYK C
  WHERE A.jzlsh=C.SYXH AND (A.sjysbm ='N' OR A.sjysqm ='N' )




----1.住院医师
--Update A
--Set A.zyysqm=C.name
--from WN_ZYBCJL_SCBCJL A(nolock),THIS4..ZY_BCDMK B(nolock) ,THIS4..YY_ZGBMK C(nolock)
--where A.bch=B.id and A.bqdm=B.bqdm  and B.zyysdm=C.id and (A.zyysqm is null or A.zyysqm='')

----主诉
--  Update A
--  Set A.zs=B.zs
--  from [dbo].[WN_ZYBCJL_SCBCJL] A(nolock),WN_RYJL_JBXX B(nolock)
--  where A.syxh=B.syxh and (A.zs is null or A.zs='')

----2.上级医师
--update WN_ZYBCJL_SCBCJL set sjysqm='郁超',tszd=tszd+'sjysqm,' where sjysqm is null or sjysqm=''

----日常病程
--Update A
--Set A.ysqm=C.name
--from WN_ZYBCJL_RCBCJL A(nolock),THIS4..ZY_BCDMK B(nolock) ,THIS4..YY_ZGBMK C(nolock)
--where A.bch=B.id and A.bqdm=B.bqdm  and B.zyysdm=C.id

----阶段小结
----1.医师签名
--Update A
--Set A.ysqm=C.name
--from WN_ZYBCJL_JDXJ A(nolock),THIS4..ZY_BCDMK B(nolock) ,THIS4..YY_ZGBMK C(nolock)
--where A.bch=B.id and A.bqdm=B.bqdm  and B.zyysdm=C.id and (A.ysqm is null or A.ysqm='')


----抢救记录
----1.参加抢救人员名单
--update WN_ZYBCJL_QJJL set cjqjrymd='曹宏文、张仁芳、刘敏、张占卿、当班护士',tszd=tszd+'cjqjrymd,'  where cjqjrymd is null or cjqjrymd=''
----2.医师签名
--Update A
--Set A.ysqm=C.name
--from WN_ZYBCJL_QJJL A(nolock),THIS4..ZY_BCDMK B(nolock) ,THIS4..YY_ZGBMK C(nolock)
--where A.bch=B.id and A.bqdm=B.bqdm  and B.zyysdm=C.id and (A.ysqm is null or A.ysqm='')

----术后首次病程
----2.医师签名
--Update A
--Set A.ysqm=C.name
--from WN_ZYBCJL_SHSCBCJL A(nolock),THIS4..ZY_BCDMK B(nolock) ,THIS4..YY_ZGBMK C(nolock)
--where A.bch=B.id and A.bqdm=B.bqdm  and B.zyysdm=C.id and (A.ysqm is null or A.ysqm='')

----术前小结
----1.手术要点
--update WN_ZYBCJL_SQXJ set ssyd=substring(zysx,1,200)
----2.医师签名
--update WN_ZYBCJL_SQXJ set ysqm='郁超',tszd=tszd+'ysqm,'  where ysqm is null or ysqm=''
----3.手术者签名
--update WN_ZYBCJL_SQXJ set sszqm='刘一山' ,tszd=tszd+'sszqm,' where sszqm is null or sszqm=''

----术前讨论
----1.手术要点
--update WN_ZYBCJL_SQTL set ssyd=substring(zysx,1,200)
----2.医师签名
--update WN_ZYBCJL_SQTL set ysqm='郁超',tszd=tszd+'ysqm,'  where ysqm is null or ysqm=''
----3.手术者签名
--update WN_ZYBCJL_SQTL set sszqm='刘一山' ,tszd=tszd+'sszqm,'  where sszqm is null or sszqm=''

----死亡病例讨论
----1.主持人
--update WN_ZYBCJL_SWBLTLJL set zcrxm='曹宏文',tszd=tszd+'zcrxm,'  where zcrxm is null or zcrxm=''
----2.参加讨论人员名单
--update WN_ZYBCJL_SWBLTLJL set cjtlmd='郁超副主任医师、曹宏文住院医师、唐红住院医师，当班护士',tszd=tszd+'cjtlmd,'   where cjtlmd is null or cjtlmd=''
----3.直接死亡原因
--update WN_ZYBCJL_SWBLTLJL set zjswyymc=swzdmc,zjswyybm=swzdbm ,tszd=tszd+'zjswyymc,zjswyybm,' where zjswyymc is null or zjswyymc=''

----死亡记录
----1.家属是否同意尸剖
--update WN_ZYBCJL_SWJL set jstysjbz='F'
----2.住院医师
--Update A
--Set A.zyysqm=C.name
--from WN_ZYBCJL_SWJL A(nolock),THIS4..ZY_BCDMK B(nolock) ,THIS4..YY_ZGBMK C(nolock)
--where A.bch=B.id and A.bqdm=B.bqdm  and B.zyysdm=C.id and (A.zyysqm is null or A.zyysqm='')
----3.主治医师
--Update A
--Set A.zzysqm=C.name
--from WN_ZYBCJL_SWJL A(nolock),THIS4..ZY_BCDMK B(nolock) ,THIS4..YY_ZGBMK C(nolock)
--where A.bch=B.id  and A.bqdm=B.bqdm and B.zzysdm=C.id and (A.zzysqm is null or A.zzysqm='')
----4.主任医师
--Update A
--Set A.zrysqm=C.name
--from WN_ZYBCJL_SWJL A(nolock),THIS4..ZY_BCDMK B(nolock) ,THIS4..YY_ZGBMK C(nolock)
--where A.bch=B.id  and A.bqdm=B.bqdm and B.zzysdm=C.id and (A.zrysqm is null or A.zrysqm='')
----5.死亡日期(在提交病历的时间
--update WN_ZYBCJL_SWJL set qmrq=DATEADD(hh,1,swrq),tszd=tszd+'qmrq,' where qmrq is null

----手术记录
----手术开始日期和手术结束日期
--Update A
--Set A.ssksrq=CONVERT(datetime,substring(B.aprq,1,4)+'-'+substring(B.aprq,5,2)+'-'+substring(B.aprq,7,2)+' '+substring(B.aprq,9,8))
--from [dbo].[WN_ZLCZJL_YBSSJL] A(nolock),THIS4..SS_SSDJK B(nolock)
--where A.hissyxh=B.syxh  and A.ssjczbm=B.ssdm and B.aprq is not null and A.ssksrq is null
--Update   [WN_ZLCZJL_YBSSJL] set ssjsrq=dateadd(hh,3,ssksrq) where ssjsrq is null


----麻醉知情同意书
----1.医疗机构意见
--update WN_ZQGZXX_MZZQTYS set yljgyj='同意',tszd=tszd+'yljgyj,' where yljgyj is null  or yljgyj=''

----其他知情同意书
----1.医疗机构意见
--update WN_ZQGZXX_QTZQTYS set yljgyj='同意',tszd=tszd+'yljgyj,' where yljgyj is null  or yljgyj=''
----2.法定代理人意见
--update WN_ZQGZXX_QTZQTYS set dlryj='同意',tszd=tszd+'dlryj,' where dlryj is null or dlryj=''

----手术记录
----1.I助姓名 II助姓名 械护
--update WN_ZLCZJL_YBSSJL set yzxm='吴春宇',tszd=tszd+'yzxm,' where yzxm is null or yzxm=''
--update WN_ZLCZJL_YBSSJL set ezxm='鲍以嘉',tszd=tszd+'ezxm,' where ezxm is null or ezxm=''
--update WN_ZLCZJL_YBSSJL set qxhsxm='董立',tszd=isnull(tszd,'')+'qxhsxm,' where qxhsxm is null
----2.手术者
--update WN_ZLCZJL_YBSSJL set sszxm='曹永清',sszqm='曹永清',tszd=tszd+'sszqm,sszxm,' where sszqm is null or sszqm=''

----会诊记录
----1.诊疗过程名称
--update WN_ZYBCJL_HZJL set zlgcmc='对'+xyzdmc+'进行诊疗' where zlgcmc is null
----2.会诊类型
--update WN_ZYBCJL_HZJL set hzlx='院内会诊',tszd=tszd+'hzlx,'  where hzlx is null
----3.会诊申请医师签名
--update WN_ZYBCJL_HZJL set hzsqysqm='曹宏文',tszd=tszd+'hzsqysqm,'  where hzsqysqm is null
----4.会诊申请科室
--update WN_ZYBCJL_HZJL set hzsqks=ksmc,hzsqksdm=ksdm,tszd=tszd+'hzsqysqm,hzsqksdm,'  where hzsqksdm is null
----5.会诊申请医院机构
--update WN_ZYBCJL_HZJL set sqyljgdm='42502634500',hzsqyljgmc='上海龙华医院',hzyljgdm='42502634500',hzysyljgmc='上海龙华医院',hzszyljgdm='42502634500',hzszyljgmc='上海龙华医院' where sqyljgdm is null
----6.会诊医师签名
--update WN_ZYBCJL_HZJL set hzysqm='郁超',tszd=tszd+'hzysqm,'  where hzysqm is null
----7.会诊所在医院机构，会诊医师所在医疗机构
--update WN_ZYBCJL_HZJL set hzyljgdm='42502634500',hzysyljgmc='上海龙华医院',hzszyljgdm='42502634500',hzszyljgmc='上海龙华医院' where hzyljgdm is null
----8.会诊原因
--update WN_ZYBCJL_HZJL set hzmd=hzyy where hzmd is null or hzmd=''
----出院小结
----1.住院医师
--Update A
--Set A.zyysqm=C.name
--from WN_CYXJ_CYXJ A(nolock),THIS4..ZY_BCDMK B(nolock) ,THIS4..YY_ZGBMK C(nolock)
--where A.bch=B.id and A.bqdm=B.bqdm  and B.zyysdm=C.id and (A.zyysqm is null or A.zyysqm='')
----2.上级医师
--update WN_CYXJ_CYXJ set sjysqm='郁超' ,tszd=tszd+'sjysqm,' where sjysqm is null  or sjysqm=''
----3.手术切口类别等级,SSKSSJ
--Update A
--Set A.ssqklbdm=B.QKDJ,A.qkyhdjdm=B.YHLB ,tszd=tszd+'ssqklbdm,qkyhdjdm,'
--from [dbo].[WN_CYXJ_CYXJ] A(nolock),CIS_HFTEST..EMR_BASY_SSK B(nolock)
--where A.syxh=B.SYXH and (A.ssqklbdm is null or A.qkyhdjdm is null)
----无菌切口
--Update [dbo].[WN_CYXJ_CYXJ] Set ssqklbdm='2',qkyhdjdm='9',tszd=tszd+'ssqklbdm,qkyhdjdm,' where ssqklbdm is null or qkyhdjdm is null

----上级医师查房记录
----1.主治医师
--update WN_ZYBCJL_SJYSCFJL set zzysqm='唐红',tszd=tszd+'zzysqm,' where zzysqm is null   or zzysqm=''
----2.主任医师
--update WN_ZYBCJL_SJYSCFJL set zrysqm='郁超',tszd=tszd+'zrysqm,' where zrysqm is null  or zrysqm=''

----手术知情同意书
----1.医疗机构意见
--update WN_ZQGZXX_SSTYS set yljgyj='同意',tszd=tszd+'yljgyj,' where yljgyj is null or yljgyj=''

----2.法定代理人意见
--update WN_ZQGZXX_SSTYS set hzdlryj='同意',tszd=tszd+'hzdlryj,' where hzdlryj is null or hzdlryj=''

----3.法定代理人签名
--update WN_ZQGZXX_SSTYS set dlrqm=hzxm,tszd=tszd+'dlrqm,' where dlrqm is null  or dlrqm=''
----4.手术者签名
--update WN_ZQGZXX_SSTYS set sszqm='唐红',tszd=tszd+'sszqm,' where sszqm is null or sszqm=''


----输血治疗同意书
----1.医疗机构意，法定代理人意见
--update WN_ZQGZXX_SXZLTYS set yljgyj='同意',hzdlryj='同意',tszd=tszd+'yljgyj,' where yljgyj is null or  yljgyj=''
----2.法定代理人签名
--update WN_ZQGZXX_SXZLTYS set hzdlrqm=hzxm,tszd=tszd+'hzdlrqm,' where hzdlrqm is null or hzdlrqm=''

----疑难病例讨论
----1.主持人姓名
--update WN_ZYBCJL_YNBLTLJL set zcrxm='曹宏文',tszd=tszd+'zcrxm,'  where zcrxm is null or zcrxm=''
----2.医生签名
--Update A
--Set A.ysqm=C.name
--from WN_ZYBCJL_YNBLTLJL A(nolock),THIS4..ZY_BCDMK B(nolock) ,THIS4..YY_ZGBMK C(nolock)
--where A.bch=B.id  and A.bqdm=B.bqdm and B.zzysdm=C.id and (A.ysqm is null or A.ysqm='')
----3.主治医师签名
--Update A
--Set A.zzysqm=C.name
--from WN_ZYBCJL_YNBLTLJL A(nolock),THIS4..ZY_BCDMK B(nolock) ,THIS4..YY_ZGBMK C(nolock)
--where A.bch=B.id  and A.bqdm=B.bqdm and B.zzysdm=C.id and (A.zzysqm is null or A.zzysqm='')
----4.主任医师签名
--Update A
--Set A.zrysqm=C.name
--from WN_ZYBCJL_YNBLTLJL A(nolock),THIS4..ZY_BCDMK B(nolock) ,THIS4..YY_ZGBMK C(nolock)
--where A.bch=B.id  and A.bqdm=B.bqdm and B.zzysdm=C.id and (A.zrysqm is null or A.zrysqm='')
--update WN_ZYBCJL_YNBLTLJL set zrysqm='郁超',tszd=tszd+'zrysqm,'  where zrysqm is null or zrysqm=''

----转科记录
----1.转出医生签名
--update WN_ZYBCJL_ZKJL set zcysqm='刘长明',tszd=tszd+'zcysqm,'  where zcysqm is null or zcysqm=''
----2.转入医生签名
--update WN_ZYBCJL_ZKJL set zrysqm='李治祥',tszd=tszd+'zrysqm,'   where zrysqm is null or zrysqm=''

----特殊检查及特殊治疗同意书
----1.特殊检查治疗项目名称
--Update A
--Set A.jczlxmmc=REPLACE(REPLACE(B.BLMC,'检查同意书(',''),'同意书)','')
--from [dbo].[WN_ZQGZXX_TSJCZLTYS] A(nolock),CIS_HFTEST..EMR_QTBLJLK B(nolock)
--where A.syxh=B.SYXH and A.blxh=B.QTBLJLXH
--update [WN_ZQGZXX_TSJCZLTYS] set jczlxmmc=REPLACE(jczlxmmc,'知情','')
--update [WN_ZQGZXX_TSJCZLTYS] set jczlxmmc=REPLACE(jczlxmmc,'同意书','')
----2.法定代理人签名
--update [dbo].[WN_ZQGZXX_TSJCZLTYS] set hzdlrqm=hzxm,tszd=tszd+'hzdlrqm,'  where hzdlrqm is null or hzdlrqm=''
----3.医师签名
--Update A
--Set A.ysqm=C.name
--from [WN_ZQGZXX_TSJCZLTYS] A(nolock),THIS4..ZY_BCDMK B(nolock) ,THIS4..YY_ZGBMK C(nolock)
--where A.bch=B.id  and A.bqdm=B.bqdm and B.zzysdm=C.id and (A.ysqm is null or A.ysqm='')
--update [dbo].[WN_ZQGZXX_TSJCZLTYS] set ysqm='唐红',tszd=tszd+'ysqm,'  where ysqm is null or ysqm=''

----输血病程记录
----1.ABO血型代码
--update WN_ZLCZJL_SXJL set aboxx='1',aboxxmc='A型',tszd=tszd+'aboxxmc,' where aboxx is null or aboxx=''
----2.RH血型代码
--update WN_ZLCZJL_SXJL set rhxx='1',aboxxmc='阴性',tszd=tszd+'aboxxmc,' where rhxx is null or rhxx=''
----3.输血史标识代码
--Update WN_ZLCZJL_SXJL set sxsbz='1',tszd=tszd+'sxsbz,' where sxsbz is null or sxsbz=''
----4.输血性质代码
--Update WN_ZLCZJL_SXJL set sxxzdm='1',sxxzmc='备血',tszd=tszd+'sxxzmc,sxxzdm,' where sxxzdm is null or sxxzdm=''
----5.申请ABO血型代码
--update WN_ZLCZJL_SXJL set sqaboxx='1',sqaboxxmc='A型',tszd=tszd+'sqaboxx,sqaboxxmc,'  where sqaboxx is null or sqaboxx=''
----6.申请RH血型代码
--update WN_ZLCZJL_SXJL set sqrhxx='1',sqrhxxmc='阴性',tszd=tszd+'sqrhxx,sqrhxxmc,' where sqrhxx is null or sqrhxx=''
----7.输血指征
--update WN_ZLCZJL_SXJL set sxzz='有输血指征',tszd=tszd+'sxzz,' where sxzz is null or sxzz=''
----8.输血品种代码\血袋编码
--update WN_ZLCZJL_SXJL set sxpzdm='1',sxpzmc='红细胞',xdbm=blxh where sxpzdm is null or sxpzdm=''
----9.输血计量单位\输血反应标志\输血次数\输血原因
--update WN_ZLCZJL_SXJL set sxljldw='ml',sxfybz='9',sxcs=0,sxyy='有输血指征',ysqm='杨吉勇' where sxljldw is null or sxljldw=''

----门诊病历
----1.医生签名
--update WN_MJZBL_MJZBL set ysqm='连真'  where ysqm is null

----诊疗记录单
----1.疾病诊断取CPOE_BRSYK
--  Update A
--  Set A.jbzd=B.ZDMC,A.jbzdbm=B.ZDDM
--  from [dbo].[WN_ZLCZJL_ZLJL] A(nolock),CIS_HFTEST..CPOE_BRSYK B(nolock)
--  where A.syxh=B.EMRXH and A.jbzdbm is null
----2.医嘱执行者签名
--  update  [dbo].[WN_ZLCZJL_ZLJL] set yzzxzqm='曹宏文'

-- --出院小结
-- --治疗结果
-- Update WN_CYXJ_CYXJ set zljgdm=1 where zljgdm is null



-------------------------------------------处理房间号---------------------------------------------------

--Update A Set A.bfh=B.fjh from [dbo].[WN_ZQGZXX_BWZTZS] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZYBCJL_CYJL] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_RYJL_JBXX] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZYBCJL_SCBCJL] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZYBCJL_RCBCJL] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZYBCJL_JJBJL] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZYBCJL_JDXJ] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZYBCJL_QJJL] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZYBCJL_SHSCBCJL] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bhf=B.fjh from [dbo].[WN_ZYBCJL_SQXJ] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bhf is null or A.bhf='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZYBCJL_SQTL] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZYBCJL_SWBLTLJL] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZYBCJL_SWJL] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZLCZJL_MZSQFSJL] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZLCZJL_MZSHFSJL] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZQGZXX_MZZQTYS] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZQGZXX_QTZQTYS] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZLCZJL_YBSSJL] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZYBCJL_HZJL] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_CYXJ_CYXJ] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZYBCJL_SJYSCFJL] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZQGZXX_SSTYS] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZQGZXX_SXZLTYS] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZYBCJL_YNBLTLJL] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZYBCJL_ZKJL] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZQGZXX_TSJCZLTYS] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZLCZJL_SXJL] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZLCZJL_ZLJL] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')
--Update A Set A.bfh=B.fjh from [dbo].[WN_ZCJL_PGC] A(nolock),THIS4..ZY_BCDMK B(nolock) where A.bch=B.id and (A.bfh is null or A.bfh='')

