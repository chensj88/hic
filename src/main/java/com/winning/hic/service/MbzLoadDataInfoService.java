package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.MbzLoadDataInfo;  


/**
* @author HLHT
* @title 【抽取数据明细数据】服务接口
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-24-10 15:24:35
*/
public interface MbzLoadDataInfoService {

    public int createMbzLoadDataInfo(MbzLoadDataInfo mbzLoadDataInfo);

    public int modifyMbzLoadDataInfo(MbzLoadDataInfo mbzLoadDataInfo);

    public int removeMbzLoadDataInfo(MbzLoadDataInfo mbzLoadDataInfo);

    public MbzLoadDataInfo getMbzLoadDataInfo(MbzLoadDataInfo mbzLoadDataInfo);

    public int getMbzLoadDataInfoCount(MbzLoadDataInfo mbzLoadDataInfo);

    public List<MbzLoadDataInfo> getMbzLoadDataInfoList(MbzLoadDataInfo mbzLoadDataInfo);

    public List<MbzLoadDataInfo> getMbzLoadDataInfoPageList(MbzLoadDataInfo mbzLoadDataInfo);
}