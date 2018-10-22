package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZqgzxxTsjczltysDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZqgzxxTsjczltysService;
import com.winning.hic.service.MbzDataCheckService;
import org.dom4j.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
* @author HLHT
* @title HLHT_ZQGZXX_TSJCZLTYS 特殊检查及特殊治疗同意书
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-32-31 16:32:57
*/
@Service
public class HlhtZqgzxxTsjczltysServiceImpl implements  HlhtZqgzxxTsjczltysService {

    private static final Logger logger = LoggerFactory.getLogger(HlhtZqgzxxTsjczltysServiceImpl.class);
    @Autowired
    private HlhtZqgzxxTsjczltysDao hlhtZqgzxxTsjczltysDao;
    @Autowired
    private CommonQueryDao commonQueryDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;
    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;
    @Autowired
    private MbzDataCheckService mbzDataCheckService;
    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;


    public int createHlhtZqgzxxTsjczltys(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys){
        return this.hlhtZqgzxxTsjczltysDao.insertHlhtZqgzxxTsjczltys(hlhtZqgzxxTsjczltys);
    }

    public int modifyHlhtZqgzxxTsjczltys(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys){
        return this.hlhtZqgzxxTsjczltysDao.updateHlhtZqgzxxTsjczltys(hlhtZqgzxxTsjczltys);
    }

    public int removeHlhtZqgzxxTsjczltys(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys){
        return this.hlhtZqgzxxTsjczltysDao.deleteHlhtZqgzxxTsjczltys(hlhtZqgzxxTsjczltys);
    }

    public HlhtZqgzxxTsjczltys getHlhtZqgzxxTsjczltys(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys){
        return this.hlhtZqgzxxTsjczltysDao.selectHlhtZqgzxxTsjczltys(hlhtZqgzxxTsjczltys);
    }

    public int getHlhtZqgzxxTsjczltysCount(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys){
        return (Integer)this.hlhtZqgzxxTsjczltysDao.selectHlhtZqgzxxTsjczltysCount(hlhtZqgzxxTsjczltys);
    }

    public List<HlhtZqgzxxTsjczltys> getHlhtZqgzxxTsjczltysList(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys){
        return this.hlhtZqgzxxTsjczltysDao.selectHlhtZqgzxxTsjczltysList(hlhtZqgzxxTsjczltys);
    }

    public List<HlhtZqgzxxTsjczltys> getHlhtZqgzxxTsjczltysPageList(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys){
        return this.hlhtZqgzxxTsjczltysDao.selectHlhtZqgzxxTsjczltysPageList(hlhtZqgzxxTsjczltys);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZqgzxxTsjczltys(MbzDataCheck entity) throws Exception {
        List<MbzDataCheck> dataChecks = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量
        //配置接口表字段配置信息
        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZQGZXX_TSJCZLTYS_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZQGZXX_TSJCZLTYS_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = mbzDataSetDao.selectMbzDataSetList(mbzDataSet);

        //获取接口表名称
        mbzDataSet = new MbzDataSet();
        mbzDataSet.setPId(0L);
        mbzDataSet.setSourceType(Constants.WN_ZQGZXX_TSJCZLTYS_SOURCE_TYPE);
        mbzDataSet = mbzDataSetDao.selectMbzDataSet(mbzDataSet);

        //获取接口对象字段集合信息
        Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZqgzxxTsjczltys.class);

        HlhtZqgzxxTsjczltys hlht = new HlhtZqgzxxTsjczltys();
        hlht.getMap().put("sourceType",Constants.WN_ZQGZXX_TSJCZLTYS_SOURCE_TYPE);
        hlht.getMap().put("startDate",entity.getMap().get("startDate"));
        hlht.getMap().put("endDate",entity.getMap().get("endDate"));
        hlht.getMap().put("syxh",entity.getMap().get("syxh"));

        List<HlhtZqgzxxTsjczltys> list = this.hlhtZqgzxxTsjczltysDao.selectHlhtZqgzxxTsjczltysListByProc(hlht);
        if(list != null && list.size() > 0) {
            emr_count = emr_count + list.size();
            for (HlhtZqgzxxTsjczltys obj : list) {
                //获取接口数据
                HlhtZqgzxxTsjczltys oldObj = new HlhtZqgzxxTsjczltys();
                oldObj.setYjlxh(String.valueOf(obj.getYjlxh()));
                oldObj = getHlhtZqgzxxTsjczltys(obj);
                //解析病历xml
                Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(obj.getBlnr()));
                //判断是否存在重复,存在则删除，重新新增
                if (oldObj != null) {
                    //初始化数据
                    HlhtZqgzxxTsjczltys oldRcyjl = new HlhtZqgzxxTsjczltys();
                    oldRcyjl.setYjlxh(String.valueOf(obj.getYjlxh()));
                    this.removeHlhtZqgzxxTsjczltys(oldObj);

                    //清除日志
                    Map<String,Object> param = new HashMap<>();
                    param.put("SOURCE_ID",obj.getYjlxh());
                    param.put("SOURCE_TYPE",Constants.WN_ZQGZXX_TSJCZLTYS_SOURCE_TYPE);
                    mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                }
                obj = (HlhtZqgzxxTsjczltys) HicHelper.initModelValue(mbzDataSetList, document, obj, paramTypeMap);
                obj.setJczlxmmc(obj.getBlmc().replace("知情同意书",""));
                this.createHlhtZqgzxxTsjczltys(obj);

                //插入日志
                mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                        Long.parseLong(Constants.WN_ZQGZXX_TSJCZLTYS_SOURCE_TYPE),
                        Long.parseLong(obj.getYjlxh()),obj.getBlmc(),obj.getSyxh()+"",
                        obj.getFssj(),
                        obj.getPatid(),obj.getZyh(),obj.getHzxm(),obj.getXbmc(),obj.getXbdm(),
                        obj.getKsmc(),obj.getKsdm(), obj.getBqmc(),obj.getBqdm(), obj.getSfzhm(),
                        PercentUtil.getPercent(Long.parseLong(Constants.WN_ZQGZXX_TSJCZLTYS_SOURCE_TYPE), obj, 1),
                        PercentUtil.getPercent(Long.parseLong(Constants.WN_ZQGZXX_TSJCZLTYS_SOURCE_TYPE), obj, 0)));
                real_count++;
            }

        }else{
            logger.info("接口数据集:{}无相关的病历信息或者未配置结果集，请先书写病历信息或配置结果集",mbzDataSet.getRecordName());
        }
        /*//配置并加载对应的出入院模板集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZQGZXX_TSJCZLTYS_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);

        if (dataListSets != null && dataListSets.size() > 0) {
            //获取模板集合，遍历
            for (MbzDataListSet dataListSet : dataListSets) {
                //查询病历数据 数据来源
                EmrQtbljlk qtbljlk = new EmrQtbljlk();
                qtbljlk.setBldm(dataListSet.getModelCode());
                qtbljlk.setYxjl(1);
                qtbljlk.getMap().put("startDate",entity.getMap().get("startDate"));
                qtbljlk.getMap().put("endDate",entity.getMap().get("endDate"));
                qtbljlk.getMap().put("syxh",entity.getMap().get("syxh"));
                List<EmrQtbljlk> qtbljlkList = emrQtbljlkDao.selectEmrQtbljlkList(qtbljlk);
                emr_count = emr_count+qtbljlkList.size();

                if (qtbljlkList != null && qtbljlkList.size() > 0) {
                    //循环病历
                    for (EmrQtbljlk emrQtbljlk : qtbljlkList) {
                        //获取接口数据
                        HlhtZqgzxxTsjczltys obj = new HlhtZqgzxxTsjczltys();
                        obj.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        obj = getHlhtZqgzxxTsjczltys(obj);
                        //解析病历xml
                        Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                        //判断是否存在重复,存在则删除，重新新增
                        if (obj != null) {
                            //初始化数据
                            HlhtZqgzxxTsjczltys oldObj = new HlhtZqgzxxTsjczltys();
                            oldObj.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                            this.removeHlhtZqgzxxTsjczltys(oldObj);

                            //清除日志
                            Map<String,Object> param = new HashMap<>();
                            param.put("SOURCE_ID",emrQtbljlk.getQtbljlxh());
                            param.put("SOURCE_TYPE",Constants.WN_ZQGZXX_TSJCZLTYS_SOURCE_TYPE);
                            mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                        }
                        obj = new HlhtZqgzxxTsjczltys();
                        obj.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        obj.getMap().put("hisName",ConfigUtils.getEnvironment().getZYHISLinkServerFullPathURL());
                        obj = this.commonQueryDao.selectInitHlhtZqgzxxTsjczltys(obj);
                        obj = (HlhtZqgzxxTsjczltys) HicHelper.initModelValue(mbzDataSetList, document, obj, paramTypeMap);
                        obj.setJczlxmmc(emrQtbljlk.getBlmc().replace("知情同意书",""));
                        this.createHlhtZqgzxxTsjczltys(obj);

                        //插入日志
                        mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                                Long.parseLong(Constants.WN_ZQGZXX_TSJCZLTYS_SOURCE_TYPE),
                                emrQtbljlk.getQtbljlxh(),emrQtbljlk.getBlmc(),emrQtbljlk.getSyxh()+"",
                                new Timestamp(DateUtil.parse(emrQtbljlk.getFssj(),DateUtil.PATTERN_19).getTime()),
                                obj.getPatid(),obj.getZyh(),obj.getHzxm(),obj.getXbmc(),obj.getXbdm(),
                                obj.getKsmc(),obj.getKsdm(), obj.getBqmc(),obj.getBqdm(), obj.getSfzhm()));
                        real_count++;
                    }
                } else {
                    logger.info("接口数据集:{}无相关的病历信息，请先书写病历信息", mbzDataSet.getRecordName());
                }
            }
        } else {
            logger.info("接口数据集:{}未配置关联病历模板，请配置接口数据集关联病历模板", mbzDataSet.getRecordName());
        }*/
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_ZQGZXX_TSJCZLTYS_SOURCE_TYPE),entity);


        return dataChecks;
    }
}