package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtZybcjlQjjl;
import com.winning.hic.model.MbzDataCheck;


/**
* @author HLHT
* @title HLHT_ZYBCJL_QJJL
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-33-31 16:33:49
*/
public interface HlhtZybcjlQjjlService {

    public int createHlhtZybcjlQjjl(HlhtZybcjlQjjl hlhtZybcjlQjjl);

    public int modifyHlhtZybcjlQjjl(HlhtZybcjlQjjl hlhtZybcjlQjjl);

    public int removeHlhtZybcjlQjjl(HlhtZybcjlQjjl hlhtZybcjlQjjl);

    public HlhtZybcjlQjjl getHlhtZybcjlQjjl(HlhtZybcjlQjjl hlhtZybcjlQjjl);

    public int getHlhtZybcjlQjjlCount(HlhtZybcjlQjjl hlhtZybcjlQjjl);

    public List<HlhtZybcjlQjjl> getHlhtZybcjlQjjlList(HlhtZybcjlQjjl hlhtZybcjlQjjl);

    public List<HlhtZybcjlQjjl> getHlhtZybcjlQjjlPageList(HlhtZybcjlQjjl hlhtZybcjlQjjl);

    public List<MbzDataCheck> interfaceHlhtZybcjlQjjl(MbzDataCheck t);
}