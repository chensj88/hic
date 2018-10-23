package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.*;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtRyjlJbxxService;
import com.winning.hic.service.MbzDataCheckService;
import org.dom4j.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author HLHT
 * @title HLHT_RYJL_JBXX
 * @email Winning Health
 * @package com.winning.hic.service.impl
 * @date 2018-30-31 16:30:20
 */
@Service
public class HlhtRyjlJbxxServiceImpl implements HlhtRyjlJbxxService {
    private final Logger logger = LoggerFactory.getLogger(HlhtRyjlJbxxServiceImpl.class);
    @Autowired
    private CommonQueryDao commonQueryDao;
    @Autowired
    private HlhtRyjlJbxxDao hlhtRyjlJbxxDao;

    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    @Autowired
    private MbzDataCheckService mbzDataCheckService;
    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;
    @Autowired
    private HlhtCommonQueryDao hlhtCommonQueryDao;

    public int createHlhtRyjlJbxx(HlhtRyjlJbxx hlhtRyjlJbxx) {
        return this.hlhtRyjlJbxxDao.insertHlhtRyjlJbxx(hlhtRyjlJbxx);
    }

    public int modifyHlhtRyjlJbxx(HlhtRyjlJbxx hlhtRyjlJbxx) {
        return this.hlhtRyjlJbxxDao.updateHlhtRyjlJbxx(hlhtRyjlJbxx);
    }

    public int removeHlhtRyjlJbxx(HlhtRyjlJbxx hlhtRyjlJbxx) {
        return this.hlhtRyjlJbxxDao.deleteHlhtRyjlJbxx(hlhtRyjlJbxx);
    }

    public HlhtRyjlJbxx getHlhtRyjlJbxx(HlhtRyjlJbxx hlhtRyjlJbxx) {
        return this.hlhtRyjlJbxxDao.selectHlhtRyjlJbxx(hlhtRyjlJbxx);
    }

    public int getHlhtRyjlJbxxCount(HlhtRyjlJbxx hlhtRyjlJbxx) {
        return (Integer) this.hlhtRyjlJbxxDao.selectHlhtRyjlJbxxCount(hlhtRyjlJbxx);
    }

    public List<HlhtRyjlJbxx> getHlhtRyjlJbxxList(HlhtRyjlJbxx hlhtRyjlJbxx) {
        return this.hlhtRyjlJbxxDao.selectHlhtRyjlJbxxList(hlhtRyjlJbxx);
    }

    public List<HlhtRyjlJbxx> getHlhtRyjlJbxxPageList(HlhtRyjlJbxx hlhtRyjlJbxx) {
        return this.hlhtRyjlJbxxDao.selectHlhtRyjlJbxxPageList(hlhtRyjlJbxx);
    }

    @Override
    public List<HlhtRyjlJbxx> getHlhtRyjlJbxxListFromBaseData(EmrQtbljlk emrQtbljlk) {
        return this.commonQueryDao.getHlhtRyjlJbxxListFromBaseData(emrQtbljlk);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtRyjlJbxx(MbzDataCheck t) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count = 0;//病历数量
        int real_count = 0;//实际数量

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_RYJL_JBXX_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_RYJL_JBXX_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = this.mbzDataSetDao.selectMbzDataSetList(mbzDataSet);
        List<MbzDataSet> xzDataSetList = new ArrayList<>();
        String[] xzCode = {"xzxyzdmc", "xzzybmmc", "xzzyzhmc", "xzzdrq", "xzxyzdbm", "xzzybmdm", "xzzyzhdm"};
        List<MbzDataSet> qzDataSetList = new ArrayList<>();
        String[] qzCode = {"qzxyzdmc", "qzzybmmc", "qzzyzhmc", "qzrq", "qzxyzdbm", "qzzybmdm", "qzzyzhdm"};
        List<MbzDataSet> bzDataSetList = new ArrayList<>();
        String[] bzCode = {"bzmc", "bzrq", "bzbm"};
        for (MbzDataSet dataSet : mbzDataSetList) {
            //修正诊断字段配置集合
            for (int i = 0; i < xzCode.length; i++) {
                if (xzCode[i].equals(dataSet.getPyCode())) {
                    xzDataSetList.add(dataSet);
                }
            }
            //确定诊断字段配置集合
            for (int i = 0; i < qzCode.length; i++) {
                if (qzCode[i].equals(dataSet.getPyCode())) {
                    qzDataSetList.add(dataSet);
                }
            }
            //补充诊断字段配置集合
            for (int i = 0; i < bzCode.length; i++) {
                if (bzCode[i].equals(dataSet.getPyCode())) {
                    bzDataSetList.add(dataSet);
                }
            }

        }
        HlhtRyjlJbxx hlhtRyjlJbxxTemp = new HlhtRyjlJbxx();
        hlhtRyjlJbxxTemp.getMap().put("sourceType", Constants.WN_RYJL_JBXX_SOURCE_TYPE);
        hlhtRyjlJbxxTemp.getMap().put("startDate", t.getMap().get("startDate"));
        hlhtRyjlJbxxTemp.getMap().put("endDate", t.getMap().get("endDate"));
        hlhtRyjlJbxxTemp.getMap().put("syxh", t.getMap().get("syxh"));
        //2.根据模板代码去找到对应的病人病历
        List<HlhtRyjlJbxx> hlhtRyjlJbxxList = this.hlhtRyjlJbxxDao.selectHlhtRyjlJbxxListByProc(hlhtRyjlJbxxTemp);

        if (hlhtRyjlJbxxList != null) {
            emr_count = emr_count + hlhtRyjlJbxxList.size();
            for (HlhtRyjlJbxx obj : hlhtRyjlJbxxList) {
                Map<String, Object> param = new HashMap<>();
                param.put("syxh", obj.getSyxh());

                //修正诊断
                param.put("keyWord", "修正诊断");
                List<EmrQtbljlk> xzEmrQtbljlks = this.hlhtCommonQueryDao.selectEmrQtbljlkListByProc(param);
                //确定诊断
                param.put("keyWord", "确定诊断");
                List<EmrQtbljlk> qzEmrQtbljlks = this.hlhtCommonQueryDao.selectEmrQtbljlkListByProc(param);
                //补充诊断
                param.put("keyWord", "补充诊断");
                List<EmrQtbljlk> bzEmrQtbljlks = this.hlhtCommonQueryDao.selectEmrQtbljlkListByProc(param);


                //清库
                HlhtRyjlJbxx temp = new HlhtRyjlJbxx();
                temp.setYjlxh(obj.getYjlxh());
                this.hlhtRyjlJbxxDao.deleteHlhtRyjlJbxxByYjlxh(temp);

                //清除日志
                Map<String, Object> logMap = new HashMap<>();
                logMap.put("SOURCE_ID", obj.getYjlxh());
                logMap.put("SOURCE_TYPE", Constants.WN_RYJL_JBXX_SOURCE_TYPE);
                mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(logMap);


                //3.xml文件解析 获取病历信息
                Document document = null;
                Document xzDocument = null;
                Document qzDocument = null;
                Document bzDocument = null;
                try {
                    document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(obj.getBlnr()));
                    if (xzEmrQtbljlks.size() >= 1) {
                        //去除入院记录中多余取值字段
//                            mbzDataSetList.removeAll(xzDataSetList);
                        xzDocument = XmlUtil.getDocument(Base64Utils.unzipEmrXml(xzEmrQtbljlks.get(0).getBlnr()));
                    }
                    if (qzEmrQtbljlks.size() >= 1) {
//                            mbzDataSetList.removeAll(qzDataSetList);
                        qzDocument = XmlUtil.getDocument(Base64Utils.unzipEmrXml(qzEmrQtbljlks.get(0).getBlnr()));
                    }

                    if (bzEmrQtbljlks.size() >= 1) {
//                            mbzDataSetList.removeAll(bzDataSetList);
                        bzDocument = XmlUtil.getDocument(Base64Utils.unzipEmrXml(bzEmrQtbljlks.get(0).getBlnr()));
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
                Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtRyjlJbxx.class);
                try {
                    obj = (HlhtRyjlJbxx) HicHelper.initModelValue(mbzDataSetList, document, obj, paramTypeMap);
                    if (xzDocument != null) {
                        obj = (HlhtRyjlJbxx) HicHelper.initModelValue(xzDataSetList, xzDocument, obj, paramTypeMap);
                    }
                    if (qzDataSetList != null) {
                        obj = (HlhtRyjlJbxx) HicHelper.initModelValue(qzDataSetList, qzDocument, obj, paramTypeMap);
                    }
                    if (bzDataSetList != null) {
                        obj = (HlhtRyjlJbxx) HicHelper.initModelValue(bzDataSetList, bzDocument, obj, paramTypeMap);
                    }
                    logger.info("Model:{}", obj);
                    //初步诊断-中医病名代码、名称处理
                    if (!"NA".equals(obj.getCzzybmdm())) {
                        String bmdm = "";
                        String bm = "";
                        String[] str = obj.getCzzybmdm().split("  ");
                        String[] str2 = obj.getCzzybmmc().split("  ");
                        Character o = new Character('B');
                        for (int i = 0; str.length > i; i++) {
                            if (!"".equals(str[i].toString())) {
                                if (o.equals(str[i].trim().charAt(0))) {
                                    bmdm = bmdm + str[i] + " ";
                                    bm = bm + str2[i] + " ";
                                }
                            }
                        }
                        if (StringUtil.isEmptyOrNull(bmdm)) {
                            obj.setCzzybmdm("NA");
                        } else {
                            obj.setCzzybmdm(bmdm);
                        }
                        if (StringUtil.isEmptyOrNull(bm)) {
                            obj.setCzzybmmc("NA");
                        } else {
                            obj.setCzzybmmc(bm);
                        }
                    }
                    //初步诊断-中医证候代码
                    if (!"NA".equals(obj.getCzzyzhdm())) {
                        String bmdm = "";
                        String bm = "";
                        String[] str = obj.getCzzyzhdm().split("  ");
                        String[] str2 = obj.getCzzyzhmc().split("  ");
                        Character o = new Character('B');
                        for (int i = 0; str.length > i; i++) {
                            if (!"".equals(str[i].toString())) {
                                if (!o.equals(str[i].trim().charAt(0))) {
                                    bmdm = bmdm + str[i] + " ";
                                    bm = bm + str2[i] + " ";
                                }
                            }
                        }
                        if (StringUtil.isEmptyOrNull(bmdm)) {
                            obj.setCzzyzhdm("NA");
                        } else {
                            obj.setCzzyzhdm(bmdm);
                        }
                        if (StringUtil.isEmptyOrNull(bm)) {
                            obj.setCzzyzhmc("NA");
                        } else {
                            obj.setCzzyzhmc(bm);
                        }
                    }
                    //去除修正诊断西医病名和代码的冗余字符串
                    obj.setXzxyzdbm(obj.getXzxyzdbm() == null ? "NA" : obj.getXzxyzdbm().replace("西医诊断", "").trim());
                    obj.setXzxyzdmc(obj.getXzxyzdmc() == null ? "NA" : obj.getXzxyzdmc().replace("西医诊断", "").trim());
                    //修正诊断-中医病名代码、名称处理
                    String xzzybmdm = obj.getXzzybmdm() == null ? "NA" : obj.getXzzybmdm();
                    String xzzybmmc = obj.getXzzybmmc() == null ? "NA" : obj.getXzzybmmc();
                    if (!"NA".equals(xzzybmdm)) {
                        String bmdm = "";
                        String bm = "";
                        String[] str = xzzybmdm.replace("中医诊断", "").trim().split("  ");
                        String[] str2 = xzzybmmc.replace("中医诊断", "").trim().split("  ");
                        Character o = new Character('B');
                        for (int i = 0; str.length > i; i++) {
                            if (!"".equals(str[i].toString())) {
                                if (o.equals(str[i].trim().charAt(0))) {
                                    bmdm = bmdm + str[i] + " ";
                                    bm = bm + str2[i] + " ";
                                }
                            }
                        }
                        if (StringUtil.isEmptyOrNull(bmdm)) {
                            obj.setXzzybmdm("NA");
                        } else {
                            obj.setXzzybmdm(bmdm);
                        }
                        if (StringUtil.isEmptyOrNull(bm)) {
                            obj.setXzzybmmc("NA");
                        } else {
                            obj.setXzzybmmc(bm);
                        }
                    }
                    //修正诊断-中医证候代码
                    if (!"NA".equals(obj.getXzzyzhdm())) {
                        String bmdm = "";
                        String bm = "";
                        String[] str = xzzybmdm.replace("中医诊断", "").trim().split("  ");
                        String[] str2 = xzzybmmc.replace("中医诊断", "").trim().split("  ");
                        Character o = new Character('B');
                        for (int i = 0; str.length > i; i++) {
                            if (!"".equals(str[i].toString())) {
                                if (!o.equals(str[i].trim().charAt(0))) {
                                    bmdm = bmdm + str[i] + " ";
                                    bm = bm + str2[i] + " ";
                                }
                            }
                        }
                        if (StringUtil.isEmptyOrNull(bmdm)) {
                            obj.setXzzyzhdm("NA");
                        } else {
                            obj.setXzzyzhdm(bmdm);
                        }
                        if (StringUtil.isEmptyOrNull(bm)) {
                            obj.setXzzyzhmc("NA");
                        } else {
                            obj.setXzzyzhmc(bm);
                        }
                    }


                    //去除确定诊断西医病名和代码的冗余字符串
                    String qzxyzdbm = obj.getQzxyzdbm() == null ? "NA" : obj.getQzxyzdbm();
                    String qzxyzdmc = obj.getQzxyzdmc() == null ? "NA" : obj.getQzxyzdmc();
                    if (!"NA".equals(qzxyzdbm)) {
                        int index = qzxyzdbm.indexOf("西医诊断");
                        if(index>=0) {
                            qzxyzdbm = qzxyzdbm.substring(index + 4).trim();
                        }
                    }
                    if (!"NA".equals(qzxyzdmc)) {
                        int index = qzxyzdmc.indexOf("西医诊断");
                        if(index>=0){
                            qzxyzdmc = qzxyzdmc.substring(index + 4).trim();
                        }
                    }
                    obj.setQzxyzdbm(qzxyzdbm);
                    obj.setQzxyzdmc(qzxyzdmc);

                    //获取中医诊断代码和名称
                    String qzzybmdm = obj.getQzzybmdm() == null ? "NA" : obj.getQzzybmdm();
                    String qzzybmmc = obj.getQzzybmmc() == null ? "NA" : obj.getQzzybmmc();

                    if (!"NA".equals(qzzybmdm)) {
                        qzzybmdm = qzzybmdm.split("西医诊断")[0].replace("中医诊断", "").trim();
                    }
                    if (!"NA".equals(qzzybmmc)) {
                        qzzybmmc = qzzybmmc.split("西医诊断")[0].replace("中医诊断", "").trim();
                    }
                    //确定诊断-中医病名代码、名称处理
                    if (!"NA".equals(qzzybmdm)) {
                        String bmdm = "";
                        String bm = "";
                        String[] str = qzzybmdm.split("  ");
                        String[] str2 = qzzybmmc.split("  ");
                        Character o = new Character('B');
                        for (int i = 0; str.length > i; i++) {
                            if (!"".equals(str[i].toString())) {
                                if (o.equals(str[i].trim().charAt(0))) {
                                    bmdm = bmdm + str[i] + " ";
                                    bm = bm + str2[i] + " ";
                                }
                            }
                        }
                        if (StringUtil.isEmptyOrNull(bmdm)) {
                            obj.setQzzybmdm("NA");
                        } else {
                            obj.setQzzybmdm(bmdm);
                        }
                        if (StringUtil.isEmptyOrNull(bm)) {
                            obj.setQzzybmmc("NA");
                        } else {
                            obj.setQzzybmmc(bm);
                        }
                    }
                    //确定诊断-中医证候代码
                    if (!"NA".equals(obj.getQzzyzhdm())) {
                        String bmdm = "";
                        String bm = "";
                        String[] str = qzzybmdm.split("  ");
                        String[] str2 = qzzybmmc.split("  ");
                        Character o = new Character('B');
                        for (int i = 0; str.length > i; i++) {
                            if (!"".equals(str[i].toString())) {
                                if (!o.equals(str[i].trim().charAt(0))) {
                                    bmdm = bmdm + str[i] + " ";
                                    bm = bm + str2[i] + " ";
                                }
                            }
                        }
                        if (StringUtil.isEmptyOrNull(bmdm)) {
                            obj.setQzzyzhdm("NA");
                        } else {
                            obj.setQzzyzhdm(bmdm);
                        }
                        if (StringUtil.isEmptyOrNull(bm)) {
                            obj.setQzzyzhmc("NA");
                        } else {
                            obj.setQzzyzhmc(bm);
                        }
                    }

                    this.hlhtRyjlJbxxDao.insertHlhtRyjlJbxx(obj);

                    mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                            Long.parseLong(Constants.WN_RYJL_JBXX_SOURCE_TYPE),
                            Long.parseLong(obj.getYjlxh()), obj.getBlmc(), obj.getSyxh() + "",
                            obj.getFssj(),
                            obj.getPatid(), obj.getZyh(), obj.getHzxm(), obj.getXbmc(), obj.getXbdm(),
                            obj.getKsmc(), obj.getKsdm(), obj.getBqmc(), obj.getBqdm(), obj.getSfzhm(),
                            PercentUtil.getPercent(Long.parseLong(Constants.WN_RYJL_JBXX_SOURCE_TYPE), obj, 1),
                            PercentUtil.getPercent(Long.parseLong(Constants.WN_RYJL_JBXX_SOURCE_TYPE), obj, 0)));
                } catch (Exception e) {
                    e.printStackTrace();
                }
                real_count++;
            }
        }
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count, real_count, Integer.parseInt(Constants.WN_RYJL_JBXX_SOURCE_TYPE), t);

        return mbzDataChecks;
    }

    @Override
    public void deleteHlhtRyjlJbxxByYjlxh(HlhtRyjlJbxx hlhtRyjlJbxx) {
        this.hlhtRyjlJbxxDao.deleteHlhtRyjlJbxxByYjlxh(hlhtRyjlJbxx);
    }
}