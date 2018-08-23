package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtZybcjlHzjl;
import com.winning.hic.model.MbzDataCheck;


/**
* @author HLHT
* @title HLHT_ZYBCJL_HZJL
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-33-31 16:33:23
*/
public interface HlhtZybcjlHzjlService {

    public int createHlhtZybcjlHzjl(HlhtZybcjlHzjl hlhtZybcjlHzjl);

    public int modifyHlhtZybcjlHzjl(HlhtZybcjlHzjl hlhtZybcjlHzjl);

    public int removeHlhtZybcjlHzjl(HlhtZybcjlHzjl hlhtZybcjlHzjl);

    public HlhtZybcjlHzjl getHlhtZybcjlHzjl(HlhtZybcjlHzjl hlhtZybcjlHzjl);

    public int getHlhtZybcjlHzjlCount(HlhtZybcjlHzjl hlhtZybcjlHzjl);

    public List<HlhtZybcjlHzjl> getHlhtZybcjlHzjlList(HlhtZybcjlHzjl hlhtZybcjlHzjl);

    public List<HlhtZybcjlHzjl> getHlhtZybcjlHzjlPageList(HlhtZybcjlHzjl hlhtZybcjlHzjl);

    public List<MbzDataCheck> interfaceHlhtZybcjlHzjl(MbzDataCheck t);
}