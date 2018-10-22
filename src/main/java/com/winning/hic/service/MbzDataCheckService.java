package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.MbzDataCheck;  


/**
* @author HLHT
* @title MBZ_DATA_CHECK
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-34-17 13:34:32
*/
public interface MbzDataCheckService {

    public int createMbzDataCheck(MbzDataCheck mbzDataCheck);

    public int modifyMbzDataCheck(MbzDataCheck mbzDataCheck);

    public int removeMbzDataCheck(MbzDataCheck mbzDataCheck);

    public MbzDataCheck getMbzDataCheck(MbzDataCheck mbzDataCheck);

    public int getMbzDataCheckCount(MbzDataCheck mbzDataCheck);

    public List<MbzDataCheck> getMbzDataCheckList(MbzDataCheck mbzDataCheck);

    public List<MbzDataCheck> getMbzDataCheckPageList(MbzDataCheck mbzDataCheck);

    public void createMbzDataCheckNum(int count,int emr_count,int sourceType,MbzDataCheck entity);

    public void removeMbzDataCheckList(MbzDataCheck mbzDataCheck);

    public List<MbzDataCheck> getMbzDataCheckHandList(MbzDataCheck entity);
}