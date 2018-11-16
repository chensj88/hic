alter PROCEDURE [dbo].[USP_SPLIT_ZYBCJL_SHSCBCJL]
    @yljgdm     varchar(20),    --医疗机构代码
    @regex		varchar(20) 	--分割符
as
  begin
	if exists (select 1 from  tempdb..sysobjects where  id = object_id('tempdb..#DC_ZYBCJL_SHSCBCJL'))
	drop table #DC_ZYBCJL_SHSCBCJL
	if exists (select 1 from  tempdb..sysobjects where  id = object_id('tempdb..#DC_ZYBCJL_SHSCBCJL_SHZD'))
	drop table DC_ZYBCJL_SHSCBCJL_SHZD
	
	--主表操作
	 create table  #DC_ZYBCJL_SHSCBCJL (    
		xh                   numeric(12)          identity(1, 1)/* 序号  */,
		yljgdm               varchar(20)          not null/* 医疗机构代码  */,
		jzlsh                varchar(64)          not null/* 就诊流水号 */,
		patid                varchar(64)          not null/* 患者patid */,
		zyh                  varchar(64)          not null/* 住院号标识 */,
		yjlxh                varchar(64)          not null/* 源记录序号 */,
		ksdm                 varchar(10)          not null/* 科室代码 */,
		ksmc                 varchar(50)          not null/* 科室名称 */,
		bqdm                 varchar(10)          not null/* 病区代码 */,
		bqmc                 varchar(50)          not null/* 病区名称 */,
		bfh                  varchar(10)          not null/* 病房号 */,
		bfmc                 varchar(50)          not null/* 病房名称 */,
		bch                  varchar(10)          not null/* 病床号 */,
		hzxm                 varchar(50)          not null/* 患者姓名 */,
		birth                datetime             not null/* 患者出生日期 */,
		lxdh                 varchar(50)          not null/* 联系电话 */,
		hyzkdm               varchar(20)          not null/* 患者婚姻状况代码 */,
		hyzk                 varchar(50)          not null/* 患者婚姻状况 */,
		mzdm                 varchar(20)          not null/* 民族代码 */,
		mz                   varchar(50)          not null/* 民族 */,
		hkszd                varchar(50)          null/* 户口所在地 */,
		csdz                 varchar(500)         null/* 出生地址 */,
		gzdw                 varchar(50)          null/* 工作单位名称 */,
		gzdwdz               varchar(500)         null/* 工作地点 */,
		gzdwdh               varchar(70)          null/* 工作单位电话 */,
		jgd                  varchar(50)          null/* 籍贯地 */,
		sfzhm                varchar(18)          not null/* 患者身份证号标识 */,
		xbdm                 varchar(2)           not null/* 性别代码 */,
		xbmc                 varchar(16)          not null/* 性别名称 */,
		nls                  numeric(3)           not null/* 年龄（岁） */,
		nly                  varchar(8)           null/* 年龄（月） */,
		jlrq                 datetime             not null/* 记录日期时间 */,
		ssczbm               varchar(64)          not null/* 手术及操作编码 */,
		ssmc                 varchar(128)         not null/* 手术名称 */,
		ssmbbwdm             varchar(64)          not null/* 手术目标部位编码 */,
		ssbwmc               varchar(128)         not null/* 手术目标部位名称 */,
		ssrq                 datetime             not null/* 手术日期时间 */,
		mzffdm               varchar(64)          not null/* 麻醉方法代码 */,
		mzffmc               varchar(128)         not null/* 麻醉方法名称 */,
		ssgc                 nvarchar(2000)       not null/* 手术过程 */,
		zdyjdm               nvarchar(1000)       not null/* 诊断依据编码 */,
		zdyj                 nvarchar(1000)       not null/* 诊断依据名称 */,
		zysx                 nvarchar(1000)       null/* 注意事项 */,
		ysbm                 varchar(20)          not null/* 签名人工号 */,
		ysqm                 varchar(50)          not null/* 签名人姓名 */,
		qmrq                 datetime             not null/* 签名日期时间 */,
		jzkssj               datetime             not null/* (入院)就诊开始时间 */,
		jzjssj               datetime             not null/* (出院)就诊结束时间 */,
		createtime 			 datetime 			  NULL,
		gxrq 				 datetime 			  NOT NULL,
		sys_id 			     varchar(50) 		  NOT NULL
		)
	  INSERT INTO #DC_ZYBCJL_SHSCBCJL (
		 yljgdm,jzlsh,patid,zyh,yjlxh,ksdm,ksmc,bqdm,bqmc,bfh,bfmc,bch,hzxm,birth,lxdh,hyzkdm,
		 hyzk,mzdm,mz,hkszd,csdz,gzdw,gzdwdz,gzdwdh,jgd,sfzhm,xbdm,xbmc,nls,nly,jlrq,ssczbm,ssmc,
		 ssmbbwdm,ssbwmc,ssrq,mzffdm,mzffmc,ssgc,zdyjdm,zdyj,zysx,ysbm,ysqm,qmrq,jzkssj,jzjssj,
		 createtime,gxrq,sys_id
	   ) 
		SELECT
			@yljgdm AS yljgdm, 
			CONVERT(varchar(64),jzlsh) AS jzlsh,CONVERT(varchar(64),patid) AS patid,CONVERT(varchar(64),zyh) AS zyh,
			CONVERT(varchar(64),yjlxh) AS yjlxh,CONVERT(varchar(10),ksdm) AS ksdm,CONVERT(varchar(50),ksmc) AS ksmc,
			CONVERT(varchar(10),bqdm) AS bqdm,CONVERT(varchar(50),bqmc) AS bqmc,CONVERT(varchar(10),bfh) AS bfh,
			CONVERT(varchar(50),bfmc) AS bfmc,CONVERT(varchar(10),bch) AS bch,CONVERT(varchar(50),hzxm) AS hzxm,
			CONVERT(datetime,birth) AS birth,CONVERT(varchar(50),lxdh) AS lxdh,CONVERT(varchar(20),hyzkdm) AS hyzkdm,
			CONVERT(varchar(50),hyzk) AS hyzk,CONVERT(varchar(20),mzdm) AS mzdm,CONVERT(varchar(50),mz) AS mz,
			CONVERT(varchar(50),hkszd) AS hkszd,CONVERT(varchar(500),csdz) AS csdz,CONVERT(varchar(50),gzdw) AS gzdw,
			CONVERT(varchar(500),gzdwdz) AS gzdwdz,CONVERT(varchar(70),gzdwdh) AS gzdwdh,CONVERT(varchar(50),jgd) AS jgd,
			CONVERT(varchar(18),sfzhm) AS sfzhm,CONVERT(varchar(2),xbdm) AS xbdm,CONVERT(varchar(16),xbmc) AS xbmc,
			CONVERT(numeric(3,0),nls) AS nls,CONVERT(varchar(8),nly) AS nly,CONVERT(datetime,jlrq) AS jlrq,
			CONVERT(varchar(64),ssczbm) AS ssczbm,CONVERT(varchar(128),ssmc) AS ssmc,
			CONVERT(varchar(64),ssmbbwdm) AS ssmbbwdm,CONVERT(varchar(128),ssbwmc) AS ssbwmc,
			CONVERT(datetime,ssrq) AS ssrq,CONVERT(varchar(64),mzffdm) AS mzffdm,
			CONVERT(varchar(128),mzffmc) AS mzffmc,CONVERT(nvarchar(2000),ssgc) AS ssgc,
			CONVERT(nvarchar(1000),zdyjdm) AS zdyjdm,CONVERT(nvarchar(1000),zdyj) AS zdyj,
			CONVERT(nvarchar(1000),zysx) AS zysx,CONVERT(varchar(20),ysbm) AS ysbm,
			CONVERT(varchar(50),ysqm) AS ysqm,CONVERT(datetime,qmrq) AS qmrq,
			CONVERT(datetime,jzkssj) AS jzkssj,CONVERT(datetime,jzjssj) AS jzjssj,
			getdate(),getdate(),'EMR' AS sys_id
			from HLHT_ZYBCJL_SHSCBCJL t
			WHERE t.STATUS=0
		 
		Merge Into DC_ZYBCJL_SHSCBCJL _target
		using #DC_ZYBCJL_SHSCBCJL _source
		on(_target.yjlxh = _source.yjlxh)
		When  Matched  Then Update set
			 	_target.yljgdm     =_source.yljgdm    ,
				_target.jzlsh      =_source.jzlsh     ,
				_target.patid      =_source.patid     ,
				_target.zyh        =_source.zyh       ,
				_target.yjlxh      =_source.yjlxh     ,
				_target.ksdm       =_source.ksdm      ,
				_target.ksmc       =_source.ksmc      ,
				_target.bqdm       =_source.bqdm      ,
				_target.bqmc       =_source.bqmc      ,
				_target.bfh        =_source.bfh       ,
				_target.bfmc       =_source.bfmc      ,
				_target.bch        =_source.bch       ,
				_target.hzxm       =_source.hzxm      ,
				_target.birth      =_source.birth     ,
				_target.lxdh       =_source.lxdh      ,
				_target.hyzkdm     =_source.hyzkdm    ,
				_target.hyzk       =_source.hyzk      ,
				_target.mzdm       =_source.mzdm      ,
				_target.mz         =_source.mz        ,
				_target.hkszd      =_source.hkszd     ,
				_target.csdz       =_source.csdz      ,
				_target.gzdw       =_source.gzdw      ,
				_target.gzdwdz     =_source.gzdwdz    ,
				_target.gzdwdh     =_source.gzdwdh    ,
				_target.jgd        =_source.jgd       ,
				_target.sfzhm      =_source.sfzhm     ,
				_target.xbdm       =_source.xbdm      ,
				_target.xbmc       =_source.xbmc      ,
				_target.nls        =_source.nls       ,
				_target.nly        =_source.nly       ,
				_target.jlrq       =_source.jlrq      ,
				_target.ssczbm     =_source.ssczbm    ,
				_target.ssmc       =_source.ssmc      ,
				_target.ssmbbwdm   =_source.ssmbbwdm  ,
				_target.ssbwmc     =_source.ssbwmc    ,
				_target.ssrq       =_source.ssrq      ,
				_target.mzffdm     =_source.mzffdm    ,
				_target.mzffmc     =_source.mzffmc    ,
				_target.ssgc       =_source.ssgc      ,
				_target.zdyjdm     =_source.zdyjdm    ,
				_target.zdyj       =_source.zdyj      ,
				_target.zysx       =_source.zysx      ,
				_target.ysbm       =_source.ysbm      ,
				_target.ysqm       =_source.ysqm      ,
				_target.qmrq       =_source.qmrq      ,
				_target.jzkssj     =_source.jzkssj    ,
				_target.jzjssj     =_source.jzjssj    ,
				_target.createtime =_source.createtime,
				_target.gxrq	     =_source.gxrq	    , 
				_target.sys_id     =_source.sys_id   
		When Not Matched By Target Then Insert
			(  
				 yljgdm,jzlsh,patid,zyh,yjlxh,ksdm,ksmc,bqdm,bqmc,bfh,bfmc,bch,hzxm,birth,lxdh,hyzkdm,
				 hyzk,mzdm,mz,hkszd,csdz,gzdw,gzdwdz,gzdwdh,jgd,sfzhm,xbdm,xbmc,nls,nly,jlrq,ssczbm,ssmc,
				 ssmbbwdm,ssbwmc,ssrq,mzffdm,mzffmc,ssgc,zdyjdm,zdyj,zysx,ysbm,ysqm,qmrq,jzkssj,jzjssj,
				 createtime,gxrq,sys_id
		  )
		values
			( 		
			_source.yljgdm,_source.jzlsh,_source.patid,_source.zyh,_source.yjlxh,_source.ksdm,_source.ksmc,
			_source.bqdm,_source.bqmc,_source.bfh,_source.bfmc,_source.bch,_source.hzxm,_source.birth,
			_source.lxdh,_source.hyzkdm,_source.hyzk,_source.mzdm,_source.mz,_source.hkszd,_source.csdz,
			_source.gzdw,_source.gzdwdz,_source.gzdwdh,_source.jgd,_source.sfzhm,_source.xbdm,_source.xbmc,
			_source.nls,_source.nly,_source.jlrq,_source.ssczbm,_source.ssmc,_source.ssmbbwdm,_source.ssbwmc,
			_source.ssrq,_source.mzffdm,_source.mzffmc,_source.ssgc,_source.zdyjdm,_source.zdyj,_source.zysx,
			_source.ysbm,_source.ysqm,_source.qmrq,_source.jzkssj,_source.jzjssj,_source.createtime,_source.gxrq	,
			_source.sys_id
			 );
        drop table #DC_ZYBCJL_SHSCBCJL
	
    declare @error int
    -- 住院病程记录－术后首次病程记录_术后诊断
    declare @yjlxh as nvarchar(max),@shzdmc as nvarchar(max), @shzdbm as nvarchar(max)
    set @error = 0
    begin tran  --申明事务
    --申明游标为,需要加时间范围
    declare order_cursor cursor for (select yjlxh,shzdmc,shzdbm from [dbo].[HLHT_ZYBCJL_SHSCBCJL] where STATUS=0)
    --打开游标--
    open order_cursor
    --开始循环游标变量--
    fetch next from order_cursor into  @yjlxh, @shzdmc,@shzdbm
    while @@FETCH_STATUS = 0 --返回被 FETCH语句执行的最后游标的状态--
        begin
	 			--住院病程记录－术后首次病程记录_术后诊断
	 			create table  #DC_ZYBCJL_SHSCBCJL_SHZD (    
	 				    xh                   numeric(12)          identity(1, 1)/* 序号  */,
						yljgdm               varchar(20)          not null/* 医疗机构代码  */,
						yjlxh                varchar(64)          not null/* 源记录序号 */,
						zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
						shzdmc               varchar(128)         not null/* 术后诊断名称 */,
						shzdbm               varchar(64)          not null/* 术后诊断编码 */,
	 				    createtime 			 datetime 						NULL,
						gxrq 				 datetime 						NOT NULL,
						sys_id 				 varchar(50) 					NOT NULL
	 			)
						
	 			insert  into #DC_ZYBCJL_SHSCBCJL_SHZD(yljgdm,yjlxh,zyjlxh,shzdmc,shzdbm,createtime,gxrq,sys_id)
	 			select @yljgdm,ltrim(rtrim(@yjlxh))+ltrim(rtrim(Str(a.id))), @yjlxh, a.value, b.value,GETDATE(),GETDATE(),'EMR' from
	 		    (select id, value from [dbo].[f_splitString](@shzdmc, @regex)) a,
	 		    (select id, value from [dbo].[f_splitString](@shzdbm, @regex)) b
	 		    where a.id = b.id
			            
	 		    Merge Into DC_ZYBCJL_SHSCBCJL_SHZD _target
	 			using #DC_ZYBCJL_SHSCBCJL_SHZD _source
	 			on(_source.yjlxh = _target.yjlxh)
	 			When  Matched  Then Update set
	 					_target.yljgdm  =_source.yljgdm  ,
	 					_target.yjlxh   =_source.yjlxh   ,
	 					_target.zyjlxh  =_source.zyjlxh  ,
	 					_target.shzdmc  =_source.shzdmc,
	 					_target.shzdbm  =_source.shzdbm,
	 					_target.sys_id  =_source.sys_id  ,
	 					_target.createtime =_source.createtime    ,
	 					_target.gxrq  =_source.gxrq	 							 
	 			When Not Matched By Target Then Insert
	 				(yljgdm,yjlxh,zyjlxh,shzdmc,shzdbm,createtime,gxrq,sys_id)
	 			values
	 				(_source.yljgdm,_source.yjlxh,_source.zyjlxh,_source.shzdmc,_source.shzdbm,_source.createtime,_source.gxrq,_source.sys_id);
	 		    drop table #DC_ZYBCJL_SHSCBCJL_SHZD
			      
            set @error= @error + @@ERROR   --记录每次运行sql后是否正确，0正确
            fetch next from order_cursor into  @yjlxh, @shzdmc,@shzdbm   --转到下一个游标
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
