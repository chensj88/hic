package com.winning.hic.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import com.winning.hic.model.HlhtZybcjlSjyscfjl;
import com.winning.hic.model.MbzDataCheck;


/**
* @author HLHT
* @title HLHT_ZYBCJL_SJYSCFJL
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-34-31 16:34:17
*/
public interface HlhtZybcjlSjyscfjlService {

    public int createHlhtZybcjlSjyscfjl(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl);

    public int modifyHlhtZybcjlSjyscfjl(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl);

    public int removeHlhtZybcjlSjyscfjl(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl);

    public HlhtZybcjlSjyscfjl getHlhtZybcjlSjyscfjl(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl);

    public int getHlhtZybcjlSjyscfjlCount(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl);

    public List<HlhtZybcjlSjyscfjl> getHlhtZybcjlSjyscfjlList(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl);

    public List<HlhtZybcjlSjyscfjl> getHlhtZybcjlSjyscfjlPageList(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl);

    public List<MbzDataCheck>  interfaceHlhtZybcjlSjyscfjl(MbzDataCheck entity) throws Exception;
}