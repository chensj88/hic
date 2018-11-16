alter PROCEDURE [dbo].[USP_SPLIT_RYJL_RCYJL]
    @yljgdm     varchar(20),    --医疗机构代码
    @regex		varchar(20) 	--分割符
as
  begin
	if exists (select 1 from  tempdb..sysobjects where  id = object_id('tempdb..#DC_RYJL_RCYJL'))
	drop table #DC_RYJL_RCYJL
	if exists (select 1 from  tempdb..sysobjects where  id = object_id('tempdb..#DC_RYJL_RCYJL_ZYSZGCJG'))
	drop table #DC_RYJL_RCYJL_ZYSZGCJG
	if exists (select 1 from  tempdb..sysobjects where  id = object_id('tempdb..#DC_RYJL_RCYJL_CYXYZD'))
	drop table #DC_RYJL_RCYJL_CYXYZD
	if exists (select 1 from  tempdb..sysobjects where  id = object_id('tempdb..#DC_RYJL_RCYJL_CYZYZD'))
	drop table #DC_RYJL_RCYJL_CYZYZD
	if exists (select 1 from  tempdb..sysobjects where  id = object_id('tempdb..#DC_RYJL_RCYJL_RYXYZD'))
	drop table #DC_RYJL_RCYJL_RYXYZD
	if exists (select 1 from  tempdb..sysobjects where  id = object_id('tempdb..#DC_RYJL_RCYJL_RYZYZD'))
	drop table #DC_RYJL_RCYJL_RYZYZD
	

	--主表操作
	create table  #DC_RYJL_RCYJL (    
		xh                   numeric(12)          identity(1, 1)/* 序号  */,
		yljgdm               varchar(20)          not null/* 医疗机构代码  */,
		jzlsh                varchar(64)          not null/* 就诊流水号 */,
		patid                varchar(64)          not null/* 患者patid */,
		zyh                  varchar(18)          not null/* 住院号 */,
		yjlxh                varchar(64)          not null/* 源记录序号 */,
		hzxm                 varchar(50)          not null/* 患者姓名 */,
		sfzhm                varchar(18)          not null/* 身份证号码 */,
		xbdm                 varchar(2)           not null/* 性别代码 */,
		xbmc                 varchar(16)          not null/* 性别名称 */,
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
		zylbmc               varchar(32)          null/* 职业类别名称 */,
		ryrq                 datetime             not null/* 入院日期时间 */,
		cyrq                 datetime             not null/* 出院日期时间 */,
		bscszxm              varchar(50)          not null/* 病史陈述者姓名 */,
		cszhzgxdm            varchar(50)          not null/* 陈述者与患者的关系代码 */,
		cszhzgxmc            varchar(50)          not null/* 陈述者与患者的关系名称 */,
		csnrbz               char(1)              not null/* 陈述内容可靠标志 */,
		zs                   nvarchar(100)        not null/* 主诉 */,
		xbs                  nvarchar(2000)       not null/* 现病史 */,
		ryqk                 nvarchar(2000)       not null/* 入院情况 */,
		zzmc                 varchar(50)          not null/* 症状名称 */,
		zzms                 nvarchar(1000)       not null/* 症状描述 */,
		zfbm                 varchar(20)          null/* 治则治法代码 */,
		zzzf                 nvarchar(100)        null/* 治则治法 */,
		zlgcms               nvarchar(2000)       not null/* 诊疗过程描述 */,
		cyqk                 nvarchar(2000)       not null/* 出院情况 */,
		cyyz                 nvarchar(1000)       null/* 出院医嘱 */,
		yzklysbm             varchar(20)          null/* 医嘱开立医师编码 */,
		cyyzklrqm            varchar(50)          null/* 出院医嘱开立人签名 */,
		cyyzklrq             datetime             null/* 出院医嘱开立日期时间 */,
		jzysbm               varchar(20)          not null/* 接诊医师编码 */,
		jzysqm               varchar(50)          not null/* 接诊医师签名 */,
		zyysbm               varchar(20)          not null/* 住院医师编码 */,
		zyysqm               varchar(50)          not null/* 住院医师签名 */,
		zzysbm               varchar(20)          not null/* 主治医师编码 */,
		zzysqm               varchar(50)          not null/* 主治医师签名 */,
		zrysbm               varchar(20)          not null/* 主任医师编码 */,
		zrysqm               varchar(50)          not null/* 主任医师签名 */,
		[createtime] 		[datetime] 			NULL,
		[gxrq] 				[datetime] 			NOT NULL,
		[sys_id] 			[varchar](50) 		NOT NULL
		)
	  INSERT INTO #DC_RYJL_RCYJL (
		  yljgdm,jzlsh,patid,zyh,yjlxh,hzxm,sfzhm,xbdm,xbmc,nls,nly,mz,mzmc,hyzkdm,hyzkmc,dzsf,dzsq,dzx,dzxz,dzc,dzmphm,
		  zylbdm,zylbmc,ryrq,cyrq,bscszxm,cszhzgxdm,cszhzgxmc,csnrbz,zs,xbs,ryqk,zzmc,zzms,zfbm,zzzf,zlgcms,cyqk,cyyz,
		  yzklysbm,cyyzklrqm,cyyzklrq,jzysbm,jzysqm,zyysbm,zyysqm,zzysbm,zzysqm,zrysbm,zrysqm,createtime,gxrq,sys_id		
	   ) 
		SELECT
		@yljgdm AS yljgdm, 
		CONVERT(varchar(64),jzlsh) AS jzlsh,CONVERT(varchar(64),patid) AS patid,CONVERT(varchar(18),zyh) AS zyh,CONVERT(varchar(64),yjlxh) AS yjlxh,
		CONVERT(varchar(50),hzxm) AS hzxm,CONVERT(varchar(18),sfzhm) AS sfzhm,CONVERT(varchar(2),xbdm) AS xbdm,CONVERT(varchar(16),xbmc) AS xbmc,
		CONVERT(numeric(3,0),nls) AS nls,CONVERT(varchar(8),nly) AS nly,CONVERT(varchar(2),mz) AS mz,CONVERT(varchar(32),mzmc) AS mzmc,
		CONVERT(varchar(2),hyzkdm) AS hyzkdm,CONVERT(varchar(32),hyzkmc) AS hyzkmc,CONVERT(varchar(70),dzsf) AS dzsf,CONVERT(varchar(70),dzsq) AS dzsq,
		CONVERT(varchar(70),dzx) AS dzx,CONVERT(varchar(70),dzxz) AS dzxz,CONVERT(varchar(70),dzc) AS dzc,CONVERT(varchar(70),dzmphm) AS dzmphm,
		CONVERT(varchar(2),zylbdm) AS zylbdm,CONVERT(varchar(32),zylbmc) AS zylbmc,CONVERT(datetime,ryrq) AS ryrq,CONVERT(datetime,cyrq) AS cyrq,
		CONVERT(varchar(50),bscszxm) AS bscszxm,CONVERT(varchar(50),cszhzgxdm) AS cszhzgxdm,CONVERT(varchar(50),cszhzgxmc) AS cszhzgxmc,
		CONVERT(char(1),csnrbz) AS csnrbz,CONVERT(nvarchar(100),zs) AS zs,CONVERT(nvarchar(2000),xbs) AS xbs,CONVERT(nvarchar(2000),ryqk) AS ryqk,
		CONVERT(varchar(50),zzmc) AS zzmc,CONVERT(nvarchar(1000),zzms) AS zzms,CONVERT(varchar(20),zfbm) AS zfbm,CONVERT(nvarchar(100),zzzf) AS zzzf,
		CONVERT(nvarchar(2000),zlgcms) AS zlgcms,CONVERT(nvarchar(2000),cyqk) AS cyqk,CONVERT(nvarchar(1000),cyyz) AS cyyz,CONVERT(varchar(20),yzklysbm) AS yzklysbm,
		CONVERT(varchar(50),cyyzklrqm) AS cyyzklrqm,CONVERT(datetime,cyyzklrq) AS cyyzklrq,CONVERT(varchar(20),jzysbm) AS jzysbm,CONVERT(varchar(50),jzysqm) AS jzysqm,
		CONVERT(varchar(20),zyysbm) AS zyysbm,CONVERT(varchar(50),zyysqm) AS zyysqm,CONVERT(varchar(20),zzysbm) AS zzysbm,CONVERT(varchar(50),zzysqm) AS zzysqm,
		CONVERT(varchar(20),zrysbm) AS zrysbm,CONVERT(varchar(50),zrysqm) AS zrysqm,
		getdate(),getdate(),'EMR' AS sys_id
		FROM
			HLHT_RYJL_RCYJL t 
		WHERE
			t.STATUS=0
		Merge Into DC_RYJL_RCYJL _target
		using #DC_RYJL_RCYJL _source
		on(_target.yjlxh = _source.yjlxh)
		When  Matched  Then Update set
			_target.yljgdm    =_source.yljgdm    ,
			_target.jzlsh     =_source.jzlsh     ,
			_target.patid     =_source.patid     ,
			_target.zyh       =_source.zyh       ,
			_target.yjlxh     =_source.yjlxh     ,
			_target.hzxm      =_source.hzxm      ,
			_target.sfzhm     =_source.sfzhm     ,
			_target.xbdm      =_source.xbdm      ,
			_target.xbmc      =_source.xbmc      ,
			_target.nls       =_source.nls       ,
			_target.nly       =_source.nly       ,
			_target.mz        =_source.mz        ,
			_target.mzmc      =_source.mzmc      ,
			_target.hyzkdm    =_source.hyzkdm    ,
			_target.hyzkmc    =_source.hyzkmc    ,
			_target.dzsf      =_source.dzsf      ,
			_target.dzsq      =_source.dzsq      ,
			_target.dzx       =_source.dzx       ,
			_target.dzxz      =_source.dzxz      ,
			_target.dzc       =_source.dzc       ,
			_target.dzmphm    =_source.dzmphm    ,
			_target.zylbdm    =_source.zylbdm    ,
			_target.zylbmc    =_source.zylbmc    ,
			_target.ryrq      =_source.ryrq      ,
			_target.cyrq      =_source.cyrq      ,
			_target.bscszxm   =_source.bscszxm   ,
			_target.cszhzgxdm =_source.cszhzgxdm ,
			_target.cszhzgxmc =_source.cszhzgxmc ,
			_target.csnrbz    =_source.csnrbz    ,
			_target.zs        =_source.zs        ,
			_target.xbs       =_source.xbs       ,
			_target.ryqk      =_source.ryqk      ,
			_target.zzmc      =_source.zzmc      ,
			_target.zzms      =_source.zzms      ,
			_target.zfbm      =_source.zfbm      ,
			_target.zzzf      =_source.zzzf      ,
			_target.zlgcms    =_source.zlgcms    ,
			_target.cyqk      =_source.cyqk      ,
			_target.cyyz      =_source.cyyz      ,
			_target.yzklysbm  =_source.yzklysbm  ,
			_target.cyyzklrqm =_source.cyyzklrqm ,
			_target.cyyzklrq  =_source.cyyzklrq  ,
			_target.jzysbm    =_source.jzysbm    ,
			_target.jzysqm    =_source.jzysqm    ,
			_target.zyysbm    =_source.zyysbm    ,
			_target.zyysqm    =_source.zyysqm    ,
			_target.zzysbm    =_source.zzysbm    ,
			_target.zzysqm    =_source.zzysqm    ,
			_target.zrysbm    =_source.zrysbm    ,
			_target.zrysqm    =_source.zrysqm    ,
			_target.createtime=_source.createtime,
			_target.gxrq      =_source.gxrq      ,
			_target.sys_id    =_source.sys_id    
		When Not Matched By Target Then Insert
			(  yljgdm,jzlsh,patid,zyh,yjlxh,hzxm,sfzhm,xbdm,xbmc,nls,nly,mz,mzmc,hyzkdm,hyzkmc,dzsf,dzsq,dzx,dzxz,dzc,dzmphm,
		  	zylbdm,zylbmc,ryrq,cyrq,bscszxm,cszhzgxdm,cszhzgxmc,csnrbz,zs,xbs,ryqk,zzmc,zzms,zfbm,zzzf,zlgcms,cyqk,cyyz,
		 	yzklysbm,cyyzklrqm,cyyzklrq,jzysbm,jzysqm,zyysbm,zyysqm,zzysbm,zzysqm,zrysbm,zrysqm,createtime,gxrq,sys_id
		  )
		values
			( 		
			_source.yljgdm,_source.jzlsh,_source.patid,_source.zyh,_source.yjlxh,_source.hzxm,_source.sfzhm,_source.xbdm,_source.xbmc,
			_source.nls,_source.nly,_source.mz,_source.mzmc,_source.hyzkdm,_source.hyzkmc,_source.dzsf,_source.dzsq,_source.dzx,
			_source.dzxz,_source.dzc,_source.dzmphm,_source.zylbdm,_source.zylbmc,_source.ryrq,_source.cyrq,_source.bscszxm,_source.cszhzgxdm,
			_source.cszhzgxmc,_source.csnrbz,_source.zs,_source.xbs,_source.ryqk,_source.zzmc,_source.zzms,_source.zfbm,_source.zzzf,_source.zlgcms,
			_source.cyqk,_source.cyyz,_source.yzklysbm,_source.cyyzklrqm,_source.cyyzklrq,_source.jzysbm,_source.jzysqm,_source.zyysbm,_source.zyysqm,
			_source.zzysbm,_source.zzysqm,_source.zrysbm,_source.zrysqm,_source.createtime,_source.gxrq,_source.sys_id
			 );
        drop table #DC_RYJL_RCYJL
	
    declare @error int
    -- 入院记录－24小时内入出院记录_中医四诊观察结果
    declare @yjlxh as nvarchar(max),@zyszgcjg as nvarchar(max)
		-- 入院记录－24小时内入出院记录_入院中医诊断
		declare @rzzybmmc as nvarchar(max),@rzzybmdm as nvarchar(max),@rzzyzhmc as nvarchar(max),@rzzyzhdm as nvarchar(max)
    -- 入院记录－24小时内入出院记录_入院西医诊断
    declare @rzxyzdmc as nvarchar(max), @rzxzzdbm as nvarchar(max)
		-- 入院记录－24小时内入出院记录_出院中医诊断
		declare @czzybmmc as nvarchar(max),@czzybmdm as nvarchar(max),@czzyzhmc as nvarchar(max),@czzyzhdm as nvarchar(max)
    -- 入院记录－24小时内入出院记录_出院西医诊断
    declare @czxyzdmc as nvarchar(max), @czxyzdbm as nvarchar(max)
    set @error = 0
    begin tran  --申明事务
    --申明游标为,需要加时间范围
    declare order_cursor cursor for (select yjlxh,zyszgcjg,rzzybmmc,rzzybmdm,rzzyzhmc,rzzyzhdm,rzxyzdmc,rzxzzdbm,czzybmmc,czzybmdm,czzyzhmc,czzyzhdm,czxyzdmc,czxyzdbm from [dbo].[HLHT_RYJL_RCYJL] where STATUS=0)
    --打开游标--
    open order_cursor
    --开始循环游标变量--
    fetch next from order_cursor into  @yjlxh, @zyszgcjg,@rzzybmmc,@rzzybmdm,@rzzyzhmc,@rzzyzhdm,@rzxyzdmc, @rzxzzdbm,@czzybmmc,@czzybmdm,@czzyzhmc,@czzyzhdm,@czxyzdmc, @czxyzdbm
    while @@FETCH_STATUS = 0 --返回被 FETCH语句执行的最后游标的状态--
        begin
				--入院记录－24小时内入出院记录_中医四诊观察结果 
				create table  #DC_RYJL_RCYJL_ZYSZGCJG (    
					xh                   numeric(12)          identity(1, 1)/* 序号  */,
					yljgdm               varchar(20)          not null/* 医疗机构代码  */,
					yjlxh                varchar(64)          not null/* 源记录序号 */,
					zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
					zyszgcjg             nvarchar(1000)       null/* 中医“四诊”观察结果 */,
					createtime 			 		datetime 							NULL,
					gxrq 				 				datetime 							NOT NULL,
					sys_id 				 		varchar(50) 						NOT NULL
				)
				insert  into #DC_RYJL_RCYJL_ZYSZGCJG(yljgdm,yjlxh,zyjlxh,zyszgcjg,createtime,gxrq,sys_id)
				select @yljgdm,ltrim(rtrim(@yjlxh))+ltrim(rtrim(Str(a.id))), @yjlxh, a.value, GETDATE(),GETDATE(),'EMR' from
				(select * from (values(1,@zyszgcjg))t(id,value)) a
				
				Merge Into DC_RYJL_RCYJL_ZYSZGCJG _target
				using #DC_RYJL_RCYJL_ZYSZGCJG _source
				on(_target.yjlxh = _source.yjlxh)
				When  Matched  Then Update set
					_target.yljgdm=_source.yljgdm,
					_target.yjlxh =_source.yjlxh ,
					_target.zyjlxh=_source.zyjlxh,
					_target.zyszgcjg=_source.zyszgcjg,
					_target.createtime=_source.createtime,
					_target.gxrq=_source.gxrq,
					_target.sys_id =_source.sys_id
				When Not Matched By Target Then Insert
					(yljgdm,yjlxh,zyjlxh,zyszgcjg,createtime,gxrq,sys_id)
				values
					(_source.yljgdm,_source.yjlxh,_source.zyjlxh,_source.zyszgcjg,_source.createtime,_source.gxrq,_source.sys_id);
				
				drop table #DC_RYJL_RCYJL_ZYSZGCJG
			            
				--入院记录－24小时内入出院记录_入院中医诊断
				create table  #DC_RYJL_RCYJL_RYZYZD (    
						xh                   numeric(12)          identity(1, 1)/* 序号  */,
						yljgdm               varchar(20)          not null/* 医疗机构代码  */,
						yjlxh                varchar(64)          not null/* 源记录序号 */,
						zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
						rzzybmmc             varchar(128)         null/* 入院诊断-中医病名名称 */,
						rzzybmdm             varchar(64)          null/* 入院诊断-中医病名代码 */,
						rzzyzhmc             varchar(128)         null/* 入院诊断-中医证候名称 */,
						rzzyzhdm             varchar(64)          null/* 入院诊断-中医证候代码 */,
						createtime 			 		 datetime 						NULL,
						gxrq 				 				 datetime 						NOT NULL,
						sys_id 				 		   varchar(50) 					NOT NULL
					)
			      insert  into #DC_RYJL_RCYJL_RYZYZD(yljgdm,yjlxh,zyjlxh,rzzybmmc,rzzybmdm,rzzyzhmc,rzzyzhdm,createtime,gxrq,sys_id)
						select @yljgdm,ltrim(rtrim(@yjlxh))+ltrim(rtrim(Str(a.id))), @yjlxh, a.value, b.value,c.value,d.value, GETDATE(),GETDATE(),'EMR' from
			            (select id, value from [dbo].[f_splitString](@rzzybmmc, @regex)) a,
			            (select id, value from [dbo].[f_splitString](@rzzybmdm, @regex)) b,
			            (select id, value from [dbo].[f_splitString](@rzzyzhmc, @regex)) c,
			            (select id, value from [dbo].[f_splitString](@rzzyzhdm, @regex)) d
			            where a.id = b.id and a.id = c.id and a.id = d.id
			            
			      Merge Into DC_RYJL_RCYJL_RYZYZD _target
						using #DC_RYJL_RCYJL_RYZYZD _source
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
							(yljgdm,yjlxh,zyjlxh,rzzybmmc,rzzybmdm,rzzyzhmc,rzzyzhdm,createtime,gxrq,sys_id)
						values
						    (_source.yljgdm,_source.yjlxh,_source.zyjlxh,_source.rzzybmmc,_source.rzzybmdm,_source.rzzyzhmc,_source.rzzyzhdm,_source.createtime,_source.gxrq,_source.sys_id);
			      drop table #DC_RYJL_RCYJL_RYZYZD
			      
	 			--入院记录－24小时内入出院记录_入院西医诊断
	 			create table  #DC_RYJL_RCYJL_RYXYZD (    
	 				   	xh                   numeric(12)          identity(1, 1)/* 序号  */,
					    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
					    yjlxh                varchar(64)          not null/* 源记录序号 */,
					    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
					    rzxyzdmc             varchar(128)         not null/* 入院诊断-西医诊断名称 */,
					    rzxzzdbm             varchar(64)          not null/* 入院诊断-西医诊断编码 */,
	 				    createtime 			 datetime 						NULL,
						gxrq 				 datetime 						NOT NULL,
						sys_id 				 varchar(50) 					NOT NULL
	 			)
						
	 			insert  into #DC_RYJL_RCYJL_RYXYZD(yljgdm,yjlxh,zyjlxh,rzxyzdmc,rzxzzdbm,createtime,gxrq,sys_id)
	 			select @yljgdm,ltrim(rtrim(@yjlxh))+ltrim(rtrim(Str(a.id))), @yjlxh, a.value, b.value,GETDATE(),GETDATE(),'EMR' from
	 		    (select id, value from [dbo].[f_splitString](@rzxyzdmc, @regex)) a,
	 		    (select id, value from [dbo].[f_splitString](@rzxzzdbm, @regex)) b
	 		    where a.id = b.id
			            
	 		    Merge Into DC_RYJL_RCYJL_RYXYZD _target
	 			using #DC_RYJL_RCYJL_RYXYZD _source
	 			on(_source.yjlxh = _target.yjlxh)
	 			When  Matched  Then Update set
	 					_target.yljgdm  =_source.yljgdm  ,
	 					_target.yjlxh   =_source.yjlxh   ,
	 					_target.zyjlxh  =_source.zyjlxh  ,
	 					_target.rzxyzdmc=_source.rzxyzdmc,
	 					_target.rzxzzdbm=_source.rzxzzdbm,
	 					_target.sys_id  =_source.sys_id  ,
	 					_target.createtime    =_source.createtime    ,
	 					_target.gxrq  =_source.gxrq	 							 
	 			When Not Matched By Target Then Insert
	 				(yljgdm,yjlxh,zyjlxh,rzxyzdmc,rzxzzdbm,createtime,gxrq,sys_id)
	 			values
	 				(_source.yljgdm,_source.yjlxh,_source.zyjlxh,_source.rzxyzdmc,_source.rzxzzdbm,_source.createtime,_source.gxrq,_source.sys_id);
	 		    drop table #DC_RYJL_RCYJL_RYXYZD
			      
	 		     --入院记录－24小时内入出院记录_出院中医诊断
	 		    create table  #DC_RYJL_RCYJL_CYZYZD (    
	 					xh                   numeric(12)          identity(1, 1)/* 序号  */,
						yljgdm               varchar(20)          not null/* 医疗机构代码  */,
						yjlxh                varchar(64)          not null/* 源记录序号 */,
						zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
						czzybmmc             varchar(128)         not null/* 出院诊断-中医病名名称 */,
						czzybmdm             varchar(64)          not null/* 出院诊断-中医病名代码 */,
						czzyzhmc             varchar(128)         not null/* 出院诊断-中医证候名称 */,
						czzyzhdm             varchar(64)          not null/* 出院诊断-中医证候代码 */,
	 					createtime 			 datetime 						NULL,
						gxrq 				 datetime 						NOT NULL,
						sys_id 				 varchar(50) 					NOT NULL
	 				)
	 		      insert  into #DC_RYJL_RCYJL_CYZYZD(yljgdm,yjlxh,zyjlxh,czzybmmc,czzybmdm,czzyzhmc,czzyzhdm,createtime,gxrq,sys_id)
	 					select @yljgdm,ltrim(rtrim(@yjlxh))+ltrim(rtrim(Str(a.id))), @yjlxh, a.value, b.value,c.value,d.value,GETDATE(),GETDATE(),'EMR' from
	 		            (select id, value from [dbo].[f_splitString](@czzybmmc, @regex)) a,
	 		            (select id, value from [dbo].[f_splitString](@czzybmdm, @regex)) b,
	 		            (select id, value from [dbo].[f_splitString](@czzyzhmc, @regex)) c,
	 		            (select id, value from [dbo].[f_splitString](@czzyzhdm, @regex)) d
	 		            where a.id = b.id and a.id = c.id and a.id = d.id
			            
	 				Merge Into DC_RYJL_RCYJL_CYZYZD _target
	 				using #DC_RYJL_RCYJL_CYZYZD _source
	 				on(_source.yjlxh = _target.yjlxh)
	 				When  Matched  Then Update set
	 					_target.yljgdm    =_source.yljgdm     ,
						_target.yjlxh     =_source.yjlxh      ,
						_target.zyjlxh    =_source.zyjlxh     ,
						_target.czzybmmc  =_source.czzybmmc   ,
						_target.czzybmdm  =_source.czzybmdm   ,
						_target.czzyzhmc  =_source.czzyzhmc   ,
						_target.czzyzhdm  =_source.czzyzhdm   ,
						_target.createtime=_source.createtime ,
						_target.gxrq 			=_source.gxrq 			,
						_target.sys_id 		=_source.sys_id 		
	 				When Not Matched By Target Then Insert
	 					(yljgdm,yjlxh,zyjlxh,czzybmmc,czzybmdm,czzyzhmc,czzyzhdm,createtime,gxrq,sys_id)
	 				values
	 					(_source.yljgdm,_source.yjlxh,_source.zyjlxh,_source.czzybmmc,_source.czzybmdm,_source.czzyzhmc,_source.czzyzhdm,_source.createtime,_source.gxrq,_source.sys_id);
	 		      drop table #DC_RYJL_RCYJL_CYZYZD
			       
	 		      --入院记录－24小时内入出院记录_出院西医诊断
	 			  create table  #DC_RYJL_RCYJL_CYXYZD (    
	 				    xh                   numeric(12)          identity(1, 1)/* 序号  */,
	 				    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
	 				    yjlxh                varchar(64)          not null/* 源记录序号 */,
	 				    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
	 				    czxyzdmc             varchar(128)         not null/* 出院诊断-西医诊断名称 */,
						czxyzdbm             varchar(64)          not null/* 出院诊断-西医诊断编码 */,
	 					createtime 			 datetime 						NULL,
						gxrq 				 datetime 						NOT NULL,
						sys_id 				 varchar(50) 					NOT NULL
	 				 )
						
	 					insert  into #DC_RYJL_RCYJL_CYXYZD(yljgdm,yjlxh,zyjlxh,czxyzdmc,czxyzdbm,createtime,gxrq,sys_id)
	 					select @yljgdm,ltrim(rtrim(@yjlxh))+ltrim(rtrim(Str(a.id))), @yjlxh, a.value, b.value, GETDATE(),GETDATE(),'EMR' from
	 		            (select id, value from [dbo].[f_splitString](@czxyzdmc, @regex)) a,
	 		            (select id, value from [dbo].[f_splitString](@czxyzdbm, @regex)) b
	 		            where a.id = b.id
			            
	 		      Merge Into DC_RYJL_RCYJL_CYXYZD _target
	 					using #DC_RYJL_RCYJL_CYXYZD _source
	 					on(_source.yjlxh = _target.yjlxh)
	 					When  Matched  Then Update set
	 						 	_target.yljgdm  =_source.yljgdm  ,
	 							_target.yjlxh   =_source.yjlxh   ,
	 							_target.zyjlxh  =_source.zyjlxh  ,
	 							_target.czxyzdmc=_source.czxyzdmc,
	 							_target.czxyzdbm=_source.czxyzdbm,
	 							_target.sys_id  =_source.sys_id  ,
	 							_target.createtime    =_source.createtime    ,
	 							_target.gxrq  =_source.gxrq    
	 						When Not Matched By Target Then Insert
	 						(yljgdm,yjlxh,zyjlxh,czxyzdmc,czxyzdbm,createtime,gxrq,sys_id)
	 					values
	 					    (_source.yljgdm,_source.yjlxh,_source.zyjlxh,_source.czxyzdmc,_source.czxyzdbm,_source.createtime,_source.gxrq,_source.sys_id);
	 		      drop table #DC_RYJL_RCYJL_CYXYZD
			      
            set @error= @error + @@ERROR   --记录每次运行sql后是否正确，0正确
            fetch next from order_cursor into  @yjlxh, @zyszgcjg,@rzzybmmc,@rzzybmdm,@rzzyzhmc,@rzzyzhdm,@rzxyzdmc, @rzxzzdbm,@czzybmmc,@czzybmdm,@czzyzhmc,@czzyzhdm,@czxyzdmc, @czxyzdbm   --转到下一个游标
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
