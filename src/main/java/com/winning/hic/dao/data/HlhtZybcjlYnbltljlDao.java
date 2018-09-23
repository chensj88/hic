package com.winning.hic.dao.data;



import java.util.List;

import com.winning.hic.model.EmrQtbljlk;
import org.springframework.dao.DataAccessException;

import com.winning.hic.model.HlhtZybcjlYnbltljl;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-34-31 16:34:53
*/
@Repository
public interface HlhtZybcjlYnbltljlDao {

    public int insertHlhtZybcjlYnbltljl(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl) throws DataAccessException;

    public int updateHlhtZybcjlYnbltljl(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl) throws DataAccessException;

    public int deleteHlhtZybcjlYnbltljl(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl) throws DataAccessException;

    public HlhtZybcjlYnbltljl selectHlhtZybcjlYnbltljl(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl) throws DataAccessException;

    public Object selectHlhtZybcjlYnbltljlCount(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl) throws DataAccessException;

    public List<HlhtZybcjlYnbltljl> selectHlhtZybcjlYnbltljlList(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl) throws DataAccessException;

    public List<HlhtZybcjlYnbltljl> selectHlhtZybcjlYnbltljlPageList(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl) throws DataAccessException;

    public void deleteHlhtZybcjlYnbltljlByYjlxh(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl);

    public List<HlhtZybcjlYnbltljl> selectHlhtZybcjlYnbltljlListByProc(HlhtZybcjlYnbltljl hlhtZybcjlYnbltljl) throws DataAccessException;

}