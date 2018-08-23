package com.winning.hic.service;

import java.util.List;

import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.model.HlhtZqgzxxMzzqtys;
import com.winning.hic.model.MbzDataCheck;
import org.springframework.dao.DataAccessException;


/**
 * @author HLHT
 * @title HLHT_ZQGZXX_MZZQTYS
 * @email Winning Health
 * @package com.winning.hic.service
 * @date 2018-32-31 16:32:23
 */
public interface HlhtZqgzxxMzzqtysService {

    public int createHlhtZqgzxxMzzqtys(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys);

    public int modifyHlhtZqgzxxMzzqtys(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys);

    public int removeHlhtZqgzxxMzzqtys(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys);

    public HlhtZqgzxxMzzqtys getHlhtZqgzxxMzzqtys(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys);

    public int getHlhtZqgzxxMzzqtysCount(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys);

    public List<HlhtZqgzxxMzzqtys> getHlhtZqgzxxMzzqtysList(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys);

    public List<HlhtZqgzxxMzzqtys> getHlhtZqgzxxMzzqtysPageList(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys);

    public List<HlhtZqgzxxMzzqtys> getHlhtZqgzxxMzzqtysListFromBaseData(EmrQtbljlk emrQtbljlk) throws DataAccessException;

    public void deleteHlhtZqgzxxMzzqtysByYjlxh(HlhtZqgzxxMzzqtys hlhtZqgzxxMzzqtys);

    List<MbzDataCheck> interfaceHlhtZqgzxxMzzqtys(MbzDataCheck entity);
}