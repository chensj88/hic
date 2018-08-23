package com.winning.hic.service;

import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.model.HlhtZlczjlMzsqfsjl;
import com.winning.hic.model.MbzDataCheck;
import org.springframework.dao.DataAccessException;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZLCZJL_MZSQFSJL
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-31-31 16:31:37
*/
public interface HlhtZlczjlMzsqfsjlService {

    public int createHlhtZlczjlMzsqfsjl(HlhtZlczjlMzsqfsjl hlhtZlczjlMzsqfsjl);

    public int modifyHlhtZlczjlMzsqfsjl(HlhtZlczjlMzsqfsjl hlhtZlczjlMzsqfsjl);

    public int removeHlhtZlczjlMzsqfsjl(HlhtZlczjlMzsqfsjl hlhtZlczjlMzsqfsjl);

    public HlhtZlczjlMzsqfsjl getHlhtZlczjlMzsqfsjl(HlhtZlczjlMzsqfsjl hlhtZlczjlMzsqfsjl);

    public int getHlhtZlczjlMzsqfsjlCount(HlhtZlczjlMzsqfsjl hlhtZlczjlMzsqfsjl);

    public List<HlhtZlczjlMzsqfsjl> getHlhtZlczjlMzsqfsjlList(HlhtZlczjlMzsqfsjl hlhtZlczjlMzsqfsjl);

    public List<HlhtZlczjlMzsqfsjl> getHlhtZlczjlMzsqfsjlPageList(HlhtZlczjlMzsqfsjl hlhtZlczjlMzsqfsjl);

    public List<HlhtZlczjlMzsqfsjl> getHlhtZlczjlMzsqfsjlListFromBaseData(EmrQtbljlk emrQtbljlk) throws DataAccessException;

    public void deleteHlhtZlczjlMzsqfsjlByYjlxh(HlhtZlczjlMzsqfsjl hlhtZlczjlMzsqfsjl);

    public List<MbzDataCheck> interfaceHlhtZlczjlMzsqfsjl(MbzDataCheck entity) ;
}