package com.winning.hic.service;

import java.util.List;

import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.model.HlhtZybcjlYnbltljl;
import com.winning.hic.model.MbzDataCheck;
import org.springframework.dao.DataAccessException;


/**
 * @author HLHT
 * @title HLHT_ZYBCJL_YNBLTLJL
 * @email Winning Health
 * @package com.winning.hic.service
 * @date 2018-34-31 16:34:53
 */
public interface HlhtZybcjlYnbltljlService {

    public int createHlhtZybcjlYnbltljl(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl);

    public int modifyHlhtZybcjlYnbltljl(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl);

    public int removeHlhtZybcjlYnbltljl(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl);

    public HlhtZybcjlYnbltljl getHlhtZybcjlYnbltljl(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl);

    public int getHlhtZybcjlYnbltljlCount(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl);

    public List<HlhtZybcjlYnbltljl> getHlhtZybcjlYnbltljlList(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl);

    public List<HlhtZybcjlYnbltljl> getHlhtZybcjlYnbltljlPageList(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl);

    public List<HlhtZybcjlYnbltljl> getHlhtZybcjlYnbltljlListFromBaseData(EmrQtbljlk emrQtbljlk) throws DataAccessException;

    public void deleteHlhtZybcjlYnbltljlByYjlxh(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl);

    public List<MbzDataCheck> interfaceHlhtZybcjlYnbltljl(MbzDataCheck entity);
}