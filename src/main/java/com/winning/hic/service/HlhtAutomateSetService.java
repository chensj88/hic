package com.winning.hic.service;

import java.util.List;  

import com.winning.hic.model.HlhtAutomateSet;  


/**
* @author HLHT
* @title HLHT_AUTOMATE_SET
* @email Winning Health
* @package com.winning.hic.service
* @date 2018-23-25 12:23:48
*/
public interface HlhtAutomateSetService {

    public int createHlhtAutomateSet(HlhtAutomateSet hlhtAutomateSet);

    public int modifyHlhtAutomateSet(HlhtAutomateSet hlhtAutomateSet);

    public int removeHlhtAutomateSet(HlhtAutomateSet hlhtAutomateSet);

    public HlhtAutomateSet getHlhtAutomateSet(HlhtAutomateSet hlhtAutomateSet);

    public int getHlhtAutomateSetCount(HlhtAutomateSet hlhtAutomateSet);

    public List<HlhtAutomateSet> getHlhtAutomateSetList(HlhtAutomateSet hlhtAutomateSet);

    public List<HlhtAutomateSet> getHlhtAutomateSetPageList(HlhtAutomateSet hlhtAutomateSet);
}