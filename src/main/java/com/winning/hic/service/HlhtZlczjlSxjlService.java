package com.winning.hic.service;

import java.util.List;

import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.model.HlhtZlczjlSxjl;
import com.winning.hic.model.MbzDataCheck;
import org.springframework.dao.DataAccessException;


/**
* @author HLHT
* @title HLHT_ZLCZJL_SXJL
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-31-31 16:31:46
*/
public interface HlhtZlczjlSxjlService {

    public int createHlhtZlczjlSxjl(HlhtZlczjlSxjl hlhtZlczjlSxjl);

    public int modifyHlhtZlczjlSxjl(HlhtZlczjlSxjl hlhtZlczjlSxjl);

    public int removeHlhtZlczjlSxjl(HlhtZlczjlSxjl hlhtZlczjlSxjl);

    public HlhtZlczjlSxjl getHlhtZlczjlSxjl(HlhtZlczjlSxjl hlhtZlczjlSxjl);

    public int getHlhtZlczjlSxjlCount(HlhtZlczjlSxjl hlhtZlczjlSxjl);

    public List<HlhtZlczjlSxjl> getHlhtZlczjlSxjlList(HlhtZlczjlSxjl hlhtZlczjlSxjl);

    public List<HlhtZlczjlSxjl> getHlhtZlczjlSxjlPageList(HlhtZlczjlSxjl hlhtZlczjlSxjl);

    public List<HlhtZlczjlSxjl> getHlhtZlczjlSxjlListFromBaseData(EmrQtbljlk emrQtbljlk) throws DataAccessException;

    public void deleteHlhtZlczjlSxjlByYjlxh(HlhtZlczjlSxjl hlhtZlczjlSxjl);

    List<MbzDataCheck> interfaceHlhtZlczjlSxjl(MbzDataCheck entity);
}