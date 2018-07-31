package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZybcjlJjbjlDao;
import com.winning.hic.model.HlhtZybcjlJjbjl;
import com.winning.hic.service.HlhtZybcjlJjbjlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZYBCJL_JJBJL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-33-31 16:33:41
*/
@Service
public class HlhtZybcjlJjbjlServiceImpl implements  HlhtZybcjlJjbjlService {

    @Autowired
    private HlhtZybcjlJjbjlDao hlhtZybcjlJjbjlDao;

    public int createHlhtZybcjlJjbjl(HlhtZybcjlJjbjl hlhtZybcjlJjbjl){
        return this.hlhtZybcjlJjbjlDao.insertHlhtZybcjlJjbjl(hlhtZybcjlJjbjl);
    }

    public int modifyHlhtZybcjlJjbjl(HlhtZybcjlJjbjl hlhtZybcjlJjbjl){
        return this.hlhtZybcjlJjbjlDao.updateHlhtZybcjlJjbjl(hlhtZybcjlJjbjl);
    }

    public int removeHlhtZybcjlJjbjl(HlhtZybcjlJjbjl hlhtZybcjlJjbjl){
        return this.hlhtZybcjlJjbjlDao.deleteHlhtZybcjlJjbjl(hlhtZybcjlJjbjl);
    }

    public HlhtZybcjlJjbjl getHlhtZybcjlJjbjl(HlhtZybcjlJjbjl hlhtZybcjlJjbjl){
        return this.hlhtZybcjlJjbjlDao.selectHlhtZybcjlJjbjl(hlhtZybcjlJjbjl);
    }

    public int getHlhtZybcjlJjbjlCount(HlhtZybcjlJjbjl hlhtZybcjlJjbjl){
        return (Integer)this.hlhtZybcjlJjbjlDao.selectHlhtZybcjlJjbjlCount(hlhtZybcjlJjbjl);
    }

    public List<HlhtZybcjlJjbjl> getHlhtZybcjlJjbjlList(HlhtZybcjlJjbjl hlhtZybcjlJjbjl){
        return this.hlhtZybcjlJjbjlDao.selectHlhtZybcjlJjbjlList(hlhtZybcjlJjbjl);
    }

    public List<HlhtZybcjlJjbjl> getHlhtZybcjlJjbjlPageList(HlhtZybcjlJjbjl hlhtZybcjlJjbjl){
        return this.hlhtZybcjlJjbjlDao.selectHlhtZybcjlJjbjlPageList(hlhtZybcjlJjbjl);
    }
}