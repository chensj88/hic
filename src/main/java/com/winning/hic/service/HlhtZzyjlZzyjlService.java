package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtZzyjlZzyjl;
import com.winning.hic.model.MbzDataCheck;


/**
* @author HLHT
* @title HLHT_ZZYJL_ZZYJL
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-35-31 16:35:09
*/
public interface HlhtZzyjlZzyjlService {

    public int createHlhtZzyjlZzyjl(HlhtZzyjlZzyjl hlhtZzyjlZzyjl);

    public int modifyHlhtZzyjlZzyjl(HlhtZzyjlZzyjl hlhtZzyjlZzyjl);

    public int removeHlhtZzyjlZzyjl(HlhtZzyjlZzyjl hlhtZzyjlZzyjl);

    public HlhtZzyjlZzyjl getHlhtZzyjlZzyjl(HlhtZzyjlZzyjl hlhtZzyjlZzyjl);

    public int getHlhtZzyjlZzyjlCount(HlhtZzyjlZzyjl hlhtZzyjlZzyjl);

    public List<HlhtZzyjlZzyjl> getHlhtZzyjlZzyjlList(HlhtZzyjlZzyjl hlhtZzyjlZzyjl);

    public List<HlhtZzyjlZzyjl> getHlhtZzyjlZzyjlPageList(HlhtZzyjlZzyjl hlhtZzyjlZzyjl);

    public List<MbzDataCheck> interfaceHlhtZzyjlZzyjl(MbzDataCheck t);
}