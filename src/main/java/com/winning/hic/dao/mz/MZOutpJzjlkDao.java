package com.winning.hic.dao.mz;


import com.winning.hic.model.OutpJzjlk;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao.cisdb
* @date 2018-42-21 09:42:04
*/
@Repository
public interface MZOutpJzjlkDao {

    public int insertOutpJzjlk(OutpJzjlk outpJzjlk) throws DataAccessException;

    public int updateOutpJzjlk(OutpJzjlk outpJzjlk) throws DataAccessException;

    public int deleteOutpJzjlk(OutpJzjlk outpJzjlk) throws DataAccessException;

    public OutpJzjlk selectOutpJzjlk(OutpJzjlk outpJzjlk) throws DataAccessException;

    public Object selectOutpJzjlkCount(OutpJzjlk outpJzjlk) throws DataAccessException;

    public List<OutpJzjlk> selectOutpJzjlkList(OutpJzjlk outpJzjlk) throws DataAccessException;

    public List<OutpJzjlk> selectOutpJzjlkPageList(OutpJzjlk outpJzjlk) throws DataAccessException;
}