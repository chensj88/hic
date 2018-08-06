package com.winning.hic.controller;

import com.winning.hic.base.Constant;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.StringUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.model.*;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.dom4j.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description: 24小时出入院记录
 * User: LENOVO
 * Date: 2018-08-06
 * Time: 11:12
 */
@RestController
public class RyjlRcyjController extends BaseController{

    private static final Logger logger = LoggerFactory.getLogger(RyjlRcyjController.class);

    @GetMapping(value = "/rcyjl/exacted")
    @ApiOperation(value = "/rcyjl/exacted",notes = "出入院记录解析")
    @ApiImplicitParam(value = "/rcyjl/exacted",name = "出入院记录解析",dataType = "",required = true)
    public Map<String, Object> index() throws IOException {
        //配置接口表字段配置信息
        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constant.WN_RYJL_RCYJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constant.WN_RYJL_RCYJL_SOURCE_TYPE));
        //配置并加载对应的出入院模板集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constant.WN_RYJL_RCYJL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = getFacade().getMbzDataListSetService().getMbzDataListSetList(mbzDataListSet);
        //获取模板集合，遍历
        for(MbzDataListSet dataListSet :dataListSets){
            //查询病历数据 数据来源
            EmrQtbljlk qtbljlk = new EmrQtbljlk();
            qtbljlk.setBldm(dataListSet.getModelCode());
            List<EmrQtbljlk> qtbljlkList = super.getFacade().getEmrQtbljlkService().getEmrQtbljlkList(qtbljlk);
            if(qtbljlkList != null){
                //循环其他病历
                for(EmrQtbljlk emrQtbljlk:qtbljlkList){

                    HlhtRyjlRcyjl rcyjl = new HlhtRyjlRcyjl();
                    rcyjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                    rcyjl = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjl(rcyjl);
                    //判断是否存在重复
                    if(rcyjl == null ){
                        //初始化数据
                        rcyjl  = new HlhtRyjlRcyjl();
                        rcyjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        rcyjl = super.getFacade().getHlhtRyjlRcyjlService().getInitHlhtRyjlRcyjlData(rcyjl);
                        //解析XML 病历
                        Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                        List<MbzDataSet> mbzDataSetList = getFacade().getMbzDataSetService().getMbzDataSetList(mbzDataSet);
                        //获取出入院的对象集合
                        Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtRyjlRcyjl.class);
                        for (MbzDataSet dataSet : mbzDataSetList) {
                            //获取属性名
                            String pyCode = dataSet.getPyCode();
                            String methodName = "set" + StringUtil.titleCase(pyCode);
                            String strValue = XmlUtil.getAttrValueByDataSet(document, dataSet);
                            logger.info("pyCode:{};methodName:{};strValue:{}", pyCode, methodName, strValue);
                            Object value = null;
                            String paramType = paramTypeMap.get(pyCode);
                            if (paramType.contains("String")) {
                                value = StringUtil.isEmptyOrNull(strValue) ? null : strValue.split("`")[2];
                            } else if (paramType.contains("Short")) {
                                //格式：50`50`50
                                String shortStr = StringUtil.isEmptyOrNull(strValue) ? null : strValue.split("`")[2];
                                value = StringUtil.isEmptyOrNull(strValue) ? null : Short.parseShort(shortStr);
                            } else if (paramType.contains("Date")) {//                格式：636467930400000000`2017-11-20,16:44
                                String dateStr = StringUtil.isEmptyOrNull(strValue) ? null : strValue.split("`")[1];
                                String pattern = "yyyy-MM-dd HH:mm:ss";
                                SimpleDateFormat sdf = new SimpleDateFormat(pattern);
                                try {
                                    Date date = StringUtil.isEmptyOrNull(dateStr) ? null : sdf.parse(dateStr);
                                    if (date != null) {
                                        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
                                        value = sqlDate;
                                    }
                                } catch (ParseException e) {
                                    e.printStackTrace();
                                }
                            } else if (paramType.contains("BigDecimal")) {
                                String dateStr = StringUtil.isEmptyOrNull(strValue) ? null : strValue.split("`")[1];
                                value = StringUtil.isEmptyOrNull(dateStr) ? null : new BigDecimal(dateStr);
                            } else if (paramType.contains("Integer")) {
                                String dateStr = StringUtil.isEmptyOrNull(strValue) ? null : strValue.split("`")[1];
                                value = StringUtil.isEmptyOrNull(dateStr) ? null : Integer.parseInt(dateStr);
                            }
                            //类型
                            try {
                                if(value!=null){
                                    ReflectUtil.setParam(rcyjl, methodName, value);
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }

                            logger.info("Model:{}",rcyjl);
                        }
                        super.getFacade().getHlhtRyjlRcyjlService().createHlhtRyjlRcyjl(rcyjl);
                    }else{

                    }
                }
            }
        }
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constant.SUCCESS);
        result.put("data","");
        return result;
    }
}
