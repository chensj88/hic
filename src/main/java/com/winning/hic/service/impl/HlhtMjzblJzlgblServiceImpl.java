package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.HicHelper;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtMjzblJzlgblDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtMjzblJzlgblService;
import org.dom4j.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;


/**
* @author HLHT
* @title HLHT_MJZBL_JZLGBL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-29-31 16:29:33
*/
@Service
public class HlhtMjzblJzlgblServiceImpl implements  HlhtMjzblJzlgblService {

    private static final Logger logger = LoggerFactory.getLogger(HlhtMjzblJzlgblServiceImpl.class);
    @Autowired
    private HlhtMjzblJzlgblDao hlhtMjzblJzlgblDao;
    @Autowired
    private CommonQueryDao commonQueryDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;
    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    public int createHlhtMjzblJzlgbl(HlhtMjzblJzlgbl hlhtMjzblJzlgbl){
        return this.hlhtMjzblJzlgblDao.insertHlhtMjzblJzlgbl(hlhtMjzblJzlgbl);
    }

    public int modifyHlhtMjzblJzlgbl(HlhtMjzblJzlgbl hlhtMjzblJzlgbl){
        return this.hlhtMjzblJzlgblDao.updateHlhtMjzblJzlgbl(hlhtMjzblJzlgbl);
    }

    public int removeHlhtMjzblJzlgbl(HlhtMjzblJzlgbl hlhtMjzblJzlgbl){
        return this.hlhtMjzblJzlgblDao.deleteHlhtMjzblJzlgbl(hlhtMjzblJzlgbl);
    }

    public HlhtMjzblJzlgbl getHlhtMjzblJzlgbl(HlhtMjzblJzlgbl hlhtMjzblJzlgbl){
        return this.hlhtMjzblJzlgblDao.selectHlhtMjzblJzlgbl(hlhtMjzblJzlgbl);
    }

    public int getHlhtMjzblJzlgblCount(HlhtMjzblJzlgbl hlhtMjzblJzlgbl){
        return (Integer)this.hlhtMjzblJzlgblDao.selectHlhtMjzblJzlgblCount(hlhtMjzblJzlgbl);
    }

    public List<HlhtMjzblJzlgbl> getHlhtMjzblJzlgblList(HlhtMjzblJzlgbl hlhtMjzblJzlgbl){
        return this.hlhtMjzblJzlgblDao.selectHlhtMjzblJzlgblList(hlhtMjzblJzlgbl);
    }

    public List<HlhtMjzblJzlgbl> getHlhtMjzblJzlgblPageList(HlhtMjzblJzlgbl hlhtMjzblJzlgbl){
        return this.hlhtMjzblJzlgblDao.selectHlhtMjzblJzlgblPageList(hlhtMjzblJzlgbl);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtMjzblJzlgbl(HlhtMjzblJzlgbl hlhtMjzblJzlgbl) throws IOException, ParseException {
        List<MbzDataCheck> dataChecks = null;

        //配置接口表字段配置信息
        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_MJZBL_JZLGBL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_MJZBL_JZLGBL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = mbzDataSetDao.selectMbzDataSetList(mbzDataSet);

        //获取接口表名称
        mbzDataSet = new MbzDataSet();
        mbzDataSet.setPId(0L);
        mbzDataSet.setSourceType(Constants.WN_MJZBL_JZLGBL_SOURCE_TYPE);
        mbzDataSet = mbzDataSetDao.selectMbzDataSet(mbzDataSet);

        //配置并加载对应的出入院模板集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_MJZBL_JZLGBL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);

        //获取接口对象字段集合信息
        Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZqgzxxSstys.class);

        if (dataListSets != null && dataListSets.size() > 0) {
            //获取模板集合，遍历
            for (MbzDataListSet dataListSet : dataListSets) {
                //查询病历数据 数据来源
                EmrQtbljlk qtbljlk = new EmrQtbljlk();
                qtbljlk.setBldm(dataListSet.getModelCode());
                List<EmrQtbljlk> qtbljlkList = emrQtbljlkDao.selectEmrQtbljlkList(qtbljlk);
                if (qtbljlkList != null && qtbljlkList.size() > 0) {
                    //循环病历
                    for (EmrQtbljlk emrQtbljlk : qtbljlkList) {
                        //获取接口数据
                        HlhtMjzblJzlgbl obj = new HlhtMjzblJzlgbl();
                        obj.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        obj = getHlhtMjzblJzlgbl(obj);
                        //解析病历xml
                        Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                        //判断是否存在重复,存在则删除，重新新增
                        if (obj != null) {
                            //初始化数据
                            HlhtMjzblJzlgbl oldObj = new HlhtMjzblJzlgbl();
                            oldObj.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                            this.removeHlhtMjzblJzlgbl(oldObj);
                        }
                        obj = new HlhtMjzblJzlgbl();
                        obj.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        obj = this.commonQueryDao.selectInitHlhtMjzblJzlgbl(obj);
                        obj = (HlhtMjzblJzlgbl) HicHelper.initModelValue(mbzDataSetList, document, obj, paramTypeMap);
                        this.createHlhtMjzblJzlgbl(obj);
                    }
                } else {
                    logger.info("接口数据集:[{}]无相关的病历信息，请先书写病历信息", mbzDataSet.getRecordName());
                }
            }
        } else {
            logger.info("接口数据集:[{}]未配置关联病历模板，请配置接口数据集关联病历模板", mbzDataSet.getRecordName());
        }


        return dataChecks;
    }
}