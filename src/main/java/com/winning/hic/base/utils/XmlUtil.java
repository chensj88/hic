package com.winning.hic.base.utils;

import org.dom4j.*;
import org.dom4j.io.SAXReader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class XmlUtil {
    private static final Logger logger = LoggerFactory.getLogger(XmlUtil.class);

    /**
     * 根据xnl内容获取dom
     *
     * @param xmlStr
     * @return
     */
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
     * 根据文件地址，获取dom
     *
     * @param path
     * @return
     */
    public static Document getDocumentByPath(String path) {
        Document document = null;
        try {
            SAXReader reader = new SAXReader();
            document = reader.read(new File(path));
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        return document;
    }


    public static List<Element> getNodes(Element node) {
        System.out.println("--------------------");

        //当前节点的名称、文本内容和属性
        System.out.println("当前节点名称：" + node.getName());//当前节点名称
        System.out.println("当前节点的内容：" + node.getTextTrim());//当前节点名称
        List<Attribute> listAttr = node.attributes();//当前节点的所有属性的list
//        for (Attribute attr : listAttr) {//遍历当前节点的所有属性
//            String name = attr.getName();//属性名称
//            String value = attr.getValue();//属性的值
//            System.out.println("属性名称：" + name + "属性值：" + value);
//        }

        //递归遍历当前节点所有的子节点
        List<Element> listElement = node.elements();//所有一级子节点的list
        List<Element> childs = new ArrayList<>();
        for (Element e : listElement) {//遍历所有一级子节点a
            childs.addAll(getNodes(e));//递归
        }
        childs.add(node);
        return childs;
    }

    /***
     * 获取指定属性值的元素的属性值
     * @param elements 元素集合
     * @param attrName 属性名称
     * @param attrValue 属性值
     * @param targetAttr 目标属性
     * @return 目标属性值
     */
    public static String getAttrValue(List<Element> elements, String attrName, String attrValue, String targetAttr) {
        String targetValue = null;
        if (!StringUtil.isEmptyOrNull(attrName) && !StringUtil.isEmptyOrNull(attrValue)) {
            for (Element element : elements) {
                String value = element.attribute(attrName).getValue();
                if (!StringUtil.isEmptyOrNull(value) && attrValue.equals(value)) {
                    targetValue = element.attribute(targetAttr).getValue();
                    break;
                }
            }
        } else {
            logger.error("It does not define the attrbute name !");
        }
        return targetValue;
    }


    public static void main(String[] args) {

        Document document = XmlUtil.getDocumentByPath("E:\\jackMa\\hic\\src\\main\\java\\com\\winning\\hic\\base\\utils\\mima.xml");

        List<Element> elements = XmlUtil.getNodes(document.getRootElement());

        String attrValue = XmlUtil.getAttrValue(elements, "id", "6fa963d2-ab46-493e-9cf6-ff87addccf52", "defaultvalue");


//        String id = rootElement.attribute("id").getValue();
        System.out.println(elements.size());
        System.out.println(attrValue);


    }


}
