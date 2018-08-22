package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.OutpJzjlk;  


/**
* @author HLHT
* @title OUTP_JZJLK
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-42-21 09:42:04
*/
public interface OutpJzjlkService {

    public int createOutpJzjlk(OutpJzjlk outpJzjlk);

    public int modifyOutpJzjlk(OutpJzjlk outpJzjlk);

    public int removeOutpJzjlk(OutpJzjlk outpJzjlk);

    public OutpJzjlk getOutpJzjlk(OutpJzjlk outpJzjlk);

    public int getOutpJzjlkCount(OutpJzjlk outpJzjlk);

    public List<OutpJzjlk> getOutpJzjlkList(OutpJzjlk outpJzjlk);

    public List<OutpJzjlk> getOutpJzjlkPageList(OutpJzjlk outpJzjlk);
}