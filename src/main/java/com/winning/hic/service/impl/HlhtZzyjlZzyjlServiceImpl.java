package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.HicHelper;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZzyjlZzyjlDao;
import com.winning.hic.dao.data.HlhtZzyjlZzyjlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZzyjlZzyjlService;
import com.winning.hic.service.MbzDataSetService;
import org.dom4j.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;


/**
* @author HLHT
* @title HLHT_ZZYJL_ZZYJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-35-31 16:35:09
*/
@Service
public class HlhtZzyjlZzyjlServiceImpl implements  HlhtZzyjlZzyjlService {

    @Autowired
    private HlhtZzyjlZzyjlDao HlhtZzyjlZzyjlDao;

    @Autowired
    private MbzDataSetService mbzDataSetService;

    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;


    public int createHlhtZzyjlZzyjl(HlhtZzyjlZzyjl HlhtZzyjlZzyjl){
        return this.HlhtZzyjlZzyjlDao.insertHlhtZzyjlZzyjl(HlhtZzyjlZzyjl);
    }

    public int modifyHlhtZzyjlZzyjl(HlhtZzyjlZzyjl HlhtZzyjlZzyjl){
        return this.HlhtZzyjlZzyjlDao.updateHlhtZzyjlZzyjl(HlhtZzyjlZzyjl);
    }

    public int removeHlhtZzyjlZzyjl(HlhtZzyjlZzyjl HlhtZzyjlZzyjl){
        return this.HlhtZzyjlZzyjlDao.deleteHlhtZzyjlZzyjl(HlhtZzyjlZzyjl);
    }

    public HlhtZzyjlZzyjl getHlhtZzyjlZzyjl(HlhtZzyjlZzyjl HlhtZzyjlZzyjl){
        return this.HlhtZzyjlZzyjlDao.selectHlhtZzyjlZzyjl(HlhtZzyjlZzyjl);
    }

    public int getHlhtZzyjlZzyjlCount(HlhtZzyjlZzyjl HlhtZzyjlZzyjl){
        return (Integer)this.HlhtZzyjlZzyjlDao.selectHlhtZzyjlZzyjlCount(HlhtZzyjlZzyjl);
    }

    public List<HlhtZzyjlZzyjl> getHlhtZzyjlZzyjlList(HlhtZzyjlZzyjl HlhtZzyjlZzyjl){
        return this.HlhtZzyjlZzyjlDao.selectHlhtZzyjlZzyjlList(HlhtZzyjlZzyjl);
    }

    public List<HlhtZzyjlZzyjl> getHlhtZzyjlZzyjlPageList(HlhtZzyjlZzyjl HlhtZzyjlZzyjl){
        return this.HlhtZzyjlZzyjlDao.selectHlhtZzyjlZzyjlPageList(HlhtZzyjlZzyjl);
    }

    private HlhtZzyjlZzyjl getInitialHlhtZzyjlZzyjl(HlhtZzyjlZzyjl entity) {
        return this.HlhtZzyjlZzyjlDao.selectInitialHlhtZzyjlZzyjl(entity);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZzyjlZzyjl() {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZZYJL_ZZYJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZZYJL_ZZYJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = mbzDataSetService.getMbzDataSetList(mbzDataSet);
        //1.获取对应的首次病程的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZZYJL_ZZYJL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);

        try{
            //获取首次病程的对象集合
            Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZzyjlZzyjl.class);
            for(MbzDataListSet dataListSet :dataListSets){
                //2.根据首次病程去找到对应的病人病历
                EmrQtbljlk qtbljlk = new EmrQtbljlk();
                qtbljlk.setBldm(dataListSet.getModelCode());
                List<EmrQtbljlk> qtbljlkList = emrQtbljlkDao.selectEmrQtbljlkList(qtbljlk);

                if(qtbljlkList != null){
                    for(EmrQtbljlk emrQtbljlk:qtbljlkList){
                        HlhtZzyjlZzyjl scbcjl = new HlhtZzyjlZzyjl();
                        scbcjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        scbcjl = this.getHlhtZzyjlZzyjl(scbcjl);

                        if(scbcjl != null ){
                            //初始化数据
                            HlhtZzyjlZzyjl oldRcyjl  = new HlhtZzyjlZzyjl();
                            oldRcyjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                            this.removeHlhtZzyjlZzyjl(oldRcyjl);
                        }
                        HlhtZzyjlZzyjl entity = new HlhtZzyjlZzyjl();
                        entity.getMap().put("QTBLJLXH",emrQtbljlk.getQtbljlxh());
                        entity = this.getInitialHlhtZzyjlZzyjl(entity);
                        Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                        try {
                            entity = (HlhtZzyjlZzyjl) HicHelper.initModelValue(mbzDataSetList, document, entity, paramTypeMap);
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                        this.createHlhtZzyjlZzyjl(entity);

                    }
                }

            }


        }catch (Exception e){
            e.printStackTrace();
        }



        return mbzDataChecks;
    }


}