package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZybcjlSjyscfjlDao;
import com.winning.hic.model.HlhtZybcjlSjyscfjl;
import com.winning.hic.service.HlhtZybcjlSjyscfjlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZYBCJL_SJYSCFJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-34-31 16:34:17
*/
@Service
public class HlhtZybcjlSjyscfjlServiceImpl implements  HlhtZybcjlSjyscfjlService {

    @Autowired
    private HlhtZybcjlSjyscfjlDao hlhtZybcjlSjyscfjlDao;

    public int createHlhtZybcjlSjyscfjl(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl){
        return this.hlhtZybcjlSjyscfjlDao.insertHlhtZybcjlSjyscfjl(hlhtZybcjlSjyscfjl);
    }

    public int modifyHlhtZybcjlSjyscfjl(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl){
        return this.hlhtZybcjlSjyscfjlDao.updateHlhtZybcjlSjyscfjl(hlhtZybcjlSjyscfjl);
    }

    public int removeHlhtZybcjlSjyscfjl(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl){
        return this.hlhtZybcjlSjyscfjlDao.deleteHlhtZybcjlSjyscfjl(hlhtZybcjlSjyscfjl);
    }

    public HlhtZybcjlSjyscfjl getHlhtZybcjlSjyscfjl(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl){
        return this.hlhtZybcjlSjyscfjlDao.selectHlhtZybcjlSjyscfjl(hlhtZybcjlSjyscfjl);
    }

    public int getHlhtZybcjlSjyscfjlCount(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl){
        return (Integer)this.hlhtZybcjlSjyscfjlDao.selectHlhtZybcjlSjyscfjlCount(hlhtZybcjlSjyscfjl);
    }

    public List<HlhtZybcjlSjyscfjl> getHlhtZybcjlSjyscfjlList(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl){
        return this.hlhtZybcjlSjyscfjlDao.selectHlhtZybcjlSjyscfjlList(hlhtZybcjlSjyscfjl);
    }

    public List<HlhtZybcjlSjyscfjl> getHlhtZybcjlSjyscfjlPageList(HlhtZybcjlSjyscfjl hlhtZybcjlSjyscfjl){
        return this.hlhtZybcjlSjyscfjlDao.selectHlhtZybcjlSjyscfjlPageList(hlhtZybcjlSjyscfjl);
    }
}