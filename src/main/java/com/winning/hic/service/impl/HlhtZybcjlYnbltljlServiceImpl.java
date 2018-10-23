package com.winning.hic.service.impl;

import com.winning.hic.base.Constants;
import com.winning.hic.base.utils.*;
import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.dao.data.HlhtZybcjlYnbltljlDao;
import com.winning.hic.dao.data.MbzDataListSetDao;
import com.winning.hic.dao.data.MbzDataSetDao;
import com.winning.hic.dao.data.MbzLoadDataInfoDao;
import com.winning.hic.model.*;
import com.winning.hic.service.HlhtZybcjlYnbltljlService;
import com.winning.hic.service.MbzDataCheckService;
import org.dom4j.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author HLHT
 * @title HLHT_ZYBCJL_YNBLTLJL
 * @email Winning Health
 * @package com.winning.hic.service.impl
 * @date 2018-34-31 16:34:53
 */
@Service
public class HlhtZybcjlYnbltljlServiceImpl implements HlhtZybcjlYnbltljlService {
    private final Logger logger = LoggerFactory.getLogger(HlhtZybcjlYnbltljlServiceImpl.class);
    @Autowired
    private CommonQueryDao commonQueryDao;
    @Autowired
    private MbzDataListSetDao mbzDataListSetDao;
    @Autowired
    private MbzDataSetDao mbzDataSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    @Autowired
    private HlhtZybcjlYnbltljlDao hlhtZybcjlYnbltljlDao;
    @Autowired
    private MbzDataCheckService mbzDataCheckService;
    @Autowired
    private MbzLoadDataInfoDao mbzLoadDataInfoDao;

    public int createHlhtZybcjlYnbltljl(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl) {
        return this.hlhtZybcjlYnbltljlDao.insertHlhtZybcjlYnbltljl(hlhtZybcjlYnbltljl);
    }

    public int modifyHlhtZybcjlYnbltljl(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl) {
        return this.hlhtZybcjlYnbltljlDao.updateHlhtZybcjlYnbltljl(hlhtZybcjlYnbltljl);
    }

    public int removeHlhtZybcjlYnbltljl(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl) {
        return this.hlhtZybcjlYnbltljlDao.deleteHlhtZybcjlYnbltljl(hlhtZybcjlYnbltljl);
    }

    public HlhtZybcjlYnbltljl getHlhtZybcjlYnbltljl(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl) {
        return this.hlhtZybcjlYnbltljlDao.selectHlhtZybcjlYnbltljl(hlhtZybcjlYnbltljl);
    }

    public int getHlhtZybcjlYnbltljlCount(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl) {
        return (Integer) this.hlhtZybcjlYnbltljlDao.selectHlhtZybcjlYnbltljlCount(hlhtZybcjlYnbltljl);
    }

    public List<HlhtZybcjlYnbltljl> getHlhtZybcjlYnbltljlList(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl) {
        return this.hlhtZybcjlYnbltljlDao.selectHlhtZybcjlYnbltljlList(hlhtZybcjlYnbltljl);
    }

    public List<HlhtZybcjlYnbltljl> getHlhtZybcjlYnbltljlPageList(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl) {
        return this.hlhtZybcjlYnbltljlDao.selectHlhtZybcjlYnbltljlPageList(hlhtZybcjlYnbltljl);
    }

    @Override
    public List<HlhtZybcjlYnbltljl> getHlhtZybcjlYnbltljlListFromBaseData(EmrQtbljlk emrQtbljlk) throws DataAccessException {
        return this.commonQueryDao.getHlhtZybcjlYnbltljlListFromBaseData(emrQtbljlk);
    }

    @Override
    public void deleteHlhtZybcjlYnbltljlByYjlxh(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl) {
        this.hlhtZybcjlYnbltljlDao.deleteHlhtZybcjlYnbltljlByYjlxh(hlhtZybcjlYnbltljl);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZybcjlYnbltljl(MbzDataCheck t) {
        //执行过程信息记录
        List<MbzDataCheck> mbzDataChecks = null;
        int emr_count = 0;//病历数量
        int real_count = 0;//实际数量

        MbzDataSet mbzDataSet = new MbzDataSet();
        mbzDataSet.setSourceType(Constants.WN_ZYBCJL_YNBLTLJL_SOURCE_TYPE);
        mbzDataSet.setPId(Long.parseLong(Constants.WN_ZYBCJL_YNBLTLJL_SOURCE_TYPE));
        List<MbzDataSet> mbzDataSetList = this.mbzDataSetDao.selectMbzDataSetList(mbzDataSet);
        HlhtZybcjlYnbltljl hlhtZybcjlYnbltljlTemp = new HlhtZybcjlYnbltljl();
        hlhtZybcjlYnbltljlTemp.getMap().put("sourceType",Constants.WN_ZYBCJL_YNBLTLJL_SOURCE_TYPE);
        hlhtZybcjlYnbltljlTemp.getMap().put("startDate", t.getMap().get("startDate"));
        hlhtZybcjlYnbltljlTemp.getMap().put("endDate", t.getMap().get("endDate"));
        hlhtZybcjlYnbltljlTemp.getMap().put("syxh", t.getMap().get("syxh"));

        //2.根据模板代码去找到对应的病人病历
        List<HlhtZybcjlYnbltljl> hlhtZybcjlYnbltljlList = this.hlhtZybcjlYnbltljlDao.selectHlhtZybcjlYnbltljlListByProc(hlhtZybcjlYnbltljlTemp);

        if (hlhtZybcjlYnbltljlList != null) {
            emr_count = emr_count + hlhtZybcjlYnbltljlList.size();
            for (HlhtZybcjlYnbltljl obj : hlhtZybcjlYnbltljlList) {
                //清库
                HlhtZybcjlYnbltljl temp = new HlhtZybcjlYnbltljl();
                temp.setYjlxh(obj.getYjlxh());
                this.hlhtZybcjlYnbltljlDao.deleteHlhtZybcjlYnbltljlByYjlxh(temp);
                //清除日志
                Map<String, Object> param = new HashMap<>();
                param.put("SOURCE_ID", obj.getYjlxh());
                param.put("SOURCE_TYPE", Constants.WN_ZYBCJL_YNBLTLJL_SOURCE_TYPE);
                mbzLoadDataInfoDao.deleteMbzLoadDataInfoBySourceIdAndSourceType(param);
                //3.xml文件解析 获取病历信息
                Document document = null;
                try {
                    document = XmlUtil.getDocument(Base64Utils.unzipEmrXml(obj.getBlnr()));
                } catch (IOException e) {
                    e.printStackTrace();
                }
                Map<String, String> paramTypeMap = ReflectUtil.getParamTypeMap(HlhtZybcjlYnbltljl.class);
                try {
                    obj = (HlhtZybcjlYnbltljl) HicHelper.initModelValue(mbzDataSetList, document, obj, paramTypeMap);
                    logger.info("Model:{}", obj);
                    String zcrxm = obj.getZcrxm();
                    zcrxm = zcrxm.replace(" ","");
                    zcrxm = zcrxm.replace("副主任医师","");
                    zcrxm = zcrxm.replace("副主治医师","");
                    zcrxm = zcrxm.replace("主任医师","");
                    zcrxm = zcrxm.replace("主治医师","");
                    obj.setZcrxm(zcrxm);
                    obj.setZcrbm(zcrxm);
                    String cjtlmd = obj.getCjtlrmd();
                    cjtlmd = cjtlmd.replace(" ","");
                    cjtlmd = cjtlmd.replace("副主任医师","");
                    cjtlmd = cjtlmd.replace("副主治医师","");
                    cjtlmd = cjtlmd.replace("副住院医师","");
                    cjtlmd = cjtlmd.replace("住院医师","");
                    cjtlmd = cjtlmd.replace("主任医师","");
                    cjtlmd = cjtlmd.replace("主治医师","");
                    cjtlmd = cjtlmd.replace("规培医师","");
                    cjtlmd = cjtlmd.replace("护士长","");
                    cjtlmd = cjtlmd.replace("实习医师","");
                    cjtlmd = cjtlmd.replace("基地医师及研究生","");
                    cjtlmd = cjtlmd.replace("、全体基地与全体","");
                    cjtlmd = cjtlmd.replace("及各位基地医生","");
                    cjtlmd = cjtlmd.replace("，全体及研究生","");
                    cjtlmd = cjtlmd.replace("全体及研究生","");
                    cjtlmd = cjtlmd.replace("等基地","");
                    cjtlmd = cjtlmd.replace("基地医生：","");
                    cjtlmd = cjtlmd.replace("及规培基地医生。","");
                    cjtlmd = cjtlmd.replace("，全体基地及","");
                    cjtlmd = cjtlmd.replace("，基地医师等 ","");
                    cjtlmd = cjtlmd.replace("、基地医师、","");
                    cjtlmd = cjtlmd.replace("住院医生","");
                    cjtlmd = cjtlmd.replace("主任医生","");
                    cjtlmd = cjtlmd.replace("主治医生","");
                    cjtlmd = cjtlmd.replace("规培医生","");

                    cjtlmd = cjtlmd.replace("责任护士","");
                    cjtlmd = cjtlmd.replace("护士长","");
                    cjtlmd = cjtlmd.replace("实习医师","");
                    cjtlmd = cjtlmd.replace(",基地和全体","");
                    cjtlmd = cjtlmd.replace(",全体基地,及研究生","");
                    cjtlmd = cjtlmd.replace(",基地医师等","");
                    cjtlmd = cjtlmd.replace("及全体实习生",",");
                    cjtlmd = cjtlmd.replace(",全体进修及基地医师",",");
                    cjtlmd = cjtlmd.replace("管护师",",");
                    cjtlmd = cjtlmd.replace("及全体规培及研究生。",",");
                    cjtlmd = cjtlmd.replace(",全体进修及基地医师",",");
                    cjtlmd = cjtlmd.replace("及全体规培及研究生。",",");
                    cjtlmd = cjtlmd.replace(",全体基地和实习同学",",");
                    cjtlmd = cjtlmd.replace("、",",");
                    cjtlmd = cjtlmd.replace("，",",");
                    cjtlmd = cjtlmd.replace(",,",",");
                    obj.setCjtlrmd(cjtlmd);
                    obj.setTlrybm(cjtlmd);
                    this.hlhtZybcjlYnbltljlDao.insertHlhtZybcjlYnbltljl(obj);
                    mbzLoadDataInfoDao.insertMbzLoadDataInfo(new MbzLoadDataInfo(
                            Long.parseLong(Constants.WN_ZYBCJL_YNBLTLJL_SOURCE_TYPE),
                            Long.parseLong(obj.getYjlxh()), obj.getBlmc(), obj.getSyxh() + "",
                            obj.getFssj(),
                            obj.getPatid(), obj.getZyh(), obj.getHzxm(), obj.getXbmc(), obj.getXbdm(),
                            obj.getKsmc(), obj.getKsdm(), obj.getBqmc(), obj.getBqdm(), obj.getSfzhm(),
                            PercentUtil.getPercent(Long.parseLong(Constants.WN_ZYBCJL_YNBLTLJL_SOURCE_TYPE), obj, 1),
                            PercentUtil.getPercent(Long.parseLong(Constants.WN_ZYBCJL_YNBLTLJL_SOURCE_TYPE), obj, 0)));
                } catch (ParseException e) {
                    e.printStackTrace();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                real_count++;

            }
        }
        //1.病历总数 2.抽取的病历数量 3.子集类型
        this.mbzDataCheckService.createMbzDataCheckNum(emr_count, real_count, Integer.parseInt(Constants.WN_ZYBCJL_YNBLTLJL_SOURCE_TYPE),t);

        return mbzDataChecks;
    }
}