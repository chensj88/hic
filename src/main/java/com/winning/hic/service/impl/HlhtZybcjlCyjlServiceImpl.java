package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZybcjlCyjlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZybcjlCyjlService;
import com.winning.hic.service.MbzDataCheckService;
import org.dom4j.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thymeleaf.util.StringUtils;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author HLHT
 * @title HLHT_ZYBCJL_CYJL
 * @email Winning Health
 * @package com.winning.hic.service.impl
 * @date 2018-33-31 16:33:08
 */
@Service
public class HlhtZybcjlCyjlServiceImpl implements HlhtZybcjlCyjlService {

    private final Logger logger = LoggerFactory.getLogger(HlhtZybcjlCyjlServiceImpl.class);

    @Autowired
    private CommonQueryDao commonQueryDao;
    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    @Autowired
    private HlhtZybcjlCyjlDao hlhtZybcjlCyjlDao;

    @Autowired
    private MbzDataCheckService mbzDataCheckService;

    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;

    public int createHlhtZybcjlCyjl(HlhtZybcjlCyjl hlhtZybcjlCyjl) {
        return this.hlhtZybcjlCyjlDao.insertHlhtZybcjlCyjl(hlhtZybcjlCyjl);
    }

    public int modifyHlhtZybcjlCyjl(HlhtZybcjlCyjl hlhtZybcjlCyjl) {
        return this.hlhtZybcjlCyjlDao.updateHlhtZybcjlCyjl(hlhtZybcjlCyjl);
    }

    public int removeHlhtZybcjlCyjl(HlhtZybcjlCyjl hlhtZybcjlCyjl) {
        return this.hlhtZybcjlCyjlDao.deleteHlhtZybcjlCyjl(hlhtZybcjlCyjl);
    }

    public HlhtZybcjlCyjl getHlhtZybcjlCyjl(HlhtZybcjlCyjl hlhtZybcjlCyjl) {
        return this.hlhtZybcjlCyjlDao.selectHlhtZybcjlCyjl(hlhtZybcjlCyjl);
    }

    public int getHlhtZybcjlCyjlCount(HlhtZybcjlCyjl hlhtZybcjlCyjl) {
        return (Integer) this.hlhtZybcjlCyjlDao.selectHlhtZybcjlCyjlCount(hlhtZybcjlCyjl);
    }

    public List<HlhtZybcjlCyjl> getHlhtZybcjlCyjlList(HlhtZybcjlCyjl hlhtZybcjlCyjl) {
        return this.hlhtZybcjlCyjlDao.selectHlhtZybcjlCyjlList(hlhtZybcjlCyjl);
    }

    public List<HlhtZybcjlCyjl> getHlhtZybcjlCyjlPageList(HlhtZybcjlCyjl hlhtZybcjlCyjl) {
        return this.hlhtZybcjlCyjlDao.selectHlhtZybcjlCyjlPageList(hlhtZybcjlCyjl);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZybcjlCyjl(MbzDataCheck t) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count = 0;//病历数量
        int real_count = 0;//实际数量

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZYBCJL_CYJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZYBCJL_CYJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = this.mbzDataSetDao.selectMbzDataSetList(mbzDataSet);
        //1.获取对应的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_ZYBCJL_CYJL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        for (MbzDataListSet dataListSet : dataListSets) {
            EmrQtbljlk qtbljlk = new EmrQtbljlk();
            qtbljlk.setBldm(dataListSet.getModelCode());
            qtbljlk.setYxjl(1);
            qtbljlk.getMap().put("startDate", t.getMap().get("startDate"));
            qtbljlk.getMap().put("endDate", t.getMap().get("endDate"));
            qtbljlk.getMap().put("hisName", ConfigUtils.getEnvironment().getZYHISLinkServerFullPathURL());

            //2.根据模板代码去找到对应的病人病历
            List<HlhtZybcjlCyjl> hlhtRyjlJbxxListFromBaseData = this.commonQueryDao.getHlhtZybcjlCyjlListFromBaseData(qtbljlk);
            emr_count = emr_count + hlhtRyjlJbxxListFromBaseData.size();
            if (hlhtRyjlJbxxListFromBaseData != null) {
                for (HlhtZybcjlCyjl hlhtZybcjlCyjl : hlhtRyjlJbxxListFromBaseData) {
                    EmrQtbljlk emrQtbljlk = new EmrQtbljlk();
                    emrQtbljlk.setQtbljlxh(Long.parseLong(hlhtZybcjlCyjl.getYjlxh()));
                    emrQtbljlk = this.emrQtbljlkDao.selectEmrQtbljlk(emrQtbljlk);
                    //清库
                    HlhtZybcjlCyjl temp = new HlhtZybcjlCyjl();
                    temp.setYjlxh(hlhtZybcjlCyjl.getYjlxh());
                    this.hlhtZybcjlCyjlDao.deleteHlhtZybcjlCyjlByYjlxh(temp);

                    //清除日志
                    Map<String,Object> param = new HashMap<>();
                    param.put("SOURCE_ID",emrQtbljlk.getQtbljlxh());
                    param.put("SOURCE_TYPE",Constants.WN_ZYBCJL_CYJL_SOURCE_TYPE);
                    mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                    //3.xml文件解析 获取病历信息
                    Document document = null;
                    try {
                        document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlCyjl.class);
                    try {
                        hlhtZybcjlCyjl = (HlhtZybcjlCyjl) HicHelper.initModelValue(mbzDataSetList, document, hlhtZybcjlCyjl, paramTypeMap);
                        logger.info("Model:{}", hlhtZybcjlCyjl);
                        //初步诊断-中医病名代码、名称处理
                        if(!"NA".equals(hlhtZybcjlCyjl.getCzzybmdm())){
                            String bmdm="";
                            String bm="";
                            String[] str=hlhtZybcjlCyjl.getCzzybmdm().split("  ");
                            String[] str2=hlhtZybcjlCyjl.getCzzybmmc().split("  ");
                            Character o=new Character('B');
                            for (int i=0;str.length>i;i++){
                                if(!"".equals(str[i].toString())){
                                    if(o.equals(str[i].trim().charAt(0))){
                                        bmdm = bmdm+str[i]+" ";
                                        bm = bm+str2[i]+" ";
                                    }
                                }
                            }
                            if(StringUtils.isEmpty(bmdm)){
                                hlhtZybcjlCyjl.setCzzybmdm("NA");
                            }else{
                                hlhtZybcjlCyjl.setCzzybmdm(bmdm);
                            }
                            if(StringUtils.isEmpty(bm)){
                                hlhtZybcjlCyjl.setCzzybmmc("NA");
                            }else{
                                hlhtZybcjlCyjl.setCzzybmmc(bm);
                            }
                        }
                        //初步诊断-中医证候代码
                        if(!"NA".equals(hlhtZybcjlCyjl.getCzzyzhdm())){
                            String bmdm="";
                            String bm="";
                            String[] str=hlhtZybcjlCyjl.getCzzyzhdm().split("  ");
                            String[] str2=hlhtZybcjlCyjl.getCzzyzhmc().split("  ");
                            Character o=new Character('B');
                            for (int i=0;str.length>i;i++){
                                if(!"".equals(str[i].toString())) {
                                    if (!o.equals(str[i].trim().charAt(0))) {
                                        bmdm = bmdm + str[i] + " ";
                                        bm = bm + str2[i] + " ";
                                    }
                                }
                            }
                            if(StringUtils.isEmpty(bmdm)){
                                hlhtZybcjlCyjl.setCzzyzhdm("NA");
                            }else{
                                hlhtZybcjlCyjl.setCzzyzhdm(bmdm);
                            }
                            if(StringUtils.isEmpty(bm)){
                                hlhtZybcjlCyjl.setCzzyzhmc("NA");
                            }else{
                                hlhtZybcjlCyjl.setCzzyzhmc(bm);
                            }
                        }
                        this.hlhtZybcjlCyjlDao.insertHlhtZybcjlCyjl(hlhtZybcjlCyjl);
                        mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                                Long.parseLong(Constants.WN_ZYBCJL_CYJL_SOURCE_TYPE),
                                emrQtbljlk.getQtbljlxh(),emrQtbljlk.getBlmc(),emrQtbljlk.getSyxh()+"",
                                new Timestamp(DateUtil.parse(emrQtbljlk.getFssj(),DateUtil.PATTERN_19).getTime()),
                                hlhtZybcjlCyjl.getPatid(),hlhtZybcjlCyjl.getZyh(),hlhtZybcjlCyjl.getHzxm(),hlhtZybcjlCyjl.getXbmc(),hlhtZybcjlCyjl.getXbdm(),
                                hlhtZybcjlCyjl.getKsmc(),hlhtZybcjlCyjl.getKsdm(), hlhtZybcjlCyjl.getBqmc(),hlhtZybcjlCyjl.getBqdm(), hlhtZybcjlCyjl.getSfzhm()));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    real_count++;
                }
            }
        }
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count, real_count, Integer.parseInt(Constants.WN_ZYBCJL_CYJL_SOURCE_TYPE));

        return mbzDataChecks;
    }

    @Override
    public void deleteHlhtZybcjlCyjlByYjlxh(HlhtZybcjlCyjl hlhtZybcjlCyjl) {
        this.hlhtZybcjlCyjlDao.deleteHlhtZybcjlCyjl(hlhtZybcjlCyjl);
    }

    @Override
    public List<HlhtZybcjlCyjl> getHlhtZybcjlCyjlListFromBaseData(EmrQtbljlk emrQtbljlk) {
        return this.commonQueryDao.getHlhtZybcjlCyjlListFromBaseData(emrQtbljlk);
    }
}