package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.HicHelper;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZybcjlHzjlDao;
import com.winning.hic.dao.data.HlhtZybcjlHzjlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZybcjlHzjlService;
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
* @title HLHT_ZYBCJL_HZJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-33-31 16:33:23
*/
@Service
public class HlhtZybcjlHzjlServiceImpl implements  HlhtZybcjlHzjlService {

    @Autowired
    private HlhtZybcjlHzjlDao hlhtZybcjlHzjlDao;

    @Autowired
    private MbzDataSetService mbzDataSetService;

    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    @Autowired
    private MbzDataCheckService mbzDataCheckService;



    public int createHlhtZybcjlHzjl(HlhtZybcjlHzjl hlhtZybcjlHzjl){
        return this.hlhtZybcjlHzjlDao.insertHlhtZybcjlHzjl(hlhtZybcjlHzjl);
    }

    public int modifyHlhtZybcjlHzjl(HlhtZybcjlHzjl hlhtZybcjlHzjl){
        return this.hlhtZybcjlHzjlDao.updateHlhtZybcjlHzjl(hlhtZybcjlHzjl);
    }

    public int removeHlhtZybcjlHzjl(HlhtZybcjlHzjl hlhtZybcjlHzjl){
        return this.hlhtZybcjlHzjlDao.deleteHlhtZybcjlHzjl(hlhtZybcjlHzjl);
    }

    public HlhtZybcjlHzjl getHlhtZybcjlHzjl(HlhtZybcjlHzjl hlhtZybcjlHzjl){
        return this.hlhtZybcjlHzjlDao.selectHlhtZybcjlHzjl(hlhtZybcjlHzjl);
    }

    public int getHlhtZybcjlHzjlCount(HlhtZybcjlHzjl hlhtZybcjlHzjl){
        return (Integer)this.hlhtZybcjlHzjlDao.selectHlhtZybcjlHzjlCount(hlhtZybcjlHzjl);
    }

    public List<HlhtZybcjlHzjl> getHlhtZybcjlHzjlList(HlhtZybcjlHzjl hlhtZybcjlHzjl){
        return this.hlhtZybcjlHzjlDao.selectHlhtZybcjlHzjlList(hlhtZybcjlHzjl);
    }

    public List<HlhtZybcjlHzjl> getHlhtZybcjlHzjlPageList(HlhtZybcjlHzjl hlhtZybcjlHzjl){
        return this.hlhtZybcjlHzjlDao.selectHlhtZybcjlHzjlPageList(hlhtZybcjlHzjl);
    }

    private HlhtZybcjlHzjl getInitialHlhtZybcjlHzjl(HlhtZybcjlHzjl entity) {
        return this.hlhtZybcjlHzjlDao.selectInitialHlhtZybcjlHzjl(entity);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZybcjlHzjl(MbzDataCheck t) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量
        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZYBCJL_HZJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZYBCJL_HZJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = mbzDataSetService.getMbzDataSetList(mbzDataSet);
        //1.获取对应的首次病程的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZYBCJL_HZJL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);

        try{
            //获取首次病程的对象集合
            Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlHzjl.class);
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
                        HlhtZybcjlHzjl scbcjl = new HlhtZybcjlHzjl();
                        scbcjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        scbcjl = this.getHlhtZybcjlHzjl(scbcjl);

                        if(scbcjl != null ){
                            //初始化数据
                            HlhtZybcjlHzjl oldRcyjl  = new HlhtZybcjlHzjl();
                            oldRcyjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                            this.removeHlhtZybcjlHzjl(oldRcyjl);
                        }
                        HlhtZybcjlHzjl entity = new HlhtZybcjlHzjl();
                        entity.getMap().put("QTBLJLXH",emrQtbljlk.getQtbljlxh());
                        entity = this.getInitialHlhtZybcjlHzjl(entity);
                        Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                        try {
                            entity = (HlhtZybcjlHzjl) HicHelper.initModelValue(mbzDataSetList, document, entity, paramTypeMap);
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                        this.createHlhtZybcjlHzjl(entity);
                        real_count++;
                    }
                }

            }


        }catch (Exception e){
            e.printStackTrace();
        }

        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_ZYBCJL_HZJL_SOURCE_TYPE));

        return null;
    }


}