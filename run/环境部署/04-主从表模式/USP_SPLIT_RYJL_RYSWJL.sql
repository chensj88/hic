ALTER PROCEDURE [dbo].[USP_SPLIT_RYJL_RYSWJL]
    @yljgdm     varchar(20),    --医疗机构代码
    @regex		varchar(20) 	--分割符
as
  begin
	if exists (select 1 from  tempdb..sysobjects where  id = object_id('tempdb..#DC_RYJL_RYSWJL'))
	drop table #DC_RYJL_RYSWJL
	if exists (select 1 from  tempdb..sysobjects where  id = object_id('tempdb..#DC_RYJL_RYSWJL_ZYSZGCJG'))
	drop table #DC_RYJL_RYSWJL_ZYSZGCJG
	if exists (select 1 from  tempdb..sysobjects where  id = object_id('tempdb..#DC_RYJL_RYSWJL_RYZYZD'))
	drop table #DC_RYJL_RYSWJL_RYZYZD
	if exists (select 1 from  tempdb..sysobjects where  id = object_id('tempdb..#DC_RYJL_RYSWJL_RYXYZD'))
	drop table #DC_RYJL_RYSWJL_RYXYZD
	if exists (select 1 from  tempdb..sysobjects where  id = object_id('tempdb..#DC_RYJL_RYSWJL_SWZYZD'))
	drop table #DC_RYJL_RYSWJL_SWZYZD
	if exists (select 1 from  tempdb..sysobjects where  id = object_id('tempdb..#DC_RYJL_RYSWJL_SWXYZD'))
	drop table #DC_RYJL_RYSWJL_SWXYZD

	--主表操作
	create table #DC_RYJL_RYSWJL (    
		xh                   numeric(12)          identity(1, 1)/* 序号  */,
		yljgdm               varchar(20)          not null/* 医疗机构代码  */,
		jzlsh                varchar(64)          not null/* 就诊流水号 */,
		patid                varchar(64)          not null/* 患者patid */,
		zyh                  varchar(64)          not null/* 住院号 */,
		yjlxh                varchar(64)          not null/* 源记录序号 */,
		hzxm                 varchar(50)          not null/* 患者姓名 */,
		sfzhm                varchar(18)          not null/* 身份证号 */,
		xbmc                 varchar(16)          not null/* 性别名称 */,
		xbdm                 varchar(2)           not null/* 性别代码 */,
		nls                  numeric(3)           not null/* 年龄（岁） */,
		nly                  varchar(8)           null/* 年龄（月） */,
		mz                   varchar(2)           null/* 民族 */,
		mzmc                 varchar(32)          null/* 民族名称 */,
		hyzkdm               varchar(2)           null/* 婚姻状况代码 */,
		hyzkmc               varchar(32)          null/* 婚姻状况名称 */,
		dzsf                 varchar(70)          not null/* 地址-省（自治区、直辖市） */,
		dzsq                 varchar(70)          not null/* 地址-市（地区、州） */,
		dzx                  varchar(70)          not null/* 地址-县（区） */,
		dzxz                 varchar(70)          not null/* 地址-乡（镇、街道办事处） */,
		dzc                  varchar(70)          not null/* 地址-村（街、路、弄等） */,
		dzmphm               varchar(70)          not null/* 地址-门牌号码 */,
		zylbdm               varchar(2)           null/* 职业类别代码 */,
		zylbmc               varchar(50)          null/* 职业类别名称 */,
		bscszxm              varchar(50)          not null/* 病史陈述者姓名 */,
		cszhzgxdm            varchar(2)           not null/* 陈述者与患者的关系代码 */,
		cszhzgxmc            varchar(50)          not null/* 陈述者与患者的关系名称 */,
		csnrbz               char(1)              not null/* 陈述内容可靠标志 */,
		ryrq                 datetime             not null/* 入院日期时间 */,
		swrq                 datetime             not null/* 死亡日期时间 */,
		ryqk                 nvarchar(2000)       not null/* 入院情况 */,
		zfbm                 varchar(20)          null/* 治则治法代码 */,
		zzzf                 nvarchar(100)        null/* 治则治法 */,
		zlgcms               nvarchar(2000)       not null/* 诊疗过程描述 */,
		swyy                 nvarchar(100)        not null/* 死亡原因 */,
		jzysbm               varchar(20)          not null/* 接诊医师编码 */,
		jzysqm               varchar(50)          not null/* 接诊医师签名 */,
		zyysbm               varchar(20)          not null/* 住院医师编码 */,
		zyysqm               varchar(50)          not null/* 住院医师签名 */,
		zzysbm               varchar(20)          not null/* 主治医师编码 */,
		zzysqm               varchar(50)          not null/* 主治医师签名 */,
		zrysbm               varchar(20)          not null/* 主任医师编码 */,
		zrysqm               varchar(50)          not null/* 主任医师签名 */,
		[createtime] [datetime] NULL,
		[gxrq] [datetime] NOT NULL,
		[sys_id] [varchar](50) NOT NULL
	  )
	  INSERT INTO #DC_RYJL_RYSWJL (
		yljgdm,jzlsh,patid,zyh,yjlxh,hzxm,sfzhm,xbmc,xbdm,nls,nly,mz,mzmc,hyzkdm,hyzkmc,
		dzsf,dzsq,dzx,dzxz,dzc,dzmphm,zylbdm,zylbmc,bscszxm,
		cszhzgxdm,cszhzgxmc,csnrbz,ryrq,swrq,ryqk,zfbm,zzzf,zlgcms,
		swyy,jzysbm,jzysqm,zyysbm,zyysqm,zzysbm,zzysqm,zrysbm,zrysqm,
		createtime,gxrq,sys_id ) 
		SELECT
		@yljgdm AS yljgdm,CONVERT ( VARCHAR ( 64 ), jzlsh ) AS jzlsh,
		CONVERT ( VARCHAR ( 64 ), patid ) AS patid,		CONVERT ( VARCHAR ( 64 ), zyh ) AS zyh,
		CONVERT ( VARCHAR ( 64 ), yjlxh ) AS yjlxh,		CONVERT ( VARCHAR ( 50 ), hzxm ) AS hzxm,
		CONVERT ( VARCHAR ( 18 ), sfzhm ) AS sfzhm,		CONVERT ( VARCHAR ( 16 ), xbmc ) AS xbmc,
		CONVERT ( VARCHAR ( 2 ), xbdm ) AS xbdm,		CONVERT ( NUMERIC ( 3, 0 ), nls ) AS nls,
		CONVERT ( VARCHAR ( 8 ), nly ) AS nly,		CONVERT ( VARCHAR ( 2 ), mz ) AS mz,
		CONVERT ( VARCHAR ( 32 ), mzmc ) AS mzmc,		CONVERT ( VARCHAR ( 2 ), hyzkdm ) AS hyzkdm,
		CONVERT ( VARCHAR ( 32 ), hyzkmc ) AS hyzkmc,		CONVERT ( VARCHAR ( 70 ), dzsf ) AS dzsf,
		CONVERT ( VARCHAR ( 70 ), dzsq ) AS dzsq,		CONVERT ( VARCHAR ( 70 ), dzx ) AS dzx,
		CONVERT ( VARCHAR ( 70 ), dzxz ) AS dzxz,		CONVERT ( VARCHAR ( 70 ), dzc ) AS dzc,
		CONVERT ( VARCHAR ( 70 ), dzmphm ) AS dzmphm,		CONVERT ( VARCHAR ( 2 ), zylbdm ) AS zylbdm,
		CONVERT ( VARCHAR ( 50 ), zylbmc ) AS zylbmc,		CONVERT ( VARCHAR ( 50 ), bscszxm ) AS bscszxm,
		CONVERT ( VARCHAR ( 2 ), cszhzgxdm ) AS cszhzgxdm,
		CONVERT ( VARCHAR ( 50 ), cszhzgxmc ) AS cszhzgxmc,
		CONVERT ( CHAR ( 1 ), csnrbz ) AS csnrbz,		CONVERT ( datetime, ryrq ) AS ryrq,
		CONVERT ( datetime, swrq ) AS swrq,		CONVERT ( nvarchar ( 2000 ), ryqk ) AS ryqk,
		CONVERT ( VARCHAR ( 20 ), zfbm ) AS zfbm,		CONVERT ( nvarchar ( 100 ), zzzf ) AS zzzf,
		CONVERT ( nvarchar ( 2000 ), zlgcms ) AS zlgcms,		CONVERT ( nvarchar ( 100 ), swyy ) AS swyy,
		CONVERT ( VARCHAR ( 20 ), jzysbm ) AS jzysbm,		CONVERT ( VARCHAR ( 50 ), jzysqm ) AS jzysqm,
		CONVERT ( VARCHAR ( 20 ), zyysbm ) AS zyysbm,		CONVERT ( VARCHAR ( 50 ), zyysqm ) AS zyysqm,
		CONVERT ( VARCHAR ( 20 ), zzysbm ) AS zzysbm,		CONVERT ( VARCHAR ( 50 ), zzysqm ) AS zzysqm,
		CONVERT ( VARCHAR ( 20 ), zrysbm ) AS zrysbm,		CONVERT ( VARCHAR ( 50 ), zrysqm ) AS zrysqm,
		getdate(),getdate(),'EMR'
		FROM
			HLHT_RYJL_RYSWJL t 
		WHERE
			t.STATUS=0
		Merge Into DC_RYJL_RYSWJL _target
		using #DC_RYJL_RYSWJL _source
		on(_target.yjlxh = _source.yjlxh)
		When  Matched  Then Update set
			_target.yljgdm=_source.yljgdm,_target.jzlsh=_source.jzlsh,_target.patid=_source.patid,_target.zyh=_source.zyh,_target.yjlxh=_source.yjlxh,
			_target.hzxm=_source.hzxm,_target.sfzhm=_source.sfzhm,_target.xbmc=_source.xbmc,_target.xbdm=_source.xbdm,_target.nls=_source.nls,
			_target.nly=_source.nly,_target.mz=_source.mz,_target.mzmc=_source.mzmc,_target.hyzkdm=_source.hyzkdm,_target.hyzkmc=_source.hyzkmc,
			_target.dzsf=_source.dzsf,_target.dzsq=_source.dzsq,_target.dzx=_source.dzx,_target.dzxz=_source.dzxz,_target.dzc=_source.dzc,
			_target.dzmphm=_source.dzmphm,_target.zylbdm=_source.zylbdm,_target.zylbmc=_source.zylbmc,_target.bscszxm=_source.bscszxm,
			_target.cszhzgxdm=_source.cszhzgxdm,_target.cszhzgxmc=_source.cszhzgxmc,_target.csnrbz=_source.csnrbz,_target.ryrq=_source.ryrq,
			_target.swrq=_source.swrq,_target.ryqk=_source.ryqk,_target.zfbm=_source.zfbm,_target.zzzf=_source.zzzf,_target.zlgcms=_source.zlgcms,
			_target.swyy=_source.swyy,_target.jzysbm=_source.jzysbm,_target.jzysqm=_source.jzysqm,_target.zyysbm=_source.zyysbm,_target.zyysqm=_source.zyysqm,
			_target.zzysbm=_source.zzysbm,_target.zzysqm=_source.zzysqm,_target.zrysbm=_source.zrysbm,_target.zrysqm=_source.zrysqm,
			_target.sys_id=_source.sys_id,_target.createtime=_source.createtime,_target.gxrq=_source.gxrq    
		When Not Matched By Target Then Insert
			(yljgdm,jzlsh,patid,zyh,yjlxh,hzxm,sfzhm,xbmc,xbdm,nls,nly,mz,mzmc,hyzkdm,hyzkmc,
				dzsf,dzsq,dzx,dzxz,dzc,dzmphm,zylbdm,zylbmc,bscszxm,
				cszhzgxdm,cszhzgxmc,csnrbz,ryrq,swrq,ryqk,zfbm,zzzf,zlgcms,
				swyy,jzysbm,jzysqm,zyysbm,zyysqm,zzysbm,zzysqm,zrysbm,zrysqm,
				createtime,gxrq,sys_id )
		values
			( 		
			 _source.yljgdm,_source.jzlsh,_source.patid,_source.zyh,_source.yjlxh,_source.hzxm,_source.sfzhm,_source.xbmc,_source.xbdm,_source.nls,
			 _source.nly,_source.mz,_source.mzmc,_source.hyzkdm,_source.hyzkmc,_source.dzsf,_source.dzsq,_source.dzx,_source.dzxz,_source.dzc,_source.dzmphm,
			 _source.zylbdm,_source.zylbmc,_source.bscszxm,_source.cszhzgxdm,_source.cszhzgxmc,_source.csnrbz,_source.ryrq,_source.swrq,_source.ryqk,_source.zfbm,
			 _source.zzzf,_source.zlgcms,_source.swyy,_source.jzysbm,_source.jzysqm,_source.zyysbm,_source.zyysqm,_source.zzysbm,_source.zzysqm,_source.zrysbm,_source.zrysqm,
			 getdate(),getdate(),'EMR'
			 );
        drop table #DC_RYJL_RYSWJL
	
    declare @error int
    -- 24小时内入院死亡记录_中医四诊观察结果
    declare @yjlxh as nvarchar(max),@zyszgcjg as nvarchar(max)
	-- 24小时内入院死亡记录_入院中医诊断
	declare @rzzybmmc as nvarchar(max),@rzzybmdm as nvarchar(max),@rzzyzhmc as nvarchar(max),@rzzyzhdm as nvarchar(max)
    -- 24小时内入院死亡记录_入院西医诊断
    declare @rzxyzdmc as nvarchar(max), @rzxyzdbm as nvarchar(max)
	-- 24小时内入院死亡记录_死亡中医诊断
	declare @szzybmmc as nvarchar(max),@szzybmdm as nvarchar(max),@szzyzhmc as nvarchar(max),@szzyzhdm as nvarchar(max)
    -- 24小时内入院死亡记录_死亡西医诊断
    declare @szxyzdmc as nvarchar(max), @szxyzdbm as nvarchar(max)
    set @error = 0
    begin tran  --申明事务
    --申明游标为,需要加时间范围
    declare order_cursor cursor for (select yjlxh,zyszgcjg,rzzybmmc,rzzybmdm,rzzyzhmc,rzzyzhdm,rzxyzdmc,rzxyzdbm,szzybmmc,szzybmdm,szzyzhmc,szzyzhdm,szxyzdmc,szxyzdbm from [dbo].[HLHT_RYJL_RYSWJL] where STATUS=0)
    --打开游标--
    open order_cursor
    --开始循环游标变量--
    fetch next from order_cursor into @yjlxh, @zyszgcjg,@rzzybmmc,@rzzybmdm,@rzzyzhmc,@rzzyzhdm,@rzxyzdmc, @rzxyzdbm,@szzybmmc,@szzybmdm,@szzyzhmc,@szzyzhdm,@szxyzdmc, @szxyzdbm
    while @@FETCH_STATUS = 0 --返回被 FETCH语句执行的最后游标的状态--
        begin
						--24小时内入院死亡记录_中医四诊观察结果 
						create table  #DC_RYJL_RYSWJL_ZYSZGCJG (    
							xh                   numeric(12)          identity(1, 1)/* 序号  */,
							yljgdm               varchar(20)          not null/* 医疗机构代码  */,
							yjlxh                varchar(64)          not null/* 源记录序号 */,
							zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
							zyszgcjg             nvarchar(1000)       null/* 中医“四诊”观察结果 */,
							[createtime] [datetime] NULL,
							[gxrq] [datetime] NOT NULL,
							[sys_id] [varchar](50) NOT NULL
						 )
			           insert  into #DC_RYJL_RYSWJL_ZYSZGCJG(yljgdm,yjlxh,zyjlxh,zyszgcjg,sys_id,createtime,gxrq)
						select @yljgdm,ltrim(rtrim(@yjlxh))+ltrim(rtrim(Str(a.id))), @yjlxh, a.value,'EMR', GETDATE(),GETDATE() from
			            (select * from (values(1,@zyszgcjg))t(id,value)) a
			            
			            Merge Into DC_RYJL_RYSWJL_ZYSZGCJG _target
						using #DC_RYJL_RYSWJL_ZYSZGCJG _source
						on(_target.yjlxh = _source.yjlxh)
						When  Matched  Then Update set
									_target.yljgdm  =_source.yljgdm  ,
									_target.yjlxh   =_source.yjlxh   ,
									_target.zyjlxh  =_source.zyjlxh  ,
									_target.zyszgcjg=_source.zyszgcjg,
									_target.sys_id  =_source.sys_id  ,
									_target.gxrq    =_source.gxrq    ,
									_target.createtime  =_source.createtime
						When Not Matched By Target Then Insert
							(yljgdm,yjlxh,zyjlxh,zyszgcjg,sys_id,createtime,gxrq)
						values
						    (_source.yljgdm,_source.yjlxh,_source.zyjlxh,_source.zyszgcjg,_source.sys_id,_source.createtime,_source.gxrq);
			            
			            drop table #DC_RYJL_RYSWJL_ZYSZGCJG
			            
			            --24小时内入院死亡记录_入院中医诊断
			           create table  #DC_RYJL_RYSWJL_RYZYZD (    
									xh                   numeric(12)          identity(1, 1)/* 序号  */,
									yljgdm               varchar(20)          not null/* 医疗机构代码  */,
									yjlxh                varchar(64)          not null/* 源记录序号 */,
									zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
									rzzybmmc             varchar(128)         not null/* 入院诊断-中医病名名称 */,
									rzzybmdm             varchar(64)          not null/* 入院诊断-中医病名代码 */,
									rzzyzhmc             varchar(128)         not null/* 入院诊断-中医证候名称 */,
									rzzyzhdm             varchar(64)          not null/* 入院诊断-中医证候代码 */,
									[createtime] [datetime] NULL,
									[gxrq] [datetime] NOT NULL,
									[sys_id] [varchar](50) NOT NULL
								  )
			      insert  into #DC_RYJL_RYSWJL_RYZYZD(yljgdm,yjlxh,zyjlxh,rzzybmmc,rzzybmdm,rzzyzhmc,rzzyzhdm,sys_id,createtime,gxrq)
						select @yljgdm,ltrim(rtrim(@yjlxh))+ltrim(rtrim(Str(a.id))), @yjlxh, a.value, b.value,c.value,d.value,'EMR', GETDATE(),GETDATE() from
			            (select id, value from [dbo].[f_splitString](@rzzybmmc, @regex)) a,
			            (select id, value from [dbo].[f_splitString](@rzzybmdm, @regex)) b,
			            (select id, value from [dbo].[f_splitString](@rzzyzhmc, @regex)) c,
			            (select id, value from [dbo].[f_splitString](@rzzyzhdm, @regex)) d
			            where a.id = b.id and a.id = c.id and a.id = d.id
			            
			      Merge Into DC_RYJL_RYSWJL_RYZYZD _target
						using #DC_RYJL_RYSWJL_RYZYZD _source
						on(_source.yjlxh = _target.yjlxh)
						When  Matched  Then Update set
							 _target.yljgdm=_source.yljgdm,
							_target.yjlxh=_source.yjlxh,
							_target.zyjlxh=_source.zyjlxh,
							_target.rzzybmmc=_source.rzzybmmc,
							_target.rzzybmdm=_source.rzzybmdm,
							_target.rzzyzhmc=_source.rzzyzhmc,
							_target.rzzyzhdm=_source.rzzyzhdm,
							_target.sys_id=_source.sys_id,
							_target.createtime=_source.createtime,
							_target.gxrq=_source.gxrq
						When Not Matched By Target Then Insert
							(yljgdm,yjlxh,zyjlxh,rzzybmmc,rzzybmdm,rzzyzhmc,rzzyzhdm,sys_id,createtime,gxrq)
						values
						    (_source.yljgdm,_source.yjlxh,_source.zyjlxh,_source.rzzybmmc,_source.rzzybmdm,_source.rzzyzhmc,_source.rzzyzhdm,_source.sys_id,_source.createtime,_source.gxrq);
			      drop table #DC_RYJL_RYSWJL_RYZYZD
			      
						--24小时内入院死亡记录_入院西医诊断
						 create table  #DC_RYJL_RYSWJL_RYXYZD (    
					    xh                   numeric(12)          identity(1, 1)/* 序号  */,
					    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
					    yjlxh                varchar(64)          not null/* 源记录序号 */,
					    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
					    rzxyzdmc             varchar(128)         not null/* 入院诊断-西医诊断名称 */,
					    rzxyzdbm             varchar(64)          not null/* 入院诊断-西医诊断编码 */,
					    [createtime] 	[datetime] NULL,
						[gxrq] 				[datetime] NOT NULL,
						[sys_id] 			[varchar](50) NOT NULL
					  )
						
						insert  into #DC_RYJL_RYSWJL_RYXYZD(yljgdm,yjlxh,zyjlxh,rzxyzdmc,rzxyzdbm,sys_id,createtime,gxrq)
						select @yljgdm,ltrim(rtrim(@yjlxh))+ltrim(rtrim(Str(a.id))), @yjlxh, a.value, b.value,'EMR', GETDATE(),GETDATE() from
			            (select id, value from [dbo].[f_splitString](@rzxyzdmc, @regex)) a,
			            (select id, value from [dbo].[f_splitString](@rzxyzdbm, @regex)) b
			            where a.id = b.id
			            
			      Merge Into DC_RYJL_RYSWJL_RYXYZD _target
						using #DC_RYJL_RYSWJL_RYXYZD _source
						on(_source.yjlxh = _target.yjlxh)
						When  Matched  Then Update set
							 	_target.yljgdm  =_source.yljgdm  ,
								_target.yjlxh   =_source.yjlxh   ,
								_target.zyjlxh  =_source.zyjlxh  ,
								_target.rzxyzdmc=_source.rzxyzdmc,
								_target.rzxyzdbm=_source.rzxyzdbm,
								_target.sys_id  =_source.sys_id  ,
								_target.createtime    =_source.createtime    ,
								_target.gxrq  =_source.gxrq   
						When Not Matched By Target Then Insert
							(yljgdm,yjlxh,zyjlxh,rzxyzdmc,rzxyzdbm,sys_id,createtime,gxrq)
						values
						    (_source.yljgdm,_source.yjlxh,_source.zyjlxh,_source.rzxyzdmc,_source.rzxyzdbm,_source.sys_id,_source.createtime,_source.gxrq);
			      drop table #DC_RYJL_RYSWJL_RYXYZD
			      
			       --24小时内入院死亡记录_死亡中医诊断
			          create table  #DC_RYJL_RYSWJL_SWZYZD (    
							    xh                   numeric(12)          identity(1, 1)/* 序号  */,
							    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
							    yjlxh                varchar(64)          not null/* 源记录序号 */,
							    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
							    szzybmmc             varchar(128)         not null/* 死亡诊断-中医病名名称 */,
							    szzybmdm             varchar(64)          not null/* 死亡诊断-中医病名代码 */,
							    szzyzhmc             varchar(128)         not null/* 死亡诊断-中医证候名称 */,
							    szzyzhdm             varchar(64)          not null/* 死亡诊断-中医证候代码 */,
							    [createtime] 	[datetime] NULL,
								[gxrq] 				[datetime] NOT NULL,
								[sys_id] 			[varchar](50) NOT NULL
							  )
			      insert  into #DC_RYJL_RYSWJL_SWZYZD(yljgdm,yjlxh,zyjlxh,szzybmmc,szzybmdm,szzyzhmc,szzyzhdm,sys_id,createtime,gxrq)
						select @yljgdm,ltrim(rtrim(@yjlxh))+ltrim(rtrim(Str(a.id))), @yjlxh, a.value, b.value,c.value,d.value,'EMR', GETDATE(),GETDATE() from
			            (select id, value from [dbo].[f_splitString](@szzybmmc, @regex)) a,
			            (select id, value from [dbo].[f_splitString](@szzybmdm, @regex)) b,
			            (select id, value from [dbo].[f_splitString](@szzyzhmc, @regex)) c,
			            (select id, value from [dbo].[f_splitString](@szzyzhdm, @regex)) d
			            where a.id = b.id and a.id = c.id and a.id = d.id
			            
			      Merge Into DC_RYJL_RYSWJL_SWZYZD _target
						using #DC_RYJL_RYSWJL_SWZYZD _source
						on(_source.yjlxh = _target.yjlxh)
						When  Matched  Then Update set
							_target.yljgdm  =_source.yljgdm  ,
					    _target.yjlxh   =_source.yjlxh   ,
					    _target.zyjlxh  =_source.zyjlxh  ,
					    _target.szzybmmc=_source.szzybmmc,
					    _target.szzybmdm=_source.szzybmdm,
					    _target.szzyzhmc=_source.szzyzhmc,
					    _target.szzyzhdm=_source.szzyzhdm,
					    _target.sys_id  =_source.sys_id  ,
					    _target.createtime    =_source.createtime    ,
					    _target.gxrq  =_source.gxrq 
						When Not Matched By Target Then Insert
							(yljgdm,yjlxh,zyjlxh,szzybmmc,szzybmdm,szzyzhmc,szzyzhdm,sys_id,createtime,gxrq)
						values
						    (_source.yljgdm,_source.yjlxh,_source.zyjlxh,_source.szzybmmc,_source.szzybmdm,_source.szzyzhmc,_source.szzyzhdm,_source.sys_id,_source.createtime,_source.gxrq);
			      drop table #DC_RYJL_RYSWJL_SWZYZD
			       
			      --24小时内入院死亡记录_死亡西医诊断
						create table  #DC_RYJL_RYSWJL_SWXYZD (    
					    xh                   numeric(12)          identity(1, 1)/* 序号  */,
					    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
					    yjlxh                varchar(64)          not null/* 源记录序号 */,
					    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
					    szxyzdmc             varchar(128)         not null/* 死亡诊断-西医诊断名称 */,
					    szxyzdbm             varchar(64)          not null/* 死亡诊断-西医诊断编码 */,
					    [createtime] 	[datetime] NULL,
						[gxrq] 				[datetime] NOT NULL,
						[sys_id] 			[varchar](50) NOT NULL
					  )
						
						insert  into #DC_RYJL_RYSWJL_SWXYZD(yljgdm,yjlxh,zyjlxh,szxyzdmc,szxyzdbm,sys_id,createtime,gxrq)
						select @yljgdm,ltrim(rtrim(@yjlxh))+ltrim(rtrim(Str(a.id))), @yjlxh, a.value, b.value,'EMR', GETDATE(),GETDATE() from
			            (select id, value from [dbo].[f_splitString](@szxyzdmc, @regex)) a,
			            (select id, value from [dbo].[f_splitString](@szxyzdbm, @regex)) b
			            where a.id = b.id
			            
			      Merge Into DC_RYJL_RYSWJL_SWXYZD _target
						using #DC_RYJL_RYSWJL_SWXYZD _source
						on(_source.yjlxh = _target.yjlxh)
						When  Matched  Then Update set
							 	_target.yljgdm  =_source.yljgdm  ,
								_target.yjlxh   =_source.yjlxh   ,
								_target.zyjlxh  =_source.zyjlxh  ,
								_target.szxyzdmc=_source.szxyzdmc,
								_target.szxyzdbm=_source.szxyzdbm,
								_target.sys_id  =_source.sys_id  ,
								_target.createtime  =_source.createtime    ,
								_target.gxrq  =_source.gxrq   
							When Not Matched By Target Then Insert
							(yljgdm,yjlxh,zyjlxh,szxyzdmc,szxyzdbm,sys_id,createtime,gxrq)
						values
						    (_source.yljgdm,_source.yjlxh,_source.zyjlxh,_source.szxyzdmc,_source.szxyzdbm,_source.sys_id,_source.createtime,_source.gxrq);
			      drop table #DC_RYJL_RYSWJL_SWXYZD
			      
            set @error= @error + @@ERROR   --记录每次运行sql后是否正确，0正确
            fetch next from order_cursor into @yjlxh, @zyszgcjg,@rzzybmmc,@rzzybmdm,@rzzyzhmc,@rzzyzhdm,@rzxyzdmc, @rzxyzdbm,@szzybmmc,@szzybmdm,@szzyzhmc,@szzyzhdm,@szxyzdmc, @szxyzdbm   --转到下一个游标
        end
    if @error = 0
		begin
			commit tran   --提交事务
		end
    else
		begin
			rollback tran --回滚事务
			close order_cursor  --关闭游标
			deallocate order_cursor  --关闭游标
		end
    close order_cursor  --关闭游标
    deallocate order_cursor --释放游标
  end
