package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.MbzDataError;  


/**
* @author HLHT
* @title MBZ_DATA_ERROR
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-34-17 13:34:29
*/
public interface MbzDataErrorService {

    public int createMbzDataError(MbzDataError mbzDataError);

    public int modifyMbzDataError(MbzDataError mbzDataError);

    public int removeMbzDataError(MbzDataError mbzDataError);

    public MbzDataError getMbzDataError(MbzDataError mbzDataError);

    public int getMbzDataErrorCount(MbzDataError mbzDataError);

    public List<MbzDataError> getMbzDataErrorList(MbzDataError mbzDataError);

    public List<MbzDataError> getMbzDataErrorPageList(MbzDataError mbzDataError);
}