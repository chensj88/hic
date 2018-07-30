package com.winning.hic.dao.data;



import java.util.List;

import org.springframework.dao.DataAccessException;

import com.winning.hic.model.MbzAutomateSet;



import org.springframework.stereotype.Repository;
/**
* @author MBZ
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao
* @date 2018-55-24 13:55:03
*/
@Repository
public interface MbzAutomateSetDao {

    public int insertMbzAutomateSet(MbzAutomateSet mbzAutomateSet) throws DataAccessException;

    public int updateMbzAutomateSet(MbzAutomateSet mbzAutomateSet) throws DataAccessException;

    public int deleteMbzAutomateSet(MbzAutomateSet mbzAutomateSet) throws DataAccessException;

    public MbzAutomateSet selectMbzAutomateSet(MbzAutomateSet mbzAutomateSet) throws DataAccessException;

    public Object selectMbzAutomateSetCount(MbzAutomateSet mbzAutomateSet) throws DataAccessException;

    public List<MbzAutomateSet> selectMbzAutomateSetList(MbzAutomateSet mbzAutomateSet) throws DataAccessException;

    public List<MbzAutomateSet> selectMbzAutomateSetPageList(MbzAutomateSet mbzAutomateSet) throws DataAccessException;
}
