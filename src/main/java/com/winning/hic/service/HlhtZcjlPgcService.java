package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtZcjlPgc;
import com.winning.hic.model.MbzDataCheck;


/**
* @author HLHT
* @title HLHT_ZCJL_PGC
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-30-31 16:30:59
*/
public interface HlhtZcjlPgcService {

    public int createHlhtZcjlPgc(HlhtZcjlPgc hlhtZcjlPgc);

    public int modifyHlhtZcjlPgc(HlhtZcjlPgc hlhtZcjlPgc);

    public int removeHlhtZcjlPgc(HlhtZcjlPgc hlhtZcjlPgc);

    public HlhtZcjlPgc getHlhtZcjlPgc(HlhtZcjlPgc hlhtZcjlPgc);

    public int getHlhtZcjlPgcCount(HlhtZcjlPgc hlhtZcjlPgc);

    public List<HlhtZcjlPgc> getHlhtZcjlPgcList(HlhtZcjlPgc hlhtZcjlPgc);

    public List<HlhtZcjlPgc> getHlhtZcjlPgcPageList(HlhtZcjlPgc hlhtZcjlPgc);

    List<MbzDataCheck> interfaceHlhtZcjlPgc(MbzDataCheck t);
}