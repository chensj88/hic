package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.HicHelper;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZybcjlSjyscfjlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZybcjlSjyscfjlService;
import com.winning.hic.service.MbzDataCheckService;
import org.dom4j.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
* @author HLHT
* @title HLHT_ZYBCJL_SJYSCFJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-34-31 16:34:17
*/
@Service
public class HlhtZybcjlSjyscfjlServiceImpl implements  HlhtZybcjlSjyscfjlService {

    private static final Logger logger = LoggerFactory.getLogger(HlhtZybcjlSjyscfjlServiceImpl.class);
    @Autowired
    private HlhtZybcjlSjyscfjlDao hlhtZybcjlSjyscfjlDao;
    @Autowired
    private CommonQueryDao commonQueryDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;
    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;
    @Autowired
    private MbzDataCheckService mbzDataCheckService;
    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;


    public int createHlhtZybcjlSjyscfjl(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl){
        return this.hlhtZybcjlSjyscfjlDao.insertHlhtZybcjlSjyscfjl(hlhtZybcjlSjyscfjl);
    }

    public int modifyHlhtZybcjlSjyscfjl(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl){
        return this.hlhtZybcjlSjyscfjlDao.updateHlhtZybcjlSjyscfjl(hlhtZybcjlSjyscfjl);
    }

    public int removeHlhtZybcjlSjyscfjl(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl){
        return this.hlhtZybcjlSjyscfjlDao.deleteHlhtZybcjlSjyscfjl(hlhtZybcjlSjyscfjl);
    }

    public HlhtZybcjlSjyscfjl getHlhtZybcjlSjyscfjl(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl){
        return this.hlhtZybcjlSjyscfjlDao.selectHlhtZybcjlSjyscfjl(hlhtZybcjlSjyscfjl);
    }

    public int getHlhtZybcjlSjyscfjlCount(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl){
        return (Integer)this.hlhtZybcjlSjyscfjlDao.selectHlhtZybcjlSjyscfjlCount(hlhtZybcjlSjyscfjl);
    }

    public List<HlhtZybcjlSjyscfjl> getHlhtZybcjlSjyscfjlList(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl){
        return this.hlhtZybcjlSjyscfjlDao.selectHlhtZybcjlSjyscfjlList(hlhtZybcjlSjyscfjl);
    }

    public List<HlhtZybcjlSjyscfjl> getHlhtZybcjlSjyscfjlPageList(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl){
        return this.hlhtZybcjlSjyscfjlDao.selectHlhtZybcjlSjyscfjlPageList(hlhtZybcjlSjyscfjl);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZybcjlSjyscfjl(MbzDataCheck entity) throws IOException, ParseException {
        List<MbzDataCheck> dataChecks = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量
        //配置接口表字段配置信息
        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZYBCJL_SJYSCFJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZYBCJL_SJYSCFJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = mbzDataSetDao.selectMbzDataSetList(mbzDataSet);

        mbzDataSet = new MbzDataSet();
        mbzDataSet.setPId(0L);
        mbzDataSet.setSourceType(Constants.WN_ZYBCJL_SJYSCFJL_SOURCE_TYPE);
        mbzDataSet = mbzDataSetDao.selectMbzDataSet(mbzDataSet);

        //配置并加载对应的出入院模板集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZYBCJL_SJYSCFJL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);

        //获取接口对象字段集合信息
        Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlSjyscfjl.class);


        String[] bcCode = {"bzlzms"};
        List<MbzDataSet> bzlzmsDataSetList = new ArrayList<>();
        for (MbzDataSet dataSet : mbzDataSetList) {
            for (int i = 0; i < bcCode.length; i++) {
                if (bcCode[i].equals(dataSet.getPyCode())) {
                    bzlzmsDataSetList.add(dataSet);
                }
            }
        }
        if(dataListSets != null && dataListSets.size() > 0){
            //获取模板集合，遍历
            for(MbzDataListSet dataListSet :dataListSets){
                //查询病历数据 数据来源
                EmrQtbljlk qtbljlk = new EmrQtbljlk();
                qtbljlk.setBldm(dataListSet.getModelCode());
                qtbljlk.setYxjl(1);
                qtbljlk.getMap().put("startDate",entity.getMap().get("startDate"));
                qtbljlk.getMap().put("endDate",entity.getMap().get("endDate"));
                List<EmrQtbljlk> qtbljlkList = emrQtbljlkDao.selectEmrQtbljlkList(qtbljlk);
                emr_count = emr_count+qtbljlkList.size();

                if(qtbljlkList != null && qtbljlkList.size() > 0){
                    //循环病历
                    for(EmrQtbljlk emrQtbljlk:qtbljlkList){
                        //获取接口数据
                        HlhtZybcjlSjyscfjl obj = new HlhtZybcjlSjyscfjl();
                        obj.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        obj = getHlhtZybcjlSjyscfjl(obj);
                        //解析病历xml
                        Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                        Document bzlzmsDocument = null;
                        //判断是否存在重复,存在则删除，重新新增
                        if(obj != null ){
                            //初始化数据
                            HlhtZybcjlSjyscfjl oldObj  = new HlhtZybcjlSjyscfjl();
                            oldObj.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                            this.removeHlhtZybcjlSjyscfjl(oldObj);
                            //清除日志
                            Map<String,Object> param = new HashMap<>();
                            param.put("SOURCE_ID",emrQtbljlk.getQtbljlxh());
                            param.put("SOURCE_TYPE",Constants.WN_ZYBCJL_SJYSCFJL_SOURCE_TYPE);
                            mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                        }

                        EmrQtbljlk coQtbljlk = new EmrQtbljlk();
                        coQtbljlk.setYxjl(1);
                        coQtbljlk.setSyxh(emrQtbljlk.getSyxh());
                        //辨证论治详细描述
                        List<EmrQtbljlk> bzlzmsEmrQtbljlks = new ArrayList<>();
                        List<EmrQtbljlk> qtbljlkList1 = emrQtbljlkDao.selectEmrQtbljlkList(coQtbljlk);
                        for (EmrQtbljlk qtbljlkTemp : qtbljlkList1) {
                            if (qtbljlkTemp.getBlmc().contains("入院记录(中医入院记录)")) {
                                //辨证论治详细描述
                                bzlzmsEmrQtbljlks.add(qtbljlkTemp);
                            }
                        }
                        //辨证论治详细描述
                        if (bzlzmsEmrQtbljlks.size() >= 1) {
                            mbzDataSetList.removeAll(bzlzmsDataSetList);
                            bzlzmsDocument = XmlUtil.getDocument(Base64Utils.unzipEmrXml(bzlzmsEmrQtbljlks.get(0).getBlnr()));
                        }

                        obj  = new HlhtZybcjlSjyscfjl();
                        obj.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        obj = this.commonQueryDao.selectInitHlhtZybcjlSjyscfjl(obj);
                        obj = (HlhtZybcjlSjyscfjl) HicHelper.initModelValue(mbzDataSetList,document,obj,paramTypeMap);
                        //辨证论治详细描述
                        if (bzlzmsDataSetList != null) {
                            obj = (HlhtZybcjlSjyscfjl) HicHelper.initModelValue(bzlzmsDataSetList, bzlzmsDocument, obj, paramTypeMap);
                        }
                        this.createHlhtZybcjlSjyscfjl(obj);

                        //插入日志
                        mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                                Long.parseLong(Constants.WN_ZYBCJL_SJYSCFJL_SOURCE_TYPE),
                                emrQtbljlk.getQtbljlxh(), emrQtbljlk.getBlmc(),emrQtbljlk.getSyxh()+"",
                                obj.getPatid(),obj.getZyh(),obj.getHzxm(),obj.getXbmc(),obj.getXbdm(),
                                obj.getKsmc(),obj.getKsdm(), obj.getBqmc(),obj.getBqdm(), obj.getSfzhm()));
                        real_count++;
                    }
                }else{
                    logger.info("接口数据集:{}无相关的病历信息，请先书写病历信息",mbzDataSet.getRecordName());
                }
            }
        }else{
            logger.info("接口数据集:{}未配置关联病历模板，请配置接口数据集关联病历模板",mbzDataSet.getRecordName());
        }
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_ZYBCJL_SJYSCFJL_SOURCE_TYPE));

        return dataChecks;
    }
}