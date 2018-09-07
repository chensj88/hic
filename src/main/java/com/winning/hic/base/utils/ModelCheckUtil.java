package com.winning.hic.base.utils;

import com.winning.hic.model.EmrMbmxk;
import com.winning.hic.model.MbzDataSet;
import com.winning.hic.model.MbzModelCheck;
import com.winning.hic.service.EmrMbmxkService;
import org.dom4j.*;
import org.dom4j.io.SAXReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.InputStream;
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

    private static ModelCheckUtil modelCheckUtil;

    @PostConstruct
    public void init() {
        modelCheckUtil = this;
        modelCheckUtil.emrMbmxkService = this.emrMbmxkService;
    }

    public static void main(String[] args) {
        InputStream in = com.winning.hic.base.utils.DomUtils.class.getClassLoader().getResourceAsStream("swjl.xml");
        System.out.println(in);
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
        //模板代码
        String mbdm = info.getModelCode();
        //文件结构id
        String dtjddm = info.getDtjddm();
        //基础模板id
        String qrmbdm = info.getQrmbdm();
        //元数据id
        String qrdxdm = info.getQrdxdm();
        //原子节点id
        String yzjddm = info.getYzjddm();
        //节点类型
        Integer type = info.getType();
        //必填标志
        Integer bt = info.getBt();
        //字段是否配置校验
        if (StringUtil.isEmptyOrNull(dtjddm)) {
            //缺失文件结构id或字段未配置
            info.setStatus(1);
            info.setErrorDesc("文件结构ID未配置");
            return;
        }
        if (type == 2) {
            if (StringUtil.isEmptyOrNull(qrmbdm)) {
                info.setStatus(1);
                info.setErrorDesc("基础模板ID未配置");
                return;
            }

        } else if (type == 3) {
            if (StringUtil.isEmptyOrNull(qrdxdm)) {
                info.setStatus(1);
                info.setErrorDesc("元数据ID未配置");
                return;
            }

        } else if (type == 4) {
            if (StringUtil.isEmptyOrNull(yzjddm)) {
                info.setStatus(1);
                info.setErrorDesc("原子节点ID未配置");
                return;
            }

        }

        //获取文件结构节点
        Element dynamicModelNode = XmlUtil.getElementByAttr(rootElement, idAttrName, dtjddm);
        if (dynamicModelNode == null) {
            //文件结构不存在
            info.setStatus(1);
            info.setErrorDesc("缺少节点");
            return;
        } else if (type == 1) {
            //文件结构必填
            String canNull = XmlUtil.getValueByAttrName(dynamicModelNode, "canNull");
            if (canNull == null || !"False".equals(canNull)) {
                info.setStatus(1);
                info.setErrorDesc("未控制必填");
                return;
            }
        }
        //遍历文件结构的子节点
        List<Element> dynamicChildNodeList = dynamicModelNode.elements(nodeTagName);
        //基础模板节点
        Element embededNode = null;
        if (!StringUtil.isEmptyOrNull(qrmbdm)) {
            //当模板id存在时，校验基础模板节点
            for (Element element : dynamicChildNodeList) {
                Attribute nodeTypeAttr = element.attribute(nodetypeAttrName);
                if (nodeTypeAttr != null && refNodeType.equals(nodeTypeAttr.getValue())) {
                    embededNode = getEmbededNodeByRefid(mbdm, element.attribute(refidAttrName).getValue(), qrmbdm);
                }
            }
            if (embededNode == null) {
                //基础模板不存在
                info.setStatus(1);
                info.setErrorDesc("缺少节点");
                return;
            }
        }
        //元数据节点
        Element objectNode = null;
        if (!StringUtil.isEmptyOrNull(qrdxdm)) {
            objectNode = XmlUtil.getElementByAttr(embededNode, idAttrName, qrdxdm);
            if (objectNode == null) {
                //元数据不存在
                info.setStatus(1);
                info.setErrorDesc("缺少节点");
                return;
            } else if (type == 1) {
                //获取当前元数据下原子节点
                Element currentAtomNode = objectNode.element("node");
                String minrequired = XmlUtil.getValueByAttrName(currentAtomNode, "minrequired");
                if (minrequired == null || !"1".equals(minrequired)) {
                    info.setStatus(1);
                    info.setErrorDesc("未控制必填");
                    return;
                }
            }
        }


        //原子节点
        Element atomNode = null;
        if (!StringUtil.isEmptyOrNull(yzjddm)) {
            atomNode = XmlUtil.getElementByAttr(objectNode, idAttrName, yzjddm);
            if (atomNode == null) {
                //原子节点不存在
                info.setStatus(1);
                info.setErrorDesc("缺少节点");
                return;
            } else if (type == 1) {
                String minrequired = XmlUtil.getValueByAttrName(atomNode, "minrequired");
                if (minrequired == null || !"1".equals(minrequired)) {
                    info.setStatus(1);
                    info.setErrorDesc("未控制必填");
                    return;
                }
            }
        }
        info.setStatus(0);
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

