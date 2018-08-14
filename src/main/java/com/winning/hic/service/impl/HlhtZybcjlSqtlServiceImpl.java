package com.winning.hic.service.impl;

import com.winning.hic.dao.data.HlhtZybcjlSqtlDao;
import com.winning.hic.model.HlhtZybcjlSqtl;
import com.winning.hic.model.MbzDataCheck;
import com.winning.hic.service.HlhtZybcjlSqtlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_ZYBCJL_SQTL
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-34-31 16:34:26
*/
@Service
public class HlhtZybcjlSqtlServiceImpl implements  HlhtZybcjlSqtlService {

    @Autowired
    private HlhtZybcjlSqtlDao hlhtZybcjlSqtlDao;

    public int createHlhtZybcjlSqtl(HlhtZybcjlSqtl hlhtZybcjlSqtl){
        return this.hlhtZybcjlSqtlDao.insertHlhtZybcjlSqtl(hlhtZybcjlSqtl);
    }

    public int modifyHlhtZybcjlSqtl(HlhtZybcjlSqtl hlhtZybcjlSqtl){
        return this.hlhtZybcjlSqtlDao.updateHlhtZybcjlSqtl(hlhtZybcjlSqtl);
    }

    public int removeHlhtZybcjlSqtl(HlhtZybcjlSqtl hlhtZybcjlSqtl){
        return this.hlhtZybcjlSqtlDao.deleteHlhtZybcjlSqtl(hlhtZybcjlSqtl);
    }

    public HlhtZybcjlSqtl getHlhtZybcjlSqtl(HlhtZybcjlSqtl hlhtZybcjlSqtl){
        return this.hlhtZybcjlSqtlDao.selectHlhtZybcjlSqtl(hlhtZybcjlSqtl);
    }

    public int getHlhtZybcjlSqtlCount(HlhtZybcjlSqtl hlhtZybcjlSqtl){
        return (Integer)this.hlhtZybcjlSqtlDao.selectHlhtZybcjlSqtlCount(hlhtZybcjlSqtl);
    }

    public List<HlhtZybcjlSqtl> getHlhtZybcjlSqtlList(HlhtZybcjlSqtl hlhtZybcjlSqtl){
        return this.hlhtZybcjlSqtlDao.selectHlhtZybcjlSqtlList(hlhtZybcjlSqtl);
    }

    public List<HlhtZybcjlSqtl> getHlhtZybcjlSqtlPageList(HlhtZybcjlSqtl hlhtZybcjlSqtl){
        return this.hlhtZybcjlSqtlDao.selectHlhtZybcjlSqtlPageList(hlhtZybcjlSqtl);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtZybcjlSqtl(HlhtZybcjlSqtl hlhtZybcjlSqtl) {
        List<MbzDataCheck> dataCheckList = null;
        return dataCheckList;
    }
}