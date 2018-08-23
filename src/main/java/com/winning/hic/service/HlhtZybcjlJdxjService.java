package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtZybcjlJdxj;
import com.winning.hic.model.MbzDataCheck;


/**
* @author HLHT
* @title HLHT_ZYBCJL_JDXJ
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-33-31 16:33:32
*/
public interface HlhtZybcjlJdxjService {

    public int createHlhtZybcjlJdxj(HlhtZybcjlJdxj hlhtZybcjlJdxj);

    public int modifyHlhtZybcjlJdxj(HlhtZybcjlJdxj hlhtZybcjlJdxj);

    public int removeHlhtZybcjlJdxj(HlhtZybcjlJdxj hlhtZybcjlJdxj);

    public HlhtZybcjlJdxj getHlhtZybcjlJdxj(HlhtZybcjlJdxj hlhtZybcjlJdxj);

    public int getHlhtZybcjlJdxjCount(HlhtZybcjlJdxj hlhtZybcjlJdxj);

    public List<HlhtZybcjlJdxj> getHlhtZybcjlJdxjList(HlhtZybcjlJdxj hlhtZybcjlJdxj);

    public List<HlhtZybcjlJdxj> getHlhtZybcjlJdxjPageList(HlhtZybcjlJdxj hlhtZybcjlJdxj);

    List<MbzDataCheck> interfaceHlhtZybcjlJdxj(MbzDataCheck t);
}