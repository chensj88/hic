package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.OutpOrderitem;  


/**
* @author HLHT
* @title OUTP_ORDERITEM
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-42-21 09:42:26
*/
public interface OutpOrderitemService {

    public int createOutpOrderitem(OutpOrderitem outpOrderitem);

    public int modifyOutpOrderitem(OutpOrderitem outpOrderitem);

    public int removeOutpOrderitem(OutpOrderitem outpOrderitem);

    public OutpOrderitem getOutpOrderitem(OutpOrderitem outpOrderitem);

    public int getOutpOrderitemCount(OutpOrderitem outpOrderitem);

    public List<OutpOrderitem> getOutpOrderitemList(OutpOrderitem outpOrderitem);

    public List<OutpOrderitem> getOutpOrderitemPageList(OutpOrderitem outpOrderitem);
}