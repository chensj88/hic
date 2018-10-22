package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZybcjlQjjlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZybcjlQjjlService;
import com.winning.hic.service.MbzDataCheckService;
import com.winning.hic.service.MbzDataSetService;
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
import java.util.HashMap;
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
    private final Logger logger = LoggerFactory.getLogger(HlhtZybcjlQjjlServiceImpl.class);

    @Autowired
    private HlhtZybcjlQjjlDao hlhtZybcjlQjjlDao;

    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;

    @Autowired
    private CommonQueryDao commonQueryDao;

    @Autowired
    private MbzDataSetService mbzDataSetService;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    @Autowired
    private MbzDataCheckService mbzDataCheckService;

    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;

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
    public List<MbzDataCheck> interfaceHlhtZybcjlQjjl(MbzDataCheck t) {
//执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZYBCJL_QJJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZYBCJL_QJJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = mbzDataSetService.getMbzDataSetList(mbzDataSet);
        //1.获取对应的首次病程的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZYBCJL_QJJL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        try{
            //获取首次病程的对象集合
            Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlQjjl.class);
            //for(MbzDataListSet dataListSet :dataListSets) {
                //2.根据首次病程去找到对应的病人病历
                HlhtZybcjlQjjl oneQjjl = new HlhtZybcjlQjjl();
                oneQjjl.getMap().put("startDate",t.getMap().get("startDate"));
                oneQjjl.getMap().put("endDate",t.getMap().get("endDate"));
                oneQjjl.getMap().put("syxh",t.getMap().get("syxh"));
                oneQjjl.getMap().put("sourceType",Constants.WN_ZYBCJL_QJJL_SOURCE_TYPE);
                List<HlhtZybcjlQjjl> hlhtZybcjlQjjls = this.hlhtZybcjlQjjlDao.selectHlhtZybcjlQjjlListByProc(oneQjjl);
            if (hlhtZybcjlQjjls != null) {
                emr_count = emr_count + hlhtZybcjlQjjls.size();
                for (HlhtZybcjlQjjl obj : hlhtZybcjlQjjls) {
                    //清库
                    HlhtZybcjlQjjl temp = new HlhtZybcjlQjjl();
                    temp.setYjlxh(obj.getYjlxh());
                    this.removeHlhtZybcjlQjjl(temp);
                    //清除日志
                    Map<String,Object> param = new HashMap<>();
                    param.put("SOURCE_ID",obj.getYjlxh());
                    param.put("SOURCE_TYPE",Constants.WN_ZYBCJL_QJJL_SOURCE_TYPE);
                    mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                    //3.xml文件解析 获取病历信息
                    Document document = null;
                    try {
                        document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(obj.getBlnr()));
                        obj = (HlhtZybcjlQjjl) HicHelper.initModelValue(mbzDataSetList, document, obj, paramTypeMap);
                        logger.info("Model:{}", obj);

                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    this.createHlhtZybcjlQjjl(obj);
                    //插入日志
                    mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                            Long.parseLong(Constants.WN_ZYBCJL_QJJL_SOURCE_TYPE),
                            Long.parseLong(obj.getYjlxh()), obj.getBlmc(), obj.getSyxh() + "",
                            obj.getFssj(),
                            obj.getPatid(),obj.getZyh(),obj.getHzxm(),obj.getXbmc(),obj.getXbdm(),
                            obj.getKsmc(),obj.getKsdm(), obj.getBqmc(),obj.getBqdm(), obj.getSfzhm(), PercentUtil.getPercent(Long.parseLong(Constants.WN_ZYBCJL_QJJL_SOURCE_TYPE), obj, 1),
                            PercentUtil.getPercent(Long.parseLong(Constants.WN_ZYBCJL_QJJL_SOURCE_TYPE), obj, 0)));
                    real_count++;

                }

            }
            //1.病历总数 2.抽取的病历数量 3.子集类型
            this.mbzDataCheckService.createMbzDataCheckNum(hlhtZybcjlQjjls.size(),real_count,Integer.parseInt(Constants.WN_ZYBCJL_QJJL_SOURCE_TYPE),t);

        }catch (Exception e){
            e.printStackTrace();
        }

        return mbzDataChecks;
    }
}