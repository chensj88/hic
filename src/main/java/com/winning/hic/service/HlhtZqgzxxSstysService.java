package com.winning.hic.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import com.winning.hic.model.HlhtZqgzxxSstys;
import com.winning.hic.model.MbzDataCheck;


/**
* @author HLHT
* @title HLHT_ZQGZXX_SSTYS
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-32-31 16:32:38
*/
public interface HlhtZqgzxxSstysService {

    public int createHlhtZqgzxxSstys(HlhtZqgzxxSstys hlhtZqgzxxSstys);

    public int modifyHlhtZqgzxxSstys(HlhtZqgzxxSstys hlhtZqgzxxSstys);

    public int removeHlhtZqgzxxSstys(HlhtZqgzxxSstys hlhtZqgzxxSstys);

    public HlhtZqgzxxSstys getHlhtZqgzxxSstys(HlhtZqgzxxSstys hlhtZqgzxxSstys);

    public int getHlhtZqgzxxSstysCount(HlhtZqgzxxSstys hlhtZqgzxxSstys);

    public List<HlhtZqgzxxSstys> getHlhtZqgzxxSstysList(HlhtZqgzxxSstys hlhtZqgzxxSstys);

    public List<HlhtZqgzxxSstys> getHlhtZqgzxxSstysPageList(HlhtZqgzxxSstys hlhtZqgzxxSstys);

    public List<MbzDataCheck> interfaceHlhtZqgzxxSstys(MbzDataCheck entity) throws Exception;
}