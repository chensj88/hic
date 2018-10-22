package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.*;
import com.winning.hic.dao.data.HlhtZcjlPgcDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZcjlPgcService;
import com.winning.hic.service.MbzDataCheckService;
import com.winning.hic.service.MbzDataSetService;
import org.dom4j.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
* @author HLHT
* @title HLHT_ZCJL_PGC
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-30-31 16:30:59
*/
@Service
public class HlhtZcjlPgcServiceImpl implements  HlhtZcjlPgcService {
    private final Logger logger = LoggerFactory.getLogger(HlhtZcjlPgcServiceImpl.class);

    @Autowired
    private HlhtZcjlPgcDao hlhtZcjlPgcDao;

    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;

    @Autowired
    private CommonQueryDao commonQueryDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    @Autowired
    private MbzDataSetService mbzDataSetService;

    @Autowired
    private MbzDataCheckService mbzDataCheckService;

    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;

    public int createHlhtZcjlPgc(HlhtZcjlPgc hlhtZcjlPgc){
        return this.hlhtZcjlPgcDao.insertHlhtZcjlPgc(hlhtZcjlPgc);
    }

    public int modifyHlhtZcjlPgc(HlhtZcjlPgc hlhtZcjlPgc){
        return this.hlhtZcjlPgcDao.updateHlhtZcjlPgc(hlhtZcjlPgc);
    }

    public int removeHlhtZcjlPgc(HlhtZcjlPgc hlhtZcjlPgc){
        return this.hlhtZcjlPgcDao.deleteHlhtZcjlPgc(hlhtZcjlPgc);
    }

    public HlhtZcjlPgc getHlhtZcjlPgc(HlhtZcjlPgc hlhtZcjlPgc){
        return this.hlhtZcjlPgcDao.selectHlhtZcjlPgc(hlhtZcjlPgc);
    }

    public int getHlhtZcjlPgcCount(HlhtZcjlPgc hlhtZcjlPgc){
        return (Integer)this.hlhtZcjlPgcDao.selectHlhtZcjlPgcCount(hlhtZcjlPgc);
    }

    public List<HlhtZcjlPgc> getHlhtZcjlPgcList(HlhtZcjlPgc hlhtZcjlPgc){
        return this.hlhtZcjlPgcDao.selectHlhtZcjlPgcList(hlhtZcjlPgc);
    }

    public List<HlhtZcjlPgc> getHlhtZcjlPgcPageList(HlhtZcjlPgc hlhtZcjlPgc){
        return this.hlhtZcjlPgcDao.selectHlhtZcjlPgcPageList(hlhtZcjlPgc);
    }

    private HlhtZcjlPgc getInitialHlhtZcjlPgc(HlhtZcjlPgc entity) {
        return this.hlhtZcjlPgcDao.selectInitialHlhtZcjlPgc(entity);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZcjlPgc(MbzDataCheck t) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZCJL_PGC_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZCJL_PGC_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = mbzDataSetService.getMbzDataSetList(mbzDataSet);
        //1.获取对应的首次病程的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZCJL_PGC_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        try{
            //获取首次病程的对象集合
            Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZcjlPgc.class);
            //for(MbzDataListSet dataListSet :dataListSets){
                //2.根据首次病程去找到对应的病人病历
                HlhtZcjlPgc onePgc = new HlhtZcjlPgc();
                onePgc.getMap().put("sourceType", Constants.WN_ZCJL_PGC_SOURCE_TYPE);
                onePgc.getMap().put("startDate",t.getMap().get("startDate"));
                onePgc.getMap().put("endDate",t.getMap().get("endDate"));
                onePgc.getMap().put("syxh",t.getMap().get("syxh"));
                List<HlhtZcjlPgc> hlhtZcjlPgcs = this.hlhtZcjlPgcDao.selectHlhtZcjlPgcListByProc(onePgc);
                if(hlhtZcjlPgcs != null){
                    for(HlhtZcjlPgc obj:hlhtZcjlPgcs){
                        //清库
                        HlhtZcjlPgc temp = new HlhtZcjlPgc();
                        temp.setYjlxh(obj.getYjlxh());
                        this.removeHlhtZcjlPgc(temp);
                        //清除日志
                        Map<String, Object> param = new HashMap<>();
                        param.put("SOURCE_ID", obj.getYjlxh());
                        param.put("SOURCE_TYPE", Constants.WN_ZCJL_PGC_SOURCE_TYPE);
                        mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);

                        //3.xml文件解析 获取病历信息
                        Document document = null;
                        try {
                            document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(obj.getBlnr()));
                            obj = (HlhtZcjlPgc) HicHelper.initModelValue(mbzDataSetList, document, obj, paramTypeMap);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        logger.info("Model:{}", obj);

                        this.createHlhtZcjlPgc(obj);
                        //插入日志
                        mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                                Long.parseLong(Constants.WN_ZCJL_PGC_SOURCE_TYPE),
                                Long.parseLong(obj.getYjlxh()), obj.getBlmc(), obj.getSyxh() + "",
                                obj.getFssj(),
                                obj.getPatid(), obj.getZyh(), "NA","NA","NA",
                                obj.getKsmc(), obj.getKsdm(), obj.getBqmc(), obj.getBqdm(), obj.getSfzhm(), PercentUtil.getPercent(Long.parseLong(Constants.WN_ZCJL_PGC_SOURCE_TYPE), obj, 1),
                                PercentUtil.getPercent(Long.parseLong(Constants.WN_ZCJL_PGC_SOURCE_TYPE), obj, 0)));
                        real_count++;

                    }

                }

        }catch (Exception e){
            e.printStackTrace();
        }

        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_ZCJL_PGC_SOURCE_TYPE),t);

        return null;
    }


}