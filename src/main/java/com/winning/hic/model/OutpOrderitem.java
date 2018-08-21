package com.winning.hic.model;

import java.math.BigDecimal; 
import java.math.BigDecimal; 
import java.math.BigDecimal; 
import java.math.BigDecimal; 
import java.math.BigDecimal; 
import java.math.BigDecimal; 
import java.math.BigDecimal; 
import java.math.BigDecimal; 
import java.math.BigDecimal; 
import java.io.Serializable; 

import org.apache.ibatis.type.Alias; 

import com.winning.hic.model.BaseDomain;



/**
 * @author HLHT
 * @title 
 * @email Winning Health
 * @package com.winning.hic.model
 * @date 2018-42-21 09:42:26
 */
@Alias("outpOrderitem")
public class OutpOrderitem extends BaseDomain implements Serializable {

    private static final long serialVersionUID = -1L;

    /**
     * 字段名：XH
     * 备注: 
     * 默认值：无
     */
    private Long xh;
    /**
     * 字段名：CFXH
     * 备注: 
     * 默认值：无
     */
    private Long cfxh;
    /**
     * 字段名：CD_IDM
     * 备注: 
     * 默认值：无
     */
    private Integer cdIdm;
    /**
     * 字段名：GG_IDM
     * 备注: 
     * 默认值：无
     */
    private Integer ggIdm;
    /**
     * 字段名：EKBZ
     * 备注: 
     * 默认值：无
     */
    private Boolean ekbz;
    /**
     * 字段名：DXMDM
     * 备注: 
     * 默认值：无
     */
    private String dxmdm;
    /**
     * 字段名：DXMMC
     * 备注: 
     * 默认值：无
     */
    private String dxmmc;
    /**
     * 字段名：YPDM
     * 备注: 
     * 默认值：无
     */
    private String ypdm;
    /**
     * 字段名：LCXMDM
     * 备注: 
     * 默认值：无
     */
    private String lcxmdm;
    /**
     * 字段名：YPMC
     * 备注: 
     * 默认值：无
     */
    private String ypmc;
    /**
     * 字段名：YPGG
     * 备注: 
     * 默认值：无
     */
    private String ypgg;
    /**
     * 字段名：YPDW
     * 备注: 
     * 默认值：无
     */
    private String ypdw;
    /**
     * 字段名：YPXS
     * 备注: 
     * 默认值：无
     */
    private BigDecimal ypxs;
    /**
     * 字段名：YKXS
     * 备注: 
     * 默认值：无
     */
    private BigDecimal ykxs;
    /**
     * 字段名：MZDW
     * 备注: 
     * 默认值：无
     */
    private String mzdw;
    /**
     * 字段名：MZXS
     * 备注: 
     * 默认值：无
     */
    private BigDecimal mzxs;
    /**
     * 字段名：GGDW
     * 备注: 
     * 默认值：无
     */
    private String ggdw;
    /**
     * 字段名：GGXS
     * 备注: 
     * 默认值：无
     */
    private BigDecimal ggxs;
    /**
     * 字段名：ZXDW
     * 备注: 
     * 默认值：无
     */
    private String zxdw;
    /**
     * 字段名：JXDM
     * 备注: 
     * 默认值：无
     */
    private String jxdm;
    /**
     * 字段名：JXMC
     * 备注: 
     * 默认值：无
     */
    private String jxmc;
    /**
     * 字段名：YLSJ
     * 备注: 
     * 默认值：无
     */
    private BigDecimal ylsj;
    /**
     * 字段名：YPFJ
     * 备注: 
     * 默认值：无
     */
    private BigDecimal ypfj;
    /**
     * 字段名：YPYF
     * 备注: 
     * 默认值：无
     */
    private String ypyf;
    /**
     * 字段名：YPYFMC
     * 备注: 
     * 默认值：无
     */
    private String ypyfmc;
    /**
     * 字段名：PCDM
     * 备注: 
     * 默认值：无
     */
    private String pcdm;
    /**
     * 字段名：PCMC
     * 备注: 
     * 默认值：无
     */
    private String pcmc;
    /**
     * 字段名：YPJL
     * 备注: 
     * 默认值：无
     */
    private BigDecimal ypjl;
    /**
     * 字段名：JLDW
     * 备注: 
     * 默认值：无
     */
    private String jldw;
    /**
     * 字段名：DWLB
     * 备注: 
     * 默认值：无
     */
    private Integer dwlb;
    /**
     * 字段名：TS
     * 备注: 
     * 默认值：((1))
     */
    private Integer ts;
    /**
     * 字段名：YFLDSL
     * 备注: 
     * 默认值：无
     */
    private Integer yfldsl;
    /**
     * 字段名：LDLX
     * 备注: 
     * 默认值：无
     */
    private String ldlx;
    /**
     * 字段名：LDXH
     * 备注: 
     * 默认值：无
     */
    private String ldxh;
    /**
     * 字段名：YPSL
     * 备注: 
     * 默认值：无
     */
    private BigDecimal ypsl;
    /**
     * 字段名：CYTS
     * 备注: 
     * 默认值：((1))
     */
    private Integer cyts;
    /**
     * 字段名：SHBZ
     * 备注: 
     * 默认值：无
     */
    private Boolean shbz;
    /**
     * 字段名：ZBZ
     * 备注: 
     * 默认值：无
     */
    private Integer zbz;
    /**
     * 字段名：MZDM
     * 备注: 
     * 默认值：无
     */
    private String mzdm;
    /**
     * 字段名：MZMC
     * 备注: 
     * 默认值：无
     */
    private String mzmc;
    /**
     * 字段名：FZXH
     * 备注: 
     * 默认值：无
     */
    private Long fzxh;
    /**
     * 字段名：PSBZ
     * 备注: 
     * 默认值：无
     */
    private Boolean psbz;
    /**
     * 字段名：ZBBZ
     * 备注: 
     * 默认值：无
     */
    private Boolean zbbz;
    /**
     * 字段名：JJBZ
     * 备注: 
     * 默认值：无
     */
    private Integer jjbz;
    /**
     * 字段名：JLZT
     * 备注: 
     * 默认值：无
     */
    private Boolean jlzt;
    /**
     * 字段名：YBSPBZ
     * 备注: 
     * 默认值：无
     */
    private Integer ybspbz;
    /**
     * 字段名：YBJZBZ
     * 备注: 
     * 默认值：无
     */
    private Boolean ybjzbz;
    /**
     * 字段名：MZLYBZ
     * 备注: 
     * 默认值：((0))
     */
    private Integer mzlybz;
    /**
     * 字段名：MEMO
     * 备注: 
     * 默认值：无
     */
    private String memo;
    /**
     * 字段名：LJDYXH
     * 备注: 
     * 默认值：无
     */
    private Long ljdyxh;
    /**
     * 字段名：XZ
     * 备注: 
     * 默认值：((2))
     */
    private Integer xz;
    /**
     * 字段名：KZGGDWXH
     * 备注: 
     * 默认值：无
     */
    private Long kzggdwxh;
    /**
     * 字段名：TSDYBZ
     * 备注: 
     * 默认值：无
     */
    private Integer tsdybz;
    /**
     * 字段名：KSSKZBZ
     * 备注: 
     * 默认值：无
     */
    private Integer ksskzbz;
    /**
     * 字段名：BBZL
     * 备注: 
     * 默认值：无
     */
    private String bbzl;
    /**
     * 字段名：MRJLDWBZ
     * 备注: 
     * 默认值：无
     */
    private Integer mrjldwbz;
    /**
     * 字段名：ZFBZ
     * 备注: 
     * 默认值：无
     */
    private Boolean zfbz;
    /**
     * 字段名：JLSM
     * 备注: 
     * 默认值：无
     */
    private String jlsm;
    /**
     * 字段名：PSYPDM
     * 备注: 
     * 默认值：无
     */
    private String psypdm;
    /**
     * 字段名：YBJYB
     * 备注: 
     * 默认值：无
     */
    private Integer ybjyb;
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
     * 字段名：CQCFMXXH
     * 备注: 
     * 默认值：无
     */
    private Long cqcfmxxh;
    /**
     * 字段名：OLDXH
     * 备注: 
     * 默认值：无
     */
    private Long oldxh;
    /**
     * 字段名：GDZLXMXH
     * 备注: 
     * 默认值：无
     */
    private Long gdzlxmxh;
    /**
     * 字段名：CJRQ
     * 备注: 
     * 默认值：无
     */
    private String cjrq;
    /**
     * 字段名：YBBZ
     * 备注: 
     * 默认值：无
     */
    private Boolean ybbz;
    /**
     * 字段名：TFBZ
     * 备注: 
     * 默认值：无
     */
    private Boolean tfbz;
    /**
     * 字段名：CJLQM
     * 备注: 
     * 默认值：无
     */
    private Integer cjlqm;
    /**
     * 字段名：GFLDLB
     * 备注: 
     * 默认值：无
     */
    private Integer gfldlb;
    /**
     * 字段名：DS
     * 备注: 
     * 默认值：无
     */
    private Integer ds;
    /**
     * 字段名：CSYY
     * 备注: 
     * 默认值：无
     */
    private String csyy;
    /**
     * 字段名：MEMOINFO
     * 备注: 
     * 默认值：无
     */
    private String memoinfo;
    /**
     * 字段名：LDSQDMXXH
     * 备注: 
     * 默认值：无
     */
    private Long ldsqdmxxh;
    /**
     * 字段名：WZKFDM
     * 备注: 
     * 默认值：无
     */
    private String wzkfdm;
    /**
     * 字段名：WZDM
     * 备注: 
     * 默认值：无
     */
    private String wzdm;
    /**
     * 字段名：WZKFMC
     * 备注: 
     * 默认值：无
     */
    private String wzkfmc;
    /**
     * 字段名：WZBM
     * 备注: 
     * 默认值：无
     */
    private String wzbm;
    /**
     * 字段名：TSCFXH
     * 备注: 
     * 默认值：无
     */
    private String tscfxh;
    /**
     * 字段名：TSQKSM
     * 备注: 
     * 默认值：无
     */
    private String tsqksm;
    /**
     * 字段名：TFYXBZ
     * 备注: 
     * 默认值：无
     */
    private String tfyxbz;
    /**
     * 字段名：BGSYBZ
     * 备注: 
     * 默认值：无
     */
    private Integer bgsybz;
    /**
     * 字段名：TFSL
     * 备注: 
     * 默认值：无
     */
    private BigDecimal tfsl;

    public OutpOrderitem (){

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
   * 字段名：CFXH
   * get方法
   * 备注: 
   */
   public Long getCfxh(){

        return cfxh;
   }

   /**
   * 字段名：CFXH
   * set方法
   * 备注: 
   */
   public void setCfxh(Long cfxh){
        this.cfxh = cfxh;
   }
   /**
   * 字段名：CD_IDM
   * get方法
   * 备注: 
   */
   public Integer getCdIdm(){

        return cdIdm;
   }

   /**
   * 字段名：CD_IDM
   * set方法
   * 备注: 
   */
   public void setCdIdm(Integer cdIdm){
        this.cdIdm = cdIdm;
   }
   /**
   * 字段名：GG_IDM
   * get方法
   * 备注: 
   */
   public Integer getGgIdm(){

        return ggIdm;
   }

   /**
   * 字段名：GG_IDM
   * set方法
   * 备注: 
   */
   public void setGgIdm(Integer ggIdm){
        this.ggIdm = ggIdm;
   }
   /**
   * 字段名：EKBZ
   * get方法
   * 备注: 
   */
   public Boolean getEkbz(){

        return ekbz;
   }

   /**
   * 字段名：EKBZ
   * set方法
   * 备注: 
   */
   public void setEkbz(Boolean ekbz){
        this.ekbz = ekbz;
   }
   /**
   * 字段名：DXMDM
   * get方法
   * 备注: 
   */
   public String getDxmdm(){

        return dxmdm;
   }

   /**
   * 字段名：DXMDM
   * set方法
   * 备注: 
   */
   public void setDxmdm(String dxmdm){
        this.dxmdm = dxmdm;
   }
   /**
   * 字段名：DXMMC
   * get方法
   * 备注: 
   */
   public String getDxmmc(){

        return dxmmc;
   }

   /**
   * 字段名：DXMMC
   * set方法
   * 备注: 
   */
   public void setDxmmc(String dxmmc){
        this.dxmmc = dxmmc;
   }
   /**
   * 字段名：YPDM
   * get方法
   * 备注: 
   */
   public String getYpdm(){

        return ypdm;
   }

   /**
   * 字段名：YPDM
   * set方法
   * 备注: 
   */
   public void setYpdm(String ypdm){
        this.ypdm = ypdm;
   }
   /**
   * 字段名：LCXMDM
   * get方法
   * 备注: 
   */
   public String getLcxmdm(){

        return lcxmdm;
   }

   /**
   * 字段名：LCXMDM
   * set方法
   * 备注: 
   */
   public void setLcxmdm(String lcxmdm){
        this.lcxmdm = lcxmdm;
   }
   /**
   * 字段名：YPMC
   * get方法
   * 备注: 
   */
   public String getYpmc(){

        return ypmc;
   }

   /**
   * 字段名：YPMC
   * set方法
   * 备注: 
   */
   public void setYpmc(String ypmc){
        this.ypmc = ypmc;
   }
   /**
   * 字段名：YPGG
   * get方法
   * 备注: 
   */
   public String getYpgg(){

        return ypgg;
   }

   /**
   * 字段名：YPGG
   * set方法
   * 备注: 
   */
   public void setYpgg(String ypgg){
        this.ypgg = ypgg;
   }
   /**
   * 字段名：YPDW
   * get方法
   * 备注: 
   */
   public String getYpdw(){

        return ypdw;
   }

   /**
   * 字段名：YPDW
   * set方法
   * 备注: 
   */
   public void setYpdw(String ypdw){
        this.ypdw = ypdw;
   }
   /**
   * 字段名：YPXS
   * get方法
   * 备注: 
   */
   public BigDecimal getYpxs(){

        return ypxs;
   }

   /**
   * 字段名：YPXS
   * set方法
   * 备注: 
   */
   public void setYpxs(BigDecimal ypxs){
        this.ypxs = ypxs;
   }
   /**
   * 字段名：YKXS
   * get方法
   * 备注: 
   */
   public BigDecimal getYkxs(){

        return ykxs;
   }

   /**
   * 字段名：YKXS
   * set方法
   * 备注: 
   */
   public void setYkxs(BigDecimal ykxs){
        this.ykxs = ykxs;
   }
   /**
   * 字段名：MZDW
   * get方法
   * 备注: 
   */
   public String getMzdw(){

        return mzdw;
   }

   /**
   * 字段名：MZDW
   * set方法
   * 备注: 
   */
   public void setMzdw(String mzdw){
        this.mzdw = mzdw;
   }
   /**
   * 字段名：MZXS
   * get方法
   * 备注: 
   */
   public BigDecimal getMzxs(){

        return mzxs;
   }

   /**
   * 字段名：MZXS
   * set方法
   * 备注: 
   */
   public void setMzxs(BigDecimal mzxs){
        this.mzxs = mzxs;
   }
   /**
   * 字段名：GGDW
   * get方法
   * 备注: 
   */
   public String getGgdw(){

        return ggdw;
   }

   /**
   * 字段名：GGDW
   * set方法
   * 备注: 
   */
   public void setGgdw(String ggdw){
        this.ggdw = ggdw;
   }
   /**
   * 字段名：GGXS
   * get方法
   * 备注: 
   */
   public BigDecimal getGgxs(){

        return ggxs;
   }

   /**
   * 字段名：GGXS
   * set方法
   * 备注: 
   */
   public void setGgxs(BigDecimal ggxs){
        this.ggxs = ggxs;
   }
   /**
   * 字段名：ZXDW
   * get方法
   * 备注: 
   */
   public String getZxdw(){

        return zxdw;
   }

   /**
   * 字段名：ZXDW
   * set方法
   * 备注: 
   */
   public void setZxdw(String zxdw){
        this.zxdw = zxdw;
   }
   /**
   * 字段名：JXDM
   * get方法
   * 备注: 
   */
   public String getJxdm(){

        return jxdm;
   }

   /**
   * 字段名：JXDM
   * set方法
   * 备注: 
   */
   public void setJxdm(String jxdm){
        this.jxdm = jxdm;
   }
   /**
   * 字段名：JXMC
   * get方法
   * 备注: 
   */
   public String getJxmc(){

        return jxmc;
   }

   /**
   * 字段名：JXMC
   * set方法
   * 备注: 
   */
   public void setJxmc(String jxmc){
        this.jxmc = jxmc;
   }
   /**
   * 字段名：YLSJ
   * get方法
   * 备注: 
   */
   public BigDecimal getYlsj(){

        return ylsj;
   }

   /**
   * 字段名：YLSJ
   * set方法
   * 备注: 
   */
   public void setYlsj(BigDecimal ylsj){
        this.ylsj = ylsj;
   }
   /**
   * 字段名：YPFJ
   * get方法
   * 备注: 
   */
   public BigDecimal getYpfj(){

        return ypfj;
   }

   /**
   * 字段名：YPFJ
   * set方法
   * 备注: 
   */
   public void setYpfj(BigDecimal ypfj){
        this.ypfj = ypfj;
   }
   /**
   * 字段名：YPYF
   * get方法
   * 备注: 
   */
   public String getYpyf(){

        return ypyf;
   }

   /**
   * 字段名：YPYF
   * set方法
   * 备注: 
   */
   public void setYpyf(String ypyf){
        this.ypyf = ypyf;
   }
   /**
   * 字段名：YPYFMC
   * get方法
   * 备注: 
   */
   public String getYpyfmc(){

        return ypyfmc;
   }

   /**
   * 字段名：YPYFMC
   * set方法
   * 备注: 
   */
   public void setYpyfmc(String ypyfmc){
        this.ypyfmc = ypyfmc;
   }
   /**
   * 字段名：PCDM
   * get方法
   * 备注: 
   */
   public String getPcdm(){

        return pcdm;
   }

   /**
   * 字段名：PCDM
   * set方法
   * 备注: 
   */
   public void setPcdm(String pcdm){
        this.pcdm = pcdm;
   }
   /**
   * 字段名：PCMC
   * get方法
   * 备注: 
   */
   public String getPcmc(){

        return pcmc;
   }

   /**
   * 字段名：PCMC
   * set方法
   * 备注: 
   */
   public void setPcmc(String pcmc){
        this.pcmc = pcmc;
   }
   /**
   * 字段名：YPJL
   * get方法
   * 备注: 
   */
   public BigDecimal getYpjl(){

        return ypjl;
   }

   /**
   * 字段名：YPJL
   * set方法
   * 备注: 
   */
   public void setYpjl(BigDecimal ypjl){
        this.ypjl = ypjl;
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
   * 字段名：DWLB
   * get方法
   * 备注: 
   */
   public Integer getDwlb(){

        return dwlb;
   }

   /**
   * 字段名：DWLB
   * set方法
   * 备注: 
   */
   public void setDwlb(Integer dwlb){
        this.dwlb = dwlb;
   }
   /**
   * 字段名：TS
   * get方法
   * 备注: 
   */
   public Integer getTs(){

        return ts;
   }

   /**
   * 字段名：TS
   * set方法
   * 备注: 
   */
   public void setTs(Integer ts){
        this.ts = ts;
   }
   /**
   * 字段名：YFLDSL
   * get方法
   * 备注: 
   */
   public Integer getYfldsl(){

        return yfldsl;
   }

   /**
   * 字段名：YFLDSL
   * set方法
   * 备注: 
   */
   public void setYfldsl(Integer yfldsl){
        this.yfldsl = yfldsl;
   }
   /**
   * 字段名：LDLX
   * get方法
   * 备注: 
   */
   public String getLdlx(){

        return ldlx;
   }

   /**
   * 字段名：LDLX
   * set方法
   * 备注: 
   */
   public void setLdlx(String ldlx){
        this.ldlx = ldlx;
   }
   /**
   * 字段名：LDXH
   * get方法
   * 备注: 
   */
   public String getLdxh(){

        return ldxh;
   }

   /**
   * 字段名：LDXH
   * set方法
   * 备注: 
   */
   public void setLdxh(String ldxh){
        this.ldxh = ldxh;
   }
   /**
   * 字段名：YPSL
   * get方法
   * 备注: 
   */
   public BigDecimal getYpsl(){

        return ypsl;
   }

   /**
   * 字段名：YPSL
   * set方法
   * 备注: 
   */
   public void setYpsl(BigDecimal ypsl){
        this.ypsl = ypsl;
   }
   /**
   * 字段名：CYTS
   * get方法
   * 备注: 
   */
   public Integer getCyts(){

        return cyts;
   }

   /**
   * 字段名：CYTS
   * set方法
   * 备注: 
   */
   public void setCyts(Integer cyts){
        this.cyts = cyts;
   }
   /**
   * 字段名：SHBZ
   * get方法
   * 备注: 
   */
   public Boolean getShbz(){

        return shbz;
   }

   /**
   * 字段名：SHBZ
   * set方法
   * 备注: 
   */
   public void setShbz(Boolean shbz){
        this.shbz = shbz;
   }
   /**
   * 字段名：ZBZ
   * get方法
   * 备注: 
   */
   public Integer getZbz(){

        return zbz;
   }

   /**
   * 字段名：ZBZ
   * set方法
   * 备注: 
   */
   public void setZbz(Integer zbz){
        this.zbz = zbz;
   }
   /**
   * 字段名：MZDM
   * get方法
   * 备注: 
   */
   public String getMzdm(){

        return mzdm;
   }

   /**
   * 字段名：MZDM
   * set方法
   * 备注: 
   */
   public void setMzdm(String mzdm){
        this.mzdm = mzdm;
   }
   /**
   * 字段名：MZMC
   * get方法
   * 备注: 
   */
   public String getMzmc(){

        return mzmc;
   }

   /**
   * 字段名：MZMC
   * set方法
   * 备注: 
   */
   public void setMzmc(String mzmc){
        this.mzmc = mzmc;
   }
   /**
   * 字段名：FZXH
   * get方法
   * 备注: 
   */
   public Long getFzxh(){

        return fzxh;
   }

   /**
   * 字段名：FZXH
   * set方法
   * 备注: 
   */
   public void setFzxh(Long fzxh){
        this.fzxh = fzxh;
   }
   /**
   * 字段名：PSBZ
   * get方法
   * 备注: 
   */
   public Boolean getPsbz(){

        return psbz;
   }

   /**
   * 字段名：PSBZ
   * set方法
   * 备注: 
   */
   public void setPsbz(Boolean psbz){
        this.psbz = psbz;
   }
   /**
   * 字段名：ZBBZ
   * get方法
   * 备注: 
   */
   public Boolean getZbbz(){

        return zbbz;
   }

   /**
   * 字段名：ZBBZ
   * set方法
   * 备注: 
   */
   public void setZbbz(Boolean zbbz){
        this.zbbz = zbbz;
   }
   /**
   * 字段名：JJBZ
   * get方法
   * 备注: 
   */
   public Integer getJjbz(){

        return jjbz;
   }

   /**
   * 字段名：JJBZ
   * set方法
   * 备注: 
   */
   public void setJjbz(Integer jjbz){
        this.jjbz = jjbz;
   }
   /**
   * 字段名：JLZT
   * get方法
   * 备注: 
   */
   public Boolean getJlzt(){

        return jlzt;
   }

   /**
   * 字段名：JLZT
   * set方法
   * 备注: 
   */
   public void setJlzt(Boolean jlzt){
        this.jlzt = jlzt;
   }
   /**
   * 字段名：YBSPBZ
   * get方法
   * 备注: 
   */
   public Integer getYbspbz(){

        return ybspbz;
   }

   /**
   * 字段名：YBSPBZ
   * set方法
   * 备注: 
   */
   public void setYbspbz(Integer ybspbz){
        this.ybspbz = ybspbz;
   }
   /**
   * 字段名：YBJZBZ
   * get方法
   * 备注: 
   */
   public Boolean getYbjzbz(){

        return ybjzbz;
   }

   /**
   * 字段名：YBJZBZ
   * set方法
   * 备注: 
   */
   public void setYbjzbz(Boolean ybjzbz){
        this.ybjzbz = ybjzbz;
   }
   /**
   * 字段名：MZLYBZ
   * get方法
   * 备注: 
   */
   public Integer getMzlybz(){

        return mzlybz;
   }

   /**
   * 字段名：MZLYBZ
   * set方法
   * 备注: 
   */
   public void setMzlybz(Integer mzlybz){
        this.mzlybz = mzlybz;
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
   * 字段名：LJDYXH
   * get方法
   * 备注: 
   */
   public Long getLjdyxh(){

        return ljdyxh;
   }

   /**
   * 字段名：LJDYXH
   * set方法
   * 备注: 
   */
   public void setLjdyxh(Long ljdyxh){
        this.ljdyxh = ljdyxh;
   }
   /**
   * 字段名：XZ
   * get方法
   * 备注: 
   */
   public Integer getXz(){

        return xz;
   }

   /**
   * 字段名：XZ
   * set方法
   * 备注: 
   */
   public void setXz(Integer xz){
        this.xz = xz;
   }
   /**
   * 字段名：KZGGDWXH
   * get方法
   * 备注: 
   */
   public Long getKzggdwxh(){

        return kzggdwxh;
   }

   /**
   * 字段名：KZGGDWXH
   * set方法
   * 备注: 
   */
   public void setKzggdwxh(Long kzggdwxh){
        this.kzggdwxh = kzggdwxh;
   }
   /**
   * 字段名：TSDYBZ
   * get方法
   * 备注: 
   */
   public Integer getTsdybz(){

        return tsdybz;
   }

   /**
   * 字段名：TSDYBZ
   * set方法
   * 备注: 
   */
   public void setTsdybz(Integer tsdybz){
        this.tsdybz = tsdybz;
   }
   /**
   * 字段名：KSSKZBZ
   * get方法
   * 备注: 
   */
   public Integer getKsskzbz(){

        return ksskzbz;
   }

   /**
   * 字段名：KSSKZBZ
   * set方法
   * 备注: 
   */
   public void setKsskzbz(Integer ksskzbz){
        this.ksskzbz = ksskzbz;
   }
   /**
   * 字段名：BBZL
   * get方法
   * 备注: 
   */
   public String getBbzl(){

        return bbzl;
   }

   /**
   * 字段名：BBZL
   * set方法
   * 备注: 
   */
   public void setBbzl(String bbzl){
        this.bbzl = bbzl;
   }
   /**
   * 字段名：MRJLDWBZ
   * get方法
   * 备注: 
   */
   public Integer getMrjldwbz(){

        return mrjldwbz;
   }

   /**
   * 字段名：MRJLDWBZ
   * set方法
   * 备注: 
   */
   public void setMrjldwbz(Integer mrjldwbz){
        this.mrjldwbz = mrjldwbz;
   }
   /**
   * 字段名：ZFBZ
   * get方法
   * 备注: 
   */
   public Boolean getZfbz(){

        return zfbz;
   }

   /**
   * 字段名：ZFBZ
   * set方法
   * 备注: 
   */
   public void setZfbz(Boolean zfbz){
        this.zfbz = zfbz;
   }
   /**
   * 字段名：JLSM
   * get方法
   * 备注: 
   */
   public String getJlsm(){

        return jlsm;
   }

   /**
   * 字段名：JLSM
   * set方法
   * 备注: 
   */
   public void setJlsm(String jlsm){
        this.jlsm = jlsm;
   }
   /**
   * 字段名：PSYPDM
   * get方法
   * 备注: 
   */
   public String getPsypdm(){

        return psypdm;
   }

   /**
   * 字段名：PSYPDM
   * set方法
   * 备注: 
   */
   public void setPsypdm(String psypdm){
        this.psypdm = psypdm;
   }
   /**
   * 字段名：YBJYB
   * get方法
   * 备注: 
   */
   public Integer getYbjyb(){

        return ybjyb;
   }

   /**
   * 字段名：YBJYB
   * set方法
   * 备注: 
   */
   public void setYbjyb(Integer ybjyb){
        this.ybjyb = ybjyb;
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
   * 字段名：CQCFMXXH
   * get方法
   * 备注: 
   */
   public Long getCqcfmxxh(){

        return cqcfmxxh;
   }

   /**
   * 字段名：CQCFMXXH
   * set方法
   * 备注: 
   */
   public void setCqcfmxxh(Long cqcfmxxh){
        this.cqcfmxxh = cqcfmxxh;
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
   * 字段名：GDZLXMXH
   * get方法
   * 备注: 
   */
   public Long getGdzlxmxh(){

        return gdzlxmxh;
   }

   /**
   * 字段名：GDZLXMXH
   * set方法
   * 备注: 
   */
   public void setGdzlxmxh(Long gdzlxmxh){
        this.gdzlxmxh = gdzlxmxh;
   }
   /**
   * 字段名：CJRQ
   * get方法
   * 备注: 
   */
   public String getCjrq(){

        return cjrq;
   }

   /**
   * 字段名：CJRQ
   * set方法
   * 备注: 
   */
   public void setCjrq(String cjrq){
        this.cjrq = cjrq;
   }
   /**
   * 字段名：YBBZ
   * get方法
   * 备注: 
   */
   public Boolean getYbbz(){

        return ybbz;
   }

   /**
   * 字段名：YBBZ
   * set方法
   * 备注: 
   */
   public void setYbbz(Boolean ybbz){
        this.ybbz = ybbz;
   }
   /**
   * 字段名：TFBZ
   * get方法
   * 备注: 
   */
   public Boolean getTfbz(){

        return tfbz;
   }

   /**
   * 字段名：TFBZ
   * set方法
   * 备注: 
   */
   public void setTfbz(Boolean tfbz){
        this.tfbz = tfbz;
   }
   /**
   * 字段名：CJLQM
   * get方法
   * 备注: 
   */
   public Integer getCjlqm(){

        return cjlqm;
   }

   /**
   * 字段名：CJLQM
   * set方法
   * 备注: 
   */
   public void setCjlqm(Integer cjlqm){
        this.cjlqm = cjlqm;
   }
   /**
   * 字段名：GFLDLB
   * get方法
   * 备注: 
   */
   public Integer getGfldlb(){

        return gfldlb;
   }

   /**
   * 字段名：GFLDLB
   * set方法
   * 备注: 
   */
   public void setGfldlb(Integer gfldlb){
        this.gfldlb = gfldlb;
   }
   /**
   * 字段名：DS
   * get方法
   * 备注: 
   */
   public Integer getDs(){

        return ds;
   }

   /**
   * 字段名：DS
   * set方法
   * 备注: 
   */
   public void setDs(Integer ds){
        this.ds = ds;
   }
   /**
   * 字段名：CSYY
   * get方法
   * 备注: 
   */
   public String getCsyy(){

        return csyy;
   }

   /**
   * 字段名：CSYY
   * set方法
   * 备注: 
   */
   public void setCsyy(String csyy){
        this.csyy = csyy;
   }
   /**
   * 字段名：MEMOINFO
   * get方法
   * 备注: 
   */
   public String getMemoinfo(){

        return memoinfo;
   }

   /**
   * 字段名：MEMOINFO
   * set方法
   * 备注: 
   */
   public void setMemoinfo(String memoinfo){
        this.memoinfo = memoinfo;
   }
   /**
   * 字段名：LDSQDMXXH
   * get方法
   * 备注: 
   */
   public Long getLdsqdmxxh(){

        return ldsqdmxxh;
   }

   /**
   * 字段名：LDSQDMXXH
   * set方法
   * 备注: 
   */
   public void setLdsqdmxxh(Long ldsqdmxxh){
        this.ldsqdmxxh = ldsqdmxxh;
   }
   /**
   * 字段名：WZKFDM
   * get方法
   * 备注: 
   */
   public String getWzkfdm(){

        return wzkfdm;
   }

   /**
   * 字段名：WZKFDM
   * set方法
   * 备注: 
   */
   public void setWzkfdm(String wzkfdm){
        this.wzkfdm = wzkfdm;
   }
   /**
   * 字段名：WZDM
   * get方法
   * 备注: 
   */
   public String getWzdm(){

        return wzdm;
   }

   /**
   * 字段名：WZDM
   * set方法
   * 备注: 
   */
   public void setWzdm(String wzdm){
        this.wzdm = wzdm;
   }
   /**
   * 字段名：WZKFMC
   * get方法
   * 备注: 
   */
   public String getWzkfmc(){

        return wzkfmc;
   }

   /**
   * 字段名：WZKFMC
   * set方法
   * 备注: 
   */
   public void setWzkfmc(String wzkfmc){
        this.wzkfmc = wzkfmc;
   }
   /**
   * 字段名：WZBM
   * get方法
   * 备注: 
   */
   public String getWzbm(){

        return wzbm;
   }

   /**
   * 字段名：WZBM
   * set方法
   * 备注: 
   */
   public void setWzbm(String wzbm){
        this.wzbm = wzbm;
   }
   /**
   * 字段名：TSCFXH
   * get方法
   * 备注: 
   */
   public String getTscfxh(){

        return tscfxh;
   }

   /**
   * 字段名：TSCFXH
   * set方法
   * 备注: 
   */
   public void setTscfxh(String tscfxh){
        this.tscfxh = tscfxh;
   }
   /**
   * 字段名：TSQKSM
   * get方法
   * 备注: 
   */
   public String getTsqksm(){

        return tsqksm;
   }

   /**
   * 字段名：TSQKSM
   * set方法
   * 备注: 
   */
   public void setTsqksm(String tsqksm){
        this.tsqksm = tsqksm;
   }
   /**
   * 字段名：TFYXBZ
   * get方法
   * 备注: 
   */
   public String getTfyxbz(){

        return tfyxbz;
   }

   /**
   * 字段名：TFYXBZ
   * set方法
   * 备注: 
   */
   public void setTfyxbz(String tfyxbz){
        this.tfyxbz = tfyxbz;
   }
   /**
   * 字段名：BGSYBZ
   * get方法
   * 备注: 
   */
   public Integer getBgsybz(){

        return bgsybz;
   }

   /**
   * 字段名：BGSYBZ
   * set方法
   * 备注: 
   */
   public void setBgsybz(Integer bgsybz){
        this.bgsybz = bgsybz;
   }
   /**
   * 字段名：TFSL
   * get方法
   * 备注: 
   */
   public BigDecimal getTfsl(){

        return tfsl;
   }

   /**
   * 字段名：TFSL
   * set方法
   * 备注: 
   */
   public void setTfsl(BigDecimal tfsl){
        this.tfsl = tfsl;
   }

}