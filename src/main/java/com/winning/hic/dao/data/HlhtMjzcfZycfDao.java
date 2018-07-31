package com.winning.hic.dao.data;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.HlhtMjzcfZycf;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-30-31 16:30:02
*/
@Repository
public interface HlhtMjzcfZycfDao {

    public int insertHlhtMjzcfZycf(HlhtMjzcfZycf hlhtMjzcfZycf) throws DataAccessException;

    public int updateHlhtMjzcfZycf(HlhtMjzcfZycf hlhtMjzcfZycf) throws DataAccessException;

    public int deleteHlhtMjzcfZycf(HlhtMjzcfZycf hlhtMjzcfZycf) throws DataAccessException;

    public HlhtMjzcfZycf selectHlhtMjzcfZycf(HlhtMjzcfZycf hlhtMjzcfZycf) throws DataAccessException;

    public Object selectHlhtMjzcfZycfCount(HlhtMjzcfZycf hlhtMjzcfZycf) throws DataAccessException;

    public List<HlhtMjzcfZycf> selectHlhtMjzcfZycfList(HlhtMjzcfZycf hlhtMjzcfZycf) throws DataAccessException;

    public List<HlhtMjzcfZycf> selectHlhtMjzcfZycfPageList(HlhtMjzcfZycf hlhtMjzcfZycf) throws DataAccessException;
}