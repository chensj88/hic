package com.winning.hic.dao.data;



import java.util.List;

import org.springframework.dao.DataAccessException;

import com.winning.hic.model.HlhtAutomateSet;



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-55-24 13:55:03
*/
@Repository
public interface HlhtAutomateSetDao {

    public int insertHlhtAutomateSet(HlhtAutomateSet hlhtAutomateSet) throws DataAccessException;

    public int updateHlhtAutomateSet(HlhtAutomateSet hlhtAutomateSet) throws DataAccessException;

    public int deleteHlhtAutomateSet(HlhtAutomateSet hlhtAutomateSet) throws DataAccessException;

    public HlhtAutomateSet selectHlhtAutomateSet(HlhtAutomateSet hlhtAutomateSet) throws DataAccessException;

    public Object selectHlhtAutomateSetCount(HlhtAutomateSet hlhtAutomateSet) throws DataAccessException;

    public List<HlhtAutomateSet> selectHlhtAutomateSetList(HlhtAutomateSet hlhtAutomateSet) throws DataAccessException;

    public List<HlhtAutomateSet> selectHlhtAutomateSetPageList(HlhtAutomateSet hlhtAutomateSet) throws DataAccessException;
}
