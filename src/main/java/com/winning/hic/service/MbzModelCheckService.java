package com.winning.hic.service;

import java.util.List;

import com.winning.hic.model.MbzModelCheck;


/**
 * @author MBZ
 * @title MBZ_MODEL_CHECK
 * @email Winning Health
 * @package com.winning.hic.service
 * @date 2018-23-25 12:23:55
 */
public interface MbzModelCheckService {

    public int createMbzModelCheck(MbzModelCheck mbzModelCheck);

    public int modifyMbzModelCheck(MbzModelCheck mbzModelCheck);

    public int removeMbzModelCheck(MbzModelCheck mbzModelCheck);

    public MbzModelCheck getMbzModelCheck(MbzModelCheck mbzModelCheck);

    public int getMbzModelCheckCount(MbzModelCheck mbzModelCheck);

    public List<MbzModelCheck> getMbzModelCheckList(MbzModelCheck mbzModelCheck);

    public List<MbzModelCheck> getMbzModelCheckPageList(MbzModelCheck mbzModelCheck);

    public List<MbzModelCheck> selectDataSet(MbzModelCheck mbzModelCheck);

    public List<MbzModelCheck> selectModelListBySourceType(MbzModelCheck mbzModelCheck);

    public void innitModelCheckData();

    public List<MbzModelCheck> getMbzModelCheckListNotFalse(MbzModelCheck mbzModelCheck);

}