package com.winning.hic.dao.data;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import com.winning.hic.model.MbzModelCheck;


import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

/**
 * @author MBZ
 * @title DAO接口
 * @email Winning Health
 * @package com.winning.hic.dao
 * @date 2018-55-24 13:55:10
 */
@Repository
public interface MbzModelCheckDao {

    public int insertMbzModelCheck(MbzModelCheck mbzModelCheck) throws DataAccessException;

    public int updateMbzModelCheck(MbzModelCheck mbzModelCheck) throws DataAccessException;

    public int deleteMbzModelCheck(MbzModelCheck mbzModelCheck) throws DataAccessException;

    public MbzModelCheck selectMbzModelCheck(MbzModelCheck mbzModelCheck) throws DataAccessException;

    public Object selectMbzModelCheckCount(MbzModelCheck mbzModelCheck) throws DataAccessException;

    public List<MbzModelCheck> selectMbzModelCheckList(MbzModelCheck mbzModelCheck) throws DataAccessException;

    public List<MbzModelCheck> selectMbzModelCheckPageList(MbzModelCheck mbzModelCheck) throws DataAccessException;

    public List<MbzModelCheck> selectDataSet(MbzModelCheck mbzModelCheck);

    public List<MbzModelCheck> selectModelListBySourceType(MbzModelCheck mbzModelCheck);

    public void innitModelCheckData();

    public List<MbzModelCheck> getMbzModelCheckListNotFalse(MbzModelCheck mbzModelCheck);
}