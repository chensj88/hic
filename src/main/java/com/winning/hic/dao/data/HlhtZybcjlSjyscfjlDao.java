package com.winning.hic.dao.data;



import java.util.List;

import com.winning.hic.model.EmrQtbljlk;
import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtZybcjlSjyscfjl;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-34-31 16:34:17
*/
@Repository
public interface HlhtZybcjlSjyscfjlDao {

    public int insertHlhtZybcjlSjyscfjl(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl) throws DataAccessException;

    public int updateHlhtZybcjlSjyscfjl(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl) throws DataAccessException;

    public int deleteHlhtZybcjlSjyscfjl(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl) throws DataAccessException;

    public HlhtZybcjlSjyscfjl selectHlhtZybcjlSjyscfjl(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl) throws DataAccessException;

    public Object selectHlhtZybcjlSjyscfjlCount(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl) throws DataAccessException;

    public List<HlhtZybcjlSjyscfjl> selectHlhtZybcjlSjyscfjlList(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl) throws DataAccessException;

    public List<HlhtZybcjlSjyscfjl> selectHlhtZybcjlSjyscfjlPageList(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl) throws DataAccessException;

    public List<HlhtZybcjlSjyscfjl> selectHlhtZybcjlSjyscfjlListByProc(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl) throws DataAccessException;
}