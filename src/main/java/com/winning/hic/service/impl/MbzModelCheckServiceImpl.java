package com.winning.hic.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import com.winning.hic.model.MbzModelCheck;

import com.winning.hic.dao.data.MbzModelCheckDao;

import com.winning.hic.service.MbzModelCheckService;


/**
 * @author MBZ
 * @title MBZ_MODEL_CHECK
 * @email Winning Health
 * @package com.winning.hic.service.impl
 * @date 2018-23-25 12:23:55
 */
@Service
public class MbzModelCheckServiceImpl implements MbzModelCheckService {

    @Autowired
    private MbzModelCheckDao mbzModelCheckDao;

    public int createMbzModelCheck(MbzModelCheck mbzModelCheck) {
        return this.mbzModelCheckDao.insertMbzModelCheck(mbzModelCheck);
    }

    public int modifyMbzModelCheck(MbzModelCheck mbzModelCheck) {
        return this.mbzModelCheckDao.updateMbzModelCheck(mbzModelCheck);
    }

    public int removeMbzModelCheck(MbzModelCheck mbzModelCheck) {
        return this.mbzModelCheckDao.deleteMbzModelCheck(mbzModelCheck);
    }

    public MbzModelCheck getMbzModelCheck(MbzModelCheck mbzModelCheck) {
        return this.mbzModelCheckDao.selectMbzModelCheck(mbzModelCheck);
    }

    public int getMbzModelCheckCount(MbzModelCheck mbzModelCheck) {
        return (Integer) this.mbzModelCheckDao.selectMbzModelCheckCount(mbzModelCheck);
    }

    public List<MbzModelCheck> getMbzModelCheckList(MbzModelCheck mbzModelCheck) {
        return this.mbzModelCheckDao.selectMbzModelCheckList(mbzModelCheck);
    }

    public List<MbzModelCheck> getMbzModelCheckPageList(MbzModelCheck mbzModelCheck) {
        return this.mbzModelCheckDao.selectMbzModelCheckPageList(mbzModelCheck);
    }

    @Override
    public List<MbzModelCheck> selectDataSet(MbzModelCheck mbzModelCheck) {
        return this.mbzModelCheckDao.selectDataSet(mbzModelCheck);
    }

    @Override
    public List<MbzModelCheck> selectModelListBySourceType(MbzModelCheck mbzModelCheck) {
        return this.mbzModelCheckDao.selectModelListBySourceType(mbzModelCheck);
    }

    @Override
    public void innitModelCheckData() {
        this.mbzModelCheckDao.innitModelCheckData();
    }

    @Override
    public List<MbzModelCheck> getMbzModelCheckListNotFalse(MbzModelCheck mbzModelCheck) {
        return this.mbzModelCheckDao.getMbzModelCheckListNotFalse(mbzModelCheck);
    }
}