package com.winning.hic.service.impl;

import com.winning.hic.base.Constant;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.StringUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZybcjlQjjlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZybcjlQjjlService;
import org.dom4j.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


/**
* @author HLHT
* @title HLHT_ZYBCJL_QJJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-33-31 16:33:49
*/
@Service
public class HlhtZybcjlQjjlServiceImpl implements  HlhtZybcjlQjjlService {

    @Autowired
    private HlhtZybcjlQjjlDao hlhtZybcjlQjjlDao;

    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    public int createHlhtZybcjlQjjl(HlhtZybcjlQjjl hlhtZybcjlQjjl){
        return this.hlhtZybcjlQjjlDao.insertHlhtZybcjlQjjl(hlhtZybcjlQjjl);
    }

    public int modifyHlhtZybcjlQjjl(HlhtZybcjlQjjl hlhtZybcjlQjjl){
        return this.hlhtZybcjlQjjlDao.updateHlhtZybcjlQjjl(hlhtZybcjlQjjl);
    }

    public int removeHlhtZybcjlQjjl(HlhtZybcjlQjjl hlhtZybcjlQjjl){
        return this.hlhtZybcjlQjjlDao.deleteHlhtZybcjlQjjl(hlhtZybcjlQjjl);
    }

    public HlhtZybcjlQjjl getHlhtZybcjlQjjl(HlhtZybcjlQjjl hlhtZybcjlQjjl){
        return this.hlhtZybcjlQjjlDao.selectHlhtZybcjlQjjl(hlhtZybcjlQjjl);
    }

    public int getHlhtZybcjlQjjlCount(HlhtZybcjlQjjl hlhtZybcjlQjjl){
        return (Integer)this.hlhtZybcjlQjjlDao.selectHlhtZybcjlQjjlCount(hlhtZybcjlQjjl);
    }

    public List<HlhtZybcjlQjjl> getHlhtZybcjlQjjlList(HlhtZybcjlQjjl hlhtZybcjlQjjl){
        return this.hlhtZybcjlQjjlDao.selectHlhtZybcjlQjjlList(hlhtZybcjlQjjl);
    }

    public List<HlhtZybcjlQjjl> getHlhtZybcjlQjjlPageList(HlhtZybcjlQjjl hlhtZybcjlQjjl){
        return this.hlhtZybcjlQjjlDao.selectHlhtZybcjlQjjlPageList(hlhtZybcjlQjjl);
    }

    public HlhtZybcjlQjjl getInitialHlhtZybcjlQjjl(HlhtZybcjlQjjl t) {
        return this.hlhtZybcjlQjjlDao.selectInitialHlhtZybcjlQjjl(t);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZybcjlQjjl() {
//执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constant.WN_ZYBCJL_SCBCJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constant.WN_ZYBCJL_SCBCJL_SOURCE_TYPE));
        //1.获取对应的首次病程的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constant.WN_ZYBCJL_SCBCJL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        try{
            for(MbzDataListSet dataListSet :dataListSets){
                //2.根据首次病程去找到对应的病人病历
                EmrQtbljlk qtbljlk = new EmrQtbljlk();
                qtbljlk.setBldm(dataListSet.getModelCode());
                List<EmrQtbljlk> qtbljlkList = emrQtbljlkDao.selectEmrQtbljlkList(qtbljlk);
                if(qtbljlkList != null){
                    for(EmrQtbljlk emrQtbljlk:qtbljlkList){
                        HlhtZybcjlQjjl scbcjl = new HlhtZybcjlQjjl();
                        scbcjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        scbcjl = this.getHlhtZybcjlQjjl(scbcjl);
                        if(scbcjl ==null){ //重复判断是否已经插入
                            //2.获取病历的其他信息，获取HIS，CIS的信息
                            HlhtZybcjlQjjl entity = new HlhtZybcjlQjjl();
                            entity.getMap().put("QTBLJLXH",emrQtbljlk.getQtbljlxh());
                            entity = this.getInitialHlhtZybcjlQjjl(entity);
                            StringBuffer xml= new StringBuffer();
                            xml.append(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                            //3.xml文件解析 获取病历信息
                            Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                            List<MbzDataSet> mbzDataSetList = mbzDataSetDao.selectMbzDataSetList(mbzDataSet);
                            //获取首次病程的对象集合
                            Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlQjjl.class);
                            for (MbzDataSet dataSet : mbzDataSetList) {
                                //获取属性名
                                String pyCode = dataSet.getPyCode();
                                String methodName = "set" + StringUtil.titleCase(pyCode);
                                String strValue = XmlUtil.getAttrValueByDataSet(document, dataSet);
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
                                    String pattern = "yyyy-MM-dd,HH:mm";
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
                                        ReflectUtil.setParam(entity, methodName, value);
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            }
                            this.createHlhtZybcjlQjjl(entity);
                        }

                    }
                }

            }


        }catch (Exception e){
            e.printStackTrace();
        }


        return mbzDataChecks;
    }
}