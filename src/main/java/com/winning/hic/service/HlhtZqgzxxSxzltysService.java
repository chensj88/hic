package com.winning.hic.service;

import java.util.List;

import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.model.HlhtZqgzxxSxzltys;
import com.winning.hic.model.MbzDataCheck;
import org.springframework.dao.DataAccessException;


/**
 * @author HLHT
 * @title HLHT_ZQGZXX_SXZLTYS
 * @email Winning Health
 * @package com.winning.hic.service
 * @date 2018-32-31 16:32:49
 */
public interface HlhtZqgzxxSxzltysService {

    public int createHlhtZqgzxxSxzltys(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys);

    public int modifyHlhtZqgzxxSxzltys(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys);

    public int removeHlhtZqgzxxSxzltys(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys);

    public HlhtZqgzxxSxzltys getHlhtZqgzxxSxzltys(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys);

    public int getHlhtZqgzxxSxzltysCount(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys);

    public List<HlhtZqgzxxSxzltys> getHlhtZqgzxxSxzltysList(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys);

    public List<HlhtZqgzxxSxzltys> getHlhtZqgzxxSxzltysPageList(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys);

    public List<HlhtZqgzxxSxzltys> getHlhtZqgzxxSxzltysListFromBaseData(EmrQtbljlk emrQtbljlk) throws DataAccessException;

    public void deleteHlhtZqgzxxSxzltysByYjlxh(HlhtZqgzxxSxzltys hlhtZqgzxxSxzltys);

    List<MbzDataCheck> interfaceHlhtZqgzxxSxzltys(MbzDataCheck entity);
}