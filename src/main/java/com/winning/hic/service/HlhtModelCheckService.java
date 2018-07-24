package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtModelCheck;  


/**
* @author HLHT
* @title HLHT_MODEL_CHECK
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-55-24 13:55:10
*/
public interface HlhtModelCheckService {

    public int createHlhtModelCheck(HlhtModelCheck hlhtModelCheck);

    public int modifyHlhtModelCheck(HlhtModelCheck hlhtModelCheck);

    public int removeHlhtModelCheck(HlhtModelCheck hlhtModelCheck);

    public HlhtModelCheck getHlhtModelCheck(HlhtModelCheck hlhtModelCheck);

    public int getHlhtModelCheckCount(HlhtModelCheck hlhtModelCheck);

    public List<HlhtModelCheck> getHlhtModelCheckList(HlhtModelCheck hlhtModelCheck);

    public List<HlhtModelCheck> getHlhtModelCheckPageList(HlhtModelCheck hlhtModelCheck);
}