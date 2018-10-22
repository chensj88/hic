package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZybcjlSqtlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZybcjlSqtlService;
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
* @title HLHT_ZYBCJL_SQTL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-34-31 16:34:26
*/
@Service
public class HlhtZybcjlSqtlServiceImpl implements  HlhtZybcjlSqtlService {

    private static final Logger logger = LoggerFactory.getLogger(HlhtZybcjlSqtlServiceImpl.class);
    @Autowired
    private HlhtZybcjlSqtlDao hlhtZybcjlSqtlDao;
    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;
    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;
    @Autowired
    private CommonQueryDao commonQueryDao;
    @Autowired
    private MbzDataCheckService mbzDataCheckService;
    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;

    public int createHlhtZybcjlSqtl(HlhtZybcjlSqtl hlhtZybcjlSqtl){
        return this.hlhtZybcjlSqtlDao.insertHlhtZybcjlSqtl(hlhtZybcjlSqtl);
    }

    public int modifyHlhtZybcjlSqtl(HlhtZybcjlSqtl hlhtZybcjlSqtl){
        return this.hlhtZybcjlSqtlDao.updateHlhtZybcjlSqtl(hlhtZybcjlSqtl);
    }

    public int removeHlhtZybcjlSqtl(HlhtZybcjlSqtl hlhtZybcjlSqtl){
        return this.hlhtZybcjlSqtlDao.deleteHlhtZybcjlSqtl(hlhtZybcjlSqtl);
    }

    public HlhtZybcjlSqtl getHlhtZybcjlSqtl(HlhtZybcjlSqtl hlhtZybcjlSqtl){
        return this.hlhtZybcjlSqtlDao.selectHlhtZybcjlSqtl(hlhtZybcjlSqtl);
    }

    public int getHlhtZybcjlSqtlCount(HlhtZybcjlSqtl hlhtZybcjlSqtl){
        return (Integer)this.hlhtZybcjlSqtlDao.selectHlhtZybcjlSqtlCount(hlhtZybcjlSqtl);
    }

    public List<HlhtZybcjlSqtl> getHlhtZybcjlSqtlList(HlhtZybcjlSqtl hlhtZybcjlSqtl){
        return this.hlhtZybcjlSqtlDao.selectHlhtZybcjlSqtlList(hlhtZybcjlSqtl);
    }

    public List<HlhtZybcjlSqtl> getHlhtZybcjlSqtlPageList(HlhtZybcjlSqtl hlhtZybcjlSqtl){
        return this.hlhtZybcjlSqtlDao.selectHlhtZybcjlSqtlPageList(hlhtZybcjlSqtl);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZybcjlSqtl(MbzDataCheck entity) throws Exception {
        List<MbzDataCheck> dataChecks = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量
        //加载需要抽取的数据的字段信息
        MbzDataSet dataSet = new MbzDataSet();
        dataSet.setPId(Long.parseLong(Constants.WN_ZYBCJL_SQTL_SOURCE_TYPE));
        dataSet.setSourceType(Constants.WN_ZYBCJL_SQTL_SOURCE_TYPE);
        List<MbzDataSet> mbzDataSetList = mbzDataSetDao.selectMbzDataSetList(dataSet);
        //查询
        dataSet = new MbzDataSet();
        dataSet.setPId(0L);
        dataSet.setSourceType(Constants.WN_ZYBCJL_SQTL_SOURCE_TYPE);
        dataSet = mbzDataSetDao.selectMbzDataSet(dataSet);
        //加载实体类中字段(变量信息)
        Map<String,String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlSqtl.class);

        HlhtZybcjlSqtl hlht = new HlhtZybcjlSqtl();
        hlht.getMap().put("sourceType",Constants.WN_ZYBCJL_SQTL_SOURCE_TYPE);
        hlht.getMap().put("startDate",entity.getMap().get("startDate"));
        hlht.getMap().put("endDate",entity.getMap().get("endDate"));
        hlht.getMap().put("syxh",entity.getMap().get("syxh"));

        List<HlhtZybcjlSqtl> list = this.hlhtZybcjlSqtlDao.selectHlhtZybcjlSqtlListByProc(hlht);
        if(list != null && list.size() > 0){
            emr_count = emr_count+list.size();
            for(HlhtZybcjlSqtl obj:list){
                //获取接口数据
                HlhtZybcjlSqtl oldObj = new HlhtZybcjlSqtl();
                oldObj.setYjlxh(String.valueOf(obj.getYjlxh()));
                oldObj = getHlhtZybcjlSqtl(oldObj);
                //解析病历xml
                Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(obj.getBlnr()));
                //System.out.println(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                //判断是否存在重复,存在则删除，重新新增
                if(oldObj != null ){
                    //初始化数据
                    HlhtZybcjlSqtl oldRcyjl  = new HlhtZybcjlSqtl();
                    oldRcyjl.setYjlxh(String.valueOf(obj.getYjlxh()));
                    this.removeHlhtZybcjlSqtl(oldRcyjl);
                    //清除日志
                    Map<String,Object> param = new HashMap<>();
                    param.put("SOURCE_ID",obj.getYjlxh());
                    param.put("SOURCE_TYPE",Constants.WN_ZYBCJL_SQTL_SOURCE_TYPE);
                    mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                }
                obj = (HlhtZybcjlSqtl) HicHelper.initModelValue(mbzDataSetList,document,obj,paramTypeMap);
                String zcrxm = obj.getZcrxm();
                zcrxm = zcrxm.replace(" ","");
                zcrxm = zcrxm.replace("副主任医师","");
                zcrxm = zcrxm.replace("副主治医师","");
                zcrxm = zcrxm.replace("主任医师","");
                zcrxm = zcrxm.replace("主治医师","");
                zcrxm = zcrxm.replace("住院医师","");
                obj.setZcrxm(zcrxm);
                obj.setZcrbm(zcrxm);
                String cjtlmd = obj.getCjtlmd();
                cjtlmd = cjtlmd.replace(" ","");
                cjtlmd = cjtlmd.replace("副主任医师","");
                cjtlmd = cjtlmd.replace("副主治医师","");
                cjtlmd = cjtlmd.replace("副住院医师","");
                cjtlmd = cjtlmd.replace("住院医师","");
                cjtlmd = cjtlmd.replace("主任医师","");
                cjtlmd = cjtlmd.replace("主治医师","");
                cjtlmd = cjtlmd.replace("规培医师","");

                cjtlmd = cjtlmd.replace("住院医生","");
                cjtlmd = cjtlmd.replace("主任医生","");
                cjtlmd = cjtlmd.replace("主治医生","");
                cjtlmd = cjtlmd.replace("规培医生","");

                cjtlmd = cjtlmd.replace("责任护士","");
                cjtlmd = cjtlmd.replace("护士长","");
                cjtlmd = cjtlmd.replace("实习医师","");

                cjtlmd = cjtlmd.replace("及基地住院医师，","");
                cjtlmd = cjtlmd.replace("及基地住院医师","");
                cjtlmd = cjtlmd.replace("规培基地住院医师及研究生，","");
                cjtlmd = cjtlmd.replace("规培基地住院医师及研究生","");
                cjtlmd = cjtlmd.replace("规培基地及研究生，","");
                cjtlmd = cjtlmd.replace("全体基地医师","");
                cjtlmd = cjtlmd.replace("全体基地，","");
                cjtlmd = cjtlmd.replace("基地医师","");
                cjtlmd = cjtlmd.replace("等","");
                cjtlmd = cjtlmd.replace("本科实习生","");
                cjtlmd = cjtlmd.replace("护士长","");
                cjtlmd = cjtlmd.replace("护士","");
                cjtlmd = cjtlmd.replace("等","");
                cjtlmd = cjtlmd.replace("规培基地","");
                cjtlmd = cjtlmd.replace("主任","");
                cjtlmd = cjtlmd.replace("，，","");
                cjtlmd = cjtlmd.replace("、","，");
                obj.setCjtlmd(cjtlmd);
                this.createHlhtZybcjlSqtl(obj);
                //插入日志
                mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                        Long.parseLong(Constants.WN_ZYBCJL_SQTL_SOURCE_TYPE),
                        Long.parseLong(obj.getYjlxh()), obj.getBlmc(),obj.getSyxh()+"",
                        obj.getFssj(),
                        obj.getPatid(),obj.getZyh(),obj.getHzxm(),obj.getXbmc(),obj.getXbdm(),
                        "NA","NA",  "NA","NA", obj.getSfzhm(),
                        PercentUtil.getPercent(Long.parseLong(Constants.WN_ZYBCJL_SQTL_SOURCE_TYPE), obj, 1),
                        PercentUtil.getPercent(Long.parseLong(Constants.WN_ZYBCJL_SQTL_SOURCE_TYPE), obj, 0)));
                real_count++;
            }
        }else{
            logger.info("接口数据集:{}无相关的病历信息或者未配置结果集，请先书写病历信息或配置结果集",dataSet.getRecordName());
        }

        /*//加载已经配置的模板病历映射关系
        MbzDataListSet dataListSet = new MbzDataListSet();
        dataListSet.setSourceType(Constants.WN_ZYBCJL_SQTL_SOURCE_TYPE);
        List<MbzDataListSet> mbzDataListSetList = mbzDataListSetDao.selectMbzDataListSetList(dataListSet);


        try {
            if(mbzDataListSetList != null && mbzDataListSetList.size() > 0){
                //循环配置模板病历信息
                for (MbzDataListSet mbzDataListSet : mbzDataListSetList) {
                    //查询病历
                    EmrQtbljlk qtbljlk = new EmrQtbljlk();
                    qtbljlk.setBldm(mbzDataListSet.getModelCode());
                    qtbljlk.setYxjl(1);
                    qtbljlk.getMap().put("startDate",entity.getMap().get("startDate"));
                    qtbljlk.getMap().put("endDate",entity.getMap().get("endDate"));
                    qtbljlk.getMap().put("syxh",entity.getMap().get("syxh"));
                    List<EmrQtbljlk> qtbljlkList = emrQtbljlkDao.selectEmrQtbljlkList(qtbljlk);
                    emr_count = emr_count+qtbljlkList.size();
                    if(qtbljlkList != null && qtbljlkList.size() > 0 ){
                        for (EmrQtbljlk emrQtbljlk : qtbljlkList) {
                            HlhtZybcjlSqtl obj = new HlhtZybcjlSqtl();
                            obj.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                            obj = this.getHlhtZybcjlSqtl(obj);
                            System.out.println(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                            Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                            if(obj != null){ //删除历史数据
                                HlhtZybcjlSqtl oldSqtl  = new HlhtZybcjlSqtl();
                                oldSqtl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                                this.removeHlhtZybcjlSqtl(oldSqtl);

                                //清除日志
                                Map<String,Object> param = new HashMap<>();
                                param.put("SOURCE_ID",emrQtbljlk.getQtbljlxh());
                                param.put("SOURCE_TYPE",Constants.WN_ZYBCJL_SQTL_SOURCE_TYPE);
                                mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                            }
                            obj = new HlhtZybcjlSqtl();
                            obj.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                            obj.getMap().put("hisName",ConfigUtils.getEnvironment().getZYHISLinkServerFullPathURL());
                            obj = this.commonQueryDao.selectInitHlhtZybcjlSqtl(obj);
                            obj = (HlhtZybcjlSqtl) HicHelper.initModelValue(mbzDataSetList,document,obj,paramTypeMap);
                            this.createHlhtZybcjlSqtl(obj);
                            mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                                    Long.parseLong(Constants.WN_ZYBCJL_SQTL_SOURCE_TYPE),
                                    emrQtbljlk.getQtbljlxh(),emrQtbljlk.getBlmc(),emrQtbljlk.getSyxh()+"",
                                    new Timestamp(DateUtil.parse(emrQtbljlk.getFssj(),DateUtil.PATTERN_19).getTime()),
                                    obj.getPatid(),obj.getZyh(),obj.getHzxm(),obj.getXbmc(),obj.getXbdm(),
                                    obj.getKsmc(),obj.getKsdm(), obj.getBqmc(),obj.getBqdm(), obj.getSfzhm()));
                            real_count++;

                        }
                    }else{
                        logger.info("接口数据集:{}无相关的病历信息，请先书写病历信息",dataSet.getRecordName());
                    }
                }

            }else{
                logger.info("接口数据集:{}未配置关联病历模板，请配置接口数据集关联病历模板",dataSet.getRecordName());
            }
        }catch (Exception e){
            e.printStackTrace();
        }*/
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_ZYBCJL_SQTL_SOURCE_TYPE),entity);

        return dataChecks;
    }
}