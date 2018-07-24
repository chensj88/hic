package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtDataSet;  


/**
* @author HLHT
* @title 基础数据配置表服务接口
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-55-24 13:55:07
*/
public interface HlhtDataSetService {

    public int createHlhtDataSet(HlhtDataSet hlhtDataSet);

    public int modifyHlhtDataSet(HlhtDataSet hlhtDataSet);

    public int removeHlhtDataSet(HlhtDataSet hlhtDataSet);

    public HlhtDataSet getHlhtDataSet(HlhtDataSet hlhtDataSet);

    public int getHlhtDataSetCount(HlhtDataSet hlhtDataSet);

    public List<HlhtDataSet> getHlhtDataSetList(HlhtDataSet hlhtDataSet);

    public List<HlhtDataSet> getHlhtDataSetPageList(HlhtDataSet hlhtDataSet);
}