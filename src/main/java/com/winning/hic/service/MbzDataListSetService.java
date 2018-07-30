package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.MbzDataListSet;


/**
* @author MBZ
* @title MBZ_DATA_LIST_SET
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-23-25 12:23:50
*/
public interface MbzDataListSetService {

    public int createMbzDataListSet(MbzDataListSet mbzDataListSet);

    public int modifyMbzDataListSet(MbzDataListSet mbzDataListSet);

    public int removeMbzDataListSet(MbzDataListSet mbzDataListSet);

    public MbzDataListSet getMbzDataListSet(MbzDataListSet mbzDataListSet);

    public int getMbzDataListSetCount(MbzDataListSet mbzDataListSet);

    public List<MbzDataListSet> getMbzDataListSetList(MbzDataListSet mbzDataListSet);

    public List<MbzDataListSet> getMbzDataListSetPageList(MbzDataListSet mbzDataListSet);

    public void createMbzDataListSetForList(List<MbzDataListSet> mbzDataListSetList);

    List<String> getMbzDataListSetModelCodeList(MbzDataListSet mbzDataListSet);
}