package com.winning.hic.dao.mz;

import com.winning.hic.model.EmrQtbljlk;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Coder AutoGenerator generate.
 *
 * @author Coder AutoGenerator
 * @date 2018-07-30 13:02:58
 */
@Repository
public interface MZEmrQtbljlkDao {

    public int insertEmrQtbljlk(EmrQtbljlk emrMxmcmlk) throws DataAccessException;

    public int updateEmrQtbljlk(EmrQtbljlk emrMxmcmlk) throws DataAccessException;

    public int deleteEmrQtbljlk(EmrQtbljlk emrMxmcmlk) throws DataAccessException;

    public EmrQtbljlk selectEmrQtbljlk(EmrQtbljlk emrMxmcmlk) throws DataAccessException;

    public Object selectEmrQtbljlkCount(EmrQtbljlk emrMxmcmlk) throws DataAccessException;

    public List<EmrQtbljlk> selectEmrQtbljlkList(EmrQtbljlk emrMxmcmlk) throws DataAccessException;

    public List<EmrQtbljlk> selectEmrQtbljlkPaginatedList(EmrQtbljlk emrMxmcmlk) throws DataAccessException;

    //获取匹配的ID
    String selectEmrQtbljlkId(String cjsj);
}
