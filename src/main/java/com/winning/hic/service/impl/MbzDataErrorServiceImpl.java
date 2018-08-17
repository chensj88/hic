package com.winning.hic.service.impl;

import com.winning.hic.dao.data.MbzDataErrorDao;
import com.winning.hic.model.MbzDataError;
import com.winning.hic.service.MbzDataErrorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
* @author HLHT
* @title MBZ_DATA_ERROR
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-34-17 13:34:29
*/
@Service
public class MbzDataErrorServiceImpl implements  MbzDataErrorService {

    @Autowired
    private MbzDataErrorDao mbzDataErrorDao;

    public int createMbzDataError(MbzDataError mbzDataError){
        return this.mbzDataErrorDao.insertMbzDataError(mbzDataError);
    }

    public int modifyMbzDataError(MbzDataError mbzDataError){
        return this.mbzDataErrorDao.updateMbzDataError(mbzDataError);
    }

    public int removeMbzDataError(MbzDataError mbzDataError){
        return this.mbzDataErrorDao.deleteMbzDataError(mbzDataError);
    }

    public MbzDataError getMbzDataError(MbzDataError mbzDataError){
        return this.mbzDataErrorDao.selectMbzDataError(mbzDataError);
    }

    public int getMbzDataErrorCount(MbzDataError mbzDataError){
        return (Integer)this.mbzDataErrorDao.selectMbzDataErrorCount(mbzDataError);
    }

    public List<MbzDataError> getMbzDataErrorList(MbzDataError mbzDataError){
        return this.mbzDataErrorDao.selectMbzDataErrorList(mbzDataError);
    }

    public List<MbzDataError> getMbzDataErrorPageList(MbzDataError mbzDataError){
        return this.mbzDataErrorDao.selectMbzDataErrorPageList(mbzDataError);
    }
}