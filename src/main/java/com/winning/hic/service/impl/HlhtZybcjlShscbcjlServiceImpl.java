package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.Base64Utils;
import com.winning.hic.base.utils.HicHelper;
import com.winning.hic.base.utils.ReflectUtil;
import com.winning.hic.base.utils.XmlUtil;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.data.HlhtZybcjlShscbcjlDao;
import com.winning.hic.model.*;
import com.winning.hic.service.*;
import org.dom4j.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;


/**
* @author HLHT
* @title HLHT_ZYBCJL_SHSCBCJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-34-31 16:34:11
*/
@Service
public class HlhtZybcjlShscbcjlServiceImpl implements  HlhtZybcjlShscbcjlService {

    @Autowired
    private HlhtZybcjlShscbcjlDao hlhtZybcjlShscbcjlDao;
    @Autowired
    private CommonQueryDao commonQueryDao;
    @Autowired
    private EmrQtbljlkService emrQtbljlkService;
    @Autowired
    private MbzDataSetService mbzDataSetService;
    @Autowired
    private MbzDataListSetService mbzDataListSetService;
    @Autowired
    private MbzDataCheckService mbzDataCheckService;

    public int createHlhtZybcjlShscbcjl(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl){
        return this.hlhtZybcjlShscbcjlDao.insertHlhtZybcjlShscbcjl(hlhtZybcjlShscbcjl);
    }

    public int modifyHlhtZybcjlShscbcjl(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl){
        return this.hlhtZybcjlShscbcjlDao.updateHlhtZybcjlShscbcjl(hlhtZybcjlShscbcjl);
    }

    public int removeHlhtZybcjlShscbcjl(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl){
        return this.hlhtZybcjlShscbcjlDao.deleteHlhtZybcjlShscbcjl(hlhtZybcjlShscbcjl);
    }

    public HlhtZybcjlShscbcjl getHlhtZybcjlShscbcjl(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl){
        return this.hlhtZybcjlShscbcjlDao.selectHlhtZybcjlShscbcjl(hlhtZybcjlShscbcjl);
    }

    public int getHlhtZybcjlShscbcjlCount(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl){
        return (Integer)this.hlhtZybcjlShscbcjlDao.selectHlhtZybcjlShscbcjlCount(hlhtZybcjlShscbcjl);
    }

    public List<HlhtZybcjlShscbcjl> getHlhtZybcjlShscbcjlList(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl){
        return this.hlhtZybcjlShscbcjlDao.selectHlhtZybcjlShscbcjlList(hlhtZybcjlShscbcjl);
    }

    public List<HlhtZybcjlShscbcjl> getHlhtZybcjlShscbcjlPageList(HlhtZybcjlShscbcjl hlhtZybcjlShscbcjl){
        return this.hlhtZybcjlShscbcjlDao.selectHlhtZybcjlShscbcjlPageList(hlhtZybcjlShscbcjl);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZybcjlShscbcjl(MbzDataCheck entity) throws IOException, ParseException {
        List<MbzDataCheck> dataCheckList = null;
        int emr_count =0;//病历数量
        int real_count=0;//实际数量
         //加载模板
        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZYBCJL_SHSCBCJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZYBCJL_SHSCBCJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = mbzDataSetService.getMbzDataSetList(mbzDataSet);
        //加载模板病历关系信息
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZYBCJL_SHSCBCJL_SOURCE_TYPE);
        List<MbzDataListSet> mbzDataListSetList = mbzDataListSetService.getMbzDataListSetList(mbzDataListSet);
        //加载接口对象字段集合信息
        Map<String,String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlShscbcjl.class);

        //获取模板病历关系集合，遍历
        for(MbzDataListSet dataListSet : mbzDataListSetList){
            //查询病历数据 数据来源
            EmrQtbljlk qtbljlk = new EmrQtbljlk();
            qtbljlk.setBldm(dataListSet.getModelCode());
            qtbljlk.setYxjl(1);
            qtbljlk.getMap().put("startDate",entity.getMap().get("startDate"));
            qtbljlk.getMap().put("endDate",entity.getMap().get("endDate"));
            List<EmrQtbljlk> qtbljlkList = emrQtbljlkService.getEmrQtbljlkList(qtbljlk);
            emr_count = emr_count+qtbljlkList.size();
            if(qtbljlkList != null){
                //循环病历
                for(EmrQtbljlk emrQtbljlk:qtbljlkList){
                    //获取接口数据
                    HlhtZybcjlShscbcjl shscbcjl = new HlhtZybcjlShscbcjl();
                    shscbcjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                    shscbcjl = getHlhtZybcjlShscbcjl(shscbcjl);
                    //解析病历xml
                    Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                    //判断是否存在重复,存在则删除，重新新增
                    if(shscbcjl != null ){
                        //初始化数据
                        HlhtZybcjlShscbcjl oldShscbcjl = new HlhtZybcjlShscbcjl();
                        oldShscbcjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                        this.removeHlhtZybcjlShscbcjl(oldShscbcjl);
                    }
                    shscbcjl  = new HlhtZybcjlShscbcjl();
                    shscbcjl.setYjlxh(String.valueOf(emrQtbljlk.getQtbljlxh()));
                    shscbcjl = this.commonQueryDao.selectInitHlhtZybcjlShscbcjl(shscbcjl);
                    shscbcjl = (HlhtZybcjlShscbcjl) HicHelper.initModelValue(mbzDataSetList,document,shscbcjl,paramTypeMap);
                    this.createHlhtZybcjlShscbcjl(shscbcjl);
                    real_count++;
                }
            }
        }
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_ZYBCJL_SHSCBCJL_SOURCE_TYPE));
        return dataCheckList;
    }
}