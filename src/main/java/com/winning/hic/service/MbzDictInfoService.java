package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.MbzDictInfo;


/**
* @author MBZ
* @title 【字典表】服务接口
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-23-25 12:23:53
*/
public interface MbzDictInfoService {

    public int createMbzDictInfo(MbzDictInfo mbzDictInfo);

    public int modifyMbzDictInfo(MbzDictInfo mbzDictInfo);

    public int removeMbzDictInfo(MbzDictInfo mbzDictInfo);

    public MbzDictInfo getMbzDictInfo(MbzDictInfo mbzDictInfo);

    public int getMbzDictInfoCount(MbzDictInfo mbzDictInfo);

    public List<MbzDictInfo> getMbzDictInfoList(MbzDictInfo mbzDictInfo);

    public List<MbzDictInfo> getMbzDictInfoPageList(MbzDictInfo mbzDictInfo);
}