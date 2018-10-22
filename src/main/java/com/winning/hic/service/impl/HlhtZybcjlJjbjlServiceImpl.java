package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZybcjlJjbjlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZybcjlJjbjlService;
import com.winning.hic.service.MbzDataCheckService;
import com.winning.hic.service.MbzDataSetService;
import org.dom4j.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
* @author HLHT
* @title HLHT_ZYBCJL_JJBJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-33-31 16:33:41
*/
@Service
public class HlhtZybcjlJjbjlServiceImpl implements  HlhtZybcjlJjbjlService {
    private final Logger logger = LoggerFactory.getLogger(HlhtZybcjlJjbjlServiceImpl.class);

    @Autowired
    private HlhtZybcjlJjbjlDao hlhtZybcjlJjbjlDao;

    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;
    @Autowired
    private MbzDataSetService mbzDataSetService;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    @Autowired
    private MbzDataCheckService mbzDataCheckService;

    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;

    public int createHlhtZybcjlJjbjl(HlhtZybcjlJjbjl hlhtZybcjlJjbjl){
        return this.hlhtZybcjlJjbjlDao.insertHlhtZybcjlJjbjl(hlhtZybcjlJjbjl);
    }

    public int modifyHlhtZybcjlJjbjl(HlhtZybcjlJjbjl hlhtZybcjlJjbjl){
        return this.hlhtZybcjlJjbjlDao.updateHlhtZybcjlJjbjl(hlhtZybcjlJjbjl);
    }

    public int removeHlhtZybcjlJjbjl(HlhtZybcjlJjbjl hlhtZybcjlJjbjl){
        return this.hlhtZybcjlJjbjlDao.deleteHlhtZybcjlJjbjl(hlhtZybcjlJjbjl);
    }

    public HlhtZybcjlJjbjl getHlhtZybcjlJjbjl(HlhtZybcjlJjbjl hlhtZybcjlJjbjl){
        return this.hlhtZybcjlJjbjlDao.selectHlhtZybcjlJjbjl(hlhtZybcjlJjbjl);
    }

    public int getHlhtZybcjlJjbjlCount(HlhtZybcjlJjbjl hlhtZybcjlJjbjl){
        return (Integer)this.hlhtZybcjlJjbjlDao.selectHlhtZybcjlJjbjlCount(hlhtZybcjlJjbjl);
    }

    public List<HlhtZybcjlJjbjl> getHlhtZybcjlJjbjlList(HlhtZybcjlJjbjl hlhtZybcjlJjbjl){
        return this.hlhtZybcjlJjbjlDao.selectHlhtZybcjlJjbjlList(hlhtZybcjlJjbjl);
    }

    public List<HlhtZybcjlJjbjl> getHlhtZybcjlJjbjlPageList(HlhtZybcjlJjbjl hlhtZybcjlJjbjl){
        return this.hlhtZybcjlJjbjlDao.selectHlhtZybcjlJjbjlPageList(hlhtZybcjlJjbjl);
    }

    public HlhtZybcjlJjbjl getInitialHlhtZybcjlJjbjl(HlhtZybcjlJjbjl hlhtZybcjlJjbjl){
        return this.hlhtZybcjlJjbjlDao.selectInitialHlhtZybcjlJjbjl(hlhtZybcjlJjbjl);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZybcjlJjbjl(MbzDataCheck t) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量
        //数据抽取
        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZYBCJL_JJBJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZYBCJL_JJBJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = mbzDataSetService.getMbzDataSetList(mbzDataSet);
        //1.获取对应的首次病程的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZYBCJL_JJBJL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        try{

            Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlJjbjl.class);

            //获取首次病程的对象集合
            HlhtZybcjlJjbjl oneJjbjl = new HlhtZybcjlJjbjl();
            oneJjbjl.getMap().put("sourceType", Constants.WN_ZYBCJL_JJBJL_SOURCE_TYPE);
            oneJjbjl.getMap().put("startDate",t.getMap().get("startDate"));
            oneJjbjl.getMap().put("endDate",t.getMap().get("endDate"));
            oneJjbjl.getMap().put("syxh",t.getMap().get("syxh"));
            List<HlhtZybcjlJjbjl> hlhtZybcjlJjbjls = this.hlhtZybcjlJjbjlDao.selectHlhtZybcjlJjbjlListByProc(oneJjbjl);
                emr_count = emr_count+hlhtZybcjlJjbjls.size();
                if(hlhtZybcjlJjbjls != null){
                    for (HlhtZybcjlJjbjl obj : hlhtZybcjlJjbjls) {
                        //清库
                        HlhtZybcjlJjbjl temp = new HlhtZybcjlJjbjl();
                        temp.setYjlxh(obj.getYjlxh());
                        this.removeHlhtZybcjlJjbjl(temp);
                        //清除日志
                        Map<String,Object> param = new HashMap<>();
                        param.put("SOURCE_ID",obj.getYjlxh());
                        param.put("SOURCE_TYPE",Constants.WN_ZYBCJL_JJBJL_SOURCE_TYPE);
                        mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                        //3.xml文件解析 获取病历信息
                        Document document = null;
                        if(!StringUtil.isEmptyOrNull(obj.getBlnr())){
                            try {
                                document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(obj.getBlnr()));
                                obj = (HlhtZybcjlJjbjl) HicHelper.initModelValue(mbzDataSetList, document, obj, paramTypeMap);
                                logger.info("Model:{}", obj);

                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                        this.createHlhtZybcjlJjbjl(obj);
                        mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                                Long.parseLong(Constants.WN_ZYBCJL_JJBJL_SOURCE_TYPE),
                                Long.parseLong(obj.getYjlxh()),obj.getBlmc(),obj.getSyxh(),obj.getJbsj(),
                                obj.getPatid(),obj.getZyh(),obj.getHzxm(),obj.getXbmc(),obj.getXbdm(),
                                "NA","NA", "NA","NA", obj.getSfzhm(),
                                PercentUtil.getPercent(Long.parseLong(Constants.WN_ZYBCJL_JJBJL_SOURCE_TYPE), obj, 1),
                                PercentUtil.getPercent(Long.parseLong(Constants.WN_ZYBCJL_JJBJL_SOURCE_TYPE), obj, 0)));
                        real_count++;

                    }
                }
            //1.病历总数 2.抽取的病历数量 3.子集类型
            this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_ZYBCJL_JJBJL_SOURCE_TYPE),t);

        }catch (Exception e){
            e.printStackTrace();
        }

        return mbzDataChecks;
    }
}