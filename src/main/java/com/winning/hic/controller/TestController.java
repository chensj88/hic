package com.winning.hic.controller;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.DomUtils;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.model.MbzDataCheck;
import com.winning.hic.model.MbzTemplateNodeDetailInfo;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description: 测试接口Test
 * User: LENOVO
 * Date: 2018-08-02
 * Time: 9:22
 */
@RestController
public class TestController extends BaseController {

    @GetMapping(value = "/test/jni")
    @ApiOperation(value = "/test/jni",notes = "测试java调用c# dll，通过jacob来实现")
    public Map<String, Object> testJNI() throws IOException {
        String blnr = "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";
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("data", Base64Utils.unzipEmrXml(blnr));
        return result;
    }

    @GetMapping(value = "/test/24ryjl")
    @ApiOperation(value="/test/24ryjl",notes = "24H出入院接口表数据抽取测试")
    public Map<String, Object> test24RYJL() throws Exception {
        MbzDataCheck entity = new MbzDataCheck();
        entity.getMap().put("startDate","20170701");
        entity.getMap().put("endDate","20180824");
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("data", super.getFacade().getHlhtRyjlRcyjlService().interfaceHlhtRyjlRcyjl(entity));
        return result;
    }

    @GetMapping(value = "/test/ryjl")
    @ApiOperation(value="/test/ryjl",notes = "入院记录接口表数据抽取测试")
    public Map<String, Object> testRYJL() throws IOException, ParseException {
        MbzDataCheck entity = new MbzDataCheck();
        entity.getMap().put("startDate","20170701");
        entity.getMap().put("endDate","20180824");
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("data", super.getFacade().getHlhtRyjlJbxxService().interfaceHlhtRyjlJbxx(entity));
        return result;
    }


    @GetMapping(value = "/test/ryswjl")
    @ApiOperation(value="/test/ryswjl",notes = "入院死亡记录表数据抽取测试")
    public Map<String, Object> testRYSWJL() throws Exception {
        MbzDataCheck entity = new MbzDataCheck();
        entity.getMap().put("startDate","20170701");
        entity.getMap().put("endDate","20180824");
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("data", super.getFacade().getHlhtRyjlRyswjlService().interfaceHlhtRyjlRyswjl(entity));
        return result;
    }


    @GetMapping(value = "/test/shscbcjl")
    @ApiOperation(value="/test/shscbcjl",notes = "取住院病程/手术术后首次病程初始化数据")
    public Map<String, Object> testSHSCBCJL() throws Exception {
        MbzDataCheck entity = new MbzDataCheck();
        entity.getMap().put("startDate","20170701");
        entity.getMap().put("endDate","20180824");
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("data", super.getFacade().getHlhtZybcjlShscbcjlService().interfaceHlhtZybcjlShscbcjl(entity));
        return result;
    }

    @GetMapping(value = "/test/sqxj")
    @ApiOperation(value="/test/sqxj",notes = "取住院病程/术前小结")
    public Map<String, Object> testSQXJ() throws Exception {
        MbzDataCheck entity = new MbzDataCheck();
        entity.getMap().put("startDate","20170701");
        entity.getMap().put("endDate","20180824");
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("data", super.getFacade().getHlhtZybcjlSqxjService().interfaceHlhtZybcjlSqxj(entity));
        return result;
    }
    @GetMapping(value = "/test/sqtl")
    @ApiOperation(value="/test/sqtl",notes = "取住院病程/术前讨论")
    public Map<String, Object> testSQTL() throws Exception {
        MbzDataCheck entity = new MbzDataCheck();
        entity.getMap().put("startDate","20170701");
        entity.getMap().put("endDate","20180824");
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("data", super.getFacade().getHlhtZybcjlSqtlService().interfaceHlhtZybcjlSqtl(entity));
        return result;
    }

    @GetMapping(value = "/test/swbltl")
    @ApiOperation(value="/test/swbltl",notes = "取住院病程/死亡病历讨论")
    public Map<String, Object> testSWBLTL() throws Exception {
        MbzDataCheck entity = new MbzDataCheck();
        entity.getMap().put("startDate","20170701");
        entity.getMap().put("endDate","20180824");
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("data", super.getFacade().getHlhtZybcjlSwbltljlService().interfaceHlhtZybcjlSwbltljl(entity));
        return result;
    }

    @GetMapping(value = "/test/sjyscfjl")
    @ApiOperation(value="/test/sjyscfjl",notes = "取住院病程/上级医生查房记录")
    public Map<String, Object> testSJYSCFJL() throws Exception {
        MbzDataCheck entity = new MbzDataCheck();
        entity.getMap().put("startDate","20170701");
        entity.getMap().put("endDate","20180824");
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("data", super.getFacade().getHlhtZybcjlSjyscfjlService().interfaceHlhtZybcjlSjyscfjl(entity));
        return result;
    }

    @GetMapping(value = "/test/sstys")
    @ApiOperation(value="/test/sstys",notes = "知情告知信息/手术同意书")
    public Map<String, Object> testSSTYS() throws Exception {
        MbzDataCheck entity = new MbzDataCheck();
        entity.getMap().put("startDate","20170701");
        entity.getMap().put("endDate","20180824");
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("data", super.getFacade().getHlhtZqgzxxSstysService().interfaceHlhtZqgzxxSstys(entity));
        return result;
    }

    @GetMapping(value = "/test/jbjkxx")
    @ApiOperation(value="/test/jbjkxx",notes = "病历概要/基本健康信息")
    public Map<String, Object> testJBJKXX() throws Exception {
        MbzDataCheck entity = new MbzDataCheck();
        entity.getMap().put("startDate","20180720");
        entity.getMap().put("endDate","20180720");

        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("data", super.getFacade().getHlhtBlgyJbjkxxService().interfaceHlhtBlgyJbjkxx(entity));
        return result;
    }


    @GetMapping(value = "/test/xycf")
    @ApiOperation(value="/test/xycf",notes = "门(急)诊处方/西药处方")
    public Map<String, Object> testXYCF() throws Exception {
        MbzDataCheck entity = new MbzDataCheck();
        entity.getMap().put("startDate","20170701");
        entity.getMap().put("endDate","20180824");
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("data", super.getFacade().getHlhtMjzcfXycfService().interfaceHlhtMjzcfXycf(entity));
        return result;
    }

    @GetMapping(value = "/test/con")
    @ApiOperation(value="/test/con",notes = "测试信息转换")
    public Map<String, Object> testConvert(String xml,String mbdm) throws Exception {

        //xml = "<Model id=\"aa38de2f-cbd0-4405-bb33-7143aec5d04d\" name=\"24小时入出院记录(24小时入出院记录)\" description=\"适用于浙江省中医院\" text=\"24小时入出院记录\" nodetype=\"Model\" canprint=\"True\" printInOddPages=\"False\" display=\"11```0`1\" Version=\"427\" titledisplay=\"1`1`1\" hospitalcoderange=\"10266\" catalogcode=\"B-1080\" illnesstypecode=\"FFFF\" scalemodelxml=\"\" modellogiccontent=\"\" indentEnabled=\"False\" indentLength=\"0\" isReview=\"False\" isform=\"False\" formclass=\"\" maxrefid=\"61\" RelateInstanceId=\"0\"><node id=\"6ff6b344-7b8f-4728-8d58-5bbf5cea93ec\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"其他基本病史信息\" text=\"其他基本病史信息\" description=\"1.101\" display=\"10``&#xD;&#xA;`0`1\" permitobjs=\"bce8e5bd-7069-402a-90be-56d4c5ab7984;\" defaultobjs=\"\" allowUserDefine=\"False\" canNotInputText=\"False\" isnewPage=\"False\" canNull=\"True\" canNullSubmit=\"True\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\"><node text=\"    \" rtf=\"    \" nodetype=\"Text\" /><node refid=\"31\" nodetype=\"Embeded\" /></node><node id=\"63950bdc-9952-4641-98dc-05bc68b2e071\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"主诉\" signid=\"主诉|49\" text=\"主诉\" description=\"1.121\" display=\"20`    主　诉：`&#xD;&#xA;`0`1\" permitobjs=\"76226582-23d1-47c3-8843-fc17138d88f7;b0ad5483-adf9-4007-ad2d-c0960a31a543;5d699b3b-1184-466f-8ed5-01c4bdf6d459;\" defaultobjs=\"\" allowUserDefine=\"False\" canNotInputText=\"False\" isnewPage=\"False\" canNull=\"False\" canNullSubmit=\"False\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\"><node refid=\"22\" nodetype=\"Embeded\" /></node><node id=\"2079e311-fddc-488e-955a-e5dc61e18c35\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"入院情况\" signid=\"入院情况|158\" text=\"入院情况\" description=\"3.520\" display=\"20`    入院情况：`&#xD;&#xA;`0`1\" permitobjs=\"\" defaultobjs=\"\" allowUserDefine=\"False\" canNotInputText=\"False\" isnewPage=\"False\" canNull=\"False\" canNullSubmit=\"False\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\"><node refid=\"33\" nodetype=\"Embeded\" /><node refid=\"34\" nodetype=\"Embeded\" /><node refid=\"35\" nodetype=\"Embeded\" /></node><node id=\"15ad96ed-f3fe-47ec-9460-5df23f7d1980\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"症状名称\" visiable=\"False\" signid=\"症状名称|642\" text=\"症状名称\" description=\"3.541\" otherid=\"C-1151\" display=\"20`    症状名称：`&#xD;&#xA;`0`1\" permitobjs=\"\" defaultobjs=\"\" allowUserDefine=\"False\" canNotInputText=\"False\" isnewPage=\"False\" canNull=\"True\" canNullSubmit=\"True\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\" /><node id=\"358ba4ca-868a-48f6-8b67-0f085e3899de\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"症状描述\" visiable=\"False\" signid=\"症状描述|644\" text=\"症状描述\" otherid=\"C-1192\" display=\"20`    症状描述：`&#xD;&#xA;`0`1\" permitobjs=\"\" defaultobjs=\"\" allowUserDefine=\"True\" canNotInputText=\"False\" isnewPage=\"False\" canNull=\"True\" canNullSubmit=\"True\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\" /><node id=\"00f44bee-720d-4ce3-bb0a-0492c924bd49\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"中医入院诊断\" text=\"中医入院诊断\" description=\"适用于静安中心\" otherid=\"C-81\" display=\"20`    入院诊断：`&#xD;&#xA;`0`1\" permitobjs=\"\" defaultobjs=\"\" allowUserDefine=\"True\" canNotInputText=\"True\" isnewPage=\"False\" canNull=\"True\" canNullSubmit=\"True\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\"><node text=\"&#xA;\" rtf=\"\\par&#xD;&#xA;\" nodetype=\"Text\" /><node text=\"    中医诊断：\" rtf=\"    \\'d6\\'d0\\'d2\\'bd\\'d5\\'ef\\'b6\\'cf\\'a3\\'ba\" nodetype=\"Text\" /><node refid=\"48\" nodetype=\"Embeded\" /></node><node id=\"b1f2b83e-712f-4630-940f-2dd56462dc17\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"西医入院诊断\" text=\"西医入院诊断\" description=\"适用于静安中心\" otherid=\"C-81\" display=\"10``&#xD;&#xA;`0`1\" permitobjs=\"\" defaultobjs=\"\" allowUserDefine=\"True\" canNotInputText=\"True\" isnewPage=\"False\" canNull=\"True\" canNullSubmit=\"True\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\"><node text=\" \" rtf=\" \" nodetype=\"Text\" /><node text=\" \" rtf=\" \" nodetype=\"Text\" /><node text=\" \" rtf=\" \" nodetype=\"Text\" /><node text=\" \" rtf=\" \" nodetype=\"Text\" /><node text=\"西医诊断：\" rtf=\"\\'ce\\'f7\\'d2\\'bd\\'d5\\'ef\\'b6\\'cf\\'a3\\'ba\" nodetype=\"Text\" /><node refid=\"51\" nodetype=\"Embeded\" /></node><node id=\"8011bdfb-f9eb-4a36-9379-412d84f880cf\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"诊疗经过\" signid=\"诊疗过程描述|777\" text=\"诊疗经过\" description=\"3.531\" display=\"20`    诊疗经过：`&#xD;&#xA;`0`1\" permitobjs=\"\" defaultobjs=\"\" allowUserDefine=\"False\" canNotInputText=\"False\" isnewPage=\"False\" canNull=\"False\" canNullSubmit=\"False\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\" /><node id=\"795cce2e-6ac0-4ab4-b56d-ed7d5267f6f7\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"出院情况\" signid=\"出院情况|205\" text=\"出院情况\" description=\"7.511\" display=\"20`    出院情况：`&#xD;&#xA;`0`1\" permitobjs=\"\" defaultobjs=\"\" allowUserDefine=\"False\" canNotInputText=\"False\" isnewPage=\"False\" canNull=\"False\" canNullSubmit=\"False\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\" /><node id=\"c91f8a39-d372-4ba8-9295-d02b05766e1f\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"中医出院诊断\" text=\"中医出院诊断\" description=\"适用于静安中心\" otherid=\"C-81\" display=\"20`    出院诊断：`&#xD;&#xA;`0`1\" permitobjs=\"\" defaultobjs=\"\" allowUserDefine=\"True\" canNotInputText=\"True\" isnewPage=\"False\" canNull=\"True\" canNullSubmit=\"True\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\"><node text=\"&#xA;\" rtf=\"\\par&#xD;&#xA;\" nodetype=\"Text\" /><node text=\"    中医诊断：\" rtf=\"    \\'d6\\'d0\\'d2\\'bd\\'d5\\'ef\\'b6\\'cf\\'a3\\'ba\" nodetype=\"Text\" /><node refid=\"50\" nodetype=\"Embeded\" /></node><node id=\"9d347c2d-ad11-4527-b430-68e8ba0bbb7f\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"西医出院诊断\" text=\"西医出院诊断\" description=\"适用于静安中心\" otherid=\"C-81\" display=\"10``&#xD;&#xA;`0`1\" permitobjs=\"\" defaultobjs=\"\" allowUserDefine=\"True\" canNotInputText=\"True\" isnewPage=\"False\" canNull=\"True\" canNullSubmit=\"True\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\"><node text=\" \" rtf=\" \" nodetype=\"Text\" /><node text=\" \" rtf=\" \" nodetype=\"Text\" /><node text=\" \" rtf=\" \" nodetype=\"Text\" /><node text=\" \" rtf=\" \" nodetype=\"Text\" /><node text=\"西医诊断：\" rtf=\"\\'ce\\'f7\\'d2\\'bd\\'d5\\'ef\\'b6\\'cf\\'a3\\'ba\" nodetype=\"Text\" /><node refid=\"46\" nodetype=\"Embeded\" /></node><node id=\"c8c32dc6-00ba-43e3-a36e-2f9df8534c0c\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"出院医嘱\" signid=\"出院医嘱|196\" text=\"出院医嘱\" description=\"7.531\" display=\"20`    出院医嘱：`&#xD;&#xA;`0`1\" permitobjs=\"\" defaultobjs=\"\" allowUserDefine=\"False\" canNotInputText=\"False\" isnewPage=\"False\" canNull=\"True\" canNullSubmit=\"True\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\" /><node id=\"581f3027-3a60-4e0b-9a82-c2d2dee31b73\" nodetype=\"DynamicMoleNode\" nodelogiccontent=\"\" name=\"医师签名\" text=\"医师签名\" description=\"3.571\" display=\"20`                                                    医师签名：`&#xD;&#xA;`0`1\" permitobjs=\"\" defaultobjs=\"\" allowUserDefine=\"False\" canNotInputText=\"False\" isnewPage=\"False\" canNull=\"True\" canNullSubmit=\"True\" permittedDoctorGradeRange=\"\" useDiagContinuedPrint=\"False\" nodePrintArea=\"None\" indentLength=\"0\"><node refid=\"60\" nodetype=\"Embeded\" /><node refid=\"61\" nodetype=\"Embeded\" /></node></Model>";
        //mbdm = "aa38de2f-cbd0-4405-bb33-7143aec5d04d";
        String sourceType = "1";
        String mbmc = "24小时入出院记录(24小时入出院记录)";
        List<MbzTemplateNodeDetailInfo> templateNodeDetailInfos = DomUtils.convertXMLToObject(sourceType,mbmc,xml,mbdm);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("data",getFacade().getMbzTemplateNodeDetailInfoService().createMbzTemplateNodeDetailInfoList(templateNodeDetailInfos));
        return result;
    }

    @PostMapping(value = "/blnr/parse")
    public Map<String, Object> parseBlnr(String blnr) throws Exception {
        blnr = blnr.substring(3);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("data", XmlUtil.format(Base64Utils.unzipEmrXml(blnr)));
        return result;
    }
}
