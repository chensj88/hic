package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtDataCheck;  


/**
* @author HLHT
* @title HLHT_DATA_CHECK
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-55-24 13:55:05
*/
public interface HlhtDataCheckService {

    public int createHlhtDataCheck(HlhtDataCheck hlhtDataCheck);

    public int modifyHlhtDataCheck(HlhtDataCheck hlhtDataCheck);

    public int removeHlhtDataCheck(HlhtDataCheck hlhtDataCheck);

    public HlhtDataCheck getHlhtDataCheck(HlhtDataCheck hlhtDataCheck);

    public int getHlhtDataCheckCount(HlhtDataCheck hlhtDataCheck);

    public List<HlhtDataCheck> getHlhtDataCheckList(HlhtDataCheck hlhtDataCheck);

    public List<HlhtDataCheck> getHlhtDataCheckPageList(HlhtDataCheck hlhtDataCheck);
}