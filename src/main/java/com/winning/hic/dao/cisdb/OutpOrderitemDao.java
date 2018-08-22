package com.winning.hic.dao.cisdb;



import java.util.List;  

import org.springframework.dao.DataAccessException;  

import com.winning.hic.model.OutpOrderitem;  



import org.springframework.stereotype.Repository;
/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao.cisdb
* @date 2018-42-21 09:42:26
*/
@Repository
public interface OutpOrderitemDao {

    public int insertOutpOrderitem(OutpOrderitem outpOrderitem) throws DataAccessException;

    public int updateOutpOrderitem(OutpOrderitem outpOrderitem) throws DataAccessException;

    public int deleteOutpOrderitem(OutpOrderitem outpOrderitem) throws DataAccessException;

    public OutpOrderitem selectOutpOrderitem(OutpOrderitem outpOrderitem) throws DataAccessException;

    public Object selectOutpOrderitemCount(OutpOrderitem outpOrderitem) throws DataAccessException;

    public List<OutpOrderitem> selectOutpOrderitemList(OutpOrderitem outpOrderitem) throws DataAccessException;

    public List<OutpOrderitem> selectOutpOrderitemPageList(OutpOrderitem outpOrderitem) throws DataAccessException;
}