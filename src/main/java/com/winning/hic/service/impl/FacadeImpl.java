package com.winning.hic.service.impl;

import com.winning.hic.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
/**
* @author chensj
* @title FacadeImpl
* @email chensj@163.com
* @package com.winning.hic.service.impl;
* @date 2018-05-23 09:05:16
*/
@Component
public class FacadeImpl implements Facade{

    @Autowired
    EmrMxmcmlkService emrMxmcmlkService;

    @Autowired
    EmrMbkService emrMbkService;

    @Autowired
    HlhtAutomateSetService hlhtAutomateSetService;

    @Autowired
    HlhtDatabasesListService hlhtDatabasesListService;

    @Autowired
    HlhtDataCheckService hlhtDataCheckService;

    @Autowired
    HlhtDataListSetService hlhtDataListSetService;

    @Autowired
    HlhtDataSetService hlhtDataSetService;

    @Autowired
    HlhtDictInfoService hlhtDictInfoService;

    @Autowired
    HlhtLogService hlhtLogService;

    @Autowired
    HlhtModelCheckService hlhtModelCheckService;

    @Autowired
    HlhtDataTemplateConfigService hlhtDataTemplateConfigService;


    public EmrMxmcmlkService getEmrMxmcmlkService(){
        return emrMxmcmlkService;
    }

    public EmrMbkService getEmrMbkService(){
        return emrMbkService;
    }


    public HlhtAutomateSetService getHlhtAutomateSetService(){
        return hlhtAutomateSetService;
    }

    public HlhtDatabasesListService getHlhtDatabasesListService(){
        return hlhtDatabasesListService;
    }

    public HlhtDataCheckService getHlhtDataCheckService(){
        return hlhtDataCheckService;
    }

    public HlhtDataListSetService getHlhtDataListSetService(){
        return hlhtDataListSetService;
    }

    public HlhtDictInfoService getHlhtDictInfoService(){
        return hlhtDictInfoService;
    }

    public HlhtLogService getHlhtLogService(){
        return hlhtLogService;
    }

    public HlhtModelCheckService getHlhtModelCheckService(){
        return hlhtModelCheckService;
    }

    public HlhtDataTemplateConfigService getHlhtDataTemplateConfigService(){
        return hlhtDataTemplateConfigService;
    }

    public HlhtDataSetService getHlhtDataSetService(){
        return hlhtDataSetService;
    }

}