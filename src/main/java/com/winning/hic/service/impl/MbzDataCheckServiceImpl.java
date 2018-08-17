package com.winning.hic.service.impl;

import com.winning.hic.dao.data.MbzDataCheckDao;
import com.winning.hic.model.MbzDataCheck;
import com.winning.hic.service.MbzDataCheckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title MBZ_DATA_CHECK
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-34-17 13:34:32
*/
@Service
public class MbzDataCheckServiceImpl implements  MbzDataCheckService {

    @Autowired
    private MbzDataCheckDao mbzDataCheckDao;

    public int createMbzDataCheck(MbzDataCheck mbzDataCheck){
        return this.mbzDataCheckDao.insertMbzDataCheck(mbzDataCheck);
    }

    public int modifyMbzDataCheck(MbzDataCheck mbzDataCheck){
        return this.mbzDataCheckDao.updateMbzDataCheck(mbzDataCheck);
    }

    public int removeMbzDataCheck(MbzDataCheck mbzDataCheck){
        return this.mbzDataCheckDao.deleteMbzDataCheck(mbzDataCheck);
    }

    public MbzDataCheck getMbzDataCheck(MbzDataCheck mbzDataCheck){
        return this.mbzDataCheckDao.selectMbzDataCheck(mbzDataCheck);
    }

    public int getMbzDataCheckCount(MbzDataCheck mbzDataCheck){
        return (Integer)this.mbzDataCheckDao.selectMbzDataCheckCount(mbzDataCheck);
    }

    public List<MbzDataCheck> getMbzDataCheckList(MbzDataCheck mbzDataCheck){
        return this.mbzDataCheckDao.selectMbzDataCheckList(mbzDataCheck);
    }

    public List<MbzDataCheck> getMbzDataCheckPageList(MbzDataCheck mbzDataCheck){
        return this.mbzDataCheckDao.selectMbzDataCheckPageList(mbzDataCheck);
    }
}