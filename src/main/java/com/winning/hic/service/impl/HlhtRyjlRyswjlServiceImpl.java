package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtRyjlRyswjlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtRyjlRyswjlService;
import com.winning.hic.service.MbzDataCheckService;
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
* @title HLHT_RYJL_RYSWJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-30-31 16:30:41
*/
@Service
public class HlhtRyjlRyswjlServiceImpl implements  HlhtRyjlRyswjlService {

    private static final Logger logger = LoggerFactory.getLogger(HlhtRyjlRyswjlServiceImpl.class);

    @Autowired
    private HlhtRyjlRyswjlDao hlhtRyjlRyswjlDao;
    @Autowired
    private CommonQueryDao commonQueryDao;
    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;
    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    @Autowired
    private MbzDataCheckService mbzDataCheckService;

    public int createHlhtRyjlRyswjl(HlhtRyjlRyswjl hlhtRyjlRyswjl){
        return this.hlhtRyjlRyswjlDao.insertHlhtRyjlRyswjl(hlhtRyjlRyswjl);
    }

    public int modifyHlhtRyjlRyswjl(HlhtRyjlRyswjl hlhtRyjlRyswjl){
        return this.hlhtRyjlRyswjlDao.updateHlhtRyjlRyswjl(hlhtRyjlRyswjl);
    }

    public int removeHlhtRyjlRyswjl(HlhtRyjlRyswjl hlhtRyjlRyswjl){
        return this.hlhtRyjlRyswjlDao.deleteHlhtRyjlRyswjl(hlhtRyjlRyswjl);
    }

    public HlhtRyjlRyswjl getHlhtRyjlRyswjl(HlhtRyjlRyswjl hlhtRyjlRyswjl){
        return this.hlhtRyjlRyswjlDao.selectHlhtRyjlRyswjl(hlhtRyjlRyswjl);
    }

    public int getHlhtRyjlRyswjlCount(HlhtRyjlRyswjl hlhtRyjlRyswjl){
        return (Integer)this.hlhtRyjlRyswjlDao.selectHlhtRyjlRyswjlCount(hlhtRyjlRyswjl);
    }

    public List<HlhtRyjlRyswjl> getHlhtRyjlRyswjlList(HlhtRyjlRyswjl hlhtRyjlRyswjl){
        return this.hlhtRyjlRyswjlDao.selectHlhtRyjlRyswjlList(hlhtRyjlRyswjl);
    }

    public List<HlhtRyjlRyswjl> getHlhtRyjlRyswjlPageList(HlhtRyjlRyswjl hlhtRyjlRyswjl){
        return this.hlhtRyjlRyswjlDao.selectHlhtRyjlRyswjlPageList(hlhtRyjlRyswjl);
    }

    public HlhtRyjlRyswjl getInitHlhtRyjlRyswjl(HlhtRyjlRyswjl hlhtRyjlRyswjl){
        return this.commonQueryDao.selectInitHlhtRyjlRyswjl(hlhtRyjlRyswjl);
    }
    public List<MbzDataCheck> interfaceHlhtRyjlRyswjl(HlhtRyjlRyswjl ryjlRyswjl) throws IOException, ParseException {
        //加载模板库 根据模板类型获取对应的病历模板代码
        MbzDataCheck mbzDataCheck = new MbzDataCheck();
        int emr_count =0;//病历数量
        int real_count=0;//实际数量
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_RYJL_RYSWJL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);

        //加载模板字段库
        MbzDataSet  mbzDataSet = new MbzDataSet();
        mbzDataSet.setPId(Long.parseLong(Constants.WN_RYJL_RYSWJL_SOURCE_TYPE));
        mbzDataSet.setSourceType(Constants.WN_RYJL_RYSWJL_SOURCE_TYPE);
        List<MbzDataSet> mbzDataSets = mbzDataSetDao.selectMbzDataSetList(mbzDataSet);

        mbzDataSet = new MbzDataSet();
        mbzDataSet.setPId(0L);
        mbzDataSet.setSourceType(Constants.WN_RYJL_RYSWJL_SOURCE_TYPE);
        mbzDataSet = mbzDataSetDao.selectMbzDataSet(mbzDataSet);

        //获取model对象自定义参数信息
        Map<String,String> paramType = ReflectUtil.getParamTypeMap(HlhtRyjlRyswjl.class);

        if(dataListSets != null && dataListSets.size() > 0){
            //循环配置模板信息
            for (MbzDataListSet dataListSet : dataListSets) {
                //查询病历信息
                EmrQtbljlk emrQtbljlk = new EmrQtbljlk();
                emrQtbljlk.setBldm(dataListSet.getModelCode());
                List<EmrQtbljlk> qtbljlkList = emrQtbljlkDao.selectEmrQtbljlkList(emrQtbljlk);
                emr_count = emr_count+qtbljlkList.size();
                if(qtbljlkList != null && qtbljlkList.size() > 0){
                    for (EmrQtbljlk qtbljlk : qtbljlkList) {
                        HlhtRyjlRyswjl ryswjl = new HlhtRyjlRyswjl();
                        ryswjl.setYjlxh(String.valueOf(qtbljlk.getQtbljlxh()));
                        ryswjl = this.getHlhtRyjlRyswjl(ryswjl);
                        //解析病历报文xml
                        Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(qtbljlk.getBlnr()));
                        if(ryswjl != null ){ //判断记录是否已经创建,存在则删除，重新新增
                            HlhtRyjlRyswjl oldRyswjl = new HlhtRyjlRyswjl();
                            oldRyswjl.setYjlxh(String.valueOf(qtbljlk.getQtbljlxh()));
                            this.removeHlhtRyjlRyswjl(oldRyswjl);
                        }
                        ryswjl = new HlhtRyjlRyswjl();
                        ryswjl.setYjlxh(String.valueOf(qtbljlk.getQtbljlxh()));
                        ryswjl = this.commonQueryDao.selectInitHlhtRyjlRyswjl(ryswjl);
                        ryswjl = (HlhtRyjlRyswjl) HicHelper.initModelValue(mbzDataSets,document,ryswjl,paramType);
                        this.createHlhtRyjlRyswjl(ryswjl);
                        real_count++;
                    }
                }else {
                    logger.info("接口数据集:{}无相关的病历信息，请先书写病历信息",mbzDataSet.getRecordName());
                }
            }
        }else {
            logger.info("接口数据集:{}未配置关联病历模板，请配置接口数据集关联病历模板",mbzDataSet.getRecordName());
        }
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_RYJL_RYSWJL_SOURCE_TYPE));

         return  null;
    }


}