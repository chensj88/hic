package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZqgzxxQtzqtysDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZqgzxxQtzqtysService;
import com.winning.hic.service.MbzDataCheckService;
import com.winning.hic.service.MbzDataSetService;
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
* @title HLHT_ZQGZXX_QTZQTYS
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-32-31 16:32:29
*/
@Service
public class HlhtZqgzxxQtzqtysServiceImpl implements  HlhtZqgzxxQtzqtysService {
    private final Logger logger = LoggerFactory.getLogger(HlhtZqgzxxQtzqtysServiceImpl.class);

    @Autowired
    private HlhtZqgzxxQtzqtysDao hlhtZqgzxxQtzqtysDao;

    @Autowired
    private MbzDataSetService mbzDataSetService;

    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    @Autowired
    private CommonQueryDao commonQueryDao;

    @Autowired
    private MbzDataCheckService mbzDataCheckService;

    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;


    public int createHlhtZqgzxxQtzqtys(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys){
        return this.hlhtZqgzxxQtzqtysDao.insertHlhtZqgzxxQtzqtys(hlhtZqgzxxQtzqtys);
    }

    public int modifyHlhtZqgzxxQtzqtys(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys){
        return this.hlhtZqgzxxQtzqtysDao.updateHlhtZqgzxxQtzqtys(hlhtZqgzxxQtzqtys);
    }

    public int removeHlhtZqgzxxQtzqtys(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys){
        return this.hlhtZqgzxxQtzqtysDao.deleteHlhtZqgzxxQtzqtys(hlhtZqgzxxQtzqtys);
    }

    public HlhtZqgzxxQtzqtys getHlhtZqgzxxQtzqtys(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys){
        return this.hlhtZqgzxxQtzqtysDao.selectHlhtZqgzxxQtzqtys(hlhtZqgzxxQtzqtys);
    }

    public int getHlhtZqgzxxQtzqtysCount(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys){
        return (Integer)this.hlhtZqgzxxQtzqtysDao.selectHlhtZqgzxxQtzqtysCount(hlhtZqgzxxQtzqtys);
    }

    public List<HlhtZqgzxxQtzqtys> getHlhtZqgzxxQtzqtysList(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys){
        return this.hlhtZqgzxxQtzqtysDao.selectHlhtZqgzxxQtzqtysList(hlhtZqgzxxQtzqtys);
    }

    public List<HlhtZqgzxxQtzqtys> getHlhtZqgzxxQtzqtysPageList(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys){
        return this.hlhtZqgzxxQtzqtysDao.selectHlhtZqgzxxQtzqtysPageList(hlhtZqgzxxQtzqtys);
    }

    private HlhtZqgzxxQtzqtys getInitialHlhtZqgzxxQtzqtys(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys) {
        return this.hlhtZqgzxxQtzqtysDao.selectInitialHlhtZqgzxxQtzqtys(hlhtZqgzxxQtzqtys);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZqgzxxQtzqtys(MbzDataCheck t) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZQGZXX_QTZQTYS_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZQGZXX_QTZQTYS_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = mbzDataSetService.getMbzDataSetList(mbzDataSet);
        //1.获取对应的首次病程的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZQGZXX_QTZQTYS_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        try{
            //获取首次病程的对象集合
            Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZqgzxxQtzqtys.class);
            //for(MbzDataListSet dataListSet :dataListSets){
                HlhtZqgzxxQtzqtys oneQtzqtys = new HlhtZqgzxxQtzqtys();
                oneQtzqtys.getMap().put("sourceType", Constants.WN_ZQGZXX_QTZQTYS_SOURCE_TYPE);
                oneQtzqtys.getMap().put("startDate",t.getMap().get("startDate"));
                oneQtzqtys.getMap().put("endDate",t.getMap().get("endDate"));
                oneQtzqtys.getMap().put("syxh",t.getMap().get("syxh"));
                List<HlhtZqgzxxQtzqtys> hlhtZqgzxxQtzqtyss = this.hlhtZqgzxxQtzqtysDao.selectHlhtZqgzxxQtzqtysListByProc(oneQtzqtys);
                if (hlhtZqgzxxQtzqtyss != null) {
                    emr_count = emr_count + hlhtZqgzxxQtzqtyss.size();
                    for (HlhtZqgzxxQtzqtys obj : hlhtZqgzxxQtzqtyss) {
                        //清库
                        HlhtZqgzxxQtzqtys temp = new HlhtZqgzxxQtzqtys();
                        temp.setYjlxh(obj.getYjlxh());
                        this.removeHlhtZqgzxxQtzqtys(temp);
                        //清除日志
                        Map<String, Object> param = new HashMap<>();
                        param.put("SOURCE_ID", obj.getYjlxh());
                        param.put("SOURCE_TYPE", Constants.WN_ZQGZXX_QTZQTYS_SOURCE_TYPE);
                        mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);

                        //3.xml文件解析 获取病历信息
                        Document document = null;
                        try {
                            document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(obj.getBlnr()));
                            obj = (HlhtZqgzxxQtzqtys) HicHelper.initModelValue(mbzDataSetList, document, obj, paramTypeMap);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        logger.info("Model:{}", obj);

                        this.createHlhtZqgzxxQtzqtys(obj);
                        //插入日志
                        mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                                Long.parseLong(Constants.WN_ZQGZXX_QTZQTYS_SOURCE_TYPE),
                                Long.parseLong(obj.getYjlxh()), obj.getBlmc(), obj.getSyxh() + "",
                                obj.getFssj(),
                                obj.getPatid(), obj.getZyh(), obj.getHzxm(), obj.getXbmc(), obj.getXbdm(),
                                obj.getKsmc(), obj.getKsdm(), obj.getBqmc(), obj.getBqdm(), obj.getSfzhm(), PercentUtil.getPercent(Long.parseLong(Constants.WN_ZQGZXX_QTZQTYS_SOURCE_TYPE), obj, 1),
                                PercentUtil.getPercent(Long.parseLong(Constants.WN_ZQGZXX_QTZQTYS_SOURCE_TYPE), obj, 0)));
                        real_count++;

                    }

                }

        }catch (Exception e){
            e.printStackTrace();
        }

        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_ZQGZXX_QTZQTYS_SOURCE_TYPE),t);

        return null;
    }


}