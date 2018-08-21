package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.OutpOrder;  


/**
* @author HLHT
* @title OUTP_ORDER
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-42-21 09:42:16
*/
public interface OutpOrderService {

    public int createOutpOrder(OutpOrder outpOrder);

    public int modifyOutpOrder(OutpOrder outpOrder);

    public int removeOutpOrder(OutpOrder outpOrder);

    public OutpOrder getOutpOrder(OutpOrder outpOrder);

    public int getOutpOrderCount(OutpOrder outpOrder);

    public List<OutpOrder> getOutpOrderList(OutpOrder outpOrder);

    public List<OutpOrder> getOutpOrderPageList(OutpOrder outpOrder);
}