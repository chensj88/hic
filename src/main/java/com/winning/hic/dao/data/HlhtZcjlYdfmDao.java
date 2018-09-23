package com.winning.hic.dao.data;


import com.winning.hic.model.HlhtZcjlYdfm;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author HLHT
 * @title DAO接口
 * @email Winning Health
 * @package com.winning.hic.dao
 * @date 2018-31-31 16:31:19
 */
@Repository
public interface HlhtZcjlYdfmDao {

    public int insertHlhtZcjlYdfm(HlhtZcjlYdfm hlhtZcjlYdfm) throws DataAccessException;

    public int updateHlhtZcjlYdfm(HlhtZcjlYdfm hlhtZcjlYdfm) throws DataAccessException;

    public int deleteHlhtZcjlYdfm(HlhtZcjlYdfm hlhtZcjlYdfm) throws DataAccessException;

    public HlhtZcjlYdfm selectHlhtZcjlYdfm(HlhtZcjlYdfm hlhtZcjlYdfm) throws DataAccessException;

    public Object selectHlhtZcjlYdfmCount(HlhtZcjlYdfm hlhtZcjlYdfm) throws DataAccessException;

    public List<HlhtZcjlYdfm> selectHlhtZcjlYdfmList(HlhtZcjlYdfm hlhtZcjlYdfm) throws DataAccessException;

    public List<HlhtZcjlYdfm> selectHlhtZcjlYdfmPageList(HlhtZcjlYdfm hlhtZcjlYdfm) throws DataAccessException;

    public void deleteHlhtZcjlYdfmByYjlxh(HlhtZcjlYdfm hlhtZcjlYdfm);

    public List<HlhtZcjlYdfm> selectHlhtZcjlYdfmListByProc(HlhtZcjlYdfm hlhtZcjlYdfm);
}