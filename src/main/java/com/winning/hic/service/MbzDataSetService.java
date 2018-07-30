package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.MbzDataSet;


/**
* @author HLHT
* @title 基础数据配置表服务接口
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-24-26 09:24:07
*/
public interface MbzDataSetService {

    public int createMbzDataSet(MbzDataSet hlhtDataSet);

    public int modifyMbzDataSet(MbzDataSet hlhtDataSet);

    public int removeMbzDataSet(MbzDataSet hlhtDataSet);

    public MbzDataSet getMbzDataSet(MbzDataSet hlhtDataSet);

    public int getMbzDataSetCount(MbzDataSet hlhtDataSet);

    public List<MbzDataSet> getMbzDataSetList(MbzDataSet hlhtDataSet);

    public List<MbzDataSet> getMbzDataSetPageList(MbzDataSet hlhtDataSet);
}