package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtZybcjlJjbjl;
import com.winning.hic.model.MbzDataCheck;


/**
* @author HLHT
* @title HLHT_ZYBCJL_JJBJL
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-33-31 16:33:41
*/
public interface HlhtZybcjlJjbjlService {

    public int createHlhtZybcjlJjbjl(HlhtZybcjlJjbjl hlhtZybcjlJjbjl);

    public int modifyHlhtZybcjlJjbjl(HlhtZybcjlJjbjl hlhtZybcjlJjbjl);

    public int removeHlhtZybcjlJjbjl(HlhtZybcjlJjbjl hlhtZybcjlJjbjl);

    public HlhtZybcjlJjbjl getHlhtZybcjlJjbjl(HlhtZybcjlJjbjl hlhtZybcjlJjbjl);

    public int getHlhtZybcjlJjbjlCount(HlhtZybcjlJjbjl hlhtZybcjlJjbjl);

    public List<HlhtZybcjlJjbjl> getHlhtZybcjlJjbjlList(HlhtZybcjlJjbjl hlhtZybcjlJjbjl);

    public List<HlhtZybcjlJjbjl> getHlhtZybcjlJjbjlPageList(HlhtZybcjlJjbjl hlhtZybcjlJjbjl);

    List<MbzDataCheck> interfaceHlhtZybcjlJjbjl(MbzDataCheck t);
}