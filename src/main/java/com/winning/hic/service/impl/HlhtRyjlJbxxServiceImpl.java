package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtRyjlJbxxDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtRyjlJbxxService;
import com.winning.hic.service.MbzDataCheckService;
import org.dom4j.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thymeleaf.util.StringUtils;

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
        return this.hlhtRyjlJbxxDao.getHlhtRyjlJbxxListFromBaseData(emrQtbljlk);
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
        //1.获取对应的模板ID集合
        MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_RYJL_JBXX_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = this.mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        for (MbzDataListSet dataListSet : dataListSets) {
            EmrQtbljlk qtbljlk = new EmrQtbljlk();
            qtbljlk.setBldm(dataListSet.getModelCode());
            qtbljlk.setYxjl(1);
            qtbljlk.getMap().put("startDate", t.getMap().get("startDate"));
            qtbljlk.getMap().put("endDate", t.getMap().get("endDate"));
            //2.根据模板代码去找到对应的病人病历
            List<HlhtRyjlJbxx> hlhtRyjlJbxxListFromBaseData = this.hlhtRyjlJbxxDao.getHlhtRyjlJbxxListFromBaseData(qtbljlk);
            emr_count = emr_count + hlhtRyjlJbxxListFromBaseData.size();


            if (hlhtRyjlJbxxListFromBaseData != null) {
                for (HlhtRyjlJbxx hlhtRyjlJbxx : hlhtRyjlJbxxListFromBaseData) {
                    //入院记录
                    EmrQtbljlk emrQtbljlk = new EmrQtbljlk();
                    emrQtbljlk.setQtbljlxh(Long.parseLong(hlhtRyjlJbxx.getYjlxh()));
                    emrQtbljlk = this.emrQtbljlkDao.selectEmrQtbljlk(emrQtbljlk);

                    //根据首页序号获取所有同类序号病例
                    EmrQtbljlk emrTemp = new EmrQtbljlk();
                    emrTemp.setYxjl(1);
                    emrTemp.setSyxh(emrQtbljlk.getSyxh());
                    List<EmrQtbljlk> emrQtbljlks = this.emrQtbljlkDao.selectEmrQtbljlkList(emrTemp);
                    //修正诊断
                    List<EmrQtbljlk> xzEmrQtbljlks = new ArrayList<>();
                    //确定诊断
                    List<EmrQtbljlk> qzEmrQtbljlks = new ArrayList<>();
                    //补充诊断
                    List<EmrQtbljlk> bzEmrQtbljlks = new ArrayList<>();

                    for (EmrQtbljlk qtbljlkTemp : emrQtbljlks) {
                        if (qtbljlkTemp.getBlmc().contains("修正诊断")) {
                            //修正诊断病例集合
                            xzEmrQtbljlks.add(qtbljlkTemp);
                        }
                        if (qtbljlkTemp.getBlmc().contains("确定诊断")) {
                            //确定诊断病例集合
                            qzEmrQtbljlks.add(qtbljlkTemp);
                        }
                        if (qtbljlkTemp.getBlmc().contains("补充诊断")) {
                            //补充诊断病例集合
                            bzEmrQtbljlks.add(qtbljlkTemp);
                        }
                    }
                    //清库
                    HlhtRyjlJbxx temp = new HlhtRyjlJbxx();
                    temp.setYjlxh(hlhtRyjlJbxx.getYjlxh());
                    this.hlhtRyjlJbxxDao.deleteHlhtRyjlJbxxByYjlxh(temp);

                    //清除日志
                    Map<String,Object> param = new HashMap<>();
                    param.put("SOURCE_ID",emrQtbljlk.getQtbljlxh());
                    param.put("SOURCE_TYPE",Constants.WN_RYJL_JBXX_SOURCE_TYPE);
                    mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);


                    //3.xml文件解析 获取病历信息
                    Document document = null;
                    Document xzDocument = null;
                    Document qzDocument = null;
                    Document bzDocument = null;
                    try {
                        document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
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
                        hlhtRyjlJbxx = (HlhtRyjlJbxx) HicHelper.initModelValue(mbzDataSetList, document, hlhtRyjlJbxx, paramTypeMap);
                        if (xzDocument != null) {
                            hlhtRyjlJbxx = (HlhtRyjlJbxx) HicHelper.initModelValue(xzDataSetList, xzDocument, hlhtRyjlJbxx, paramTypeMap);
                        }
                        if (qzDataSetList != null) {
                            hlhtRyjlJbxx = (HlhtRyjlJbxx) HicHelper.initModelValue(qzDataSetList, qzDocument, hlhtRyjlJbxx, paramTypeMap);
                        }
                        if (bzDataSetList != null) {
                            hlhtRyjlJbxx = (HlhtRyjlJbxx) HicHelper.initModelValue(bzDataSetList, bzDocument, hlhtRyjlJbxx, paramTypeMap);
                        }
                        logger.info("Model:{}", hlhtRyjlJbxx);
                        //初步诊断-中医病名代码、名称处理
                        if (!"NA".equals(hlhtRyjlJbxx.getCzzybmdm())) {
                            String bmdm = "";
                            String bm = "";
                            String[] str = hlhtRyjlJbxx.getCzzybmdm().split("  ");
                            String[] str2 = hlhtRyjlJbxx.getCzzybmmc().split("  ");
                            Character o = new Character('B');
                            for (int i = 0; str.length > i; i++) {
                                if (o.equals(str[i].trim().charAt(0))) {
                                    bmdm = bmdm + str[i] + " ";
                                    bm = bm + str2[i] + " ";
                                }
                            }
                            if (StringUtil.isEmptyOrNull(bmdm)) {
                                hlhtRyjlJbxx.setCzzybmdm("NA");
                            } else {
                                hlhtRyjlJbxx.setCzzybmdm(bmdm);
                            }
                            if (StringUtil.isEmptyOrNull(bm)) {
                                hlhtRyjlJbxx.setCzzybmmc("NA");
                            } else {
                                hlhtRyjlJbxx.setCzzybmmc(bm);
                            }
                        }
                        //初步诊断-中医证候代码
                        if (!"NA".equals(hlhtRyjlJbxx.getCzzyzhdm())) {
                            String bmdm = "";
                            String bm = "";
                            String[] str = hlhtRyjlJbxx.getCzzyzhdm().split("  ");
                            String[] str2 = hlhtRyjlJbxx.getCzzyzhmc().split("  ");
                            Character o = new Character('B');
                            for (int i = 0; str.length > i; i++) {
                                if (!o.equals(str[i].trim().charAt(0))) {
                                    bmdm = bmdm + str[i] + " ";
                                    bm = bm + str2[i] + " ";
                                }
                            }
                            if (StringUtil.isEmptyOrNull(bmdm)) {
                                hlhtRyjlJbxx.setCzzyzhdm("NA");
                            } else {
                                hlhtRyjlJbxx.setCzzyzhdm(bmdm);
                            }
                            if (StringUtil.isEmptyOrNull(bm)) {
                                hlhtRyjlJbxx.setCzzyzhmc("NA");
                            } else {
                                hlhtRyjlJbxx.setCzzyzhmc(bm);
                            }
                        }
                        //去除修正诊断西医病名和代码的冗余字符串
                        hlhtRyjlJbxx.setXzxyzdbm(hlhtRyjlJbxx.getXzxyzdbm() == null ? "NA" : hlhtRyjlJbxx.getXzxyzdbm().replace("西医诊断", "").trim());
                        hlhtRyjlJbxx.setXzxyzdmc(hlhtRyjlJbxx.getXzxyzdmc() == null ? "NA" : hlhtRyjlJbxx.getXzxyzdmc().replace("西医诊断", "").trim());
                        //修正诊断-中医病名代码、名称处理
                        String xzzybmdm = hlhtRyjlJbxx.getXzzybmdm() == null ? "NA" : hlhtRyjlJbxx.getXzzybmdm();
                        String xzzybmmc = hlhtRyjlJbxx.getXzzybmmc() == null ? "NA" : hlhtRyjlJbxx.getXzzybmmc();
                        if (!"NA".equals(xzzybmdm)) {
                            String bmdm = "";
                            String bm = "";
                            String[] str = xzzybmdm.replace("中医诊断", "").trim().split("  ");
                            String[] str2 = xzzybmmc.replace("中医诊断", "").trim().split("  ");
                            Character o = new Character('B');
                            for (int i = 0; str.length > i; i++) {
                                if (o.equals(str[i].trim().charAt(0))) {
                                    bmdm = bmdm + str[i] + " ";
                                    bm = bm + str2[i] + " ";
                                }
                            }
                            if (StringUtil.isEmptyOrNull(bmdm)) {
                                hlhtRyjlJbxx.setXzzybmdm("NA");
                            } else {
                                hlhtRyjlJbxx.setXzzybmdm(bmdm);
                            }
                            if (StringUtil.isEmptyOrNull(bm)) {
                                hlhtRyjlJbxx.setXzzybmmc("NA");
                            } else {
                                hlhtRyjlJbxx.setXzzybmmc(bm);
                            }
                        }
                        //修正诊断-中医证候代码
                        if (!"NA".equals(hlhtRyjlJbxx.getXzzyzhdm())) {
                            String bmdm = "";
                            String bm = "";
                            String[] str = xzzybmdm.replace("中医诊断", "").trim().split("  ");
                            String[] str2 = xzzybmmc.replace("中医诊断", "").trim().split("  ");
                            Character o = new Character('B');
                            for (int i = 0; str.length > i; i++) {
                                if (!o.equals(str[i].trim().charAt(0))) {
                                    bmdm = bmdm + str[i] + " ";
                                    bm = bm + str2[i] + " ";
                                }
                            }
                            if (StringUtil.isEmptyOrNull(bmdm)) {
                                hlhtRyjlJbxx.setXzzyzhdm("NA");
                            } else {
                                hlhtRyjlJbxx.setXzzyzhdm(bmdm);
                            }
                            if (StringUtil.isEmptyOrNull(bm)) {
                                hlhtRyjlJbxx.setXzzyzhmc("NA");
                            } else {
                                hlhtRyjlJbxx.setXzzyzhmc(bm);
                            }
                        }


                        //去除确定诊断西医病名和代码的冗余字符串
                        String qzxyzdbm = hlhtRyjlJbxx.getQzxyzdbm() == null ? "NA" : hlhtRyjlJbxx.getQzxyzdbm();
                        String qzxyzdmc = hlhtRyjlJbxx.getQzxyzdmc() == null ? "NA" : hlhtRyjlJbxx.getQzxyzdmc();
                        if (!"NA".equals(qzxyzdbm)) {
                            int index = qzxyzdbm.indexOf("西医诊断");
                            qzxyzdbm = qzxyzdbm.substring(index + 4).trim();
                        }
                        if (!"NA".equals(qzxyzdmc)) {
                            int index = qzxyzdmc.indexOf("西医诊断");
                            qzxyzdmc = qzxyzdmc.substring(index + 4).trim();
                        }
                        hlhtRyjlJbxx.setQzxyzdbm(qzxyzdbm);
                        hlhtRyjlJbxx.setQzxyzdmc(qzxyzdmc);

                        //获取中医诊断代码和名称
                        String qzzybmdm = hlhtRyjlJbxx.getQzzybmdm() == null ? "NA" : hlhtRyjlJbxx.getQzzybmdm();
                        String qzzybmmc = hlhtRyjlJbxx.getQzzybmmc() == null ? "NA" : hlhtRyjlJbxx.getQzzybmmc();

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
                                if (o.equals(str[i].trim().charAt(0))) {
                                    bmdm = bmdm + str[i] + " ";
                                    bm = bm + str2[i] + " ";
                                }
                            }
                            if (StringUtil.isEmptyOrNull(bmdm)) {
                                hlhtRyjlJbxx.setQzzybmdm("NA");
                            } else {
                                hlhtRyjlJbxx.setQzzybmdm(bmdm);
                            }
                            if (StringUtil.isEmptyOrNull(bm)) {
                                hlhtRyjlJbxx.setQzzybmmc("NA");
                            } else {
                                hlhtRyjlJbxx.setQzzybmmc(bm);
                            }
                        }
                        //确定诊断-中医证候代码
                        if (!"NA".equals(hlhtRyjlJbxx.getQzzyzhdm())) {
                            String bmdm = "";
                            String bm = "";
                            String[] str = qzzybmdm.split("  ");
                            String[] str2 = qzzybmmc.split("  ");
                            Character o = new Character('B');
                            for (int i = 0; str.length > i; i++) {
                                if (!o.equals(str[i].trim().charAt(0))) {
                                    bmdm = bmdm + str[i] + " ";
                                    bm = bm + str2[i] + " ";
                                }
                            }
                            if (StringUtil.isEmptyOrNull(bmdm)) {
                                hlhtRyjlJbxx.setQzzyzhdm("NA");
                            } else {
                                hlhtRyjlJbxx.setQzzyzhdm(bmdm);
                            }
                            if (StringUtil.isEmptyOrNull(bm)) {
                                hlhtRyjlJbxx.setQzzyzhmc("NA");
                            } else {
                                hlhtRyjlJbxx.setQzzyzhmc(bm);
                            }
                        }

                        this.hlhtRyjlJbxxDao.insertHlhtRyjlJbxx(hlhtRyjlJbxx);

                        mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                                Long.parseLong(Constants.WN_RYJL_JBXX_SOURCE_TYPE),
                                emrQtbljlk.getQtbljlxh(), emrQtbljlk.getBlmc(),emrQtbljlk.getSyxh()+"",
                                new Timestamp(DateUtil.parse(emrQtbljlk.getFssj(),DateUtil.PATTERN_19).getTime()),
                                hlhtRyjlJbxx.getPatid(),hlhtRyjlJbxx.getZyh(),hlhtRyjlJbxx.getHzxm(),hlhtRyjlJbxx.getXbmc(),hlhtRyjlJbxx.getXbdm(),
                                hlhtRyjlJbxx.getKsmc(), hlhtRyjlJbxx.getKsdm(),   hlhtRyjlJbxx.getBqmc(),hlhtRyjlJbxx.getBqdm(), hlhtRyjlJbxx.getSfzhm()));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    real_count++;
                }
            }
        }
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count, real_count, Integer.parseInt(Constants.WN_RYJL_JBXX_SOURCE_TYPE));

        return mbzDataChecks;
    }

    @Override
    public void deleteHlhtRyjlJbxxByYjlxh(HlhtRyjlJbxx hlhtRyjlJbxx) {
        this.hlhtRyjlJbxxDao.deleteHlhtRyjlJbxxByYjlxh(hlhtRyjlJbxx);
    }
}