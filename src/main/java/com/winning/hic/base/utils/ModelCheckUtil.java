package com.winning.hic.base.utils;

import com.winning.hic.model.EmrMbmxk;
import com.winning.hic.model.MbzDataSet;
import com.winning.hic.model.MbzModelCheck;
import com.winning.hic.service.EmrMbmxkService;
import com.winning.hic.service.MbzDataSetService;
import org.dom4j.*;
import org.dom4j.io.SAXReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * @Description 模板校验工具类
 * @Author Evol
 * @Date 2018年9月6日14:25:26
 */
@Component
public class ModelCheckUtil {


    public static final String nodeTagName = "node";
    public static final String refTagName = "Ref";

    private static final String valueAttrName = "value";
    private static final String textAttrName = "text";
    private static final String refidAttrName = "refid";
    private static final String nodetypeAttrName = "nodetype";
    private static final String idAttrName = "id";


    public static final String dtjdNodeType = "DynamicMoleNode";
    public static final String textNodeType = "Text";
    public static final String refNodeType = "Embeded";
    public static final String objectNodeType = "Object";
    public static final String atomNodeType = "AtomNode";

    @Autowired
    private EmrMbmxkService emrMbmxkService;
    @Autowired
    private MbzDataSetService mbzDataSetService;

    private static ModelCheckUtil modelCheckUtil;

    @PostConstruct
    public void init() {
        modelCheckUtil = this;
        modelCheckUtil.emrMbmxkService = this.emrMbmxkService;
        modelCheckUtil.mbzDataSetService = this.mbzDataSetService;
    }

    public static void main(String[] args) {
        InputStream in = com.winning.hic.base.utils.DomUtils.class.getClassLoader().getResourceAsStream("swjl.xml");
        //System.out.println(in);
        SAXReader reader = new SAXReader();
        Document document = null;
        try {
            document = reader.read(in);
        } catch (DocumentException e) {
            e.printStackTrace();
        }

        Element rootElement = document.getRootElement();
        MbzModelCheck info = new MbzModelCheck();
        info.setDtjddm("69847544-7127-4a32-ab47-d306240e9fa8");
        info.setQrmbdm("38948231-d584-41a0-ae65-5593c37e540a");
        info.setQrdxdm("043a2b65-84f2-456e-850c-ae42173ed904");
        info.setYzjddm(null);
        checkNode(rootElement, info);
    }

    public static Document getDocument(String xmlStr) {
        Document document = null;
        try {
            document = DocumentHelper.parseText(xmlStr);
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        return document;
    }

    /**
     * 根据校验规则校验
     *
     * @param document
     * @param info
     * @return
     */
    public static void checkByModelCheck(Document document, MbzModelCheck info) {
        Element rootElement = document.getRootElement();
        checkNode(rootElement, info);
    }

    public static void checkNode(Element rootElement, MbzModelCheck info) {
        //清空上次校验结果
        info.setStatus(null);
        info.setErrorDesc(null);
        //根据sourceType，pyCode获取字段配置
        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(info.getSourceType());
        mbzDataSet.setPyCode(info.getPyCode());
        List<MbzDataSet> mbzDataSetList = modelCheckUtil.mbzDataSetService.getMbzDataSetList(mbzDataSet);
        //记录是否为当前校验的操作
        for (int i = 0; i < mbzDataSetList.size(); i++) {
            //判断字段是否需要校验 0:不需要  1：需要
            Integer mustMatch = mbzDataSetList.get(i).getMustMatch();
            info.setMustMatch(mustMatch);
            info.setBt(mbzDataSetList.get(i).getBt());
            if (mustMatch.intValue() == 0) {
                info.setStatus(0);
                info.setErrorDesc("");
                return;
            }

            //模板代码
            String mbdm = info.getModelCode();
            //文件结构id
            String dtjddm = mbzDataSetList.get(i).getDtjddm();
            //基础模板id
            String qrmbdm = mbzDataSetList.get(i).getQrmbdm();
            //元数据id
            String qrdxdm = mbzDataSetList.get(i).getQrdxdm();
            //原子节点id
            String yzjddm = mbzDataSetList.get(i).getYzjddm();
            //节点类型
            Integer type = mbzDataSetList.get(i).getDataType();
            //必填标志
            Integer bt = mbzDataSetList.get(i).getBt();
            //字段是否配置校验
            if (StringUtil.isEmptyOrNull(dtjddm)) {
                //缺失文件结构id或字段未配置
                if (i == 0) {
                    info.setStatus(1);
                    info.setErrorDesc("文件结构ID未配置");
                }
                continue;
            }
            if (type == 2) {
                if (StringUtil.isEmptyOrNull(qrmbdm)) {
                    if (i == 0) {
                        info.setStatus(1);
                        info.setErrorDesc("基础模板ID未配置");
                    }
                    continue;
                }

            } else if (type == 3) {
                if (StringUtil.isEmptyOrNull(qrdxdm)) {
                    if (i == 0) {
                        info.setStatus(1);
                        info.setErrorDesc("元数据ID未配置");
                    }
                    continue;
                }

            } else if (type == 4) {
                if (StringUtil.isEmptyOrNull(yzjddm)) {
                    if (i == 0) {
                        info.setStatus(1);
                        info.setErrorDesc("原子节点ID未配置");
                    }
                    continue;
                }

            }

            //获取文件结构节点
            Element dynamicModelNode = XmlUtil.getElementByAttr(rootElement, idAttrName, dtjddm);
            if (dynamicModelNode == null) {
                //文件结构不存在
                if (i == 0 || (i != 0 && !"未控制必填".equals(info.getErrorDesc()))) {
                    //当第一次校验或者不是第一次校验且校验结果不为“为控制必填”
                    info.setStatus(1);
                    info.setErrorDesc("缺少节点");
                }
                continue;
            } else if (mustMatch == 1 && type == 1 && StringUtil.isEmptyOrNull(qrdxdm) && bt == 1) {
                //文件结构必填
                String canNull = XmlUtil.getValueByAttrName(dynamicModelNode, "canNull");
                if ((canNull == null || !"False".equals(canNull)) && bt == 1) {
                    info.setStatus(1);
                    info.setErrorDesc("未控制必填");
                    continue;
                }
            }
            //遍历文件结构的子节点
            List<Element> dynamicChildNodeList = dynamicModelNode.elements(nodeTagName);
            //基础模板节点
            Element embededNode = null;
            List<Element> embededNodeList = new ArrayList<>();
            if (!StringUtil.isEmptyOrNull(qrmbdm)) {
                //当模板id存在时，校验基础模板节点
                for (Element element : dynamicChildNodeList) {
                    Attribute nodeTypeAttr = element.attribute(nodetypeAttrName);
                    if (nodeTypeAttr != null && refNodeType.equals(nodeTypeAttr.getValue())) {
                        Element embededNodeTemp = getEmbededNodeByRefid(mbdm, element.attribute(refidAttrName).getValue(), qrmbdm);
                        if (embededNodeTemp != null) {
                            //当取到节点时，跳出循环，否则遍历文件结构下所有ref节点查找模板节点
                            embededNodeList.add(embededNodeTemp);
                        }
                    }
                }
                if (embededNodeList.size() == 0) {
                    //基础模板不存在
                    if (i == 0 || (i != 0 && !"未控制必填".equals(info.getErrorDesc()))) {
                        //当第一次校验或者不是第一次校验且校验结果不为“为控制必填”
                        info.setStatus(1);
                        info.setErrorDesc("缺少节点");
                    }
                    continue;
                }
            }
            //元数据节点
            Element objectNode = null;
            List<Element> objectNodeList = new ArrayList<>();
            //循环遍历基础模板
            if (!StringUtil.isEmptyOrNull(qrdxdm)) {
                for (Element embededTemp : embededNodeList) {
                    Element objectNodeTemp = XmlUtil.getElementByAttr(embededTemp, idAttrName, qrdxdm);
                    if (objectNodeTemp != null) {
                        objectNodeList.add(objectNodeTemp);
                    }
                }

                if (objectNodeList.size() == 0) {
                    //元数据不存在
                    if (i == 0 || (i != 0 && !"未控制必填".equals(info.getErrorDesc()))) {
                        //当第一次校验或者不是第一次校验且校验结果不为“为控制必填”
                        info.setStatus(1);
                        info.setErrorDesc("缺少节点");
                    }
                    continue;
                } else if (mustMatch == 1 && (type == 3 || !StringUtil.isEmptyOrNull(qrdxdm))) {
                    Boolean flag = true;
                    for (Element objectTemp : objectNodeList) {
                        //遍历元数据获取当前元数据下原子节点
                        Element currentAtomNode = objectTemp.element("node");
                        if (currentAtomNode == null) {
                            continue;
                        }
                        String minrequired = XmlUtil.getValueByAttrName(currentAtomNode, "minrequired");
                        if ((minrequired == null || !"1".equals(minrequired)) && bt == 1) {
                            info.setStatus(1);
                            info.setErrorDesc("未控制必填");
                            flag = false;
                        } else if (minrequired != null && "1".equals(minrequired)) {
                            flag = true;
                            break;
                        }
                    }
                    if (!flag) {
                        //未控制必填则继续校验
                        continue;
                    }
                }
            }

            if (!StringUtil.isEmptyOrNull(yzjddm)) {
                //循环元数据
                for (Element objectNodeTemp : objectNodeList) {
                    Element atomNode = XmlUtil.getElementById(objectNodeTemp, yzjddm);
                    if (atomNode == null) {
                        //原子节点不存在
                        if (i == 0 || (i != 0 && !"未控制必填".equals(info.getErrorDesc()))) {
                            //当第一次校验或者不是第一次校验且校验结果不为“为控制必填”
                            info.setStatus(1);
                            info.setErrorDesc("缺少节点");
                        }
                        continue;
                    } else if (mustMatch == 1 && type == 4) {
                        String minrequired = XmlUtil.getValueByAttrName(atomNode, "minrequired");
                        if ((minrequired == null || !"1".equals(minrequired)) && bt == 1) {
                            info.setStatus(1);
                            info.setErrorDesc("未控制必填");
                            continue;
                        }
                    }
                }
            }
            info.setStatus(0);
            info.setErrorDesc("");
            return;
        }

    }

    /**
     * 获取基础模板节点
     *
     * @param rootElement
     * @param refId
     * @param id
     * @return
     */
    private static Element getEmbededNode(Element rootElement, String refId, String id) {
        //获取所有的Ref元素
        Element refElement = XmlUtil.getElementByAttr(rootElement, idAttrName, refId);
        //获取基础模板元素
        Element embededElement = XmlUtil.getElementByAttr(refElement, idAttrName, id);
        return embededElement;
    }


    /**
     * 在模板明细表中获取基础模板节点
     *
     * @param mbdm
     * @param refId
     * @param id
     * @return
     */
    private static Element getEmbededNodeByRefid(String mbdm, String refId, String id) {
        EmrMbmxk emrMbmxk = new EmrMbmxk();
        emrMbmxk.setMbdm(mbdm);
        emrMbmxk.setJdrefid(Integer.parseInt(refId));
        emrMbmxk = modelCheckUtil.emrMbmxkService.getEmrMbmxk(emrMbmxk);
        String nodeStr = emrMbmxk.getJdnr();
        Document document = XmlUtil.getDocument(nodeStr);
        //获取基础模板元素
        Element embededElement = document.getRootElement();
        String currentId = XmlUtil.getValueByAttrName(embededElement, idAttrName);
        if (!id.equals(currentId)) {
            embededElement = null;
        }
        return embededElement;
    }

}

