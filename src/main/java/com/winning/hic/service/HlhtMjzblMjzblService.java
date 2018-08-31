package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtMjzblMjzbl;
import com.winning.hic.model.MbzDataCheck;


/**
* @author HLHT
* @title HLHT_MJZBL_MJZBL
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-29-31 16:29:44
*/
public interface HlhtMjzblMjzblService {

    public int createHlhtMjzblMjzbl(HlhtMjzblMjzbl hlhtMjzblMjzbl);

    public int modifyHlhtMjzblMjzbl(HlhtMjzblMjzbl hlhtMjzblMjzbl);

    public int removeHlhtMjzblMjzbl(HlhtMjzblMjzbl hlhtMjzblMjzbl);

    public HlhtMjzblMjzbl getHlhtMjzblMjzbl(HlhtMjzblMjzbl hlhtMjzblMjzbl);

    public int getHlhtMjzblMjzblCount(HlhtMjzblMjzbl hlhtMjzblMjzbl);

    public List<HlhtMjzblMjzbl> getHlhtMjzblMjzblList(HlhtMjzblMjzbl hlhtMjzblMjzbl);

    public List<HlhtMjzblMjzbl> getHlhtMjzblMjzblPageList(HlhtMjzblMjzbl hlhtMjzblMjzbl);

    public List<MbzDataCheck> interfaceHlhtMjzblMjzbl(MbzDataCheck entity);
}