package com.winning.hic.model;

import java.io.Serializable; 

import org.apache.ibatis.type.Alias; 

import com.winning.hic.model.BaseDomain;



/**
 * @author HLHT
 * @title 
 * @email Winning Health
 * @package com.winning.hic.model
 * @date 2018-42-21 09:42:16
 */
@Alias("outpOrder")
public class OutpOrder extends BaseDomain implements Serializable {

    private static final long serialVersionUID = -1L;

    /**
     * 字段名：XH
     * 备注: 
     * 默认值：无
     */
    private Long xh;
    /**
     * 字段名：GHXH
     * 备注: 
     * 默认值：无
     */
    private Long ghxh;
    /**
     * 字段名：PATID
     * 备注: 
     * 默认值：无
     */
    private Long patid;
    /**
     * 字段名：HZXM
     * 备注: 
     * 默认值：无
     */
    private String hzxm;
    /**
     * 字段名：PY
     * 备注: 
     * 默认值：无
     */
    private String py;
    /**
     * 字段名：WB
     * 备注: 
     * 默认值：无
     */
    private String wb;
    /**
     * 字段名：YSDM
     * 备注: 
     * 默认值：无
     */
    private String ysdm;
    /**
     * 字段名：YSMC
     * 备注: 
     * 默认值：无
     */
    private String ysmc;
    /**
     * 字段名：KSDM
     * 备注: 
     * 默认值：无
     */
    private String ksdm;
    /**
     * 字段名：KSMC
     * 备注: 
     * 默认值：无
     */
    private String ksmc;
    /**
     * 字段名：YFDM
     * 备注: 
     * 默认值：无
     */
    private String yfdm;
    /**
     * 字段名：YFMC
     * 备注: 
     * 默认值：无
     */
    private String yfmc;
    /**
     * 字段名：CFTS
     * 备注: 
     * 默认值：无
     */
    private Integer cfts;
    /**
     * 字段名：CYDJS
     * 备注: 
     * 默认值：无
     */
    private Integer cydjs;
    /**
     * 字段名：YZZT
     * 备注: 
     * 默认值：无
     */
    private Integer yzzt;
    /**
     * 字段名：JLZT
     * 备注: 
     * 默认值：无
     */
    private Integer jlzt;
    /**
     * 字段名：CFLX
     * 备注: 
     * 默认值：无
     */
    private Integer cflx;
    /**
     * 字段名：CFZDDM
     * 备注: 
     * 默认值：无
     */
    private String cfzddm;
    /**
     * 字段名：CFZDMC
     * 备注: 
     * 默认值：无
     */
    private String cfzdmc;
    /**
     * 字段名：CYYPYF
     * 备注: 
     * 默认值：无
     */
    private String cyypyf;
    /**
     * 字段名：CYYFMC
     * 备注: 
     * 默认值：无
     */
    private String cyyfmc;
    /**
     * 字段名：SYCFBZ
     * 备注: 
     * 默认值：无
     */
    private Integer sycfbz;
    /**
     * 字段名：TSCFBZ
     * 备注: 
     * 默认值：无
     */
    private Integer tscfbz;
    /**
     * 字段名：EKCFBZ
     * 备注: 
     * 默认值：无
     */
    private Integer ekcfbz;
    /**
     * 字段名：EKTZ
     * 备注: 
     * 默认值：无
     */
    private String ektz;
    /**
     * 字段名：DMJSBZ
     * 备注: 
     * 默认值：无
     */
    private Integer dmjsbz;
    /**
     * 字段名：SHBZ
     * 备注: 
     * 默认值：无
     */
    private Integer shbz;
    /**
     * 字段名：YBSHBZ
     * 备注: 
     * 默认值：无
     */
    private Integer ybshbz;
    /**
     * 字段名：ZFCFBZ
     * 备注: 
     * 默认值：无
     */
    private Boolean zfcfbz;
    /**
     * 字段名：JSDJFBZ
     * 备注: 
     * 默认值：无
     */
    private Boolean jsdjfbz;
    /**
     * 字段名：CZYH
     * 备注: 
     * 默认值：无
     */
    private String czyh;
    /**
     * 字段名：LRRQ
     * 备注: 
     * 默认值：无
     */
    private String lrrq;
    /**
     * 字段名：XSMC
     * 备注: 
     * 默认值：无
     */
    private String xsmc;
    /**
     * 字段名：MEMO
     * 备注: 
     * 默认值：无
     */
    private String memo;
    /**
     * 字段名：FAXH
     * 备注: 
     * 默认值：无
     */
    private Long faxh;
    /**
     * 字段名：SFBZ
     * 备注: 
     * 默认值：无
     */
    private String sfbz;
    /**
     * 字段名：QYID
     * 备注: 
     * 默认值：无
     */
    private String qyid;
    /**
     * 字段名：BMBZ
     * 备注: 
     * 默认值：无
     */
    private Boolean bmbz;
    /**
     * 字段名：TBZDDM
     * 备注: 
     * 默认值：无
     */
    private String tbzddm;
    /**
     * 字段名：TBZDMC
     * 备注: 
     * 默认值：无
     */
    private String tbzdmc;
    /**
     * 字段名：PYDYBZ
     * 备注: 
     * 默认值：无
     */
    private Integer pydybz;
    /**
     * 字段名：YLLB
     * 备注: 
     * 默认值：无
     */
    private String yllb;
    /**
     * 字段名：YBBFZDM
     * 备注: 
     * 默认值：无
     */
    private String ybbfzdm;
    /**
     * 字段名：EKNLSM
     * 备注: 
     * 默认值：无
     */
    private String eknlsm;
    /**
     * 字段名：CYMRJL
     * 备注: 
     * 默认值：无
     */
    private Integer cymrjl;
    /**
     * 字段名：CYCYJX
     * 备注: 
     * 默认值：无
     */
    private String cycyjx;
    /**
     * 字段名：CYFYCS
     * 备注: 
     * 默认值：无
     */
    private Integer cyfycs;
    /**
     * 字段名：CYYYFF
     * 备注: 
     * 默认值：无
     */
    private String cyyyff;
    /**
     * 字段名：CYFYYQ
     * 备注: 
     * 默认值：无
     */
    private String cyfyyq;
    /**
     * 字段名：CYCYJXDM
     * 备注: 
     * 默认值：无
     */
    private String cycyjxdm;
    /**
     * 字段名：CYYYFFDM
     * 备注: 
     * 默认值：无
     */
    private String cyyyffdm;
    /**
     * 字段名：CYFYYQDM
     * 备注: 
     * 默认值：无
     */
    private String cyfyyqdm;
    /**
     * 字段名：WSBZ
     * 备注: 
     * 默认值：无
     */
    private Boolean wsbz;
    /**
     * 字段名：LSBZ
     * 备注: 
     * 默认值：无
     */
    private Boolean lsbz;
    /**
     * 字段名：TZSJ
     * 备注: 
     * 默认值：无
     */
    private String tzsj;
    /**
     * 字段名：CQCFXH
     * 备注: 
     * 默认值：无
     */
    private Long cqcfxh;
    /**
     * 字段名：LGBZ
     * 备注: 
     * 默认值：无
     */
    private Boolean lgbz;
    /**
     * 字段名：OLDXH
     * 备注: 
     * 默认值：无
     */
    private Long oldxh;
    /**
     * 字段名：ZFDM
     * 备注: 
     * 默认值：无
     */
    private String zfdm;
    /**
     * 字段名：ZFMC
     * 备注: 
     * 默认值：无
     */
    private String zfmc;
    /**
     * 字段名：CFYYTS
     * 备注: 
     * 默认值：无
     */
    private Integer cfyyts;
    /**
     * 字段名：CYRYCS
     * 备注: 
     * 默认值：无
     */
    private Integer cyrycs;
    /**
     * 字段名：CYDJTS
     * 备注: 
     * 默认值：无
     */
    private Integer cydjts;
    /**
     * 字段名：CYJZZL
     * 备注: 
     * 默认值：无
     */
    private Integer cyjzzl;
    /**
     * 字段名：JLDW
     * 备注: 
     * 默认值：无
     */
    private String jldw;
    /**
     * 字段名：UKBZ
     * 备注: 
     * 默认值：无
     */
    private Boolean ukbz;
    /**
     * 字段名：XDFXH
     * 备注: 
     * 默认值：无
     */
    private Long xdfxh;
    /**
     * 字段名：QJBZ
     * 备注: 
     * 默认值：无
     */
    private Boolean qjbz;
    /**
     * 字段名：SHBZ8
     * 备注: 
     * 默认值：无
     */
    private Integer shbz8;
    /**
     * 字段名：CCFBZ
     * 备注: 
     * 默认值：无
     */
    private Boolean ccfbz;
    /**
     * 字段名：JCCFBZ
     * 备注: 
     * 默认值：无
     */
    private Boolean jccfbz;
    /**
     * 字段名：DJFS
     * 备注: 
     * 默认值：无
     */
    private Integer djfs;
    /**
     * 字段名：MBBZ
     * 备注: 
     * 默认值：无
     */
    private Boolean mbbz;
    /**
     * 字段名：XDFMC
     * 备注: 
     * 默认值：无
     */
    private String xdfmc;
    /**
     * 字段名：GSBZ
     * 备注: 
     * 默认值：无
     */
    private Boolean gsbz;
    /**
     * 字段名：LXBZ
     * 备注: 
     * 默认值：无
     */
    private Boolean lxbz;
    /**
     * 字段名：MXBSHBZ
     * 备注: 
     * 默认值：无
     */
    private Integer mxbshbz;
    /**
     * 字段名：SHBTGYY
     * 备注: 
     * 默认值：无
     */
    private String shbtgyy;
    /**
     * 字段名：LDSQDXH
     * 备注: 
     * 默认值：无
     */
    private Long ldsqdxh;
    /**
     * 字段名：XZLB
     * 备注: 
     * 默认值：无
     */
    private Integer xzlb;
    /**
     * 字段名：BFZBZ
     * 备注: 
     * 默认值：无
     */
    private Integer bfzbz;
    /**
     * 字段名：SYYLLB
     * 备注: 
     * 默认值：无
     */
    private String syyllb;
    /**
     * 字段名：SYLBDM
     * 备注: 
     * 默认值：无
     */
    private String sylbdm;
    /**
     * 字段名：SYLBMC
     * 备注: 
     * 默认值：无
     */
    private String sylbmc;
    /**
     * 字段名：SYZDDM
     * 备注: 
     * 默认值：无
     */
    private String syzddm;
    /**
     * 字段名：SYZDMC
     * 备注: 
     * 默认值：无
     */
    private String syzdmc;
    /**
     * 字段名：BFZ
     * 备注: 
     * 默认值：无
     */
    private String bfz;
    /**
     * 字段名：ZZRSLX
     * 备注: 
     * 默认值：无
     */
    private String zzrslx;
    /**
     * 字段名：SYSJ
     * 备注: 
     * 默认值：无
     */
    private String sysj;
    /**
     * 字段名：YCBJYJCXMDM
     * 备注: 
     * 默认值：无
     */
    private String ycbjyjcxmdm;
    /**
     * 字段名：YCBJYJCXMMC
     * 备注: 
     * 默认值：无
     */
    private String ycbjyjcxmmc;
    /**
     * 字段名：SYFWZH
     * 备注: 
     * 默认值：无
     */
    private String syfwzh;
    /**
     * 字段名：JHZH
     * 备注: 
     * 默认值：无
     */
    private String jhzh;
    /**
     * 字段名：BZLB
     * 备注: 
     * 默认值：无
     */
    private String bzlb;
    /**
     * 字段名：BZDM
     * 备注: 
     * 默认值：无
     */
    private String bzdm;
    /**
     * 字段名：BZMC
     * 备注: 
     * 默认值：无
     */
    private String bzmc;
    /**
     * 字段名：CYYDSL
     * 备注: 
     * 默认值：无
     */
    private Integer cyydsl;
    /**
     * 字段名：KDBZ
     * 备注: 
     * 默认值：无
     */
    private Boolean kdbz;
    /**
     * 字段名：CYXZFS
     * 备注: 
     * 默认值：无
     */
    private Integer cyxzfs;

    public OutpOrder (){

    }

   /**
   * 字段名：XH
   * get方法
   * 备注: 
   */
   public Long getXh(){

        return xh;
   }

   /**
   * 字段名：XH
   * set方法
   * 备注: 
   */
   public void setXh(Long xh){
        this.xh = xh;
   }
   /**
   * 字段名：GHXH
   * get方法
   * 备注: 
   */
   public Long getGhxh(){

        return ghxh;
   }

   /**
   * 字段名：GHXH
   * set方法
   * 备注: 
   */
   public void setGhxh(Long ghxh){
        this.ghxh = ghxh;
   }
   /**
   * 字段名：PATID
   * get方法
   * 备注: 
   */
   public Long getPatid(){

        return patid;
   }

   /**
   * 字段名：PATID
   * set方法
   * 备注: 
   */
   public void setPatid(Long patid){
        this.patid = patid;
   }
   /**
   * 字段名：HZXM
   * get方法
   * 备注: 
   */
   public String getHzxm(){

        return hzxm;
   }

   /**
   * 字段名：HZXM
   * set方法
   * 备注: 
   */
   public void setHzxm(String hzxm){
        this.hzxm = hzxm;
   }
   /**
   * 字段名：PY
   * get方法
   * 备注: 
   */
   public String getPy(){

        return py;
   }

   /**
   * 字段名：PY
   * set方法
   * 备注: 
   */
   public void setPy(String py){
        this.py = py;
   }
   /**
   * 字段名：WB
   * get方法
   * 备注: 
   */
   public String getWb(){

        return wb;
   }

   /**
   * 字段名：WB
   * set方法
   * 备注: 
   */
   public void setWb(String wb){
        this.wb = wb;
   }
   /**
   * 字段名：YSDM
   * get方法
   * 备注: 
   */
   public String getYsdm(){

        return ysdm;
   }

   /**
   * 字段名：YSDM
   * set方法
   * 备注: 
   */
   public void setYsdm(String ysdm){
        this.ysdm = ysdm;
   }
   /**
   * 字段名：YSMC
   * get方法
   * 备注: 
   */
   public String getYsmc(){

        return ysmc;
   }

   /**
   * 字段名：YSMC
   * set方法
   * 备注: 
   */
   public void setYsmc(String ysmc){
        this.ysmc = ysmc;
   }
   /**
   * 字段名：KSDM
   * get方法
   * 备注: 
   */
   public String getKsdm(){

        return ksdm;
   }

   /**
   * 字段名：KSDM
   * set方法
   * 备注: 
   */
   public void setKsdm(String ksdm){
        this.ksdm = ksdm;
   }
   /**
   * 字段名：KSMC
   * get方法
   * 备注: 
   */
   public String getKsmc(){

        return ksmc;
   }

   /**
   * 字段名：KSMC
   * set方法
   * 备注: 
   */
   public void setKsmc(String ksmc){
        this.ksmc = ksmc;
   }
   /**
   * 字段名：YFDM
   * get方法
   * 备注: 
   */
   public String getYfdm(){

        return yfdm;
   }

   /**
   * 字段名：YFDM
   * set方法
   * 备注: 
   */
   public void setYfdm(String yfdm){
        this.yfdm = yfdm;
   }
   /**
   * 字段名：YFMC
   * get方法
   * 备注: 
   */
   public String getYfmc(){

        return yfmc;
   }

   /**
   * 字段名：YFMC
   * set方法
   * 备注: 
   */
   public void setYfmc(String yfmc){
        this.yfmc = yfmc;
   }
   /**
   * 字段名：CFTS
   * get方法
   * 备注: 
   */
   public Integer getCfts(){

        return cfts;
   }

   /**
   * 字段名：CFTS
   * set方法
   * 备注: 
   */
   public void setCfts(Integer cfts){
        this.cfts = cfts;
   }
   /**
   * 字段名：CYDJS
   * get方法
   * 备注: 
   */
   public Integer getCydjs(){

        return cydjs;
   }

   /**
   * 字段名：CYDJS
   * set方法
   * 备注: 
   */
   public void setCydjs(Integer cydjs){
        this.cydjs = cydjs;
   }
   /**
   * 字段名：YZZT
   * get方法
   * 备注: 
   */
   public Integer getYzzt(){

        return yzzt;
   }

   /**
   * 字段名：YZZT
   * set方法
   * 备注: 
   */
   public void setYzzt(Integer yzzt){
        this.yzzt = yzzt;
   }
   /**
   * 字段名：JLZT
   * get方法
   * 备注: 
   */
   public Integer getJlzt(){

        return jlzt;
   }

   /**
   * 字段名：JLZT
   * set方法
   * 备注: 
   */
   public void setJlzt(Integer jlzt){
        this.jlzt = jlzt;
   }
   /**
   * 字段名：CFLX
   * get方法
   * 备注: 
   */
   public Integer getCflx(){

        return cflx;
   }

   /**
   * 字段名：CFLX
   * set方法
   * 备注: 
   */
   public void setCflx(Integer cflx){
        this.cflx = cflx;
   }
   /**
   * 字段名：CFZDDM
   * get方法
   * 备注: 
   */
   public String getCfzddm(){

        return cfzddm;
   }

   /**
   * 字段名：CFZDDM
   * set方法
   * 备注: 
   */
   public void setCfzddm(String cfzddm){
        this.cfzddm = cfzddm;
   }
   /**
   * 字段名：CFZDMC
   * get方法
   * 备注: 
   */
   public String getCfzdmc(){

        return cfzdmc;
   }

   /**
   * 字段名：CFZDMC
   * set方法
   * 备注: 
   */
   public void setCfzdmc(String cfzdmc){
        this.cfzdmc = cfzdmc;
   }
   /**
   * 字段名：CYYPYF
   * get方法
   * 备注: 
   */
   public String getCyypyf(){

        return cyypyf;
   }

   /**
   * 字段名：CYYPYF
   * set方法
   * 备注: 
   */
   public void setCyypyf(String cyypyf){
        this.cyypyf = cyypyf;
   }
   /**
   * 字段名：CYYFMC
   * get方法
   * 备注: 
   */
   public String getCyyfmc(){

        return cyyfmc;
   }

   /**
   * 字段名：CYYFMC
   * set方法
   * 备注: 
   */
   public void setCyyfmc(String cyyfmc){
        this.cyyfmc = cyyfmc;
   }
   /**
   * 字段名：SYCFBZ
   * get方法
   * 备注: 
   */
   public Integer getSycfbz(){

        return sycfbz;
   }

   /**
   * 字段名：SYCFBZ
   * set方法
   * 备注: 
   */
   public void setSycfbz(Integer sycfbz){
        this.sycfbz = sycfbz;
   }
   /**
   * 字段名：TSCFBZ
   * get方法
   * 备注: 
   */
   public Integer getTscfbz(){

        return tscfbz;
   }

   /**
   * 字段名：TSCFBZ
   * set方法
   * 备注: 
   */
   public void setTscfbz(Integer tscfbz){
        this.tscfbz = tscfbz;
   }
   /**
   * 字段名：EKCFBZ
   * get方法
   * 备注: 
   */
   public Integer getEkcfbz(){

        return ekcfbz;
   }

   /**
   * 字段名：EKCFBZ
   * set方法
   * 备注: 
   */
   public void setEkcfbz(Integer ekcfbz){
        this.ekcfbz = ekcfbz;
   }
   /**
   * 字段名：EKTZ
   * get方法
   * 备注: 
   */
   public String getEktz(){

        return ektz;
   }

   /**
   * 字段名：EKTZ
   * set方法
   * 备注: 
   */
   public void setEktz(String ektz){
        this.ektz = ektz;
   }
   /**
   * 字段名：DMJSBZ
   * get方法
   * 备注: 
   */
   public Integer getDmjsbz(){

        return dmjsbz;
   }

   /**
   * 字段名：DMJSBZ
   * set方法
   * 备注: 
   */
   public void setDmjsbz(Integer dmjsbz){
        this.dmjsbz = dmjsbz;
   }
   /**
   * 字段名：SHBZ
   * get方法
   * 备注: 
   */
   public Integer getShbz(){

        return shbz;
   }

   /**
   * 字段名：SHBZ
   * set方法
   * 备注: 
   */
   public void setShbz(Integer shbz){
        this.shbz = shbz;
   }
   /**
   * 字段名：YBSHBZ
   * get方法
   * 备注: 
   */
   public Integer getYbshbz(){

        return ybshbz;
   }

   /**
   * 字段名：YBSHBZ
   * set方法
   * 备注: 
   */
   public void setYbshbz(Integer ybshbz){
        this.ybshbz = ybshbz;
   }
   /**
   * 字段名：ZFCFBZ
   * get方法
   * 备注: 
   */
   public Boolean getZfcfbz(){

        return zfcfbz;
   }

   /**
   * 字段名：ZFCFBZ
   * set方法
   * 备注: 
   */
   public void setZfcfbz(Boolean zfcfbz){
        this.zfcfbz = zfcfbz;
   }
   /**
   * 字段名：JSDJFBZ
   * get方法
   * 备注: 
   */
   public Boolean getJsdjfbz(){

        return jsdjfbz;
   }

   /**
   * 字段名：JSDJFBZ
   * set方法
   * 备注: 
   */
   public void setJsdjfbz(Boolean jsdjfbz){
        this.jsdjfbz = jsdjfbz;
   }
   /**
   * 字段名：CZYH
   * get方法
   * 备注: 
   */
   public String getCzyh(){

        return czyh;
   }

   /**
   * 字段名：CZYH
   * set方法
   * 备注: 
   */
   public void setCzyh(String czyh){
        this.czyh = czyh;
   }
   /**
   * 字段名：LRRQ
   * get方法
   * 备注: 
   */
   public String getLrrq(){

        return lrrq;
   }

   /**
   * 字段名：LRRQ
   * set方法
   * 备注: 
   */
   public void setLrrq(String lrrq){
        this.lrrq = lrrq;
   }
   /**
   * 字段名：XSMC
   * get方法
   * 备注: 
   */
   public String getXsmc(){

        return xsmc;
   }

   /**
   * 字段名：XSMC
   * set方法
   * 备注: 
   */
   public void setXsmc(String xsmc){
        this.xsmc = xsmc;
   }
   /**
   * 字段名：MEMO
   * get方法
   * 备注: 
   */
   public String getMemo(){

        return memo;
   }

   /**
   * 字段名：MEMO
   * set方法
   * 备注: 
   */
   public void setMemo(String memo){
        this.memo = memo;
   }
   /**
   * 字段名：FAXH
   * get方法
   * 备注: 
   */
   public Long getFaxh(){

        return faxh;
   }

   /**
   * 字段名：FAXH
   * set方法
   * 备注: 
   */
   public void setFaxh(Long faxh){
        this.faxh = faxh;
   }
   /**
   * 字段名：SFBZ
   * get方法
   * 备注: 
   */
   public String getSfbz(){

        return sfbz;
   }

   /**
   * 字段名：SFBZ
   * set方法
   * 备注: 
   */
   public void setSfbz(String sfbz){
        this.sfbz = sfbz;
   }
   /**
   * 字段名：QYID
   * get方法
   * 备注: 
   */
   public String getQyid(){

        return qyid;
   }

   /**
   * 字段名：QYID
   * set方法
   * 备注: 
   */
   public void setQyid(String qyid){
        this.qyid = qyid;
   }
   /**
   * 字段名：BMBZ
   * get方法
   * 备注: 
   */
   public Boolean getBmbz(){

        return bmbz;
   }

   /**
   * 字段名：BMBZ
   * set方法
   * 备注: 
   */
   public void setBmbz(Boolean bmbz){
        this.bmbz = bmbz;
   }
   /**
   * 字段名：TBZDDM
   * get方法
   * 备注: 
   */
   public String getTbzddm(){

        return tbzddm;
   }

   /**
   * 字段名：TBZDDM
   * set方法
   * 备注: 
   */
   public void setTbzddm(String tbzddm){
        this.tbzddm = tbzddm;
   }
   /**
   * 字段名：TBZDMC
   * get方法
   * 备注: 
   */
   public String getTbzdmc(){

        return tbzdmc;
   }

   /**
   * 字段名：TBZDMC
   * set方法
   * 备注: 
   */
   public void setTbzdmc(String tbzdmc){
        this.tbzdmc = tbzdmc;
   }
   /**
   * 字段名：PYDYBZ
   * get方法
   * 备注: 
   */
   public Integer getPydybz(){

        return pydybz;
   }

   /**
   * 字段名：PYDYBZ
   * set方法
   * 备注: 
   */
   public void setPydybz(Integer pydybz){
        this.pydybz = pydybz;
   }
   /**
   * 字段名：YLLB
   * get方法
   * 备注: 
   */
   public String getYllb(){

        return yllb;
   }

   /**
   * 字段名：YLLB
   * set方法
   * 备注: 
   */
   public void setYllb(String yllb){
        this.yllb = yllb;
   }
   /**
   * 字段名：YBBFZDM
   * get方法
   * 备注: 
   */
   public String getYbbfzdm(){

        return ybbfzdm;
   }

   /**
   * 字段名：YBBFZDM
   * set方法
   * 备注: 
   */
   public void setYbbfzdm(String ybbfzdm){
        this.ybbfzdm = ybbfzdm;
   }
   /**
   * 字段名：EKNLSM
   * get方法
   * 备注: 
   */
   public String getEknlsm(){

        return eknlsm;
   }

   /**
   * 字段名：EKNLSM
   * set方法
   * 备注: 
   */
   public void setEknlsm(String eknlsm){
        this.eknlsm = eknlsm;
   }
   /**
   * 字段名：CYMRJL
   * get方法
   * 备注: 
   */
   public Integer getCymrjl(){

        return cymrjl;
   }

   /**
   * 字段名：CYMRJL
   * set方法
   * 备注: 
   */
   public void setCymrjl(Integer cymrjl){
        this.cymrjl = cymrjl;
   }
   /**
   * 字段名：CYCYJX
   * get方法
   * 备注: 
   */
   public String getCycyjx(){

        return cycyjx;
   }

   /**
   * 字段名：CYCYJX
   * set方法
   * 备注: 
   */
   public void setCycyjx(String cycyjx){
        this.cycyjx = cycyjx;
   }
   /**
   * 字段名：CYFYCS
   * get方法
   * 备注: 
   */
   public Integer getCyfycs(){

        return cyfycs;
   }

   /**
   * 字段名：CYFYCS
   * set方法
   * 备注: 
   */
   public void setCyfycs(Integer cyfycs){
        this.cyfycs = cyfycs;
   }
   /**
   * 字段名：CYYYFF
   * get方法
   * 备注: 
   */
   public String getCyyyff(){

        return cyyyff;
   }

   /**
   * 字段名：CYYYFF
   * set方法
   * 备注: 
   */
   public void setCyyyff(String cyyyff){
        this.cyyyff = cyyyff;
   }
   /**
   * 字段名：CYFYYQ
   * get方法
   * 备注: 
   */
   public String getCyfyyq(){

        return cyfyyq;
   }

   /**
   * 字段名：CYFYYQ
   * set方法
   * 备注: 
   */
   public void setCyfyyq(String cyfyyq){
        this.cyfyyq = cyfyyq;
   }
   /**
   * 字段名：CYCYJXDM
   * get方法
   * 备注: 
   */
   public String getCycyjxdm(){

        return cycyjxdm;
   }

   /**
   * 字段名：CYCYJXDM
   * set方法
   * 备注: 
   */
   public void setCycyjxdm(String cycyjxdm){
        this.cycyjxdm = cycyjxdm;
   }
   /**
   * 字段名：CYYYFFDM
   * get方法
   * 备注: 
   */
   public String getCyyyffdm(){

        return cyyyffdm;
   }

   /**
   * 字段名：CYYYFFDM
   * set方法
   * 备注: 
   */
   public void setCyyyffdm(String cyyyffdm){
        this.cyyyffdm = cyyyffdm;
   }
   /**
   * 字段名：CYFYYQDM
   * get方法
   * 备注: 
   */
   public String getCyfyyqdm(){

        return cyfyyqdm;
   }

   /**
   * 字段名：CYFYYQDM
   * set方法
   * 备注: 
   */
   public void setCyfyyqdm(String cyfyyqdm){
        this.cyfyyqdm = cyfyyqdm;
   }
   /**
   * 字段名：WSBZ
   * get方法
   * 备注: 
   */
   public Boolean getWsbz(){

        return wsbz;
   }

   /**
   * 字段名：WSBZ
   * set方法
   * 备注: 
   */
   public void setWsbz(Boolean wsbz){
        this.wsbz = wsbz;
   }
   /**
   * 字段名：LSBZ
   * get方法
   * 备注: 
   */
   public Boolean getLsbz(){

        return lsbz;
   }

   /**
   * 字段名：LSBZ
   * set方法
   * 备注: 
   */
   public void setLsbz(Boolean lsbz){
        this.lsbz = lsbz;
   }
   /**
   * 字段名：TZSJ
   * get方法
   * 备注: 
   */
   public String getTzsj(){

        return tzsj;
   }

   /**
   * 字段名：TZSJ
   * set方法
   * 备注: 
   */
   public void setTzsj(String tzsj){
        this.tzsj = tzsj;
   }
   /**
   * 字段名：CQCFXH
   * get方法
   * 备注: 
   */
   public Long getCqcfxh(){

        return cqcfxh;
   }

   /**
   * 字段名：CQCFXH
   * set方法
   * 备注: 
   */
   public void setCqcfxh(Long cqcfxh){
        this.cqcfxh = cqcfxh;
   }
   /**
   * 字段名：LGBZ
   * get方法
   * 备注: 
   */
   public Boolean getLgbz(){

        return lgbz;
   }

   /**
   * 字段名：LGBZ
   * set方法
   * 备注: 
   */
   public void setLgbz(Boolean lgbz){
        this.lgbz = lgbz;
   }
   /**
   * 字段名：OLDXH
   * get方法
   * 备注: 
   */
   public Long getOldxh(){

        return oldxh;
   }

   /**
   * 字段名：OLDXH
   * set方法
   * 备注: 
   */
   public void setOldxh(Long oldxh){
        this.oldxh = oldxh;
   }
   /**
   * 字段名：ZFDM
   * get方法
   * 备注: 
   */
   public String getZfdm(){

        return zfdm;
   }

   /**
   * 字段名：ZFDM
   * set方法
   * 备注: 
   */
   public void setZfdm(String zfdm){
        this.zfdm = zfdm;
   }
   /**
   * 字段名：ZFMC
   * get方法
   * 备注: 
   */
   public String getZfmc(){

        return zfmc;
   }

   /**
   * 字段名：ZFMC
   * set方法
   * 备注: 
   */
   public void setZfmc(String zfmc){
        this.zfmc = zfmc;
   }
   /**
   * 字段名：CFYYTS
   * get方法
   * 备注: 
   */
   public Integer getCfyyts(){

        return cfyyts;
   }

   /**
   * 字段名：CFYYTS
   * set方法
   * 备注: 
   */
   public void setCfyyts(Integer cfyyts){
        this.cfyyts = cfyyts;
   }
   /**
   * 字段名：CYRYCS
   * get方法
   * 备注: 
   */
   public Integer getCyrycs(){

        return cyrycs;
   }

   /**
   * 字段名：CYRYCS
   * set方法
   * 备注: 
   */
   public void setCyrycs(Integer cyrycs){
        this.cyrycs = cyrycs;
   }
   /**
   * 字段名：CYDJTS
   * get方法
   * 备注: 
   */
   public Integer getCydjts(){

        return cydjts;
   }

   /**
   * 字段名：CYDJTS
   * set方法
   * 备注: 
   */
   public void setCydjts(Integer cydjts){
        this.cydjts = cydjts;
   }
   /**
   * 字段名：CYJZZL
   * get方法
   * 备注: 
   */
   public Integer getCyjzzl(){

        return cyjzzl;
   }

   /**
   * 字段名：CYJZZL
   * set方法
   * 备注: 
   */
   public void setCyjzzl(Integer cyjzzl){
        this.cyjzzl = cyjzzl;
   }
   /**
   * 字段名：JLDW
   * get方法
   * 备注: 
   */
   public String getJldw(){

        return jldw;
   }

   /**
   * 字段名：JLDW
   * set方法
   * 备注: 
   */
   public void setJldw(String jldw){
        this.jldw = jldw;
   }
   /**
   * 字段名：UKBZ
   * get方法
   * 备注: 
   */
   public Boolean getUkbz(){

        return ukbz;
   }

   /**
   * 字段名：UKBZ
   * set方法
   * 备注: 
   */
   public void setUkbz(Boolean ukbz){
        this.ukbz = ukbz;
   }
   /**
   * 字段名：XDFXH
   * get方法
   * 备注: 
   */
   public Long getXdfxh(){

        return xdfxh;
   }

   /**
   * 字段名：XDFXH
   * set方法
   * 备注: 
   */
   public void setXdfxh(Long xdfxh){
        this.xdfxh = xdfxh;
   }
   /**
   * 字段名：QJBZ
   * get方法
   * 备注: 
   */
   public Boolean getQjbz(){

        return qjbz;
   }

   /**
   * 字段名：QJBZ
   * set方法
   * 备注: 
   */
   public void setQjbz(Boolean qjbz){
        this.qjbz = qjbz;
   }
   /**
   * 字段名：SHBZ8
   * get方法
   * 备注: 
   */
   public Integer getShbz8(){

        return shbz8;
   }

   /**
   * 字段名：SHBZ8
   * set方法
   * 备注: 
   */
   public void setShbz8(Integer shbz8){
        this.shbz8 = shbz8;
   }
   /**
   * 字段名：CCFBZ
   * get方法
   * 备注: 
   */
   public Boolean getCcfbz(){

        return ccfbz;
   }

   /**
   * 字段名：CCFBZ
   * set方法
   * 备注: 
   */
   public void setCcfbz(Boolean ccfbz){
        this.ccfbz = ccfbz;
   }
   /**
   * 字段名：JCCFBZ
   * get方法
   * 备注: 
   */
   public Boolean getJccfbz(){

        return jccfbz;
   }

   /**
   * 字段名：JCCFBZ
   * set方法
   * 备注: 
   */
   public void setJccfbz(Boolean jccfbz){
        this.jccfbz = jccfbz;
   }
   /**
   * 字段名：DJFS
   * get方法
   * 备注: 
   */
   public Integer getDjfs(){

        return djfs;
   }

   /**
   * 字段名：DJFS
   * set方法
   * 备注: 
   */
   public void setDjfs(Integer djfs){
        this.djfs = djfs;
   }
   /**
   * 字段名：MBBZ
   * get方法
   * 备注: 
   */
   public Boolean getMbbz(){

        return mbbz;
   }

   /**
   * 字段名：MBBZ
   * set方法
   * 备注: 
   */
   public void setMbbz(Boolean mbbz){
        this.mbbz = mbbz;
   }
   /**
   * 字段名：XDFMC
   * get方法
   * 备注: 
   */
   public String getXdfmc(){

        return xdfmc;
   }

   /**
   * 字段名：XDFMC
   * set方法
   * 备注: 
   */
   public void setXdfmc(String xdfmc){
        this.xdfmc = xdfmc;
   }
   /**
   * 字段名：GSBZ
   * get方法
   * 备注: 
   */
   public Boolean getGsbz(){

        return gsbz;
   }

   /**
   * 字段名：GSBZ
   * set方法
   * 备注: 
   */
   public void setGsbz(Boolean gsbz){
        this.gsbz = gsbz;
   }
   /**
   * 字段名：LXBZ
   * get方法
   * 备注: 
   */
   public Boolean getLxbz(){

        return lxbz;
   }

   /**
   * 字段名：LXBZ
   * set方法
   * 备注: 
   */
   public void setLxbz(Boolean lxbz){
        this.lxbz = lxbz;
   }
   /**
   * 字段名：MXBSHBZ
   * get方法
   * 备注: 
   */
   public Integer getMxbshbz(){

        return mxbshbz;
   }

   /**
   * 字段名：MXBSHBZ
   * set方法
   * 备注: 
   */
   public void setMxbshbz(Integer mxbshbz){
        this.mxbshbz = mxbshbz;
   }
   /**
   * 字段名：SHBTGYY
   * get方法
   * 备注: 
   */
   public String getShbtgyy(){

        return shbtgyy;
   }

   /**
   * 字段名：SHBTGYY
   * set方法
   * 备注: 
   */
   public void setShbtgyy(String shbtgyy){
        this.shbtgyy = shbtgyy;
   }
   /**
   * 字段名：LDSQDXH
   * get方法
   * 备注: 
   */
   public Long getLdsqdxh(){

        return ldsqdxh;
   }

   /**
   * 字段名：LDSQDXH
   * set方法
   * 备注: 
   */
   public void setLdsqdxh(Long ldsqdxh){
        this.ldsqdxh = ldsqdxh;
   }
   /**
   * 字段名：XZLB
   * get方法
   * 备注: 
   */
   public Integer getXzlb(){

        return xzlb;
   }

   /**
   * 字段名：XZLB
   * set方法
   * 备注: 
   */
   public void setXzlb(Integer xzlb){
        this.xzlb = xzlb;
   }
   /**
   * 字段名：BFZBZ
   * get方法
   * 备注: 
   */
   public Integer getBfzbz(){

        return bfzbz;
   }

   /**
   * 字段名：BFZBZ
   * set方法
   * 备注: 
   */
   public void setBfzbz(Integer bfzbz){
        this.bfzbz = bfzbz;
   }
   /**
   * 字段名：SYYLLB
   * get方法
   * 备注: 
   */
   public String getSyyllb(){

        return syyllb;
   }

   /**
   * 字段名：SYYLLB
   * set方法
   * 备注: 
   */
   public void setSyyllb(String syyllb){
        this.syyllb = syyllb;
   }
   /**
   * 字段名：SYLBDM
   * get方法
   * 备注: 
   */
   public String getSylbdm(){

        return sylbdm;
   }

   /**
   * 字段名：SYLBDM
   * set方法
   * 备注: 
   */
   public void setSylbdm(String sylbdm){
        this.sylbdm = sylbdm;
   }
   /**
   * 字段名：SYLBMC
   * get方法
   * 备注: 
   */
   public String getSylbmc(){

        return sylbmc;
   }

   /**
   * 字段名：SYLBMC
   * set方法
   * 备注: 
   */
   public void setSylbmc(String sylbmc){
        this.sylbmc = sylbmc;
   }
   /**
   * 字段名：SYZDDM
   * get方法
   * 备注: 
   */
   public String getSyzddm(){

        return syzddm;
   }

   /**
   * 字段名：SYZDDM
   * set方法
   * 备注: 
   */
   public void setSyzddm(String syzddm){
        this.syzddm = syzddm;
   }
   /**
   * 字段名：SYZDMC
   * get方法
   * 备注: 
   */
   public String getSyzdmc(){

        return syzdmc;
   }

   /**
   * 字段名：SYZDMC
   * set方法
   * 备注: 
   */
   public void setSyzdmc(String syzdmc){
        this.syzdmc = syzdmc;
   }
   /**
   * 字段名：BFZ
   * get方法
   * 备注: 
   */
   public String getBfz(){

        return bfz;
   }

   /**
   * 字段名：BFZ
   * set方法
   * 备注: 
   */
   public void setBfz(String bfz){
        this.bfz = bfz;
   }
   /**
   * 字段名：ZZRSLX
   * get方法
   * 备注: 
   */
   public String getZzrslx(){

        return zzrslx;
   }

   /**
   * 字段名：ZZRSLX
   * set方法
   * 备注: 
   */
   public void setZzrslx(String zzrslx){
        this.zzrslx = zzrslx;
   }
   /**
   * 字段名：SYSJ
   * get方法
   * 备注: 
   */
   public String getSysj(){

        return sysj;
   }

   /**
   * 字段名：SYSJ
   * set方法
   * 备注: 
   */
   public void setSysj(String sysj){
        this.sysj = sysj;
   }
   /**
   * 字段名：YCBJYJCXMDM
   * get方法
   * 备注: 
   */
   public String getYcbjyjcxmdm(){

        return ycbjyjcxmdm;
   }

   /**
   * 字段名：YCBJYJCXMDM
   * set方法
   * 备注: 
   */
   public void setYcbjyjcxmdm(String ycbjyjcxmdm){
        this.ycbjyjcxmdm = ycbjyjcxmdm;
   }
   /**
   * 字段名：YCBJYJCXMMC
   * get方法
   * 备注: 
   */
   public String getYcbjyjcxmmc(){

        return ycbjyjcxmmc;
   }

   /**
   * 字段名：YCBJYJCXMMC
   * set方法
   * 备注: 
   */
   public void setYcbjyjcxmmc(String ycbjyjcxmmc){
        this.ycbjyjcxmmc = ycbjyjcxmmc;
   }
   /**
   * 字段名：SYFWZH
   * get方法
   * 备注: 
   */
   public String getSyfwzh(){

        return syfwzh;
   }

   /**
   * 字段名：SYFWZH
   * set方法
   * 备注: 
   */
   public void setSyfwzh(String syfwzh){
        this.syfwzh = syfwzh;
   }
   /**
   * 字段名：JHZH
   * get方法
   * 备注: 
   */
   public String getJhzh(){

        return jhzh;
   }

   /**
   * 字段名：JHZH
   * set方法
   * 备注: 
   */
   public void setJhzh(String jhzh){
        this.jhzh = jhzh;
   }
   /**
   * 字段名：BZLB
   * get方法
   * 备注: 
   */
   public String getBzlb(){

        return bzlb;
   }

   /**
   * 字段名：BZLB
   * set方法
   * 备注: 
   */
   public void setBzlb(String bzlb){
        this.bzlb = bzlb;
   }
   /**
   * 字段名：BZDM
   * get方法
   * 备注: 
   */
   public String getBzdm(){

        return bzdm;
   }

   /**
   * 字段名：BZDM
   * set方法
   * 备注: 
   */
   public void setBzdm(String bzdm){
        this.bzdm = bzdm;
   }
   /**
   * 字段名：BZMC
   * get方法
   * 备注: 
   */
   public String getBzmc(){

        return bzmc;
   }

   /**
   * 字段名：BZMC
   * set方法
   * 备注: 
   */
   public void setBzmc(String bzmc){
        this.bzmc = bzmc;
   }
   /**
   * 字段名：CYYDSL
   * get方法
   * 备注: 
   */
   public Integer getCyydsl(){

        return cyydsl;
   }

   /**
   * 字段名：CYYDSL
   * set方法
   * 备注: 
   */
   public void setCyydsl(Integer cyydsl){
        this.cyydsl = cyydsl;
   }
   /**
   * 字段名：KDBZ
   * get方法
   * 备注: 
   */
   public Boolean getKdbz(){

        return kdbz;
   }

   /**
   * 字段名：KDBZ
   * set方法
   * 备注: 
   */
   public void setKdbz(Boolean kdbz){
        this.kdbz = kdbz;
   }
   /**
   * 字段名：CYXZFS
   * get方法
   * 备注: 
   */
   public Integer getCyxzfs(){

        return cyxzfs;
   }

   /**
   * 字段名：CYXZFS
   * set方法
   * 备注: 
   */
   public void setCyxzfs(Integer cyxzfs){
        this.cyxzfs = cyxzfs;
   }

}