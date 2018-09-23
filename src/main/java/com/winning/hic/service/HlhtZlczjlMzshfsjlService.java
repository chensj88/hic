package com.winning.hic.service;

import java.util.List;

import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.model.HlhtZlczjlMzshfsjl;
import com.winning.hic.model.MbzDataCheck;
import org.springframework.dao.DataAccessException;


/**
 * @author HLHT
 * @title HLHT_ZLCZJL_MZSHFSJL
 * @email Winning Health
 * @package com.winning.hic.service
 * @date 2018-31-31 16:31:27
 */
public interface HlhtZlczjlMzshfsjlService {

    public int createHlhtZlczjlMzshfsjl(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl);

    public int modifyHlhtZlczjlMzshfsjl(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl);

    public int removeHlhtZlczjlMzshfsjl(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl);

    public HlhtZlczjlMzshfsjl getHlhtZlczjlMzshfsjl(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl);

    public int getHlhtZlczjlMzshfsjlCount(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl);

    public List<HlhtZlczjlMzshfsjl> getHlhtZlczjlMzshfsjlList(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl);

    public List<HlhtZlczjlMzshfsjl> getHlhtZlczjlMzshfsjlPageList(HlhtZlczjlMzshfsjl hlhtZlczjlMzshfsjl);

    public List<HlhtZlczjlMzshfsjl> getHlhtZlczjlMzshfsjlListFromBaseData(EmrQtbljlk emrQtbljlk) throws DataAccessException;

    public void deleteHlhtZlczjlMzshfsjlByYjlxh(HlhtZlczjlMzshfsjl hlhtZlczjlMzsqfsjl);

    public List<MbzDataCheck> interfaceHlhtZlczjlMzshfsjl(MbzDataCheck entity);

    public List<HlhtZlczjlMzshfsjl> selectHlhtZlczjlMzshfsjlListByProc(HlhtZlczjlMzshfsjl hlhtZlczjlMzsqfsjl);

}