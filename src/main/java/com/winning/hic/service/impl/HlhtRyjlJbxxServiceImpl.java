package com.winning.hic.service.impl;

import com.winning.hic.base.Constant;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.StringUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.controller.RyjlJbxxExtractController;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtRyjlJbxxDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtRyjlJbxxService;
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
 * @title HLHT_RYJL_JBXX
 * @email Winning Health
 * @package com.winning.hic.service.impl
 * @date 2018-30-31 16:30:20
 */
@Service
public class HlhtRyjlJbxxServiceImpl implements HlhtRyjlJbxxService {
    private final Logger logger = LoggerFactory.getLogger(HlhtRyjlJbxxServiceImpl.class);
    @Autowired
    private HlhtRyjlJbxxDao hlhtRyjlJbxxDao;

    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;


    public int createHlhtRyjlJbxx(HlhtRyjlJbxx hlhtRyjlJbxx) {
        return this.hlhtRyjlJbxxDao.insertHlhtRyjlJbxx(hlhtRyjlJbxx);
    }

    public int modifyHlhtRyjlJbxx(HlhtRyjlJbxx hlhtRyjlJbxx) {
        return this.hlhtRyjlJbxxDao.updateHlhtRyjlJbxx(hlhtRyjlJbxx);
    }

    public int removeHlhtRyjlJbxx(HlhtRyjlJbxx hlhtRyjlJbxx) {
        return this.hlhtRyjlJbxxDao.deleteHlhtRyjlJbxx(hlhtRyjlJbxx);
    }

    public HlhtRyjlJbxx getHlhtRyjlJbxx(HlhtRyjlJbxx hlhtRyjlJbxx) {
        return this.hlhtRyjlJbxxDao.selectHlhtRyjlJbxx(hlhtRyjlJbxx);
    }

    public int getHlhtRyjlJbxxCount(HlhtRyjlJbxx hlhtRyjlJbxx) {
        return (Integer) this.hlhtRyjlJbxxDao.selectHlhtRyjlJbxxCount(hlhtRyjlJbxx);
    }

    public List<HlhtRyjlJbxx> getHlhtRyjlJbxxList(HlhtRyjlJbxx hlhtRyjlJbxx) {
        return this.hlhtRyjlJbxxDao.selectHlhtRyjlJbxxList(hlhtRyjlJbxx);
    }

    public List<HlhtRyjlJbxx> getHlhtRyjlJbxxPageList(HlhtRyjlJbxx hlhtRyjlJbxx) {
        return this.hlhtRyjlJbxxDao.selectHlhtRyjlJbxxPageList(hlhtRyjlJbxx);
    }

    @Override
    public List<HlhtRyjlJbxx> getHlhtRyjlJbxxListFromBaseData(EmrQtbljlk emrQtbljlk) {
        return this.hlhtRyjlJbxxDao.getHlhtRyjlJbxxListFromBaseData(emrQtbljlk);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtRyjlJbxx() {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;


        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constant.WN_RYJL_JBXX_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constant.WN_RYJL_JBXX_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = this.mbzDataSetDao.selectMbzDataSetList(mbzDataSet);
        //1.获取对应的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constant.WN_RYJL_JBXX_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        for (MbzDataListSet dataListSet : dataListSets) {
            EmrQtbljlk qtbljlk = new EmrQtbljlk();
            qtbljlk.setBldm(dataListSet.getModelCode());
            //2.根据模板代码去找到对应的病人病历
            List<HlhtRyjlJbxx> hlhtRyjlJbxxListFromBaseData = this.hlhtRyjlJbxxDao.getHlhtRyjlJbxxListFromBaseData(qtbljlk);
            if (hlhtRyjlJbxxListFromBaseData != null) {
                for (HlhtRyjlJbxx hlhtRyjlJbxx : hlhtRyjlJbxxListFromBaseData) {
                    EmrQtbljlk emrQtbljlk = new EmrQtbljlk();
                    emrQtbljlk.setQtbljlxh(Long.parseLong(hlhtRyjlJbxx.getYjlxh()));
                    emrQtbljlk = this.emrQtbljlkDao.selectEmrQtbljlk(emrQtbljlk);
                    //数据重复判断
                    HlhtRyjlJbxx temp = new HlhtRyjlJbxx();
                    temp.setYjlxh(hlhtRyjlJbxx.getYjlxh());
                    temp = this.hlhtRyjlJbxxDao.selectHlhtRyjlJbxx(temp);
                    //3.xml文件解析 获取病历信息
                    Document document = null;
                    try {
                        document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtRyjlJbxx.class);
                    if (temp == null) {
                        for (MbzDataSet dataSet : mbzDataSetList) {
                            //获取属性名
                            String pyCode = dataSet.getPyCode();
                            String methodName = "set" + StringUtil.titleCase(pyCode);
                            String strValue = XmlUtil.getAttrValueByDataSet(document, dataSet);
                            logger.info("pyCode:{};methodName:{};strValue:{}", pyCode, methodName, strValue);
                            Object value = null;
                            String paramType = paramTypeMap.get(pyCode);
                            System.out.println(">>>>>>>>>>>>>>"+paramType);
                            if (paramType.contains("String")) {
                                value = StringUtil.isEmptyOrNull(strValue) ? "N" : strValue.split("`")[2];
                            } else if (paramType.contains("Short")) {
                                //格式：50`50`50
                                String shortStr = StringUtil.isEmptyOrNull(strValue) ? "-9" : strValue.split("`")[2];
                                value = StringUtil.isEmptyOrNull(shortStr) ? null : Short.parseShort(shortStr);
                            } else if (paramType.contains("Date")) {
//                格式：636467930400000000`2017-11-20,16:44
                                String dateStr = StringUtil.isEmptyOrNull(strValue) ? null : strValue.split("`")[1];
                                String pattern = "yyyy-MM-dd,HH:mm";
                                SimpleDateFormat sdf = new SimpleDateFormat(pattern);
                                try {
                                    Date date = StringUtil.isEmptyOrNull(dateStr) ? new SimpleDateFormat("yyyy-MM-dd").parse("1990-01-01") : sdf.parse(dateStr);
                                    java.sql.Date sqlDate = new java.sql.Date(date.getTime());
                                    value = sqlDate;
                                } catch (ParseException e) {
                                    e.printStackTrace();
                                }
                            } else if (paramType.contains("Timestamp")) {
                                String dateStr = StringUtil.isEmptyOrNull(strValue) ? null : strValue.split("`")[1];
                                String pattern = "yyyy-MM-dd,HH:mm";
                                SimpleDateFormat sdf = new SimpleDateFormat(pattern);
                                try {
                                    Date date = StringUtil.isEmptyOrNull(dateStr) ? new SimpleDateFormat("yyyy-MM-dd").parse("1990-01-01") : sdf.parse(dateStr);
                                    Timestamp dateTime = new Timestamp(date.getTime());
                                    value = dateTime;
                                } catch (ParseException e) {
                                    e.printStackTrace();
                                }
                            } else if (paramType.contains("BigDecimal")) {
                                String dateStr = StringUtil.isEmptyOrNull(strValue) ? "-9" : strValue.split("`")[1];
                                value = StringUtil.isEmptyOrNull(dateStr) ? null : new BigDecimal(dateStr);
                            } else if (paramType.contains("Integer")) {
                                String dateStr = StringUtil.isEmptyOrNull(strValue) ? "-9" : strValue.split("`")[1];
                                value = StringUtil.isEmptyOrNull(dateStr) ? null : Integer.parseInt(dateStr);
                            }
                            //类型
                            try {
                                if (value != null) {
                                    ReflectUtil.setParam(hlhtRyjlJbxx, methodName, value);
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                        logger.info("Model:{}", hlhtRyjlJbxx);
                        this.hlhtRyjlJbxxDao.insertHlhtRyjlJbxx(hlhtRyjlJbxx);
                    }
                }
            }
        }

        return mbzDataChecks;
    }
}