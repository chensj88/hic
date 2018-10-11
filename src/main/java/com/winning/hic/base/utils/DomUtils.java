package com.winning.hic.base.utils;

import com.winning.hic.model.EmrMbmxk;
import com.winning.hic.model.MbzDataSet;
import com.winning.hic.model.MbzTemplateNodeDetailInfo;
import com.winning.hic.service.EmrMbmxkService;
import org.apache.commons.beanutils.BeanUtils;
import org.dom4j.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.thymeleaf.util.StringUtils;

import javax.annotation.PostConstruct;
import java.lang.reflect.InvocationTargetException;
import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: LENOVO
 * Date: 2018-08-09
 * Time: 13:14
 */
@Component
public class DomUtils {

    @Autowired
    private EmrMbmxkService emrMbmxkService;

    private static DomUtils domUtils;

    @PostConstruct
    public void init() {
        domUtils = this;
        domUtils.emrMbmxkService = this.emrMbmxkService;
    }

    public static final String nodeTagName = "node";
    public static final String refTagName = "Ref";


    private static final String valueAttrName = "value";
    private static final String textAttrName = "text";
    private static final String nameAttrName = "name";
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

    public static void main(String[] args) throws InvocationTargetException, IllegalAccessException {
       /* InputStream in = DomUtils.class.getClassLoader().getResourceAsStream("xml/24hcryjl.xml");
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
        }*/

//       String xml = "<Model id=\"aa38de2f-cbd0-4405-bb33-7143aec5d04d\" name=\"24小时入出院记录(24小时入出院记录)\" description=\"适用于浙江省中医院\" text=\"24小时入出院记录\" nodetype=\"Model\" canprint=\"True\" printInOddPages=\"False\" display=\"11```0`1\" Version=\"427\" titledisplay=\"1`1`1\" hospitalcoderange=\"10266\" catalogcode=\"B-1080\" illnesstypecode=\"FFFF\" scalemodelxml=\"\" modellogiccontent=\"\" indentEnabled=\"False\" indentLength=\"0\" isReview=\"False\" isform=\"False\" formclass=\"\" maxrefid=\"61\" RelateInstanceId=\"0\"><node id=\"6ff6b344-7b8f-4728-8d58-5bbf5cea93ec\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"其他基本病史信息\" text=\"其他基本病史信息\" description=\"1.101\" display=\"10``&#xD;&#xA;`0`1\" permitobjs=\"bce8e5bd-7069-402a-90be-56d4c5ab7984;\" defaultobjs=\"\" allowUserDefine=\"False\" canNotInputText=\"False\" isnewPage=\"False\" canNull=\"True\" canNullSubmit=\"True\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\"><node text=\"    \" rtf=\"    \" nodetype=\"Text\" /><node refid=\"31\" nodetype=\"Embeded\" /></node><node id=\"63950bdc-9952-4641-98dc-05bc68b2e071\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"主诉\" signid=\"主诉|49\" text=\"主诉\" description=\"1.121\" display=\"20`    主　诉：`&#xD;&#xA;`0`1\" permitobjs=\"76226582-23d1-47c3-8843-fc17138d88f7;b0ad5483-adf9-4007-ad2d-c0960a31a543;5d699b3b-1184-466f-8ed5-01c4bdf6d459;\" defaultobjs=\"\" allowUserDefine=\"False\" canNotInputText=\"False\" isnewPage=\"False\" canNull=\"False\" canNullSubmit=\"False\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\"><node refid=\"22\" nodetype=\"Embeded\" /></node><node id=\"2079e311-fddc-488e-955a-e5dc61e18c35\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"入院情况\" signid=\"入院情况|158\" text=\"入院情况\" description=\"3.520\" display=\"20`    入院情况：`&#xD;&#xA;`0`1\" permitobjs=\"\" defaultobjs=\"\" allowUserDefine=\"False\" canNotInputText=\"False\" isnewPage=\"False\" canNull=\"False\" canNullSubmit=\"False\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\"><node refid=\"33\" nodetype=\"Embeded\" /><node refid=\"34\" nodetype=\"Embeded\" /><node refid=\"35\" nodetype=\"Embeded\" /></node><node id=\"15ad96ed-f3fe-47ec-9460-5df23f7d1980\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"症状名称\" visiable=\"False\" signid=\"症状名称|642\" text=\"症状名称\" description=\"3.541\" otherid=\"C-1151\" display=\"20`    症状名称：`&#xD;&#xA;`0`1\" permitobjs=\"\" defaultobjs=\"\" allowUserDefine=\"False\" canNotInputText=\"False\" isnewPage=\"False\" canNull=\"True\" canNullSubmit=\"True\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\" /><node id=\"358ba4ca-868a-48f6-8b67-0f085e3899de\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"症状描述\" visiable=\"False\" signid=\"症状描述|644\" text=\"症状描述\" otherid=\"C-1192\" display=\"20`    症状描述：`&#xD;&#xA;`0`1\" permitobjs=\"\" defaultobjs=\"\" allowUserDefine=\"True\" canNotInputText=\"False\" isnewPage=\"False\" canNull=\"True\" canNullSubmit=\"True\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\" /><node id=\"00f44bee-720d-4ce3-bb0a-0492c924bd49\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"中医入院诊断\" text=\"中医入院诊断\" description=\"适用于静安中心\" otherid=\"C-81\" display=\"20`    入院诊断：`&#xD;&#xA;`0`1\" permitobjs=\"\" defaultobjs=\"\" allowUserDefine=\"True\" canNotInputText=\"True\" isnewPage=\"False\" canNull=\"True\" canNullSubmit=\"True\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\"><node text=\"&#xA;\" rtf=\"\\par&#xD;&#xA;\" nodetype=\"Text\" /><node text=\"    中医诊断：\" rtf=\"    \\'d6\\'d0\\'d2\\'bd\\'d5\\'ef\\'b6\\'cf\\'a3\\'ba\" nodetype=\"Text\" /><node refid=\"48\" nodetype=\"Embeded\" /></node><node id=\"b1f2b83e-712f-4630-940f-2dd56462dc17\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"西医入院诊断\" text=\"西医入院诊断\" description=\"适用于静安中心\" otherid=\"C-81\" display=\"10``&#xD;&#xA;`0`1\" permitobjs=\"\" defaultobjs=\"\" allowUserDefine=\"True\" canNotInputText=\"True\" isnewPage=\"False\" canNull=\"True\" canNullSubmit=\"True\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\"><node text=\" \" rtf=\" \" nodetype=\"Text\" /><node text=\" \" rtf=\" \" nodetype=\"Text\" /><node text=\" \" rtf=\" \" nodetype=\"Text\" /><node text=\" \" rtf=\" \" nodetype=\"Text\" /><node text=\"西医诊断：\" rtf=\"\\'ce\\'f7\\'d2\\'bd\\'d5\\'ef\\'b6\\'cf\\'a3\\'ba\" nodetype=\"Text\" /><node refid=\"51\" nodetype=\"Embeded\" /></node><node id=\"8011bdfb-f9eb-4a36-9379-412d84f880cf\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"诊疗经过\" signid=\"诊疗过程描述|777\" text=\"诊疗经过\" description=\"3.531\" display=\"20`    诊疗经过：`&#xD;&#xA;`0`1\" permitobjs=\"\" defaultobjs=\"\" allowUserDefine=\"False\" canNotInputText=\"False\" isnewPage=\"False\" canNull=\"False\" canNullSubmit=\"False\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\" /><node id=\"795cce2e-6ac0-4ab4-b56d-ed7d5267f6f7\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"出院情况\" signid=\"出院情况|205\" text=\"出院情况\" description=\"7.511\" display=\"20`    出院情况：`&#xD;&#xA;`0`1\" permitobjs=\"\" defaultobjs=\"\" allowUserDefine=\"False\" canNotInputText=\"False\" isnewPage=\"False\" canNull=\"False\" canNullSubmit=\"False\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\" /><node id=\"c91f8a39-d372-4ba8-9295-d02b05766e1f\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"中医出院诊断\" text=\"中医出院诊断\" description=\"适用于静安中心\" otherid=\"C-81\" display=\"20`    出院诊断：`&#xD;&#xA;`0`1\" permitobjs=\"\" defaultobjs=\"\" allowUserDefine=\"True\" canNotInputText=\"True\" isnewPage=\"False\" canNull=\"True\" canNullSubmit=\"True\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\"><node text=\"&#xA;\" rtf=\"\\par&#xD;&#xA;\" nodetype=\"Text\" /><node text=\"    中医诊断：\" rtf=\"    \\'d6\\'d0\\'d2\\'bd\\'d5\\'ef\\'b6\\'cf\\'a3\\'ba\" nodetype=\"Text\" /><node refid=\"50\" nodetype=\"Embeded\" /></node><node id=\"9d347c2d-ad11-4527-b430-68e8ba0bbb7f\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"西医出院诊断\" text=\"西医出院诊断\" description=\"适用于静安中心\" otherid=\"C-81\" display=\"10``&#xD;&#xA;`0`1\" permitobjs=\"\" defaultobjs=\"\" allowUserDefine=\"True\" canNotInputText=\"True\" isnewPage=\"False\" canNull=\"True\" canNullSubmit=\"True\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\"><node text=\" \" rtf=\" \" nodetype=\"Text\" /><node text=\" \" rtf=\" \" nodetype=\"Text\" /><node text=\" \" rtf=\" \" nodetype=\"Text\" /><node text=\" \" rtf=\" \" nodetype=\"Text\" /><node text=\"西医诊断：\" rtf=\"\\'ce\\'f7\\'d2\\'bd\\'d5\\'ef\\'b6\\'cf\\'a3\\'ba\" nodetype=\"Text\" /><node refid=\"46\" nodetype=\"Embeded\" /></node><node id=\"c8c32dc6-00ba-43e3-a36e-2f9df8534c0c\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"出院医嘱\" signid=\"出院医嘱|196\" text=\"出院医嘱\" description=\"7.531\" display=\"20`    出院医嘱：`&#xD;&#xA;`0`1\" permitobjs=\"\" defaultobjs=\"\" allowUserDefine=\"False\" canNotInputText=\"False\" isnewPage=\"False\" canNull=\"True\" canNullSubmit=\"True\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\" /><node id=\"581f3027-3a60-4e0b-9a82-c2d2dee31b73\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"医师签名\" text=\"医师签名\" description=\"3.571\" display=\"20`                                                    医师签名：`&#xD;&#xA;`0`1\" permitobjs=\"\" defaultobjs=\"\" allowUserDefine=\"False\" canNotInputText=\"False\" isnewPage=\"False\" canNull=\"True\" canNullSubmit=\"True\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\"><node refid=\"60\" nodetype=\"Embeded\" /><node refid=\"61\" nodetype=\"Embeded\" /></node></Model>";
//       String mbdm = "aa38de2f-cbd0-4405-bb33-7143aec5d04d";
//        convertXMLToObject(xml,mbdm);
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
        if(info.getDataType() == 1){
            info.setQrmbdm(null);
            info.setQrdxdm(null);
            info.setYzjddm(null);
        }else if(info.getDataType() == 2){
            info.setQrdxdm(null);
            info.setYzjddm(null);
        }else if(info.getDataType() == 3){
            info.setYzjddm(null);
        }
        Element rootElement = document.getRootElement();
        return resolveNodeInfo(rootElement, info);
    }

    /**
     * 解析<node></node>节点信息
     * @param rootElement
     * @param info
     * @return
     */
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
        if (StringUtils.isEmpty(info.getQrmbdm())||info.getValueFlag()==1) {
        //if(split_display.length > 0 && split_display != null){
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
        //}
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



    public static List<MbzTemplateNodeDetailInfo> convertXMLToObject(String sourceType,String mbmc,String xml, String mbdm) throws InvocationTargetException, IllegalAccessException {
        Document document = getDocument(xml);
        Element rootElement = document.getRootElement();
        List<Element> nodeChildList = rootElement.elements(nodeTagName);
        //解析获取文件结构节点
        List<MbzTemplateNodeDetailInfo> MbzTemplateNodeDetailInfoList = new ArrayList<>();
        //遍历所有的子节点,找到需要文件结构节点
        for (Element childEle : nodeChildList) {
            String visiable = XmlUtil.getValueByAttrName(childEle, "visiable");
            if ("False".equalsIgnoreCase(visiable)) {
                continue;
            }else{
                MbzTemplateNodeDetailInfo objectInfo = new MbzTemplateNodeDetailInfo();
                objectInfo.setMbdm(mbdm);
                objectInfo.setJdlx("1");
                objectInfo.setSourceType(sourceType);
                objectInfo.setMbmc(mbmc);
                objectInfo.setJdmc(XmlUtil.getValueByAttrName(childEle, nameAttrName));
                objectInfo.setDtjddm(XmlUtil.getValueByAttrName(childEle, idAttrName));
                objectInfo.setElement(childEle);
                MbzTemplateNodeDetailInfoList.add(objectInfo);
                resolveRefQrmbjd(mbdm,objectInfo,MbzTemplateNodeDetailInfoList);
            }
        }


//        Set<MbzTemplateNodeDetailInfo> allXml = new HashSet<>(MbzTemplateNodeDetailInfoList);
//        MbzTemplateNodeDetailInfoList.clear();
//        MbzTemplateNodeDetailInfoList.addAll(allXml);
        return removeDuplicate(MbzTemplateNodeDetailInfoList);
    }

    /**
     * 去除重复数据
     * @param list
     * @return
     */
    public   static   List  removeDuplicate(List list)  {
        for  ( int  i  =   0 ; i  <  list.size()  -   1 ; i ++ )  {
            for  ( int  j  =  list.size()  -   1 ; j  >  i; j -- )  {
                if  (list.get(j).equals(list.get(i)))  {
                    list.remove(j);
                }
            }
        }
        return list;
    }
    public static void resolveRefQrmbjd(String mbdm,MbzTemplateNodeDetailInfo objectInfo, List<MbzTemplateNodeDetailInfo> MbzTemplateNodeDetailInfoList) throws InvocationTargetException, IllegalAccessException {
        List<Element> nodeRefList = objectInfo.getElement().elements(nodeTagName);
        for (Element element : nodeRefList) {
            String nodetype = XmlUtil.getValueByAttrName(element, nodetypeAttrName);
            if(refNodeType.equals(nodetype)){
                String visiable = XmlUtil.getValueByAttrName(element, "visiable");
                if ("False".equalsIgnoreCase(visiable)) {
                    continue;
                }else {
                    String refid = XmlUtil.getValueByAttrName(element, refidAttrName);
                    EmrMbmxk emrMbmxk = new EmrMbmxk();
                    emrMbmxk.setMbdm(mbdm);
                    emrMbmxk.setJdrefid(Integer.parseInt(refid));
                    emrMbmxk = domUtils.emrMbmxkService.getEmrMbmxk(emrMbmxk);
                    String qrmbbm = emrMbmxk.getJddm();
                    Document document = getDocument(emrMbmxk.getJdnr());
                    MbzTemplateNodeDetailInfo refXmlObj = new MbzTemplateNodeDetailInfo();
                    BeanUtils.copyProperties(refXmlObj, objectInfo);
                    Element rootElement = document.getRootElement();
                    String qrmbmc = XmlUtil.getValueByAttrName(rootElement, nameAttrName);
                    refXmlObj.setJdmc(refXmlObj.getJdmc()+"/"+qrmbmc);
                    refXmlObj.setJdlx("2");
                    refXmlObj.setQrmbdm(qrmbbm);
                    refXmlObj.setElement(rootElement);
                    MbzTemplateNodeDetailInfoList.add(refXmlObj);
                    resolveObjectNode(refXmlObj, MbzTemplateNodeDetailInfoList);
                }
            }
        }

    }

    public static void resolveObjectNode(MbzTemplateNodeDetailInfo objectInfo, List<MbzTemplateNodeDetailInfo> MbzTemplateNodeDetailInfoList) throws InvocationTargetException, IllegalAccessException {
        List<Element> nodeRefList = objectInfo.getElement().elements(nodeTagName);
        for (Element element : nodeRefList) {
            String nodetype = XmlUtil.getValueByAttrName(element, nodetypeAttrName);
            if(objectNodeType.equals(nodetype)){
                String visiable = XmlUtil.getValueByAttrName(element, "visiable");
                if ("False".equalsIgnoreCase(visiable)) {
                    continue;
                }else {
                    String idAttr = XmlUtil.getValueByAttrName(element, idAttrName);
                    MbzTemplateNodeDetailInfo objectXmlObj = new MbzTemplateNodeDetailInfo();
                    BeanUtils.copyProperties(objectXmlObj, objectInfo);
                    String qrmbmc = XmlUtil.getValueByAttrName(element, nameAttrName);
                    objectXmlObj.setJdmc(objectInfo.getJdmc()+"/"+qrmbmc);
                    objectXmlObj.setQrdxdm(idAttr);
                    objectXmlObj.setElement(element);
                    objectXmlObj.setJdlx("3");
                    MbzTemplateNodeDetailInfoList.add(objectXmlObj);
                    resolveAtomNode(objectXmlObj, MbzTemplateNodeDetailInfoList);
                }
            }
        }

    }


    public static void resolveAtomNode(MbzTemplateNodeDetailInfo objectInfo, List<MbzTemplateNodeDetailInfo> MbzTemplateNodeDetailInfoList) throws InvocationTargetException, IllegalAccessException {
        List<Element> nodeRefList = objectInfo.getElement().elements(nodeTagName);
        for (Element element : nodeRefList) {
            String nodetype = XmlUtil.getValueByAttrName(element, nodetypeAttrName);
            if(atomNodeType.equals(nodetype)){
                String visiable = XmlUtil.getValueByAttrName(element, "visiable");
                if ("False".equalsIgnoreCase(visiable)) {
                    continue;
                }else {
                    String idAttr = XmlUtil.getValueByAttrName(element, idAttrName);
                    MbzTemplateNodeDetailInfo objectXmlObj = new MbzTemplateNodeDetailInfo();
                    BeanUtils.copyProperties(objectXmlObj, objectInfo);
                    String yzjdmc = XmlUtil.getValueByAttrName(element, nameAttrName);
                    objectXmlObj.setJdmc(objectInfo.getJdmc()+"/"+yzjdmc);
                    objectXmlObj.setYzjddm(idAttr);
                    objectXmlObj.setElement(element);
                    objectXmlObj.setJdlx("4");
                    MbzTemplateNodeDetailInfoList.add(objectXmlObj);
                }
            }
        }

    }
}
