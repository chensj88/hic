 /*========================================================================*/
 /* DC_BLGY_HZJBXX     病历概要－患者基本信息                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_BLGY_HZJBXX') )
 create table  DC_BLGY_HZJBXX (    
    xh                   numeric(12)          identity(1, 1)/* 序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码 */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    jzlb                 varchar(2)           not null/* 就诊类别 */,
    mjzh                 varchar(64)          not null/* 门急诊号 */,
    zyh                  varchar(64)          not null/* 住院号 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    jkdabh               varchar(17)          not null/* 城乡居民健康档案编号 */,
    sfzhm                varchar(18)          not null/* 患者身份证件号码 */,
    sfzjlb               varchar(2)           not null/* 患者身份证件类别代码 */,
    sfzjlbmc             varchar(64)          not null/* 患者身份证件类别名称 */,
    jkkh                 varchar(18)          not null/* 健康卡号 */,
    yblbdm               varchar(2)           not null/* 医疗保险类别代码 */,
    yblbmc               varchar(50)          not null/* 医疗保险类别名称 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    csrq                 date                 not null/* 出生日期 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    hyzkdm               varchar(2)           not null/* 婚姻状况代码 */,
    hyzkmc               varchar(32)          not null/* 婚姻状况名称 */,
    mz                   varchar(2)           not null/* 民族代码 */,
    mzmc                 varchar(32)          not null/* 民族 */,
    zylb                 varchar(2)           null/* 职业类别代码 */,
    zymc                 varchar(32)          null/* 职业类别名称 */,
    gzdw                 varchar(70)          not null/* 工作单位名称 */,
    gzdwhm               varchar(20)          not null/* 工作单位电话号码 */,
    dzlbdm               varchar(2)           not null/* 地址类别代码 */,
    dzlbmc               varchar(32)          not null/* 地址类别名称 */,
    dzsf                 varchar(70)          not null/* 地址-省（自治区、直辖市） */,
    dzsq                 varchar(70)          not null/* 地址-市（地区、州） */,
    dzx                  varchar(70)          not null/* 地址-县（区） */,
    dzxz                 varchar(70)          not null/* 地址-乡（镇、街道办事处） */,
    dzc                  varchar(70)          not null/* 地址-村（街、路、弄等） */,
    dzmphm               varchar(70)          not null/* 地址-门牌号码 */,
    yzbm                 varchar(6)           null/* 邮政编码 */,
    hzdhhm               varchar(20)          null/* 患者电话号码 */,
    lxrxm                varchar(50)          null/* 联系人姓名 */,
    lxrhm                varchar(20)          null/* 联系人电话号码 */,
    jdrqsj               datetime             not null/* 建档日期时间 */,
    jdzzjgdm             varchar(10)          not null/* 建档医疗机构组织机构代码 */,
    jdzzjgmc             varchar(70)          not null/* 建档医疗机构组织机构名称 */,
    jdzbm                varchar(20)          not null/* 建档者工号 */,
    jdzxm                varchar(32)          not null/* 建档者姓名 */,
   
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('dbo.DC_BLGY_HZJBXX') and minor_id = 0)
begin 
   execute sp_dropextendedproperty 'MS_Description',  
   'user', 'dbo', 'table', 'DC_BLGY_HZJBXX' 
 
end 


execute sp_addextendedproperty 'MS_Description',  
   '病历概要－患者基本信息 ', 
   'user', 'dbo', 'table', 'DC_BLGY_HZJBXX'
go

/*========================================================================*/
 /* DC_BLGY_JBJKXX     病历概要 — 基本健康信息                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_BLGY_JBJKXX') )
 create table  DC_BLGY_JBJKXX (    
    xh                   numeric(12)          identity(1, 1)/* 序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码 */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    jzlb                 varchar(2)           not null/* 就诊类别 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    hzxm                 varchar(64)          not null/* 患者姓名 */,
    mjzh                 varchar(64)          not null/* 门急诊号 */,
    zyh                  varchar(64)          not null/* 住院号 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    sfzhm                varchar(18)          not null/* 患者身份证件号码 */,
    jkkh                 varchar(18)          not null/* 居民健康卡号 */,
    aboxxdm              varchar(4)           not null/* ABO血型代码 */,
    aboxxmc              varchar(18)          not null/* ABO血型名称 */,
    rhxxdm               varchar(4)           not null/* Rh血型代码 */,
    rhxxmc               varchar(18)          not null/* Rh血型名称 */,
    sxs                  nvarchar(1000)       not null/* 输血史 */,
    grs                  nvarchar(1000)       not null/* 个人史 */,
    yjs                  nvarchar(1000)       not null/* 月经史 */,
   
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_BLGY_JBJKXX_CRBS     病历概要 — 基本健康信息_传染病史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_BLGY_JBJKXX_CRBS') )
 create table  DC_BLGY_JBJKXX_CRBS (    
    xh                   numeric(12)          identity(1, 1)/* 序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    jzs                  nvarchar(1000)       not null/* 家族史 */,
   
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_BLGY_JBJKXX_GMS     病历概要 — 基本健康信息_过敏史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_BLGY_JBJKXX_GMS') )
 create table  DC_BLGY_JBJKXX_GMS (    
    xh                   numeric(12)          identity(1, 1)/* 序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    gms                  nvarchar(1000)       not null/* 过敏史 */,
   
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_BLGY_JBJKXX_JBS     病历概要 — 基本健康信息_疾病史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_BLGY_JBJKXX_JBS') )
 create table  DC_BLGY_JBJKXX_JBS (    
    xh                   numeric(12)          identity(1, 1)/* 序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    jbs                  nvarchar(1000)       not null/* 疾病史（含外伤） */,
   
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_BLGY_JBJKXX_JZ_JZS     病历概要 — 基本健康信息_家族史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_BLGY_JBJKXX_JZ_JZS') )
 create table  DC_BLGY_JBJKXX_JZ_JZS (    
    xh                   numeric(12)          identity(1, 1)/* 序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    jzs                  nvarchar(1000)       not null/* 家族史 */,
   
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_BLGY_JBJKXX_SSS     病历概要 — 基本健康信息_手术史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_BLGY_JBJKXX_SSS') )
 create table  DC_BLGY_JBJKXX_SSS (    
    xh                   numeric(12)          identity(1, 1)/* 序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    sss                  nvarchar(1000)       not null/* 手术史 */,
   
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_BLGY_JBJKXX_SYS     病历概要 — 基本健康信息_婚育史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_BLGY_JBJKXX_SYS') )
 create table  DC_BLGY_JBJKXX_SYS (    
    xh                   numeric(12)          identity(1, 1)/* 序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    hys                  nvarchar(1000)       not null/* 婚育史 */,
   
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_BLGY_JBJKXX_YFJZS     病历概要 — 基本健康信息_预防接种史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_BLGY_JBJKXX_YFJZS') )
 create table  DC_BLGY_JBJKXX_YFJZS (    
    xh                   numeric(12)          identity(1, 1)/* 序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    yfjzs                nvarchar(1000)       not null/* 预防接种史 */,
   
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_BLGY_WSSJZY     病历概要 — 卫生事件摘要                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_BLGY_WSSJZY') )
 create table  DC_BLGY_WSSJZY (    
    xh                   numeric(12)          identity(1, 1)/* 序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码 */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    jzlb                 varchar(2)           not null/* 就诊类别 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    hzxm                 varchar(64)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 患者身份证件号码 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    jmjkkh               varchar(18)          not null/* 居民健康卡号 */,
    zzjgdm               varchar(10)          not null/* 医疗机构组织机构代码 */,
    zzjgmc               varchar(70)          not null/* 医疗机构组织机构名称 */,
    ksdm                 varchar(10)          not null/* 医疗机构科室代码 */,
    ksmc                 varchar(50)          not null/* 医疗机构科室名称 */,
    hzlxdm               varchar(2)           not null/* 患者类型代码 */,
    hzlxmc               varchar(50)          not null/* 患者类型名称 */,
    mjzh                 varchar(64)          not null/* 门急诊号 */,
    zyh                  varchar(64)          not null/* 住院号 */,
    jzrqsj               datetime             not null/* 就诊日期时间 */,
    ryrqsj               datetime             not null/* 入院日期时间 */,
    cyrqsj               datetime             not null/* 出院日期时间 */,
    fbrqsj               datetime             not null/* 发病日期时间 */,
    jzyy                 nvarchar(1000)       not null/* 就诊原因 */,
    qtxyzd               varchar(64)          null/* 其他西医诊断编码 */,
    qtxyzdmc             varchar(128)         null/* 其他西医诊断名称 */,
    qtyxcz               nvarchar(2000)       not null/* 其他医学处置 */,
    gbsy                 varchar(32)          null/* 根本死因代码 */,
    gbsymc               varchar(500)         null/* 根本死因名称 */,
    zljg                 varchar(2)           null/* 治疗结果代码 */,
    zljgmc               varchar(20)          null/* 治疗结果名称 */,
    zrysbm               varchar(20)          not null/* 责任医师工号 */,
    zrys                 varchar(50)          not null/* 责任医师姓名 */,
   
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_BLGY_WSSJZY_GYJW     病历概要 — 卫生事件摘要_关键药物                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_BLGY_WSSJZY_GYJW') )
 create table  DC_BLGY_WSSJZY_GYJW (    
    xh                   numeric(12)          identity(1, 1)/* 序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    gjywdm               varchar(100)         not null/* 关键药物代码 */,
    gjywmc               varchar(500)         not null/* 关键药物名称 */,
    gjywyf               nvarchar(100)        not null/* 关键药物用法 */,
    ywblfy               nvarchar(100)        not null/* 药物不良反应情况 */,
    zysylb               varchar(2)           not null/* 中药使用类别代码 */,
    zysylbmc             varchar(18)          not null/* 中药使用类别名称 */,
   
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_BLGY_WSSJZY_SSCZ     病历概要 — 卫生事件摘要_手术操作                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_BLGY_WSSJZY_SSCZ') )
 create table  DC_BLGY_WSSJZY_SSCZ (    
    xh                   numeric(12)          identity(1, 1)/* 序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    ssjcz                varchar(64)          null/* 手术及操作编码 */,
    ssjczmc              varchar(128)         null/* 手术及操作名称 */,
   
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_BLGY_WSSJZY_XYZD     病历概要 — 卫生事件摘要_西医诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_BLGY_WSSJZY_XYZD') )
 create table  DC_BLGY_WSSJZY_XYZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    xyzd                 varchar(64)          not null/* 西医诊断编码 */,
    xyzdmc               varchar(128)         not null/* 西医诊断名称 */,
   
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_BLGY_WSSJZY_ZYZD     病历概要 — 卫生事件摘要_中医诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_BLGY_WSSJZY_ZYZD') )
 create table  DC_BLGY_WSSJZY_ZYZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    zybm                 varchar(64)          null/* 中医病名代码 */,
    zybmmc               varchar(128)         null/* 中医病名名称 */,
    zyzh                 varchar(64)          null/* 中医证候代码 */,
    zyzhmc               varchar(128)         null/* 中医证候名称 */,
   
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_BLGY_YLFYJL     病历概要 — 医疗费用记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_BLGY_YLFYJL') )
 create table  DC_BLGY_YLFYJL (    
    xh                   numeric(12)          identity(1, 1)/* 序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码 */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    jzlb                 varchar(2)           not null/* 就诊类别 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    jkkh                 varchar(18)          not null/* 健康卡号 */,
    hzxm                 varchar(64)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 患者身份证件号码 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    mjzh                 varchar(64)          not null/* 门急诊号 */,
    zyh                  varchar(64)          not null/* 住院号 */,
    ffdm                 varchar(2)           not null/* 医疗付费方式代码 */,
    fffs                 varchar(64)          not null/* 医疗付费方式名称 */,
    mzfyje               numeric(8,2)         not null/* 门诊费用金额 */,
    zyfyje               numeric(10,2)        not null/* 住院费用金额 */,
    grcdfy               numeric(10,2)        not null/* 个人承担费用金额 */,
   
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('dbo.DC_BLGY_YLFYJL') and minor_id = 0)
begin 
   execute sp_dropextendedproperty 'MS_Description',  
   'user', 'dbo', 'table', 'DC_BLGY_YLFYJL' 
 
end 


execute sp_addextendedproperty 'MS_Description',  
   '病历概要 — 医疗费用记录 ', 
   'user', 'dbo', 'table', 'DC_BLGY_YLFYJL'
go

/*========================================================================*/
 /* DC_CYXJ_CYXJ     出院小结－出院小结                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_CYXJ_CYXJ') )
 create table  DC_CYXJ_CYXJ (    
    xh                   numeric(12)          identity(1, 1)/* 序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码 */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    zyh                  varchar(64)          not null/* 住院号标识 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zzjgdm               varchar(10)          not null/* 医疗机构组织机构代码 */,
    zzjgmc               varchar(70)          not null/* 医疗机构组织机构名称 */,
    jkkh                 varchar(18)          not null/* 居民健康卡号 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 患者身份证号标识 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    hyzkdm               varchar(2)           not null/* 婚姻状况代码 */,
    hyzkmc               varchar(32)          not null/* 婚姻状况名称 */,
    zylbdm               varchar(2)           not null/* 职业类别代码 */,
    zylbmc               varchar(32)          not null/* 职业类别名称 */,
    hzdhhm               varchar(20)          not null/* 患者电话号码 */,
    zzlbdm               varchar(2)           not null/* 地址类别代码 */,
    zzlbmc               varchar(20)          not null/* 地址类别名称 */,
    dzsf                 varchar(70)          not null/* 地址-省（自治区、直辖市） */,
    dzsq                 varchar(70)          not null/* 地址-市（地区、州） */,
    dzx                  varchar(70)          not null/* 地址-县（区） */,
    dzxz                 varchar(70)          not null/* 地址-乡（镇、街道办事处） */,
    dzc                  varchar(70)          not null/* 地址-村（街、路、弄等） */,
    dzmphm               varchar(70)          not null/* 地址-门牌号码 */,
    yzbm                 varchar(6)           not null/* 邮政编码 */,
    lxrxm                varchar(50)          not null/* 联系人姓名 */,
    lxrdhhm              varchar(20)          not null/* 联系人电话号码 */,
    ryrq                 datetime             not null/* 入院日期时间 */,
    cyrq                 datetime             not null/* 出院日期时间 */,
    sjzyts               int                  not null/* 实际住院天数 */,
    ryqk                 nvarchar(2000)       not null/* 入院情况 */,
    zyszgcjg             nvarchar(1000)       null/* 中医“四诊”观察结果 */,
    ssqklbdm             char(1)              not null/* 手术切口类别代码 */,
    ssqklbmc             varchar(20)          not null/* 手术切口类别名称 */,
    qkyhdjdm             char(1)              not null/* 切口愈合等级代码 */,
    qkyhdjmc             varchar(20)          not null/* 切口愈合等级名称 */,
    ssczbm               varchar(64)          not null/* 手术及操作编码 */,
    ssjczmc              varchar(128)         not null/* 手术及操作名称 */,
    ssczksrq             datetime             not null/* 手术及操作开始日期时间 */,
    mzffdm               varchar(2)           not null/* 麻醉方法代码 */,
    mzffmc               varchar(30)          not null/* 麻醉方法名称 */,
    ssgc                 nvarchar(200)        not null/* 手术过程 */,
    zfbm                 varchar(20)          null/* 治则治法编码 */,
    zzzf                 nvarchar(100)        null/* 治则治法名称 */,
    zyjzff               nvarchar(100)        null/* 中药煎煮方法 */,
    zyyyff               nvarchar(100)        null/* 中药用药方法 */,
    zlgcms               nvarchar(2000)       not null/* 诊疗过程描述 */,
    cyqk                 nvarchar(2000)       not null/* 出院情况 */,
    cyzztz               nvarchar(1000)       not null/* 出院时症状与体征 */,
    cyyz                 nvarchar(1000)       not null/* 出院医嘱 */,
    zljgdm               char(1)              not null/* 治疗结果代码 */,
    zljgmc               varchar(20)          not null/* 治疗结果名称 */,
    zyysbm               varchar(20)          not null/* 住院医师工号 */,
    zyysqm               varchar(50)          not null/* 住院医师签名 */,
    sjysbm               varchar(20)          not null/* 上级医师工号 */,
    sjysqm               varchar(50)          not null/* 上级医师签名 */,
    qmrq                 datetime             not null/* 签名日期时间 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_CYXJ_CYXJ_CYXYZD     出院小结－出院小结_出院西医诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_CYXJ_CYXJ_CYXYZD') )
 create table  DC_CYXJ_CYXJ_CYXYZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    czxyzdbm             varchar(64)          not null/* 出院诊断-西医诊断编码 */,
    czxyzd               varchar(128)         not null/* 出院诊断-西医诊断名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_CYXJ_CYXJ_CYZYBH     出院小结－出院小结_出院中医证候                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_CYXJ_CYXJ_CYZYBH') )
 create table  DC_CYXJ_CYXJ_CYZYBH (    
    xh                   numeric(12)          identity(1, 1)/* 序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    czzyzhdm             varchar(64)          null/* 出院诊断-中医证候代码 */,
    czzyzh               varchar(128)         null/* 出院诊断-中医证候名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_CYXJ_CYXJ_CYZYBM     出院小结－出院小结_出院中医病名                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_CYXJ_CYXJ_CYZYBM') )
 create table  DC_CYXJ_CYXJ_CYZYBM (    
    xh                   numeric(12)          identity(1, 1)/* 序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    czzybmdm             varchar(64)          null/* 出院诊断-中医病名代码 */,
    czzybm               varchar(128)         null/* 出院诊断-中医病名名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_CYXJ_CYXJ_RYXYZD     出院小结－出院小结_入院西医诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_CYXJ_CYXJ_RYXYZD') )
 create table  DC_CYXJ_CYXJ_RYXYZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    rzxyzdbm             varchar(64)          not null/* 入院诊断-西医诊断编码 */,
    rzxyzd               varchar(128)         not null/* 入院诊断-西医诊断名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_CYXJ_CYXJ_RYZYBM     出院小结－出院小结_入院中医病名                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_CYXJ_CYXJ_RYZYBM') )
 create table  DC_CYXJ_CYXJ_RYZYBM (    
    xh                   numeric(12)          identity(1, 1)/* 序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    rzzybmdm             varchar(64)          null/* 入院诊断-中医病名代码 */,
    rzzybm               varchar(128)         null/* 入院诊断-中医病名名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_CYXJ_CYXJ_RYZYZH     出院小结－出院小结_入院中医证候                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_CYXJ_CYXJ_RYZYZH') )
 create table  DC_CYXJ_CYXJ_RYZYZH (    
    xh                   numeric(12)          identity(1, 1)/* 序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    rzzyzhdm             varchar(64)          null/* 入院诊断-中医证候代码 */,
    rzzyzh               varchar(128)         null/* 入院诊断-中医证候名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_CYXJ_CYXJ_YXFZJCJG     出院小结－出院小结_阳性辅助检查结果                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_CYXJ_CYXJ_YXFZJCJG') )
 create table  DC_CYXJ_CYXJ_YXFZJCJG (    
    xh                   numeric(12)          identity(1, 1)/* 序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    yxfzjcjg             nvarchar(1000)       null/* 阳性辅助检查结果 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_BZBWHL     护理操作记录 — 病重（病危）患者护理记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_BZBWHL') )
 create table  DC_HLCZJL_BZBWHL (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    zyh                  varchar(64)          not null/* 住院号 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    yexh                 varchar(64)          not null/* 婴儿序号 */,
    zzjgdm               varchar(10)          not null/* 医疗机构组织机构代码 */,
    zzjgmc               varchar(70)          not null/* 医疗机构组织机构名称 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    hldjdm               varchar(2)           not null/* 护理等级代码 */,
    hldjmc               varchar(64)          not null/* 护理等级名称 */,
    hllxdm               varchar(2)           not null/* 护理类型代码 */,
    hllxmc               varchar(64)          not null/* 护理类型名称 */,
    tzkg                 numeric(6,2)         not null/* 体重（kg） */,
    tw                   numeric(4,1)         not null/* 体温（℃） */,
    xl                   numeric(3)           not null/* 心率（次/min） */,
    hxpl                 numeric(3)           not null/* 呼吸频率（次/min） */,
    ssy                  numeric(3)           not null/* 收缩压（mmHg） */,
    szy                  numeric(3)           not null/* 舒张压（mmHg） */,
    xt                   numeric(4,1)         not null/* 血糖检测值（mmol/L） */,
    ysqkdm               varchar(2)           not null/* 饮食情况代码 */,
    ysqkmc               varchar(100)         not null/* 饮食情况名称 */,
    hxjjhxm              varchar(20)          not null/* 呼吸机监护项目 */,
    hsdm                 varchar(20)          not null/* 护士工号 */,
    hsqm                 varchar(50)          not null/* 护士签名 */,
    qmrqsj               datetime             not null/* 签名日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_BZBWHL_GMS     护理操作记录 — 病重（病危）患者护理记录_过敏史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_BZBWHL_GMS') )
 create table  DC_HLCZJL_BZBWHL_GMS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    gms                  varchar(1000)        null/* 过敏史 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_BZBWHL_HLCZ     护理操作记录 — 病重（病危）患者护理记录_护理操作                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_BZBWHL_HLCZ') )
 create table  DC_HLCZJL_BZBWHL_HLCZ (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    hlczmc               varchar(100)         not null/* 护理操作名称 */,
    hlczxmlmmc           varchar(100)         not null/* 护理操作项目类目名称 */,
    hlczjg               varchar(1000)        not null/* 护理操作结果 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_BZBWHL_HLGC     护理操作记录 — 病重（病危）患者护理记录_护理观察                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_BZBWHL_HLGC') )
 create table  DC_HLCZJL_BZBWHL_HLGC (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    hlgcxmmc             varchar(30)          not null/* 护理观察项目名称 */,
    hlgcjg               varchar(1000)        not null/* 护理观察结果 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_BZBWHL_ZDXX     护理操作记录 — 病重（病危）患者护理记录_诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_BZBWHL_ZDXX') )
 create table  DC_HLCZJL_BZBWHL_ZDXX (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    zdbm                 varchar(64)          not null/* 疾病诊断编码 */,
    zdmc                 varchar(128)         not null/* 疾病诊断名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_CRL     护理操作记录 — 出入量记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_CRL') )
 create table  DC_HLCZJL_CRL (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    yexh                 varchar(64)          not null/* 婴儿序号 */,
    zyh                  varchar(64)          not null/* 住院号 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    birth                date                 not null/* 患者出生日期 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    tzkg                 numeric(6,2)         not null/* 体重（kg） */,
    zdbm                 varchar(64)          not null/* 疾病诊断编码 */,
    zdmc                 varchar(128)         not null/* 疾病诊断名称 */,
    hldjdm               varchar(2)           not null/* 护理等级代码 */,
    hldjmc               varchar(64)          not null/* 护理等级名称 */,
    hllxdm               varchar(2)           not null/* 护理类型代码 */,
    hllxmc               varchar(64)          not null/* 护理类型名称 */,
    jlrqsj               datetime             not null/* 记录日期时间 */,
    otbz                 char(1)              not null/* 呕吐标志 */,
    pnknbz               char(1)              not null/* 排尿困难标志 */,
    hsdm                 varchar(20)          not null/* 护士工号 */,
    hsqm                 varchar(50)          not null/* 护士签名 */,
    qmrqsj               datetime             not null/* 签名日期时间 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_CRL_HLCZ     护理操作记录 — 出入量记录_护理操作                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_CRL_HLCZ') )
 create table  DC_HLCZJL_CRL_HLCZ (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    hlczxmlmmc           varchar(100)         not null/* 护理操作项目类目名称 */,
    hlczdm               varchar(10)          not null/* 护理操作代码 */,
    hlczmc               varchar(100)         not null/* 护理操作名称 */,
    hlczjg               varchar(1000)        not null/* 护理操作结果 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_CRL_HLGC     护理操作记录 — 出入量记录_护理观察                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_CRL_HLGC') )
 create table  DC_HLCZJL_CRL_HLGC (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    hlgcxmmc             varchar(64)          not null/* 护理观察项目名称 */,
    hlgcjg               varchar(1000)        not null/* 护理观察结果 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_CRL_YYMX     护理操作记录 — 出入量记录_用药条目                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_CRL_YYMX') )
 create table  DC_HLCZJL_CRL_YYMX (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    ywyf                 varchar(100)         null/* 药物用法 */,
    zysylbdm             varchar(2)           null/* 中药使用类别代码 */,
    zysylbmc             varchar(100)         null/* 中药使用类别名称 */,
    ywsypl               varchar(2)           null/* 药物使用频率 */,
    ywsyplmc             varchar(100)         null/* 药物使用名称 */,
    ywsyjldw             varchar(6)           null/* 药物使用剂量单位 */,
    ywsycjl              numeric(12,2)        null/* 药物使用次剂量 */,
    ywsyzjl              numeric(12,2)        null/* 药物使用总剂量 */,
    ywsytjdm             varchar(4)           null/* 药物使用途径代码 */,
    ywsytjmc             varchar(50)          null/* 药物使用途径名称 */,
    ywdm                 varchar(50)          null/* 药物代码 */,
    ywmc                 varchar(50)          null/* 药物名称 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_CRL_ZDXX     护理操作记录 — 出入量记录_诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_CRL_ZDXX') )
 create table  DC_HLCZJL_CRL_ZDXX (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    zdbm                 varchar(64)          not null/* 疾病诊断编码 */,
    zdmc                 varchar(128)         not null/* 疾病诊断名称 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_GZHC     护理操作记录 — 高值耗材使用记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_GZHC') )
 create table  DC_HLCZJL_GZHC (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    zyh                  varchar(64)          not null/* 住院号 */,
    yexh                 varchar(64)          not null/* 婴儿序号 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    jlrqsj               datetime             not null/* 记录日期时间 */,
    zrxhcbz              char(1)              not null/* 植入性耗材标志 */,
    clmc                 varchar(200)         not null/* 材料名称 */,
    cpbm                 numeric(20)          not null/* 产品编码 */,
    cpsccj               varchar(70)          not null/* 产品生产厂家 */,
    cpgys                varchar(70)          not null/* 产品供应商 */,
    dw                   varchar(6)           not null/* 耗材单位 */,
    sl                   numeric(5)           not null/* 数量 */,
    sytj                 varchar(30)          not null/* 使用途径 */,
    hsdm                 varchar(20)          not null/* 护士工号 */,
    hsqm                 varchar(50)          not null/* 护士签名 */,
    qmrqsj               datetime             not null/* 签名日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_GZHC_ZDXX     护理操作记录 — 高值耗材使用记录_诊断信息                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_GZHC_ZDXX') )
 create table  DC_HLCZJL_GZHC_ZDXX (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    zddm                 varchar(64)          not null/* 疾病诊断编码 */,
    zdmc                 varchar(128)         not null/* 疾病诊断名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_SMTZ     护理操作记录 — 生命体征测量记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_SMTZ') )
 create table  DC_HLCZJL_SMTZ (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    zyh                  varchar(64)          not null/* 住院号 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    yexh                 varchar(64)          not null/* 婴儿序号 */,
    birth                date                 not null/* 患者出生日期 */,
    zzjgdm               varchar(10)          not null/* 医疗机构组织机构代码 */,
    zzjgmc               varchar(70)          not null/* 医疗机构组织机构名称 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bfmc                 varchar(64)          not null/* 病房名称 */,
    bch                  varchar(10)          not null/* 病床号 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    zdbm                 varchar(32)          not null/* 疾病诊断编码 */,
    zdmc                 varchar(128)         not null/* 疾病诊断名称 */,
    ryrqsj               datetime             not null/* 入院日期时间 */,
    cyrqsj               datetime             null/* (出院)就诊结束时间 */,
    sjzyts               numeric(4)           null/* 实际住院天数 */,
    sshfmhts             numeric(5)           null/* 手术或分娩后天数 */,
    jlrqsj               datetime             not null/* 记录日期时间 */,
    hxpl                 numeric(6,2)         not null/* 呼吸频率（次/min） */,
    syhxjbz              char(1)              not null/* 使用呼吸机标志 */,
    ml                   numeric(3)           not null/* 脉率（次/min） */,
    qbxl                 numeric(3)           not null/* 起搏器心率（次/min） */,
    tw                   numeric(4,1)         not null/* 体温（℃） */,
    ssy                  numeric(3)           not null/* 收缩压（mmHg） */,
    szy                  numeric(3)           not null/* 舒张压（mmHg） */,
    tzkg                 numeric(6,2)         not null/* 体重（kg） */,
    fw                   numeric(5,1)         not null/* 腹围（cm） */,
    hlgcxmmc             varchar(30)          not null/* 护理观察项目名称 */,
    hlgcjg               varchar(1000)        not null/* 护理观察结果 */,
    hsdm                 varchar(20)          not null/* 护士工号 */,
    hsqm                 varchar(50)          not null/* 护士签名 */,
    qmrqsj               datetime             not null/* 签名日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_SMTZ_HLGC     护理操作记录 — 生命体征测量记录_护理观察                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_SMTZ_HLGC') )
 create table  DC_HLCZJL_SMTZ_HLGC (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    hlgcxmmc             varchar(30)          not null/* 护理观察项目名称 */,
    hlgcjg               varchar(1000)        not null/* 护理观察结果 */,
   
    
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_SMTZ_ZDXX     护理操作记录 — 生命体征测量记录_疾病诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_SMTZ_ZDXX') )
 create table  DC_HLCZJL_SMTZ_ZDXX (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    zdbm                 varchar(32)          not null/* 疾病诊断编码 */,
    zdmc                 varchar(128)         not null/* 疾病诊断名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_SSHL     护理操作记录 — 手术护理记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_SSHL') )
 create table  DC_HLCZJL_SSHL (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    birth                date                 not null/* 患者出生日期 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    yexh                 varchar(64)          not null/* 婴儿序号 */,
    mjzh                 varchar(18)          not null/* 门（急）诊号 */,
    zyh                  varchar(64)          not null/* 住院号 */,
    jzlb                 varchar(2)           not null/* 就诊类别 */,
    zzjgdm               varchar(10)          not null/* 医疗机构组织机构代码 */,
    zzjgmc               varchar(70)          not null/* 医疗机构组织机构名称 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bfmc                 varchar(50)          not null/* 病房名称 */,
    bch                  varchar(10)          not null/* 病床号 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    tzkg                 numeric(6,2)         not null/* 体重（kg） */,
    aboxxdm              varchar(2)           not null/* ABO血型代码 */,
    aboxxmc              varchar(18)          not null/* ABO血型名称 */,
    rhxxdm               varchar(2)           not null/* Rh血型代码 */,
    rhxxmc               varchar(18)          not null/* Rh血型名称 */,
    jzkssj               datetime             null/* (入院)就诊开始时间 */,
    jzjssj               datetime             null/* (出院)就诊结束时间 */,
    gmsbz                char(1)              not null/* 过敏史标志 */,
    hldjdm               varchar(2)           not null/* 护理等级代码 */,
    hldjmc               varchar(100)         not null/* 护理等级名称 */,
    hllxdm               varchar(2)           not null/* 护理类型代码 */,
    hllxmc               varchar(100)         not null/* 护理类型名称 */,
    ysdm                 varchar(20)          not null/* 医生工号 */,
    ysxm                 varchar(50)          not null/* 医生姓名 */,
    qmrqsj               datetime             not null/* 签名日期时间 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_SSHL_GMS     护理操作记录 — 手术护理记录_过敏史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_SSHL_GMS') )
 create table  DC_HLCZJL_SSHL_GMS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    gms                  varchar(1000)        not null/* 过敏史 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_SSHL_HLCZ     护理操作记录 — 手术护理记录_护理操作                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_SSHL_HLCZ') )
 create table  DC_HLCZJL_SSHL_HLCZ (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    hlczxmlmmc           varchar(100)         not null/* 护理操作项目类目名称 */,
    hlczmc               varchar(100)         not null/* 护理操作名称 */,
    hlczjg               varchar(1000)        not null/* 护理操作结果 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_SSHL_HLGC     护理操作记录 — 手术护理记录_护理观察                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_SSHL_HLGC') )
 create table  DC_HLCZJL_SSHL_HLGC (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    hlgcxmmc             varchar(30)          not null/* 护理观察项目名称 */,
    hlgcjg               varchar(1000)        not null/* 护理观察结果 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_SSHL_PFJC     护理操作记录 — 手术护理记录_皮肤检查                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_SSHL_PFJC') )
 create table  DC_HLCZJL_SSHL_PFJC (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    pfjcms               varchar(1000)        null/* 皮肤检查描述 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_SSHL_QXHD     护理操作记录 — 手术护理记录_器械物品核对                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_SSHL_QXHD') )
 create table  DC_HLCZJL_SSHL_QXHD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    szsywpmc             varchar(50)          not null/* 术中所用物品名称 */,
    sqqdbz               char(1)              not null/* 术前清点标志 */,
    gqhdbz               char(1)              not null/* 关前核对标志 */,
    ghhdbz               char(1)              not null/* 关后核对标志 */,
    xthsdm               varchar(20)          not null/* 巡台护士工号 */,
    xthsqm               varchar(50)          not null/* 巡台护士签名 */,
    qxhsdm               varchar(20)          not null/* 器械护士工号 */,
    qxhsqm               varchar(50)          not null/* 器械护士签名 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_SSHL_SHJJ     护理操作记录 — 手术护理记录_术后交接                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_SSHL_SHJJ') )
 create table  DC_HLCZJL_SSHL_SHJJ (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    brjjhdxm             varchar(50)          not null/* 病人交接核对项目 */,
    jjhsdm               varchar(20)          not null/* 交接护士工号 */,
    jjhsqm               varchar(50)          not null/* 交接护士签名 */,
    zyzdm                varchar(20)          not null/* 转运者工号 */,
    zyzqm                varchar(50)          not null/* 转运者签名 */,
    jjrqsj               datetime             not null/* 交接日期时间 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_SSHL_SQZD     护理操作记录 — 手术护理记录_术前诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_SSHL_SQZD') )
 create table  DC_HLCZJL_SSHL_SQZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    sqzdbm               varchar(64)          not null/* 术前诊断编码 */,
    sqzdmc               varchar(128)         not null/* 术前诊断名称 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_SSHL_SS     护理操作记录 — 手术护理记录_手术                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_SSHL_SS') )
 create table  DC_HLCZJL_SSHL_SS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    ssjbh                varchar(20)          not null/* 手术间编号 */,
    ssjczbm              varchar(64)          not null/* 手术及操作编码 */,
    ssmc                 varchar(128)         not null/* 手术及操作名称 */,
    sszdm                varchar(20)          not null/* 手术者工号 */,
    sszxm                varchar(50)          not null/* 手术者姓名 */,
    ssmbbwmc             varchar(128)         not null/* 手术目标部位名称 */,
    ssjsrqsj             datetime             not null/* 手术结束日期时间 */,
    ssksrqsj             datetime             not null/* 手术开始日期时间 */,
    rsssrqsj             datetime             not null/* 入手术室日期时间 */,
    csssrqsj             datetime             not null/* 出手术室日期时间 */,
    zbsx                 varchar(100)         not null/* 准备事项 */,
    szblbz               char(1)              not null/* 术中病理标志 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_SSHL_TZ     护理操作记录 — 手术护理记录_体重                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_SSHL_TZ') )
 create table  DC_HLCZJL_SSHL_TZ (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    tzkg                 numeric(6,2)         not null/* 体重（kg） */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_YBHL     护理操作记录 — 一般护理记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_YBHL') )
 create table  DC_HLCZJL_YBHL (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    yexh                 varchar(64)          not null/* 婴儿序号 */,
    zyh                  varchar(64)          not null/* 住院号 */,
    zzjgdm               varchar(10)          not null/* 医疗机构组织机构代码 */,
    zzjgmc               varchar(70)          not null/* 医疗机构组织机构名称 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    csrq                 date                 not null/* 患者出生日期 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    hldjdm               varchar(2)           not null/* 护理等级代码 */,
    hldjmc               varchar(100)         not null/* 护理等级名称 */,
    hllxdm               varchar(2)           not null/* 护理类型代码 */,
    hllxmc               varchar(100)         not null/* 护理类型名称 */,
    tzkg                 numeric(6,2)         not null/* 体重（kg） */,
    tw                   numeric(4,1)         not null/* 体温（℃） */,
    hxl                  numeric(3)           not null/* 呼吸频率（次/min） */,
    ml                   numeric(3)           not null/* 脉率（次/min） */,
    ssy                  numeric(3)           not null/* 收缩压（mmHg） */,
    szy                  numeric(3)           not null/* 舒张压（mmHg） */,
    xybhd                numeric(4,1)         not null/* 血氧饱和度（%） */,
    zbdmbdbz             char(1)              not null/* 足背动脉搏动标志 */,
    ysqkdm               varchar(2)           not null/* 饮食情况代码 */,
    ysqkmc               varchar(100)         not null/* 饮食情况名称 */,
    dghlms               varchar(1000)        not null/* 导管护理描述 */,
    qghldm               varchar(2)           not null/* 气管护理代码 */,
    qghlmc               varchar(100)         not null/* 气管护理名称 */,
    twhl                 varchar(30)          not null/* 体位护理 */,
    pfhl                 varchar(50)          not null/* 皮肤护理 */,
    yyhl                 varchar(100)         not null/* 营养护理 */,
    yszddm               varchar(4)           not null/* 饮食指导代码 */,
    yszdmc               varchar(100)         not null/* 饮食指导名称 */,
    xlhldm               varchar(2)           not null/* 心理护理代码 */,
    xlhlmc               varchar(100)         not null/* 心理护理名称 */,
    aqhldm               varchar(2)           not null/* 安全护理代码 */,
    aqhlmc               varchar(30)          not null/* 安全护理名称 */,
    jybq                 varchar(2000)        not null/* 简要病情 */,
    hlgcxmmc             varchar(30)          not null/* 护理观察项目名称 */,
    hlgcjg               varchar(1000)        not null/* 护理观察结果 */,
    fcssaqhdbbz          char(1)              not null/* 发出手术安全核对标志 */,
    shssaqhdbbz          char(1)              not null/* 收回手术安全核对标志 */,
    fcssfxpgbbz          char(1)              not null/* 发出手术风险评估标志 */,
    shssfxpgbbz          char(1)              not null/* 收回手术风险评估标志 */,
    glbz                 char(1)              not null/* 隔离标志 */,
    glzldm               varchar(2)           not null/* 隔离种类代码 */,
    glzlmc               varchar(100)         not null/* 隔离种类名称 */,
    hsdm                 varchar(20)          not null/* 护士工号 */,
    hsqm                 varchar(50)          not null/* 护士签名 */,
    qmrqsj               datetime             not null/* 签名日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_YBHL_GMS     护理操作记录 — 一般护理记录_过敏史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_YBHL_GMS') )
 create table  DC_HLCZJL_YBHL_GMS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    gms                  varchar(1000)        not null/* 过敏史 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_YBHL_HLCZ     护理操作记录 — 一般护理记录_护理操作                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_YBHL_HLCZ') )
 create table  DC_HLCZJL_YBHL_HLCZ (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    hlczmc               varchar(100)         not null/* 护理操作名称 */,
    hlczxmlmmc           varchar(100)         not null/* 护理操作项目类目名称 */,
    hlczjg               varchar(1000)        not null/* 护理操作结果 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLCZJL_YBHL_ZDXX     护理操作记录 — 一般护理记录_诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLCZJL_YBHL_ZDXX') )
 create table  DC_HLCZJL_YBHL_ZDXX (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    zdbm                 varchar(64)          not null/* 疾病诊断编码 */,
    zdmc                 varchar(128)         not null/* 疾病诊断名称 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLPGYJH_CYPGJZD     护理评估计划 — 出院评估及指导                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLPGYJH_CYPGJZD') )
 create table  DC_HLPGYJH_CYPGJZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    jkkh                 varchar(64)          not null/* 城乡居民健康卡号 */,
    zyh                  varchar(64)          not null/* 住院号 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    yexh                 varchar(64)          not null/* 婴儿序号 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    cyrqsj               datetime             not null/* 出院日期时间 */,
    ysqkdm               varchar(2)           null/* 饮食情况代码 */,
    ysqkmc               varchar(100)         null/* 饮食情况名称 */,
    zlnldm               varchar(2)           null/* 自理能力代码 */,
    zlnlmc               varchar(18)          null/* 自理能力名称 */,
    cyqkmc               varchar(2000)        not null/* 出院情况 */,
    lyfsdm               varchar(2)           not null/* 离院方式代码 */,
    lyfsmc               varchar(50)          not null/* 离院方式名称 */,
    yyzd                 varchar(100)         null/* 用药指导 */,
    yszddm               varchar(2)           null/* 饮食指导代码 */,
    yszdmc               varchar(100)         null/* 饮食指导名称 */,
    shfszd               varchar(50)          null/* 生活方式指导 */,
    xjnr                 varchar(100)         null/* 宣教内容 */,
    fzzd                 varchar(100)         null/* 复诊指导 */,
    hsdm                 varchar(20)          not null/* 护士工号 */,
    hsqm                 varchar(50)          not null/* 护士签名 */,
    qmrqsj               datetime             not null/* 签名日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLPGYJH_CYPGJZD_CYZD     护理评估计划 — 出院评估及指导_出院诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLPGYJH_CYPGJZD_CYZD') )
 create table  DC_HLPGYJH_CYPGJZD_CYZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    cyzdbm               varchar(64)          not null/* 出院诊断编码 */,
    cyzdmc               varchar(128)         not null/* 出院诊断名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLPGYJH_HLJH     护理评估计划 — 护理计划                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLPGYJH_HLJH') )
 create table  DC_HLPGYJH_HLJH (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    jkkh                 varchar(64)          not null/* 城乡居民健康卡号 */,
    zyh                  varchar(64)          not null/* 住院号 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    yexh                 varchar(64)          not null/* 婴儿序号 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    jbzdbm               varchar(64)          not null/* 疾病诊断编码 */,
    jbzdmc               varchar(128)         not null/* 疾病诊断名称 */,
    hldjdm               varchar(2)           not null/* 护理等级代码 */,
    hldjmc               varchar(100)         not null/* 护理等级名称 */,
    hllxdm               varchar(2)           not null/* 护理类型代码 */,
    hllxmc               varchar(100)         not null/* 护理类型名称 */,
    hlwt                 varchar(1000)        not null/* 护理问题 */,
    hlczxmlmmc           varchar(100)         not null/* 护理操作项目类目名称 */,
    hlczmc               varchar(100)         not null/* 护理操作名称 */,
    hlczjg               varchar(1000)        not null/* 护理操作结果 */,
    dghlms               varchar(1000)        not null/* 导管护理描述 */,
    twhl                 varchar(30)          not null/* 体位护理 */,
    pfhl                 varchar(50)          not null/* 皮肤护理 */,
    qghldm               varchar(2)           not null/* 气管护理代码 */,
    qghlmc               varchar(18)          not null/* 气管护理名称 */,
    aqhldm               varchar(2)           not null/* 安全护理代码 */,
    aqhlmc               varchar(18)          not null/* 安全护理名称 */,
    yszddm               varchar(2)           not null/* 饮食指导代码 */,
    yszdmc               varchar(18)          not null/* 饮食指导名称 */,
    hsdm                 varchar(20)          not null/* 护士工号 */,
    hsqm                 varchar(50)          not null/* 护士签名 */,
    qmrqsj               datetime             not null/* 签名日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLPGYJH_RYPG     护理评估计划 — 入院评估记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLPGYJH_RYPG') )
 create table  DC_HLPGYJH_RYPG (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    zyh                  varchar(64)          not null/* 住院号 */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    jkkh                 varchar(64)          not null/* 城乡居民健康卡号 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    yexh                 varchar(64)          not null/* 婴儿序号 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    gjdm                 varchar(3)           null/* 国籍代码 */,
    gjmc                 varchar(18)          null/* 国籍名称 */,
    mz                   varchar(2)           null/* 民族代码 */,
    mzmc                 varchar(18)          null/* 民族名称 */,
    hyzkdm               varchar(2)           null/* 婚姻状况代码 */,
    hyzkmc               varchar(18)          null/* 婚姻状况名称 */,
    zylbdm               varchar(2)           null/* 职业类别代码 */,
    zylbmc               varchar(18)          null/* 职业类别名称 */,
    xldm                 varchar(2)           null/* 学历代码 */,
    xlmc                 varchar(18)          null/* 学历名称 */,
    hzdhhm               varchar(20)          null/* 患者电话号码 */,
    gzdwdhhm             varchar(20)          null/* 工作单位电话号码 */,
    hzdzyjdz             varchar(70)          null/* 患者电子邮件地址 */,
    lxrxm                varchar(50)          null/* 联系人姓名 */,
    lxrdhhm              varchar(20)          null/* 联系人电话号码 */,
    rbffs                varchar(20)          null/* 入病房方式 */,
    ryrqsj               datetime             not null/* 入院日期时间 */,
    tzkg                 numeric(6,2)         not null/* 体重（kg） */,
    tw                   numeric(4,1)         not null/* 体温（℃） */,
    hxl                  numeric(3)           not null/* 呼吸频率（次/min） */,
    ml                   numeric(3)           not null/* 脉率（次/min） */,
    ssy                  numeric(3)           not null/* 收缩压（mmHg） */,
    szy                  numeric(3)           not null/* 舒张压（mmHg） */,
    ryyyms               varchar(1000)        not null/* 入院原因 */,
    rytjdm               varchar(2)           not null/* 入院途径代码 */,
    rytjmc               varchar(64)          not null/* 入院途径名称 */,
    apgarpfz             numeric(2)           null/* Apgar评分值 */,
    ysqkdm               varchar(2)           not null/* 饮食情况代码 */,
    ysqkmc               varchar(18)          not null/* 饮食情况名称 */,
    fycddm               varchar(2)           null/* 发育程度代码 */,
    fycdmc               varchar(18)          null/* 发育程度名称 */,
    jsztzcbz             char(1)              null/* 精神状态正常标志 */,
    smzk                 varchar(1000)        null/* 睡眠状况 */,
    tsqk                 varchar(1000)        null/* 特殊情况 */,
    xlztdm               varchar(2)           null/* 心理状态代码 */,
    xlztmc               varchar(18)          null/* 心理状态名称 */,
    yyztdm               varchar(2)           null/* 营养状态代码 */,
    yyztmc               varchar(18)          null/* 营养状态名称 */,
    zlnldm               varchar(2)           null/* 自理能力代码 */,
    zlnlmc               varchar(18)          null/* 自理能力名称 */,
    ybjkzkbz             char(1)              not null/* 一般健康状况标志 */,
    hzcrxbz              char(1)              not null/* 患者传染性标志 */,
    jzs                  varchar(1000)        not null/* 家族史 */,
    xybz                 char(1)              not null/* 吸烟标志 */,
    tzxyts               numeric(5)           not null/* 停止吸烟天数 */,
    xyzkdm               varchar(2)           not null/* 吸烟状况代码 */,
    xyzkmc               varchar(18)          not null/* 吸烟状况名称 */,
    rxylz                numeric(3)           not null/* 日吸烟量（支） */,
    yjbz                 char(1)              not null/* 饮酒标志 */,
    yjpldm               varchar(2)           not null/* 饮酒频率代码 */,
    yjplmc               varchar(18)          not null/* 饮酒频率名称 */,
    ryjlml               numeric(3)           not null/* 日饮酒量（mL） */,
    tzysbz               char(1)              not null/* 通知医师标志 */,
    tzysrqsj             datetime             not null/* 通知医师日期时间 */,
    pgrqsj               datetime             not null/* 评估日期时间 */,
    zrhsdm               varchar(50)          not null/* 责任护士工号 */,
    zrhsqm               varchar(50)          not null/* 责任护士签名 */,
    jzhsdm               varchar(50)          not null/* 接诊护士工号 */,
    jzhsqm               varchar(50)          not null/* 接诊护士签名 */,
    qmrqsj               datetime             not null/* 签名日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLPGYJH_RYPG_CRBS     护理评估计划 — 入院评估记录_传染病史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLPGYJH_RYPG_CRBS') )
 create table  DC_HLPGYJH_RYPG_CRBS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    crbs                 varchar(1000)        not null/* 传染病史 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLPGYJH_RYPG_GMS     护理评估计划 — 入院评估记录_过敏史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLPGYJH_RYPG_GMS') )
 create table  DC_HLPGYJH_RYPG_GMS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    gms                  varchar(1000)        not null/* 过敏史 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLPGYJH_RYPG_HLGCXM     护理评估计划 — 入院评估记录_护理观察项目                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLPGYJH_RYPG_HLGCXM') )
 create table  DC_HLPGYJH_RYPG_HLGCXM (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    hlgcxmdm             varchar(11)          null/* 护理观察项目代码 */,
    hlgcxmmc             varchar(30)          null/* 护理观察项目名称 */,
    hlgcjg               varchar(1000)        null/* 护理观察结果 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLPGYJH_RYPG_JBS     护理评估计划 — 入院评估记录_疾病史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLPGYJH_RYPG_JBS') )
 create table  DC_HLPGYJH_RYPG_JBS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    jbshws               varchar(1000)        not null/* 疾病史（含外伤） */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLPGYJH_RYPG_JZS     护理评估计划 — 入院评估记录_家族史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLPGYJH_RYPG_JZS') )
 create table  DC_HLPGYJH_RYPG_JZS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    jzs                  varchar(1000)        not null/* 家族史 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLPGYJH_RYPG_RYZD     护理评估计划 — 入院评估记录_入院诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLPGYJH_RYPG_RYZD') )
 create table  DC_HLPGYJH_RYPG_RYZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    ryzdbm               varchar(64)          not null/* 入院诊断编码 */,
    ryzdmc               varchar(128)         not null/* 入院诊断名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLPGYJH_RYPG_SSS     护理评估计划 — 入院评估记录_手术史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLPGYJH_RYPG_SSS') )
 create table  DC_HLPGYJH_RYPG_SSS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    sss                  varchar(1000)        not null/* 手术史 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLPGYJH_RYPG_SXS     护理评估计划 — 入院评估记录_输血史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLPGYJH_RYPG_SXS') )
 create table  DC_HLPGYJH_RYPG_SXS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    sxs                  varchar(1000)        not null/* 输血史 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLPGYJH_RYPG_YFJZS     护理评估计划 — 入院评估记录_预防接种史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLPGYJH_RYPG_YFJZS') )
 create table  DC_HLPGYJH_RYPG_YFJZS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    yfjzs                varchar(1000)        not null/* 预防接种史 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_HLPGYJH_RYPG_ZYZZ     护理评估计划 — 入院评估记录_主要症状                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_HLPGYJH_RYPG_ZYZZ') )
 create table  DC_HLPGYJH_RYPG_ZYZZ (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    zyzz                 varchar(50)          not null/* 主要症状 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_JCJYJL_JCJL     检查检验记录 — 检查记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_JCJYJL_JCJL') )
 create table  DC_JCJYJL_JCJL (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    jzlb                 varchar(2)           not null/* 就诊类别 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    yljgzzjgdm           varchar(10)          not null/* 医疗机构组织机构代码 */,
    yljgzzjgmc           varchar(100)         not null/* 医疗机构组织机构名称 */,
    mjzh                 varchar(64)          not null/* 门（急）诊号 */,
    zyh                  varchar(64)          not null/* 住院号 */,
    hzlxdm               varchar(2)           not null/* 患者类型代码 */,
    hzlxmc               varchar(100)         not null/* 患者类型名称 */,
    hzxm                 varchar(64)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    xbdm                 varchar(2)           not null/* 患者性别代码 */,
    xbmc                 varchar(16)          not null/* 患者性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    dhhm                 varchar(20)          null/* 电话号码 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    dzsqdbh              varchar(20)          not null/* 电子申请单编号 */,
    jcsqjgmc             varchar(70)          not null/* 检查申请机构名称 */,
    jcsqksdm             varchar(10)          not null/* 检查申请机构代码 */,
    jcsqksmc             varchar(50)          not null/* 检查申请科室 */,
    zdjgdm               varchar(20)          not null/* 诊断机构代码 */,
    zdjgmc               varchar(70)          not null/* 诊断机构名称 */,
    zdrq                 date                 not null/* 诊断日期 */,
    jbzdbm               varchar(32)          not null/* 疾病诊断编码 */,
    jbzdmc               varchar(128)         not null/* 疾病诊断名称 */,
    zs                   varchar(100)         not null/* 主诉 */,
    zzksrqsj             datetime             not null/* 症状开始日期时间 */,
    zztzrqsj             datetime             not null/* 症状停止日期时间 */,
    zzms                 varchar(1000)        not null/* 症状描述 */,
    tsjcbz               char(1)              not null/* 特殊检查标志 */,
    zlgcms               varchar(2000)        not null/* 诊疗过程描述 */,
    jcbbh                varchar(20)          not null/* 检查标本号 */,
    jcffdm               varchar(10)          not null/* 检查方法代码 */,
    jcffmc               varchar(100)         not null/* 检查方法名称 */,
    jclbdm               varchar(10)          not null/* 检查类别代码 */,
    jclbmc               varchar(100)         not null/* 检查类别 */,
    jcjsdm               varchar(20)          not null/* 检查技师工号 */,
    jcjsqm               varchar(50)          not null/* 检查技师签名 */,
    jcysdm               varchar(20)          not null/* 检查医师工号 */,
    jcysqm               varchar(50)          not null/* 检查医师签名 */,
    jcrq                 date                 not null/* 检查日期 */,
    jcbgdbh              varchar(20)          not null/* 检查报告单编号 */,
    jcbgjgdm             varchar(20)          not null/* 检查报告机构代码 */,
    jcbgjgmc             varchar(70)          not null/* 检查报告机构名称 */,
    jcbgksdm             varchar(10)          not null/* 检查报告代码 */,
    jcbgksmc             varchar(50)          not null/* 检查报告科室 */,
    jcbgjg_kgsj          varchar(200)         not null/* 检查报告结果-客观所见 */,
    jcbgjg_zgts          varchar(200)         not null/* 检查报告结果-主观提示 */,
    jcbgbz               varchar(100)         not null/* 检查报告备注 */,
    jcbgrq               date                 not null/* 检查报告日期 */,
    bgysdm               varchar(20)          not null/* 报告医师工号 */,
    bgysqm               varchar(50)          not null/* 报告医师签名 */,
    shysdm               varchar(20)          not null/* 审核医师工号 */,
    shysqm               varchar(50)          not null/* 审核医师签名 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_JCJYJL_JCJL_JCXM     检查检验记录 — 检查记录_检查项目                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_JCJYJL_JCJL_JCXM') )
 create table  DC_JCJYJL_JCJL_JCXM (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    bblbdm               varchar(20)          not null/* 标本类别 */,
    bblbmc               varchar(50)          not null/* 标本名称 */,
    bbzt                 varchar(20)          not null/* 标本状态 */,
    bbgdymc              varchar(50)          not null/* 标本固定液名称 */,
    bbcyrqsj             datetime             not null/* 标本采样日期时间 */,
    jsbbrqsj             datetime             not null/* 接收标本日期时间 */,
    jcxmdm               varchar(20)          not null/* 检查项目代码 */,
    jcxmmc               varchar(50)          not null/* 检查项目名称 */,
    jcjgdm               varchar(10)          not null/* 检查结果代码 */,
    jcjgmc               varchar(50)          not null/* 检查结果名称 */,
    jcdljg               numeric(14,4)        not null/* 检查定量结果 */,
    jcdljgjldw           varchar(20)          not null/* 检查定量结果计量单位 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_JCJYJL_JCJL_SS     检查检验记录 — 检查记录_手术                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_JCJYJL_JCJL_SS') )
 create table  DC_JCJYJL_JCJL_SS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    czbm                 varchar(64)          null/* 操作编码 */,
    czmc                 varchar(128)         null/* 操作名称 */,
    czbwbm               varchar(64)          null/* 操作部位编码 */,
    czbwmc               varchar(128)         null/* 操作部位名称 */,
    jrwmc                varchar(100)         not null/* 介入物名称 */,
    czffms               varchar(2000)        null/* 操作方法描述 */,
    czcs                 numeric(3)           null/* 操作次数 */,
    czrqsj               datetime             null/* 操作日期时间 */,
    mzffdm               varchar(2)           not null/* 麻醉方法代码 */,
    mzffmc               varchar(50)          not null/* 麻醉方法名称 */,
    mzgcjg               varchar(1000)        not null/* 麻醉观察结果 */,
    mzzxybsdm            varchar(2)           not null/* 麻醉中西医标识代码 */,
    mzzxybsmc            varchar(100)         not null/* 麻醉中西医标识名称 */,
    mzysdm               varchar(20)          not null/* 麻醉医师工号 */,
    mzysqm               varchar(50)          not null/* 麻醉医师签名 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_JCJYJL_JYJL     检查检验记录 — 检验记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_JCJYJL_JYJL') )
 create table  DC_JCJYJL_JYJL (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    jzlb                 varchar(2)           not null/* 就诊类别 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    yljgzzjgdm           varchar(10)          not null/* 医疗机构组织机构代码 */,
    yljgzzjgmc           varchar(100)         not null/* 医疗机构组织机构名称 */,
    mjzh                 varchar(64)          not null/* 门（急）诊号 */,
    zyh                  varchar(64)          not null/* 住院号 */,
    hzlxdm               varchar(2)           not null/* 患者类型代码 */,
    hzlxmc               varchar(18)          not null/* 患者类型名称 */,
    hzxm                 varchar(64)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    xbdm                 varchar(2)           not null/* 患者性别代码 */,
    xbmc                 varchar(16)          not null/* 患者性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    dhhm                 varchar(20)          null/* 电话号码 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    dzsqdbh              varchar(20)          not null/* 电子申请单编号 */,
    jysqjgdm             varchar(20)          not null/* 检验申请机构代码 */,
    jysqjgmc             varchar(70)          not null/* 检验申请机构名称 */,
    jysqksdm             varchar(11)          not null/* 检验申请科室代码 */,
    jysqksmc             varchar(50)          not null/* 检验申请科室 */,
    jyffdm               varchar(10)          not null/* 检验方法代码 */,
    jyffmc               varchar(100)         not null/* 检验方法名称 */,
    jylbdm               varchar(10)          not null/* 检验类别代码 */,
    jylbmc               varchar(100)         not null/* 检验类别 */,
    jybbh                varchar(20)          not null/* 检验标本号 */,
    jyjsdm               varchar(50)          not null/* 检验技师工号 */,
    jyjsqm               varchar(50)          not null/* 检验技师签名 */,
    jyjsqmsj             datetime             not null/* 检验技师签名时间 */,
    jyysdm               varchar(50)          not null/* 检验医师工号 */,
    jyysqm               varchar(50)          not null/* 检验医师签名 */,
    jyysqmsj             datetime             not null/* 检验医师时间 */,
    jyrq                 date                 not null/* 检验日期 */,
    jybgdbh              varchar(20)          not null/* 检验报告单编号 */,
    jybgjgdm             varchar(20)          not null/* 检验报告机构代码 */,
    jybgjgmc             varchar(70)          not null/* 检验报告机构名称 */,
    jybgksdm             varchar(11)          not null/* 检验报告科室代码 */,
    jybgksmc             varchar(50)          not null/* 检验报告科室 */,
    jybgjg               varchar(200)         not null/* 检验报告结果 */,
    jybgbz               varchar(100)         not null/* 检验报告备注 */,
    jybgrq               date                 not null/* 检验报告日期 */,
    bgysdm               varchar(20)          not null/* 报告医师工号 */,
    bgysqm               varchar(50)          not null/* 报告医师签名 */,
    shysdm               varchar(20)          not null/* 审核医师标识号 */,
    shysqm               varchar(50)          not null/* 审核医师签名 */,
    shysqmsj             datetime             not null/* 审核医师签名日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_JCJYJL_JYJL_JYXM     检查检验记录 — 检验记录_检验项目                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_JCJYJL_JYJL_JYXM') )
 create table  DC_JCJYJL_JYJL_JYXM (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    bblbdm               varchar(20)          not null/* 标本类别代码 */,
    bblbmc               varchar(50)          not null/* 标本类别 */,
    bbzt                 varchar(20)          not null/* 标本状态 */,
    bbcyrqsj             datetime             not null/* 标本采样日期时间 */,
    jsbbrqsj             datetime             not null/* 接收标本日期时间 */,
    jyxmdm               varchar(20)          not null/* 检验项目代码 */,
    jyxmmc               varchar(50)          not null/* 检验项目名称 */,
    jyjgdm               varchar(10)          not null/* 检验结果代码 */,
    jyjgmc               varchar(100)         not null/* 检验结果名称 */,
    jydljg               numeric(14,4)        not null/* 检验定量结果 */,
    jydljgjldw           varchar(20)          not null/* 检验定量结果计量单位 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_JCJYJL_JYJL_ZDXX     检查检验记录 — 检验记录_诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_JCJYJL_JYJL_ZDXX') )
 create table  DC_JCJYJL_JYJL_ZDXX (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    jbzdbm               varchar(64)          not null/* 疾病诊断编码 */,
    jbzdmc               varchar(128)         not null/* 疾病诊断名称 */,
    zdjgdm               varchar(20)          not null/* 诊断机构代码 */,
    zdjgmc               varchar(70)          not null/* 诊断机构名称 */,
    zdrq                 date                 not null/* 诊断日期 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_MJZBL_JZLGBL     门（急）诊病历 — 急诊留观病历                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_MJZBL_JZLGBL') )
 create table  DC_MJZBL_JZLGBL (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    zyh                  varchar(64)          not null/* 住院号 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zzjgdm               varchar(10)          not null/* 医疗机构组织机构代码 */,
    zzjgmc               varchar(70)          not null/* 医疗机构组织机构名称 */,
    mjzh                 varchar(64)          not null/* 门急诊号 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    hzxm                 varchar(64)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    csrq                 date                 not null/* 出生日期 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    jzrqsj               datetime             not null/* 就诊日期时间 */,
    czbzdm               varchar(2)           not null/* 初诊标志代码 */,
    czbzmc               varchar(18)          not null/* 初诊标志名称 */,
    srgcsrq              datetime             not null/* 收入观察室日期时间 */,
    zs                   nvarchar(100)        not null/* 主诉 */,
    xbs                  nvarchar(2000)       not null/* 现病史 */,
    jws                  nvarchar(1000)       not null/* 既往史 */,
    tgjc                 nvarchar(500)        not null/* 体格检查 */,
    zyszgcjg             nvarchar(1000)       null/* 中医“四诊”观察结果 */,
    fzjcxm               nvarchar(100)        null/* 辅助检查项目 */,
    fzjcjg               nvarchar(1000)       null/* 辅助检查结果 */,
    xyzdbm               varchar(64)          not null/* 初步诊断-西医诊断编码 */,
    xyzdmc               varchar(128)         not null/* 初步诊断-西医诊断名称 */,
    zybmdm               varchar(64)          not null/* 初步诊断-中医病名代码 */,
    zybmmc               varchar(128)         not null/* 初步诊断-中医病名名称 */,
    zyzhdm               varchar(64)          not null/* 初步诊断-中医证候代码 */,
    zyzhmc               varchar(128)         not null/* 初步诊断-中医证候名称 */,
    bzyj                 nvarchar(100)        null/* 辨证依据 */,
    zfbm                 varchar(20)          null/* 治则治法代码 */,
    zzzf                 nvarchar(100)        null/* 治则治法 */,
    yzxmlx               varchar(2)           not null/* 医嘱项目类型代码 */,
    yzxmlxmc             sysname              not null/* 医嘱项目类型名称 */,
    yzxmnr               nvarchar(100)        not null/* 医嘱项目内容 */,
    yzbzxx               nvarchar(100)        not null/* 医嘱备注信息 */,
    yzklksdm             varchar(10)          not null/* 医嘱开立代码 */,
    yzklks               varchar(50)          not null/* 医嘱开立科室 */,
    yzklzdm              varchar(20)          not null/* 医嘱开立者工号 */,
    yzklzqm              varchar(50)          not null/* 医嘱开立者签名 */,
    yzklrq               datetime             not null/* 医嘱开立日期时间 */,
    yzshzdm              varchar(20)          not null/* 医嘱审核者工号 */,
    yzshzqm              varchar(50)          not null/* 医嘱审核者签名 */,
    yzshrq               datetime             not null/* 医嘱审核日期时间 */,
    yzzxksdm             varchar(10)          not null/* 医嘱执行代码 */,
    yzzxks               varchar(50)          not null/* 医嘱执行科室 */,
    yzzxzdm              varchar(20)          not null/* 医嘱执行者工号 */,
    yzzxzqm              varchar(50)          not null/* 医嘱执行者签名 */,
    yzzxrq               datetime             not null/* 医嘱执行日期时间 */,
    yzjhjsrq             datetime             not null/* 医嘱计划结束日期时间 */,
    yzzxzt               varchar(50)          not null/* 医嘱执行状态 */,
    qxyzzdm              varchar(20)          not null/* 取消医嘱者工号 */,
    qxyzzqm              varchar(50)          not null/* 取消医嘱者签名 */,
    yzqxrq               datetime             not null/* 医嘱取消日期时间 */,
    dzsqdbh              varchar(50)          not null/* 电子申请单编号 */,
    jzlgbcjl             nvarchar(2000)       not null/* 急诊留观病程记录 */,
    qjksrq               datetime             not null/* 抢救开始日期时间 */,
    qjjsrq               datetime             not null/* 抢救结束日期时间 */,
    jzqjjl               nvarchar(2000)       not null/* 急诊抢救记录 */,
    jlrqsj               datetime             not null/* 记录日期时间 */,
    zysx                 nvarchar(1000)       not null/* 注意事项 */,
    cjqjrydm             varchar(100)         not null/* 参加抢救人员名单代码 */,
    cjqjrymd             varchar(500)         not null/* 参加抢救人员名单 */,
    zyjszwlb             varchar(8)           not null/* 专业技术职务类别代码 */,
    zyjszwlbmc           varchar(64)          not null/* 专业技术职务类别名称 */,
    hzqxdm               varchar(2)           not null/* 患者去向代码 */,
    hzqxmc               varchar(18)          not null/* 患者去向名称 */,
    zrysbm               varchar(20)          not null/* 责任医师工号 */,
    zrysqm               varchar(50)          not null/* 责任医师姓名 */,
    ysbm                 varchar(20)          not null/* 签名医师工号 */,
    ysqm                 varchar(50)          not null/* 签名医师名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_MJZBL_JZLGBL_GMS     门（急）诊病历 — 急诊留观病历_过敏史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_MJZBL_JZLGBL_GMS') )
 create table  DC_MJZBL_JZLGBL_GMS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    gmsbz                char(1)              not null/* 过敏史标志 */,
    gms                  nvarchar(1000)       not null/* 过敏史 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_MJZBL_JZLGBL_SSCZ     门（急）诊病历 — 急诊留观病历_手术操作                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_MJZBL_JZLGBL_SSCZ') )
 create table  DC_MJZBL_JZLGBL_SSCZ (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    ssjczbm              varchar(64)          null/* 手术及操作编码 */,
    ssjczmc              varchar(128)         null/* 手术及操作名称 */,
    ssmbbwbm             varchar(100)         null/* 手术及操作目标部位编码 */,
    ssmbbw               varchar(500)         null/* 手术及操作目标部位名称 */,
    jrwdm                varchar(100)         null/* 介入物代码 */,
    jrwmc                varchar(500)         null/* 介入物名称 */,
    ssjczff              nvarchar(2000)       null/* 手术及操作方法 */,
    ssjczcs              varchar(3)           null/* 手术及操作次数 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_MJZBL_MJZBL     门急诊病历 — 门急诊病历                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_MJZBL_MJZBL') )
 create table  DC_MJZBL_MJZBL (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    mjzh                 varchar(64)          not null/* 门急诊号 */,
    zyh                  varchar(64)          not null/* 住院号 */,
    patid                varchar(64)          not null/* 患者patid */,
    hzxm                 varchar(64)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    csrq                 date                 not null/* 出生日期 */,
    nly                  varchar(8)           null/* 年龄（月） */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    zzjgdm               varchar(10)          not null/* 医疗机构组织机构代码 */,
    zzjgmc               varchar(70)          not null/* 医疗机构组织机构名称 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    jzrqsj               datetime             not null/* 就诊日期时间 */,
    czbzdm               varchar(2)           not null/* 初诊标志代码 */,
    czbzmc               varchar(18)          not null/* 初诊标志名称 */,
    zs                   nvarchar(100)        not null/* 主诉 */,
    xbs                  nvarchar(2000)       not null/* 现病史 */,
    zyszgcjg             nvarchar(1000)       null/* 中医“四诊”观察结果 */,
    bzyj                 nvarchar(100)        null/* 辨证依据 */,
    zfbm                 varchar(20)          null/* 治则治法编码 */,
    zzzf                 nvarchar(100)        null/* 治则治法 */,
    dzsqdbh              varchar(20)          not null/* 电子申请单编号 */,
    ysbm                 varchar(20)          not null/* 医师签名工号 */,
    ysqm                 varchar(50)          not null/* 医师签名 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_MJZBL_MJZBL_FZJCXM     门急诊病历 — 门急诊病历_辅助检查项目                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_MJZBL_MJZBL_FZJCXM') )
 create table  DC_MJZBL_MJZBL_FZJCXM (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    fzjcxm               nvarchar(100)        null/* 辅助检查项目 */,
    fzjcjg               nvarchar(1000)       null/* 辅助检查结果 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_MJZBL_MJZBL_GMS     门急诊病历 — 门急诊病历_过敏史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_MJZBL_MJZBL_GMS') )
 create table  DC_MJZBL_MJZBL_GMS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    gmsbz                char(1)              not null/* 过敏史标志 */,
    gms                  nvarchar(1000)       not null/* 过敏史 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_MJZBL_MJZBL_GWS     门急诊病历 — 门急诊病历_既往史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_MJZBL_MJZBL_GWS') )
 create table  DC_MJZBL_MJZBL_GWS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jws                  nvarchar(1000)       not null/* 既往史 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_MJZBL_MJZBL_XYZD     门急诊病历 — 门急诊病历_西医诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_MJZBL_MJZBL_XYZD') )
 create table  DC_MJZBL_MJZBL_XYZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    xyzdbm               varchar(64)          not null/* 初步诊断-西医诊断编码 */,
    xyzdmc               varchar(128)         not null/* 初步诊断-西医诊断名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_MJZBL_MJZBL_YBTGJCJG     门急诊病历 — 门急诊病历_一般体格检查结果                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_MJZBL_MJZBL_YBTGJCJG') )
 create table  DC_MJZBL_MJZBL_YBTGJCJG (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    tgjc                 nvarchar(500)        not null/* 一般体格检查结果 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_MJZBL_MJZBL_YZMX     门急诊病历 — 门急诊病历_医嘱明细                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_MJZBL_MJZBL_YZMX') )
 create table  DC_MJZBL_MJZBL_YZMX (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yzxmlx               varchar(2)           not null/* 医嘱项目类型代码 */,
    yzxmlxmc             nvarchar(100)        not null/* 医嘱项目类型名称 */,
    yzxmnr               nvarchar(100)        not null/* 医嘱项目内容 */,
    yzbzxx               nvarchar(100)        not null/* 医嘱备注信息 */,
    yzklksdm             varchar(10)          not null/* 医嘱开立科室代码 */,
    yzklks               varchar(50)          not null/* 医嘱开立科室名称 */,
    yzklzdm              varchar(20)          not null/* 医嘱开立者工号 */,
    yzklzqm              varchar(50)          not null/* 医嘱开立者签名 */,
    yzklrq               datetime             not null/* 医嘱开立日期时间 */,
    yzshzdm              varchar(20)          not null/* 医嘱审核者工号 */,
    yzshzqm              varchar(50)          not null/* 医嘱审核者签名 */,
    yzshrq               datetime             not null/* 医嘱审核日期时间 */,
    zxksdm               varchar(10)          not null/* 医嘱执行科室代码 */,
    yzzxks               varchar(50)          not null/* 医嘱执行科室名称 */,
    yzzxzdm              varchar(20)          not null/* 医嘱执行者工号 */,
    yzzxzqm              varchar(50)          not null/* 医嘱执行者签名 */,
    yzzxrq               datetime             not null/* 医嘱执行日期时间 */,
    yzzxzt               varchar(50)          not null/* 医嘱执行状态 */,
    qxyzzdm              varchar(20)          not null/* 取消医嘱者工号 */,
    qxyzzqm              varchar(50)          not null/* 取消医嘱者签名 */,
    yzqxrq               datetime             not null/* 医嘱取消日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_MJZBL_MJZBL_ZYBM     门急诊病历 — 门急诊病历_中医病名                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_MJZBL_MJZBL_ZYBM') )
 create table  DC_MJZBL_MJZBL_ZYBM (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    zybmdm               varchar(64)          null/* 初步诊断-中医病名代码 */,
    zybmmc               varchar(128)         null/* 初步诊断-中医病名名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_MJZBL_MJZBL_ZYZH     门急诊病历 — 门急诊病历_中医证候                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_MJZBL_MJZBL_ZYZH') )
 create table  DC_MJZBL_MJZBL_ZYZH (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    zyzhdm               varchar(64)          null/* 初步诊断-中医证候代码 */,
    zyzhmc               varchar(128)         null/* 初步诊断-中医证候名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_MJZCF_XYCF     门急诊处方 — 西药处方                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_MJZCF_XYCF') )
 create table  DC_MJZCF_XYCF (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    mjzh                 varchar(64)          not null/* 门急诊号 */,
    hzxm                 varchar(64)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    xbdm                 varchar(2)           not null/* 患者性别代码 */,
    xbmc                 varchar(16)          not null/* 患者性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    cfxh                 varchar(64)          not null/* 处方编号 */,
    zzjgdm               varchar(10)          not null/* 医疗机构组织机构代码 */,
    zzjgmc               varchar(70)          not null/* 医疗机构组织机构名称 */,
    cfklrq               date                 not null/* 处方开立日期 */,
    cfklskdm             varchar(10)          not null/* 处方开立科室代码 */,
    cfklks               varchar(50)          not null/* 处方开立科室 */,
    jbzdbm               varchar(64)          not null/* 疾病诊断编码 */,
    jbzd                 varchar(128)         not null/* 疾病诊断名称 */,
    ysbm                 varchar(20)          not null/* 处方开立医师工号 */,
    klysqm               varchar(50)          not null/* 处方开立医师签名 */,
    shyjsbm              varchar(20)          not null/* 处方审核药剂师工号 */,
    shyjsqm              varchar(50)          not null/* 处方审核药剂师签名 */,
    shyjsqmsj            datetime             not null/* 处方审核药剂师签名时间 */,
    tpyjsbm              varchar(20)          not null/* 处方调配药剂师工号 */,
    tpyjsqm              varchar(50)          not null/* 处方调配药剂师签名 */,
    cftpsj               datetime             not null/* 处方调配时间 */,
    hdyjsbm              varchar(20)          not null/* 处方核对药剂师工号 */,
    hdyjsqm              varchar(50)          not null/* 处方核对药剂师签名 */,
    cfhdsj               datetime             not null/* 处方核对时间 */,
    fyyjsbm              varchar(20)          not null/* 处方发药药剂师工号 */,
    fyyjsqm              varchar(50)          not null/* 处方发药药剂师签名 */,
    cffysj               datetime             not null/* 处方发药时间 */,
    cfypje               numeric(8,2)         not null/* 处方药品金额 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_MJZCF_XYCF_YYMX     门急诊处方 — 西药处方_用药明细                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_MJZCF_XYCF_YYMX') )
 create table  DC_MJZCF_XYCF_YYMX (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    ywdm                 varchar(100)         not null/* 药物代码 */,
    ywmc                 varchar(500)         not null/* 药物名称 */,
    ywgg                 varchar(20)          not null/* 药物规格 */,
    ywjxdm               varchar(2)           not null/* 药物剂型代码 */,
    ywjx                 varchar(64)          not null/* 药物剂型名称 */,
    ywsycjl              numeric(5,2)         not null/* 药物使用次剂量 */,
    ywsyjldw             varchar(6)           not null/* 药物使用次单位 */,
    ywsypcdm             varchar(2)           not null/* 药物使用频次代码 */,
    ywsypc               varchar(64)          not null/* 药物使用频次名称 */,
    ywsytj               varchar(3)           not null/* 药物使用途径代码 */,
    ywsytjmc             varchar(64)          not null/* 药物使用途径名称 */,
    ywsyzjl              numeric(12,2)        not null/* 药物使用总剂量 */,
    cfyxts               numeric(2)           not null/* 处方有效天数 */,
    cfypzh               varchar(50)          not null/* 处方药品组号 */,
    cfbzxx               nvarchar(100)        not null/* 处方备注信息 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_MJZCF_ZYCF     门急诊处方 — 中药处方                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_MJZCF_ZYCF') )
 create table  DC_MJZCF_ZYCF (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    mjzh                 varchar(64)          not null/* 门急诊号 */,
    hzxm                 varchar(64)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    xbdm                 varchar(2)           not null/* 患者性别代码 */,
    xbmc                 varchar(16)          not null/* 患者性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    zzjgdm               varchar(10)          not null/* 医疗机构组织机构代码 */,
    zzjgmc               varchar(70)          not null/* 医疗机构组织机构名称 */,
    cfxh                 varchar(12)          not null/* 处方编号 */,
    cflb                 varchar(2)           not null/* 处方类别代码 */,
    cflbmc               varchar(18)          not null/* 处方类别名称 */,
    cfklrq               date                 not null/* 处方开立日期 */,
    cfyxts               numeric(2)           not null/* 处方有效天数 */,
    cfklksdm             varchar(10)          not null/* 科室代码 */,
    cfklks               varchar(50)          not null/* 科室名称 */,
    jbzdbm               varchar(64)          not null/* 西医诊断编码 */,
    jbzd                 varchar(128)         not null/* 西医诊断名称 */,
    zybmdm               varchar(64)          not null/* 中医病名代码 */,
    zybm                 varchar(128)         not null/* 中医病名名称 */,
    zyzhdm               varchar(64)          not null/* 中医证候代码 */,
    zyzh                 varchar(128)         not null/* 中医证候名称 */,
    zfbm                 varchar(20)          null/* 治则治法代码 */,
    zzzf                 nvarchar(100)        null/* 治则治法 */,
    ysbm                 varchar(20)          not null/* 处方开立医师工号 */,
    klysqm               varchar(50)          not null/* 处方开立医师签名 */,
    shyjsbm              varchar(20)          not null/* 处方审核药剂师工号 */,
    shyjsqm              varchar(50)          not null/* 处方审核药剂师签名 */,
    tpyjsbm              varchar(20)          not null/* 处方调配药剂师工号 */,
    tpyjsqm              varchar(50)          not null/* 处方调配药剂师签名 */,
    hdyjsbm              varchar(20)          not null/* 处方核对药剂师工号 */,
    hdyjsqm              varchar(50)          not null/* 处方核对药剂师签名 */,
    fyyjsbm              varchar(20)          not null/* 处方发药药剂师工号 */,
    fyyjsqm              varchar(50)          not null/* 处方发药药剂师签名 */,
    cfbzxx               nvarchar(100)        not null/* 处方备注信息 */,
    cfypje               numeric(8,2)         not null/* 处方药品金额 */,
    cfypzh               varchar(50)          not null/* 处方药品组号 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_MJZCF_ZYCF_CFMX     门急诊处方 — 中药处方_处方明细                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_MJZCF_ZYCF_CFMX') )
 create table  DC_MJZCF_ZYCF_CFMX (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    ywdm                 varchar(100)         not null/* 药物代码 */,
    ywmc                 varchar(500)         not null/* 药物名称 */,
    ywgg                 varchar(20)          not null/* 药物规格 */,
    ywjxdm               varchar(2)           not null/* 药物剂型代码 */,
    ywjx                 varchar(64)          not null/* 药物剂型名称 */,
    ywsycjl              numeric(5,2)         not null/* 药物使用次剂量 */,
    ywsyjldw             varchar(6)           not null/* 药物使用剂量单位 */,
    ywsypcdm             varchar(2)           not null/* 药物使用频次代码 */,
    ywsypc               varchar(64)          not null/* 药物使用频次名称 */,
    ywsytj               varchar(3)           not null/* 药物使用途径代码 */,
    ywsytjmc             varchar(64)          not null/* 药物使用途径名称 */,
    ywsyzjl              numeric(12,2)        not null/* 药物使用总剂量 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_MJZCF_ZYCF_ZYYPCF     门急诊处方 — 中药处方_中药饮片处方                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_MJZCF_ZYCF_ZYYPCF') )
 create table  DC_MJZCF_ZYCF_ZYYPCF (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    zyypcf               nvarchar(500)        not null/* 中药饮片处方 */,
    zyypjs               varchar(2)           not null/* 中药饮片剂数（剂） */,
    zyypjzf              nvarchar(100)        not null/* 中药饮片煎煮法 */,
    zyyyff               nvarchar(100)        not null/* 中药用药方法 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_RYJL_JBXX     入院记录 — 入院记录基本信息                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_RYJL_JBXX') )
 create table  DC_RYJL_JBXX (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    zyh                  varchar(18)          not null/* 住院号 */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
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
    zylbdm               varchar(2)           not null/* 职业类别代码 */,
    zylbmc               varchar(50)          not null/* 职业类别名称 */,
    ryrq                 datetime             not null/* 入院日期时间 */,
    bscszxm              varchar(50)          null/* 病史陈述者姓名 */,
    cszhzgxdm            varchar(2)           null/* 陈述者与患者的关系代码 */,
    cszhzgxmc            varchar(50)          null/* 陈述者与患者的关系名称 */,
    csnrbz               char(1)              not null/* 陈述内容可靠标志 */,
    zs                   nvarchar(100)        not null/* 主诉 */,
    xbs                  nvarchar(2000)       not null/* 现病史 */,
    ybjkbz               char(1)              null/* 一般健康状况标志 */,
    jbs                  nvarchar(1000)       null/* 疾病史（含外伤） */,
    hzcrbz               char(1)              not null/* 患者传染性标志 */,
    crbs                 nvarchar(1000)       null/* 传染病史 */,
    yfjzs                nvarchar(1000)       null/* 预防接种史 */,
    sss                  nvarchar(1000)       null/* 手术史 */,
    sxs                  nvarchar(1000)       null/* 输血史 */,
    gms                  nvarchar(1000)       null/* 过敏史 */,
    grs                  nvarchar(1000)       null/* 个人史 */,
    hys                  nvarchar(1000)       null/* 婚育史 */,
    yjs                  nvarchar(1000)       null/* 月经史 */,
    jzs                  nvarchar(1000)       null/* 家族史 */,
    tjtw                 numeric(4,1)         not null/* 体格检查--体温（℃） */,
    tjml                 numeric(3)           not null/* 体格检查--脉率（次/min） */,
    tjhxpl               numeric(3)           not null/* 体格检查--呼吸频率（次/min） */,
    tjssy                numeric(3)           not null/* 体格检查--收缩压（mmHg） */,
    tjszy                numeric(3)           not null/* 体格检查--舒张压（mmHg） */,
    tjsg                 numeric(5,1)         not null/* 体格检查--身高（cm） */,
    tjtz                 numeric(5,2)         not null/* 体格检查--体重（kg） */,
    tjybjg               nvarchar(1000)       not null/* 体格检查--一般状况检查结果 */,
    tjplmjg              nvarchar(1000)       not null/* 体格检查--皮肤和黏膜检查结果 */,
    tjqblbjg             nvarchar(1000)       not null/* 体格检查--全身浅DC_RYJL_JBXX淋巴结检查结果 */,
    tjtbqgjg             nvarchar(1000)       not null/* 体格检查--头部及其器官检查结果 */,
    tjjbjg               nvarchar(1000)       not null/* 体格检查--颈部检查结果 */,
    tjxbjg               nvarchar(1000)       not null/* 体格检查--胸部检查结果 */,
    tjfbjg               nvarchar(1000)       not null/* 体格检查--腹部检查结果 */,
    tjgmzzjg             nvarchar(1000)       not null/* 体格检查--肛门指诊检查结果描述 */,
    tjwszqjg             nvarchar(1000)       not null/* 体格检查--外生殖器检查结果 */,
    tjjzjg               nvarchar(1000)       not null/* 体格检查--脊柱检查结果 */,
    tjszjg               nvarchar(1000)       not null/* 体格检查--四肢检查结果 */,
    tjsjxtjg             nvarchar(1000)       not null/* 体格检查--神经系统检查结果 */,
    zkqk                 nvarchar(1000)       null/* 专科情况 */,
    fzjcjg               nvarchar(1000)       null/* 辅助检查结果 */,
    zyszgcjg             nvarchar(1000)       null/* 中医“四诊”观察结果 */,
    zfbm                 varchar(20)          null/* 治则治法代码 */,
    zzzf                 nvarchar(100)        null/* 治则治法 */,
    czxyzdmc             varchar(128)         not null/* 初步诊断-西医诊断名称 */,
    czxyzdbm             varchar(64)          not null/* 初步诊断-西医诊断编码 */,
    czzybmmc             varchar(128)         null/* 初步诊断-中医病名名称 */,
    czzybmdm             varchar(64)          null/* 初步诊断-中医病名代码 */,
    czzyzhmc             varchar(128)         null/* 初步诊断-中医证候名称 */,
    czzyzhdm             varchar(64)          null/* 初步诊断-中医证候代码 */,
    czrq                 date                 not null/* 初步诊断日期 */,
    xzxyzdmc             varchar(128)         null/* 修正诊断-西医诊断名称 */,
    xzxyzdbm             varchar(64)          null/* 修正诊断-西医诊断编码 */,
    xzzybmmc             varchar(128)         null/* 修正诊断-中医病名名称 */,
    xzzybmdm             varchar(64)          null/* 修正诊断-中医病名代码 */,
    xzzyzhmc             varchar(128)         null/* 修正诊断-中医证候名称 */,
    xzzyzhdm             varchar(64)          null/* 修正诊断-中医证候代码 */,
    xzzdrq               date                 null/* 修正诊断日期 */,
    qzxyzdmc             varchar(128)         not null/* 确定诊断-西医诊断名称 */,
    qzxyzdbm             varchar(64)          not null/* 确定诊断-西医诊断编码 */,
    qzzybmmc             varchar(128)         null/* 确定诊断-中医病名名称 */,
    qzzybmdm             varchar(64)          null/* 确定诊断-中医病名代码 */,
    qzzyzhmc             varchar(128)         null/* 确定诊断-中医证候名称 */,
    qzzyzhdm             varchar(64)          null/* 确定诊断-中医证候代码 */,
    qzrq                 date                 not null/* 确定诊断日期 */,
    bzmc                 varchar(128)         null/* 补充诊断名称 */,
    bzbm                 varchar(64)          null/* 补充诊断编码 */,
    bzrq                 date                 null/* 补充诊断日期 */,
    ryzdsw               varchar(20)          null/* 入院诊断顺位 */,
    jzysbm               varchar(20)          not null/* 接诊医师编码 */,
    jzysqm               varchar(50)          not null/* 接诊医师签名 */,
    zyysbm               varchar(20)          not null/* 住院医师编码 */,
    zyysqm               varchar(50)          not null/* 住院医师签名 */,
    zzysbm               varchar(20)          not null/* 主治医师编码 */,
    zzysqm               varchar(50)          not null/* 主治医师签名 */,
    zrysbm               varchar(20)          not null/* 主任医师编码 */,
    zrysqm               varchar(50)          not null/* 主任医师签名 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_RYJL_RCYJL     入院记录－24小时内入出院记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_RYJL_RCYJL') )
 create table  DC_RYJL_RCYJL (    
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
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_RYJL_RCYJL_CYXYZD     入院记录－24小时内入出院记录_出院西医诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_RYJL_RCYJL_CYXYZD') )
 create table  DC_RYJL_RCYJL_CYXYZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    czxyzdmc             varchar(128)         not null/* 出院诊断-西医诊断名称 */,
    czxyzdbm             varchar(64)          not null/* 出院诊断-西医诊断编码 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_RYJL_RCYJL_CYZYZD     入院记录－24小时内入出院记录_出院中医诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_RYJL_RCYJL_CYZYZD') )
 create table  DC_RYJL_RCYJL_CYZYZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    czzybmmc             varchar(128)         not null/* 出院诊断-中医病名名称 */,
    czzybmdm             varchar(64)          not null/* 出院诊断-中医病名代码 */,
    czzyzhmc             varchar(128)         not null/* 出院诊断-中医证候名称 */,
    czzyzhdm             varchar(64)          not null/* 出院诊断-中医证候代码 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_RYJL_RCYJL_RYXYZD     入院记录－24小时内入出院记录_入院西医诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_RYJL_RCYJL_RYXYZD') )
 create table  DC_RYJL_RCYJL_RYXYZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    rzxyzdmc             varchar(128)         not null/* 入院诊断-西医诊断名称 */,
    rzxzzdbm             varchar(64)          not null/* 入院诊断-西医诊断编码 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_RYJL_RCYJL_RYZYZD     入院记录－24小时内入出院记录_入院中医诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_RYJL_RCYJL_RYZYZD') )
 create table  DC_RYJL_RCYJL_RYZYZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    rzzybmmc             varchar(128)         null/* 入院诊断-中医病名名称 */,
    rzzybmdm             varchar(64)          null/* 入院诊断-中医病名代码 */,
    rzzyzhmc             varchar(128)         null/* 入院诊断-中医证候名称 */,
    rzzyzhdm             varchar(64)          null/* 入院诊断-中医证候代码 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_RYJL_RCYJL_ZYSZGCJG     入院记录－24小时内入出院记录_中医四诊观察结果                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_RYJL_RCYJL_ZYSZGCJG') )
 create table  DC_RYJL_RCYJL_ZYSZGCJG (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    zyszgcjg             nvarchar(1000)       null/* 中医“四诊”观察结果 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_RYJL_RYSWJL     入院记录 — 24小时内入院死亡记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_RYJL_RYSWJL') )
 create table  DC_RYJL_RYSWJL (    
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
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_RYJL_RYSWJL_RYXYZD     入院记录 — 24小时内入院死亡记录_入院西医诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_RYJL_RYSWJL_RYXYZD') )
 create table  DC_RYJL_RYSWJL_RYXYZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    rzxyzdmc             varchar(128)         not null/* 入院诊断-西医诊断名称 */,
    rzxyzdbm             varchar(64)          not null/* 入院诊断-西医诊断编码 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_RYJL_RYSWJL_RYZYZD     入院记录 — 24小时内入院死亡记录_入院中医诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_RYJL_RYSWJL_RYZYZD') )
 create table  DC_RYJL_RYSWJL_RYZYZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    rzzybmmc             varchar(128)         not null/* 入院诊断-中医病名名称 */,
    rzzybmdm             varchar(64)          not null/* 入院诊断-中医病名代码 */,
    rzzyzhmc             varchar(128)         not null/* 入院诊断-中医证候名称 */,
    rzzyzhdm             varchar(64)          not null/* 入院诊断-中医证候代码 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_RYJL_RYSWJL_SWXYZD     入院记录 — 24小时内入院死亡记录_死亡西医诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_RYJL_RYSWJL_SWXYZD') )
 create table  DC_RYJL_RYSWJL_SWXYZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    szxyzdmc             varchar(128)         not null/* 死亡诊断-西医诊断名称 */,
    szxyzdbm             varchar(64)          not null/* 死亡诊断-西医诊断编码 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_RYJL_RYSWJL_SWZYZD     入院记录 — 24小时内入院死亡记录_死亡中医诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_RYJL_RYSWJL_SWZYZD') )
 create table  DC_RYJL_RYSWJL_SWZYZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    szzybmmc             varchar(128)         not null/* 死亡诊断-中医病名名称 */,
    szzybmdm             varchar(64)          not null/* 死亡诊断-中医病名代码 */,
    szzyzhmc             varchar(128)         not null/* 死亡诊断-中医证候名称 */,
    szzyzhdm             varchar(64)          not null/* 死亡诊断-中医证候代码 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_RYJL_RYSWJL_ZYSZGCJG     入院记录 — 24小时内入院死亡记录_中医四诊观察结果                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_RYJL_RYSWJL_ZYSZGCJG') )
 create table  DC_RYJL_RYSWJL_ZYSZGCJG (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    zyszgcjg             nvarchar(1000)       null/* 中医“四诊”观察结果 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZCJL_DCJL     助产记录 — 待产记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZCJL_DCJL') )
 create table  DC_ZCJL_DCJL (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    zyh                  varchar(64)          not null/* 住院号 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    cfxm                 varchar(50)          not null/* 产妇姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    lxrxm                varchar(50)          not null/* 联系人姓名 */,
    lxrdh                varchar(20)          not null/* 联系人电话 */,
    lxrhzgxdm            varchar(20)          not null/* 联系人与患者的关系代码 */,
    lxrhzgxmc            varchar(50)          not null/* 联系人与患者的关系名称 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    dcrqsj               datetime             not null/* 待产日期时间 */,
    yc                   numeric(2)           not null/* 孕次 */,
    cc                   numeric(2)           not null/* 产次 */,
    mcyjrq               date                 not null/* 末次月经日期 */,
    syxsdm               varchar(2)           not null/* 受孕形式代码 */,
    syxsmc               varchar(18)          not null/* 受孕形式名称 */,
    ycq                  date                 not null/* 预产期 */,
    cqjcbz               char(1)              not null/* 产前检查标志 */,
    cqjcycqk             varchar(200)         not null/* 产前检查异常情况 */,
    yqtzkg               numeric(6,2)         not null/* 孕前体重（kg） */,
    sgcm                 numeric(5,1)         not null/* 身高（cm） */,
    cqtzkg               numeric(6,2)         not null/* 分娩前体重（kg） */,
    ccrstsqk             varchar(200)         not null/* 此次妊娠特殊情况 */,
    jws                  varchar(1000)        not null/* 既往史 */,
    sss                  varchar(1000)        not null/* 手术史 */,
    jwycs                varchar(1000)        not null/* 既往孕产史 */,
    ssy                  numeric(3)           not null/* 收缩压（mmHg） */,
    szy                  numeric(3)           not null/* 舒张压（mmHg） */,
    tw                   numeric(4,1)         not null/* 体温（℃） */,
    ml                   numeric(3)           not null/* 脉率（次/min） */,
    hxl                  numeric(3)           not null/* 呼吸频率（次/min） */,
    gdgdcm               numeric(4,1)         not null/* 宫底高度（cm） */,
    fw                   numeric(5,1)         not null/* 腹围（cm） */,
    tfwdm                varchar(2)           not null/* 胎方位代码 */,
    tfwmc                varchar(18)          not null/* 胎方位名称 */,
    gjtetz               numeric(4)           not null/* 估计胎儿体重 */,
    txlc                 numeric(3)           not null/* 胎心率（次/min） */,
    twncqkdpg            varchar(200)         not null/* 头位难产情况的评估 */,
    ckhjcm               numeric(3,1)         not null/* 出口横径（cm） */,
    dcwjcm               numeric(4,1)         not null/* 骶耻外径（cm） */,
    zgjjjjcm             numeric(4,1)         not null/* 坐骨结节间径（cm） */,
    gsqk                 varchar(200)         not null/* 宫缩情况 */,
    gjhd                 varchar(100)         not null/* 宫颈情况 */,
    gkqk                 varchar(100)         not null/* 宫口情况 */,
    tmqkdm               varchar(2)           not null/* 胎膜情况代码 */,
    tmqkmc               varchar(18)          not null/* 胎膜情况名称 */,
    pmfsdm               varchar(2)           not null/* 破膜方式代码 */,
    pmfsmc               varchar(12)          not null/* 破膜方式名称 */,
    xlwz                 varchar(100)         not null/* 先露位置 */,
    ysqk                 varchar(100)         not null/* 羊水情况 */,
    bgcybz               char(1)              not null/* 膀胱充盈标志 */,
    czqbz                char(1)              not null/* 肠胀气标志 */,
    jcfsdm               varchar(2)           not null/* 检查方式代码 */,
    jcfsmc               varchar(18)          not null/* 检查方式名称 */,
    czjh                 varchar(2000)        not null/* 处置计划 */,
    jhxqdfmfs            varchar(2)           not null/* 计划选取的分娩方式代码 */,
    jhxqdfmfsmc          varchar(18)          not null/* 计划选取的分娩方式名称 */,
    ccjlrqsj             datetime             not null/* 产程记录日期时间 */,
    ccjg                 varchar(200)         not null/* 产程经过 */,
    ccjczdm              varchar(20)          not null/* 产程检查者工号 */,
    ccjczqm              varchar(50)          not null/* 产程检查者签名 */,
    zzysdm               varchar(20)          not null/* 主治医生工号 */,
    zzysqm               varchar(50)          not null/* 主治医生名称 */,
    jlrdm                varchar(20)          not null/* 记录人员工号 */,
    jlrqm                varchar(50)          not null/* 记录人员签名 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZCJL_PGC     助产记录 — 剖宫产记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZCJL_PGC') )
 create table  DC_ZCJL_PGC (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    zyh                  varchar(64)          not null/* 住院号 */,
    cfxm                 varchar(50)          not null/* 产妇姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    dcrqsj               datetime             not null/* 待产日期时间 */,
    cqzdmc               varchar(200)         not null/* 术前诊断 */,
    sszz                 varchar(500)         not null/* 手术指征 */,
    ssjczbm              varchar(64)          not null/* 手术及操作编码 */,
    ssjczmc              varchar(128)         not null/* 手术及操作名称 */,
    ssksrqsj             datetime             not null/* 手术开始日期时间 */,
    mzffdm               varchar(2)           not null/* 麻醉方法代码 */,
    mzffmc               varchar(100)         not null/* 麻醉方法名称 */,
    mztw                 varchar(100)         not null/* 麻醉体位 */,
    mzxg                 varchar(100)         not null/* 麻醉效果 */,
    pgcssgc              varchar(2000)        not null/* 剖宫产手术过程 */,
    zgqk                 varchar(100)         not null/* 子宫情况 */,
    temcfsdm             varchar(11)          not null/* 胎儿娩出代码 */,
    temcfsmc             varchar(100)         not null/* 胎儿娩出方式 */,
    ysxz                 varchar(100)         not null/* 羊水性状 */,
    ysl                  numeric(5)           not null/* 羊水量（mL） */,
    tpwcrqsj             datetime             not null/* 胎盘娩出日期时间 */,
    tpmcqk               varchar(100)         not null/* 胎盘娩出情况 */,
    tmwzqkbz             char(1)              not null/* 胎膜完整情况标志 */,
    rjsz                 numeric(3)           not null/* 绕颈身（周） */,
    qdcdcm               numeric(5)           not null/* 脐带长度（cm） */,
    qdycqkms             varchar(200)         not null/* 脐带异常情况描述 */,
    cqdxqkbz             char(1)              not null/* 存脐带血情况标志 */,
    zgbfhqk              varchar(100)         not null/* 子宫壁缝合情况 */,
    gsjmc                varchar(50)          not null/* 宫缩剂名称 */,
    gsjsyff              varchar(100)         not null/* 宫缩剂使用方法 */,
    temohs               varchar(100)         not null/* 胎膜黄染 */,
    tepanhs              varchar(100)         not null/* 胎盘黄染 */,
    tfwdm                varchar(20)          not null/* 胎方位代码 */,
    tfwmc                varchar(50)          not null/* 胎方位名称 */,
    ssyy                 varchar(50)          not null/* 手术用药 */,
    ssyyl                varchar(50)          not null/* 手术用药量 */,
    fqtczg               varchar(100)         not null/* 腹腔探查子宫 */,
    fqtcfj               varchar(100)         not null/* 腹腔探查附件 */,
    gqtcycqkbz           char(1)              not null/* 宫腔探查异常情况标志 */,
    gqtcjlbz             char(1)              not null/* 宫腔探查肌瘤标志 */,
    gqtcycqkms           varchar(1000)        not null/* 宫腔探查异常情况描述 */,
    gqtcclqk             varchar(100)         not null/* 宫腔探查处理情况 */,
    ssscfqk              varchar(1000)        not null/* 手术时产妇情况 */,
    cxlml                numeric(5)           not null/* 出血量（mL） */,
    sxcf                 varchar(100)         not null/* 输血成分 */,
    sxlml                numeric(4)           not null/* 输血量（mL） */,
    sylml                numeric(5)           not null/* 输液量（mL） */,
    gysjmin              numeric(4)           not null/* 供氧时间（min） */,
    qtyy                 varchar(50)          not null/* 其他用药 */,
    qtqk                 varchar(100)         not null/* 其他用药情况 */,
    ssjsrqsj             datetime             not null/* 手术结束日期时间 */,
    ssqcsjmin            numeric(4)           not null/* 手术全程时间（min） */,
    shzdmc               varchar(200)         not null/* 术后诊断 */,
    shgcrqsj             datetime             not null/* 术后观察日期时间 */,
    shjcmin              numeric(3)           not null/* 术后检查时间（min） */,
    chssymmhg            numeric(3)           not null/* 术后收缩压（mmHg ） */,
    chszymmhg            numeric(3)           not null/* 术后舒张压（mmHg ） */,
    chmbc                numeric(3)           not null/* 术后脉搏（次/min ） */,
    chxlc                numeric(3)           not null/* 术后心率（次/min ） */,
    chcxlml              numeric(5)           not null/* 术后出血量（mL） */,
    chgs                 varchar(200)         not null/* 术后宫缩 */,
    chgdgdcm             numeric(4,1)         not null/* 术后宫底高度（cm） */,
    jdcsqk               varchar(100)         not null/* 脐带缠绕情况 */,
    xsexbdm              varchar(4)           not null/* 新生儿性别代码 */,
    xsexbmc              varchar(20)          not null/* 新生儿性别名称 */,
    xsecstzg             numeric(4)           not null/* 新生儿出生体重（g） */,
    xsecssccm            numeric(5,1)         not null/* 新生儿出生身长（cm） */,
    jdnzzs               numeric(5)           not null/* 脐带扭转（周） */,
    cldx                 varchar(100)         not null/* 产瘤大小 */,
    clbw                 varchar(100)         not null/* 产瘤部位 */,
    aafsm                varchar(10)          not null/* Apgar评分间隔时间代码 */,
    aafmc                varchar(18)          not null/* Apgar评分间隔时间名称 */,
    apgarpfz             numeric(2)           not null/* Apgar评分值 */,
    fmjjdm               varchar(10)          not null/* 分娩结局代码 */,
    fmjjmc               varchar(100)         not null/* 分娩结局名称 */,
    xseycqkdm            varchar(10)          not null/* 新生儿异常情况代码 */,
    xseycqkmc            varchar(100)         not null/* 新生儿异常情况名称 */,
    sszdm                varchar(20)          not null/* 手术医生工号 */,
    sszqm                varchar(50)          not null/* 手术医生签名 */,
    mzysdm               varchar(20)          not null/* 麻醉医生工号 */,
    mzysqm               varchar(50)          not null/* 麻醉医生签名 */,
    qxhsdm               varchar(20)          not null/* 器械护士工号 */,
    qxhsqm               varchar(50)          not null/* 器械护士签名 */,
    zsdm                 varchar(20)          not null/* 手术助手工号 */,
    zsqm                 varchar(50)          not null/* 手术助手签名 */,
    ekysdm               varchar(20)          not null/* 儿科医生工号 */,
    ekysqm               varchar(50)          not null/* 儿科医生签名 */,
    zdysdm               varchar(20)          not null/* 指导者工号 */,
    zdysqm               varchar(50)          not null/* 指导者签名 */,
    hyzdm                varchar(20)          not null/* 护婴者工号 */,
    hyzqm                varchar(50)          not null/* 护婴者签名 */,
    jlrdm                varchar(20)          not null/* 记录人员工号 */,
    jlrqm                varchar(50)          not null/* 记录人员签名 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZCJL_YDFM     助产记录 — 阴道分娩                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZCJL_YDFM') )
 create table  DC_ZCJL_YDFM (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    zyh                  varchar(64)          not null/* 住院号 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    cfxm                 varchar(50)          not null/* 产妇姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    yc                   numeric(2)           not null/* 孕次 */,
    cc                   numeric(2)           not null/* 产次 */,
    mcyjrq               datetime             not null/* 末次月经日期 */,
    ycq                  date                 not null/* 预产期 */,
    lcrqsj               datetime             not null/* 临产日期时间 */,
    tmplrqsj             datetime             not null/* 胎膜破裂日期时间 */,
    zdmc                 varchar(200)         not null/* 入院诊断 */,
    chpgcybz             char(1)              not null/* 产后膀胱充盈标志 */,
    qysxz                varchar(100)         not null/* 前羊水性状 */,
    qyslml               numeric(5)           not null/* 前羊水量（mL） */,
    gsksrqsj             datetime             not null/* 宫缩开始日期时间 */,
    d1ccsc               numeric(4)           not null/* 第1产程时长（min） */,
    gkkqrqsj             datetime             not null/* 宫口开全日期时间 */,
    d2ccsc               numeric(4)           not null/* 第2产程时长（min） */,
    temcrqsj             datetime             not null/* 胎儿娩出日期时间 */,
    d3ccsc               numeric(4)           not null/* 第3产程时长（min） */,
    tpmcrqsj             datetime             not null/* 胎盘娩出日期时间 */,
    zccsc                numeric(4)           not null/* 总产程时长（min） */,
    tfwdm                varchar(2)           not null/* 胎方位代码 */,
    tfwmc                varchar(50)          not null/* 胎方位名称 */,
    temczcbz             char(1)              not null/* 胎儿娩出助产标志 */,
    zcfs                 varchar(100)         not null/* 助产方式 */,
    tpmcqk               varchar(100)         not null/* 胎盘娩出情况 */,
    tmwzqkbz             char(1)              not null/* 胎膜完整情况标志 */,
    ysxz                 varchar(100)         not null/* 羊水性状 */,
    yslml                numeric(5)           not null/* 羊水量（mL） */,
    qdcdcm               numeric(5)           not null/* 脐带长度（cm） */,
    rjsz                 numeric(3)           not null/* 绕颈身（周） */,
    qdycqkbz             char(1)              not null/* 脐带异常情况标志 */,
    qdycqkms             varchar(200)         not null/* 脐带异常情况描述 */,
    csyy                 varchar(50)          not null/* 产时用药 */,
    yfcs                 varchar(200)         not null/* 预防措施 */,
    cfhyqkbz             char(1)              not null/* 产妇会阴切开标志 */,
    hyqkwz               varchar(100)         not null/* 会阴切开位置 */,
    cfhyfhzs             numeric(2)           not null/* 产妇会阴缝合针数 */,
    cfhylscdmc           varchar(100)         not null/* 会阴裂伤情况 */,
    cfhylscddm           varchar(2)           not null/* 会阴裂伤情况代码 */,
    hyxzbz               char(1)              not null/* 会阴血肿标志 */,
    hyxzdx               varchar(50)          not null/* 会阴血肿大小 */,
    hyxzcl               varchar(200)         not null/* 会阴血肿处理 */,
    mzffdm               varchar(2)           not null/* 麻醉方法代码 */,
    mzffmc               varchar(50)          not null/* 麻醉方法名称 */,
    mzywdm               varchar(32)          not null/* 麻醉药物代码 */,
    mzywmc               varchar(128)         not null/* 麻醉药物名称 */,
    ydlsbz               char(1)              not null/* 阴道裂伤标志 */,
    ydxzbz               char(1)              not null/* 阴道血肿标志 */,
    ydxzdx               varchar(50)          not null/* 阴道血肿大小 */,
    gjlsbz               char(1)              not null/* 宫颈裂伤标志 */,
    ydzcbz               char(1)              not null/* 阴道助产标志 */,
    ydzcfs               varchar(100)         not null/* 阴道助产方式 */,
    ydxzcl               varchar(100)         not null/* 阴道血肿处理 */,
    gjfhqk               varchar(100)         not null/* 宫颈缝合情况 */,
    chyy                 varchar(50)          not null/* 产后用药 */,
    fmgczy               varchar(200)         not null/* 分娩过程摘要 */,
    gsqk                 varchar(200)         not null/* 宫缩情况 */,
    zgqk                 varchar(100)         not null/* 子宫情况 */,
    elzk                 varchar(100)         not null/* 恶露状况 */,
    hyqk                 varchar(100)         not null/* 会阴情况 */,
    xbssgc               varchar(100)         not null/* 修补手术过程 */,
    cqdxqkbz             char(1)              not null/* 存脐带血情况标志 */,
    chzdmc               varchar(200)         not null/* 产后诊断 */,
    chgcrqsj             datetime             not null/* 产后观察日期时间 */,
    chjcsj               numeric(3)           not null/* 产后检查时间（min） */,
    chssy                numeric(3)           not null/* 产后收缩压（mmHg ） */,
    chszy                numeric(3)           not null/* 产后舒张压（mmHg ） */,
    chmbc                numeric(3)           not null/* 产后脉搏（次/min ） */,
    chxlc                numeric(3)           not null/* 产后心率（次/min ） */,
    chcxl                numeric(5)           not null/* 产后出血量（mL） */,
    chgs                 varchar(200)         not null/* 产后宫缩 */,
    chgdgd               numeric(4,1)         not null/* 产后宫底高度（cm） */,
    gc                   varchar(100)         not null/* 肛查 */,
    xsexbdm              varchar(2)           not null/* 新生儿性别代码 */,
    xsexbmc              varchar(100)         not null/* 新生儿性别名称 */,
    xsecstzg             numeric(4)           not null/* 新生儿出生体重（g） */,
    xsecssccm            numeric(5,1)         not null/* 新生儿出生身长（cm） */,
    cldx                 varchar(100)         not null/* 产瘤大小 */,
    clbw                 varchar(100)         not null/* 产瘤部位 */,
    aafsm                varchar(2)           not null/* Apgar评分间隔时间代码 */,
    aafsmc               varchar(100)         not null/* Apgar评分间隔时间 */,
    apgarpfz             numeric(2)           not null/* Apgar评分值 */,
    fmjjdm               varchar(2)           not null/* 分娩结局代码 */,
    fmjjmc               varchar(100)         not null/* 分娩结局名称 */,
    xseycqkdm            varchar(2)           not null/* 新生儿异常情况代码 */,
    fmgctsqkms           varchar(200)         not null/* 分娩过程特殊情况描述 */,
    xseycqkmc            varchar(100)         not null/* 新生儿异常情况名称 */,
    ssysdm               varchar(20)          not null/* 手术医生工号 */,
    ssysqm               varchar(50)          not null/* 手术医生签名 */,
    jszdm                varchar(20)          not null/* 接生人员工号 */,
    jszqm                varchar(50)          not null/* 接生人员签名 */,
    zczdm                varchar(20)          not null/* 助产者工号 */,
    zczqm                varchar(50)          not null/* 助产者签名 */,
    zsdm                 varchar(20)          not null/* 助手工号 */,
    zsqm                 varchar(50)          not null/* 助手签名 */,
    ekysdm               varchar(20)          not null/* 儿科医生工号 */,
    ekysqm               varchar(50)          not null/* 儿科医生签名 */,
    hyzdm                varchar(20)          not null/* 护婴者工号 */,
    hyzqm                varchar(50)          not null/* 护婴者签名 */,
    zdzdm                varchar(20)          not null/* 指导者工号 */,
    zdzqm                varchar(50)          not null/* 指导者签名 */,
    jlrdm                varchar(20)          not null/* 记录人员工号 */,
    jlrqm                varchar(50)          not null/* 记录人员签名 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_MZJL     一般治疗处置记录 — 麻醉记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_MZJL') )
 create table  DC_ZLCZJL_MZJL (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    jzlb                 varchar(2)           not null/* 就诊类别 */,
    mjzh                 varchar(64)          not null/* 门（急）诊号 */,
    zyh                  varchar(64)          not null/* 住院号 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    dzsqdbh              varchar(20)          not null/* 电子申请单编号 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(64)          not null/* 患者姓名 */,
    xbdm                 varchar(2)           not null/* 患者性别代码 */,
    xbmc                 varchar(16)          not null/* 患者性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    tzkg                 numeric(6,2)         null/* 体重（kg） */,
    abo                  varchar(2)           not null/* ABO血型代码 */,
    abomc                varchar(18)          not null/* ABO血型名称 */,
    rh                   varchar(2)           not null/* Rh血型代码 */,
    rhmc                 varchar(18)          not null/* Rh血型名称 */,
    ml                   numeric(3)           not null/* 脉率（次/min） */,
    csssrqsj             datetime             not null/* 出手术室日期时间 */,
    sxrqsj               datetime             null/* 输血日期时间 */,
    sxpzdm               varchar(2)           null/* 输血品种代码 */,
    sxpzmc               varchar(50)          null/* 输血品种名称 */,
    sxlml                numeric(4)           null/* 输血量（mL） */,
    sxljldw              varchar(10)          null/* 输血量计量单位 */,
    sxfybz               char(1)              null/* 输血反应标志 */,
    szsyxm               varchar(50)          null/* 术中输液项目 */,
    cxl                  numeric(5)           null/* 出血量（mL） */,
    hzqxdm               varchar(2)           null/* 患者去向代码 */,
    hzqxmc               varchar(64)          null/* 患者去向名称 */,
    mzysdm               varchar(50)          not null/* 麻醉医师工号 */,
    mzysqm               varchar(50)          not null/* 麻醉医师签名 */,
    qmrqsj               datetime             not null/* 签名日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_MZJL_CGJCXM     一般治疗处置记录 — 麻醉记录_常规监测项目                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_MZJL_CGJCXM') )
 create table  DC_ZLCZJL_MZJL_CGJCXM (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    cgjcxmmc             varchar(100)         not null/* 常规监测项目名称 */,
    cgjcxmjg             varchar(200)         not null/* 常规监测项目结果 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_MZJL_HXPLMX     一般治疗处置记录 — 麻醉记录_呼吸频率明细                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_MZJL_HXPLMX') )
 create table  DC_ZLCZJL_MZJL_HXPLMX (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    hxl                  numeric(3)           not null/* 呼吸频率（次/min） */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_MZJL_MZMX     一般治疗处置记录 — 麻醉记录_麻醉明细                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_MZJL_MZMX') )
 create table  DC_ZLCZJL_MZJL_MZMX (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    mzffdm               varchar(2)           not null/* 麻醉方法代码 */,
    mzffmc               varchar(18)          not null/* 麻醉方法名称 */,
    qgcgfl               varchar(100)         null/* 气管插管分类 */,
    mzywdm               varchar(10)          not null/* 麻醉药物代码 */,
    mzywmc               varchar(50)          not null/* 麻醉药物名称 */,
    mztw                 varchar(100)         not null/* 麻醉体位 */,
    asafjbzdm            varchar(2)           not null/* ASA分级标准代码 */,
    asafjbzmc            varchar(32)          not null/* ASA分级标准名称 */,
    mzxg                 varchar(100)         not null/* 麻醉效果 */,
    mzqyy                varchar(100)         not null/* 麻醉前用药 */,
    mzksrqsj             datetime             not null/* 麻醉开始日期时间 */,
    hxlxdm               varchar(2)           not null/* 呼吸类型代码 */,
    hxlxmc               varchar(32)          not null/* 呼吸类型名称 */,
    mzms                 varchar(200)         not null/* 麻醉描述 */,
    mzhbzbzdm            varchar(2)           not null/* 麻醉合并症标志代码 */,
    mzhbzbzmc            varchar(32)          not null/* 麻醉合并症标志名称 */,
    ccgc                 varchar(2000)        null/* 穿刺过程 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_MZJL_SHZD     一般治疗处置记录 — 麻醉记录_术后诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_MZJL_SHZD') )
 create table  DC_ZLCZJL_MZJL_SHZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    shzdbm               varchar(64)          not null/* 术后诊断编码 */,
    shzdmc               varchar(128)         not null/* 术后诊断名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_MZJL_SQZD     一般治疗处置记录 — 麻醉记录_术前诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_MZJL_SQZD') )
 create table  DC_ZLCZJL_MZJL_SQZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    sqzdbm               varchar(64)          not null/* 术前诊断编码 */,
    sqzdmc               varchar(128)         not null/* 术前诊断名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_MZJL_SSJL     一般治疗处置记录 — 麻醉记录_手术记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_MZJL_SSJL') )
 create table  DC_ZLCZJL_MZJL_SSJL (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    ssjbh                varchar(20)          not null/* 手术间编号 */,
    ssjczbm              varchar(64)          not null/* 手术及操作编码 */,
    ssjczmc              varchar(128)         not null/* 手术及操作名称 */,
    sstwdm               varchar(2)           not null/* 手术体位代码 */,
    sstwmc               varchar(50)          not null/* 手术体位名称 */,
    ssksrqsj             datetime             not null/* 手术开始日期时间 */,
    ssjsrqsj             datetime             not null/* 手术结束日期时间 */,
    sszdm                varchar(50)          not null/* 手术者工号 */,
    sszxm                varchar(50)          not null/* 手术者姓名 */,
    zlgcms               varchar(2000)        not null/* 诊疗过程描述 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_MZJL_TSJCXM     一般治疗处置记录 — 麻醉记录_特殊监测项目                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_MZJL_TSJCXM') )
 create table  DC_ZLCZJL_MZJL_TSJCXM (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    tsjcxmmc             varchar(200)         not null/* 特殊监测项目名称 */,
    tsjcxmjg             varchar(200)         not null/* 特殊监测项目结果 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_MZJL_TWMX     一般治疗处置记录 — 麻醉记录_体温明细                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_MZJL_TWMX') )
 create table  DC_ZLCZJL_MZJL_TWMX (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    tw                   numeric(4,1)         not null/* 体温（℃） */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_MZJL_XLMX     一般治疗处置记录 — 麻醉记录_心率明细                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_MZJL_XLMX') )
 create table  DC_ZLCZJL_MZJL_XLMX (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    xlc                  numeric(3)           not null/* 心率（次/min） */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_MZJL_XYMX     一般治疗处置记录 — 麻醉记录_血压明细                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_MZJL_XYMX') )
 create table  DC_ZLCZJL_MZJL_XYMX (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    ssy                  numeric(3)           not null/* 收缩压（mmHg） */,
    szy                  numeric(3)           not null/* 舒张压（mmHg） */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_MZJL_YWSY     一般治疗处置记录 — 麻醉记录_药物使用明细                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_MZJL_YWSY') )
 create table  DC_ZLCZJL_MZJL_YWSY (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    ywdm                 varchar(50)          not null/* 药物代码 */,
    ywmc                 varchar(50)          not null/* 药物名称 */,
    ywyf                 varchar(100)         not null/* 药物用法 */,
    ywsypl               varchar(2)           not null/* 药物使用频率 */,
    ywsypldm             varchar(18)          not null/* 药物使用剂量代码 */,
    ywsyjldw             varchar(6)           not null/* 药物使用剂量单位 */,
    ywsycjl              numeric(5,2)         not null/* 药物使用次剂量 */,
    ywsyzjl              numeric(12,2)        not null/* 药物使用总剂量 */,
    ywsytjdm             numeric(3)           not null/* 药物使用途径代码 */,
    ywsytjmc             varchar(18)          not null/* 药物使用途径名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_MZSHFSJL     一般治疗处置记录 — 麻醉术后访视记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_MZSHFSJL') )
 create table  DC_ZLCZJL_MZSHFSJL (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    mjzh                 varchar(64)          not null/* 门（急）诊号 */,
    zyh                  varchar(64)          not null/* 住院号 */,
    jzlb                 varchar(2)           not null/* 就诊类别 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    dzsqsbh              varchar(20)          not null/* 电子申请单编号 */,
    zzjgdm               varchar(10)          not null/* 医疗机构组织机构代码 */,
    zzjgmc               varchar(70)          not null/* 医疗机构组织机构名称 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(64)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    xbdm                 varchar(2)           not null/* 患者性别代码 */,
    xbmc                 varchar(16)          not null/* 患者性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    tz                   numeric(6,2)         not null/* 体重（kg） */,
    aboxx                varchar(2)           null/* ABO血型代码 */,
    aboxxmc              varchar(18)          null/* ABO血型名称 */,
    rhxx                 varchar(2)           null/* Rh血型代码 */,
    rhxxmc               varchar(18)          null/* Rh血型名称 */,
    ybzkjcjg             nvarchar(1000)       not null/* 一般状况检查结果 */,
    ssjczbm              varchar(64)          not null/* 手术及操作编码 */,
    ssjczmc              varchar(128)         not null/* 手术及操作名称 */,
    mzff                 varchar(2)           not null/* 麻醉方法代码 */,
    mzffmc               varchar(30)          not null/* 麻醉方法名称 */,
    mzhfqk               nvarchar(100)        not null/* 麻醉恢复情况 */,
    qxrqsj               datetime             not null/* 清醒日期时间 */,
    bcqgcgbz             char(1)              null/* 拔除气管插管标志 */,
    mzsyz                nvarchar(100)        not null/* 麻醉适应证 */,
    ysbm                 varchar(20)          null/* 医生编码 */,
    mzysbm               varchar(20)          not null/* 麻醉医师工号 */,
    mzysqm               varchar(50)          not null/* 麻醉医师签名 */,
    qmrqsj               datetime             not null/* 签名日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_MZSHFSJL_SHZD     一般治疗处置记录 — 麻醉术后访视记录_术后诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_MZSHFSJL_SHZD') )
 create table  DC_ZLCZJL_MZSHFSJL_SHZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    dzsqsbh              varchar(20)          not null/* 电子申请单编号 */,
    shzdbm               varchar(64)          not null/* 术后诊断编码 */,
    shzdmc               varchar(128)         not null/* 术后诊断名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_MZSHFSJL_SQZD     一般治疗处置记录 — 麻醉术后访视记录_术前诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_MZSHFSJL_SQZD') )
 create table  DC_ZLCZJL_MZSHFSJL_SQZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    dzsqsbh              varchar(20)          not null/* 电子申请单编号 */,
    sqzdbm               varchar(64)          not null/* 术前诊断编码 */,
    sqzdmc               varchar(128)         not null/* 术前诊断名称 */,
    
   
    

	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_MZSHFSJL_TSQK     一般治疗处置记录 — 麻醉术后访视记录_特殊情况                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_MZSHFSJL_TSQK') )
 create table  DC_ZLCZJL_MZSHFSJL_TSQK (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    tsqk                 nvarchar(1000)       null/* 特殊情况 */,
    
   
    

	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_MZSQFSJL     一般治疗处置记录 — 麻醉术前访视记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_MZSQFSJL') )
 create table  DC_ZLCZJL_MZSQFSJL (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    mjzh                 varchar(64)          not null/* 门（急）诊号 */,
    zyh                  varchar(64)          not null/* 住院号 */,
    jzlb                 varchar(2)           not null/* 就诊类别 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    dzsqsbh              varchar(20)          not null/* 电子申请单编号 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(64)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    xbdm                 varchar(2)           not null/* 患者性别代码 */,
    xbmc                 varchar(16)          not null/* 患者性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    tz                   numeric(6,2)         null/* 体重（kg） */,
    aboxx                varchar(2)           not null/* ABO血型代码 */,
    aboxxmc              varchar(18)          not null/* ABO血型名称 */,
    rhxx                 varchar(2)           not null/* Rh血型代码 */,
    rhxxmc               varchar(18)          not null/* Rh血型名称 */,
    sqzdbm               varchar(64)          not null/* 术前诊断编码 */,
    sqzdmc               varchar(128)         not null/* 术前诊断名称 */,
    sqhbjb               nvarchar(100)        null/* 术前合并疾病 */,
    jybs                 nvarchar(100)        not null/* 简要病史 */,
    xdtjcjg              nvarchar(100)        null/* 心电图检查结果 */,
    xbxxjc               nvarchar(100)        null/* 胸部X线检查结果 */,
    ctjcjg               nvarchar(100)        null/* CT检查结果 */,
    bcjcjg               nvarchar(100)        null/* B超检查结果 */,
    mricjc               nvarchar(1000)       null/* MRI超检查结果 */,
    fgnjcjg              nvarchar(1000)       null/* 肺功能检查结果 */,
    xcgjcjg              nvarchar(1000)       null/* 血常规检查结果 */,
    ncgjcjg              nvarchar(100)        null/* 尿常规检查结果 */,
    nxgnjc               nvarchar(100)        null/* 凝血功能检查结果 */,
    ggnjcjg              nvarchar(100)        null/* 肝功能检查结果 */,
    xqfxjc               nvarchar(1000)       null/* 血气分析检查结果 */,
    jsztzcbz             char(1)              null/* 精神状态正常标志 */,
    xztzjg               nvarchar(100)        null/* 心脏听诊结果 */,
    fbtzjg               nvarchar(100)        null/* 肺部听诊结果 */,
    szjcjg               nvarchar(1000)       null/* 四肢检查结果 */,
    jzjcjg               nvarchar(1000)       null/* 脊柱检查结果 */,
    fbjcjg               nvarchar(1000)       null/* 腹部检查结果 */,
    qgjcjg               nvarchar(100)        null/* 气管检查结果 */,
    ycjcjg               nvarchar(100)        null/* 牙齿检查结果 */,
    mzysbm               varchar(20)          not null/* 麻醉医师工号 */,
    mzysqm               varchar(50)          not null/* 麻醉医师签名 */,
    qmrq                 datetime             not null/* 签名日期时间 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_MZSQFSJL_GMS     一般治疗处置记录 — 麻醉术前访视记录_过敏史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_MZSQFSJL_GMS') )
 create table  DC_ZLCZJL_MZSQFSJL_GMS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    gms                  nvarchar(1000)       null/* 过敏史 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_MZSQFSJL_NMZFF     一般治疗处置记录 — 麻醉术前访视记录_拟实施麻醉方法                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_MZSQFSJL_NMZFF') )
 create table  DC_ZLCZJL_MZSQFSJL_NMZFF (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    nmzffdm              varchar(2)           not null/* 拟实施麻醉方法代码 */,
    nmzffmc              varchar(30)          not null/* 拟实施麻醉方法名称 */,
    zysx                 nvarchar(1000)       not null/* 注意事项 */,
    sqmzyz               nvarchar(1000)       not null/* 术前麻醉医嘱 */,
    mzsyz                nvarchar(100)        not null/* 麻醉适应证 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_MZSQFSJL_NSSCZ     一般治疗处置记录 — 麻醉术前访视记录_拟实施手术及操作                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_MZSQFSJL_NSSCZ') )
 create table  DC_ZLCZJL_MZSQFSJL_NSSCZ (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    nssczbm              varchar(64)          not null/* 拟实施手术及操作编码 */,
    nssczmc              varchar(128)         not null/* 拟实施手术及操作名称 */,
    ssjbh                varchar(20)          not null/* 手术间编号 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_MZSQFSJL_YBZKJCJG     一般治疗处置记录 — 麻醉术前访视记录_一般状况检查结果                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_MZSQFSJL_YBZKJCJG') )
 create table  DC_ZLCZJL_MZSQFSJL_YBZKJCJG (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    ybzkjc               nvarchar(1000)       null/* 一般状况检查结果 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_SXJL     一般治疗处置记录 — 输血记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_SXJL') )
 create table  DC_ZLCZJL_SXJL (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    mjzh                 varchar(64)          not null/* 门（急）诊号 */,
    zyh                  varchar(64)          not null/* 住院号 */,
    jzlb                 varchar(2)           not null/* 就诊类别 */,
    dzsqdbh              varchar(20)          not null/* 电子申请单编号 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(64)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    xbdm                 varchar(2)           not null/* 患者性别代码 */,
    xbmc                 varchar(16)          not null/* 患者性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    aboxx                varchar(2)           not null/* ABO血型代码 */,
    aboxxmc              varchar(18)          not null/* ABO血型名称 */,
    rhxx                 varchar(2)           not null/* Rh血型代码 */,
    rhxxmc               varchar(18)          not null/* Rh血型名称 */,
    sxsbz                char(1)              not null/* 输血史标识代码 */,
    sxsbzmc              varchar(64)          not null/* 输血史标识名称 */,
    sxxzdm               varchar(2)           not null/* 输血性质代码 */,
    sxxzmc               varchar(18)          not null/* 输血性质名称 */,
    sqaboxx              varchar(2)           not null/* 申请ABO血型代码 */,
    sqaboxxmc            varchar(18)          not null/* 申请ABO血型名称 */,
    sqrhxx               varchar(2)           not null/* 申请Rh血型代码 */,
    sqrhxxmc             varchar(18)          not null/* 申请Rh血型名称 */,
    sxzz                 nvarchar(500)        not null/* 输血指征 */,
    sxgcjl               nvarchar(2000)       not null/* 输血过程记录 */,
    sxpzdm               varchar(2)           not null/* 输血品种代码 */,
    sxpzmc               varchar(50)          not null/* 输血品种名称 */,
    xdbm                 varchar(10)          not null/* 血袋编码 */,
    sxl                  numeric(4)           not null/* 输血量（mL） */,
    sxljldw              varchar(10)          not null/* 输血量计量单位 */,
    sxfybz               char(1)              not null/* 输血反应标志 */,
    sxfylx               varchar(2)           not null/* 输血反应类型 */,
    sxfylxmc             varchar(18)          not null/* 输血反应类型名称 */,
    sxcs                 int                  not null/* 输血次数 */,
    sxrqsj               datetime             not null/* 输血日期时间 */,
    sxyy                 nvarchar(100)        not null/* 输血原因 */,
    ysbm                 varchar(20)          not null/* 医师工号 */,
    ysqm                 varchar(50)          not null/* 医师签名 */,
    qmrqsj               datetime             not null/* 签名日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_SXJL_JBZD     一般治疗处置记录 — 输血记录_疾病诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_SXJL_JBZD') )
 create table  DC_ZLCZJL_SXJL_JBZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    jbzdbm               varchar(64)          not null/* 疾病诊断编码 */,
    jbzd                 varchar(128)         not null/* 疾病诊断名称 */,
   
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_YBSSJL     一般治疗处置记录 －一般手术记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_YBSSJL') )
 create table  DC_ZLCZJL_YBSSJL (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    mjzh                 varchar(64)          not null/* 门（急）诊号 */,
    zyh                  varchar(64)          not null/* 住院号 */,
    jzlb                 varchar(2)           not null/* 就诊类别 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    dzsqsbh              varchar(20)          not null/* 电子申请单编号 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(64)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    xbdm                 varchar(2)           not null/* 患者性别代码 */,
    xbmc                 varchar(16)          not null/* 患者性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    sqzdbm               varchar(64)          not null/* 术前诊断编码 */,
    sqzdmc               varchar(128)         not null/* 术前诊断名称 */,
    shzdbm               varchar(64)          not null/* 术后诊断编码 */,
    shzdmc               varchar(128)         not null/* 术后诊断名称 */,
    ssmbbwdm             varchar(100)         null/* 手术目标部位代码 */,
    ssmbbw               varchar(500)         null/* 手术目标部位名称 */,
    jrwdm                varchar(100)         null/* 介入物代码 */,
    jrwmc                nvarchar(500)        null/* 介入物名称 */,
    sstw                 varchar(2)           null/* 手术体位代码 */,
    sstwmc               varchar(64)          null/* 手术体位名称 */,
    ssgc                 nvarchar(2000)       null/* 手术过程描述 */,
    sssbz                char(1)              null/* 手术史标志 */,
    pfxd                 nvarchar(200)        null/* 皮肤消毒描述 */,
    ssqk                 nvarchar(200)        null/* 手术切口描述 */,
    ylbz                 char(1)              null/* 引流标志 */,
    cxl                  numeric(5)           null/* 出血量（mL） */,
    syl                  numeric(5)           null/* 输液量（mL） */,
    sxl                  numeric(4)           null/* 输血量（mL） */,
    sqyydm               varchar(100)         null/* 术前用药代码 */,
    sqyy                 nvarchar(500)        null/* 术前用药 */,
    szyydm               varchar(100)         null/* 术中用药代码 */,
    szyy                 nvarchar(500)        null/* 术中用药 */,
    ylcldm               varchar(100)         null/* 引流材料代码 */,
    ylclmc               nvarchar(500)        null/* 引流材料名称 */,
    ylclsm               nvarchar(200)        null/* 引流材料数目 */,
    fzbwdm               varchar(64)          null/* 放置部位代码 */,
    fzbw                 varchar(128)         null/* 放置部位 */,
    sxfybz               char(1)              null/* 输血反应标志 */,
    sszbm                varchar(20)          not null/* 主刀医生工号 */,
    sszxm                varchar(50)          not null/* 主刀医生姓名 */,
    mzff                 varchar(2)           not null/* 麻醉方法代码 */,
    mzffmc               varchar(30)          not null/* 麻醉方法名称 */,
    mzysbm               varchar(20)          not null/* 麻醉医师工号 */,
    mzysxm               varchar(50)          not null/* 麻醉医师姓名 */,
    qmrqsj               datetime             not null/* 签名日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_YBSSJL_SQYY     一般治疗处置记录 －一般手术记录_术前用药                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_YBSSJL_SQYY') )
 create table  DC_ZLCZJL_YBSSJL_SQYY (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    sqyydm               varchar(100)         null/* 术前用药代码 */,
    sqyy                 nvarchar(500)        null/* 术前用药 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_YBSSJL_SSMX     一般治疗处置记录 －一般手术记录_手术明细                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_YBSSJL_SSMX') )
 create table  DC_ZLCZJL_YBSSJL_SSMX (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    ssjbh                varchar(20)          not null/* 手术间编号 */,
    ssksrq               datetime             not null/* 手术开始日期时间 */,
    ssjsrq               datetime             not null/* 手术结束日期时间 */,
    ssjczbm              varchar(64)          not null/* 手术及操作编码 */,
    ssmc                 varchar(128)         not null/* 手术名称 */,
    ssjbdm               varchar(2)           not null/* 手术级别代码 */,
    ssjbmc               varchar(18)          not null/* 手术级别名称 */,
    yzbm                 varchar(20)          not null/* Ⅰ助工号 */,
    yzxm                 varchar(50)          not null/* Ⅰ助姓名 */,
    ezbm                 varchar(20)          not null/* Ⅱ助工号 */,
    ezxm                 varchar(50)          not null/* Ⅱ助姓名 */,
    qxhsbm               varchar(20)          not null/* 器械护士工号 */,
    qxhsxm               varchar(50)          not null/* 器械护士姓名 */,
    xthsbm               varchar(20)          not null/* 巡台护士工号 */,
    xthsxm               varchar(50)          not null/* 巡台护士姓名 */,
    ssysbm               varchar(20)          not null/* 手术者工号 */,
    sszqm                varchar(50)          not null/* 手术者签名 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_YBSSJL_SZYY     一般治疗处置记录 －一般手术记录_术中用药                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_YBSSJL_SZYY') )
 create table  DC_ZLCZJL_YBSSJL_SZYY (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    szyydm               varchar(100)         null/* 术中用药代码 */,
    szyy                 nvarchar(500)        null/* 术中用药 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_ZLJL     治疗处置记录－治疗记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_ZLJL') )
 create table  DC_ZLCZJL_ZLJL (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    mjzh                 varchar(64)          not null/* 门（急）诊号 */,
    zyh                  varchar(64)          not null/* 住院号 */,
    jzlb                 varchar(2)           not null/* 就诊类别 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    dzsqdbh              varchar(20)          not null/* 电子申请单编号 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(64)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    xbdm                 varchar(2)           not null/* 患者性别代码 */,
    xbmc                 varchar(16)          not null/* 患者性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    tz                   numeric(6,2)         null/* 体重（kg） */,
    jbzdbm               varchar(64)          not null/* 疾病诊断编码 */,
    jbzd                 varchar(128)         not null/* 疾病诊断名称 */,
    cljzdyj              nvarchar(2000)       null/* 处理及指导意见 */,
    yczlczbz             char(1)              null/* 有创诊疗操作标志 */,
    gmsbz                char(1)              null/* 过敏史标志 */,
    gms                  nvarchar(1000)       null/* 过敏史 */,
    yzsybz               nvarchar(100)        null/* 医嘱使用备注 */,
    jhzlfa               nvarchar(1000)       null/* 今后治疗方案 */,
    sffsdm               varchar(2)           null/* 随访方式代码 */,
    sffsmc               varchar(18)          null/* 随访方式名称 */,
    sfrq                 date                 null/* 随访日期 */,
    sfzqjy               varchar(2)           null/* 随访周期建议代码 */,
    sfzqjymc             varchar(20)          null/* 随访周期建议名称 */,
    yzzxzdm              varchar(20)          not null/* 医嘱执行者工号 */,
    yzzxzqm              varchar(50)          not null/* 医嘱执行者签名 */,
    qmrq                 datetime             not null/* 签名日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_ZLJL_SSCZ     治疗处置记录－治疗记录_手术操作                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_ZLJL_SSCZ') )
 create table  DC_ZLCZJL_ZLJL_SSCZ (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    czbm                 varchar(64)          null/* 操作编码 */,
    czmc                 varchar(128)         null/* 操作名称 */,
    czmbbw               varchar(64)          null/* 操作目标部位代码 */,
    czmbbwmc             varchar(128)         null/* 操作目标部位名称 */,
    jrwdm                varchar(64)          null/* 介入物代码 */,
    jrwmc                sysname              null/* 介入物名称 */,
    czffms               nvarchar(2000)       null/* 操作方法描述 */,
    czcs                 int                  null/* 操作次数 */,
    czrq                 datetime             null/* 操作日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZLCZJL_ZLJL_YYMX     治疗处置记录－治疗记录_用药明细                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZLCZJL_ZLJL_YYMX') )
 create table  DC_ZLCZJL_ZLJL_YYMX (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    ywdm                 varchar(64)          null/* 药物代码 */,
    ywmc                 varchar(128)         null/* 药物名称 */,
    ywyf                 varchar(128)         null/* 药物用法 */,
    zysylb               varchar(2)           null/* 中药使用类别代码 */,
    zysylbmc             varchar(18)          null/* 中药使用类别名称 */,
    ywsypl               varchar(2)           null/* 药物使用频率 */,
    ywsyplmc             varchar(10)          null/* 药物使用频率名称 */,
    ywjxdm               varchar(2)           null/* 药物剂型代码 */,
    ywjx                 varchar(50)          null/* 药物剂型 */,
    ywsyjldw             varchar(6)           null/* 药物使用剂量单位 */,
    ywsycjl              numeric(5,2)         null/* 药物使用次剂量 */,
    ywsyzjl              numeric(12,2)        null/* 药物使用总剂量 */,
    ywsytj               varchar(3)           null/* 药物使用途径代码 */,
    ywsytjmc             varchar(20)          null/* 药物使用途径 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZQGZXX_BWZTZS     知情告知信息－病危（重）通知书                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZQGZXX_BWZTZS') )
 create table  DC_ZQGZXX_BWZTZS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    mjzh                 varchar(64)          not null/* 门（急）诊号 */,
    zyh                  varchar(64)          not null/* 住院号 */,
    jzlb                 varchar(2)           not null/* 就诊类别 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    tysbh                varchar(20)          not null/* 知情同意书编号 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病床号 */,
    bch                  varchar(10)          not null/* 病房号 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号码 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    bqgkjqjcs            nvarchar(2000)       not null/* 病情概括及主要抢救措施 */,
    tznr                 nvarchar(1000)       not null/* 病危（重）通知内容 */,
    tzrq                 datetime             not null/* 病危（重）通知日期时间 */,
    dlrqm                varchar(50)          null/* 法定代理人签名 */,
    dlrhzgxdm            varchar(2)           null/* 法定代理人与患者的关系代码 */,
    dlrhzgxmc            varchar(50)          null/* 法定代理人与患者的关系名称 */,
    dlrqmrq              datetime             null/* 法定代理人签名日期时间 */,
    ysbm                 varchar(20)          not null/* 医师工号 */,
    ysqm                 varchar(50)          not null/* 医师签名 */,
    ysqmrq               datetime             not null/* 医师签名日期时间 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZQGZXX_BWZTZS_JBZD     知情告知信息－病危（重）通知书_疾病诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZQGZXX_BWZTZS_JBZD') )
 create table  DC_ZQGZXX_BWZTZS_JBZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    jbzdbm               varchar(64)          not null/* 疾病诊断编码 */,
    jbzd                 varchar(128)         not null/* 疾病诊断名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZQGZXX_MZZQTYS     知情告知信息－麻醉知情同意书                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZQGZXX_MZZQTYS') )
 create table  DC_ZQGZXX_MZZQTYS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    mjzh                 varchar(64)          not null/* 门（急）诊号 */,
    zyh                  varchar(64)          not null/* 住院号 */,
    jzlb                 varchar(2)           not null/* 就诊类别 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    tysbh                varchar(20)          not null/* 知情同意书编号 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    nssbm                varchar(64)          null/* 拟实施手术及操作编码 */,
    nssczmc              varchar(128)         null/* 拟实施手术及操作名称 */,
    nssrq                datetime             null/* 拟实施手术及操作日期时间 */,
    nmzdm                varchar(2)           not null/* 拟实施麻醉方法代码 */,
    nmzffmc              varchar(30)          not null/* 拟实施麻醉方法名称 */,
    hzjcjb               nvarchar(500)        null/* 患者基础疾病 */,
    jcjbmzyx             nvarchar(1000)       null/* 基础疾病对麻醉可能产生的影响 */,
    nycjcff              nvarchar(2000)       null/* 拟行有创操作和监测方法 */,
    mzywbfz              nvarchar(1000)       null/* 麻醉中、麻醉后可能发生的意外及并发症 */,
    mzztb                char(1)              null/* 使用麻醉镇痛泵标志 */,
    mzaqbx               char(1)              null/* 参加麻醉安全保险标志 */,
    yljgyj               nvarchar(2000)       not null/* 医疗机构意见 */,
    hzdlryj              nvarchar(2000)       not null/* 患者/法定代理人意见 */,
    hzqm                 varchar(50)          not null/* 患者签名 */,
    dlrqm                varchar(50)          not null/* 法定代理人签名 */,
    dlrhzgxdm            varchar(20)          not null/* 法定代理人与患者的关系代码 */,
    dlrhzgxmc            varchar(50)          not null/* 法定代理人与患者的关系名称 */,
    hzdlrqmrq            datetime             not null/* 患者/法定代理人签名日期时间 */,
    mzysdm               varchar(20)          not null/* 麻醉医师工号 */,
    mzysqm               varchar(50)          not null/* 麻醉医师签名 */,
    mzysqmrq             datetime             not null/* 麻醉医师签名日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZQGZXX_MZZQTYS_SQZD     知情告知信息－麻醉知情同意书_术前诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZQGZXX_MZZQTYS_SQZD') )
 create table  DC_ZQGZXX_MZZQTYS_SQZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    sqzd                 varchar(64)          not null/* 术前诊断编码 */,
    sqzdmc               varchar(128)         not null/* 术前诊断名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZQGZXX_QTZQTYS     知情告知信息 — 其他知情同意书                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZQGZXX_QTZQTYS') )
 create table  DC_ZQGZXX_QTZQTYS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    mjzh                 varchar(18)          not null/* 门（急）诊号 */,
    zyh                  varchar(18)          not null/* 住院号 */,
    jzlb                 varchar(2)           not null/* 就诊类别 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    tysbh                varchar(20)          not null/* 知情同意书编号 */,
    tysmc                varchar(200)         not null/* 知情同意书名称 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    zqtynr               nvarchar(2000)       not null/* 知情同意内容 */,
    yljgyj               nvarchar(2000)       not null/* 医疗机构意见 */,
    dlryj                nvarchar(2000)       not null/* 患者/法定代理人意见 */,
    hzqm                 varchar(50)          not null/* 患者签名 */,
    dlrqm                varchar(50)          null/* 法定代理人签名 */,
    dlrhzgx              varchar(2)           null/* 法定代理人与患者的关系代码 */,
    dlrhzmc              varchar(50)          null/* 法定代理人与患者的关系名称 */,
    dlrqmrq              datetime             not null/* 患者/法定代理人签名日期时间 */,
    ysbm                 varchar(20)          not null/* 医师工号 */,
    ysqm                 varchar(50)          not null/* 医师签名 */,
    ysqmrq               datetime             not null/* 医师签名日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZQGZXX_QTZQTYS_JBZD     知情告知信息 — 其他知情同意书_疾病诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZQGZXX_QTZQTYS_JBZD') )
 create table  DC_ZQGZXX_QTZQTYS_JBZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    jbzdbm               varchar(64)          not null/* 疾病诊断编码 */,
    jbzd                 varchar(128)         not null/* 疾病诊断名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZQGZXX_SSTYS     知情告知信息－手术同意书                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZQGZXX_SSTYS') )
 create table  DC_ZQGZXX_SSTYS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    mjzh                 varchar(64)          not null/* 门（急）诊号 */,
    zyh                  varchar(64)          not null/* 住院号 */,
    jzlb                 varchar(2)           not null/* 就诊类别 */,
    zqtysbh              varchar(20)          not null/* 知情同意书编号 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bfmc                 varchar(50)          not null/* 病房名称 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    lxdh                 varchar(50)          not null/* 联系电话 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    ssywfx               nvarchar(200)        not null/* 手术中可能出现的意外及风险 */,
    ssywbfz              nvarchar(1000)       not null/* 手术后可能出现的意外及并发症 */,
    tdfa                 nvarchar(1000)       not null/* 替代方案 */,
    yljgyj               nvarchar(2000)       not null/* 医疗机构意见 */,
    hzdlryj              nvarchar(2000)       not null/* 患者/法定代理人意见 */,
    hzqm                 varchar(50)          not null/* 患者签名 */,
    dlrqm                varchar(50)          not null/* 法定代理人签名 */,
    dlrhzgxdm            varchar(2)           not null/* 法定代理人与患者的关系代码 */,
    dlrhzgxmc            varchar(50)          not null/* 法定代理人与患者的关系名称 */,
    dlrqmrq              datetime             not null/* 患者/法定代理人签名日期时间 */,
    jzysdm               varchar(20)          not null/* 经治医师工号 */,
    jzysqm               varchar(50)          not null/* 经治医师签名 */,
    zrysdm               varchar(50)          not null/* 责任医生工号 */,
    zrysxm               varchar(50)          not null/* 责任医生姓名 */,
    sszdm                varchar(20)          not null/* 手术者工号 */,
    sszqm                varchar(50)          not null/* 手术者签名 */,
    ysqmrq               datetime             not null/* 医师签名日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZQGZXX_SSTYS_NSSSS     知情告知信息－手术同意书_拟实施手术                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZQGZXX_SSTYS_NSSSS') )
 create table  DC_ZQGZXX_SSTYS_NSSSS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    nssbm                varchar(64)          not null/* 拟实施手术及操作编码 */,
    nssczmc              varchar(128)         not null/* 拟实施手术及操作名称 */,
    nssrq                datetime             not null/* 拟实施手术及操作日期时间 */,
    sszz                 nvarchar(500)        not null/* 手术指征 */,
    ssjjz                nvarchar(100)        not null/* 手术禁忌症 */,
    ssfs                 varchar(30)          not null/* 手术方式 */,
    nmzdm                varchar(2)           not null/* 拟实施麻醉方法代码 */,
    nmzffmc              varchar(30)          not null/* 拟实施麻醉方法名称 */,
    sqzb                 nvarchar(1000)       not null/* 术前准备 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZQGZXX_SSTYS_SQZD     知情告知信息－手术同意书_术前诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZQGZXX_SSTYS_SQZD') )
 create table  DC_ZQGZXX_SSTYS_SQZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    sqzd                 varchar(64)          not null/* 术前诊断编码 */,
    sqzdmc               varchar(128)         not null/* 术前诊断名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZQGZXX_SXZLTYS     知情告知信息－输血治疗同意书                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZQGZXX_SXZLTYS') )
 create table  DC_ZQGZXX_SXZLTYS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    mjzh                 varchar(64)          not null/* 门（急）诊号 */,
    zyh                  varchar(64)          not null/* 住院号 */,
    jzlb                 varchar(2)           not null/* 就诊类别 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    tysbh                varchar(20)          not null/* 知情同意书编号 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    sxsdm                char(1)              not null/* 输血史标识代码 */,
    sxzz                 nvarchar(500)        not null/* 输血指征 */,
    sxpzdm               varchar(2)           not null/* 输血品种代码 */,
    sxpzmc               varchar(50)          not null/* 输血品种名称 */,
    sxqjcjg              nvarchar(200)        not null/* 输血前有关检查项目及结果 */,
    sxfs                 varchar(50)          not null/* 输血方式 */,
    nsxrq                datetime             not null/* 拟定输血日期时间 */,
    sxblhg               nvarchar(500)        not null/* 输血风险及可能发生的不良后果 */,
    yljgyj               nvarchar(2000)       not null/* 医疗机构意见 */,
    hzdlryj              nvarchar(2000)       not null/* 患者/法定代理人意见 */,
    hzdlrqm              varchar(50)          not null/* 患者/法定代理人签名 */,
    dlrhzgxdm            varchar(50)          not null/* 法定代理人与患者的关系代码 */,
    dlrhzgxmc            varchar(50)          not null/* 法定代理人与患者的关系名称 */,
    hzdlrqmrq            datetime             not null/* 患者/法定代理人签名日期时间 */,
    ysbm                 varchar(20)          not null/* 医师工号 */,
    ysqm                 varchar(50)          not null/* 医师签名 */,
    ysqmrq               datetime             not null/* 医师签名日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZQGZXX_SXZLTYS_JBZD     知情告知信息－输血治疗同意书_疾病诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZQGZXX_SXZLTYS_JBZD') )
 create table  DC_ZQGZXX_SXZLTYS_JBZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    jbzdbm               varchar(64)          not null/* 疾病诊断编码 */,
    jbzd                 varchar(128)         not null/* 疾病诊断名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZQGZXX_SXZLTYS_SXS     知情告知信息－输血治疗同意书_输血史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZQGZXX_SXZLTYS_SXS') )
 create table  DC_ZQGZXX_SXZLTYS_SXS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    sxsmc                varchar(32)          not null/* 输血史 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZQGZXX_TSJCZLTYS     知情告知信息－特殊检查及特殊治疗同意书                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZQGZXX_TSJCZLTYS') )
 create table  DC_ZQGZXX_TSJCZLTYS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    mjzh                 varchar(10)          not null/* 门（急）诊号 */,
    zyh                  varchar(64)          not null/* 住院号 */,
    jzlb                 varchar(2)           not null/* 就诊类别 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    tysbh                varchar(20)          not null/* 知情同意书编号 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号码 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    jczlxmmc             varchar(100)         not null/* 特殊检查及特殊治疗项目名称 */,
    jczlmd               nvarchar(100)        not null/* 特殊检查及特殊治疗目的 */,
    jczlbfz              nvarchar(1000)       null/* 特殊检查及特殊治疗可能引起的并发症及风险 */,
    tdfa                 nvarchar(1000)       null/* 替代方案 */,
    hzdlrqm              varchar(50)          not null/* 患者/法定代理人签名 */,
    hzdlrgxdm            varchar(2)           not null/* 法定代理人与患者的关系代码 */,
    hzdlrgxmc            varchar(128)         not null/* 法定代理人与患者的关系名称 */,
    dlrqmrq              datetime             not null/* 患者/法定代理人签名日期时间 */,
    ysbm                 varchar(20)          not null/* 医生工号 */,
    ysqm                 varchar(50)          not null/* 医师签名 */,
    ysqmrq               datetime             not null/* 医师签名日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZQGZXX_TSJCZLTYS_JBZD     知情告知信息－特殊检查及特殊治疗同意书_疾病诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZQGZXX_TSJCZLTYS_JBZD') )
 create table  DC_ZQGZXX_TSJCZLTYS_JBZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    jbzdbm               varchar(64)          not null/* 疾病诊断编码 */,
    jbzd                 varchar(128)         not null/* 疾病诊断名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBA_BASY     病案首页－住院病案首页                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBA_BASY') )
 create table  DC_ZYBA_BASY (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    zyh                  varchar(64)          not null/* 住院号 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    yljgzzjgdm           varchar(10)          not null/* 住院机构标识 */,
    yljgzzjgmc           varchar(70)          not null/* 住院机构名称 */,
    ylfffsdm             varchar(2)           not null/* 医疗付费方式代码 */,
    ylfffsmc             varchar(50)          not null/* 医疗付费方式名称 */,
    jkkh                 varchar(18)          not null/* 健康卡号 */,
    zycs                 numeric(3)           not null/* 住院次数 */,
    bah                  varchar(18)          not null/* 病案号 */,
    xm                   varchar(50)          not null/* 姓名 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    csrq                 date                 not null/* 出生日期 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    gjdm                 varchar(3)           not null/* 国籍代码 */,
    gjmc                 varchar(64)          not null/* 国籍名称 */,
    xsecstzg             numeric(4)           null/* 新生儿出生体重（g） */,
    xserytzg             numeric(4)           null/* 新生儿入院体重（g） */,
    csd_s                varchar(70)          not null/* 出生地-省（自治区、直辖市） */,
    csd_cs               varchar(70)          not null/* 出生地-市（地区、州） */,
    csd_xq               varchar(70)          not null/* 出生地-县（区） */,
    jg_s                 varchar(70)          not null/* 籍贯省 */,
    jg_cs                varchar(70)          not null/* 籍贯城市 */,
    mzdm                 varchar(3)           not null/* 民族 */,
    mzmc                 varchar(50)          not null/* 民族名称 */,
    sfzjlbdm             varchar(2)           not null/* 身份证件类别代码 */,
    sfzjlbmc             varchar(50)          not null/* 身份证件类别名称 */,
    hzsfzjhm             varchar(18)          not null/* 患者身份证件号码 */,
    zylbdm               varchar(2)           null/* 职业类别代码 */,
    zylbmc               varchar(18)          null/* 职业类别名称 */,
    hyzkdm               varchar(2)           null/* 婚姻状况代码 */,
    hyzkmc               varchar(18)          null/* 婚姻状况名称 */,
    xzz_s                varchar(70)          not null/* 现住址-省（自治区、直辖市） */,
    xzz_cs               varchar(70)          not null/* 现住址-市（地区、州） */,
    xzz_xq               varchar(70)          not null/* 现住址-县（区） */,
    xzz_jd               varchar(70)          not null/* 现住址-乡（镇、街道办事处） */,
    xzz_xz               varchar(70)          not null/* 现住址-村（街、路、弄等） */,
    xzz_mphm             varchar(70)          not null/* 现住址-门牌号码 */,
    dhhm                 varchar(20)          not null/* 电话号码 */,
    xzz_yzbm             numeric(6)           not null/* 现住址-邮政编码 */,
    hkdz_s               varchar(70)          not null/* 户口地址-省（自治区、直辖市） */,
    hkdz_cs              varchar(70)          not null/* 户口地址-市（地区、州） */,
    hkdz_xq              varchar(70)          not null/* 户口地址-县（区） */,
    hkdz_xz              varchar(70)          not null/* 户口地址-乡（镇、街道办事处） */,
    hkdz_c               varchar(70)          not null/* 户口地址-村（街、路、弄等） */,
    hkdz_mphm            varchar(70)          not null/* 户口地址-门牌号码 */,
    hkdz_yzbm            numeric(6)           not null/* 户口地址-邮政编码 */,
    gzdwmc               varchar(70)          not null/* 工作单位名称 */,
    gzdwdz_s             varchar(70)          not null/* 工作单位地址-省（自治区、直辖市） */,
    gzdwdz_cs            varchar(70)          not null/* 工作单位地址-市（地区、州） */,
    gzdwdz_xq            varchar(70)          not null/* 工作单位地址-县（区） */,
    gzdwdz_xz            varchar(70)          not null/* 工作单位地址-乡（镇、街道办事处） */,
    gzdwdz_c             varchar(70)          not null/* 工作单位地址-村（街、路、弄等） */,
    gzdwdz_mphm          varchar(70)          not null/* 工作单位地址-门牌号码 */,
    gzdwdhhm             varchar(20)          not null/* 工作单位电话号码 */,
    gzdwdz_yzbm          numeric(6)           not null/* 工作单位地址-邮政编码 */,
    lxrxm                varchar(50)          not null/* 联系人姓名 */,
    lxryhzdgxdm          varchar(2)           not null/* 联系人与患者的关系代码 */,
    lxryhzdgxmc          varchar(50)          not null/* 联系人与患者的关系名称 */,
    lxrdz_s              varchar(70)          not null/* 联系人地址-省（自治区、直辖市） */,
    lxrdz_cs             varchar(70)          not null/* 联系人地址-市（地区、州） */,
    lxrdz_xq             varchar(70)          not null/* 联系人地址-县（区） */,
    lxrdz_xz             varchar(70)          not null/* 联系人地址-乡（镇、街道办事处） */,
    lxrdz_c              varchar(70)          not null/* 联系人地址-村（街、路、弄等） */,
    lxrdz_mphm           varchar(70)          not null/* 联系人地址-门牌号码 */,
    lxrdhhm              varchar(20)          not null/* 联系人电话号码 */,
    rytjdm               varchar(2)           not null/* 入院途径代码 */,
    rytjmc               varchar(20)          not null/* 入院途径名称 */,
    ryrqsj               datetime             not null/* 入院日期时间 */,
    rykbdm               varchar(11)          not null/* 入院科别代码 */,
    rykbmc               varchar(50)          not null/* 入院科别 */,
    rybf                 varchar(10)          not null/* 入院病房 */,
    zkkb                 varchar(50)          null/* 转科科别 */,
    cyrqsj               datetime             not null/* 出院日期时间 */,
    cykbdm               varchar(10)          not null/* 出院科别代码 */,
    cykbmc               varchar(50)          not null/* 出院科别 */,
    cybf                 varchar(10)          not null/* 出院病房 */,
    sjzyts               numeric(4)           not null/* 实际住院天数 */,
    sszddwbyyjbbm        varchar(64)          not null/* 损伤中毒的外部原因疾病编码 */,
    sszddwbyyjbmc        varchar(128)         not null/* 损伤中毒的外部原因疾病名称 */,
    swhzsjbz             char(1)              null/* 死亡患者尸检标志 */,
    aboxxdm              varchar(2)           not null/* ABO血型代码 */,
    aboxxmc              varchar(18)          not null/* ABO血型名称 */,
    rhxxdm               varchar(2)           not null/* Rh血型代码 */,
    rhxxmc               varchar(18)          not null/* Rh血型名称 */,
    kzrdm                varchar(20)          not null/* 科主任工号 */,
    kzrqm                varchar(50)          not null/* 科主任签名 */,
    zrfzrysqm            varchar(50)          not null/* 主任（副主任）医师签名 */,
    zzysdm               varchar(20)          not null/* 主治医师工号 */,
    zzysqm               varchar(50)          not null/* 主治医师签名 */,
    zyysdm               varchar(20)          not null/* 住院医师工号 */,
    zyysqm               varchar(50)          not null/* 住院医师签名 */,
    zrhsdm               varchar(20)          not null/* 责任护士工号 */,
    zrhsqm               varchar(50)          not null/* 责任护士签名 */,
    jxysdm               varchar(20)          not null/* 进修医师工号 */,
    jxysqm               varchar(50)          not null/* 进修医师签名 */,
    sxysdm               varchar(20)          not null/* 实习医师工号 */,
    sxysqm               varchar(50)          not null/* 实习医师签名 */,
    bydm                 varchar(20)          not null/* 编码员工号 */,
    bym                  varchar(50)          not null/* 编码员签名 */,
    bazldm               varchar(2)           not null/* 病案质量代码 */,
    bazlmc               varchar(100)         not null/* 病案质量名称 */,
    zkysdm               varchar(20)          not null/* 质控医师工号 */,
    zkysqm               varchar(50)          not null/* 质控医师签名 */,
    zkhsdm               varchar(20)          not null/* 质控护士工号 */,
    zkhsqm               varchar(50)          not null/* 质控护士签名 */,
    zkrq                 date                 not null/* 质控日期 */,
    lyfsdm               varchar(2)           not null/* 离院方式代码 */,
    lyfsmc               varchar(100)         not null/* 离院方式名称 */,
    njsyljgdm            varchar(20)          not null/* 拟接收医疗机构代码 */,
    njsyljgmc            varchar(70)          not null/* 拟接收医疗机构名称 */,
    cy31dnzzybz          char(1)              not null/* 出院31d内再住院标志 */,
    cy31dnzzymd          varchar(100)         null/* 出院31d内再住院目的 */,
    lnsshzryqhmsj_d      numeric(5)           not null/* 颅脑损伤患者入院前昏迷时间-d */,
    lnsshzryqhmsj_h      numeric(2)           not null/* 颅脑损伤患者入院前昏迷时间-h */,
    lnsshzryqhmsj_min    numeric(2)           not null/* 颅脑损伤患者入院前昏迷时间-min */,
    lnsshzryhhmsj_d      numeric(5)           not null/* 颅脑损伤患者入院后昏迷时间-d */,
    lnsshzryhhmsj_h      numeric(2)           not null/* 颅脑损伤患者入院后昏迷时间-h */,
    lnsshzryhhmsj_min    numeric(2)           not null/* 颅脑损伤患者入院后昏迷时间-min */,
    zyzfy                numeric(10,2)        not null/* 住院总费用 */,
    zyzfy_zfje           numeric(10,2)        not null/* 住院总费用-自付金额 */,
    zhylfwl_ybylfwf      numeric(10,2)        not null/* 综合医疗服务类-一般医疗服务费 */,
    zhylfwl_ybzlczf      numeric(10,2)        not null/* 综合医疗服务类-一般治疗操作费 */,
    zhylfwl_hlf          numeric(10,2)        not null/* 综合医疗服务类-护理费 */,
    zhylfwl_qtfy         numeric(10,2)        not null/* 综合医疗服务类-其他费用 */,
    zdl_blzdf            numeric(10,2)        not null/* 诊断类-病理诊断费 */,
    zdl_syszdf           numeric(10,2)        not null/* 诊断类-实验室诊断费 */,
    zdl_yxxzdf           numeric(10,2)        not null/* 诊断类-影像学诊断费 */,
    zdl_lczdxmf          numeric(10,2)        not null/* 诊断类-临床诊断项目费 */,
    zll_fsszlxmf         numeric(10,2)        not null/* 治疗类-非手术治疗项目费 */,
    zll_fsszlxmf_lcwlzlf numeric(10,2)        not null/* 治疗类-非手术治疗项目费-临床物理治疗费 */,
    zll_sszlf            numeric(10,2)        not null/* 治疗类-手术治疗费 */,
    zll_sszlf_mzf        numeric(10,2)        not null/* 治疗类-手术治疗费-麻醉费 */,
    zll_sszlf_ssf        numeric(10,2)        not null/* 治疗类-手术治疗费-手术费 */,
    kfl_kff              numeric(10,2)        not null/* 康复类-康复费 */,
    zyl_zyzlf            numeric(10,2)        not null/* 中医类-中医治疗费 */,
    xyl_xyf              numeric(10,2)        not null/* 西药类-西药费 */,
    xyl_xyf_kjywfy       numeric(10,2)        not null/* 西药类-西药费-抗菌药物费用 */,
    zyl_zchenyf          numeric(10,2)        not null/* 中药类-中成药费 */,
    zyl_zcyf             numeric(10,2)        not null/* 中药类-中草药费 */,
    xyhxyzpl_xf          numeric(10,2)        not null/* 血液和血液制品类-血费 */,
    xyhxyzpl_bdblzpf     numeric(10,2)        not null/* 血液和血液制品类-白蛋白类制品费 */,
    xyhxyzpl_qdblzpf     numeric(10,2)        not null/* 血液和血液制品类-球蛋白类制品费 */,
    xyhxyzpl_nxyzlzpf    numeric(10,2)        not null/* 血液和血液制品类-凝血因子类制品费 */,
    xyhxyzpl_xbyzlzpf    numeric(10,2)        not null/* 血液和血液制品类-细胞因子类制品费 */,
    hcl_jcyycxyyclf      numeric(10,2)        not null/* 耗材类-检查用一次性医用材料费 */,
    hcl_zlyycxyyclf      numeric(10,2)        not null/* 耗材类-治疗用一次性医用材料费 */,
    hcl_ssyycxyyclf      numeric(10,2)        not null/* 耗材类-手术用一次性医用材料费 */,
    qtl_qtf              numeric(10,2)        not null/* 其他类-其他费 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBA_BASY_BLZD     病案首页－住院病案首页_病理诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBA_BASY_BLZD') )
 create table  DC_ZYBA_BASY_BLZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    blhm                 varchar(18)          not null/* 病理号 */,
    blzdmc               varchar(128)         not null/* 病理诊断名称 */,
    blzdjbbm             varchar(64)          not null/* 病理诊断疾病编码 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBA_BASY_CYQTZD     病案首页－住院病案首页_出院其他诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBA_BASY_CYQTZD') )
 create table  DC_ZYBA_BASY_CYQTZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    cyzd_qtzdmc          varchar(128)         not null/* 出院诊断-其他诊断名称 */,
    cyzd_qtzdjbbm        varchar(64)          not null/* 出院诊断-其他诊断疾病编码 */,
    cyzd_qtzdrybqdm      varchar(64)          not null/* 出院诊断-其他诊断入院病情代码 */,
    cyzd_qtzdrybqmc      varchar(128)         not null/* 出院诊断-其他诊断入院病情名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBA_BASY_CYZYZD     病案首页－住院病案首页_出院主要诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBA_BASY_CYZYZD') )
 create table  DC_ZYBA_BASY_CYZYZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    cyzd_zyzdmc          varchar(128)         not null/* 出院诊断-主要诊断名称 */,
    cyzd_zyzdjbbm        varchar(64)          not null/* 出院诊断-主要诊断疾病编码 */,
    cyzd_zyzdrybqdm      varchar(64)          not null/* 出院诊断-主要诊断入院病情代码 */,
    cyzd_zyzdrybqmc      varchar(128)         not null/* 出院诊断-主要诊断入院病情名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBA_BASY_GMS     病案首页－住院病案首页_过敏史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBA_BASY_GMS') )
 create table  DC_ZYBA_BASY_GMS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    ywgmbz               char(1)              null/* 药物过敏标志 */,
    gmyw                 varchar(1000)        null/* 过敏药物 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBA_BASY_MJZD     病案首页－住院病案首页_门急诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBA_BASY_MJZD') )
 create table  DC_ZYBA_BASY_MJZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    mjzzdmc              varchar(128)         not null/* 门（急）诊诊断名称 */,
    mjzzdjbbm            varchar(64)          not null/* 门（急）诊诊断疾病编码 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBA_BASY_SS     病案首页－住院病案首页_手术                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBA_BASY_SS') )
 create table  DC_ZYBA_BASY_SS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    ssjczbm              varchar(64)          null/* 手术及操作编码 */,
    ssjczrq              datetime             null/* 手术及操作日期 */,
    ssjbdm               varchar(2)           null/* 手术级别代码 */,
    ssjbmc               varchar(50)          null/* 手术级别名称 */,
    ssjczmc              varchar(128)         null/* 手术及操作名称 */,
    sszdm                varchar(20)          null/* 手术者工号 */,
    sszxm                varchar(50)          null/* 手术者姓名 */,
    yzdm                 varchar(20)          null/* Ⅰ助工号 */,
    yzxm                 varchar(50)          null/* Ⅰ助姓名 */,
    ezdm                 varchar(20)          null/* Ⅱ助工号 */,
    ezxm                 varchar(50)          null/* Ⅱ助姓名 */,
    ssqklbdm             varchar(2)           null/* 手术切口类别代码 */,
    ssqklbmc             varchar(100)         null/* 手术切口类别名称 */,
    qkyhdjdm             varchar(2)           null/* 切口愈合等级代码 */,
    qkyhdjmc             varchar(100)         null/* 切口愈合等级名称 */,
    mzfsdm               varchar(2)           null/* 麻醉方式代码 */,
    mzfsmc               varchar(50)          null/* 麻醉方式名称 */,
    mzysdm               varchar(20)          null/* 麻醉医师工号 */,
    mzysxm               varchar(50)          null/* 麻醉医师姓名 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_CYJL     住院病程记录－出院记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_CYJL') )
 create table  DC_ZYBCJL_CYJL (    
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
    sfzhm                varchar(18)          not null/* 患者身份证号标识 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    ryrq                 datetime             not null/* 入院日期时间 */,
    ryqk                 nvarchar(2000)       not null/* 入院情况 */,
    zyszjcjg             nvarchar(1000)       null/* 中医“四诊”观察结果 */,
    zfbm                 varchar(20)          null/* 治则治法编码 */,
    zzzf                 nvarchar(100)        null/* 治则治法名称 */,
    zlgcms               nvarchar(2000)       not null/* 诊疗过程描述 */,
    zyjzff               nvarchar(100)        null/* 中药煎煮方法 */,
    zyyyff               nvarchar(100)        null/* 中药用药方法 */,
    cyqk                 nvarchar(2000)       not null/* 出院情况 */,
    cyrq                 datetime             not null/* 出院日期时间 */,
    cyzztz               nvarchar(1000)       not null/* 出院时症状与体征 */,
    czzyzhmc             varchar(128)         null/* 出院诊断-中医证候名称 */,
    czzyzhdm             varchar(64)          null/* 出院诊断-中医证候代码 */,
    cyyz                 nvarchar(1000)       not null/* 出院医嘱 */,
    zyysbm               varchar(20)          not null/* 住院医师工号 */,
    zyysqm               varchar(50)          not null/* 住院医师签名 */,
    zzysbm               varchar(20)          not null/* 主治医师工号 */,
    zzysqm               varchar(50)          not null/* 主治医师签名 */,
    zrysbm               varchar(20)          not null/* 主任医师工号 */,
    zrysqm               varchar(50)          not null/* 主任医师签名 */,
    qmrq                 datetime             not null/* 签名日期时间 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_CYJL_CYXYZD     住院病程记录－出院记录_出院西医诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_CYJL_CYXYZD') )
 create table  DC_ZYBCJL_CYJL_CYXYZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    czxyzdmc             varchar(128)         not null/* 出院诊断-西医诊断名称 */,
    czxyzdbm             varchar(64)          not null/* 出院诊断-西医诊断编码 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_CYJL_CYZYZD     住院病程记录－出院记录_出院中医诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_CYJL_CYZYZD') )
 create table  DC_ZYBCJL_CYJL_CYZYZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    czzybmmc             varchar(128)         null/* 出院诊断-中医病名名称 */,
    czzybmdm             varchar(64)          null/* 出院诊断-中医病名代码 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_CYJL_RYXYZD     住院病程记录－出院记录_入院西医诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_CYJL_RYXYZD') )
 create table  DC_ZYBCJL_CYJL_RYXYZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    ryzdbm               varchar(64)          not null/* 入院诊断编码 */,
    ryzdmc               varchar(128)         not null/* 入院诊断名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_CYJL_RYZD_FZJC     住院病程记录－出院记录_辅助检查                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_CYJL_RYZD_FZJC') )
 create table  DC_ZYBCJL_CYJL_RYZD_FZJC (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    yxfzjcjg             nvarchar(1000)       null/* 阳性辅助检查结果 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_HZJL     住院病程记录－会诊记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_HZJL') )
 create table  DC_ZYBCJL_HZJL (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    zyh                  varchar(64)          not null/* 住院号标识 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    dzsqdbh              varchar(20)          null/* 电子申请单编号 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bfmc                 varchar(50)          not null/* 病房名称 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 患者身份证号标识 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    blgy                 nvarchar(200)        not null/* 病历摘要 */,
    fzjcjg               nvarchar(1000)       null/* 辅助检查结果 */,
    zyszgcjg             nvarchar(1000)       null/* 中医“四诊”观察结果 */,
    zfbm                 varchar(20)          null/* 治则治法编码 */,
    zzzf                 nvarchar(100)        null/* 治则治法名称 */,
    zlgcmc               nvarchar(1000)       not null/* 诊疗过程名称 */,
    zlgcms               nvarchar(2000)       not null/* 诊疗过程描述 */,
    hzlx                 varchar(50)          not null/* 会诊类型 */,
    hzyy                 nvarchar(200)        not null/* 会诊原因 */,
    hzmd                 nvarchar(50)         not null/* 会诊目的 */,
    hzsqysdm             varchar(20)          not null/* 会诊申请医师工号 */,
    hzsqysqm             varchar(50)          not null/* 会诊申请医师签名 */,
    hzsqksdm             varchar(10)          not null/* 会诊申请科室代码 */,
    hzsqks               varchar(50)          not null/* 会诊申请科室 */,
    hzsqyljgdm           varchar(10)          not null/* 会诊申请医疗机构代码 */,
    hzsqyljgmc           varchar(70)          not null/* 会诊申请医疗机构名称 */,
    hzyj                 nvarchar(2000)       not null/* 会诊意见 */,
    hzysbm               varchar(20)          not null/* 会诊医师工号 */,
    hzysqm               varchar(50)          not null/* 会诊医师签名 */,
    hzksdm               varchar(10)          not null/* 会诊科室代码 */,
    hzksmc               varchar(50)          not null/* 会诊科室名称 */,
    hzyljgdm             varchar(10)          not null/* 会诊医师所在医疗机构代码 */,
    hzysyljgmc           varchar(70)          not null/* 会诊医师所在医疗机构名称 */,
    hzszyljgdm           varchar(10)          not null/* 会诊所在医疗机构代码 */,
    hzszyljgmc           varchar(70)          not null/* 会诊所在医疗机构名称 */,
    hzrq                 datetime             not null/* 会诊日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_HZJL_XYZD     住院病程记录－会诊记录_西医诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_HZJL_XYZD') )
 create table  DC_ZYBCJL_HZJL_XYZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    xyzdmc               varchar(128)         not null/* 西医诊断名称 */,
    xyzdbm               varchar(64)          not null/* 西医诊断编码 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_HZJL_ZYBM     住院病程记录－会诊记录_中医病名                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_HZJL_ZYBM') )
 create table  DC_ZYBCJL_HZJL_ZYBM (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    zybmmc               varchar(128)         null/* 中医病名名称 */,
    zybmdm               varchar(64)          null/* 中医病名代码 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_HZJL_ZYZH     住院病程记录－会诊记录_中医证候                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_HZJL_ZYZH') )
 create table  DC_ZYBCJL_HZJL_ZYZH (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    zyzhmc               varchar(128)         null/* 中医证候名称 */,
    zyzhdm               varchar(64)          null/* 中医证候代码 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_JDXJ     住院病程记录－阶段小结                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_JDXJ') )
 create table  DC_ZYBCJL_JDXJ (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    zyh                  varchar(18)          not null/* 住院号标识 */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bfmc                 varchar(10)          not null/* 入院病房名称 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 患者身份证号标识 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    csrq                 date                 null/* 患者出生日期 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    ryrq                 datetime             not null/* 入院日期时间 */,
    xjrq                 datetime             not null/* 小结日期时间 */,
    zs                   nvarchar(100)        not null/* 主诉 */,
    ryqk                 nvarchar(2000)       not null/* 入院情况 */,
    zyszgcjg             nvarchar(1000)       null/* 中医“四诊”观察结果 */,
    rzxyzdbm             varchar(64)          not null/* 入院诊断-西医诊断编码 */,
    rzxyzd               varchar(128)         not null/* 入院诊断-西医诊断名称 */,
    rzzybmdm             varchar(64)          null/* 入院诊断-中医病名代码 */,
    rzzybm               varchar(128)         null/* 入院诊断-中医病名名称 */,
    rzzyzhdm             varchar(64)          null/* 入院诊断-中医证候代码 */,
    rzzyzh               varchar(128)         null/* 入院诊断-中医证候名称 */,
    zfbm                 varchar(20)          null/* 治则治法编码 */,
    zzzf                 nvarchar(100)        null/* 治则治法名称 */,
    zyjzff               nvarchar(100)        null/* 中药煎煮方法 */,
    zyyyff               nvarchar(100)        null/* 中药用药方法 */,
    yznr                 nvarchar(1000)       null/* 医嘱内容 */,
    zlgcms               nvarchar(2000)       null/* 诊疗过程描述 */,
    mqqk                 nvarchar(2000)       not null/* 目前情况 */,
    mqzdxyzdbm           varchar(64)          not null/* 目前诊断-西医诊断编码 */,
    mqzdxyzd             varchar(128)         not null/* 目前诊断-西医诊断名称 */,
    mqzdzybmdm           varchar(64)          null/* 目前诊断-中医病名代码 */,
    mqzdzybm             varchar(128)         null/* 目前诊断-中医病名名称 */,
    mqzdzyzhdm           varchar(64)          null/* 目前诊断-中医证候代码 */,
    mqzdzyzh             varchar(128)         null/* 目前诊断-中医证候名称 */,
    jhzlfa               nvarchar(1000)       not null/* 今后治疗方案 */,
    ysbm                 varchar(20)          not null/* 签名人工号 */,
    ysqm                 varchar(50)          not null/* 签名人姓名 */,
    qmrq                 datetime             not null/* 签名日期时间 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_JJBJL     住院病程记录－交接班记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_JJBJL') )
 create table  DC_ZYBCJL_JJBJL (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    zyh                  varchar(18)          not null/* 住院号标识 */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bfmc                 varchar(10)          not null/* 病房名称 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 患者身份证号标识 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    ryrq                 datetime             not null/* 入院日期时间 */,
    zs                   nvarchar(100)        not null/* 主诉 */,
    ryqk                 nvarchar(2000)       not null/* 入院情况 */,
    zyszgcjg             nvarchar(1000)       null/* 中医“四诊”观察结果 */,
    rzxyzdbm             varchar(64)          not null/* 入院诊断-西医诊断编码 */,
    rzxyzd               varchar(128)         not null/* 入院诊断-西医诊断名称 */,
    rzzybmdm             varchar(64)          null/* 入院诊断-中医病名代码 */,
    rzzybm               varchar(128)         null/* 入院诊断-中医病名名称 */,
    rzzyzhdm             varchar(64)          null/* 入院诊断-中医证候代码 */,
    rzzyzh               varchar(128)         null/* 入院诊断-中医证候名称 */,
    zfbm                 varchar(20)          null/* 治则治法编码 */,
    zzzf                 nvarchar(100)        null/* 治则治法名称 */,
    zlgcms               nvarchar(2000)       null/* 诊疗过程描述 */,
    mqqk                 nvarchar(2000)       not null/* 目前情况 */,
    mqzdxyzdbm           varchar(64)          not null/* 目前诊断-西医诊断编码 */,
    mqzdxyzd             varchar(128)         not null/* 目前诊断-西医诊断名称 */,
    mqzdzybmdm           varchar(64)          null/* 目前诊断-中医病名代码 */,
    mqzdzybm             varchar(128)         null/* 目前诊断-中医病名名称 */,
    mqzdzyzhdm           varchar(64)          null/* 目前诊断-中医证候代码 */,
    mqzdzyzh             varchar(128)         null/* 目前诊断-中医证候名称 */,
    zysx                 nvarchar(1000)       not null/* 注意事项 */,
    jbzljh               nvarchar(2000)       not null/* 接班诊疗计划 */,
    jbrq                 datetime             not null/* 交班日期时间 */,
    jbysbm               varchar(20)          not null/* 交班医生工号 */,
    jbzqm                varchar(50)          not null/* 交班医生签名 */,
    jbsj                 datetime             not null/* 接班日期时间 */,
    ysbm                 varchar(20)          not null/* 医生工号 */,
    ysxm                 varchar(20)          not null/* 医生姓名 */,
    jbrdm                varchar(20)          not null/* 接班者工号 */,
    jbrqm                varchar(50)          not null/* 接班者签名 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_QJJL     住院病程记录－抢救记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_QJJL') )
 create table  DC_ZYBCJL_QJJL (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    zyh                  varchar(18)          not null/* 住院号标识 */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bfmc                 varchar(10)          not null/* 病房名称 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 患者身份证号标识 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    bqbhqk               nvarchar(1000)       not null/* 病情变化情况 */,
    qjcs                 nvarchar(1000)       not null/* 抢救措施 */,
    qjksrq               datetime             not null/* 抢救开始日期时间 */,
    qjjsrq               datetime             not null/* 抢救结束日期时间 */,
    zysx                 nvarchar(1000)       null/* 注意事项 */,
    cjtlrymd             varchar(100)         not null/* 参加讨论人员名单 */,
    cjqjrydm             varchar(100)         null/* 参加抢救人员代码 */,
    cjqjrymd             varchar(500)         null/* 参加抢救人员名单 */,
    zyzwlbdm             varchar(4)           null/* 专业技术职务类别代码 */,
    zyzwlbmc             varchar(50)          null/* 专业技术职务类别名称 */,
    ysbm                 varchar(20)          not null/* 签名人工号 */,
    ysqm                 varchar(50)          not null/* 签名人姓名 */,
    qmrq                 datetime             not null/* 签名日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_QJJL_JBZD     住院病程记录－抢救记录_疾病诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_QJJL_JBZD') )
 create table  DC_ZYBCJL_QJJL_JBZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    jbzdmc               varchar(500)         not null/* 疾病诊断名称 */,
    jbzdbm               varchar(100)         not null/* 疾病诊断编码 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_QJJL_JCJY     住院病程记录－抢救记录_检查/检验                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_QJJL_JCJY') )
 create table  DC_ZYBCJL_QJJL_JCJY (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    jcjyxmmc             varchar(500)         null/* 检查/检验项目名称 */,
    jcjyjg               nvarchar(1000)       null/* 检查/检验结果 */,
    jcjyjgdm             varchar(2)           null/* 检查/检验结果代码 */,
    jcjydljg             numeric(14,4)        null/* 检查/检验定量结果 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_QJJL_SSCZ     住院病程记录－抢救记录_手术操作                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_QJJL_SSCZ') )
 create table  DC_ZYBCJL_QJJL_SSCZ (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    ssczbm               varchar(64)          not null/* 手术及操作编码 */,
    ssczmc               varchar(128)         not null/* 手术及操作名称 */,
    ssczbwdm             varchar(64)          not null/* 手术及操作目标部位代码 */,
    ssczbwmc             varchar(128)         not null/* 手术及操作目标部位名称 */,
    jrwdm                varchar(64)          null/* 介入物代码 */,
    jrwmc                varchar(128)         null/* 介入物名称 */,
    czff                 nvarchar(2000)       not null/* 操作方法 */,
    czcs                 numeric(3)           not null/* 操作次数 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_RCBCJL     住院病程记录－日常病程记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_RCBCJL') )
 create table  DC_ZYBCJL_RCBCJL (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    zyh                  varchar(64)          not null/* 住院号标识 */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfmc                 varchar(10)          not null/* 病房名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    jlrq                 datetime             not null/* 记录日期时间 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 患者身份证号标识 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别说明 */,
    csrq                 date                 not null/* 患者出生日期 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    zybc                 nvarchar(2000)       not null/* 住院病程 */,
    yznr                 nvarchar(1000)       null/* 医嘱内容 */,
    zyjzff               nvarchar(100)        null/* 中药煎煮方法 */,
    zyyyff               nvarchar(100)        null/* 中药用药方法 */,
    bzlzms               nvarchar(1000)       null/* 辨证论治详细描述 */,
    zyzwlbdm             varchar(2)           null/* 专业技术职务类别代码 */,
    zyzwlbmc             varchar(20)          null/* 专业技术职务类别名称 */,
    ysbm                 varchar(20)          not null/* 医生工号 */,
    ysqm                 varchar(50)          not null/* 医生姓名 */,
    qmrq                 datetime             not null/* 签名日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_RCBCJL_ZYSZGCJG     住院病程记录－日常病程记录_中医四诊观察结果                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_RCBCJL_ZYSZGCJG') )
 create table  DC_ZYBCJL_RCBCJL_ZYSZGCJG (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    zyszgcjg             nvarchar(1000)       null/* 中医“四诊”观察结果 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_SCBCJL     住院病程记录－首次病程记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_SCBCJL') )
 create table  DC_ZYBCJL_SCBCJL (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    zyh                  varchar(64)          not null/* 住院号 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    ksdm                 varchar(10)          not null/* 住院患者入院科室代码 */,
    ksmc                 varchar(50)          not null/* 住院患者入院科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 入院病房号 */,
    bfmc                 varchar(50)          not null/* 入院病房名称 */,
    bch                  varchar(10)          not null/* 病床号 */,
    jlrq                 datetime             not null/* 记录日期时间 */,
    hzxm                 varchar(64)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 身份证号 */,
    xbdm                 varchar(2)           not null/* 患者性别代码 */,
    xbmc                 varchar(16)          not null/* 患者性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    zs                   nvarchar(100)        not null/* 主诉 */,
    bltd                 nvarchar(2000)       not null/* 病例特点 */,
    zyszgcjg             nvarchar(1000)       null/* 中医“四诊”观察结果 */,
    zdyjdm               nvarchar(100)        null/* 诊断依据代码 */,
    zdyj                 nvarchar(1000)       not null/* 诊断依据 */,
    czxyzdbm             varchar(64)          not null/* 初步诊断-西医诊断编码 */,
    czxyzd               varchar(128)         not null/* 初步诊断-西医诊断名称 */,
    czzybmdm             varchar(64)          null/* 初步诊断-中医病名代码 */,
    czzybm               varchar(128)         null/* 初步诊断-中医病名名称 */,
    czzyzhdm             varchar(64)          null/* 初步诊断-中医证候代码 */,
    czzyzh               varchar(128)         null/* 初步诊断-中医证候名称 */,
    jzxyzdbm             varchar(64)          not null/* 鉴别诊断-西医诊断编码 */,
    jzxyzdmc             varchar(128)         not null/* 鉴别诊断-西医诊断名称 */,
    jzzybmdm             varchar(64)          null/* 鉴别诊断-中医病名编码 */,
    jzzybmmc             varchar(128)         null/* 鉴别诊断-中医病名名称 */,
    jzzyzhbm             varchar(64)          null/* 鉴别诊断-中医证候编码 */,
    jzzyzhmc             varchar(128)         null/* 鉴别诊断-中医证候名称 */,
    zljh                 nvarchar(2000)       not null/* 诊疗计划 */,
    zfbm                 varchar(20)          null/* 治则治法代码 */,
    zzzf                 nvarchar(100)        null/* 治则治法 */,
    zyysbm               varchar(20)          not null/* 住院医师工号 */,
    zyysqm               varchar(50)          not null/* 住院医师签名 */,
    sjysbm               varchar(20)          not null/* 上级医师工号 */,
    sjysqm               varchar(50)          not null/* 上级医师签名 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_SHSCBCJL     住院病程记录－术后首次病程记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_SHSCBCJL') )
 create table  DC_ZYBCJL_SHSCBCJL (    
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
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_SHSCBCJL_SHZD     住院病程记录－术后首次病程记录_术后诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_SHSCBCJL_SHZD') )
 create table  DC_ZYBCJL_SHSCBCJL_SHZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    shzdmc               varchar(128)         not null/* 术后诊断名称 */,
    shzdbm               varchar(64)          not null/* 术后诊断编码 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_SJYSCFJL     住院病程记录－上级医师查房记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_SJYSCFJL') )
 create table  DC_ZYBCJL_SJYSCFJL (    
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
    bfmc                 varchar(64)          not null/* 病房名称 */,
    bch                  varchar(10)          not null/* 病床号 */,
    cfrq                 datetime             not null/* 查房日期时间 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 患者身份证号标识 */,
    csrq                 date                 not null/* 出生日期 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别说明 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    cfjl                 nvarchar(2000)       not null/* 查房记录 */,
    bzlzms               nvarchar(1000)       null/* 辨证论治详细描述 */,
    yznr                 nvarchar(1000)       null/* 医嘱内容 */,
    zyjzff               nvarchar(100)        null/* 中药煎煮方法 */,
    zyyyff               nvarchar(100)        null/* 中药用药方法 */,
    yljh                 nvarchar(2000)       not null/* 诊疗计划 */,
    jlrbm                varchar(20)          not null/* 记录人工号 */,
    jlrqm                varchar(50)          not null/* 记录人签名 */,
    zzysbm               varchar(20)          not null/* 主治医师工号 */,
    zzysqm               varchar(50)          not null/* 主治医师签名 */,
    zrysbm               varchar(20)          not null/* 主任医师工号 */,
    zrysqm               varchar(50)          not null/* 主任医师签名 */,
    qmrq                 datetime             not null/* 签名日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_SJYSCFJL_ZYSZGCJG     住院病程记录－上级医师查房记录_中医四诊观察结果                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_SJYSCFJL_ZYSZGCJG') )
 create table  DC_ZYBCJL_SJYSCFJL_ZYSZGCJG (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    zyszgcjg             nvarchar(1000)       null/* 中医“四诊”观察结果 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_SQTL     住院病程记录－术前讨论                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_SQTL') )
 create table  DC_ZYBCJL_SQTL (    
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
    sfzhm                varchar(18)          not null/* 患者身份证号标识 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    tlrq                 datetime             not null/* 讨论日期时间 */,
    tldd                 varchar(50)          not null/* 讨论地点 */,
    zcrbm                varchar(100)         not null/* 主持人工号 */,
    zcrxm                varchar(500)         not null/* 主持人姓名 */,
    tlrybm               varchar(100)         not null/* 参加讨论人员工号 */,
    cjtlmd               varchar(500)         not null/* 参加讨论人员名单 */,
    zyzwlbdm             varchar(4)           not null/* 专业技术职务类别代码 */,
    zyzwlbmc             varchar(50)          not null/* 专业技术职务类别名称 */,
    ryrq                 datetime             not null/* 入院日期时间 */,
    ssczmc               varchar(128)         not null/* 拟实施手术及操作名称 */,
    ssczbm               varchar(64)          not null/* 拟实施手术及操作编码 */,
    ssmbbwdm             varchar(64)          not null/* 拟实施手术目标部位代码 */,
    ssbwmc               varchar(128)         not null/* 拟实施手术目标部位名称 */,
    ssczrq               datetime             not null/* 拟实施手术及操作日期时间 */,
    mzffdm               varchar(64)          not null/* 拟实施麻醉方法代码 */,
    mzffmc               varchar(128)         not null/* 拟实施麻醉方法名称 */,
    ssyd                 nvarchar(200)        not null/* 手术要点 */,
    sqzb                 nvarchar(1000)       not null/* 术前准备 */,
    sszz                 nvarchar(500)        not null/* 手术指征 */,
    ssfa                 nvarchar(1000)       not null/* 手术方案 */,
    zysx                 nvarchar(1000)       not null/* 注意事项 */,
    tlyj                 nvarchar(2000)       not null/* 讨论意见 */,
    tljl                 nvarchar(2000)       not null/* 讨论结论 */,
    sszbm                varchar(20)          null/* 手术者工号 */,
    sszqm                varchar(50)          null/* 手术者签名 */,
    mzysbm               varchar(20)          null/* 麻醉医师工号 */,
    mzsqm                varchar(50)          null/* 麻醉医师签名 */,
    ysbm                 varchar(20)          not null/* 签名人工号 */,
    ysqm                 varchar(50)          not null/* 签名人姓名 */,
    qmrq                 datetime             not null/* 签名日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_SQTL_SQZD     住院病程记录－术前讨论_术前诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_SQTL_SQZD') )
 create table  DC_ZYBCJL_SQTL_SQZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    sqzdbm               varchar(64)          not null/* 术前诊断编码 */,
    sqzdmc               varchar(128)         not null/* 术前诊断名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_SQXJ     住院病程记录－术前小结                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_SQXJ') )
 create table  DC_ZYBCJL_SQXJ (    
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
    sfzhm                varchar(18)          not null/* 患者身份证号标识 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    xjrq                 datetime             not null/* 小结日期时间 */,
    blzy                 nvarchar(200)        not null/* 病历摘要 */,
    zdyjdm               varchar(100)         not null/* 诊断依据代码 */,
    zdyj                 nvarchar(1000)       not null/* 诊断依据名称 */,
    gmsbz                char(1)              not null/* 过敏史标志 */,
    fzjcjg               nvarchar(1000)       not null/* 辅助检查结果 */,
    sssyz                nvarchar(100)        not null/* 手术适应证 */,
    ssjjz                nvarchar(100)        not null/* 手术禁忌症 */,
    sszz                 nvarchar(500)        not null/* 手术指征 */,
    hzyj                 nvarchar(2000)       null/* 会诊意见 */,
    ssczbm               varchar(64)          not null/* 拟实施手术及操作编码 */,
    ssczmc               varchar(128)         not null/* 拟实施手术及操作名称 */,
    ssmbbwdm             varchar(64)          not null/* 拟实施手术目标部位代码 */,
    ssbwmc               varchar(128)         not null/* 拟实施手术目标部位名称 */,
    ssczrq               datetime             not null/* 拟实施手术及操作日期时间 */,
    mzffdm               varchar(64)          not null/* 拟实施麻醉方法代码 */,
    mzffmc               varchar(128)         not null/* 拟实施麻醉方法名称 */,
    zysx                 nvarchar(1000)       not null/* 注意事项 */,
    ssyd                 nvarchar(200)        not null/* 手术要点 */,
    sqzb                 nvarchar(1000)       not null/* 术前准备 */,
    sszbm                varchar(20)          not null/* 手术者工号 */,
    sszqm                varchar(50)          not null/* 手术者签名 */,
    ysbm                 varchar(20)          null/* 签名人工号 */,
    ysqm                 varchar(50)          null/* 签名人姓名 */,
    qmrq                 datetime             not null/* 签名日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_SQXJ_GMS     住院病程记录－术前小结_过敏史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_SQXJ_GMS') )
 create table  DC_ZYBCJL_SQXJ_GMS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    gms                  nvarchar(1000)       null/* 过敏史 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_SQXJ_SQZD     住院病程记录－术前小结_术前诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_SQXJ_SQZD') )
 create table  DC_ZYBCJL_SQXJ_SQZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    sqzdbm               varchar(64)          not null/* 术前诊断编码 */,
    sqzdmc               varchar(128)         not null/* 术前诊断名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_SWBLTLJL     住院病程记录－死亡病例讨论记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_SWBLTLJL') )
 create table  DC_ZYBCJL_SWBLTLJL (    
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
    bfmc                 varchar(10)          not null/* 病房名称 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 患者身份证号标识 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    tlrq                 datetime             not null/* 讨论日期时间 */,
    tldddm               varchar(20)          not null/* 讨论地点代码 */,
    tldd                 varchar(50)          not null/* 讨论地点名称 */,
    zcrbm                varchar(100)         not null/* 主持人工号 */,
    zcrxm                varchar(500)         not null/* 主持人姓名 */,
    tlrybm               varchar(100)         not null/* 参加讨论人员工号 */,
    cjtlmd               varchar(500)         not null/* 参加讨论人员名单 */,
    zyzwlbdm             varchar(10)          not null/* 专业技术职务类别代码 */,
    zyzwlbmc             varchar(50)          not null/* 专业技术职务类别名称 */,
    zjswyymc             varchar(128)         not null/* 直接死亡原因名称 */,
    zjswyybm             varchar(64)          not null/* 直接死亡原因编码 */,
    swtljl               nvarchar(2000)       not null/* 死亡讨论记录 */,
    zcrzjyj              nvarchar(2000)       not null/* 主持人总结意见 */,
    zzysbm               varchar(20)          not null/* 主治医师工号 */,
    zzysqm               varchar(50)          not null/* 主治医师签名 */,
    zrysbm               varchar(20)          not null/* 主任医师工号 */,
    zrysqm               varchar(50)          not null/* 主任医师签名 */,
    qmrq                 datetime             not null/* 签名日期时间 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_SWBLTLJL_SWZD     住院病程记录－死亡病例讨论记录_死亡诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_SWBLTLJL_SWZD') )
 create table  DC_ZYBCJL_SWBLTLJL_SWZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    swzdbm               varchar(100)         not null/* 死亡诊断编码 */,
    swzdmc               varchar(500)         not null/* 死亡诊断名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_SWJL     住院病程记录－死亡记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_SWJL') )
 create table  DC_ZYBCJL_SWJL (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    zyh                  varchar(64)          not null/* 住院号标识 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zzjgdm               varchar(10)          not null/* 医疗机构组织机构代码 */,
    zzjgmc               varchar(70)          not null/* 医疗机构组织机构名称 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bfmc                 varchar(50)          not null/* 病房名称 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 患者身份证号标识 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    ryrq                 datetime             not null/* 入院日期时间 */,
    ryzdbm               varchar(64)          not null/* 入院诊断编码 */,
    ryzdmc               varchar(128)         not null/* 入院诊断名称 */,
    ryqk                 nvarchar(2000)       not null/* 入院情况 */,
    zlgcms               nvarchar(2000)       not null/* 诊疗过程描述 */,
    swrq                 datetime             not null/* 死亡日期时间 */,
    zjswyymc             varchar(128)         not null/* 直接死亡原因名称 */,
    zjswyybm             varchar(64)          not null/* 直接死亡原因编码 */,
    swzdmc               varchar(128)         not null/* 死亡诊断名称 */,
    swzdbm               varchar(64)          not null/* 死亡诊断编码 */,
    jstysjbz             char(1)              not null/* 家属是否同意尸体解剖标志 */,
    zyysbm               varchar(20)          not null/* 住院医师工号 */,
    zyysqm               varchar(50)          not null/* 住院医师签名 */,
    zzysbm               varchar(20)          not null/* 主治医师工号 */,
    zzysqm               varchar(50)          not null/* 主治医师签名 */,
    zrysbm               varchar(20)          not null/* 主任医师工号 */,
    zrysqm               varchar(50)          not null/* 主任医师签名 */,
    qmrq                 datetime             not null/* 签名日期时间 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_SWJL_RYZD     住院病程记录－死亡记录_入院诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_SWJL_RYZD') )
 create table  DC_ZYBCJL_SWJL_RYZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    ryzdbm               varchar(64)          not null/* 入院诊断编码 */,
    ryzdmc               varchar(128)         not null/* 入院诊断名称 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_SWJL_SWZD     住院病程记录－死亡记录_死亡诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_SWJL_SWZD') )
 create table  DC_ZYBCJL_SWJL_SWZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    swzdmc               varchar(128)         not null/* 死亡诊断名称 */,
    swzdbm               varchar(64)          not null/* 死亡诊断编码 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_YNBLTLJL     住院病程记录－疑难病例讨论记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_YNBLTLJL') )
 create table  DC_ZYBCJL_YNBLTLJL (    
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
    rybfmc               varchar(50)          not null/* 入院病房名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    tlrq                 datetime             not null/* 讨论日期时间 */,
    tldddm               varchar(20)          not null/* 讨论地点代码 */,
    tldd                 varchar(50)          not null/* 讨论地点 */,
    tlrybm               varchar(100)         not null/* 讨论人员工号 */,
    cjtlrmd              varchar(500)         not null/* 参加讨论人员名单 */,
    zcrbm                varchar(100)         not null/* 主持人工号 */,
    zcrxm                varchar(500)         not null/* 主持人姓名 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 患者身份证号标识 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别说明 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    tlyj                 nvarchar(2000)       not null/* 讨论意见 */,
    bzlzms               nvarchar(1000)       null/* 辨证论治详细描述 */,
    zycfyznr             nvarchar(1000)       null/* 中药处方医嘱内容 */,
    zyyyff               nvarchar(100)        null/* 中药用药方法 */,
    zcrzjyj              nvarchar(2000)       null/* 主持人总结意见 */,
    ysbm                 varchar(20)          not null/* 签名人工号 */,
    ysqm                 varchar(50)          not null/* 签名人姓名 */,
    zzysbm               varchar(20)          not null/* 主治医师工号 */,
    zzysqm               varchar(50)          not null/* 主治医师签名 */,
    zrysbm               varchar(20)          not null/* 主任医师工号 */,
    zrysqm               varchar(50)          not null/* 主任医师签名 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_YNBLTLJL_ZYSZGCJG     住院病程记录－疑难病例讨论记录_中医四诊观察结果                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_YNBLTLJL_ZYSZGCJG') )
 create table  DC_ZYBCJL_YNBLTLJL_ZYSZGCJG (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    zyszgcjg             nvarchar(1000)       null/* 中医“四诊”观察结果 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYBCJL_ZKJL     住院病程记录－转科记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYBCJL_ZKJL') )
 create table  DC_ZYBCJL_ZKJL (    
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
    rybfmc               varchar(50)          not null/* 入院病房名称 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 患者身份证号标识 */,
    hzcsrq               datetime             null/* 患者出生日期 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    ryrq                 datetime             not null/* 入院日期时间 */,
    zs                   nvarchar(100)        not null/* 主诉 */,
    ryqk                 nvarchar(2000)       not null/* 入院情况 */,
    zyszgcjg             nvarchar(1000)       null/* 中医“四诊”观察结果 */,
    rzxyzdbm             varchar(64)          not null/* 入院诊断-西医诊断编码 */,
    rzxyzd               varchar(128)         not null/* 入院诊断-西医诊断名称 */,
    rzzybmdm             varchar(64)          null/* 入院诊断-中医病名代码 */,
    rzzybm               varchar(128)         null/* 入院诊断-中医病名名称 */,
    rzzyzhdm             varchar(64)          null/* 入院诊断-中医证候代码 */,
    rzzyzh               varchar(128)         null/* 入院诊断-中医证候名称 */,
    zfbm                 varchar(20)          null/* 治则治法代码 */,
    zzzf                 nvarchar(100)        null/* 治则治法名称 */,
    zlgcms               nvarchar(2000)       not null/* 诊疗过程描述 */,
    mqqk                 nvarchar(2000)       not null/* 目前情况 */,
    mqzdxyzdbm           varchar(64)          not null/* 目前诊断-西医诊断编码 */,
    mqzdxyzd             varchar(128)         not null/* 目前诊断-西医诊断名称 */,
    mqzdzybmdm           varchar(64)          null/* 目前诊断-中医病名代码 */,
    mqzdzybm             varchar(128)         null/* 目前诊断-中医病名名称 */,
    mqzdzyzhdm           varchar(64)          null/* 目前诊断-中医证候代码 */,
    mqzdzyzh             varchar(128)         null/* 目前诊断-中医证候名称 */,
    zkmd                 nvarchar(200)        not null/* 转科目的 */,
    zrzljh               nvarchar(2000)       not null/* 转入诊疗计划 */,
    zycfyznr             nvarchar(1000)       null/* 中药处方医嘱内容 */,
    zyjzff               nvarchar(100)        null/* 中药煎煮方法 */,
    zyyyff               nvarchar(100)        null/* 中药用药方法 */,
    zysx                 nvarchar(1000)       not null/* 注意事项 */,
    zkjllx               char(1)              not null/* 转科记录类型 */,
    zkjllxmc             varchar(20)          not null/* 转科记录类型名称 */,
    zcrq                 datetime             not null/* 转出日期时间 */,
    zcksdm               varchar(10)          not null/* 转出科室代码 */,
    zcks                 varchar(50)          not null/* 转出科室名称 */,
    zcysbm               varchar(20)          not null/* 转出医师工号 */,
    zcysqm               varchar(50)          not null/* 转出医师签名 */,
    zrrq                 datetime             not null/* 转入日期时间 */,
    zrksdm               varchar(10)          not null/* 转入科室代码 */,
    zrks                 varchar(50)          not null/* 转入科室名称 */,
    zrysbm               varchar(20)          not null/* 转入医师工号 */,
    zrysqm               varchar(50)          not null/* 转入医师签名 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYYZ_ZYYZ     住院医嘱－住院医嘱                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYYZ_ZYYZ') )
 create table  DC_ZYYZ_ZYYZ (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    ksdm                 varchar(10)          not null/* 科室代码 */,
    ksmc                 varchar(50)          not null/* 科室名称 */,
    bqdm                 varchar(10)          not null/* 病区代码 */,
    bqmc                 varchar(50)          not null/* 病区名称 */,
    zyh                  varchar(50)          not null/* 住院号标识 */,
    bfh                  varchar(10)          not null/* 病房号 */,
    bch                  varchar(10)          not null/* 病床号 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 患者身份证号标识 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    nls                  numeric(3)           not null/* 年龄（岁） */,
    nly                  varchar(8)           null/* 年龄（月） */,
    tzkg                 numeric(6,2)         not null/* 体重（kg） */,
    yzlbdm               varchar(2)           not null/* 医嘱类别代码 */,
    yzlbmc               varchar(50)          not null/* 医嘱类别名称 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYYZ_ZYYZ_YZMX     住院医嘱－住院医嘱_医嘱明细                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYYZ_ZYYZ_YZMX') )
 create table  DC_ZYYZ_ZYYZ_YZMX (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          not null/* 主源记录序号 */,
    dzsqdbh              varchar(20)          not null/* 电子申请单编号 */,
    cfypzh               varchar(50)          not null/* 处方药品组号 */,
    yzxmlxdm             varchar(2)           not null/* 医嘱项目类型代码 */,
    yzxmlxmc             varchar(50)          not null/* 医嘱项目类型名称 */,
    yzxmnr               varchar(100)         not null/* 医嘱项目内容 */,
    yzjhksrqsj           datetime             not null/* 医嘱计划开始日期时间 */,
    yzjhjsrqsj           datetime             not null/* 医嘱计划结束日期时间 */,
    yzbzxx               varchar(100)         null/* 医嘱备注信息 */,
    yzklzdm              varchar(20)          not null/* 医嘱开立者工号 */,
    yzklzqm              varchar(50)          not null/* 医嘱开立者签名 */,
    yzklrqsj             datetime             not null/* 医嘱开立日期时间 */,
    yzklksdm             varchar(11)          not null/* 医嘱开立科室编码 */,
    yzklksmc             varchar(50)          not null/* 医嘱开立科室名称 */,
    yzshrdm              varchar(20)          not null/* 医嘱审核人工号 */,
    yzshrqm              varchar(50)          not null/* 医嘱审核人签名 */,
    yzshrqsj             datetime             not null/* 医嘱审核日期时间 */,
    hdyzhsdm             varchar(20)          not null/* 核对医嘱护士工号 */,
    hdyzhsqm             varchar(50)          not null/* 核对医嘱护士签名 */,
    yzhdrqsj             datetime             not null/* 医嘱核对日期时间 */,
    yzzxzdm              varchar(20)          not null/* 医嘱执行者工号 */,
    yzzxzqm              varchar(50)          not null/* 医嘱执行者签名 */,
    yzzxrqsj             datetime             not null/* 医嘱执行日期时间 */,
    yzzxksdm             varchar(20)          not null/* 医嘱执行科室编码 */,
    yzzxksmc             varchar(50)          not null/* 医嘱执行科室名称 */,
    yzzxzt               varchar(50)          not null/* 医嘱执行状态 */,
    yztzrqsj             datetime             not null/* 医嘱停止日期时间 */,
    tzyzzdm              varchar(20)          not null/* 停止医嘱者工号 */,
    tzyzzqm              varchar(50)          not null/* 停止医嘱者签名 */,
    yzqxrqsj             datetime             not null/* 医嘱取消日期时间 */,
    qxyzzdm              varchar(20)          not null/* 取消医嘱者工号 */,
    qxyzzqm              varchar(50)          not null/* 取消医嘱者签名 */,
    
   

    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYZYBA_BASY     病案首页－中医住院病案                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYZYBA_BASY') )
 create table  DC_ZYZYBA_BASY (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    yljgzzjgdm           varchar(10)          not null/* 医疗机构代码 */,
    yljgzzjgmc           varchar(70)          not null/* 医疗机构名称 */,
    ylfffsdm             varchar(2)           not null/* 医疗付费方式代码 */,
    ylfffsmc             varchar(50)          not null/* 医疗付费方式名称 */,
    jmjkkh               varchar(18)          not null/* 居民健康档案 */,
    zycs                 numeric(3)           not null/* 住院次数 */,
    bah                  varchar(18)          not null/* 病案号 */,
    zyh                  varchar(20)          not null/* 住院号 */,
    xm                   varchar(50)          not null/* 姓名 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    csrq                 date                 not null/* 出生日期 */,
    nls                  varchar(8)           not null/* 年龄（月） */,
    nly                  numeric(3)           null/* 年龄（岁） */,
    gjdm                 varchar(3)           not null/* 国籍代码 */,
    gjmc                 varchar(100)         not null/* 国籍名称 */,
    xsecstzg             numeric(4)           null/* 新生儿出生体重（g） */,
    xserytzg             numeric(4)           null/* 新生儿入院体重（g） */,
    csd_s                varchar(70)          not null/* 出生地-省（自治区、直辖市） */,
    csd_cs               varchar(70)          not null/* 出生地-市（地区、州） */,
    csd_xq               varchar(70)          not null/* 出生地-县（区） */,
    jg_s                 varchar(70)          not null/* 籍贯-省（自治区、直辖市） */,
    jg_cs                varchar(70)          not null/* 籍贯-市（地区、州） */,
    mzdm                 varchar(2)           not null/* 民族 */,
    mzmc                 varchar(50)          not null/* 民族名称 */,
    hzsfzjlbdm           varchar(2)           not null/* 患者身份证件类别代码 */,
    hzsfzjlbmc           varchar(64)          not null/* 患者身份证件类别名称 */,
    hzsfzjhm             varchar(18)          not null/* 患者身份证件号码 */,
    zylbdm               varchar(2)           null/* 职业类别代码 */,
    zylbmc               varchar(18)          null/* 职业类别名称 */,
    hyzkdm               varchar(2)           not null/* 婚姻状况代码 */,
    hyzkmc               varchar(18)          not null/* 婚姻状况名称 */,
    xzz_s                varchar(70)          not null/* 现住址-省（自治区、直辖市） */,
    xzz_cs               varchar(70)          not null/* 现住址-市（地区、州） */,
    xzz_xq               varchar(70)          not null/* 现住址-县（区） */,
    xzz_xz               varchar(70)          not null/* 现住址-乡（镇、街道办事处） */,
    xzz_c                varchar(70)          not null/* 现住址-村（街、路、弄等） */,
    xzz_mphm             varchar(70)          not null/* 现住址-门牌号码 */,
    dhhm                 varchar(20)          not null/* 电话号码 */,
    xzz_yzbm             numeric(6)           not null/* 现住址-邮政编码 */,
    hkdz_s               varchar(70)          not null/* 户口地址-省（自治区、直辖市） */,
    hkdz_cs              varchar(70)          not null/* 户口地址-市（地区、州） */,
    hkdz_xq              varchar(70)          not null/* 户口地址-县（区） */,
    hkdz_xz              varchar(70)          not null/* 户口地址-乡（镇、街道办事处） */,
    hkdz_c               varchar(70)          not null/* 户口地址-村（街、路、弄等） */,
    hkdz_mphm            varchar(70)          not null/* 户口地址-门牌号码 */,
    hkdz_yzbm            numeric(6)           not null/* 户口地址-邮政编码 */,
    gzdwmc               varchar(70)          not null/* 工作单位名称 */,
    gzdwdz_s             varchar(70)          not null/* 工作单位地址-省（自治区、直辖市） */,
    gzdwdz_cs            varchar(70)          not null/* 工作单位地址-市（地区、州） */,
    gzdwdz_xq            varchar(70)          not null/* 工作单位地址-县（区） */,
    gzdwdz_xz            varchar(70)          not null/* 工作单位地址-乡（镇、街道办事处） */,
    gzdwdz_c             varchar(70)          not null/* 工作单位地址-村（街、路、弄等） */,
    gzdwdz_mphm          varchar(70)          not null/* 工作单位地址-门牌号码 */,
    gzdwdhhm             varchar(20)          not null/* 工作单位电话号码 */,
    gzdwdz_yzbm          numeric(6)           not null/* 工作单位地址-邮政编码 */,
    lxrxm                varchar(50)          not null/* 联系人姓名 */,
    lxryhzdgxdm          varchar(2)           not null/* 联系人与患者的关系代码 */,
    lxryhzdgxmc          varchar(50)          not null/* 联系人与患者的关系名称 */,
    lxrdz_s              varchar(70)          not null/* 联系人地址-省（自治区、直辖市） */,
    lxrdz_cs             varchar(70)          not null/* 联系人地址-市（地区、州） */,
    lxrdz_xq             varchar(70)          not null/* 联系人地址-县（区） */,
    lxrdz_xz             varchar(70)          not null/* 联系人地址-乡（镇、街道办事处） */,
    lxrdz_c              varchar(70)          not null/* 联系人地址-村（街、路、弄等） */,
    lxrdz_mphm           varchar(70)          not null/* 联系人地址-门牌号码 */,
    lxrdhhm              varchar(20)          not null/* 联系人电话号码 */,
    rytjdm               varchar(2)           not null/* 入院途径代码 */,
    rytjmc               varchar(20)          not null/* 入院途径名称 */,
    zllbdm               varchar(2)           not null/* 治疗类别代码 */,
    zllbmc               varchar(100)         not null/* 治疗类别名称 */,
    ryrqsj               datetime             not null/* 入院日期时间 */,
    rykbdm               varchar(11)          not null/* 入院科别代码 */,
    rykb                 varchar(50)          not null/* 入院科别名称 */,
    rybf                 varchar(10)          not null/* 入院病房 */,
    zkkb                 varchar(50)          null/* 转科科别 */,
    cyrqsj               datetime             not null/* 出院日期时间 */,
    cykbdm               varchar(11)          not null/* 出院科别代码 */,
    cykbmc               varchar(50)          not null/* 出院科别 */,
    cybf                 varchar(10)          not null/* 出院病房 */,
    sjzyts               numeric(4)           not null/* 实际住院天数 */,
    sslcljbzdm           varchar(2)           not null/* 实施临床路径标志代码 */,
    sslcljbzmc           varchar(50)          not null/* 实施临床路径标志名称 */,
    syyljgzyzjbz         char(1)              null/* 使用医疗机构中药制剂标志 */,
    syzyzlsbbz           char(1)              null/* 使用中医诊疗设备标志 */,
    syzyzljsbz           char(1)              null/* 使用中医诊疗技术标志 */,
    bzshbz               char(1)              null/* 辨证施护标志 */,
    sszddwbyyjbbm        varchar(64)          not null/* 损伤中毒的外部原因疾病编码 */,
    sszddwbyyjbmc        varchar(128)         not null/* 损伤中毒的外部原因 */,
    swhzsjbz             char(1)              null/* 死亡患者尸检标志 */,
    aboxxdm              varchar(2)           not null/* ABO血型代码 */,
    aboxxmc              varchar(8)           not null/* ABO血型名称 */,
    rhxxdm               varchar(2)           not null/* Rh血型代码 */,
    rhxxmc               varchar(8)           not null/* Rh血型名称 */,
    kzrdm                varchar(20)          not null/* 科主任工号 */,
    kzrqm                varchar(50)          not null/* 科主任签名 */,
    zrfzrysdm            varchar(20)          not null/* 主任（副主任）医师工号 */,
    zrfzrysqm            varchar(50)          not null/* 主任（副主任）医师签名 */,
    zzysdm               varchar(20)          not null/* 主治医师工号 */,
    zzysqm               varchar(50)          not null/* 主治医师签名 */,
    zyysdm               varchar(20)          not null/* 住院医师工号 */,
    zyysqm               varchar(50)          not null/* 住院医师签名 */,
    zrhsdm               varchar(20)          not null/* 责任护士工号 */,
    zrhsqm               varchar(50)          not null/* 责任护士签名 */,
    jxysdm               varchar(20)          not null/* 进修医师工号 */,
    jxysqm               varchar(50)          not null/* 进修医师签名 */,
    sxysdm               varchar(20)          not null/* 实习医师工号 */,
    sxysqm               varchar(50)          not null/* 实习医师签名 */,
    bydm                 varchar(20)          not null/* 编码员工号 */,
    bym                  varchar(50)          not null/* 编码员签名 */,
    bazldm               varchar(2)           not null/* 病案质量代码 */,
    bazlmc               varchar(50)          not null/* 病案质量名称 */,
    zkysdm               varchar(20)          not null/* 质控医师工号 */,
    zkysqm               varchar(50)          not null/* 质控医师签名 */,
    zkhsdm               varchar(20)          not null/* 质控护士工号 */,
    zkhsqm               varchar(50)          not null/* 质控护士签名 */,
    zkrq                 date                 not null/* 质控日期 */,
    ssjczbm              varchar(64)          not null/* 手术及操作编码 */,
    ssjczrq              datetime             not null/* 手术及操作日期 */,
    ssjbdm               varchar(2)           not null/* 手术级别代码 */,
    ssjbmc               varchar(50)          not null/* 手术级别名称 */,
    ssjczmc              varchar(128)         not null/* 手术及操作名称 */,
    sszdm                varchar(20)          not null/* 手术者工号 */,
    sszxm                varchar(50)          not null/* 手术者姓名 */,
    yzdm                 varchar(20)          not null/* Ⅰ助工号 */,
    yzxm                 varchar(50)          not null/* Ⅰ助姓名 */,
    ezdm                 varchar(20)          not null/* Ⅱ助工号 */,
    ezxm                 varchar(50)          not null/* Ⅱ助姓名 */,
    ssqklbdm             varchar(2)           not null/* 手术切口类别代码 */,
    ssqklbmc             varchar(100)         not null/* 手术切口类别名称 */,
    qkyhdjdm             varchar(2)           not null/* 切口愈合等级代码 */,
    qkyhdjmc             varchar(100)         not null/* 切口愈合等级名称 */,
    mzffdm               numeric(2)           not null/* 麻醉方法代码 */,
    mzffmc               varchar(50)          not null/* 麻醉方法名称 */,
    mzysdm               varchar(20)          not null/* 麻醉医师工号 */,
    mzysxm               varchar(50)          not null/* 麻醉医师姓名 */,
    lyfsdm               varchar(2)           not null/* 离院方式代码 */,
    lyfsmc               varchar(100)         not null/* 离院方式名称 */,
    njsyljgdm            varchar(20)          null/* 拟接收医疗机构代码 */,
    njsyljgmc            varchar(70)          null/* 拟接收医疗机构名称 */,
    cy31dnzzybz          char(1)              not null/* 出院31d内再住院标志 */,
    cy31dnzzymd          varchar(100)         null/* 出院31d内再住院目的 */,
    lnsshzryqhmsj_d      numeric(5)           not null/* 颅脑损伤患者入院前昏迷时间-d */,
    lnsshzryqhmsj_h      numeric(2)           not null/* 颅脑损伤患者入院前昏迷时间-h */,
    lnsshzryqhmsj_min    numeric(2)           not null/* 颅脑损伤患者入院前昏迷时间-min */,
    lnsshzryhhmsj_d      numeric(5)           not null/* 颅脑损伤患者入院后昏迷时间-d */,
    lnsshzryhhmsj_h      numeric(2)           not null/* 颅脑损伤患者入院后昏迷时间-h */,
    lnsshzryhhmsj_min    numeric(2)           not null/* 颅脑损伤患者入院后昏迷时间-min */,
    zyzfy                numeric(10,2)        not null/* 住院总费用 */,
    zyzfy_zfje           numeric(10,2)        not null/* 住院总费用-自付金额 */,
    zhylfwl_ybylfwf      numeric(10,2)        not null/* 综合医疗服务类-一般医疗服务费 */,
    zhylfwl_ybylfwf_zybzlzf numeric(10,2)        not null/* 综合医疗服务类-一般医疗服务费-中医辨证论治费 */,
    zhylfwl_ybylfwf_zybzlzhzf numeric(10,2)        not null/* 综合医疗服务类-一般医疗服务费-中医辨证论治会诊费 */,
    zhylfwl_ybzlczf      numeric(10,2)        not null/* 综合医疗服务类-一般治疗操作费 */,
    zhylfwl_hlf          numeric(10,2)        not null/* 综合医疗服务类-护理费 */,
    zhylfwl_qtfy         numeric(10,2)        not null/* 综合医疗服务类-其他费用 */,
    zdl_blzdf            numeric(10,2)        not null/* 诊断类-病理诊断费 */,
    zdl_syszdf           numeric(10,2)        not null/* 诊断类-实验室诊断费 */,
    zdl_yxxzdf           numeric(10,2)        not null/* 诊断类-影像学诊断费 */,
    zdl_lczdxmf          numeric(10,2)        not null/* 诊断类-临床诊断项目费 */,
    zll_fsszlxmf         numeric(10,2)        not null/* 治疗类-非手术治疗项目费 */,
    zll_fsszlxmf_lcwlzlf numeric(10,2)        not null/* 治疗类-非手术治疗项目费-临床物理治疗费 */,
    zll_sszlf            numeric(10,2)        not null/* 治疗类-手术治疗费 */,
    zll_sszlf_mzf        numeric(10,2)        not null/* 治疗类-手术治疗费-麻醉费 */,
    zll_sszlf_ssf        numeric(10,2)        not null/* 治疗类-手术治疗费-手术费 */,
    kfl_kff              numeric(10,2)        not null/* 康复类-康复费 */,
    zyl_zyzdf            numeric(10,2)        not null/* 中医类-中医诊断费 */,
    zyl_zyzlf            numeric(10,2)        not null/* 中医类-中医治疗费 */,
    zyl_zyzlf_zywzf      numeric(10,2)        not null/* 中医类-中医治疗费-中医外治费 */,
    zyl_zyzlf_zygsf      numeric(10,2)        not null/* 中医类-中医治疗费-中医骨伤费 */,
    zyl_zyzlf_zcyjff     numeric(10,2)        not null/* 中医类-中医治疗费-针刺与灸法费 */,
    zyl_zyzlf_zytnzlf    numeric(10,2)        not null/* 中医类-中医治疗费-中医推拿治疗费 */,
    zyl_zyzlf_zygczlf    numeric(10,2)        not null/* 中医类-中医治疗费-中医肛肠治疗费 */,
    zyl_zyzlf_zytszlf    numeric(10,2)        not null/* 中医类-中医治疗费-中医特殊治疗费 */,
    zyl_zyqtf            numeric(10,2)        not null/* 中医类-中医其他费 */,
    zyl_zyqtf_zytsdpjgf  numeric(10,2)        not null/* 中医类-中医其他费-中医特殊调配加工费 */,
    zyl_zyqtf_bzssf      numeric(10,2)        not null/* 中医类-中医其他费-辨证施膳费 */,
    xyl_xyf              numeric(10,2)        not null/* 西药类-西药费 */,
    xyl_xyf_kjywfy       numeric(10,2)        not null/* 西药类-西药费-抗菌药物费用 */,
    zyl_zchenyf          numeric(10,2)        not null/* 中药类-中成药费 */,
    zyl_zcyf_yljgzyzjf   numeric(10,2)        not null/* 中药类-中成药费-医疗机构中药制剂费 */,
    zyl_zcyf             numeric(10,2)        not null/* 中药类-中草药费 */,
    xyhxyzpl_xf          numeric(10,2)        not null/* 血液和血液制品类-血费 */,
    xyhxyzpl_bdblzpf     numeric(10,2)        not null/* 血液和血液制品类-白蛋白类制品费 */,
    xyhxyzpl_qdblzpf     numeric(10,2)        not null/* 血液和血液制品类-球蛋白类制品费 */,
    xyhxyzpl_nxyzlzpf    numeric(10,2)        not null/* 血液和血液制品类-凝血因子类制品费 */,
    xyhxyzpl_xbyzlzpf    numeric(10,2)        not null/* 血液和血液制品类-细胞因子类制品费 */,
    hcl_jcyycxyyclf      numeric(10,2)        not null/* 耗材类-检查用一次性医用材料费 */,
    hcl_zlyycxyyclf      numeric(10,2)        not null/* 耗材类-治疗用一次性医用材料费 */,
    hcl_ssyycxyyclf      numeric(10,2)        not null/* 耗材类-手术用一次性医用材料费 */,
    qtl_qtf              numeric(10,2)        not null/* 其他类-其他费 */,
    
   
    
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYZYBA_BASY_BLZD     病案首页－中医住院病案_病理诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYZYBA_BASY_BLZD') )
 create table  DC_ZYZYBA_BASY_BLZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    blhm                 varchar(18)          not null/* 病理号 */,
    blzdjbbm             varchar(64)          not null/* 病理诊断疾病编码 */,
    blzdmc               varchar(128)         not null/* 病理诊断名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYZYBA_BASY_CYXYQTZD     病案首页－中医住院病案_出院西医其他诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYZYBA_BASY_CYXYQTZD') )
 create table  DC_ZYZYBA_BASY_CYXYQTZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    cyxyzd_qtzdjbbm      varchar(64)          not null/* 出院西医诊断-其他诊断疾病编码 */,
    cyxyzd_qtzdmc        varchar(128)         not null/* 出院西医诊断-其他诊断名称 */,
    cyxyzd_qtzd_rybqdm   varchar(64)          not null/* 出院西医诊断-其他诊断-入院病情代码 */,
    cyxyzd_qtzd_rybqmc   varchar(128)         not null/* 出院西医诊断-其他诊断-入院病情名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYZYBA_BASY_CYXYZZD     病案首页－中医住院病案_出院西医主要诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYZYBA_BASY_CYXYZZD') )
 create table  DC_ZYZYBA_BASY_CYXYZZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    cyxyzd_zyzdmc        varchar(128)         not null/* 出院西医诊断-主要诊断名称 */,
    cyxyzd_zyzdjbbm      varchar(64)          not null/* 出院西医诊断-主要诊断疾病编码 */,
    cyxyzd_zyzd_rybqdm   varchar(64)          not null/* 出院西医诊断-主要诊断-入院病情代码 */,
    cyxyzd_zyzd_rybqmc   varchar(128)         not null/* 出院西医诊断-主要诊断-入院病情名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYZYBA_BASY_CYZYBM     病案首页－中医住院病案_出院中医诊断主病                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYZYBA_BASY_CYZYBM') )
 create table  DC_ZYZYBA_BASY_CYZYBM (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    cyzyzd_zbbm          varchar(64)          not null/* 出院中医诊断-主病编码 */,
    cyzyzd_zbmc          varchar(128)         not null/* 出院中医诊断-主病名称 */,
    cyzyzd_zb_rybqdm     varchar(64)          not null/* 出院中医诊断-主病-入院病情代码 */,
    cyzyzd_zb_rybqmc     varchar(128)         not null/* 出院中医诊断-主病-入院病情名称 */,
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYZYBA_BASY_CYZYZH     病案首页－中医住院病案_出院中医诊断主证                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYZYBA_BASY_CYZYZH') )
 create table  DC_ZYZYBA_BASY_CYZYZH (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    cyzyzd_zzbm          varchar(64)          not null/* 出院中医诊断-主证编码 */,
    cyzyzd_zzmc          varchar(128)         not null/* 出院中医诊断-主证名称 */,
    cyzyzd_zz_rybqdm     varchar(64)          not null/* 出院中医诊断-主证-入院病情代码 */,
    cyzyzd_zz_rybqmc     varchar(128)         not null/* 出院中医诊断-主证-入院病情名称 */,
    
   
    
    
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYZYBA_BASY_GMS     病案首页－中医住院病案_过敏史                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYZYBA_BASY_GMS') )
 create table  DC_ZYZYBA_BASY_GMS (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    ywgmbz               char(1)              not null/* 药物过敏标志 */,
    gmyw                 varchar(1000)        not null/* 过敏药物 */,
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYZYBA_BASY_MJZXYZD     病案首页－中医住院病案_门急诊西医诊断                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYZYBA_BASY_MJZXYZD') )
 create table  DC_ZYZYBA_BASY_MJZXYZD (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    mjzzdxyzdjbbm        varchar(64)          not null/* 门（急）诊诊断（西医诊断）疾病编码 */,
    mjzzdxyzdmc          varchar(128)         not null/* 门（急）诊诊断（西医诊断）名称 */,
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYZYBA_BASY_MJZZYBM     病案首页－中医住院病案_门急诊中医病名                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYZYBA_BASY_MJZZYBM') )
 create table  DC_ZYZYBA_BASY_MJZZYBM (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    mjzzdzyzdbmbm        varchar(64)          not null/* 门（急）诊诊断（中医诊断）病名编码 */,
    mjzzdzyzdmc          varchar(128)         not null/* 门（急）诊诊断（中医诊断）名称 */,
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZYZYBA_BASY_MJZZYZH     病案首页－中医住院病案_门急诊中医症候                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZYZYBA_BASY_MJZZYZH') )
 create table  DC_ZYZYBA_BASY_MJZZYZH (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    zyjlxh               varchar(64)          null/* 主表原纪录序号 */,
    mjzzdzyzhzhbm        varchar(64)          not null/* 门（急）诊诊断（中医证候）证候编码 */,
    mjzzdzyzhmc          varchar(128)         not null/* 门（急）诊诊断（中医证候）名称 */,
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go

/*========================================================================*/
 /* DC_ZZYJL_ZZYJL     转(诊)院记录－转（诊）院记录                                                                                                  */
 /*========================================================================*/
 if not exists 
(select 1 from sysobjects 
where id = object_id('DC_ZZYJL_ZZYJL') )
 create table  DC_ZZYJL_ZZYJL (    
    xh                   numeric(12)          identity(1, 1)/* 序号  */,
    yljgdm               varchar(20)          not null/* 医疗机构代码  */,
    jzlsh                varchar(64)          not null/* 就诊流水号 */,
    patid                varchar(64)          not null/* 患者patid */,
    jzlb                 varchar(2)           not null/* 就诊类别 */,
    yjlxh                varchar(64)          not null/* 源记录序号 */,
    jkkh                 varchar(18)          not null/* 居民健康卡号 */,
    mjzh                 varchar(18)          null/* 门急诊号 */,
    zyh                  varchar(64)          null/* 住院号标识 */,
    hzxm                 varchar(50)          not null/* 患者姓名 */,
    sfzhm                varchar(18)          not null/* 患者身份证号标识 */,
    xbdm                 varchar(2)           not null/* 性别代码 */,
    xbmc                 varchar(16)          not null/* 性别名称 */,
    csrq                 date                 not null/* 出生日期 */,
    gms                  nvarchar(1000)       not null/* 过敏史 */,
    jbs                  nvarchar(1000)       not null/* 疾病史 */,
    sss                  nvarchar(1000)       not null/* 手术史 */,
    zzrq                 datetime             not null/* 转诊（院）日期 */,
    zzyy                 nvarchar(100)        not null/* 转诊原因 */,
    zzjl                 varchar(2000)        not null/* 转诊记录 */,
    ysbm                 varchar(20)          not null/* 转诊医师编码 */,
    zzysxm               varchar(50)          not null/* 转诊医师姓名 */,
    jbzdbm               varchar(64)          not null/* 疾病诊断编码 */,
    jbzd                 varchar(128)         not null/* 疾病诊断名称 */,
    zdrq                 date                 not null/* 诊断日期 */,
    zdyljgdm             varchar(10)          not null/* 诊断医疗机构代码 */,
    zdjgmc               nvarchar(70)         null/* 诊断机构名称 */,
    xgzz                 nvarchar(1000)       null/* 相关症状 */,
    zyzlcs               nvarchar(1000)       null/* 主要治疗措施 */,
    fzjcjg               varchar(1000)        null/* 辅助检查结果 */,
    ssczbm               varchar(64)          null/* 手术及操作编码 */,
    ssjczmc              varchar(128)         null/* 手术及操作名称 */,
    ssczksrq             datetime             null/* 手术及操作开始日期时间 */,
    zlfa                 nvarchar(1000)       null/* 治疗方案 */,
    czjh                 nvarchar(1000)       null/* 处置计划 */,
    jkwtpg               nvarchar(2000)       null/* 健康问题评估 */,
    kfcszd               nvarchar(100)        null/* 康复措施指导 */,
    zcjgdm               varchar(10)          not null/* 转出医疗机构代码 */,
    zcjgmc               varchar(70)          not null/* 转出医疗机构名称 */,
    zcjgksdm             varchar(20)          not null/* 转出医疗机构科代码 */,
    zcjgksmc             varchar(50)          not null/* 转出医疗机构科室名 */,
    zryljgdm             varchar(10)          not null/* 转入医疗机构代码 */,
    zrjgmc               varchar(70)          not null/* 转入医疗机构名称 */,
    zrjgksdm             varchar(20)          not null/* 转入医疗机构科室代码 */,
    zrjgksmc             varchar(50)          not null/* 转入医疗机构科室名称 */,
	[isNew] [bit] NULL,
	[gxrqtimestr] [varchar](50) NULL,
	[timetempstr] [varbinary](8) NULL,
	[createtime] [datetime] NULL,
	[gxrq] [datetime] NOT NULL,
	[timetemp] [timestamp] NULL,
	[sys_id] [varchar](50) NOT NULL,
	[lsnid] [bigint] NULL,
	[isdelete] [varchar](10) NULL  
	)
go
