package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.StringUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZybcjlJjbjlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZybcjlJjbjlService;
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
* @title HLHT_ZYBCJL_JJBJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-33-31 16:33:41
*/
@Service
public class HlhtZybcjlJjbjlServiceImpl implements  HlhtZybcjlJjbjlService {

    @Autowired
    private HlhtZybcjlJjbjlDao hlhtZybcjlJjbjlDao;

    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    public int createHlhtZybcjlJjbjl(HlhtZybcjlJjbjl hlhtZybcjlJjbjl){
        return this.hlhtZybcjlJjbjlDao.insertHlhtZybcjlJjbjl(hlhtZybcjlJjbjl);
    }

    public int modifyHlhtZybcjlJjbjl(HlhtZybcjlJjbjl hlhtZybcjlJjbjl){
        return this.hlhtZybcjlJjbjlDao.updateHlhtZybcjlJjbjl(hlhtZybcjlJjbjl);
    }

    public int removeHlhtZybcjlJjbjl(HlhtZybcjlJjbjl hlhtZybcjlJjbjl){
        return this.hlhtZybcjlJjbjlDao.deleteHlhtZybcjlJjbjl(hlhtZybcjlJjbjl);
    }

    public HlhtZybcjlJjbjl getHlhtZybcjlJjbjl(HlhtZybcjlJjbjl hlhtZybcjlJjbjl){
        return this.hlhtZybcjlJjbjlDao.selectHlhtZybcjlJjbjl(hlhtZybcjlJjbjl);
    }

    public int getHlhtZybcjlJjbjlCount(HlhtZybcjlJjbjl hlhtZybcjlJjbjl){
        return (Integer)this.hlhtZybcjlJjbjlDao.selectHlhtZybcjlJjbjlCount(hlhtZybcjlJjbjl);
    }

    public List<HlhtZybcjlJjbjl> getHlhtZybcjlJjbjlList(HlhtZybcjlJjbjl hlhtZybcjlJjbjl){
        return this.hlhtZybcjlJjbjlDao.selectHlhtZybcjlJjbjlList(hlhtZybcjlJjbjl);
    }

    public List<HlhtZybcjlJjbjl> getHlhtZybcjlJjbjlPageList(HlhtZybcjlJjbjl hlhtZybcjlJjbjl){
        return this.hlhtZybcjlJjbjlDao.selectHlhtZybcjlJjbjlPageList(hlhtZybcjlJjbjl);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZybcjlJjbjl() {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;

        //数据抽取
        try{

            MbzDataSet mbzDataSet = new MbzDataSet();
            mbzDataSet.setSourceType(Constants.WN_ZYBCJL_JJBJL_SOURCE_TYPE);
            mbzDataSet.setPId(Long.parseLong(Constants.WN_ZYBCJL_JJBJL_SOURCE_TYPE));
            //1.获取对应的首次病程的模板ID集合
            MbzDataListSet mbzDataListSet = new MbzDataListSet();
            mbzDataListSet.setSourceType(Constants.WN_ZYBCJL_JJBJL_SOURCE_TYPE);
            List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
            for(MbzDataListSet dataListSet :dataListSets){
                //2.根据首次病程去找到对应的病人病历
                EmrQtbljlk qtbljlk = new EmrQtbljlk();
                qtbljlk.setBldm(dataListSet.getModelCode());
                List<EmrQtbljlk> qtbljlkList = emrQtbljlkDao.selectEmrQtbljlkList(qtbljlk);
                if(qtbljlkList != null){
                    for(EmrQtbljlk emrQtbljlk:qtbljlkList){
                        HlhtZybcjlJjbjl jjbjl = new HlhtZybcjlJjbjl();
                        jjbjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        jjbjl =this.hlhtZybcjlJjbjlDao.selectHlhtZybcjlJjbjl(jjbjl);
                        if(jjbjl ==null){ //重复判断是否已经插入
                            //2.获取病历的其他信息，获取HIS，CIS的信息
                            HlhtZybcjlJjbjl entity = new HlhtZybcjlJjbjl();
                            entity.getMap().put("QTBLJLXH",emrQtbljlk.getQtbljlxh());
                            entity = this.hlhtZybcjlJjbjlDao.selectInitialHlhtZybcjlJjbjl(entity);
                            StringBuffer xml= new StringBuffer();
                            xml.append(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                            //3.xml文件解析 获取病历信息
                            Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                            List<MbzDataSet> mbzDataSetList = this.mbzDataSetDao.selectMbzDataSetList(mbzDataSet);
                            //获取首次病程的对象集合
                            Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlScbcjl.class);
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
                            this.createHlhtZybcjlJjbjl(entity);
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