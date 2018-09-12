package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZlczjlYbssjlDao;
import com.winning.hic.dao.data.HlhtZlczjlYbssjlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZlczjlYbssjlService;
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
* @title HLHT_ZLCZJL_YBSSJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-31-31 16:31:59
*/
@Service
public class HlhtZlczjlYbssjlServiceImpl implements  HlhtZlczjlYbssjlService {

    @Autowired
    private HlhtZlczjlYbssjlDao hlhtZlczjlYbssjlDao;

    @Autowired
    private MbzDataSetService mbzDataSetService;

    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    @Autowired
    private MbzDataCheckService mbzDataCheckService;

    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;

    public int createHlhtZlczjlYbssjl(HlhtZlczjlYbssjl hlhtZlczjlYbssjl){
        return this.hlhtZlczjlYbssjlDao.insertHlhtZlczjlYbssjl(hlhtZlczjlYbssjl);
    }

    public int modifyHlhtZlczjlYbssjl(HlhtZlczjlYbssjl hlhtZlczjlYbssjl){
        return this.hlhtZlczjlYbssjlDao.updateHlhtZlczjlYbssjl(hlhtZlczjlYbssjl);
    }

    public int removeHlhtZlczjlYbssjl(HlhtZlczjlYbssjl hlhtZlczjlYbssjl){
        return this.hlhtZlczjlYbssjlDao.deleteHlhtZlczjlYbssjl(hlhtZlczjlYbssjl);
    }

    public HlhtZlczjlYbssjl getHlhtZlczjlYbssjl(HlhtZlczjlYbssjl hlhtZlczjlYbssjl){
        return this.hlhtZlczjlYbssjlDao.selectHlhtZlczjlYbssjl(hlhtZlczjlYbssjl);
    }

    public int getHlhtZlczjlYbssjlCount(HlhtZlczjlYbssjl hlhtZlczjlYbssjl){
        return (Integer)this.hlhtZlczjlYbssjlDao.selectHlhtZlczjlYbssjlCount(hlhtZlczjlYbssjl);
    }

    public List<HlhtZlczjlYbssjl> getHlhtZlczjlYbssjlList(HlhtZlczjlYbssjl hlhtZlczjlYbssjl){
        return this.hlhtZlczjlYbssjlDao.selectHlhtZlczjlYbssjlList(hlhtZlczjlYbssjl);
    }

    public List<HlhtZlczjlYbssjl> getHlhtZlczjlYbssjlPageList(HlhtZlczjlYbssjl hlhtZlczjlYbssjl){
        return this.hlhtZlczjlYbssjlDao.selectHlhtZlczjlYbssjlPageList(hlhtZlczjlYbssjl);
    }

    private HlhtZlczjlYbssjl getInitialHlhtZlczjlYbssjl(HlhtZlczjlYbssjl entity) {
        return this.hlhtZlczjlYbssjlDao.selectInitialHlhtZlczjlYbssjl(entity);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZlczjlYbssjl(MbzDataCheck t) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量
        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZLCZJL_YBSSJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZLCZJL_YBSSJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = mbzDataSetService.getMbzDataSetList(mbzDataSet);
        //1.获取对应的首次病程的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZLCZJL_YBSSJL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);

        try{
            //获取首次病程的对象集合
            Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZlczjlYbssjl.class);
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
                        HlhtZlczjlYbssjl scbcjl = new HlhtZlczjlYbssjl();
                        scbcjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        scbcjl = this.getHlhtZlczjlYbssjl(scbcjl);

                        if(scbcjl != null ){
                            //初始化数据
                            HlhtZlczjlYbssjl oldRcyjl  = new HlhtZlczjlYbssjl();
                            oldRcyjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                            this.removeHlhtZlczjlYbssjl(oldRcyjl);
                            //清除日志
                            Map<String,Object> param = new HashMap<>();
                            param.put("SOURCE_ID",emrQtbljlk.getQtbljlxh());
                            param.put("SOURCE_TYPE",Constants.WN_ZLCZJL_YBSSJL_SOURCE_TYPE);
                            mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                        }
                        HlhtZlczjlYbssjl entity = new HlhtZlczjlYbssjl();
                        entity.getMap().put("QTBLJLXH",emrQtbljlk.getQtbljlxh());
                        entity = this.getInitialHlhtZlczjlYbssjl(entity);
                        Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                        try {
                            entity = (HlhtZlczjlYbssjl) HicHelper.initModelValue(mbzDataSetList, document, entity, paramTypeMap);
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                        //插入日志
                        mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                                Long.parseLong(Constants.WN_ZLCZJL_YBSSJL_SOURCE_TYPE),
                                emrQtbljlk.getQtbljlxh(),emrQtbljlk.getBlmc(),emrQtbljlk.getSyxh()+"",
                                new Timestamp(DateUtil.parse(emrQtbljlk.getFssj(),DateUtil.PATTERN_19).getTime()),
                                entity.getPatid(),entity.getZyh(),entity.getHzxm(),entity.getXbmc(),entity.getXbdm(),
                                entity.getKsmc(),entity.getKsdm(), entity.getBqmc(),entity.getBqdm(), entity.getSfzhm()));
                        this.createHlhtZlczjlYbssjl(entity);
                        real_count++;

                    }
                }

            }


        }catch (Exception e){
            e.printStackTrace();
        }
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_ZLCZJL_YBSSJL_SOURCE_TYPE));

        return mbzDataChecks;
    }


}