package com.winning.hic.service.impl;

import com.winning.hic.base.utils.StringUtil;
import com.winning.hic.dao.cisdb.EmrQtbljlkDao;
import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.model.NodeTree;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.MbzDataSet;

import com.winning.hic.dao.data.MbzDataSetDao;

import com.winning.hic.service.MbzDataSetService;


/**
* @author MBZ
* @title 基础数据配置表服务接口
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-24-26 09:24:07
*/
@Service
public class MbzDataSetServiceImpl implements  MbzDataSetService {

    @Autowired
    private MbzDataSetDao mbzDataSetDao;

    @Autowired
    private EmrQtbljlkDao emrQtbljlkDao;

    public int createMbzDataSet(MbzDataSet mbzDataSet){
        return this.mbzDataSetDao.insertMbzDataSet(mbzDataSet);
    }

    public int modifyMbzDataSet(MbzDataSet mbzDataSet){
        return this.mbzDataSetDao.updateMbzDataSet(mbzDataSet);
    }

    public int removeMbzDataSet(MbzDataSet mbzDataSet){
        return this.mbzDataSetDao.deleteMbzDataSet(mbzDataSet);
    }

    public MbzDataSet getMbzDataSet(MbzDataSet mbzDataSet){
        return this.mbzDataSetDao.selectMbzDataSet(mbzDataSet);
    }

    public int getMbzDataSetCount(MbzDataSet mbzDataSet){
        return (Integer)this.mbzDataSetDao.selectMbzDataSetCount(mbzDataSet);
    }

    public List<MbzDataSet> getMbzDataSetList(MbzDataSet mbzDataSet){
        return this.mbzDataSetDao.selectMbzDataSetList(mbzDataSet);
    }

    public List<MbzDataSet> getMbzDataSetPageList(MbzDataSet mbzDataSet){
        return this.mbzDataSetDao.selectMbzDataSetPageList(mbzDataSet);
    }

    @Override
    public List<NodeTree> getNodeTreeFromMbzDataSet(MbzDataSet dataSet) {
        return this.mbzDataSetDao.selectNodeTreeFromMbzDataSet(dataSet);
    }

    public String getEmrBrzdqkCtoE(String zddm,String syxh){
        String isHanZi_str =null;
        boolean isHanZi_jz = StringUtil.isChinese(zddm);
        if(isHanZi_jz){ //将存在的汉字全部改成由EMR_BRZDQK获取值
            EmrQtbljlk changeCToE = new EmrQtbljlk();
            changeCToE.setSyxh(Integer.valueOf(syxh));
            isHanZi_str = emrQtbljlkDao.selectEmrBrzdqk(changeCToE)==null?zddm:emrQtbljlkDao.selectEmrBrzdqk(changeCToE);
        }else{
            isHanZi_str=zddm;
        }

        return isHanZi_str;
    }

}