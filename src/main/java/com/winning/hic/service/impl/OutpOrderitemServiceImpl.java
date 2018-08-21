package com.winning.hic.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.OutpOrderitem;  

import com.winning.hic.dao.cisdb.OutpOrderitemDao;  

import com.winning.hic.service.OutpOrderitemService;  


/**
* @author HLHT
* @title OUTP_ORDERITEM
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-42-21 09:42:26
*/
@Service
public class OutpOrderitemServiceImpl implements  OutpOrderitemService {

    @Autowired
    private OutpOrderitemDao outpOrderitemDao;

    public int createOutpOrderitem(OutpOrderitem outpOrderitem){
        return this.outpOrderitemDao.insertOutpOrderitem(outpOrderitem);
    }

    public int modifyOutpOrderitem(OutpOrderitem outpOrderitem){
        return this.outpOrderitemDao.updateOutpOrderitem(outpOrderitem);
    }

    public int removeOutpOrderitem(OutpOrderitem outpOrderitem){
        return this.outpOrderitemDao.deleteOutpOrderitem(outpOrderitem);
    }

    public OutpOrderitem getOutpOrderitem(OutpOrderitem outpOrderitem){
        return this.outpOrderitemDao.selectOutpOrderitem(outpOrderitem);
    }

    public int getOutpOrderitemCount(OutpOrderitem outpOrderitem){
        return (Integer)this.outpOrderitemDao.selectOutpOrderitemCount(outpOrderitem);
    }

    public List<OutpOrderitem> getOutpOrderitemList(OutpOrderitem outpOrderitem){
        return this.outpOrderitemDao.selectOutpOrderitemList(outpOrderitem);
    }

    public List<OutpOrderitem> getOutpOrderitemPageList(OutpOrderitem outpOrderitem){
        return this.outpOrderitemDao.selectOutpOrderitemPageList(outpOrderitem);
    }
}