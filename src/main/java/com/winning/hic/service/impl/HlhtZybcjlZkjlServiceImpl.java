package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZybcjlZkjlDao;
import com.winning.hic.dao.data.HlhtZybcjlZkjlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZybcjlZkjlService;
import com.winning.hic.service.MbzDataCheckService;
import com.winning.hic.service.MbzDataSetService;
import org.dom4j.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
* @author HLHT
* @title HLHT_ZYBCJL_ZKJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-35-31 16:35:02
*/
@Service
public class HlhtZybcjlZkjlServiceImpl implements  HlhtZybcjlZkjlService {

    @Autowired
    private HlhtZybcjlZkjlDao hlhtZybcjlZkjlDao;

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

    public int createHlhtZybcjlZkjl(HlhtZybcjlZkjl hlhtZybcjlZkjl){
        return this.hlhtZybcjlZkjlDao.insertHlhtZybcjlZkjl(hlhtZybcjlZkjl);
    }

    public int modifyHlhtZybcjlZkjl(HlhtZybcjlZkjl hlhtZybcjlZkjl){
        return this.hlhtZybcjlZkjlDao.updateHlhtZybcjlZkjl(hlhtZybcjlZkjl);
    }

    public int removeHlhtZybcjlZkjl(HlhtZybcjlZkjl hlhtZybcjlZkjl){
        return this.hlhtZybcjlZkjlDao.deleteHlhtZybcjlZkjl(hlhtZybcjlZkjl);
    }

    public HlhtZybcjlZkjl getHlhtZybcjlZkjl(HlhtZybcjlZkjl hlhtZybcjlZkjl){
        return this.hlhtZybcjlZkjlDao.selectHlhtZybcjlZkjl(hlhtZybcjlZkjl);
    }

    public int getHlhtZybcjlZkjlCount(HlhtZybcjlZkjl hlhtZybcjlZkjl){
        return (Integer)this.hlhtZybcjlZkjlDao.selectHlhtZybcjlZkjlCount(hlhtZybcjlZkjl);
    }

    public List<HlhtZybcjlZkjl> getHlhtZybcjlZkjlList(HlhtZybcjlZkjl hlhtZybcjlZkjl){
        return this.hlhtZybcjlZkjlDao.selectHlhtZybcjlZkjlList(hlhtZybcjlZkjl);
    }

    public List<HlhtZybcjlZkjl> getHlhtZybcjlZkjlPageList(HlhtZybcjlZkjl hlhtZybcjlZkjl){
        return this.hlhtZybcjlZkjlDao.selectHlhtZybcjlZkjlPageList(hlhtZybcjlZkjl);
    }

    private HlhtZybcjlZkjl getInitialHlhtZybcjlZkjl(HlhtZybcjlZkjl entity) {
        return this.hlhtZybcjlZkjlDao.selectInitialHlhtZybcjlZkjl(entity);
    }


    @Override
    public List<MbzDataCheck> interfaceHlhtZybcjlZkjl(MbzDataCheck t) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZYBCJL_ZKJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZYBCJL_ZKJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = mbzDataSetService.getMbzDataSetList(mbzDataSet);
        List<MbzDataSet> rDataSetList = new ArrayList<>();
        String[] rCode = {"zrrq", "zrksdm", "zrks", "zrysbm", "zrysqm", "zrzljh"};
        List<MbzDataSet> cDataSetList = new ArrayList<>();
        for (MbzDataSet dataSet : mbzDataSetList) {
            //修正诊断字段配置集合
            for (int i = 0; i < rCode.length; i++) {
                if (rCode[i].equals(dataSet.getPyCode())) {
                    rDataSetList.add(dataSet);
                }else{
                    cDataSetList.add(dataSet);
                }
            }
        }

        //1.获取对应的首次病程的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZYBCJL_ZKJL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList2(mbzDataListSet);

        try{
            //获取首次病程的对象集合
            Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlZkjl.class);
            //for(MbzDataListSet dataListSet :dataListSets){
                //2.根据首次病程去找到对应的病人病历
                HlhtZybcjlZkjl oneZkjl = new HlhtZybcjlZkjl();
                oneZkjl.getMap().put("sourceType", Constants.WN_ZYBCJL_ZKJL_SOURCE_TYPE);
                oneZkjl.getMap().put("startDate",t.getMap().get("startDate"));
                oneZkjl.getMap().put("endDate",t.getMap().get("endDate"));
                oneZkjl.getMap().put("syxh",t.getMap().get("syxh"));
                List<HlhtZybcjlZkjl> hlhtZybcjlZkjls = this.hlhtZybcjlZkjlDao.selectHlhtZybcjlZkjlListByProc(oneZkjl);

                if(hlhtZybcjlZkjls != null){
                    for(HlhtZybcjlZkjl obj:hlhtZybcjlZkjls){
                        if(obj.getMxfldm().equals("B-8405")){ //转出记录
                            HlhtZybcjlZkjl zkjl = new HlhtZybcjlZkjl();
                            zkjl.setYjlxh(obj.getYjlxh());
                            zkjl = this.getHlhtZybcjlZkjl(zkjl);

                            if(zkjl != null ){
                                //初始化数据
                                HlhtZybcjlZkjl oldRcyjl  = new HlhtZybcjlZkjl();
                                oldRcyjl.setYjlxh(obj.getYjlxh());
                                this.removeHlhtZybcjlZkjl(oldRcyjl);
                                //清除日志
                                Map<String,Object> param = new HashMap<>();
                                param.put("SOURCE_ID",obj.getYjlxh());
                                param.put("SOURCE_TYPE",Constants.WN_ZYBCJL_ZKJL_SOURCE_TYPE);
                                mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                            }

                            Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(obj.getBlnr()));
                            try {
                                obj = (HlhtZybcjlZkjl) HicHelper.initModelValue(cDataSetList, document, obj, paramTypeMap);
                                obj.setZkjllx("1");
                                obj.setZkjllxmc("转入记录");
                            } catch (ParseException e) {
                                e.printStackTrace();
                            }
                            this.createHlhtZybcjlZkjl(obj);
                            //插入日志
                            mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                                    Long.parseLong(Constants.WN_ZYBCJL_ZKJL_SOURCE_TYPE),
                                    Long.parseLong(obj.getYjlxh()), obj.getBlmc(), obj.getSyxh() + "",
                                    obj.getFssj(),
                                    obj.getPatid(),obj.getZyh(),obj.getHzxm(),obj.getXbmc(),obj.getXbdm(),
                                    obj.getKsmc(),obj.getKsdm(), obj.getBqmc(),obj.getBqdm(), obj.getSfzhm(), PercentUtil.getPercent(Long.parseLong(Constants.WN_ZYBCJL_ZKJL_SOURCE_TYPE), obj, 1),
                                    PercentUtil.getPercent(Long.parseLong(Constants.WN_ZYBCJL_ZKJL_SOURCE_TYPE), obj, 0)));


                        }else{ //转入记录
                            //找出对应的转出记录，update它的值
                            EmrQtbljlk qt = new EmrQtbljlk();
                            qt.setCjsj( sdf.format(obj.getCjsj()));
                            qt.setSyxh(Integer.parseInt(obj.getSyxh()));
                            String yjlxh = emrQtbljlkDao.selectEmrQtbljlkId(qt);
                            HlhtZybcjlZkjl zkjl = new HlhtZybcjlZkjl();
                            zkjl.setYjlxh(yjlxh);
                            List<HlhtZybcjlZkjl> zkjls =this.getHlhtZybcjlZkjlList(zkjl);
                            System.out.println("奇葩=="+zkjls.size());
                            if(zkjls.size()>0){
                                zkjl = zkjls.get(0);
                                zkjl.setZrrq(null);
                                zkjl.setZrysbm(null);
                                zkjl.setZrysqm(null);
                                Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(obj.getBlnr()));

                                try {
                                    zkjl = (HlhtZybcjlZkjl) HicHelper.initModelValue(rDataSetList, document, zkjl, paramTypeMap);

                                } catch (ParseException e) {
                                    e.printStackTrace();
                                }
                                this.modifyHlhtZybcjlZkjl(zkjl);
                            }

                        }
                        real_count++;

                    }
                }

            //1.病历总数 2.抽取的病历数量 3.子集类型
            this.mbzDataCheckService.createMbzDataCheckNum(hlhtZybcjlZkjls.size(),real_count,Integer.parseInt(Constants.WN_ZYBCJL_ZKJL_SOURCE_TYPE),t);


        }catch (Exception e){
            e.printStackTrace();
        }

        return null;
    }


}