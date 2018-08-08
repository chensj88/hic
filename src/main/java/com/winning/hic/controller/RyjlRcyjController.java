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
import java.sql.Timestamp;
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
    public void index() throws IOException, ParseException {
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
                //循环病历
                for(EmrQtbljlk emrQtbljlk:qtbljlkList){
                    //获取接口数据
                    HlhtRyjlRcyjl rcyjl = new HlhtRyjlRcyjl();
                    rcyjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                    rcyjl = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjl(rcyjl);
                    //解析病历xml
                    Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                    //获取接口字段组合信息
                    List<MbzDataSet> mbzDataSetList = getFacade().getMbzDataSetService().getMbzDataSetList(mbzDataSet);
                    //获取接口对象字段集合信息
                    Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtRyjlRcyjl.class);
                    //判断是否存在重复
                    if(rcyjl == null ){
                        //初始化数据
                        rcyjl  = new HlhtRyjlRcyjl();
                        rcyjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        rcyjl = super.getFacade().getHlhtRyjlRcyjlService().getInitHlhtRyjlRcyjlData(rcyjl);
                        rcyjl = initHlhtRyjlRcyjl(mbzDataSetList,document,paramTypeMap,rcyjl);
                        super.getFacade().getHlhtRyjlRcyjlService().createHlhtRyjlRcyjl(rcyjl);
                    }else{
                        //查询后台存储数据
                        rcyjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        rcyjl = super.getFacade().getHlhtRyjlRcyjlService().getHlhtRyjlRcyjl(rcyjl);
                        rcyjl = initHlhtRyjlRcyjl(mbzDataSetList,document,paramTypeMap,rcyjl);
                        super.getFacade().getHlhtRyjlRcyjlService().modifyHlhtRyjlRcyjl(rcyjl);
                    }
                }
            }
        }
    }


    /**
     * 数据初始化
     * @param mbzDataSetList 字段配置信息
     * @param document xml对应dom对象
     * @param paramTypeMap 对象字段信息
     * @param rcyjl
     * @return
     * @throws ParseException
     */
    private HlhtRyjlRcyjl initHlhtRyjlRcyjl( List<MbzDataSet> mbzDataSetList,Document document,Map<String, String> paramTypeMap,HlhtRyjlRcyjl rcyjl) throws ParseException {
        for (MbzDataSet dataSet : mbzDataSetList) {
            //获取属性名
            String pyCode = dataSet.getPyCode();
            String methodName = "set" + StringUtil.titleCase(pyCode);
            String strValue = null ;
            //判断是否可以取值到，不能则提供默认值
            try {
                strValue =  XmlUtil.getAttrValueByDataSet(document, dataSet);
                logger.info("pyCode:{};methodName:{};strValue:{}", pyCode, methodName, strValue);
            }catch (NullPointerException e){
                logger.info("pyCode:{};methodName:{};strValue:{};using default value", pyCode, methodName, strValue);
            }
            Object value = null;
            if(strValue == null){
                String paramType = paramTypeMap.get(pyCode);
                if (paramType.contains("String")) {
                    value = "N";
                }else if (paramType.contains("Short")) {
                    value = new Short("-9");
                }else if (paramType.contains("Date")) {
                    String pattern = "yyyy-MM-dd HH:mm:ss";
                    SimpleDateFormat sdf = new SimpleDateFormat(pattern);
                    String dateStr = "1990-01-01 00:00:00";
                    java.sql.Date sqlDate = new java.sql.Date(sdf.parse(dateStr).getTime());
                    value = sqlDate;
                }else if (paramType.contains("BigDecimal")) {
                    value = new BigDecimal(-9);
                } else if (paramType.contains("Integer")) {
                    value = new Integer(-9);
                }
            }else{
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
        if(rcyjl.getCyrq() == null){
            String pattern = "yyyy-MM-dd HH:mm:ss";
            SimpleDateFormat sdf = new SimpleDateFormat(pattern);
            String dateStr = "1990-01-01 00:00:00";
            java.sql.Date sqlDate = new java.sql.Date(sdf.parse(dateStr).getTime());
            rcyjl.setCyrq(new Timestamp(sqlDate.getTime()));
        }
       return  rcyjl;
    }
}
