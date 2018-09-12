package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.*;
import com.winning.hic.dao.data.HlhtMjzblMjzblDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtMjzblMjzblService;
import com.winning.hic.service.MbzDataCheckService;
import com.winning.hic.service.MbzDataSetService;
import org.dom4j.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
* @author HLHT
* @title HLHT_MJZBL_MJZBL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-29-31 16:29:44
*/
@Service
public class HlhtMjzblMjzblServiceImpl implements  HlhtMjzblMjzblService {

    @Autowired
    private HlhtMjzblMjzblDao hlhtMjzblMjzblDao;

    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    @Autowired
    private MbzDataSetService mbzDataSetService;
    @Autowired
    private MbzDataCheckService mbzDataCheckService;

    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;

    public int createHlhtMjzblMjzbl(HlhtMjzblMjzbl hlhtMjzblMjzbl){
        return this.hlhtMjzblMjzblDao.insertHlhtMjzblMjzbl(hlhtMjzblMjzbl);
    }

    public int modifyHlhtMjzblMjzbl(HlhtMjzblMjzbl hlhtMjzblMjzbl){
        return this.hlhtMjzblMjzblDao.updateHlhtMjzblMjzbl(hlhtMjzblMjzbl);
    }

    public int removeHlhtMjzblMjzbl(HlhtMjzblMjzbl hlhtMjzblMjzbl){
        return this.hlhtMjzblMjzblDao.deleteHlhtMjzblMjzbl(hlhtMjzblMjzbl);
    }

    public HlhtMjzblMjzbl getHlhtMjzblMjzbl(HlhtMjzblMjzbl hlhtMjzblMjzbl){
        return this.hlhtMjzblMjzblDao.selectHlhtMjzblMjzbl(hlhtMjzblMjzbl);
    }

    public int getHlhtMjzblMjzblCount(HlhtMjzblMjzbl hlhtMjzblMjzbl){
        return (Integer)this.hlhtMjzblMjzblDao.selectHlhtMjzblMjzblCount(hlhtMjzblMjzbl);
    }

    public List<HlhtMjzblMjzbl> getHlhtMjzblMjzblList(HlhtMjzblMjzbl hlhtMjzblMjzbl){
        return this.hlhtMjzblMjzblDao.selectHlhtMjzblMjzblList(hlhtMjzblMjzbl);
    }

    public List<HlhtMjzblMjzbl> getHlhtMjzblMjzblPageList(HlhtMjzblMjzbl hlhtMjzblMjzbl){
        return this.hlhtMjzblMjzblDao.selectHlhtMjzblMjzblPageList(hlhtMjzblMjzbl);
    }

    private HlhtMjzblMjzbl getInitialHlhtMjzblMjzbl(HlhtMjzblMjzbl entity) {
        return this.hlhtMjzblMjzblDao.selectInitialHlhtMjzblMjzbl(entity);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtMjzblMjzbl(MbzDataCheck t) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_MJZBL_MJZBL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_MJZBL_MJZBL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = mbzDataSetService.getMbzDataSetList(mbzDataSet);
        //1.获取对应的首次病程的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_MJZBL_MJZBL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        try{
            //获取首次病程的对象集合
            Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtMjzblMjzbl.class);
            for(MbzDataListSet dataListSet :dataListSets){
                //2.根据首次病程去找到对应的病人病历
                EmrQtbljlk qtbljlk = new EmrQtbljlk();
                qtbljlk.setBldm(dataListSet.getModelCode());
                qtbljlk.setYxjl(1);
                qtbljlk.getMap().put("startDate",t.getMap().get("startDate"));
                qtbljlk.getMap().put("endDate",t.getMap().get("endDate"));
                List<EmrQtbljlk> qtbljlkList = emrQtbljlkDao.selectEmrQtbljlkList(qtbljlk);
                emr_count = emr_count+qtbljlkList.size();

                if(qtbljlkList != null){
                    for(EmrQtbljlk emrQtbljlk:qtbljlkList){
                        HlhtMjzblMjzbl scbcjl = new HlhtMjzblMjzbl();
                        scbcjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        scbcjl = this.getHlhtMjzblMjzbl(scbcjl);

                        if(scbcjl != null ){
                            //初始化数据
                            HlhtMjzblMjzbl oldRcyjl  = new HlhtMjzblMjzbl();
                            oldRcyjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                            this.removeHlhtMjzblMjzbl(oldRcyjl);
                            //清除日志
                            Map<String,Object> param = new HashMap<>();
                            param.put("SOURCE_ID",emrQtbljlk.getQtbljlxh());
                            param.put("SOURCE_TYPE",Constants.WN_MJZBL_MJZBL_SOURCE_TYPE);
                            mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                        }
                        HlhtMjzblMjzbl entity = new HlhtMjzblMjzbl();
                        entity.getMap().put("QTBLJLXH",emrQtbljlk.getQtbljlxh());
                        entity = this.getInitialHlhtMjzblMjzbl(entity);
                        System.out.println("EMR="+Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                        Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                        try {
                            entity = (HlhtMjzblMjzbl) HicHelper.initModelValue(mbzDataSetList, document, entity, paramTypeMap);
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                        //插入日志
                        mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                                Long.parseLong(Constants.WN_MJZBL_MJZBL_SOURCE_TYPE),
                                emrQtbljlk.getQtbljlxh(),emrQtbljlk.getBlmc(),emrQtbljlk.getSyxh()+"",
                                new Timestamp(DateUtil.parse(emrQtbljlk.getFssj(),DateUtil.PATTERN_19).getTime()),
                                entity.getPatid(),entity.getZyh(),entity.getHzxm(),entity.getXbmc(),entity.getXbdm(),
                                entity.getKsmc(),entity.getKsdm(), "NA","NA", entity.getSfzhm()));
                        this.createHlhtMjzblMjzbl(entity);
                        real_count++;

                    }
                }

            }

            //1.病历总数 2.抽取的病历数量 3.子集类型
            this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_MJZBL_MJZBL_SOURCE_TYPE));
        }catch (Exception e){
            e.printStackTrace();
        }

        return mbzDataChecks;
    }


}