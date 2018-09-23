package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtMjzcfXycf;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-29-31 16:29:53
*/
@Repository
public interface HlhtMjzcfXycfDao {

    public int insertHlhtMjzcfXycf(HlhtMjzcfXycf hlhtMjzcfXycf) throws DataAccessException;

    public int updateHlhtMjzcfXycf(HlhtMjzcfXycf hlhtMjzcfXycf) throws DataAccessException;

    public int deleteHlhtMjzcfXycf(HlhtMjzcfXycf hlhtMjzcfXycf) throws DataAccessException;

    public HlhtMjzcfXycf selectHlhtMjzcfXycf(HlhtMjzcfXycf hlhtMjzcfXycf) throws DataAccessException;

    public Object selectHlhtMjzcfXycfCount(HlhtMjzcfXycf hlhtMjzcfXycf) throws DataAccessException;

    public List<HlhtMjzcfXycf> selectHlhtMjzcfXycfList(HlhtMjzcfXycf hlhtMjzcfXycf) throws DataAccessException;

    public List<HlhtMjzcfXycf> selectHlhtMjzcfXycfPageList(HlhtMjzcfXycf hlhtMjzcfXycf) throws DataAccessException;

    /**
     * 查询日库
     * @param hlhtMjzcfXycf
     * @return
     * @throws DataAccessException
     */
    public List<HlhtMjzcfXycf> selectHlhtMjzcfXycfListByProc(HlhtMjzcfXycf hlhtMjzcfXycf) throws DataAccessException;

    /**
     * 查询年库
     * @param hlhtMjzcfXycf
     * @return
     * @throws DataAccessException
     */
    public List<HlhtMjzcfXycf> selectHlhtMjzcfXycfListByProcForYear(HlhtMjzcfXycf hlhtMjzcfXycf) throws DataAccessException;
}