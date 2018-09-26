package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtMjzcfXycf;
import com.winning.hic.model.MbzDataCheck;


/**
* @author HLHT
* @title HLHT_MJZCF_XYCF
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-29-31 16:29:53
*/
public interface HlhtMjzcfXycfService {

    public int createHlhtMjzcfXycf(HlhtMjzcfXycf hlhtMjzcfXycf);

    public int modifyHlhtMjzcfXycf(HlhtMjzcfXycf hlhtMjzcfXycf);

    public int removeHlhtMjzcfXycf(HlhtMjzcfXycf hlhtMjzcfXycf);

    public HlhtMjzcfXycf getHlhtMjzcfXycf(HlhtMjzcfXycf hlhtMjzcfXycf);

    public int getHlhtMjzcfXycfCount(HlhtMjzcfXycf hlhtMjzcfXycf);

    public List<HlhtMjzcfXycf> getHlhtMjzcfXycfList(HlhtMjzcfXycf hlhtMjzcfXycf);

    public List<HlhtMjzcfXycf> getHlhtMjzcfXycfPageList(HlhtMjzcfXycf hlhtMjzcfXycf);

    List<MbzDataCheck> interfaceHlhtMjzcfXycf(MbzDataCheck entity) throws Exception;


}