package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtLog;  


/**
* @author HLHT
* @title HLHT_LOG
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-55-24 13:55:08
*/
public interface HlhtLogService {

    public int createHlhtLog(HlhtLog hlhtLog);

    public int modifyHlhtLog(HlhtLog hlhtLog);

    public int removeHlhtLog(HlhtLog hlhtLog);

    public HlhtLog getHlhtLog(HlhtLog hlhtLog);

    public int getHlhtLogCount(HlhtLog hlhtLog);

    public List<HlhtLog> getHlhtLogList(HlhtLog hlhtLog);

    public List<HlhtLog> getHlhtLogPageList(HlhtLog hlhtLog);
}