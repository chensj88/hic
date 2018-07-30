package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.MbzLog;


/**
* @author MBZ
* @title MBZ_LOG
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-23-25 12:23:54
*/
public interface MbzLogService {

    public int createMbzLog(MbzLog mbzLog);

    public int modifyMbzLog(MbzLog mbzLog);

    public int removeMbzLog(MbzLog mbzLog);

    public MbzLog getMbzLog(MbzLog mbzLog);

    public int getMbzLogCount(MbzLog mbzLog);

    public List<MbzLog> getMbzLogList(MbzLog mbzLog);

    public List<MbzLog> getMbzLogPageList(MbzLog mbzLog);
}