package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.MbzAutomateSet;


/**
* @author MBZ
* @title MBZ_AUTOMATE_SET
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-23-25 12:23:48
*/
public interface MbzAutomateSetService {

    public int createMbzAutomateSet(MbzAutomateSet mbzAutomateSet);

    public int modifyMbzAutomateSet(MbzAutomateSet mbzAutomateSet);

    public int removeMbzAutomateSet(MbzAutomateSet mbzAutomateSet);

    public MbzAutomateSet getMbzAutomateSet(MbzAutomateSet mbzAutomateSet);

    public int getMbzAutomateSetCount(MbzAutomateSet mbzAutomateSet);

    public List<MbzAutomateSet> getMbzAutomateSetList(MbzAutomateSet mbzAutomateSet);

    public List<MbzAutomateSet> getMbzAutomateSetPageList(MbzAutomateSet mbzAutomateSet);
}