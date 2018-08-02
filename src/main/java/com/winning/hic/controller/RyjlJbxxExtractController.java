package com.winning.hic.controller;

import com.winning.hic.base.Constant;
import com.winning.hic.base.utils.XmlUtil;
import org.dom4j.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
public class RyjlJbxxExtractController extends BaseController {
    private final Logger logger = LoggerFactory.getLogger(RyjlJbxxExtractController.class);

    @RequestMapping("/ryjl/extract")
    @ResponseBody
    public Map extract(String mbdm) {
        Document document = XmlUtil.getDocumentByPath("E:\\jackMa\\hic\\src\\main\\java\\com\\winning\\hic\\base\\utils\\mima.xml");
        String bscszxm = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "bscszxm"));////varchar(50) NOT NULL, --病史陈述者姓名
        String cszhzgxdm = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "cszhzgxdm"));////varchar(50) NOT NULL, --陈述者与患者的关系代码
        String cszhzgxmc = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "cszhzgxmc"));////varchar(50) NOT NULL, --陈述者与患者的关系名称
        String csnrbz = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "csnrbz"));////char(1) NOT NULL, --陈述内容可靠标志
        String zs = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "zs"));////nvarchar(100) NOT NULL, --主诉
        String xbs = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "xbs"));////nvarchar(2000) NOT NULL, --现病史
        String ybjkbz = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "ybjkbz"));//char(1) NULL, --一般健康状况标志
        String jbs = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "jbs"));//nvarchar(1000) NULL, --疾病史（含外伤）
        String hzcrbz = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "hzcrbz"));//char(1) NOT NULL, --患者传染性标志
        String crbs = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "crbs"));//nvarchar(1000) NULL, --传染病史
        String yfjzs = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "yfjzs"));//nvarchar(1000) NULL, --预防接种史
        String sss = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "sss"));//nvarchar(1000) NULL, --手术史
        String sxs = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "sxs"));//nvarchar(1000) NULL, --输血史
        String gms = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "gms"));//nvarchar(1000) NULL, --过敏史
        String grs = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "grs")); //nvarchar(1000) NULL, --个人史
        String hys = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "hys"));//nvarchar(1000) NULL, --婚育史
        String yjs = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "yjs"));//nvarchar(1000) NULL, --月经史
        String jzs = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "jzs"));//nvarchar(1000) NULL, --家族史
        String tjtw = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "tjtw"));//numeric(4, 1) NOT NULL, --体格检查-- 体温（℃）
        String tjml = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "tjml"));//numeric(3, 0) NOT NULL, --体格检查-- 脉率（次 / min）
        String tjhxpl = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "tjhxpl"));//numeric(3, 0) NOT NULL, --体格检查-- 呼吸频率（次 / min）
        String tjssy = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "tjssy"));//numeric(3, 0) NOT NULL, --体格检查-- 收缩压（mmHg）
        String tjszy = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "tjszy")); //numeric(3, 0) NOT NULL, --体格检查-- 舒张压（mmHg）
        String tjsg = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "tjsg"));//numeric(5, 2) NOT NULL, --体格检查-- 身高（cm）
        String tjtz = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "tjtz"));//numeric(5, 2) NOT NULL, --体格检查-- 体重（kg）
        String tjybjg = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "tjybjg"));//nvarchar(1000) NOT NULL, --体格检查-- 一般状况检查结果
        String tjplmjg = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "tjplmjg"));//nvarchar(1000) NOT NULL, --体格检查-- 皮肤和黏膜检查结果
        String tjqblbjg = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "tjqblbjg"));//nvarchar(1000) NOT NULL, --体格检查-- 全身浅表淋巴结检查结果
        String tjtbqgjg = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "tjtbqgjg"));//nvarchar(1000) NOT NULL, --体格检查-- 头部及其器官检查结果
        String tjjbjg = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "tjjbjg"));//nvarchar(1000) NOT NULL, --体格检查-- 颈部检查结果
        String tjxbjg = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "tjxbjg")); //nvarchar(1000) NOT NULL, --体格检查-- 胸部检查结果
        String tjfbjg = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "tjfbjg")); //nvarchar(1000) NOT NULL, --体格检查-- 腹部检查结果
        String tjgmzzjg = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "tjgmzzjg")); //nvarchar(1000) NOT NULL, --体格检查-- 肛门指诊检查结果描述
        String tjwszqjg = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "tjwszqjg"));//nvarchar(1000) NOT NULL, --体格检查-- 外生殖器检查结果
        String tjjzjg = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "tjjzjg"));//nvarchar(1000) NOT NULL, --体格检查-- 脊柱检查结果
        String tjszjg = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "tjszjg"));//nvarchar(1000) NOT NULL, --体格检查-- 四肢检查结果
        String tjsjxtjg = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "tjsjxtjg"));//nvarchar(1000) NOT NULL, --体格检查-- 神经系统检查结果
        String zkqk = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "zkqk"));//nvarchar(1000) NULL, --专科情况
        String fzjcjg = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "fzjcjg"));//nvarchar(1000) NULL, --辅助检查结果
        String zyszgcjg = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "zyszgcjg"));//nvarchar(1000) NULL, --中医“四诊”观察结果
        String zfbm = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "zfbm")); //varchar(20) NULL, --治则治法代码
        String zzzf = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "zzzf"));//nvarchar(100) NULL, --治则治法
        String czxyzdmc = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "czxyzdmc"));//varchar(128) NOT NULL, --初步诊断 - 西医诊断名称
        String czxyzdbm = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "czxyzdbm")); //varchar(64) NOT NULL, --初步诊断 - 西医诊断编码
        String czzybmdm = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "czzybmdm"));//varchar(64) NULL, --初步诊断 - 中医病名代码
        String czzybmmc = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "czzybmmc"));//varchar(128) NULL, --初步诊断 - 中医病名名称
        String czzyzhmc = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "czzyzhmc"));//varchar(128) NULL, --初步诊断 - 中医证候名称
        String czzyzhdm = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "czzyzhdm"));//varchar(64) NULL, --初步诊断 - 中医证候代码
        String czrq = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "czrq"));//date NOT NULL, --初步诊断日期 ?
        String xzxyzdmc = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "xzxyzdmc"));//varchar (128) NULL, --修正诊断 - 西医诊断名称
        String xzxyzdbm = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "xzxyzdbm"));//varchar(64) NULL, --修正诊断 - 西医诊断编码
        String xzzybmmc = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "xzzybmmc"));//varchar(128) NULL, --修正诊断 - 中医病名名称
        String xzzybmdm = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "xzzybmdm"));//varchar(64) NULL, --修正诊断 - 中医病名代码
        String xzzyzhmc = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "xzzyzhmc"));//varchar(128) NULL, --修正诊断 - 中医证候名称
        String xzzyzhdm = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "xzzyzhdm"));//varchar(64) NULL, --修正诊断 - 中医证候代码
        String xzzdrq = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "xzzdrq"));//date NULL, --修正诊断日期
        String qzxyzdmc = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "qzxyzdmc"));//varchar(128) NOT NULL, --确定诊断 - 西医诊断名称
        String qzxyzdbm = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "qzxyzdbm"));//varchar(64) NOT NULL, --确定诊断 - 西医诊断编码
        String qzzybmmc = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "qzzybmmc"));//varchar(128) NULL, --确定诊断 - 中医病名名称
        String qzzybmdm = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "qzzybmdm")); //varchar(64) NULL, --确定诊断 - 中医病名代码
        String qzzyzhmc = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "qzzyzhmc")); //varchar(128) NULL, --确定诊断 - 中医证候名称
        String qzzyzhdm = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "qzzyzhdm"));//varchar(64) NULL, --确定诊断 - 中医证候代码
        String qzrq = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "qzrq"));//date NOT NULL, --确定诊断日期 ?
        String bzmc = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "bzmc"));//varchar (128) NULL, --补充诊断名称
        String bzbm = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "bzbm"));//varchar(64) NULL, --补充诊断编码
        String bzrq = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "bzrq"));//date NULL, --补充诊断日期
        String ryzdsw = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "ryzdsw"));//varchar(20) NULL, --入院诊断顺位
        String jzysbm = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "jzysbm")); //varchar(20) NOT NULL, --接诊医师编码
        String jzysqm = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "jzysqm"));//varchar(50) NOT NULL, --接诊医师签名
        String zyysbm = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "zyysbm"));//varchar(20) NOT NULL, --住院医师编码
        String zyysqm = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "zyysqm")); //varchar(50) NOT NULL, --住院医师签名
        String zzysbm = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "zzysbm")); //varchar(20) NOT NULL, --主治医师编码
        String zzysqm = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "zzysqm"));//varchar(50) NOT NULL, --主治医师签名
        String zrysbm = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "zrysbm"));//varchar(20) NOT NULL, --主任医师编码
        String zrysqm = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "zrysqm"));//varchar(50) NOT NULL, --主任医师签名
        String gxsj = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "gxsj"));//datetime NOT NULL)--更新时间
        logger.info("病史陈述者姓名:{}", bscszxm);

        return resultMap;
    }


}
