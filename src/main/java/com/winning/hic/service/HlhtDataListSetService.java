package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtDataListSet;  


/**
* @author HLHT
* @title HLHT_DATA_LIST_SET
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-23-25 12:23:50
*/
public interface HlhtDataListSetService {

    public int createHlhtDataListSet(HlhtDataListSet hlhtDataListSet);

    public int modifyHlhtDataListSet(HlhtDataListSet hlhtDataListSet);

    public int removeHlhtDataListSet(HlhtDataListSet hlhtDataListSet);

    public HlhtDataListSet getHlhtDataListSet(HlhtDataListSet hlhtDataListSet);

    public int getHlhtDataListSetCount(HlhtDataListSet hlhtDataListSet);

    public List<HlhtDataListSet> getHlhtDataListSetList(HlhtDataListSet hlhtDataListSet);

    public List<HlhtDataListSet> getHlhtDataListSetPageList(HlhtDataListSet hlhtDataListSet);
}