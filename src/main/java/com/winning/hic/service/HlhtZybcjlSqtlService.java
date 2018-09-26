package com.winning.hic.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import com.winning.hic.model.HlhtZybcjlSqtl;
import com.winning.hic.model.MbzDataCheck;


/**
* @author HLHT
* @title HLHT_ZYBCJL_SQTL
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-34-31 16:34:26
*/
public interface HlhtZybcjlSqtlService {

    public int createHlhtZybcjlSqtl(HlhtZybcjlSqtl hlhtZybcjlSqtl);

    public int modifyHlhtZybcjlSqtl(HlhtZybcjlSqtl hlhtZybcjlSqtl);

    public int removeHlhtZybcjlSqtl(HlhtZybcjlSqtl hlhtZybcjlSqtl);

    public HlhtZybcjlSqtl getHlhtZybcjlSqtl(HlhtZybcjlSqtl hlhtZybcjlSqtl);

    public int getHlhtZybcjlSqtlCount(HlhtZybcjlSqtl hlhtZybcjlSqtl);

    public List<HlhtZybcjlSqtl> getHlhtZybcjlSqtlList(HlhtZybcjlSqtl hlhtZybcjlSqtl);

    public List<HlhtZybcjlSqtl> getHlhtZybcjlSqtlPageList(HlhtZybcjlSqtl hlhtZybcjlSqtl);

    List<MbzDataCheck> interfaceHlhtZybcjlSqtl(MbzDataCheck entity) throws Exception;
}