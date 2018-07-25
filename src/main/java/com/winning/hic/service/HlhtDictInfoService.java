package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtDictInfo;  


/**
* @author HLHT
* @title 【字典表】服务接口
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-23-25 12:23:53
*/
public interface HlhtDictInfoService {

    public int createHlhtDictInfo(HlhtDictInfo hlhtDictInfo);

    public int modifyHlhtDictInfo(HlhtDictInfo hlhtDictInfo);

    public int removeHlhtDictInfo(HlhtDictInfo hlhtDictInfo);

    public HlhtDictInfo getHlhtDictInfo(HlhtDictInfo hlhtDictInfo);

    public int getHlhtDictInfoCount(HlhtDictInfo hlhtDictInfo);

    public List<HlhtDictInfo> getHlhtDictInfoList(HlhtDictInfo hlhtDictInfo);

    public List<HlhtDictInfo> getHlhtDictInfoPageList(HlhtDictInfo hlhtDictInfo);
}