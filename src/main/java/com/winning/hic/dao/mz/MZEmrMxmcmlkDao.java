package com.winning.hic.dao.mz;


import com.winning.hic.model.EmrMxmcmlk;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
* @author chensj
* @title DAO接口
* @email chensj@163.com
* @package com.winning.hic.dao
* @date 2018-05-23 09:05:13
*/
@Repository
public interface MZEmrMxmcmlkDao {

    public int insertEmrMxmcmlk(EmrMxmcmlk emrMxmcmlk) throws DataAccessException;

    public int updateEmrMxmcmlk(EmrMxmcmlk emrMxmcmlk) throws DataAccessException;

    public int deleteEmrMxmcmlk(EmrMxmcmlk emrMxmcmlk) throws DataAccessException;

    public EmrMxmcmlk selectEmrMxmcmlk(EmrMxmcmlk emrMxmcmlk) throws DataAccessException;

    public Object selectEmrMxmcmlkCount(EmrMxmcmlk emrMxmcmlk) throws DataAccessException;

    public List<EmrMxmcmlk> selectEmrMxmcmlkList(EmrMxmcmlk emrMxmcmlk) throws DataAccessException;

    public List<EmrMxmcmlk> selectEmrMxmcmlkPageList(EmrMxmcmlk emrMxmcmlk) throws DataAccessException;

    List<EmrMxmcmlk> selectEmrMxmcmlkParentList(EmrMxmcmlk emrMxmcmlk);

    List<EmrMxmcmlk> selectEmrMxmcmlkFirstChildList(EmrMxmcmlk mxmcmlk);

}