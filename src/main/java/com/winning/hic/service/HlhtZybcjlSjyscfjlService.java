package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtZybcjlSjyscfjl;  


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
}