package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtRyjlRyswjlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtRyjlRyswjlService;
import com.winning.hic.service.MbzDataCheckService;
import org.dom4j.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
* @title HLHT_RYJL_RYSWJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-30-31 16:30:41
*/
@Service
public class HlhtRyjlRyswjlServiceImpl implements  HlhtRyjlRyswjlService {

    private static final Logger logger = LoggerFactory.getLogger(HlhtRyjlRyswjlServiceImpl.class);

    @Autowired
    private HlhtRyjlRyswjlDao hlhtRyjlRyswjlDao;
    @Autowired
    private CommonQueryDao commonQueryDao;
    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;
    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;
    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;

    @Autowired
    private MbzDataCheckService mbzDataCheckService;

    public int createHlhtRyjlRyswjl(HlhtRyjlRyswjl hlhtRyjlRyswjl){
        return this.hlhtRyjlRyswjlDao.insertHlhtRyjlRyswjl(hlhtRyjlRyswjl);
    }

    public int modifyHlhtRyjlRyswjl(HlhtRyjlRyswjl hlhtRyjlRyswjl){
        return this.hlhtRyjlRyswjlDao.updateHlhtRyjlRyswjl(hlhtRyjlRyswjl);
    }

    public int removeHlhtRyjlRyswjl(HlhtRyjlRyswjl hlhtRyjlRyswjl){
        return this.hlhtRyjlRyswjlDao.deleteHlhtRyjlRyswjl(hlhtRyjlRyswjl);
    }

    public HlhtRyjlRyswjl getHlhtRyjlRyswjl(HlhtRyjlRyswjl hlhtRyjlRyswjl){
        return this.hlhtRyjlRyswjlDao.selectHlhtRyjlRyswjl(hlhtRyjlRyswjl);
    }

    public int getHlhtRyjlRyswjlCount(HlhtRyjlRyswjl hlhtRyjlRyswjl){
        return (Integer)this.hlhtRyjlRyswjlDao.selectHlhtRyjlRyswjlCount(hlhtRyjlRyswjl);
    }

    public List<HlhtRyjlRyswjl> getHlhtRyjlRyswjlList(HlhtRyjlRyswjl hlhtRyjlRyswjl){
        return this.hlhtRyjlRyswjlDao.selectHlhtRyjlRyswjlList(hlhtRyjlRyswjl);
    }

    public List<HlhtRyjlRyswjl> getHlhtRyjlRyswjlPageList(HlhtRyjlRyswjl hlhtRyjlRyswjl){
        return this.hlhtRyjlRyswjlDao.selectHlhtRyjlRyswjlPageList(hlhtRyjlRyswjl);
    }

    public HlhtRyjlRyswjl getInitHlhtRyjlRyswjl(HlhtRyjlRyswjl hlhtRyjlRyswjl){
        return this.commonQueryDao.selectInitHlhtRyjlRyswjl(hlhtRyjlRyswjl);
    }
    public List<MbzDataCheck> interfaceHlhtRyjlRyswjl(MbzDataCheck entity) throws Exception {
        //加载模板库 根据模板类型获取对应的病历模板代码
        MbzDataCheck mbzDataCheck = new MbzDataCheck();
        int emr_count =0;//病历数量
        int real_count=0;//实际数量

        //加载模板字段库
        MbzDataSet  mbzDataSet = new MbzDataSet();
        mbzDataSet.setPId(Long.parseLong(Constants.WN_RYJL_RYSWJL_SOURCE_TYPE));
        mbzDataSet.setSourceType(Constants.WN_RYJL_RYSWJL_SOURCE_TYPE);
        List<MbzDataSet> mbzDataSets = mbzDataSetDao.selectMbzDataSetList(mbzDataSet);

        mbzDataSet = new MbzDataSet();
        mbzDataSet.setPId(0L);
        mbzDataSet.setSourceType(Constants.WN_RYJL_RYSWJL_SOURCE_TYPE);
        mbzDataSet = mbzDataSetDao.selectMbzDataSet(mbzDataSet);

        //获取model对象自定义参数信息
        Map<String,String> paramType = ReflectUtil.getParamTypeMap(HlhtRyjlRyswjl.class);

        HlhtRyjlRyswjl hlht = new HlhtRyjlRyswjl();
        hlht.getMap().put("sourceType",Constants.WN_RYJL_RYSWJL_SOURCE_TYPE);
        hlht.getMap().put("startDate",entity.getMap().get("startDate"));
        hlht.getMap().put("endDate",entity.getMap().get("endDate"));
        hlht.getMap().put("syxh",entity.getMap().get("syxh"));

        List<HlhtRyjlRyswjl> list = this.hlhtRyjlRyswjlDao.selectHlhtRyjlRyswjlListByProc(hlht);

        if(list != null && list.size() > 0){
            emr_count = emr_count+list.size();
            for(HlhtRyjlRyswjl obj:list){
                //获取接口数据
                HlhtRyjlRyswjl oldObj = new HlhtRyjlRyswjl();
                oldObj.setYjlxh(String.valueOf(obj.getYjlxh()));
                oldObj = getHlhtRyjlRyswjl(oldObj);
                //解析病历xml
                Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(obj.getBlnr()));
                //System.out.println(Base64Utils.unzipEmrXml(emrQtbljlk.getBlnr()));
                //判断是否存在重复,存在则删除，重新新增
                if(oldObj != null ){
                    //初始化数据
                    HlhtRyjlRyswjl oldRcyjl  = new HlhtRyjlRyswjl();
                    oldRcyjl.setYjlxh(String.valueOf(obj.getYjlxh()));
                    this.removeHlhtRyjlRyswjl(oldRcyjl);
                    //清除日志
                    Map<String,Object> param = new HashMap<>();
                    param.put("SOURCE_ID",obj.getYjlxh());
                    param.put("SOURCE_TYPE",Constants.WN_RYJL_RYSWJL_SOURCE_TYPE);
                    mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                }
                obj = (HlhtRyjlRyswjl) HicHelper.initModelValue(mbzDataSets,document,obj,paramType);
                //去除入院诊断西医病名和代码的冗余字符串
                obj.setRzxyzdbm(obj.getRzxyzdbm() == null ? "NA" : obj.getRzxyzdbm().replace("西医诊断： ", "").trim());
                obj.setRzxyzdmc(obj.getRzxyzdmc() == null ? "NA" : obj.getRzxyzdmc().replace("西医诊断： ", "").trim());
                //去除入院诊断中医病名和代码的冗余字符串
                obj.setRzzybmdm(obj.getRzzybmdm() == null ? "NA" : obj.getRzzybmdm().replace("中医诊断： ", "").trim());
                obj.setRzzybmmc(obj.getRzzybmmc() == null ? "NA" : obj.getRzzybmmc().replace("中医诊断： ", "").trim());
                //去除入院诊断中医症候和代码的冗余字符串
                obj.setRzzyzhdm(obj.getRzzyzhdm() == null ? "NA" : obj.getRzzyzhdm().replace("中医诊断： ", "").trim());
                obj.setRzzyzhmc(obj.getRzzyzhmc() == null ? "NA" : obj.getRzzyzhmc().replace("中医诊断： ", "").trim());

                //去除死亡诊断西医病名和代码的冗余字符串
                obj.setSzxyzdbm(obj.getSzxyzdbm() == null ? "NA" : obj.getSzxyzdbm().replace("西医诊断 ： ", "").trim());
                obj.setSzxyzdmc(obj.getSzxyzdmc() == null ? "NA" : obj.getSzxyzdmc().replace("西医诊断 ： ", "").trim());
                //去除死亡诊断中医病名和代码的冗余字符串
                obj.setSzzybmdm(obj.getSzzybmdm() == null ? "NA" : obj.getSzzybmdm().replace("中医 诊断 ： ", "").trim());
                obj.setSzzybmmc(obj.getSzzybmmc() == null ? "NA" : obj.getSzzybmmc().replace("中医 诊断 ： ", "").trim());
                //去除死亡诊断中医症候和代码的冗余字符串
                obj.setSzzyzhdm(obj.getSzzyzhdm() == null ? "NA" : obj.getSzzyzhdm().replace("中医 诊断 ： ", "").trim());
                obj.setSzzyzhmc(obj.getSzzyzhmc() == null ? "NA" : obj.getSzzyzhmc().replace("中医 诊断 ： ", "").trim());

                //入院诊断-中医病名代码、名称处理
                if (!"NA".equals(obj.getRzzybmdm())) {
                    String bmdm = "";
                    String bm = "";
                    String[] str = obj.getRzzybmdm().split("  ");
                    String[] str2 = obj.getRzzybmmc().split("  ");
                    Character o = new Character('B');
                    for (int i = 0; str.length > i; i++) {
                        if(!"".equals(str[i].toString())) {
                            if (o.equals(str[i].trim().charAt(0))) {
                                bmdm = bmdm + str[i].trim() + " ";
                                bm = bm + str2[i].trim() + " ";
                            }
                        }
                    }
                    if (StringUtil.isEmptyOrNull(bmdm)) {
                        obj.setRzzybmdm("NA");
                    } else {
                        obj.setRzzybmdm(bmdm);
                    }
                    if (StringUtil.isEmptyOrNull(bm)) {
                        obj.setRzzybmmc("NA");
                    } else {
                        obj.setRzzybmmc(bm);
                    }
                }

                //入院诊断-中医证候代码
                if (!"NA".equals(obj.getRzzyzhdm())) {
                    String bmdm = "";
                    String bm = "";
                    String[] str = obj.getRzzyzhdm().split("  ");
                    String[] str2 = obj.getRzzyzhmc().split("  ");
                    Character o = new Character('B');
                    for (int i = 0; str.length > i; i++) {
                        if(!"".equals(str[i].toString())) {
                            if (!o.equals(str[i].trim().charAt(0))) {
                                bmdm = bmdm + str[i].trim() + " ";
                                bm = bm + str2[i].trim() + " ";
                            }
                        }
                    }
                    if (StringUtil.isEmptyOrNull(bmdm)) {
                        obj.setRzzyzhdm("NA");
                    } else {
                        obj.setRzzyzhdm(bmdm);
                    }
                    if (StringUtil.isEmptyOrNull(bm)) {
                        obj.setRzzyzhmc("NA");
                    } else {
                        obj.setRzzyzhmc(bm);
                    }
                }

                //死亡诊断-中医病名代码、名称处理
                if (!"NA".equals(obj.getSzzybmdm())) {
                    String bmdm = "";
                    String bm = "";
                    String[] str = obj.getSzzybmdm().split("  ");
                    String[] str2 = obj.getSzzybmmc().split("  ");
                    Character o = new Character('B');
                    for (int i = 0; str.length > i; i++) {
                        if(!"".equals(str[i].toString())) {
                            if (o.equals(str[i].trim().charAt(0))) {
                                bmdm = bmdm + str[i].trim() + " ";
                                bm = bm + str2[i].trim() + " ";
                            }
                        }
                    }
                    if (StringUtil.isEmptyOrNull(bmdm)) {
                        obj.setSzzybmdm("NA");
                    } else {
                        obj.setSzzybmdm(bmdm);
                    }
                    if (StringUtil.isEmptyOrNull(bm)) {
                        obj.setSzzybmmc("NA");
                    } else {
                        obj.setSzzybmmc(bm);
                    }
                }

                //死亡诊断-中医证候代码
                if (!"NA".equals(obj.getSzzyzhdm())) {
                    String bmdm = "";
                    String bm = "";
                    String[] str = obj.getSzzyzhdm().split("  ");
                    String[] str2 = obj.getSzzyzhmc().split("  ");
                    Character o = new Character('B');
                    for (int i = 0; str.length > i; i++) {
                        if(!"".equals(str[i].toString())) {
                            if (!o.equals(str[i].trim().charAt(0))) {
                                bmdm = bmdm + str[i].trim() + " ";
                                bm = bm + str2[i].trim() + " ";
                            }
                        }
                    }
                    if (StringUtil.isEmptyOrNull(bmdm)) {
                        obj.setSzzyzhdm("NA");
                    } else {
                        obj.setSzzyzhdm(bmdm);
                    }
                    if (StringUtil.isEmptyOrNull(bm)) {
                        obj.setSzzyzhmc("NA");
                    } else {
                        obj.setSzzyzhmc(bm);
                    }
                }
                this.createHlhtRyjlRyswjl(obj);
                //插入日志
                mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                        Long.parseLong(Constants.WN_RYJL_RYSWJL_SOURCE_TYPE),
                        Long.parseLong(obj.getYjlxh()), obj.getBlmc(),obj.getSyxh()+"",
                        obj.getFssj(),
                        obj.getPatid(),obj.getZyh(),obj.getHzxm(),obj.getXbmc(),obj.getXbdm(),
                        "NA","NA",  "NA","NA", obj.getSfzhm(),
                        PercentUtil.getPercent(Long.parseLong(Constants.WN_RYJL_RYSWJL_SOURCE_TYPE), obj, 1),
                        PercentUtil.getPercent(Long.parseLong(Constants.WN_RYJL_RYSWJL_SOURCE_TYPE), obj, 0)));
                real_count++;
            }
        }else{
            logger.info("接口数据集:{}无相关的病历信息或者未配置结果集，请先书写病历信息或配置结果集",mbzDataSet.getRecordName());
        }
        /*MbzDataListSet mbzDataListSet = new MbzDataListSet();
        mbzDataListSet.setSourceType(Constants.WN_RYJL_RYSWJL_SOURCE_TYPE);
        List<MbzDataListSet> dataListSets = mbzDataListSetDao.selectMbzDataListSetList(mbzDataListSet);
        if(dataListSets != null && dataListSets.size() > 0){
            //循环配置模板信息
            for (MbzDataListSet dataListSet : dataListSets) {
                //查询病历信息
                EmrQtbljlk emrQtbljlk = new EmrQtbljlk();
                emrQtbljlk.setBldm(dataListSet.getModelCode());
                emrQtbljlk.setYxjl(1);
                emrQtbljlk.getMap().put("startDate",entity.getMap().get("startDate"));
                emrQtbljlk.getMap().put("endDate",entity.getMap().get("endDate"));
                emrQtbljlk.getMap().put("syxh",entity.getMap().get("syxh"));
                List<EmrQtbljlk> qtbljlkList = emrQtbljlkDao.selectEmrQtbljlkList(emrQtbljlk);
                emr_count = emr_count+qtbljlkList.size();
                if(qtbljlkList != null && qtbljlkList.size() > 0){
                    for (EmrQtbljlk qtbljlk : qtbljlkList) {
                        HlhtRyjlRyswjl obj = new HlhtRyjlRyswjl();
                        obj.setYjlxh(String.valueOf(qtbljlk.getQtbljlxh()));
                        obj = this.getHlhtRyjlRyswjl(obj);
                        //解析病历报文xml
                        Document document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(qtbljlk.getBlnr()));
                        System.out.println(Base64Utils.unzipEmrXml(qtbljlk.getBlnr()));
                        if(obj != null ){ //判断记录是否已经创建,存在则删除，重新新增
                            HlhtRyjlRyswjl oldRyswjl = new HlhtRyjlRyswjl();
                            oldRyswjl.setYjlxh(String.valueOf(qtbljlk.getQtbljlxh()));
                            this.removeHlhtRyjlRyswjl(oldRyswjl);

                            //清除日志
                            Map<String,Object> param = new HashMap<>();
                            param.put("SOURCE_ID",emrQtbljlk.getQtbljlxh());
                            param.put("SOURCE_TYPE",Constants.WN_RYJL_RYSWJL_SOURCE_TYPE);
                            mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                        }
                        obj = new HlhtRyjlRyswjl();
                        obj.setYjlxh(String.valueOf(qtbljlk.getQtbljlxh()));
                        obj = this.commonQueryDao.selectInitHlhtRyjlRyswjl(obj);
                        obj = (HlhtRyjlRyswjl) HicHelper.initModelValue(mbzDataSets,document,obj,paramType);

                        //去除入院诊断西医病名和代码的冗余字符串
                        obj.setRzxyzdbm(obj.getRzxyzdbm() == null ? "NA" : obj.getRzxyzdbm().replace("西医诊断： ", "").trim());
                        obj.setRzxyzdmc(obj.getRzxyzdmc() == null ? "NA" : obj.getRzxyzdmc().replace("西医诊断： ", "").trim());
                        //去除入院诊断中医病名和代码的冗余字符串
                        obj.setRzzybmdm(obj.getRzzybmdm() == null ? "NA" : obj.getRzzybmdm().replace("中医诊断： ", "").trim());
                        obj.setRzzybmmc(obj.getRzzybmmc() == null ? "NA" : obj.getRzzybmmc().replace("中医诊断： ", "").trim());
                        //去除入院诊断中医症候和代码的冗余字符串
                        obj.setRzzyzhdm(obj.getRzzyzhdm() == null ? "NA" : obj.getRzzyzhdm().replace("中医诊断： ", "").trim());
                        obj.setRzzyzhmc(obj.getRzzyzhmc() == null ? "NA" : obj.getRzzyzhmc().replace("中医诊断： ", "").trim());

                        //去除死亡诊断西医病名和代码的冗余字符串
                        obj.setSzxyzdbm(obj.getSzxyzdbm() == null ? "NA" : obj.getSzxyzdbm().replace("西医诊断 ： ", "").trim());
                        obj.setSzxyzdmc(obj.getSzxyzdmc() == null ? "NA" : obj.getSzxyzdmc().replace("西医诊断 ： ", "").trim());
                        //去除死亡诊断中医病名和代码的冗余字符串
                        obj.setSzzybmdm(obj.getSzzybmdm() == null ? "NA" : obj.getSzzybmdm().replace("中医 诊断 ： ", "").trim());
                        obj.setSzzybmmc(obj.getSzzybmmc() == null ? "NA" : obj.getSzzybmmc().replace("中医 诊断 ： ", "").trim());
                        //去除死亡诊断中医症候和代码的冗余字符串
                        obj.setSzzyzhdm(obj.getSzzyzhdm() == null ? "NA" : obj.getSzzyzhdm().replace("中医 诊断 ： ", "").trim());
                        obj.setSzzyzhmc(obj.getSzzyzhmc() == null ? "NA" : obj.getSzzyzhmc().replace("中医 诊断 ： ", "").trim());

                        //入院诊断-中医病名代码、名称处理
                        if (!"NA".equals(obj.getRzzybmdm())) {
                            String bmdm = "";
                            String bm = "";
                            String[] str = obj.getRzzybmdm().split("  ");
                            String[] str2 = obj.getRzzybmmc().split("  ");
                            Character o = new Character('B');
                            for (int i = 0; str.length > i; i++) {
                                if(!"".equals(str[i].toString())) {
                                    if (o.equals(str[i].trim().charAt(0))) {
                                        bmdm = bmdm + str[i].trim() + " ";
                                        bm = bm + str2[i].trim() + " ";
                                    }
                                }
                            }
                            if (StringUtil.isEmptyOrNull(bmdm)) {
                                obj.setRzzybmdm("NA");
                            } else {
                                obj.setRzzybmdm(bmdm);
                            }
                            if (StringUtil.isEmptyOrNull(bm)) {
                                obj.setRzzybmmc("NA");
                            } else {
                                obj.setRzzybmmc(bm);
                            }
                        }

                        //入院诊断-中医证候代码
                        if (!"NA".equals(obj.getRzzyzhdm())) {
                            String bmdm = "";
                            String bm = "";
                            String[] str = obj.getRzzyzhdm().split("  ");
                            String[] str2 = obj.getRzzyzhmc().split("  ");
                            Character o = new Character('B');
                            for (int i = 0; str.length > i; i++) {
                                if(!"".equals(str[i].toString())) {
                                    if (!o.equals(str[i].trim().charAt(0))) {
                                        bmdm = bmdm + str[i].trim() + " ";
                                        bm = bm + str2[i].trim() + " ";
                                    }
                                }
                            }
                            if (StringUtil.isEmptyOrNull(bmdm)) {
                                obj.setRzzyzhdm("NA");
                            } else {
                                obj.setRzzyzhdm(bmdm);
                            }
                            if (StringUtil.isEmptyOrNull(bm)) {
                                obj.setRzzyzhmc("NA");
                            } else {
                                obj.setRzzyzhmc(bm);
                            }
                        }

                        //死亡诊断-中医病名代码、名称处理
                        if (!"NA".equals(obj.getSzzybmdm())) {
                            String bmdm = "";
                            String bm = "";
                            String[] str = obj.getSzzybmdm().split("  ");
                            String[] str2 = obj.getSzzybmmc().split("  ");
                            Character o = new Character('B');
                            for (int i = 0; str.length > i; i++) {
                                if(!"".equals(str[i].toString())) {
                                    if (o.equals(str[i].trim().charAt(0))) {
                                        bmdm = bmdm + str[i].trim() + " ";
                                        bm = bm + str2[i].trim() + " ";
                                    }
                                }
                            }
                            if (StringUtil.isEmptyOrNull(bmdm)) {
                                obj.setSzzybmdm("NA");
                            } else {
                                obj.setSzzybmdm(bmdm);
                            }
                            if (StringUtil.isEmptyOrNull(bm)) {
                                obj.setSzzybmmc("NA");
                            } else {
                                obj.setSzzybmmc(bm);
                            }
                        }

                        //死亡诊断-中医证候代码
                        if (!"NA".equals(obj.getSzzyzhdm())) {
                            String bmdm = "";
                            String bm = "";
                            String[] str = obj.getSzzyzhdm().split("  ");
                            String[] str2 = obj.getSzzyzhmc().split("  ");
                            Character o = new Character('B');
                            for (int i = 0; str.length > i; i++) {
                                if(!"".equals(str[i].toString())) {
                                    if (!o.equals(str[i].trim().charAt(0))) {
                                        bmdm = bmdm + str[i].trim() + " ";
                                        bm = bm + str2[i].trim() + " ";
                                    }
                                }
                            }
                            if (StringUtil.isEmptyOrNull(bmdm)) {
                                obj.setSzzyzhdm("NA");
                            } else {
                                obj.setSzzyzhdm(bmdm);
                            }
                            if (StringUtil.isEmptyOrNull(bm)) {
                                obj.setSzzyzhmc("NA");
                            } else {
                                obj.setSzzyzhmc(bm);
                            }
                        }
                        this.createHlhtRyjlRyswjl(obj);

                        //插入日志
                        mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                                Long.parseLong(Constants.WN_RYJL_RYSWJL_SOURCE_TYPE),
                                qtbljlk.getQtbljlxh(), qtbljlk.getBlmc(),qtbljlk.getSyxh()+"",
                                new Timestamp(DateUtil.parse(qtbljlk.getFssj(),DateUtil.PATTERN_19).getTime()),
                                obj.getPatid(),obj.getZyh(),obj.getHzxm(),obj.getXbmc(),obj.getXbdm(),
                                "NA","NA",  "NA","NA", obj.getSfzhm()));
                        real_count++;
                    }
                }else {
                    logger.info("接口数据集:{}无相关的病历信息，请先书写病历信息",mbzDataSet.getRecordName());
                }
            }
        }else {
            logger.info("接口数据集:{}未配置关联病历模板，请配置接口数据集关联病历模板",mbzDataSet.getRecordName());
        }*/
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count,real_count,Integer.parseInt(Constants.WN_RYJL_RYSWJL_SOURCE_TYPE),entity);

         return  null;
    }


}