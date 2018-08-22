package com.winning.hic.service.impl;

import com.winning.hic.dao.cisdb.CommonQueryDao;
import com.winning.hic.dao.data.HlhtBlgyJbjkxxDao;
import com.winning.hic.model.HlhtBlgyJbjkxx;
import com.winning.hic.model.MbzDataCheck;
import com.winning.hic.service.HlhtBlgyJbjkxxService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title HLHT_BLGY_JBJKXX
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-28-31 16:28:56
*/
@Service
public class HlhtBlgyJbjkxxServiceImpl implements  HlhtBlgyJbjkxxService {

    private final Logger logger = LoggerFactory.getLogger(HlhtBlgyJbjkxxServiceImpl.class);
    @Autowired
    private HlhtBlgyJbjkxxDao hlhtBlgyJbjkxxDao;
    @Autowired
    private CommonQueryDao commonQueryDao;
    public int createHlhtBlgyJbjkxx(HlhtBlgyJbjkxx hlhtBlgyJbjkxx){
        return this.hlhtBlgyJbjkxxDao.insertHlhtBlgyJbjkxx(hlhtBlgyJbjkxx);
    }

    public int modifyHlhtBlgyJbjkxx(HlhtBlgyJbjkxx hlhtBlgyJbjkxx){
        return this.hlhtBlgyJbjkxxDao.updateHlhtBlgyJbjkxx(hlhtBlgyJbjkxx);
    }

    public int removeHlhtBlgyJbjkxx(HlhtBlgyJbjkxx hlhtBlgyJbjkxx){
        return this.hlhtBlgyJbjkxxDao.deleteHlhtBlgyJbjkxx(hlhtBlgyJbjkxx);
    }

    public HlhtBlgyJbjkxx getHlhtBlgyJbjkxx(HlhtBlgyJbjkxx hlhtBlgyJbjkxx){
        return this.hlhtBlgyJbjkxxDao.selectHlhtBlgyJbjkxx(hlhtBlgyJbjkxx);
    }

    public int getHlhtBlgyJbjkxxCount(HlhtBlgyJbjkxx hlhtBlgyJbjkxx){
        return (Integer)this.hlhtBlgyJbjkxxDao.selectHlhtBlgyJbjkxxCount(hlhtBlgyJbjkxx);
    }

    public List<HlhtBlgyJbjkxx> getHlhtBlgyJbjkxxList(HlhtBlgyJbjkxx hlhtBlgyJbjkxx){
        return this.hlhtBlgyJbjkxxDao.selectHlhtBlgyJbjkxxList(hlhtBlgyJbjkxx);
    }

    public List<HlhtBlgyJbjkxx> getHlhtBlgyJbjkxxPageList(HlhtBlgyJbjkxx hlhtBlgyJbjkxx){
        return this.hlhtBlgyJbjkxxDao.selectHlhtBlgyJbjkxxPageList(hlhtBlgyJbjkxx);
    }

    @Override
    public List<MbzDataCheck> interfaceHlhtBlgyJbjkxx(HlhtBlgyJbjkxx jbjkxx) {
        List<MbzDataCheck> dataCheckList = null;
        List<HlhtBlgyJbjkxx> jbjkxxList = commonQueryDao.selectInitHlhtBlgyJbjkxx(jbjkxx);
        for (HlhtBlgyJbjkxx jbxx : jbjkxxList) {
            //清除历史数据
            HlhtBlgyJbjkxx tempJbxx = new HlhtBlgyJbjkxx();
            tempJbxx.setYjlxh(jbxx.getYjlxh());
            this.hlhtBlgyJbjkxxDao.deleteHlhtBlgyJbjkxx(tempJbxx);
            logger.info("Model:{}", jbxx);
            //创建新的数据
            this.hlhtBlgyJbjkxxDao.insertHlhtBlgyJbjkxx(jbxx);
        }
        return dataCheckList;
    }
}