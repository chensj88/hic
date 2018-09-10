package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.HicHelper;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZybcjlSwbltljlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZybcjlSwbltljlService;
import com.winning.hic.service.MbzDataCheckService;
import org.dom4j.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
* @author HLHT
* @title HLHT_ZYBCJL_SWBLTLJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-34-31 16:34:40
*/
@Service
public class HlhtZybcjlSwbltljlServiceImpl implements  HlhtZybcjlSwbltljlService {

    private static final Logger logger = LoggerFactory.getLogger(HlhtZybcjlSwbltljlServiceImpl.class);
    @Autowired
    private HlhtZybcjlSwbltljlDao hlhtZybcjlSwbltljlDao;

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

    public int createHlhtZybcjlSwbltljl(HlhtZybcjlSwbltljl hlhtZybcjlSwbltljl){
        return this.hlhtZybcjlSwbltljlDao.insertHlhtZybcjlSwbltljl(hlhtZybcjlSwbltljl);
    }

    public int modifyHlhtZybcjlSwbltljl(HlhtZybcjlSwbltljl hlhtZybcjlSwbltljl){
        return this.hlhtZybcjlSwbltljlDao.updateHlhtZybcjlSwbltljl(hlhtZybcjlSwbltljl);
    }

    public int removeHlhtZybcjlSwbltljl(HlhtZybcjlSwbltljl hlhtZybcjlSwbltljl){
        return this.hlhtZybcjlSwbltljlDao.deleteHlhtZybcjlSwbltljl(hlhtZybcjlSwbltljl);
    }

    public HlhtZybcjlSwbltljl getHlhtZybcjlSwbltljl(HlhtZybcjlSwbltljl hlhtZybcjlSwbltljl){
        return this.hlhtZybcjlSwbltljlDao.selectHlhtZybcjlSwbltljl(hlhtZybcjlSwbltljl);
    }

    public int getHlhtZybcjlSwbltljlCount(HlhtZybcjlSwbltljl hlhtZybcjlSwbltljl){
        return (Integer)this.hlhtZybcjlSwbltljlDao.selectHlhtZybcjlSwbltljlCount(hlhtZybcjlSwbltljl);
    }

    public List<HlhtZybcjlSwbltljl> getHlhtZybcjlSwbltljlList(HlhtZybcjlSwbltljl hlhtZybcjlSwbltljl){
        return this.hlhtZybcjlSwbltljlDao.selectHlhtZybcjlSwbltljlList(hlhtZybcjlSwbltljl);
    }

    public List<HlhtZybcjlSwbltljl> getHlhtZybcjlSwbltljlPageList(HlhtZybcjlSwbltljl hlhtZybcjlSwbltljl){
        return this.hlhtZybcjlSwbltljlDao.selectHlhtZybcjlSwbltljlPageList(hlhtZybcjlSwbltljl);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZybcjlSwbltljl(MbzDataCheck entity) {
        List<MbzDataCheck> dataChecks = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量
        //加载需要抽取的数据的字段信息
        MbzDataSet dataSet = new MbzDataSet();
        dataSet.setPId(Long.parseLong(Constants.WN_ZYBCJL_SWBLTLJL_SOURCE_TYPE));
        dataSet.setSourceType(Constants.WN_ZYBCJL_SWBLTLJL_SOURCE_TYPE);
        List<MbzDataSet> mbzDataSetList = mbzDataSetDao.selectMbzDataSetList(dataSet);
        //查询
        dataSet = new MbzDataSet();
        dataSet.setPId(0L);
        dataSet.setSourceType(Constants.WN_ZYBCJL_SWBLTLJL_SOURCE_TYPE);
        dataSet = mbzDataSetDao.selectMbzDataSet(dataSet);
        //加载已经配置的模板病历映射关系
        MbzDataListSet dataListSet = new MbzDataListSet();
        dataListSet.setSourceType(Constants.WN_ZYBCJL_SWBLTLJL_SOURCE_TYPE);
        List<MbzDataListSet> mbzDataListSetList = mbzDataListSetDao.selectMbzDataListSetList(dataListSet);

        //加载实体类中字段(变量信息)
        Map<String,String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlSwbltljl.class);
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
                    List<EmrQtbljlk> qtbljlkList = emrQtbljlkDao.selectEmrQtbljlkList(qtbljlk);
                    emr_count = emr_count+qtbljlkList.size();
                    if(qtbljlkList != null && qtbljlkList.size() > 0 ){
                        for (EmrQtbljlk emrQtbljlk : qtbljlkList) {
                            HlhtZybcjlSwbltljl obj = new HlhtZybcjlSwbltljl();
                            obj.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                            obj = this.getHlhtZybcjlSwbltljl(obj);
                            Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));

                            if(obj != null){ //删除历史数据
                                HlhtZybcjlSwbltljl oldSwbltl  = new HlhtZybcjlSwbltljl();
                                oldSwbltl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                                this.removeHlhtZybcjlSwbltljl(oldSwbltl);
                                //清除日志
                                Map<String,Object> param = new HashMap<>();
                                param.put("SOURCE_ID",emrQtbljlk.getQtbljlxh());
                                param.put("SOURCE_TYPE",Constants.WN_ZYBCJL_SWBLTLJL_SOURCE_TYPE);
                                mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);

                            }
                            obj = new HlhtZybcjlSwbltljl();
                            obj.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                            obj = this.commonQueryDao.selectInitHlhtZybcjlSwbltljl(obj);
                            obj = (HlhtZybcjlSwbltljl) HicHelper.initModelValue(mbzDataSetList,document,obj,paramTypeMap);
                            this.createHlhtZybcjlSwbltljl(obj);
                            //插入日志
                            mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                                    Long.parseLong(Constants.WN_ZYBCJL_SWBLTLJL_SOURCE_TYPE),
                                    emrQtbljlk.getQtbljlxh(), emrQtbljlk.getBlmc(),emrQtbljlk.getSyxh()+"",
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
        }
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_ZYBCJL_SWBLTLJL_SOURCE_TYPE));

        return dataChecks;
    }
}