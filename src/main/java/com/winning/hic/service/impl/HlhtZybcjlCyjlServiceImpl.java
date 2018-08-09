package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.StringUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZybcjlCyjlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZybcjlCyjlService;
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
 * @title HLHT_ZYBCJL_CYJL
 * @email Winning Health
 * @package com.winning.hic.service.impl
 * @date 2018-33-31 16:33:08
 */
@Service
public class HlhtZybcjlCyjlServiceImpl implements HlhtZybcjlCyjlService {

    private final Logger logger = LoggerFactory.getLogger(HlhtZybcjlCyjlServiceImpl.class);
    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    @Autowired
    private HlhtZybcjlCyjlDao hlhtZybcjlCyjlDao;

    public int createHlhtZybcjlCyjl(HlhtZybcjlCyjl hlhtZybcjlCyjl) {
        return this.hlhtZybcjlCyjlDao.insertHlhtZybcjlCyjl(hlhtZybcjlCyjl);
    }

    public int modifyHlhtZybcjlCyjl(HlhtZybcjlCyjl hlhtZybcjlCyjl) {
        return this.hlhtZybcjlCyjlDao.updateHlhtZybcjlCyjl(hlhtZybcjlCyjl);
    }

    public int removeHlhtZybcjlCyjl(HlhtZybcjlCyjl hlhtZybcjlCyjl) {
        return this.hlhtZybcjlCyjlDao.deleteHlhtZybcjlCyjl(hlhtZybcjlCyjl);
    }

    public HlhtZybcjlCyjl getHlhtZybcjlCyjl(HlhtZybcjlCyjl hlhtZybcjlCyjl) {
        return this.hlhtZybcjlCyjlDao.selectHlhtZybcjlCyjl(hlhtZybcjlCyjl);
    }

    public int getHlhtZybcjlCyjlCount(HlhtZybcjlCyjl hlhtZybcjlCyjl) {
        return (Integer) this.hlhtZybcjlCyjlDao.selectHlhtZybcjlCyjlCount(hlhtZybcjlCyjl);
    }

    public List<HlhtZybcjlCyjl> getHlhtZybcjlCyjlList(HlhtZybcjlCyjl hlhtZybcjlCyjl) {
        return this.hlhtZybcjlCyjlDao.selectHlhtZybcjlCyjlList(hlhtZybcjlCyjl);
    }

    public List<HlhtZybcjlCyjl> getHlhtZybcjlCyjlPageList(HlhtZybcjlCyjl hlhtZybcjlCyjl) {
        return this.hlhtZybcjlCyjlDao.selectHlhtZybcjlCyjlPageList(hlhtZybcjlCyjl);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZybcjlCyjl() {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;


        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZYBCJL_CYJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZYBCJL_CYJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = this.mbzDataSetDao.selectMbzDataSetList(mbzDataSet);
        //1.获取对应的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZYBCJL_CYJL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        for (MbzDataListSet dataListSet : dataListSets) {
            EmrQtbljlk qtbljlk = new EmrQtbljlk();
            qtbljlk.setBldm(dataListSet.getModelCode());
            //2.根据模板代码去找到对应的病人病历
            List<HlhtZybcjlCyjl> hlhtRyjlJbxxListFromBaseData = this.hlhtZybcjlCyjlDao.getHlhtZybcjlCyjlListFromBaseData(qtbljlk);
            if (hlhtRyjlJbxxListFromBaseData != null) {
                for (HlhtZybcjlCyjl hlhtZybcjlCyjl : hlhtRyjlJbxxListFromBaseData) {
                    EmrQtbljlk emrQtbljlk = new EmrQtbljlk();
                    emrQtbljlk.setQtbljlxh(Long.parseLong(hlhtZybcjlCyjl.getYjlxh()));
                    emrQtbljlk = this.emrQtbljlkDao.selectEmrQtbljlk(emrQtbljlk);
                    //清库
                    HlhtZybcjlCyjl temp = new HlhtZybcjlCyjl();
                    temp.setYjlxh(hlhtZybcjlCyjl.getYjlxh());
                    this.hlhtZybcjlCyjlDao.deleteHlhtZybcjlCyjlByYjlxh(temp);
                    //3.xml文件解析 获取病历信息
                    Document document = null;
                    try {
                        document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlCyjl.class);
                    for (MbzDataSet dataSet : mbzDataSetList) {
                        //获取属性名
                        String pyCode = dataSet.getPyCode();
                        String methodName = "set" + StringUtil.titleCase(pyCode);
                        String strValue = XmlUtil.getAttrValueByDataSet(document, dataSet);
                        logger.info("pyCode:{};methodName:{};strValue:{}", pyCode, methodName, strValue);
                        Object value = null;
                        String paramType = paramTypeMap.get(pyCode);
                        System.out.println(">>>>>>>>>>>>>>" + paramType);
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
                                ReflectUtil.setParam(hlhtZybcjlCyjl, methodName, value);
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                    logger.info("Model:{}", hlhtZybcjlCyjl);
                    this.hlhtZybcjlCyjlDao.insertHlhtZybcjlCyjl(hlhtZybcjlCyjl);
                }
            }
        }
        return mbzDataChecks;
    }

    @Override
    public void deleteHlhtZybcjlCyjlByYjlxh(HlhtZybcjlCyjl hlhtZybcjlCyjl) {
        this.hlhtZybcjlCyjlDao.deleteHlhtZybcjlCyjl(hlhtZybcjlCyjl);
    }

    @Override
    public List<HlhtZybcjlCyjl> getHlhtZybcjlCyjlListFromBaseData(EmrQtbljlk emrQtbljlk) {
        return this.hlhtZybcjlCyjlDao.getHlhtZybcjlCyjlListFromBaseData(emrQtbljlk);
    }
}