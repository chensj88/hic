package com.winning.hic.dao.data;


import com.winning.hic.model.EmrQtbljlk;
import com.winning.hic.model.HlhtMjzcfZycf;
import com.winning.hic.model.HlhtRyjlJbxx;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

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

    public void deleteHlhtMjzcfZycfByYjlxh(HlhtMjzcfZycf hlhtMjzcfZycf);

    public List<HlhtMjzcfZycf> selectHlhtMjzcfZycfListByProc(HlhtMjzcfZycf hlhtMjzcfZycf) throws DataAccessException;

    public List<HlhtMjzcfZycf> selectHlhtMjzcfZycfListProcForYear(HlhtMjzcfZycf hlhtMjzcfZycf) throws DataAccessException;

}