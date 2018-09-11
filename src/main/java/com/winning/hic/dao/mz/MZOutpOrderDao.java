package com.winning.hic.dao.mz;


import com.winning.hic.model.OutpOrder;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
* @author HLHT
* @title DAO接口
* @email Winning Health
* @package com.winning.hic.dao.cisdb
* @date 2018-42-21 09:42:16
*/
@Repository
public interface MZOutpOrderDao {

    public int insertOutpOrder(OutpOrder outpOrder) throws DataAccessException;

    public int updateOutpOrder(OutpOrder outpOrder) throws DataAccessException;

    public int deleteOutpOrder(OutpOrder outpOrder) throws DataAccessException;

    public OutpOrder selectOutpOrder(OutpOrder outpOrder) throws DataAccessException;

    public Object selectOutpOrderCount(OutpOrder outpOrder) throws DataAccessException;

    public List<OutpOrder> selectOutpOrderList(OutpOrder outpOrder) throws DataAccessException;

    public List<OutpOrder> selectOutpOrderPageList(OutpOrder outpOrder) throws DataAccessException;
}