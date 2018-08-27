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
        InputStream in = com.winning.hic.base.utils.DomUtils.class.getClassLoader().getResourceAsStream("24hcryjl.xml");
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
        info.setDtjddm("2079e311-fddc-488e-955a-e5dc61e18c35");
        info.setQrmbdm(null);
        info.setQrdxdm(null);
        info.setYzjddm(null);
        System.out.println(checkNode(rootElement, info));
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
     * 根据MbzDataSet获取值信息
     * 备注：MbzDataSet中dictInfo字段作为取值界限参数，存在则取code，反之则取value
     *
     * @param document
     * @param info
     * @return
     */
    public static String getAttrValueByDataSet(Document document, MbzModelCheck info) {
        Element rootElement = document.getRootElement();
        return checkNode(rootElement, info);
    }

    public static String checkNode(Element rootElement, MbzModelCheck info) {
        StringBuilder result = new StringBuilder();
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
            result.append("字段未配置！");
            return result.toString();
        }
        //获取文件结构节点
        List<Element> nodeChildList = rootElement.elements(nodeTagName);
        //定义需要的node子节点（文件结构）
        Element dynamicModelNode = null;
        //遍历所有的子节点,找到需要文件结构节点
        for (Element childEle : nodeChildList) {
            Attribute idAttr = childEle.attribute(idAttrName);
            if (idAttr != null && info.getDtjddm().equals(idAttr.getValue())) {
                //当node节点的id为文件结构id时，获取文件结构节点
                dynamicModelNode = childEle;
                break;
            }
        }
        if (dynamicModelNode == null) {
            //文件结构不存在
            result.append("缺少节点");
            return result.toString();
        }
        StringBuilder builder = new StringBuilder();
        //遍历文件结构的子节点
        List<Element> dynamicChildNodeList = dynamicModelNode.elements(nodeTagName);
        //基础模板节点
        Element embededNode = null;
        if (qrmbdm != null) {
            //当模板id存在是，校验基础模板节点
            for (Element element : dynamicChildNodeList) {
                Attribute nodeTypeAttr = element.attribute(nodetypeAttrName);
                if (nodeTypeAttr != null && refNodeType.equals(nodeTypeAttr.getValue())) {
                    embededNode = checkRefNode(rootElement, element.attribute(refidAttrName).getValue(), info);
                }
            }
        }
        if (embededNode == null) {
            //文件结构不存在
            result.append("缺少基础模板节点");
            return result.toString();
        }
        //元数据节点
        Element objectNode = XmlUtil.getElementById(embededNode, qrdxdm);
        if (objectNode == null) {
            //文件结构不存在
            result.append("缺少元数据节点");
            return result.toString();
        }

        //原子节点节点
        Element atomNode = XmlUtil.getElementById(objectNode, yzjddm);
        if (atomNode == null) {
            //文件结构不存在
            result.append("缺少原子节点节点");
            return result.toString();
        }

        System.out.println(builder.toString());
        return builder.toString();
    }

    /**
     * 解析Ref引用节点
     *
     * @param rootElement
     * @param refId
     * @return
     */
    private static Element checkRefNode(Element rootElement, String refId, MbzModelCheck info) {
        StringBuilder builder = new StringBuilder();
        //获取所有的Ref元素
        List<Element> refList = rootElement.elements(refTagName);
        Element refElement = null;
        //提取指定基础模板元素
        for (Element element : refList) {
            Attribute idAttr = element.attribute(idAttrName);
            if (idAttr != null && refId.equals(idAttr.getValue())) {
                refElement = element;
            }
        }
        //获取基础模板元素
        Element refChildElement = refElement.element(nodeTagName);
        return refChildElement;
    }

    /**
     * 解析元数据节点
     *
     * @param objElement
     * @return
     */
    private static String resolveObjectNode(Element objElement, MbzModelCheck info) {
        StringBuilder builder = new StringBuilder();
        List<Element> objectChildList = objElement.elements(nodeTagName);
        for (Element element : objectChildList) {
            //获取节点类型属性
            Attribute nodeTypeAttr = element.attribute(nodetypeAttrName);
            //获取节点ID属性
            Attribute idAttr = element.attribute(idAttrName);
            if (info.getYzjddm() == null) {
                if (nodeTypeAttr != null && textNodeType.equals(nodeTypeAttr.getValue())) {
                    builder.append(element.attribute(textAttrName) == null ? "" : resolveString(element.attribute(textAttrName).getValue()));
                } else if (nodeTypeAttr != null && atomNodeType.equals(nodeTypeAttr.getValue())) {
                    builder.append(resolveAtomNode(element, info));
                }
            } else {
                if (nodeTypeAttr != null && atomNodeType.equals(nodeTypeAttr.getValue())
                        && idAttr != null
                        && info.getYzjddm().equals(idAttr.getValue())) {
                    builder.append(resolveAtomNode(element, info));
                }
            }

        }
        return builder.toString();
    }

    /**
     * 解析获取原子节点数据
     *
     * @param node
     * @return
     */
    public static String resolveAtomNode(Element node, MbzModelCheck info) {
        String nodeValue = node.attribute(valueAttrName).getValue();
        String[] split = nodeValue.split("`");
        String value = null;
        if (split.length >= 2) {
//            if (!StringUtil.isEmptyOrNull(info.getDictCode())) {
//                value = resolveString(split[0]);
//            } else {
//                value = resolveString(split[1].trim());
//            }
        } else if (split.length == 0) {
            value = "";
        } else if (split.length == 1) {
            value = split[0];
        }

        return value;
    }


    public static String resolveString(String str) {
        str = str.trim();
        str = str.replaceAll(" ", "");
        str = str.replaceAll("&#xA;", "");
        return str;
    }

}

