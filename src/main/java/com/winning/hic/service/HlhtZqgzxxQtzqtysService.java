package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtZqgzxxQtzqtys;
import com.winning.hic.model.MbzDataCheck;


/**
* @author HLHT
* @title HLHT_ZQGZXX_QTZQTYS
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-32-31 16:32:29
*/
public interface HlhtZqgzxxQtzqtysService {

    public int createHlhtZqgzxxQtzqtys(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys);

    public int modifyHlhtZqgzxxQtzqtys(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys);

    public int removeHlhtZqgzxxQtzqtys(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys);

    public HlhtZqgzxxQtzqtys getHlhtZqgzxxQtzqtys(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys);

    public int getHlhtZqgzxxQtzqtysCount(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys);

    public List<HlhtZqgzxxQtzqtys> getHlhtZqgzxxQtzqtysList(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys);

    public List<HlhtZqgzxxQtzqtys> getHlhtZqgzxxQtzqtysPageList(HlhtZqgzxxQtzqtys hlhtZqgzxxQtzqtys);

    List<MbzDataCheck> interfaceHlhtZqgzxxQtzqtys(MbzDataCheck t);
}