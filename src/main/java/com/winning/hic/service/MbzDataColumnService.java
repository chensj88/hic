package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.MbzDataColumn;
import com.winning.hic.model.support.ColumnInfo;


/**
* @author HLHT
* @title 【基础字段信息】服务接口
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-14-08 16:14:22
*/
public interface MbzDataColumnService {

    public int createMbzDataColumn(MbzDataColumn mbzDataColumn);

    public int modifyMbzDataColumn(MbzDataColumn mbzDataColumn);

    public int removeMbzDataColumn(MbzDataColumn mbzDataColumn);

    public MbzDataColumn getMbzDataColumn(MbzDataColumn mbzDataColumn);

    public int getMbzDataColumnCount(MbzDataColumn mbzDataColumn);

    public List<MbzDataColumn> getMbzDataColumnList(MbzDataColumn mbzDataColumn);

    public List<MbzDataColumn> getMbzDataColumnPageList(MbzDataColumn mbzDataColumn);

    public List<ColumnInfo> getAllColumnsBySourceType(MbzDataColumn mbzDataColumn);
}