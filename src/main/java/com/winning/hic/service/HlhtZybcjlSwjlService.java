package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtZybcjlSwjl;  


/**
* @author HLHT
* @title HLHT_ZYBCJL_SWJL
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-34-31 16:34:47
*/
public interface HlhtZybcjlSwjlService {

    public int createHlhtZybcjlSwjl(HlhtZybcjlSwjl hlhtZybcjlSwjl);

    public int modifyHlhtZybcjlSwjl(HlhtZybcjlSwjl hlhtZybcjlSwjl);

    public int removeHlhtZybcjlSwjl(HlhtZybcjlSwjl hlhtZybcjlSwjl);

    public HlhtZybcjlSwjl getHlhtZybcjlSwjl(HlhtZybcjlSwjl hlhtZybcjlSwjl);

    public int getHlhtZybcjlSwjlCount(HlhtZybcjlSwjl hlhtZybcjlSwjl);

    public List<HlhtZybcjlSwjl> getHlhtZybcjlSwjlList(HlhtZybcjlSwjl hlhtZybcjlSwjl);

    public List<HlhtZybcjlSwjl> getHlhtZybcjlSwjlPageList(HlhtZybcjlSwjl hlhtZybcjlSwjl);
}