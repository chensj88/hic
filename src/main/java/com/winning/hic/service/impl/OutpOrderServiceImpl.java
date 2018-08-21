package com.winning.hic.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.OutpOrder;  

import com.winning.hic.dao.cisdb.OutpOrderDao;  

import com.winning.hic.service.OutpOrderService;  


/**
* @author HLHT
* @title OUTP_ORDER
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-42-21 09:42:16
*/
@Service
public class OutpOrderServiceImpl implements  OutpOrderService {

    @Autowired
    private OutpOrderDao outpOrderDao;

    public int createOutpOrder(OutpOrder outpOrder){
        return this.outpOrderDao.insertOutpOrder(outpOrder);
    }

    public int modifyOutpOrder(OutpOrder outpOrder){
        return this.outpOrderDao.updateOutpOrder(outpOrder);
    }

    public int removeOutpOrder(OutpOrder outpOrder){
        return this.outpOrderDao.deleteOutpOrder(outpOrder);
    }

    public OutpOrder getOutpOrder(OutpOrder outpOrder){
        return this.outpOrderDao.selectOutpOrder(outpOrder);
    }

    public int getOutpOrderCount(OutpOrder outpOrder){
        return (Integer)this.outpOrderDao.selectOutpOrderCount(outpOrder);
    }

    public List<OutpOrder> getOutpOrderList(OutpOrder outpOrder){
        return this.outpOrderDao.selectOutpOrderList(outpOrder);
    }

    public List<OutpOrder> getOutpOrderPageList(OutpOrder outpOrder){
        return this.outpOrderDao.selectOutpOrderPageList(outpOrder);
    }
}