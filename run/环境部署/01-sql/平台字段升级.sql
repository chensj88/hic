-- 平台数据库字段修改
alter table HLHT_RYJL_RCYJL alter column  csnrbz char(10) not null  ;
alter table HLHT_RYJL_RCYJL alter column  zs text not null  ;
alter table HLHT_RYJL_RCYJL alter column  xbs text not null  ;
alter table HLHT_RYJL_RCYJL alter column  ryqk text not null  ;
alter table HLHT_RYJL_RCYJL alter column  zzmc text not null  ;
alter table HLHT_RYJL_RCYJL alter column  zzms text not null  ;
alter table HLHT_RYJL_RCYJL alter column  zyszgcjg text   ;
alter table HLHT_RYJL_RCYJL alter column  rzxyzdmc varchar(1000) not null  ;
alter table HLHT_RYJL_RCYJL alter column  rzxzzdbm varchar(500) not null  ;
alter table HLHT_RYJL_RCYJL alter column  zlgcms text not null  ;
alter table HLHT_RYJL_RCYJL alter column  cyqk text not null  ;
alter table HLHT_RYJL_RCYJL alter column  czxyzdmc varchar(1000) not null  ;
alter table HLHT_RYJL_RCYJL alter column  czxyzdbm varchar(500) not null  ;
alter table HLHT_RYJL_RCYJL alter column  cyyz text   ;
alter table HLHT_RYJL_RYSWJL alter column  cszhzgxdm varchar(10) not null  ;
alter table HLHT_RYJL_RYSWJL alter column  csnrbz char(10) not null  ;
alter table HLHT_RYJL_RYSWJL alter column  ryqk text not null  ;
alter table HLHT_RYJL_RYSWJL alter column  zyszgcjg text   ;
alter table HLHT_RYJL_RYSWJL alter column  rzxyzdmc varchar(1000) not null  ;
alter table HLHT_RYJL_RYSWJL alter column  rzxyzdbm varchar(500) not null  ;
alter table HLHT_RYJL_RYSWJL alter column  zlgcms text not null  ;
alter table HLHT_RYJL_RYSWJL alter column  szxyzdmc varchar(1000) not null  ;
alter table HLHT_RYJL_RYSWJL alter column  szxyzdbm varchar(500) not null  ;
alter table HLHT_MJZBL_JZLGBL alter column  gms text not null  ;
alter table HLHT_MJZBL_JZLGBL alter column  zs text not null  ;
alter table HLHT_MJZBL_JZLGBL alter column  xbs text not null  ;
alter table HLHT_MJZBL_JZLGBL alter column  jws text not null  ;
alter table HLHT_MJZBL_JZLGBL alter column  zyszgcjg text   ;
alter table HLHT_MJZBL_JZLGBL alter column  fzjcjg text   ;
alter table HLHT_MJZBL_JZLGBL alter column  yzxmnr varchar(MAX) not null  ;
alter table HLHT_MJZBL_JZLGBL alter column  jzlgbcjl text not null  ;
alter table HLHT_MJZBL_JZLGBL alter column  jzqjjl text not null  ;
alter table HLHT_MJZBL_JZLGBL alter column  ssjczff text   ;
alter table HLHT_MJZBL_JZLGBL alter column  zysx text not null  ;
alter table HLHT_MJZBL_JZLGBL alter column  hzqxdm varchar(16) not null  ;
alter table HLHT_MJZBL_JZLGBL alter column  hzqxmc varchar(64) not null  ;
alter table HLHT_MJZCF_XYCF alter column  ywgg varchar(36) not null  ;
alter table HLHT_MJZCF_XYCF alter column  ywsycjl numeric(18,3) not null  ;
alter table HLHT_MJZCF_XYCF alter column  ywsyzjl numeric(18,5) not null  ;
alter table HLHT_ZQGZXX_SSTYS alter column  nls numeric(3, 0) not null  ;
alter table HLHT_ZQGZXX_SSTYS alter column  nmzdm varchar(10) not null  ;
alter table HLHT_ZQGZXX_SSTYS alter column  sqzb text not null  ;
alter table HLHT_ZQGZXX_SSTYS alter column  ssywfx text not null  ;
alter table HLHT_ZQGZXX_SSTYS alter column  ssywbfz text not null  ;
alter table HLHT_ZQGZXX_SSTYS alter column  tdfa text not null  ;
alter table HLHT_ZQGZXX_SSTYS alter column  yljgyj text not null  ;
alter table HLHT_ZQGZXX_SSTYS alter column  hzdlryj text not null  ;
alter table HLHT_ZQGZXX_TSJCZLTYS alter column  mjzh varchar(24) not null  ;
alter table HLHT_ZQGZXX_TSJCZLTYS alter column  jczlxmmc varchar(MAX) not null  ;
alter table HLHT_ZQGZXX_TSJCZLTYS alter column  jczlmd varchar(MAX) not null  ;
alter table HLHT_ZQGZXX_TSJCZLTYS alter column  jczlbfz text   ;
alter table HLHT_ZQGZXX_TSJCZLTYS alter column  tdfa text   ;
alter table HLHT_ZYBCJL_SHSCBCJL alter column  ssgc text not null  ;
alter table HLHT_ZYBCJL_SHSCBCJL alter column  zdyjdm text   ;
alter table HLHT_ZYBCJL_SHSCBCJL alter column  zdyj text not null  ;
alter table HLHT_ZYBCJL_SHSCBCJL alter column  zysx text   ;
alter table HLHT_ZYBCJL_SJYSCFJL alter column  cfjl text not null  ;
alter table HLHT_ZYBCJL_SJYSCFJL alter column  yznr text   ;
alter table HLHT_ZYBCJL_SJYSCFJL alter column  zyszgcjg text   ;
alter table HLHT_ZYBCJL_SJYSCFJL alter column  bzlzms text   ;
alter table HLHT_ZYBCJL_SJYSCFJL alter column  yljh text not null  ;
alter table HLHT_ZYBCJL_SQTL alter column  zyzwlbdm varchar(36) not null  ;
alter table HLHT_ZYBCJL_SQTL alter column  sqzb text not null  ;
alter table HLHT_ZYBCJL_SQTL alter column  ssfa text not null  ;
alter table HLHT_ZYBCJL_SQTL alter column  zysx text not null  ;
alter table HLHT_ZYBCJL_SQTL alter column  tlyj text not null  ;
alter table HLHT_ZYBCJL_SQTL alter column  tljl text not null  ;
alter table HLHT_ZYBCJL_SQTL alter column zcrbm varchar(max) not null;
alter table HLHT_ZYBCJL_SQTL alter column zcrxm varchar(max) not null;
alter table HLHT_ZYBCJL_SQTL alter column tlrybm varchar(max) not null;
alter table HLHT_ZYBCJL_SQTL alter column cjtlmd varchar(max) not null;


alter table HLHT_ZYBCJL_SQXJ alter column  blzy varchar(MAX) not null  ;
alter table HLHT_ZYBCJL_SQXJ alter column  sqzdbm varchar(MAX) not null  ;
alter table HLHT_ZYBCJL_SQXJ alter column  sqzdmc varchar(MAX) not null  ;
alter table HLHT_ZYBCJL_SQXJ alter column  zdyj text not null  ;
alter table HLHT_ZYBCJL_SQXJ alter column  gmsbz varchar(10) not null  ;
alter table HLHT_ZYBCJL_SQXJ alter column  gms text   ;
alter table HLHT_ZYBCJL_SQXJ alter column  fzjcjg text not null  ;
alter table HLHT_ZYBCJL_SQXJ alter column  sssyz varchar(MAX) not null  ;
alter table HLHT_ZYBCJL_SQXJ alter column  ssjjz varchar(MAX) not null  ;
alter table HLHT_ZYBCJL_SQXJ alter column  sszz varchar(MAX) not null  ;
alter table HLHT_ZYBCJL_SQXJ alter column  hzyj text   ;
alter table HLHT_ZYBCJL_SQXJ alter column  ssczbm varchar(MAX) not null  ;
alter table HLHT_ZYBCJL_SQXJ alter column  ssczmc varchar(MAX) not null  ;
alter table HLHT_ZYBCJL_SQXJ alter column  zysx text not null  ;
alter table HLHT_ZYBCJL_SQXJ alter column  sqzb text not null  ;
alter table HLHT_ZYBCJL_SWBLTLJL alter column  tldddm varchar(50)   ;
alter table HLHT_ZYBCJL_SWBLTLJL alter column  tlrybm varchar(500) not null  ;
alter table HLHT_ZYBCJL_SWBLTLJL alter column  zyzwlbdm varchar(128) not null  ;
alter table HLHT_ZYBCJL_SWBLTLJL alter column  zyzwlbmc varchar(256) not null  ;
alter table HLHT_ZYBCJL_SWBLTLJL alter column  swtljl text not null  ;
alter table HLHT_ZYBCJL_SWBLTLJL alter column  zcrzjyj text not null  ;
alter table HLHT_BLGY_JBJKXX alter column  jbs text not null  ;
alter table HLHT_BLGY_JBJKXX alter column  crbs text not null  ;
alter table HLHT_BLGY_JBJKXX alter column  yfjzs text not null  ;
alter table HLHT_BLGY_JBJKXX alter column  sss text not null  ;
alter table HLHT_BLGY_JBJKXX alter column  sxs text not null  ;
alter table HLHT_BLGY_JBJKXX alter column  gms text not null  ;
alter table HLHT_BLGY_JBJKXX alter column  grs text not null  ;
alter table HLHT_BLGY_JBJKXX alter column  hys text not null  ;
alter table HLHT_BLGY_JBJKXX alter column  yjs text not null  ;
alter table HLHT_BLGY_JBJKXX alter column  jzs text not null  ;

alter table	HLHT_ZYBCJL_SCBCJL alter column	zs text	 not null 	;
alter table	HLHT_ZYBCJL_SCBCJL alter column	bltd text	 not null 	;
alter table	HLHT_ZYBCJL_SCBCJL alter column	zyszgcjg text		;
alter table	HLHT_ZYBCJL_SCBCJL alter column	zdyj text	 not null 	;
alter table HLHT_ZYBCJL_SCBCJL alter column zdyjdm text;
alter table HLHT_ZYBCJL_SCBCJL alter column czxyzdbm text not null;
alter table HLHT_ZYBCJL_SCBCJL alter column czxyzd text not null;
alter table HLHT_ZYBCJL_SCBCJL alter column czzybmdm text;
alter table HLHT_ZYBCJL_SCBCJL alter column czzybm text;
alter table HLHT_ZYBCJL_SCBCJL alter column czzyzhdm text;
alter table HLHT_ZYBCJL_SCBCJL alter column czzyzh text;
alter table HLHT_ZYBCJL_SCBCJL alter column jzxyzdbm  text not null;
alter table HLHT_ZYBCJL_SCBCJL alter column jzxyzdmc  text not null;
alter table HLHT_ZYBCJL_SCBCJL alter column jzzybmdm text;
alter table HLHT_ZYBCJL_SCBCJL alter column jzzybmmc  text;
alter table HLHT_ZYBCJL_SCBCJL alter column jzzyzhbm text;
alter table HLHT_ZYBCJL_SCBCJL alter column jzzyzhmc  text;
alter table HLHT_ZYBCJL_SCBCJL alter column zfbm  text;
alter table	HLHT_ZYBCJL_SCBCJL alter column	zljh text not null 	;
alter table	HLHT_ZYBCJL_JDXJ	alter column	zs		text	 not null 	;
alter table	HLHT_ZYBCJL_JDXJ	alter column	ryqk		text	 not null 	;
alter table	HLHT_ZYBCJL_JDXJ	alter column	zyszgcjg		text		;
alter table	HLHT_ZYBCJL_JDXJ	alter column	rzxyzdbm		varchar(512)	 not null 	;
alter table	HLHT_ZYBCJL_JDXJ	alter column	rzxyzd		varchar(512)	 not null 	;
alter table	HLHT_ZYBCJL_JDXJ	alter column	rzzybmdm		varchar(256)		;
alter table	HLHT_ZYBCJL_JDXJ	alter column	rzzybm		varchar(256)		;
alter table	HLHT_ZYBCJL_JDXJ	alter column	rzzyzhdm		varchar(256)		;
alter table	HLHT_ZYBCJL_JDXJ	alter column	rzzyzh		varchar(256)		;
alter table	HLHT_ZYBCJL_JDXJ	alter column	yznr		text		;
alter table	HLHT_ZYBCJL_JDXJ	alter column	zlgcms		text		;
alter table	HLHT_ZYBCJL_JDXJ	alter column	mqqk		text	 not null 	;
alter table	HLHT_ZYBCJL_JDXJ	alter column	mqzdxyzdbm		varchar(512)	 not null 	;
alter table	HLHT_ZYBCJL_JDXJ	alter column	mqzdxyzd		varchar(512)	 not null 	;
alter table	HLHT_ZYBCJL_JDXJ	alter column	mqzdzybmdm		varchar(256)		;
alter table	HLHT_ZYBCJL_JDXJ	alter column	mqzdzybm		varchar(256)		;
alter table	HLHT_ZYBCJL_JDXJ	alter column	mqzdzyzhdm		varchar(256)		;
alter table	HLHT_ZYBCJL_JDXJ	alter column	mqzdzyzh		varchar(256)		;
alter table	HLHT_ZYBCJL_JDXJ	alter column	jhzlfa		text	 not null 	;
alter table	HLHT_ZYBCJL_QJJL	alter column	bqbhqk		text	 not null 	;
alter table	HLHT_ZYBCJL_QJJL	alter column	qjcs		text	 not null 	;
alter table	HLHT_ZYBCJL_QJJL	alter column	czff		text	 not null 	;
alter table	HLHT_ZYBCJL_QJJL	alter column	jcjyjg		text		;
alter table	HLHT_ZYBCJL_QJJL	alter column	zysx		text		;
alter table	HLHT_ZYBCJL_QJJL	alter column	zyzwlbdm		varchar(36)		;
alter table	HLHT_ZQGZXX_QTZQTYS	alter column	jbzdbm		varchar(2000)	 not null 	;
alter table	HLHT_ZQGZXX_QTZQTYS	alter column	jbzd		varchar(2000)	 not null 	;
alter table	HLHT_ZQGZXX_QTZQTYS	alter column	zqtynr		text	 not null 	;
alter table	HLHT_ZQGZXX_QTZQTYS	alter column	yljgyj		text	 not null 	;
alter table	HLHT_ZQGZXX_QTZQTYS	alter column	dlryj		text	 not null 	;
alter table	HLHT_ZYBCJL_HZJL	alter column	fzjcjg		text		;
alter table	HLHT_ZYBCJL_HZJL	alter column	zyszgcjg		text		;
alter table	HLHT_ZYBCJL_HZJL	alter column	xyzdmc		varchar(512)	 not null 	;
alter table	HLHT_ZYBCJL_HZJL	alter column	xyzdbm		varchar(512)	 not null 	;
alter table	HLHT_ZYBCJL_HZJL	alter column	zybmdm		varchar(512)		;
alter table	HLHT_ZYBCJL_HZJL	alter column	zybmmc		varchar(512)		;
alter table	HLHT_ZYBCJL_HZJL	alter column	zyzhmc		varchar(512)		;
alter table	HLHT_ZYBCJL_HZJL	alter column	zyzhdm		varchar(512)		;
alter table	HLHT_ZYBCJL_HZJL	alter column	zlgcmc		text	 not null 	;
alter table	HLHT_ZYBCJL_HZJL	alter column	zlgcms		text	 not null 	;
alter table	HLHT_ZYBCJL_HZJL	alter column	hzmd		nvarchar(2000)	 not null 	;
alter table	HLHT_ZYBCJL_HZJL	alter column	hzyj		text	 not null 	;
alter table	HLHT_ZYBCJL_HZJL	alter column	hzsqksdm	nvarchar(20)	 not null 	;
alter table	HLHT_ZYBCJL_HZJL	alter column	hzsqyljgdm	nvarchar(20)	 not null 	;
alter table	HLHT_ZYBCJL_HZJL	alter column	hzsqysdm	nvarchar(20)	 not null 	;
alter table	HLHT_ZYBCJL_HZJL	alter column	hzsqksdm	nvarchar(20)	 not null 	;
alter table	HLHT_ZYBCJL_HZJL	alter column	hzysbm	nvarchar(20)	 not null 	;
alter table	HLHT_ZYBCJL_HZJL	alter column	hzksdm	nvarchar(20)	 not null 	;
alter table	HLHT_ZYBCJL_HZJL	alter column	hzszyljgdm	nvarchar(20)	 not null 	;
alter table	HLHT_ZYBCJL_HZJL	alter column	blgy	nvarchar(3000)	 not null 	;
alter table	HLHT_CYXJ_CYXJ	alter column	ryqk		text	 not null 	;
alter table	HLHT_CYXJ_CYXJ	alter column	yxfzjcjg		text		;
alter table	HLHT_CYXJ_CYXJ	alter column	zyszgcjg		text		;
alter table	HLHT_CYXJ_CYXJ	alter column	rzxyzdbm		varchar(2000)	 not null 	;
alter table	HLHT_CYXJ_CYXJ	alter column	rzxyzd		varchar(2000)	 not null 	;
alter table	HLHT_CYXJ_CYXJ	alter column	rzzybmdm		varchar(2000)		;
alter table	HLHT_CYXJ_CYXJ	alter column	rzzybm		varchar(2000)		;
alter table	HLHT_CYXJ_CYXJ	alter column	rzzyzhdm		varchar(2000)		;
alter table	HLHT_CYXJ_CYXJ	alter column	rzzyzh		varchar(2000)		;
alter table	HLHT_CYXJ_CYXJ	alter column	czxyzdbm		varchar(2000)	 not null 	;
alter table	HLHT_CYXJ_CYXJ	alter column	czxyzd		varchar(2000)	 not null 	;
alter table	HLHT_CYXJ_CYXJ	alter column	czzybmdm		varchar(2000)		;
alter table	HLHT_CYXJ_CYXJ	alter column	czzybm		varchar(2000)		;
alter table	HLHT_CYXJ_CYXJ	alter column	czzyzhdm		varchar(2000)		;
alter table	HLHT_CYXJ_CYXJ	alter column	czzyzh		varchar(2000)		;
alter table	HLHT_CYXJ_CYXJ	alter column	ssqklbdm		varchar(10)	 not null 	;
alter table	HLHT_CYXJ_CYXJ	alter column	qkyhdjdm		varchar(10)	 not null 	;
alter table	HLHT_CYXJ_CYXJ	alter column	ssczbm		varchar(2000)	 not null 	;
alter table	HLHT_CYXJ_CYXJ	alter column	ssjczmc		varchar(2000)	 not null 	;
alter table	HLHT_CYXJ_CYXJ	alter column	zlgcms		text	 not null 	;
alter table	HLHT_CYXJ_CYXJ	alter column	cyqk		text	 not null 	;
alter table	HLHT_CYXJ_CYXJ	alter column	cyzztz		text	 not null 	;
alter table	HLHT_CYXJ_CYXJ	alter column	cyyz		text	 not null 	;
alter table	HLHT_CYXJ_CYXJ	alter column	zljgdm		varchar(20)	 not null 	;
alter table	HLHT_ZYBCJL_ZKJL	alter column	zs		text	 not null 	;
alter table	HLHT_ZYBCJL_ZKJL	alter column	ryqk		text	 not null 	;
alter table	HLHT_ZYBCJL_ZKJL	alter column	zyszgcjg		text		;
alter table	HLHT_ZYBCJL_ZKJL	alter column	rzxyzdbm		varchar(2000)	 not null 	;
alter table	HLHT_ZYBCJL_ZKJL	alter column	rzxyzd		varchar(2000)	 not null 	;
alter table	HLHT_ZYBCJL_ZKJL	alter column	rzzybmdm		varchar(2000)		;
alter table	HLHT_ZYBCJL_ZKJL	alter column	rzzybm		varchar(2000)		;
alter table	HLHT_ZYBCJL_ZKJL	alter column	rzzyzhdm		varchar(2000)		;
alter table	HLHT_ZYBCJL_ZKJL	alter column	rzzyzh		varchar(2000)		;
alter table	HLHT_ZYBCJL_ZKJL	alter column	zlgcms		text	 not null 	;
alter table	HLHT_ZYBCJL_ZKJL	alter column	mqqk		text	 not null 	;
alter table	HLHT_ZYBCJL_ZKJL	alter column	mqzdxyzdbm		varchar(2000)	 not null 	;
alter table	HLHT_ZYBCJL_ZKJL	alter column	mqzdxyzd		varchar(2000)	 not null 	;
alter table	HLHT_ZYBCJL_ZKJL	alter column	mqzdzybmdm		varchar(2000)		;
alter table	HLHT_ZYBCJL_ZKJL	alter column	mqzdzybm		varchar(2000)		;
alter table	HLHT_ZYBCJL_ZKJL	alter column	mqzdzyzhdm		varchar(2000)		;
alter table	HLHT_ZYBCJL_ZKJL	alter column	mqzdzyzh		varchar(2000)		;
alter table	HLHT_ZYBCJL_ZKJL	alter column	zrzljh		text	 not null 	;
alter table	HLHT_ZYBCJL_ZKJL	alter column	zycfyznr		text		;
alter table	HLHT_ZYBCJL_ZKJL	alter column	zysx		text	 not null 	;
alter table	HLHT_ZYBCJL_ZKJL	alter column	zkjllx		varchar(10)	 not null 	;
alter table	HLHT_MJZBL_MJZBL	alter column	gmsbz		varchar(10)	 not null 	;
alter table	HLHT_MJZBL_MJZBL	alter column	gms		text	 not null 	;
alter table	HLHT_MJZBL_MJZBL	alter column	zs		text	 not null 	;
alter table	HLHT_MJZBL_MJZBL	alter column	xbs		text	 not null 	;
alter table	HLHT_MJZBL_MJZBL	alter column	jws		text	 not null 	;
alter table	HLHT_MJZBL_MJZBL	alter column	tgjc		text	 not null 	;
alter table	HLHT_MJZBL_MJZBL	alter column	zyszgcjg		text	 not null 	;
alter table	HLHT_MJZBL_MJZBL	alter column	fzjcjg		text		;
alter table	HLHT_MJZBL_MJZBL	alter column	xyzdbm		varchar(2000)	 not null 	;
alter table	HLHT_MJZBL_MJZBL	alter column	xyzdmc		varchar(2000)	 not null 	;
alter table	HLHT_MJZBL_MJZBL	alter column	zybmdm		varchar(2000)		;
alter table	HLHT_MJZBL_MJZBL	alter column	zybmmc		varchar(2000)		;
alter table	HLHT_MJZBL_MJZBL	alter column	zyzhdm		varchar(2000)		;
alter table	HLHT_MJZBL_MJZBL	alter column	zyzhmc		varchar(2000)		;
alter table	HLHT_ZCJL_PGC	alter column	mzffdm		varchar(10)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	pgcssgc		text	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	zgqk		varchar(1000)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	temcfsdm		varchar(12)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	ysl		numeric(18,0)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	tmwzqkbz		varchar(10)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	rjsz		numeric(18,0)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	qdcdcm		numeric(18,0)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	qdycqkms		varchar	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	cqdxqkbz		varchar(20)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	gqtcycqkbz		varchar(10)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	gqtcjlbz		varchar(10)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	gqtcycqkms		text	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	ssscfqk		text	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	cxlml		numeric(18,0)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	sxlml		numeric(18,0)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	sylml		numeric(18,0)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	gysjmin		numeric(18,0)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	ssqcsjmin		numeric(18,0)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	shjcmin		numeric(18,0)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	chssymmhg		numeric(18,0)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	chszymmhg		numeric(18,0)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	chmbc		numeric(18,0)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	chxlc		numeric(18,0)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	chcxlml		numeric(18,0)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	chgdgdcm		numeric(18,0)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	xsecstzg		numeric(18,0)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	xsecssccm		numeric(18,0)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	jdnzzs		numeric(18,0)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	apgarpfz		numeric(18,0)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	fmjjdm		varchar(20)	 not null 	;
alter table	HLHT_ZCJL_PGC	alter column	xseycqkdm		varchar(20)	 not null 	;
alter table	HLHT_BLGY_WSSJZY	alter column	jzyy		text	 not null 	;
alter table	HLHT_BLGY_WSSJZY	alter column	xyzd		varchar(2000)	 not null 	;
alter table	HLHT_BLGY_WSSJZY	alter column	xyzdmc		varchar(2000)	 not null 	;
alter table	HLHT_BLGY_WSSJZY	alter column	zybm		varchar(2000)		;
alter table	HLHT_BLGY_WSSJZY	alter column	zybmmc		varchar(2000)		;
alter table	HLHT_BLGY_WSSJZY	alter column	zyzh		varchar(2000)		;
alter table	HLHT_BLGY_WSSJZY	alter column	zyzhmc		varchar(2000)		;
alter table	HLHT_BLGY_WSSJZY	alter column	qtxyzd		varchar(2000)		;
alter table	HLHT_BLGY_WSSJZY	alter column	qtxyzdmc		varchar(2000)		;
alter table	HLHT_BLGY_WSSJZY	alter column	ssjcz		varchar(2000)		;
alter table	HLHT_BLGY_WSSJZY	alter column	ssjczmc		varchar(2000)		;
alter table	HLHT_BLGY_WSSJZY	alter column	qtyxcz		text	 not null 	;


alter table	HLHT_MJZCF_ZYCF	alter column	jbzdbm	varchar(500)	not null	;
alter table	HLHT_MJZCF_ZYCF	alter column	jbzd	varchar(1000)	not null	;
alter table	HLHT_MJZCF_ZYCF	alter column	zybmdm	varchar(500)	not null	;
alter table	HLHT_MJZCF_ZYCF	alter column	zybm	varchar(1000)	not null	;
alter table	HLHT_MJZCF_ZYCF	alter column	zyzhdm	varchar(500)	not null	;
alter table	HLHT_MJZCF_ZYCF	alter column	zyzh	varchar(1000)	not null	;
alter table	HLHT_RYJL_JBXX	alter column	mz	varchar(10)		;
alter table	HLHT_RYJL_JBXX	alter column	zylbdm	varchar(10)	not null	;
alter table	HLHT_RYJL_JBXX	alter column	csnrbz	varchar(10)	not null	;
alter table	HLHT_RYJL_JBXX	alter column	zs	text	not null	;
alter table	HLHT_RYJL_JBXX	alter column	xbs	text	not null	;
alter table	HLHT_RYJL_JBXX	alter column	ybjkbz	varchar(10)		;
alter table	HLHT_RYJL_JBXX	alter column	jbs	text		;
alter table	HLHT_RYJL_JBXX	alter column	hzcrbz	varchar(10)	not null	;
alter table	HLHT_RYJL_JBXX	alter column	crbs	text		;
alter table	HLHT_RYJL_JBXX	alter column	yfjzs	text		;
alter table	HLHT_RYJL_JBXX	alter column	sss	text		;
alter table	HLHT_RYJL_JBXX	alter column	sxs	text		;
alter table	HLHT_RYJL_JBXX	alter column	gms	text		;
alter table	HLHT_RYJL_JBXX	alter column	grs	text		;
alter table	HLHT_RYJL_JBXX	alter column	hys	text		;
alter table	HLHT_RYJL_JBXX	alter column	yjs	text		;
alter table	HLHT_RYJL_JBXX	alter column	jzs	text		;
alter table	HLHT_RYJL_JBXX	alter column	tjybjg	text	not null	;
alter table	HLHT_RYJL_JBXX	alter column	tjplmjg	text	not null	;
alter table	HLHT_RYJL_JBXX	alter column	tjqblbjg	text	not null	;
alter table	HLHT_RYJL_JBXX	alter column	tjtbqgjg	text	not null	;
alter table	HLHT_RYJL_JBXX	alter column	tjjbjg	text	not null	;
alter table	HLHT_RYJL_JBXX	alter column	tjxbjg	text	not null	;
alter table	HLHT_RYJL_JBXX	alter column	tjfbjg	text	not null	;
alter table	HLHT_RYJL_JBXX	alter column	tjgmzzjg	text	not null	;
alter table	HLHT_RYJL_JBXX	alter column	tjwszqjg	text	not null	;
alter table	HLHT_RYJL_JBXX	alter column	tjjzjg	text	not null	;
alter table	HLHT_RYJL_JBXX	alter column	tjszjg	text	not null	;
alter table	HLHT_RYJL_JBXX	alter column	tjsjxtjg	text	not null	;
alter table	HLHT_RYJL_JBXX	alter column	zkqk	text		;
alter table	HLHT_RYJL_JBXX	alter column	fzjcjg	text		;
alter table	HLHT_RYJL_JBXX	alter column	zyszgcjg	text		;
alter table	HLHT_RYJL_JBXX	alter column	czxyzdmc	varchar(1000)	not null	;
alter table	HLHT_RYJL_JBXX	alter column	czxyzdbm	varchar(500)	not null	;
alter table	HLHT_RYJL_JBXX	alter column	czzybmdm	varchar(500)		;
alter table	HLHT_RYJL_JBXX	alter column	czzybmmc	varchar(1000)		;
alter table	HLHT_RYJL_JBXX	alter column	czzyzhmc	varchar(1000)		;
alter table	HLHT_RYJL_JBXX	alter column	czzyzhdm	varchar(500)		;
alter table	HLHT_RYJL_JBXX	alter column	xzxyzdmc	varchar(1000)		;
alter table	HLHT_RYJL_JBXX	alter column	xzxyzdbm	varchar(500)		;
alter table	HLHT_RYJL_JBXX	alter column	xzzybmmc	varchar(1000)		;
alter table	HLHT_RYJL_JBXX	alter column	xzzybmdm	varchar(500)		;
alter table	HLHT_RYJL_JBXX	alter column	xzzyzhmc	varchar(1000)		;
alter table	HLHT_RYJL_JBXX	alter column	xzzyzhdm	varchar(500)		;
alter table	HLHT_RYJL_JBXX	alter column	qzxyzdmc	varchar(1000)	not null	;
alter table	HLHT_RYJL_JBXX	alter column	qzxyzdbm	varchar(500)	not null	;
alter table	HLHT_RYJL_JBXX	alter column	qzzybmmc	varchar(1000)		;
alter table	HLHT_RYJL_JBXX	alter column	qzzybmdm	varchar(500)		;
alter table	HLHT_RYJL_JBXX	alter column	qzzyzhmc	varchar(1000)		;
alter table	HLHT_RYJL_JBXX	alter column	qzzyzhdm	varchar(500)		;
alter table	HLHT_RYJL_JBXX	alter column	bzmc	varchar(1000)		;
alter table	HLHT_RYJL_JBXX	alter column	bzbm	varchar(500)		;
alter table HLHT_RYJL_JBXX alter column tjtz numeric(8, 2) not null	;
alter table	HLHT_ZCJL_YDFM	alter column	zdmc	varchar(500)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	qysxz	varchar(500)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	temczcbz	varchar(10)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	zcfs	varchar(500)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	tpmcqk	varchar(500)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	tmwzqkbz	varchar(10)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	ysxz	varchar(500)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	qdycqkbz	varchar(10)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	qdycqkms	varchar(500)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	yfcs	varchar(500)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	cfhyqkbz	varchar(10)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	hyqkwz	varchar(500)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	cfhylscddm	varchar(10)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	cfhylscdmc	varchar(500)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	hyxzcl	varchar(500)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	mzffdm	varchar(10)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	ydlsbz	varchar(10)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	ydxzbz	varchar(10)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	gjlsbz	varchar(10)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	ydzcbz	varchar(10)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	ydzcfs	varchar(500)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	ydxzcl	varchar(500)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	gjfhqk	varchar(500)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	fmgczy	varchar(500)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	gsqk	varchar(500)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	zgqk	varchar(500)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	elzk	varchar(500)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	hyqk	varchar(500)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	xbssgc	varchar(500)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	cqdxqkbz	varchar(10)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	chzdmc	varchar(500)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	xsexbdm	varchar(10)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	aafsm	varchar(10)	not null	;
alter table	HLHT_ZCJL_YDFM	alter column	xseycqkdm	varchar(10)	not null	;
alter table	HLHT_ZLCZJL_MZSHFSJL	alter column	jzlb	varchar(10)	not null	;
alter table	HLHT_ZLCZJL_MZSHFSJL	alter column	xbdm	varchar(10)	not null	;
alter table	HLHT_ZLCZJL_MZSHFSJL	alter column	aboxx	varchar(10)		;
alter table	HLHT_ZLCZJL_MZSHFSJL	alter column	rhxx	varchar(10)		;
alter table	HLHT_ZLCZJL_MZSHFSJL	alter column	sqzdbm	varchar(500)	not null	;
alter table	HLHT_ZLCZJL_MZSHFSJL	alter column	sqzdmc	varchar(1000)	not null	;
alter table	HLHT_ZLCZJL_MZSHFSJL	alter column	shzdbm	varchar(500)	not null	;
alter table	HLHT_ZLCZJL_MZSHFSJL	alter column	shzdmc	varchar(1000)	not null	;
alter table	HLHT_ZLCZJL_MZSHFSJL	alter column	ybzkjcjg	text	not null	;
alter table	HLHT_ZLCZJL_MZSHFSJL	alter column	ssjczbm	varchar(500)	not null	;
alter table	HLHT_ZLCZJL_MZSHFSJL	alter column	ssjczmc	varchar(1000)	not null	;
alter table	HLHT_ZLCZJL_MZSHFSJL	alter column	mzff	varchar(10)	not null	;
alter table	HLHT_ZLCZJL_MZSHFSJL	alter column	mzhfqk	text	not null	;
alter table	HLHT_ZLCZJL_MZSHFSJL	alter column	bcqgcgbz	varchar(10)		;
alter table	HLHT_ZLCZJL_MZSHFSJL	alter column	tsqk	text		;
alter table	HLHT_ZLCZJL_MZSHFSJL	alter column	mzsyz	text	not null	;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	jzlb	varchar(10)	not null	;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	xbdm	varchar(10)	not null	;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	aboxx	varchar(10)	not null	;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	rhxx	varchar(10)	not null	;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	sqzdbm	varchar(500)	not null	;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	sqzdmc	varchar(1000)	not null	;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	nssczbm	varchar(500)	not null	;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	nssczmc	varchar(1000)	not null	;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	nmzffdm	varchar(10)	not null	;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	sqhbjb	text		;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	zysx	text	not null	;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	jybs	text	not null	;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	gms	text		;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	xdtjcjg	text		;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	xbxxjc	text		;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	ctjcjg	text		;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	bcjcjg	text		;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	mricjc	text		;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	fgnjcjg	text		;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	xcgjcjg	text		;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	ncgjcjg	text		;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	nxgnjc	text		;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	ggnjcjg	text		;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	xqfxjc	text		;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	ybzkjc	text		;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	jsztzcbz	varchar(10)		;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	xztzjg	text		;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	fbtzjg	text		;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	szjcjg	text		;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	jzjcjg	text		;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	fbjcjg	text		;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	qgjcjg	text		;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	ycjcjg	text		;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	sqmzyz	text	not null	;
alter table	HLHT_ZLCZJL_MZSQFSJL	alter column	mzsyz	text	not null	;
alter table	HLHT_ZLCZJL_SXJL	alter column	aboxx	varchar(10)	not null	;
alter table	HLHT_ZLCZJL_SXJL	alter column	rhxx	varchar(10)	not null	;
alter table	HLHT_ZLCZJL_SXJL	alter column	sxsbz	varchar(10)	not null	;
alter table	HLHT_ZLCZJL_SXJL	alter column	sxxzdm	varchar(10)	not null	;
alter table	HLHT_ZLCZJL_SXJL	alter column	sqaboxx	varchar(10)	not null	;
alter table	HLHT_ZLCZJL_SXJL	alter column	sqrhxx	varchar(10)	not null	;
alter table	HLHT_ZLCZJL_SXJL	alter column	sxgcjl	text	not null	;
alter table	HLHT_ZLCZJL_SXJL	alter column	sxpzdm	varchar(10)	not null	;
alter table	HLHT_ZLCZJL_SXJL	alter column	sxfybz	varchar(10)	not null	;
alter table	HLHT_ZLCZJL_SXJL	alter column	sxfylx	varchar(10)	not null	;
alter table	HLHT_ZLCZJL_ZLJL	alter column	jbzdbm	varchar(500)	not null	;
alter table	HLHT_ZLCZJL_ZLJL	alter column	jbzd	varchar(1000)	not null	;
alter table	HLHT_ZLCZJL_ZLJL	alter column	cljzdyj	text		;
alter table	HLHT_ZLCZJL_ZLJL	alter column	yczlczbz	varchar(10)		;
alter table	HLHT_ZLCZJL_ZLJL	alter column	czbm	varchar(500)		;
alter table	HLHT_ZLCZJL_ZLJL	alter column	czmc	varchar(1000)		;
alter table	HLHT_ZLCZJL_ZLJL	alter column	czmbbw	varchar(500)		;
alter table	HLHT_ZLCZJL_ZLJL	alter column	czmbbwmc	varchar(1000)		;
alter table	HLHT_ZLCZJL_ZLJL	alter column	jrwdm	varchar(500)		;
alter table	HLHT_ZLCZJL_ZLJL	alter column	jrwmc	varchar(1000)		;
alter table	HLHT_ZLCZJL_ZLJL	alter column	czffms	text		;
alter table	HLHT_ZLCZJL_ZLJL	alter column	ywdm	varchar(500)		;
alter table	HLHT_ZLCZJL_ZLJL	alter column	ywmc	varchar(1000)		;
alter table	HLHT_ZLCZJL_ZLJL	alter column	ywyf	varchar(1000)		;
alter table	HLHT_ZLCZJL_ZLJL	alter column	ywsycjl	numeric(6,2)		;
alter table	HLHT_ZLCZJL_ZLJL	alter column	gmsbz	varchar(10)		;
alter table	HLHT_ZLCZJL_ZLJL	alter column	gms	text		;
alter table	HLHT_ZLCZJL_ZLJL	alter column	yzsybz	text		;
alter table	HLHT_ZLCZJL_ZLJL	alter column	jhzlfa	text		;
alter table	HLHT_ZLCZJL_ZLJL	alter column	sffsdm	varchar(10)		;
alter table	HLHT_ZLCZJL_ZLJL	alter column	sfzqjy	varchar(10)		;
alter table	HLHT_ZQGZXX_BWZTZS	alter column	jbzdbm	varchar(500)	not null	;
alter table	HLHT_ZQGZXX_BWZTZS	alter column	jbzd	varchar(1000)	not null	;
alter table	HLHT_ZQGZXX_BWZTZS	alter column	bqgkjqjcs	text	not null	;
alter table	HLHT_ZQGZXX_BWZTZS	alter column	tznr	text	not null	;
alter table	HLHT_ZQGZXX_BWZTZS	alter column	dlrhzgxdm	varchar(10)		;
alter table	HLHT_ZQGZXX_MZZQTYS	alter column	sqzd	varchar(500)	not null	;
alter table	HLHT_ZQGZXX_MZZQTYS	alter column	sqzdmc	varchar(1000)	not null	;
alter table	HLHT_ZQGZXX_MZZQTYS	alter column	nssbm	varchar(500)		;
alter table	HLHT_ZQGZXX_MZZQTYS	alter column	nssczmc	varchar(1000)		;
alter table	HLHT_ZQGZXX_MZZQTYS	alter column	nmzdm	varchar(10)	not null	;
alter table	HLHT_ZQGZXX_MZZQTYS	alter column	hzjcjb	text		;
alter table	HLHT_ZQGZXX_MZZQTYS	alter column	jcjbmzyx	text		;
alter table	HLHT_ZQGZXX_MZZQTYS	alter column	nycjcff	text		;
alter table	HLHT_ZQGZXX_MZZQTYS	alter column	mzywbfz	text		;
alter table	HLHT_ZQGZXX_MZZQTYS	alter column	mzztb	varchar(10)		;
alter table	HLHT_ZQGZXX_MZZQTYS	alter column	mzaqbx	varchar(10)		;
alter table	HLHT_ZQGZXX_MZZQTYS	alter column	yljgyj	text	not null	;
alter table	HLHT_ZQGZXX_MZZQTYS	alter column	hzdlryj	text	not null	;
alter table	HLHT_ZQGZXX_SXZLTYS	alter column	jbzdbm	varchar(500)	not null	;
alter table	HLHT_ZQGZXX_SXZLTYS	alter column	jbzd	varchar(1000)	not null	;
alter table	HLHT_ZQGZXX_SXZLTYS	alter column	sxsdm	varchar(10)	not null	;
alter table	HLHT_ZQGZXX_SXZLTYS	alter column	sxpzdm	varchar(10)	not null	;
alter table	HLHT_ZQGZXX_SXZLTYS	alter column	sxblhg	text	not null	;
alter table	HLHT_ZQGZXX_SXZLTYS	alter column	yljgyj	text	not null	;
alter table	HLHT_ZQGZXX_SXZLTYS	alter column	hzdlryj	text	not null	;
alter table HLHT_ZQGZXX_SXZLTYS alter column sxqjcjg  varchar(max) not null;
alter table	HLHT_ZYBCJL_CYJL	alter column	ryqk	text	not null	;
alter table	HLHT_ZYBCJL_CYJL	alter column	ryzdbm	varchar(500)	not null	;
alter table	HLHT_ZYBCJL_CYJL	alter column	ryzdmc	varchar(1000)	not null	;
alter table	HLHT_ZYBCJL_CYJL	alter column	yxfzjcjg	text		;
alter table	HLHT_ZYBCJL_CYJL	alter column	zyszjcjg	text		;
alter table	HLHT_ZYBCJL_CYJL	alter column	zlgcms	text	not null	;
alter table	HLHT_ZYBCJL_CYJL	alter column	cyqk	text	not null	;
alter table	HLHT_ZYBCJL_CYJL	alter column	czxyzdmc	varchar(1000)	not null	;
alter table	HLHT_ZYBCJL_CYJL	alter column	czxyzdbm	varchar(500)	not null	;
alter table	HLHT_ZYBCJL_CYJL	alter column	czzybmmc	varchar(1000)		;
alter table	HLHT_ZYBCJL_CYJL	alter column	czzybmdm	varchar(500)		;
alter table	HLHT_ZYBCJL_CYJL	alter column	czzyzhmc	varchar(1000)		;
alter table	HLHT_ZYBCJL_CYJL	alter column	czzyzhdm	varchar(500)		;
alter table	HLHT_ZYBCJL_CYJL	alter column	cyzztz	text	not null	;
alter table	HLHT_ZYBCJL_CYJL	alter column	cyyz	text	not null	;
alter table	HLHT_ZYBCJL_RCBCJL	alter column	zybc	text	not null	;
alter table	HLHT_ZYBCJL_RCBCJL	alter column	yznr	text		;
alter table	HLHT_ZYBCJL_RCBCJL	alter column	zyszgcjg	text		;
alter table	HLHT_ZYBCJL_RCBCJL	alter column	bzlzms	text		;
alter table	HLHT_ZYBCJL_SWJL	alter column	ryzdbm	varchar(500)		;
alter table	HLHT_ZYBCJL_SWJL	alter column	ryzdmc	varchar(1000)		;
alter table	HLHT_ZYBCJL_SWJL	alter column	ryqk	text	not null	;
alter table	HLHT_ZYBCJL_SWJL	alter column	zlgcms	text	not null	;
alter table	HLHT_ZYBCJL_SWJL	alter column	zjswyymc	varchar(1000)	not null	;
alter table	HLHT_ZYBCJL_SWJL	alter column	zjswyybm	varchar(500)	not null	;
alter table	HLHT_ZYBCJL_SWJL	alter column	swzdmc	varchar(1000)	not null	;
alter table	HLHT_ZYBCJL_SWJL	alter column	swzdbm	varchar(500)	not null	;
alter table	HLHT_ZYBCJL_SWJL	alter column	jstysjbz	varchar(10)		;
alter table HLHT_ZYBCJL_SWJL alter column zzjgdm  varchar(50) not null;
alter table	HLHT_ZYBCJL_YNBLTLJL	alter column	tlyj	text	not null	;
alter table	HLHT_ZYBCJL_YNBLTLJL	alter column	zyszgcjg	text		;
alter table	HLHT_ZYBCJL_YNBLTLJL	alter column	bzlzms	text		;
alter table	HLHT_ZYBCJL_YNBLTLJL	alter column	zycfyznr	text		;
alter table	HLHT_ZYBCJL_YNBLTLJL	alter column	zcrzjyj	text		;




--最后收集

alter table HLHT_RYJL_JBXX alter column czxyzdmc  varchar(500) not null;
alter table HLHT_RYJL_JBXX alter column czxyzdbm  varchar(1000) not null;
alter table HLHT_RYJL_JBXX alter column czzybmdm varchar(500) not null;
alter table HLHT_RYJL_JBXX alter column czzybmmc varchar(1000) not null;
alter table HLHT_RYJL_JBXX alter column czzyzhmc varchar(1000) not null;
alter table HLHT_RYJL_JBXX alter column czzyzhdm varchar(500) not null;
alter table HLHT_RYJL_JBXX alter column xzxyzdmc varchar(1000) not null;
alter table HLHT_RYJL_JBXX alter column xzxyzdbm   varchar(500) not null;
alter table HLHT_RYJL_JBXX alter column xzzybmmc varchar(1000) not null;
alter table HLHT_RYJL_JBXX alter column xzzybmdm varchar(500) not null;
alter table HLHT_RYJL_JBXX alter column xzzyzhmc varchar(1000) not null;
alter table HLHT_RYJL_JBXX alter column xzzyzhdm varchar(500) not null;
alter table HLHT_RYJL_JBXX alter column qzxyzdmc  varchar(1000) not null;
alter table HLHT_RYJL_JBXX alter column qzxyzdbm  varchar(500) not null;
alter table HLHT_RYJL_JBXX alter column qzzybmmc varchar(1000) not null;
alter table HLHT_RYJL_JBXX alter column qzzybmdm varchar(500) not null;
alter table HLHT_RYJL_JBXX alter column qzzyzhmc varchar(1000) not null;
alter table HLHT_RYJL_JBXX alter column qzzyzhdm varchar(500) not null;
alter table HLHT_RYJL_JBXX alter column bzmc varchar(1000) not null;
alter table HLHT_RYJL_JBXX alter column bzbm varchar(500) not null;
alter table HLHT_ZQGZXX_TSJCZLTYS alter column mjzh varchar(24) not null;
alter table HLHT_ZYBCJL_YNBLTLJL alter column tlrybm varchar(500);
alter table HLHT_ZLCZJL_YBSSJL alter column mzff varchar(30) not null;
alter table HLHT_ZLCZJL_YBSSJL alter column sstw varchar(30) not null;
alter table HLHT_ZLCZJL_YBSSJL alter column mzysbm varchar(50) not null;

alter table HLHT_ZYBCJL_SQTL alter column zcrbm varchar(max) not null;
alter table HLHT_ZYBCJL_SQTL alter column zcrxm varchar(max) not null;
alter table HLHT_ZYBCJL_SQTL alter column tlrybm varchar(max) not null;
alter table HLHT_ZYBCJL_SQTL alter column cjtlmd varchar(max) not null;

alter table HLHT_ZYBCJL_SHSCBCJL alter column mzffdm  varchar(500) not null;
alter table HLHT_ZYBCJL_SHSCBCJL alter column mzffmc  varchar(500) not null;
alter table HLHT_ZYBCJL_SHSCBCJL alter column shzdmc  varchar(500) not null;
alter table HLHT_ZYBCJL_SHSCBCJL alter column shzdbm  varchar(500) not null;
alter table HLHT_ZYBCJL_SHSCBCJL alter column ssczbm  varchar(500) not null;
alter table HLHT_ZYBCJL_SHSCBCJL alter column ssmc  varchar(500) not null;
alter table HLHT_ZYBCJL_SHSCBCJL alter column ssmbbwdm  varchar(500) not null;
alter table HLHT_ZYBCJL_SHSCBCJL alter column ssbwmc  varchar(500) not null;

alter table HLHT_ZYBCJL_SQTL alter column sqzdbm varchar(500) not null;
alter table HLHT_ZYBCJL_SQTL alter column sqzdmc varchar(1000) not null;
alter table HLHT_ZYBCJL_SQTL alter column sszz varchar(max) not null;

alter table HLHT_ZYBCJL_HZJL alter column blgy varchar(max) not null;

alter table HLHT_ZYBCJL_YNBLTLJL alter column tldddm 	varchar(50) not null;
alter table  HLHT_RYJL_RCYJL alter column 	rzzyzhdm varchar(500);
alter table  HLHT_RYJL_RCYJL alter column 	rzzyzhmc varchar(1000);
ALTER TABLE HLHT_ZQGZXX_TSJCZLTYS ALTER COLUMN  jbzd varchar(1000) not null;
ALTER TABLE HLHT_ZQGZXX_TSJCZLTYS ALTER COLUMN  jbzdbm varchar(500) not null;

ALTER TABLE  HLHT_ZQGZXX_SSTYS ALTER COLUMN  nssbm varchar(500) not null;
ALTER TABLE  HLHT_ZQGZXX_SSTYS ALTER COLUMN  ssfs varchar(128)  not null;
ALTER TABLE HLHT_MJZBL_JZLGBL ALTER COLUMN  tgjc varchar(max) not null;