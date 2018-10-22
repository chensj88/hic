package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZybcjlJdxjDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZybcjlJdxjService;
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
* @title HLHT_ZYBCJL_JDXJ
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-33-31 16:33:32
*/
@Service
public class HlhtZybcjlJdxjServiceImpl implements  HlhtZybcjlJdxjService {
    private final Logger logger = LoggerFactory.getLogger(HlhtZybcjlJdxjServiceImpl.class);

    @Autowired
    private HlhtZybcjlJdxjDao hlhtZybcjlJdxjDao;
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

    public int createHlhtZybcjlJdxj(HlhtZybcjlJdxj hlhtZybcjlJdxj){
        return this.hlhtZybcjlJdxjDao.insertHlhtZybcjlJdxj(hlhtZybcjlJdxj);
    }

    public int modifyHlhtZybcjlJdxj(HlhtZybcjlJdxj hlhtZybcjlJdxj){
        return this.hlhtZybcjlJdxjDao.updateHlhtZybcjlJdxj(hlhtZybcjlJdxj);
    }

    public int removeHlhtZybcjlJdxj(HlhtZybcjlJdxj hlhtZybcjlJdxj){
        return this.hlhtZybcjlJdxjDao.deleteHlhtZybcjlJdxj(hlhtZybcjlJdxj);
    }

    public HlhtZybcjlJdxj getHlhtZybcjlJdxj(HlhtZybcjlJdxj hlhtZybcjlJdxj){
        return this.hlhtZybcjlJdxjDao.selectHlhtZybcjlJdxj(hlhtZybcjlJdxj);
    }

    public int getHlhtZybcjlJdxjCount(HlhtZybcjlJdxj hlhtZybcjlJdxj){
        return (Integer)this.hlhtZybcjlJdxjDao.selectHlhtZybcjlJdxjCount(hlhtZybcjlJdxj);
    }

    public List<HlhtZybcjlJdxj> getHlhtZybcjlJdxjList(HlhtZybcjlJdxj hlhtZybcjlJdxj){
        return this.hlhtZybcjlJdxjDao.selectHlhtZybcjlJdxjList(hlhtZybcjlJdxj);
    }

    public List<HlhtZybcjlJdxj> getHlhtZybcjlJdxjPageList(HlhtZybcjlJdxj hlhtZybcjlJdxj){
        return this.hlhtZybcjlJdxjDao.selectHlhtZybcjlJdxjPageList(hlhtZybcjlJdxj);
    }

    public HlhtZybcjlJdxj getInitialHlhtZybcjlJdxj(HlhtZybcjlJdxj t) {
        return this.hlhtZybcjlJdxjDao.selectInitialHlhtZybcjlJdxj(t);
    }

    @Override
    public List<MbzDataCheck>
    interfaceHlhtZybcjlJdxj(MbzDataCheck t) {

        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZYBCJL_JDXJ_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZYBCJL_JDXJ_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = mbzDataSetService.getMbzDataSetList(mbzDataSet);
        //1.获取对应的首次病程的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZYBCJL_JDXJ_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        try{
                HlhtZybcjlJdxj jdxj = new HlhtZybcjlJdxj();
                jdxj.getMap().put("sourceType", Constants.WN_ZYBCJL_JDXJ_SOURCE_TYPE);
                jdxj.getMap().put("startDate",t.getMap().get("startDate"));
                jdxj.getMap().put("endDate",t.getMap().get("endDate"));
                jdxj.getMap().put("syxh",t.getMap().get("syxh"));
                List<HlhtZybcjlJdxj> hlhtZybcjlJdxjs = this.hlhtZybcjlJdxjDao.selectHlhtZybcjlJdxjListByProc(jdxj);

                if (hlhtZybcjlJdxjs != null) {
                    emr_count = emr_count + hlhtZybcjlJdxjs.size();
                    for (HlhtZybcjlJdxj obj : hlhtZybcjlJdxjs) {
                        //清库
                        HlhtZybcjlJdxj temp = new HlhtZybcjlJdxj();
                        temp.setYjlxh(obj.getYjlxh());
                        this.removeHlhtZybcjlJdxj(temp);
                        //清除日志
                        Map<String,Object> param = new HashMap<>();
                        param.put("SOURCE_ID",obj.getYjlxh());
                        param.put("SOURCE_TYPE",Constants.WN_ZYBCJL_JDXJ_SOURCE_TYPE);
                        mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                        //3.xml文件解析 获取病历信息
                        Document document = null;
                        try {
                            document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(obj.getBlnr()));
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                        Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlJdxj.class);
                        obj = (HlhtZybcjlJdxj) HicHelper.initModelValue(mbzDataSetList, document, obj, paramTypeMap);
                        logger.info("Model:{}", obj);

                        this.createHlhtZybcjlJdxj(obj);
                        //插入日志
                        mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                                Long.parseLong(Constants.WN_ZYBCJL_JDXJ_SOURCE_TYPE),
                                Long.parseLong(obj.getYjlxh()), obj.getBlmc(), obj.getSyxh() + "",
                                obj.getFssj(),
                                obj.getPatid(),obj.getZyh(),obj.getHzxm(),obj.getXbmc(),obj.getXbdm(),
                                obj.getKsmc(),obj.getKsdm(), obj.getBqmc(),obj.getBqdm(), obj.getSfzhm(), PercentUtil.getPercent(Long.parseLong(Constants.WN_ZYBCJL_JDXJ_SOURCE_TYPE), obj, 1),
                                PercentUtil.getPercent(Long.parseLong(Constants.WN_ZYBCJL_JDXJ_SOURCE_TYPE), obj, 0)));
                        real_count++;

                            }

                        }

            //}
            //1.病历总数 2.抽取的病历数量 3.子集类型
            this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_ZYBCJL_JDXJ_SOURCE_TYPE),t);

        }catch (Exception e){
            e.printStackTrace();
        }


        return mbzDataChecks;
    }

}