package com.winning.hic.base.utils;

import com.winning.hic.model.MbzDataSet;
import org.dom4j.*;
import org.dom4j.io.SAXReader;
import org.thymeleaf.util.StringUtils;

import java.io.InputStream;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: LENOVO
 * Date: 2018-08-09
 * Time: 13:14
 */
public class DomUtils {

    public static final String nodeTagName = "node";
    public static final String refTagName = "Ref";


    private static final String valueAttrName = "value";
    private static final String textAttrName = "text";
    private static final String refidAttrName = "refid";
    private static final String nodetypeAttrName = "nodetype";
    private static final String atomtypeAttrName = "atomtype";
    private static final String idAttrName = "id";
    public static final String displayAttrName = "display";


    public static final String dtjdNodeType = "DynamicMoleNode";
    public static final String textNodeType = "Text";
    public static final String refNodeType = "Embeded";
    public static final String objectNodeType = "Object";
    public static final String atomNodeType = "AtomNode";
    public static final String ATOM_TYPE_DYNAMIC = "Dynamic";
    public static final String ATOM_TYPE_STRING = "String";
    public static final String ATOM_TYPE_CHECK = "Check";

    public static void main(String[] args) {
        InputStream in = DomUtils.class.getClassLoader().getResourceAsStream("24hcryjl.xml");
        System.out.println(in);
        SAXReader reader = new SAXReader();
        Document document = null;
        try {
            document = reader.read(in);
        } catch (DocumentException e) {
            e.printStackTrace();
        }

        Element rootElement = document.getRootElement();
        MbzDataSet info = new MbzDataSet();
        info.setDtjddm("2079e311-fddc-488e-955a-e5dc61e18c35");
        info.setQrmbdm(null);
        info.setQrdxdm(null);
        info.setYzjddm(null);
        System.out.println(resolveNodeInfo(rootElement, info));

        String ss = "1010111";
        for (int i = 0; i < ss.length(); i++) {
            Character c = ss.charAt(i);
            Character o = new Character('0');
            if (c.equals(o)) {
                System.out.println("i=" + i);
            }
        }


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
    public static String getAttrValueByDataSet(Document document, MbzDataSet info) {
        Element rootElement = document.getRootElement();
        return resolveNodeInfo(rootElement, info);
    }

    public static String resolveNodeInfo(Element rootElement, MbzDataSet info) {
        StringBuilder builder = new StringBuilder();
        //获取所有的node子节点
        List<Element> nodeChildList = rootElement.elements(nodeTagName);
        //定义需要的node子节点
        Element dynamicModelNode = null;
        //遍历所有的子节点,找到需要文件结构节点
        for (Element childEle : nodeChildList) {
            Attribute idAttr = childEle.attribute(idAttrName);
            if (idAttr != null && info.getDtjddm().equals(idAttr.getValue())) {
                dynamicModelNode = childEle;
                //判断节点是否可视
                break;
            }
        }
        String visiable = XmlUtil.getValueByAttrName(dynamicModelNode, "visiable");
        if ("False".equalsIgnoreCase(visiable)) {
            builder.append("");
            return builder.toString();
        }
        String dynamicDisplay = dynamicModelNode.attribute(displayAttrName).getValue();
        String[] slipt_display = dynamicDisplay.split("`");
        if (slipt_display[0].equals("20") && slipt_display[3].equals("9") && StringUtils.isEmpty(info.getDictCode()) && info.getPyCode().equals("bltd")) {
            builder.append(slipt_display[1]);
        }

        //遍历文件结构的子节点
        List<Element> dynamicChildNodeList = dynamicModelNode.elements(nodeTagName);

        for (Element element : dynamicChildNodeList) {
            //判断节点是否可视
            String val = XmlUtil.getValueByAttrName(element, "visiable");
            if ("False".equalsIgnoreCase(val)) {
                builder.append("");
                continue;
            }
            Attribute nodeTypeAttr = element.attribute(nodetypeAttrName);
            if (StringUtil.isEmptyOrNull(info.getQrmbdm())) {

                if (nodeTypeAttr != null && textNodeType.equals(nodeTypeAttr.getValue())) { //文本节点
                    builder.append(" " + resolveTextString(element.attribute(textAttrName).getValue()).trim());
                } else if (nodeTypeAttr != null && refNodeType.equals(nodeTypeAttr.getValue())) { //引入节点
                    builder.append(" " + resolveRefNode(rootElement, element.attribute(refidAttrName).getValue(), info).trim());
                }
            } else {
                if (nodeTypeAttr != null && refNodeType.equals(nodeTypeAttr.getValue())) { //引入节点
                    builder.append(" " + resolveRefNode(rootElement, element.attribute(refidAttrName).getValue(), info).trim());
                }
            }

        }
        return builder.toString();
    }

    /**
     * 解析Ref引用节点
     *
     * @param rootElement
     * @param refId
     * @return
     */
    private static String resolveRefNode(Element rootElement, String refId, MbzDataSet info) {
        StringBuilder builder = new StringBuilder();
        //获取所有的Ref元素
        List<Element> refList = rootElement.elements(refTagName);
        Element refElement = null;
        //提取指定基础模板元素
        for (Element element : refList) {
            Attribute idAttr = element.attribute(idAttrName);
            if (idAttr != null && refId.equals(idAttr.getValue())) {
                refElement = element;
                break;
            }
        }
        //获取基础模板元素
        Element refChildElement = refElement.element(nodeTagName);
        String val = XmlUtil.getValueByAttrName(refChildElement, "visiable");
        if ("False".equalsIgnoreCase(val)) {
            builder.append("");
            return builder.toString();
        }
        //基础模板id
        String qrmbdm = info.getQrmbdm();
        if ((!StringUtil.isEmptyOrNull(qrmbdm) && qrmbdm.equals(refChildElement.attribute(idAttrName).getValue())) || StringUtil.isEmptyOrNull(qrmbdm)) {
            //获取基础模板元素子节点集合
            List<Element> embededElementList = refChildElement.elements(nodeTagName);
            //遍历解析基础模板子节点
            for (Element element : embededElementList) {
                //判断节点是否可视
                String visiable = XmlUtil.getValueByAttrName(element, "visiable");
                if ("False".equalsIgnoreCase(visiable)) {
                    builder.append("");
                    continue;
                }
                //获取节点类型属性
                Attribute nodeTypeAttr = element.attribute(nodetypeAttrName);
                //获取节点ID属性
                Attribute idAttr = element.attribute(idAttrName);
                //只有文件结构ID，没有模板ID，取全部数据
                if (StringUtil.isEmptyOrNull(info.getQrmbdm()) || (!StringUtil.isEmptyOrNull(info.getQrmbdm()) && StringUtil.isEmptyOrNull(info.getQrdxdm()))) {
                    if (nodeTypeAttr != null && textNodeType.equals(nodeTypeAttr.getValue())) {
                        builder.append(
                                element.attribute(textAttrName) == null ? "" : resolveTextString(element.attribute(textAttrName).getValue()));
                    } else if (nodeTypeAttr != null && objectNodeType.equals(nodeTypeAttr.getValue())) {
                        builder.append(resolveObjectNode(element, info));
                    }
                } else {//存在基础模板ID取模板数据
                    if (nodeTypeAttr != null && objectNodeType.equals(nodeTypeAttr.getValue())
                            && idAttr != null
                            && info.getQrdxdm().equals(idAttr.getValue())) {
                        builder.append(resolveObjectNode(element, info));
                    }
                }
            }
        }
        return builder.toString();
    }

    /**
     * 解析元数据节点
     *
     * @param objElement
     * @return
     */
    private static String resolveObjectNode(Element objElement, MbzDataSet info) {
        StringBuilder builder = new StringBuilder();
        String visiable = XmlUtil.getValueByAttrName(objElement, "visiable");
        if ("False".equalsIgnoreCase(visiable)) {
            builder.append("");
            return builder.toString();
        }
        List<Element> objectChildList = objElement.elements(nodeTagName);
        for (Element element : objectChildList) {
            //判断节点是否可视
            String val = XmlUtil.getValueByAttrName(element, "visiable");
            if ("False".equalsIgnoreCase(val)) {
                builder.append("");
                continue;
            }
            //获取节点类型属性
            Attribute nodeTypeAttr = element.attribute(nodetypeAttrName);
            //获取节点ID属性
            Attribute idAttr = element.attribute(idAttrName);
            if (StringUtil.isEmptyOrNull(info.getYzjddm())) {
                if (nodeTypeAttr != null && textNodeType.equals(nodeTypeAttr.getValue())) {
                    builder.append(element.attribute(textAttrName) == null ? "" : resolveTextString(element.attribute(textAttrName).getValue()));
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
    public static String resolveAtomNode(Element node, MbzDataSet info) {
        String value = null;
        //判断节点是否可视
        String visiable = XmlUtil.getValueByAttrName(node, "visiable");
        if ("False".equalsIgnoreCase(visiable)) {
            value = "";
            return value;
        }
        String nodeValue = node.attribute(valueAttrName).getValue();
        String nodeDisplay = node.attribute(displayAttrName).getValue();
        String atomtype = node.attribute(atomtypeAttrName).getValue();
        // System.out.println(atomtype);
        String[] split = nodeValue.split("`");

        if (split.length > 2) {
            if (!StringUtil.isEmptyOrNull(info.getDictCode()) && info.getDictCode().equals("1")) {
                value = resolveString(split[0]);
            } else {
                value = resolveString(split[1].trim());
            }
        } else if (split.length == 2) {
            if (!StringUtil.isEmptyOrNull(info.getDictCode()) && info.getDictCode().equals("1")) {
                value = resolveString(split[0]);
            } else {
                value = split[1].trim();
            }
        } else if (split.length == 0) {
            value = "";
        } else if (split.length == 1) {
            value = split[0];
        }
        String[] split_display = nodeDisplay.split("`");
        if (StringUtils.isEmpty(info.getQrmbdm())) {
            for (int i = 0; i < split_display[0].length(); i++) {
                Character s = split_display[0].charAt(i);
                Character o = new Character('0');
                if (s.equals(o) && i <= 2) {
                    value = split_display[i + 1] + value;
                } else if (s.equals(o) && i > 2) {
                    if (StringUtils.isEmpty(value)) {
                    } else {
                        value = value + split_display[i + 1];
                    }
                }
            }
        }

        return value;
    }


    public static String resolveString(String str) {
        str = str.trim();
        str = str.replaceAll(" ", "");
        str = str.replaceAll("　+", "");
        str = str.replaceAll("&xA#;", "");
        /**
         * <MonitorData>
         *  <rows>
         *      <Zddm>J18.901</Zddm>
         *      <Zdmc>肺炎</Zdmc>
         *  </rows>
         *  <rows>
         *      <Zddm>I10xx02</Zddm>
         *      <Zdmc>高血压</Zdmc>
         *  </rows>
         * </MonitorData>
         */
        if (str.contains("MonitorData")) {
            StringBuilder stringBuilder = new StringBuilder();
            System.out.println(str);
            Document document = XmlUtil.getDocument(str);
            Element rootElement = document.getRootElement();
            List<Element> nodeChildList = rootElement.elements("rows");
            for (Element element : nodeChildList) {
                Element element1 = element.element("Zddm");
                stringBuilder.append(element1.getStringValue() + " ");
            }
            return stringBuilder.toString();
        }
        return str;
    }


    public static String resolveTextString(String str) {
//        str = str.trim();
        str = str.replaceAll("　+", "");
        str = str.replaceAll("&xA#;", "");
        return str;
    }


}
