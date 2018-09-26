package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtBlgyJbjkxx;
import com.winning.hic.model.MbzDataCheck;


/**
* @author HLHT
* @title HLHT_BLGY_JBJKXX
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-28-31 16:28:56
*/
public interface HlhtBlgyJbjkxxService {

    public int createHlhtBlgyJbjkxx(HlhtBlgyJbjkxx hlhtBlgyJbjkxx);

    public int modifyHlhtBlgyJbjkxx(HlhtBlgyJbjkxx hlhtBlgyJbjkxx);

    public int removeHlhtBlgyJbjkxx(HlhtBlgyJbjkxx hlhtBlgyJbjkxx);

    public HlhtBlgyJbjkxx getHlhtBlgyJbjkxx(HlhtBlgyJbjkxx hlhtBlgyJbjkxx);

    public int getHlhtBlgyJbjkxxCount(HlhtBlgyJbjkxx hlhtBlgyJbjkxx);

    public List<HlhtBlgyJbjkxx> getHlhtBlgyJbjkxxList(HlhtBlgyJbjkxx hlhtBlgyJbjkxx);

    public List<HlhtBlgyJbjkxx> getHlhtBlgyJbjkxxPageList(HlhtBlgyJbjkxx hlhtBlgyJbjkxx);

    List<MbzDataCheck> interfaceHlhtBlgyJbjkxx(MbzDataCheck entity) throws Exception;
}