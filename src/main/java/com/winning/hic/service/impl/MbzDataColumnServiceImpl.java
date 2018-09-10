package com.winning.hic.service.impl;

import com.winning.hic.model.support.ColumnInfo;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;  

import com.winning.hic.model.MbzDataColumn;  

import com.winning.hic.dao.data.MbzDataColumnDao;

import com.winning.hic.service.MbzDataColumnService;  


/**
* @author HLHT
* @title 【基础字段信息】服务接口
* @email Winning Health
* @package com.winning.hic.service.impl
* @date 2018-14-08 16:14:22
*/
@Service
public class MbzDataColumnServiceImpl implements  MbzDataColumnService {

    @Autowired
    private MbzDataColumnDao mbzDataColumnDao;

    public int createMbzDataColumn(MbzDataColumn mbzDataColumn){
        return this.mbzDataColumnDao.insertMbzDataColumn(mbzDataColumn);
    }

    public int modifyMbzDataColumn(MbzDataColumn mbzDataColumn){
        return this.mbzDataColumnDao.updateMbzDataColumn(mbzDataColumn);
    }

    public int removeMbzDataColumn(MbzDataColumn mbzDataColumn){
        return this.mbzDataColumnDao.deleteMbzDataColumn(mbzDataColumn);
    }

    public MbzDataColumn getMbzDataColumn(MbzDataColumn mbzDataColumn){
        return this.mbzDataColumnDao.selectMbzDataColumn(mbzDataColumn);
    }

    public int getMbzDataColumnCount(MbzDataColumn mbzDataColumn){
        return (Integer)this.mbzDataColumnDao.selectMbzDataColumnCount(mbzDataColumn);
    }

    public List<MbzDataColumn> getMbzDataColumnList(MbzDataColumn mbzDataColumn){
        return this.mbzDataColumnDao.selectMbzDataColumnList(mbzDataColumn);
    }

    public List<MbzDataColumn> getMbzDataColumnPageList(MbzDataColumn mbzDataColumn){
        return this.mbzDataColumnDao.selectMbzDataColumnPageList(mbzDataColumn);
    }

    @Override
    public List<ColumnInfo> getAllColumnsBySourceType(MbzDataColumn mbzDataColumn) {
        return this.mbzDataColumnDao.selectAllColumnsBySourceType(mbzDataColumn);
    }
}