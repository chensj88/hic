package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtBlgyWssjzy;
import com.winning.hic.model.MbzDataCheck;


/**
* @author HLHT
* @title HLHT_BLGY_WSSJZY
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-29-31 16:29:04
*/
public interface HlhtBlgyWssjzyService {

    public int createHlhtBlgyWssjzy(HlhtBlgyWssjzy hlhtBlgyWssjzy);

    public int modifyHlhtBlgyWssjzy(HlhtBlgyWssjzy hlhtBlgyWssjzy);

    public int removeHlhtBlgyWssjzy(HlhtBlgyWssjzy hlhtBlgyWssjzy);

    public HlhtBlgyWssjzy getHlhtBlgyWssjzy(HlhtBlgyWssjzy hlhtBlgyWssjzy);

    public int getHlhtBlgyWssjzyCount(HlhtBlgyWssjzy hlhtBlgyWssjzy);

    public List<HlhtBlgyWssjzy> getHlhtBlgyWssjzyList(HlhtBlgyWssjzy hlhtBlgyWssjzy);

    public List<HlhtBlgyWssjzy> getHlhtBlgyWssjzyPageList(HlhtBlgyWssjzy hlhtBlgyWssjzy);

    public MbzDataCheck interfaceHlhtBlgyWssjzy(MbzDataCheck entity);
}