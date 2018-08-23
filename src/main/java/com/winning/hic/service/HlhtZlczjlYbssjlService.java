package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtZlczjlYbssjl;
import com.winning.hic.model.MbzDataCheck;


/**
* @author HLHT
* @title HLHT_ZLCZJL_YBSSJL
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-31-31 16:31:59
*/
public interface HlhtZlczjlYbssjlService {

    public int createHlhtZlczjlYbssjl(HlhtZlczjlYbssjl hlhtZlczjlYbssjl);

    public int modifyHlhtZlczjlYbssjl(HlhtZlczjlYbssjl hlhtZlczjlYbssjl);

    public int removeHlhtZlczjlYbssjl(HlhtZlczjlYbssjl hlhtZlczjlYbssjl);

    public HlhtZlczjlYbssjl getHlhtZlczjlYbssjl(HlhtZlczjlYbssjl hlhtZlczjlYbssjl);

    public int getHlhtZlczjlYbssjlCount(HlhtZlczjlYbssjl hlhtZlczjlYbssjl);

    public List<HlhtZlczjlYbssjl> getHlhtZlczjlYbssjlList(HlhtZlczjlYbssjl hlhtZlczjlYbssjl);

    public List<HlhtZlczjlYbssjl> getHlhtZlczjlYbssjlPageList(HlhtZlczjlYbssjl hlhtZlczjlYbssjl);

    List<MbzDataCheck> interfaceHlhtZlczjlYbssjl(MbzDataCheck t);
}