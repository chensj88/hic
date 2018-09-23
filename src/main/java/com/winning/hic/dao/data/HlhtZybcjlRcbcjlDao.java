package com.winning.hic.dao.data;


import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.model.HlhtZybcjlRcbcjl;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-33-31 16:33:54
*/
@Repository
public interface HlhtZybcjlRcbcjlDao {

    public int insertHlhtZybcjlRcbcjl(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl) throws DataAccessException;

    public int updateHlhtZybcjlRcbcjl(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl) throws DataAccessException;

    public int deleteHlhtZybcjlRcbcjl(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl) throws DataAccessException;

    public HlhtZybcjlRcbcjl selectHlhtZybcjlRcbcjl(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl) throws DataAccessException;

    public Object selectHlhtZybcjlRcbcjlCount(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl) throws DataAccessException;

    public List<HlhtZybcjlRcbcjl> selectHlhtZybcjlRcbcjlList(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl) throws DataAccessException;

    public List<HlhtZybcjlRcbcjl> selectHlhtZybcjlRcbcjlPageList(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl) throws DataAccessException;

    public void deleteHlhtZybcjlRcbcjlByYjlxh(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl);

    public List<HlhtZybcjlRcbcjl> selectHlhtZybcjlRcbcjlByProc(HlhtZybcjlRcbcjl hlhtZybcjlRcbcjl) throws DataAccessException;


}