package com.winning.hic.service;

import java.util.List;

import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.model.HlhtZqgzxxBwztzs;
import com.winning.hic.model.MbzDataCheck;


/**
* @author HLHT
* @title HLHT_ZQGZXX_BWZTZS
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-32-31 16:32:15
*/
public interface HlhtZqgzxxBwztzsService {

    public int createHlhtZqgzxxBwztzs(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs);

    public int modifyHlhtZqgzxxBwztzs(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs);

    public int removeHlhtZqgzxxBwztzs(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs);

    public HlhtZqgzxxBwztzs getHlhtZqgzxxBwztzs(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs);

    public int getHlhtZqgzxxBwztzsCount(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs);

    public List<HlhtZqgzxxBwztzs> getHlhtZqgzxxBwztzsList(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs);

    public List<HlhtZqgzxxBwztzs> getHlhtZqgzxxBwztzsPageList(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs);

    public List<HlhtZqgzxxBwztzs> getHlhtZqgzxxBwztzsListFromBaseData(EmrQtbljlk emrQtbljlk);

    List<MbzDataCheck> interfaceHlhtZqgzxxBwztzs(MbzDataCheck entity);

    public void deleteHlhtZqgzxxBwztzsByYjlxh(HlhtZqgzxxBwztzs hlhtZqgzxxBwztzs);


}