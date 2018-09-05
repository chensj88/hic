package com.winning.hic.base.utils;

import com.winning.hic.model.MbzDataSet;
import com.winning.hic.model.MbzModelCheck;
import org.dom4j.*;
import org.dom4j.io.SAXReader;

import java.io.InputStream;
import java.util.List;

/**
 * 模板校验工具类
 */
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
        //文件结构id
        String dtjddm = info.getDtjddm();
        //基础模板id
        String qrmbdm = info.getQrmbdm();
        //元数据id
        String qrdxdm = info.getQrdxdm();
        //原子节点id
        String yzjddm = info.getYzjddm();
        if (StringUtil.isEmptyOrNull(dtjddm)) {
            //缺失文件结构id或字段未配置
            info.setStatus(1);
            info.setErrorDesc("字段未配置");
            return;
        }
        //获取文件结构节点
        Element dynamicModelNode = XmlUtil.getElementByAttr(rootElement, idAttrName, dtjddm);
        if (dynamicModelNode == null) {
            //文件结构不存在
            info.setStatus(1);
            info.setErrorDesc("缺少文件结构节点");
            return;
        }else{

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
                    embededNode = getEmbededNode(rootElement, element.attribute(refidAttrName).getValue(), qrmbdm);
                }
            }
            if (embededNode == null) {
                //文件结构不存在
                info.setStatus(1);
                info.setErrorDesc("缺少基础模板节点");
                return;
            }
        }
        //元数据节点
        Element objectNode = null;
        if (!StringUtil.isEmptyOrNull(qrdxdm)) {
            objectNode = XmlUtil.getElementByAttr(embededNode, idAttrName, qrdxdm);
            if (objectNode == null) {
                //文件结构不存在
                info.setStatus(1);
                info.setErrorDesc("缺少元数据节点");
                return;
            }
        }


        //原子节点
        Element atomNode = null;
        if (!StringUtil.isEmptyOrNull(yzjddm)) {
            atomNode = XmlUtil.getElementByAttr(objectNode, idAttrName, yzjddm);
            if (atomNode == null) {
                //文件结构不存在
                info.setStatus(1);
                info.setErrorDesc("缺少原子节点");
                return;
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

}

