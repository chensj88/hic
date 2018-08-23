package com.winning.hic.service;

import java.util.List;

import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.model.HlhtZlczjlZljl;
import com.winning.hic.model.MbzDataCheck;
import org.springframework.dao.DataAccessException;


/**
* @author HLHT
* @title HLHT_ZLCZJL_ZLJL
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-32-31 16:32:09
*/
public interface HlhtZlczjlZljlService {

    public int createHlhtZlczjlZljl(HlhtZlczjlZljl hlhtZlczjlZljl);

    public int modifyHlhtZlczjlZljl(HlhtZlczjlZljl hlhtZlczjlZljl);

    public int removeHlhtZlczjlZljl(HlhtZlczjlZljl hlhtZlczjlZljl);

    public HlhtZlczjlZljl getHlhtZlczjlZljl(HlhtZlczjlZljl hlhtZlczjlZljl);

    public int getHlhtZlczjlZljlCount(HlhtZlczjlZljl hlhtZlczjlZljl);

    public List<HlhtZlczjlZljl> getHlhtZlczjlZljlList(HlhtZlczjlZljl hlhtZlczjlZljl);

    public List<HlhtZlczjlZljl> getHlhtZlczjlZljlPageList(HlhtZlczjlZljl hlhtZlczjlZljl);

    public List<HlhtZlczjlZljl> getHlhtZlczjlZljlListFromBaseData(EmrQtbljlk emrQtbljlk) throws DataAccessException;

    public void deleteHlhtZlczjlZljlByYjlxh(HlhtZlczjlZljl hlhtZlczjlZljl);

    List<MbzDataCheck> interfaceHlhtZlczjlZljl(MbzDataCheck entity);
}