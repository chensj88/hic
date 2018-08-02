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
        String bscszxm = XmlUtil.getAttrValueByDataSet(document, getMbzDataSetBySourceTypeAndAbbreviation(Constant.WN_RYJL_JBXX_SOURCE_TYPE, "bscszxm"));//varchar(50) NOT NULL, --病史陈述者姓名
//        String cszhzgxdm = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(50) NOT NULL, --陈述者与患者的关系代码
//        String cszhzgxmc = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(50) NOT NULL, --陈述者与患者的关系名称
//        String csnrbz = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//char(1) NOT NULL, --陈述内容可靠标志
//        String zs = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//nvarchar(100) NOT NULL, --主诉
//        String xbs = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//nvarchar(2000) NOT NULL, --现病史
//        String ryqk = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//nvarchar(2000) NOT NULL, --入院情况
//        String zzmc = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(50) NOT NULL, --症状名称?
//        String zzms = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//nvarchar(1000) NOT NULL, --症状描述?
//        String zyszgcjg = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//nvarchar(1000)NULL, --中医“四诊”观察结果
//        String zfbm = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(20)NULL, --治则治法代码
//        String zzzf = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//nvarchar(100)NULL, --治则治法
//        String rzxyzdmc = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(128) NOT NULL, --入院诊断-西医诊断名称
//        String rzxzzdbm = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(64) NOT NULL, --入院诊断-西医诊断编码
//        String rzzybmmc = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(128)NULL, --入院诊断-中医病名名称
//        String rzzybmdm = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(64)NULL, --入院诊断-中医病名代码
//        String rzzyzhmc = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(128)NULL, --入院诊断-中医证候名称
//        String rzzyzhdm = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(64)NULL, --入院诊断-中医证候代码
//        String zlgcms = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value"); //nvarchar(2000) NOT NULL, --诊疗过程描述
//        String cyqk = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//nvarchar(2000) NOT NULL, --出院情况
//        String czxyzdmc = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(128) NOT NULL, --出院诊断-西医诊断名称
//        String czxyzdbm = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(64) NOT NULL, --出院诊断-西医诊断编码
//        String czzybmmc = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(128) NOT NULL, --出院诊断-中医病名名称?
//        String czzybmdm = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(64) NOT NULL, --出院诊断-中医病名代码?
//        String czzyzhmc = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(128) NOT NULL, --出院诊断-中医证候名称?
//        String czzyzhdm = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(64) NOT NULL, --出院诊断-中医证候代码?
//        String cyyz = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//nvarchar(1000)NULL, --出院医嘱
//        String yzklysbm = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(20)NULL, --医嘱开立医师编码
//        String cyyzklrqm = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(50)NULL, --出院医嘱开立人签名
//        String cyyzklrq = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//datetime NULL, --出院医嘱开立日期时间
//        String jzysbm = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(20) NOT NULL, --接诊医师编码
//        String jzysqm = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(50) NOT NULL, --接诊医师签名
//        String zyysbm = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(20) NOT NULL, --住院医师编码
//        String zyysqm = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(50) NOT NULL, --住院医师签名
//        String zzysbm = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(20) NOT NULL, --主治医师编码
//        String zzysqm = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value"); //varchar(50) NOT NULL, --主治医师签名
//        String zrysbm = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(20) NOT NULL, --主任医师编码
//        String zrysqm = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value");//varchar(50) NOT NULL, --主任医师签名
//        String gxsj = XmlUtil.getAttrValue(nodes, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "value"); //datetime NOT NULL) --更新时间
        logger.info("病史陈述者姓名:{}", bscszxm);

        return resultMap;
    }


}
