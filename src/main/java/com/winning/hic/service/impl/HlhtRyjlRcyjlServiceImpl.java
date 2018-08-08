package com.winning.hic.service.impl;

import com.winning.hic.base.Constant;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.StringUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.dao.data.HlhtRyjlRcyjlDao;
import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.model.HlhtRyjlRcyjl;
import com.winning.hic.model.MbzDataListSet;
import com.winning.hic.model.MbzDataSet;
import com.winning.hic.service.EmrQtbljlkService;
import com.winning.hic.service.HlhtRyjlRcyjlService;
import com.winning.hic.service.MbzDataListSetService;
import com.winning.hic.service.MbzDataSetService;
import org.dom4j.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


/**
* @author HLHT
* @title HLHT_RYJL_RCYJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-30-31 16:30:31
*/
@Service
public class HlhtRyjlRcyjlServiceImpl implements  HlhtRyjlRcyjlService {

    private static final Logger logger = LoggerFactory.getLogger(HlhtRyjlRcyjlServiceImpl.class);

    @Autowired
    private HlhtRyjlRcyjlDao hlhtRyjlRcyjlDao;
    @Autowired
    private MbzDataListSetService mbzDataListSetService;
    @Autowired
    private MbzDataSetService mbzDataSetService;
    @Autowired
    private EmrQtbljlkService emrQtbljlkService;

    public int createHlhtRyjlRcyjl(HlhtRyjlRcyjl hlhtRyjlRcyjl){
        return this.hlhtRyjlRcyjlDao.insertHlhtRyjlRcyjl(hlhtRyjlRcyjl);
    }

    public int modifyHlhtRyjlRcyjl(HlhtRyjlRcyjl hlhtRyjlRcyjl){
        return this.hlhtRyjlRcyjlDao.updateHlhtRyjlRcyjl(hlhtRyjlRcyjl);
    }

    public int removeHlhtRyjlRcyjl(HlhtRyjlRcyjl hlhtRyjlRcyjl){
        return this.hlhtRyjlRcyjlDao.deleteHlhtRyjlRcyjl(hlhtRyjlRcyjl);
    }

    public HlhtRyjlRcyjl getHlhtRyjlRcyjl(HlhtRyjlRcyjl hlhtRyjlRcyjl){
        return this.hlhtRyjlRcyjlDao.selectHlhtRyjlRcyjl(hlhtRyjlRcyjl);
    }

    public int getHlhtRyjlRcyjlCount(HlhtRyjlRcyjl hlhtRyjlRcyjl){
        return (Integer)this.hlhtRyjlRcyjlDao.selectHlhtRyjlRcyjlCount(hlhtRyjlRcyjl);
    }

    public List<HlhtRyjlRcyjl> getHlhtRyjlRcyjlList(HlhtRyjlRcyjl hlhtRyjlRcyjl){
        return this.hlhtRyjlRcyjlDao.selectHlhtRyjlRcyjlList(hlhtRyjlRcyjl);
    }

    public List<HlhtRyjlRcyjl> getHlhtRyjlRcyjlPageList(HlhtRyjlRcyjl hlhtRyjlRcyjl){
        return this.hlhtRyjlRcyjlDao.selectHlhtRyjlRcyjlPageList(hlhtRyjlRcyjl);
    }

    /**
     *  生成24小时入出院记录
     * @param rcyjl
     */
    @Override
    public HlhtRyjlRcyjl getInitHlhtRyjlRcyjlData(HlhtRyjlRcyjl rcyjl) {
        return  this.hlhtRyjlRcyjlDao.selectInitHlhtRyjlRcyjlData(rcyjl);
    }

    @Override
    public List<HlhtRyjlRcyjl> interfaceHlhtRyjlRcyjl(HlhtRyjlRcyjl hlhtRyjlRcyjl) throws IOException, ParseException {
        //配置接口表字段配置信息
        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constant.WN_RYJL_RCYJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constant.WN_RYJL_RCYJL_SOURCE_TYPE));
        //配置并加载对应的出入院模板集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constant.WN_RYJL_RCYJL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = mbzDataListSetService.getMbzDataListSetList(mbzDataListSet);
        //获取模板集合，遍历
        for(MbzDataListSet dataListSet :dataListSets){
            //查询病历数据 数据来源
            EmrQtbljlk qtbljlk = new EmrQtbljlk();
            qtbljlk.setBldm(dataListSet.getModelCode());
            List<EmrQtbljlk> qtbljlkList = emrQtbljlkService.getEmrQtbljlkList(qtbljlk);
            if(qtbljlkList != null){
                //循环病历
                for(EmrQtbljlk emrQtbljlk:qtbljlkList){
                    //获取接口数据
                    HlhtRyjlRcyjl rcyjl = new HlhtRyjlRcyjl();
                    rcyjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                    rcyjl = getHlhtRyjlRcyjl(rcyjl);
                    //解析病历xml
                    Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                    //获取接口字段组合信息
                    List<MbzDataSet> mbzDataSetList = mbzDataSetService.getMbzDataSetList(mbzDataSet);
                    //获取接口对象字段集合信息
                    Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtRyjlRcyjl.class);
                    //判断是否存在重复
                    if(rcyjl == null ){
                        //初始化数据
                        rcyjl  = new HlhtRyjlRcyjl();
                        rcyjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        rcyjl = this.getInitHlhtRyjlRcyjlData(rcyjl);
                        rcyjl = initHlhtRyjlRcyjl(mbzDataSetList,document,paramTypeMap,rcyjl);
                        this.createHlhtRyjlRcyjl(rcyjl);
                    }else{
                        //查询后台存储数据
                        rcyjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        rcyjl = this.getHlhtRyjlRcyjl(rcyjl);
                        rcyjl = initHlhtRyjlRcyjl(mbzDataSetList,document,paramTypeMap,rcyjl);
                        this.modifyHlhtRyjlRcyjl(rcyjl);
                    }
                }
            }
        }
        return null;
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