package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.MbzDataSet;
import com.winning.hic.model.NodeTree;


/**
* @author MBZ
* @title 基础数据配置表服务接口
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-24-26 09:24:07
*/
public interface MbzDataSetService {

    public int createMbzDataSet(MbzDataSet mbzDataSet);

    public int modifyMbzDataSet(MbzDataSet mbzDataSet);

    public int removeMbzDataSet(MbzDataSet mbzDataSet);

    public MbzDataSet getMbzDataSet(MbzDataSet mbzDataSet);

    public int getMbzDataSetCount(MbzDataSet mbzDataSet);

    public List<MbzDataSet> getMbzDataSetList(MbzDataSet mbzDataSet);

    public List<MbzDataSet> getMbzDataSetPageList(MbzDataSet mbzDataSet);

    public List<NodeTree> getNodeTreeFromMbzDataSet(MbzDataSet dataSet);

    public String getEmrBrzdqkCtoE(String zddm,String syxh);
}