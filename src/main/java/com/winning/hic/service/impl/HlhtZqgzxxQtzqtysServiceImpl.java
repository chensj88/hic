package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.HicHelper;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZqgzxxQtzqtysDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZqgzxxQtzqtysService;
import com.winning.hic.service.MbzDataCheckService;
import com.winning.hic.service.MbzDataSetService;
import org.dom4j.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
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

    @Autowired
    private HlhtZqgzxxQtzqtysDao hlhtZqgzxxQtzqtysDao;

    @Autowired
    private MbzDataSetService mbzDataSetService;

    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    @Autowired
    private MbzDataCheckService mbzDataCheckService;


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
                        HlhtZqgzxxQtzqtys scbcjl = new HlhtZqgzxxQtzqtys();
                        scbcjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        scbcjl = this.getHlhtZqgzxxQtzqtys(scbcjl);

                        if(scbcjl != null ){
                            //初始化数据
                            HlhtZqgzxxQtzqtys oldRcyjl  = new HlhtZqgzxxQtzqtys();
                            oldRcyjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                            this.removeHlhtZqgzxxQtzqtys(oldRcyjl);
                        }
                        HlhtZqgzxxQtzqtys entity = new HlhtZqgzxxQtzqtys();
                        entity.getMap().put("QTBLJLXH",emrQtbljlk.getQtbljlxh());
                        entity = this.getInitialHlhtZqgzxxQtzqtys(entity);
                        Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                        try {
                            entity = (HlhtZqgzxxQtzqtys) HicHelper.initModelValue(mbzDataSetList, document, entity, paramTypeMap);
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                        this.createHlhtZqgzxxQtzqtys(entity);
                        real_count++;
                    }
                }

            }


        }catch (Exception e){
            e.printStackTrace();
        }

        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_ZQGZXX_QTZQTYS_SOURCE_TYPE));


        return null;
    }


}