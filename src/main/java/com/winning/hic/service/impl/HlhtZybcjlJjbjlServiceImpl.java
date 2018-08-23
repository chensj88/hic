package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZybcjlJjbjlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZybcjlJjbjlService;
import com.winning.hic.service.MbzDataCheckService;
import com.winning.hic.service.MbzDataSetService;
import org.dom4j.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

            for(MbzDataListSet dataListSet :dataListSets) {

                //2.根据首次病程去找到对应的病人病历
                EmrQtbljlk qtbljlk = new EmrQtbljlk();
                qtbljlk.setBldm(dataListSet.getModelCode());
                qtbljlk.getMap().put("startDate",t.getMap().get("startDate"));
                qtbljlk.getMap().put("endDate",t.getMap().get("endDate"));
                List<EmrQtbljlk> qtbljlkList = emrQtbljlkDao.selectEmrQtbljlkList(qtbljlk);
                emr_count = emr_count+qtbljlkList.size();
                if(qtbljlkList != null){
                    for (EmrQtbljlk emrQtbljlk : qtbljlkList) {
                        HlhtZybcjlJjbjl jdxj = new HlhtZybcjlJjbjl();
                        jdxj.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        jdxj =  this.getHlhtZybcjlJjbjl(jdxj);
                        if (jdxj != null) {
                            //初始化数据
                            HlhtZybcjlJjbjl oldRcyjl = new HlhtZybcjlJjbjl();
                            oldRcyjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                            this.removeHlhtZybcjlJjbjl(oldRcyjl);
                        }
                        HlhtZybcjlJjbjl entity = new HlhtZybcjlJjbjl();
                        entity.getMap().put("QTBLJLXH", emrQtbljlk.getQtbljlxh());
                        entity = this.getInitialHlhtZybcjlJjbjl(entity);
                        Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                        try {
                            entity = (HlhtZybcjlJjbjl) HicHelper.initModelValue(mbzDataSetList, document, entity, paramTypeMap);
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                        this.createHlhtZybcjlJjbjl(entity);
                        real_count++;

                    }
                }

            }
            //1.病历总数 2.抽取的病历数量 3.子集类型
            this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_ZYBCJL_JJBJL_SOURCE_TYPE));

        }catch (Exception e){
            e.printStackTrace();
        }

        return mbzDataChecks;
    }
}