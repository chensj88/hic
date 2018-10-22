package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.PercentUtil;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.data.HlhtBlgyWssjzyDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
import com.winning.hic.dao.mz.MZCommonQueryDao;
import com.winning.hic.model.HlhtBlgyJbjkxx;
import com.winning.hic.model.HlhtBlgyWssjzy;
import com.winning.hic.model.MbzDataCheck;
import com.winning.hic.model.MbzLoadDataInfo;
import com.winning.hic.service.HlhtBlgyWssjzyService;
import com.winning.hic.service.MbzDataCheckService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
* @author HLHT
* @title HLHT_BLGY_WSSJZY
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-29-31 16:29:04
*/
@Service
public class HlhtBlgyWssjzyServiceImpl implements  HlhtBlgyWssjzyService {
    private final Logger logger = LoggerFactory.getLogger(HlhtBlgyJbjkxxServiceImpl.class);

    @Autowired
    private HlhtBlgyWssjzyDao hlhtBlgyWssjzyDao;

    @Autowired
    private MbzDataCheckService mbzDataCheckService;

    @Autowired
    private CommonQueryDao commonQueryDao;

    @Autowired
    private MZCommonQueryDao mzCommonQueryDao;

    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;

    public int createHlhtBlgyWssjzy(HlhtBlgyWssjzy hlhtBlgyWssjzy){
        return this.hlhtBlgyWssjzyDao.insertHlhtBlgyWssjzy(hlhtBlgyWssjzy);
    }

    public int modifyHlhtBlgyWssjzy(HlhtBlgyWssjzy hlhtBlgyWssjzy){
        return this.hlhtBlgyWssjzyDao.updateHlhtBlgyWssjzy(hlhtBlgyWssjzy);
    }

    public int removeHlhtBlgyWssjzy(HlhtBlgyWssjzy hlhtBlgyWssjzy){
        return this.hlhtBlgyWssjzyDao.deleteHlhtBlgyWssjzy(hlhtBlgyWssjzy);
    }

    public HlhtBlgyWssjzy getHlhtBlgyWssjzy(HlhtBlgyWssjzy hlhtBlgyWssjzy){
        return this.hlhtBlgyWssjzyDao.selectHlhtBlgyWssjzy(hlhtBlgyWssjzy);
    }

    public int getHlhtBlgyWssjzyCount(HlhtBlgyWssjzy hlhtBlgyWssjzy){
        return (Integer)this.hlhtBlgyWssjzyDao.selectHlhtBlgyWssjzyCount(hlhtBlgyWssjzy);
    }

    public List<HlhtBlgyWssjzy> getHlhtBlgyWssjzyList(HlhtBlgyWssjzy hlhtBlgyWssjzy){
        return this.hlhtBlgyWssjzyDao.selectHlhtBlgyWssjzyList(hlhtBlgyWssjzy);
    }

    public List<HlhtBlgyWssjzy> getHlhtBlgyWssjzyPageList(HlhtBlgyWssjzy hlhtBlgyWssjzy){
        return this.hlhtBlgyWssjzyDao.selectHlhtBlgyWssjzyPageList(hlhtBlgyWssjzy);
    }

    @Override
    public MbzDataCheck interfaceHlhtBlgyWssjzy(MbzDataCheck entity){
        int emr_count =0;//病历数量
        int real_count=0;//实际数量

        HlhtBlgyWssjzy wssjzy = new HlhtBlgyWssjzy();
        this.hlhtBlgyWssjzyDao.deleteHlhtBlgyWssjzy(wssjzy);
        wssjzy.getMap().put("startDate",entity.getMap().get("startDate"));
        wssjzy.getMap().put("endDate",entity.getMap().get("endDate"));
        wssjzy.getMap().put("syxh",entity.getMap().get("syxh"));
//        List<HlhtBlgyWssjzy> hlhtBlgyWssjzyZyList= this.commonQueryDao.selectBlgyWssjzyZyList(wssjzy);
//        List<HlhtBlgyWssjzy> hlhtBlgyWssjzyMzList= this.mzCommonQueryDao.selectBlgyWssjzyMzList(wssjzy);
//        hlhtBlgyWssjzyZyList.addAll(hlhtBlgyWssjzyMzList);
        List<HlhtBlgyWssjzy> hlhtBlgyWssjzyZyList =hlhtBlgyWssjzyDao.selectInitHlhtBlgyWssjzyListByProc(wssjzy);
        for (HlhtBlgyWssjzy obj : hlhtBlgyWssjzyZyList) {
            //清除历史数据
            HlhtBlgyWssjzy wssjzy1_one = new HlhtBlgyWssjzy();
            wssjzy1_one.setYjlxh(obj.getYjlxh());
            this.hlhtBlgyWssjzyDao.deleteHlhtBlgyWssjzy(wssjzy1_one);
            //清除日志
            Map<String,Object> param = new HashMap<>();
            param.put("SOURCE_ID",obj.getYjlxh());
            param.put("SOURCE_TYPE",Constants.WN_BLGY_WSSJZY_SOURCE_TYPE);
            mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
            try {


            logger.info("Model:{}", obj);
            //创建新的数据
            this.hlhtBlgyWssjzyDao.insertHlhtBlgyWssjzy(obj);

            //插入日志
            mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                    Long.parseLong(Constants.WN_BLGY_WSSJZY_SOURCE_TYPE),
                    Long.parseLong(obj.getYjlxh()),"卫生事件摘要表",obj.getSyxh()+"",new Timestamp(obj.getGxsj().getTime()),
                    obj.getPatid(),obj.getZyh(),obj.getHzxm(),obj.getXbmc(),obj.getXbdm(),
                    "NA","NA","NA","NA", obj.getSfzhm(), PercentUtil.getPercent(Long.parseLong(Constants.WN_BLGY_WSSJZY_SOURCE_TYPE), obj, 1),
                    PercentUtil.getPercent(Long.parseLong(Constants.WN_BLGY_WSSJZY_SOURCE_TYPE), obj, 0)));
            real_count++;
            }catch (Exception e){
                e.printStackTrace();
            }
        }


        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(hlhtBlgyWssjzyZyList.size(),real_count,Integer.parseInt(Constants.WN_BLGY_WSSJZY_SOURCE_TYPE),entity);
        return null;

//             //this.mzCommonQueryDao.insertHlhtBlgyWssjzyAll(wssjzy);
//        //插入数据集中
//        int emr_count =0;//病历数量
//        int real_count=0;//实际数量
//        HlhtBlgyWssjzy entity2 = new HlhtBlgyWssjzy();
//        List<HlhtBlgyWssjzy> hlhtBlgyWssjzyList = this.hlhtBlgyWssjzyDao.selectHlhtBlgyWssjzyList(entity2);
//        emr_count = hlhtBlgyWssjzyList.size();
//        real_count = hlhtBlgyWssjzyList.size();
//        //1.病历总数 2.抽取的病历数量 3.子集类型
//        this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_BLGY_WSSJZY_SOURCE_TYPE));
//        //插入日志
////        mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
////                Long.parseLong(Constants.WN_BLGY_WSSJZY_SOURCE_TYPE),
////                Long.parseLong(obj.getYjlxh()),"卫生事件摘要","NA",obj.getCfklrq(),
////                obj.getPatid(),obj.getMjzh(),obj.getHzxm(),obj.getXbmc(),obj.getXbdm(),
////                "NA","NA", "NA","NA", obj.getSfzhm()));


    }
}