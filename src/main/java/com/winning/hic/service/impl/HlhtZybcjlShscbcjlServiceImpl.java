package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.data.HlhtZybcjlShscbcjlDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
import com.winning.hic.model.*;
import com.winning.hic.service.*;
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
* @title HLHT_ZYBCJL_SHSCBCJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-34-31 16:34:11
*/
@Service
public class HlhtZybcjlShscbcjlServiceImpl implements  HlhtZybcjlShscbcjlService {

    private static final Logger logger = LoggerFactory.getLogger(HlhtZybcjlShscbcjlServiceImpl.class);
    @Autowired
    private HlhtZybcjlShscbcjlDao hlhtZybcjlShscbcjlDao;
    @Autowired
    private CommonQueryDao commonQueryDao;
    @Autowired
    private EmrQtbljlkService emrQtbljlkService;
    @Autowired
    private MbzDataSetService mbzDataSetService;
    @Autowired
    private MbzDataListSetService mbzDataListSetService;
    @Autowired
    private MbzDataCheckService mbzDataCheckService;
    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;

    public int createHlhtZybcjlShscbcjl(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl){
        return this.hlhtZybcjlShscbcjlDao.insertHlhtZybcjlShscbcjl(hlhtZybcjlShscbcjl);
    }

    public int modifyHlhtZybcjlShscbcjl(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl){
        return this.hlhtZybcjlShscbcjlDao.updateHlhtZybcjlShscbcjl(hlhtZybcjlShscbcjl);
    }

    public int removeHlhtZybcjlShscbcjl(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl){
        return this.hlhtZybcjlShscbcjlDao.deleteHlhtZybcjlShscbcjl(hlhtZybcjlShscbcjl);
    }

    public HlhtZybcjlShscbcjl getHlhtZybcjlShscbcjl(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl){
        return this.hlhtZybcjlShscbcjlDao.selectHlhtZybcjlShscbcjl(hlhtZybcjlShscbcjl);
    }

    public int getHlhtZybcjlShscbcjlCount(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl){
        return (Integer)this.hlhtZybcjlShscbcjlDao.selectHlhtZybcjlShscbcjlCount(hlhtZybcjlShscbcjl);
    }

    public List<HlhtZybcjlShscbcjl> getHlhtZybcjlShscbcjlList(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl){
        return this.hlhtZybcjlShscbcjlDao.selectHlhtZybcjlShscbcjlList(hlhtZybcjlShscbcjl);
    }

    public List<HlhtZybcjlShscbcjl> getHlhtZybcjlShscbcjlPageList(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl){
        return this.hlhtZybcjlShscbcjlDao.selectHlhtZybcjlShscbcjlPageList(hlhtZybcjlShscbcjl);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZybcjlShscbcjl(MbzDataCheck entity) throws Exception {
        List<MbzDataCheck> dataCheckList = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量
         //加载模板
        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZYBCJL_SHSCBCJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZYBCJL_SHSCBCJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = mbzDataSetService.getMbzDataSetList(mbzDataSet);
        //加载接口对象字段集合信息
        Map<String,String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlShscbcjl.class);

        HlhtZybcjlShscbcjl hlht = new HlhtZybcjlShscbcjl();
        hlht.getMap().put("sourceType",Constants.WN_ZYBCJL_SHSCBCJL_SOURCE_TYPE);
        hlht.getMap().put("startDate",entity.getMap().get("startDate"));
        hlht.getMap().put("endDate",entity.getMap().get("endDate"));
        hlht.getMap().put("syxh",entity.getMap().get("syxh"));

        List<HlhtZybcjlShscbcjl> list = this.hlhtZybcjlShscbcjlDao.selectHlhtZybcjlShscbcjlListByProc(hlht);
        if(list != null && list.size() > 0) {
            emr_count = emr_count + list.size();
            for(HlhtZybcjlShscbcjl obj:list){
                //获取接口数据
                HlhtZybcjlShscbcjl oldObj = new HlhtZybcjlShscbcjl();
                oldObj.setYjlxh(String.valueOf(obj.getYjlxh()));
                oldObj = getHlhtZybcjlShscbcjl(oldObj);
                //解析病历xml
                Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(obj.getBlnr()));
                //System.out.println(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                //判断是否存在重复,存在则删除，重新新增
                if(oldObj != null ){
                    //初始化数据
                    HlhtZybcjlShscbcjl oldRcyjl  = new HlhtZybcjlShscbcjl();
                    oldRcyjl.setYjlxh(String.valueOf(obj.getYjlxh()));
                    this.removeHlhtZybcjlShscbcjl(oldRcyjl);
                    //清除日志
                    Map<String,Object> param = new HashMap<>();
                    param.put("SOURCE_ID",obj.getYjlxh());
                    param.put("SOURCE_TYPE",Constants.WN_ZYBCJL_SHSCBCJL_SOURCE_TYPE);
                    mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                }
                obj = (HlhtZybcjlShscbcjl) HicHelper.initModelValue(mbzDataSetList,document,obj,paramTypeMap);
                this.createHlhtZybcjlShscbcjl(obj);
                //插入日志
                mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                        Long.parseLong(Constants.WN_ZYBCJL_SHSCBCJL_SOURCE_TYPE),
                        Long.parseLong(obj.getYjlxh()),obj.getBlmc(),obj.getSyxh()+"",
                        obj.getFssj(),
                        obj.getPatid(),obj.getZyh(),obj.getHzxm(),obj.getXbmc(),obj.getXbdm(),
                        obj.getKsmc(),obj.getKsdm(), obj.getBqmc(),obj.getBqdm(), obj.getSfzhm(),
                        PercentUtil.getPercent(Long.parseLong(Constants.WN_ZYBCJL_SHSCBCJL_SOURCE_TYPE), obj, 1),
                        PercentUtil.getPercent(Long.parseLong(Constants.WN_ZYBCJL_SHSCBCJL_SOURCE_TYPE), obj, 0)));
                real_count++;
            }
        }else{
            logger.info("接口数据集:{}无相关的病历信息或者未配置结果集，请先书写病历信息或配置结果集",mbzDataSet.getRecordName());
        }




        //加载模板病历关系信息
       /* MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZYBCJL_SHSCBCJL_SOURCE_TYPE);
        List<MbzDataListSet> mbzDataListSetList = mbzDataListSetService.getMbzDataListSetList(mbzDataListSet);
        //获取模板病历关系集合，遍历
        for(MbzDataListSet dataListSet : mbzDataListSetList){
            //查询病历数据 数据来源
            EmrQtbljlk qtbljlk = new EmrQtbljlk();
            qtbljlk.setBldm(dataListSet.getModelCode());
            qtbljlk.setYxjl(1);
            qtbljlk.getMap().put("startDate",entity.getMap().get("startDate"));
            qtbljlk.getMap().put("endDate",entity.getMap().get("endDate"));
            qtbljlk.getMap().put("syxh",entity.getMap().get("syxh"));
            List<EmrQtbljlk> qtbljlkList = emrQtbljlkService.getEmrQtbljlkList(qtbljlk);
            emr_count = emr_count+qtbljlkList.size();
            if(qtbljlkList != null){
                //循环病历
                for(EmrQtbljlk emrQtbljlk:qtbljlkList){
                    //获取接口数据
                    HlhtZybcjlShscbcjl obj = new HlhtZybcjlShscbcjl();
                    obj.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                    obj = getHlhtZybcjlShscbcjl(obj);
                    //解析病历xml
                    Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                    System.out.println(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                    //判断是否存在重复,存在则删除，重新新增
                    if(obj != null ){
                        //初始化数据
                        HlhtZybcjlShscbcjl oldShscbcjl = new HlhtZybcjlShscbcjl();
                        oldShscbcjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        this.removeHlhtZybcjlShscbcjl(oldShscbcjl);

                        //清除日志
                        Map<String,Object> param = new HashMap<>();
                        param.put("SOURCE_ID",emrQtbljlk.getQtbljlxh());
                        param.put("SOURCE_TYPE",Constants.WN_ZYBCJL_SHSCBCJL_SOURCE_TYPE);
                        mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                    }
                    obj  = new HlhtZybcjlShscbcjl();
                    obj.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                    obj.getMap().put("hisName",ConfigUtils.getEnvironment().getZYHISLinkServerFullPathURL());
                    obj = this.commonQueryDao.selectInitHlhtZybcjlShscbcjl(obj);
                    obj = (HlhtZybcjlShscbcjl) HicHelper.initModelValue(mbzDataSetList,document,obj,paramTypeMap);
                    this.createHlhtZybcjlShscbcjl(obj);
                    //插入日志
                    mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                            Long.parseLong(Constants.WN_ZYBCJL_SHSCBCJL_SOURCE_TYPE),
                            emrQtbljlk.getQtbljlxh(),emrQtbljlk.getBlmc(),emrQtbljlk.getSyxh()+"",
                            new Timestamp(DateUtil.parse(emrQtbljlk.getFssj(),DateUtil.PATTERN_19).getTime()),
                            obj.getPatid(),obj.getZyh(),obj.getHzxm(),obj.getXbmc(),obj.getXbdm(),
                            obj.getKsmc(),obj.getKsdm(), obj.getBqmc(),obj.getBqdm(), obj.getSfzhm()));
                    real_count++;
                }
            }
        }*/
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_ZYBCJL_SHSCBCJL_SOURCE_TYPE),entity);
        return dataCheckList;
    }
}