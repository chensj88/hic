package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.HicHelper;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZybcjlZkjlDao;
import com.winning.hic.dao.data.HlhtZybcjlZkjlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZybcjlZkjlService;
import com.winning.hic.service.MbzDataSetService;
import org.dom4j.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
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
    public List<MbzDataCheck> interfaceHlhtZybcjlZkjl() {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZYBCJL_ZKJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZYBCJL_ZKJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = mbzDataSetService.getMbzDataSetList(mbzDataSet);
        //1.获取对应的首次病程的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZYBCJL_ZKJL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);

        try{
            //获取首次病程的对象集合
            Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlZkjl.class);
            for(MbzDataListSet dataListSet :dataListSets){
                //2.根据首次病程去找到对应的病人病历
                EmrQtbljlk qtbljlk = new EmrQtbljlk();
                qtbljlk.setBldm(dataListSet.getModelCode());
                List<EmrQtbljlk> qtbljlkList = emrQtbljlkDao.selectEmrQtbljlkList(qtbljlk);

                if(qtbljlkList != null){
                    for(EmrQtbljlk emrQtbljlk:qtbljlkList){
                        HlhtZybcjlZkjl zkjl = new HlhtZybcjlZkjl();
                        zkjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        zkjl = this.getHlhtZybcjlZkjl(zkjl);

                        if(zkjl != null ){
                            //初始化数据
                            HlhtZybcjlZkjl oldRcyjl  = new HlhtZybcjlZkjl();
                            oldRcyjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                            this.removeHlhtZybcjlZkjl(oldRcyjl);
                        }
                        HlhtZybcjlZkjl entity = new HlhtZybcjlZkjl();
                        entity.getMap().put("QTBLJLXH",emrQtbljlk.getQtbljlxh());
                        entity = this.getInitialHlhtZybcjlZkjl(entity);
                        Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                        try {
                            entity = (HlhtZybcjlZkjl) HicHelper.initModelValue(mbzDataSetList, document, entity, paramTypeMap);
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                        this.createHlhtZybcjlZkjl(entity);

                    }
                }

            }


        }catch (Exception e){
            e.printStackTrace();
        }

        return null;
    }



}