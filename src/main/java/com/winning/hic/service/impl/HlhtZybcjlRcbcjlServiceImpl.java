package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.StringUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZybcjlRcbcjlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZybcjlRcbcjlService;
import org.dom4j.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
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
 * @title HLHT_ZYBCJL_RCBCJL
 * @email Winning Health
 * @package com.winning.hic.service.impl
 * @date 2018-33-31 16:33:54
 */
@Service
public class HlhtZybcjlRcbcjlServiceImpl implements HlhtZybcjlRcbcjlService {
    private final Logger logger = LoggerFactory.getLogger(HlhtZybcjlRcbcjlServiceImpl.class);
    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;
    @Autowired
    private HlhtZybcjlRcbcjlDao hlhtZybcjlRcbcjlDao;

    public int createHlhtZybcjlRcbcjl(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl) {
        return this.hlhtZybcjlRcbcjlDao.insertHlhtZybcjlRcbcjl(hlhtZybcjlRcbcjl);
    }

    public int modifyHlhtZybcjlRcbcjl(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl) {
        return this.hlhtZybcjlRcbcjlDao.updateHlhtZybcjlRcbcjl(hlhtZybcjlRcbcjl);
    }

    public int removeHlhtZybcjlRcbcjl(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl) {
        return this.hlhtZybcjlRcbcjlDao.deleteHlhtZybcjlRcbcjl(hlhtZybcjlRcbcjl);
    }

    public HlhtZybcjlRcbcjl getHlhtZybcjlRcbcjl(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl) {
        return this.hlhtZybcjlRcbcjlDao.selectHlhtZybcjlRcbcjl(hlhtZybcjlRcbcjl);
    }

    public int getHlhtZybcjlRcbcjlCount(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl) {
        return (Integer) this.hlhtZybcjlRcbcjlDao.selectHlhtZybcjlRcbcjlCount(hlhtZybcjlRcbcjl);
    }

    public List<HlhtZybcjlRcbcjl> getHlhtZybcjlRcbcjlList(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl) {
        return this.hlhtZybcjlRcbcjlDao.selectHlhtZybcjlRcbcjlList(hlhtZybcjlRcbcjl);
    }

    public List<HlhtZybcjlRcbcjl> getHlhtZybcjlRcbcjlPageList(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl) {
        return this.hlhtZybcjlRcbcjlDao.selectHlhtZybcjlRcbcjlPageList(hlhtZybcjlRcbcjl);
    }

    @Override
    public List<HlhtZybcjlRcbcjl> getHlhtRyjlJbxxListFromBaseData(EmrQtbljlk emrQtbljlk) throws DataAccessException {
        return this.hlhtZybcjlRcbcjlDao.getHlhtZybcjlRcbcjlListFromBaseData(emrQtbljlk);
    }

    @Override
    public void deleteHlhtRyjlJbxxByYjlxh(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl) {
        this.hlhtZybcjlRcbcjlDao.deleteHlhtZybcjlRcbcjl(hlhtZybcjlRcbcjl);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZybcjlRcbcjl() {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;


        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZYBCJL_RCBCJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZYBCJL_RCBCJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = this.mbzDataSetDao.selectMbzDataSetList(mbzDataSet);
        //1.获取对应的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZYBCJL_RCBCJL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        for (MbzDataListSet dataListSet : dataListSets) {
            EmrQtbljlk qtbljlk = new EmrQtbljlk();
            qtbljlk.setBldm(dataListSet.getModelCode());
            //2.根据模板代码去找到对应的病人病历
            List<HlhtZybcjlRcbcjl> hlhtZybcjlRcbcjlListFromBaseData = this.hlhtZybcjlRcbcjlDao.getHlhtZybcjlRcbcjlListFromBaseData(qtbljlk);
            if (hlhtZybcjlRcbcjlListFromBaseData != null) {
                for (HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl : hlhtZybcjlRcbcjlListFromBaseData) {
                    EmrQtbljlk emrQtbljlk = new EmrQtbljlk();
                    emrQtbljlk.setQtbljlxh(Long.parseLong(hlhtZybcjlRcbcjl.getYjlxh()));
                    emrQtbljlk = this.emrQtbljlkDao.selectEmrQtbljlk(emrQtbljlk);
                    //清库
                    HlhtZybcjlRcbcjl temp = new HlhtZybcjlRcbcjl();
                    temp.setYjlxh(hlhtZybcjlRcbcjl.getYjlxh());
                    this.hlhtZybcjlRcbcjlDao.deleteHlhtZybcjlRcbcjlByYjlxh(temp);
                    //3.xml文件解析 获取病历信息
                    Document document = null;
                    try {
                        document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlRcbcjl.class);
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
                                ReflectUtil.setParam(hlhtZybcjlRcbcjl, methodName, value);
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                    logger.info("Model:{}", hlhtZybcjlRcbcjl);
                    this.hlhtZybcjlRcbcjlDao.insertHlhtZybcjlRcbcjl(hlhtZybcjlRcbcjl);
                }
            }
        }
        return mbzDataChecks;
    }
}