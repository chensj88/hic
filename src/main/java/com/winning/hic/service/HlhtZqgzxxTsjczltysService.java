package com.winning.hic.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import com.winning.hic.model.HlhtZqgzxxTsjczltys;
import com.winning.hic.model.MbzDataCheck;


/**
* @author HLHT
* @title HLHT_ZQGZXX_TSJCZLTYS
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-32-31 16:32:57
*/
public interface HlhtZqgzxxTsjczltysService {

    public int createHlhtZqgzxxTsjczltys(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys);

    public int modifyHlhtZqgzxxTsjczltys(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys);

    public int removeHlhtZqgzxxTsjczltys(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys);

    public HlhtZqgzxxTsjczltys getHlhtZqgzxxTsjczltys(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys);

    public int getHlhtZqgzxxTsjczltysCount(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys);

    public List<HlhtZqgzxxTsjczltys> getHlhtZqgzxxTsjczltysList(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys);

    public List<HlhtZqgzxxTsjczltys> getHlhtZqgzxxTsjczltysPageList(HlhtZqgzxxTsjczltys hlhtZqgzxxTsjczltys);

    List<MbzDataCheck> interfaceHlhtZqgzxxTsjczltys(MbzDataCheck entity) throws Exception;
}