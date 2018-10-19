package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtZybcjlScbcjl;
import com.winning.hic.model.MbzDataCheck;


/**
* @author HLHT
* @title HLHT_ZYBCJL_SCBCJL
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-34-31 16:34:02
*/
public interface HlhtZybcjlScbcjlService {

    public int createHlhtZybcjlScbcjl(HlhtZybcjlScbcjl hlhtZybcjlScbcjl);

    public int modifyHlhtZybcjlScbcjl(HlhtZybcjlScbcjl hlhtZybcjlScbcjl);

    public int removeHlhtZybcjlScbcjl(HlhtZybcjlScbcjl hlhtZybcjlScbcjl);

    public HlhtZybcjlScbcjl getHlhtZybcjlScbcjl(HlhtZybcjlScbcjl hlhtZybcjlScbcjl);

    public int getHlhtZybcjlScbcjlCount(HlhtZybcjlScbcjl hlhtZybcjlScbcjl);

    public List<HlhtZybcjlScbcjl> getHlhtZybcjlScbcjlList(HlhtZybcjlScbcjl hlhtZybcjlScbcjl);

    public List<HlhtZybcjlScbcjl> getHlhtZybcjlScbcjlPageList(HlhtZybcjlScbcjl hlhtZybcjlScbcjl);

    MbzDataCheck interfaceHlhtZybcjlScbcjl(MbzDataCheck t);

    void selectAllHandleQuery();
}