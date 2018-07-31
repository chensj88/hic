package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtZcjlYdfm;  



import org.springframework.stereotype.Repository;
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
}