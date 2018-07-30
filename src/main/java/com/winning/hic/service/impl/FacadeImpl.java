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
    MbzAutomateSetService mbzAutomateSetService;

    @Autowired
    MbzDatabasesListService mbzDatabasesListService;

    @Autowired
    MbzDataCheckService mbzDataCheckService;

    @Autowired
    MbzDataListSetService mbzDataListSetService;

    @Autowired
    MbzDataSetService mbzDataSetService;

    @Autowired
    MbzDictInfoService mbzDictInfoService;

    @Autowired
    MbzLogService mbzLogService;

    @Autowired
    MbzModelCheckService mbzModelCheckService;

    @Autowired
    MbzDataTemplateConfigService mbzDataTemplateConfigService;


    public EmrMxmcmlkService getEmrMxmcmlkService(){
        return emrMxmcmlkService;
    }

    public EmrMbkService getEmrMbkService(){
        return emrMbkService;
    }


    public MbzAutomateSetService getMbzAutomateSetService(){
        return mbzAutomateSetService;
    }

    public MbzDatabasesListService getMbzDatabasesListService(){
        return mbzDatabasesListService;
    }

    public MbzDataCheckService getMbzDataCheckService(){
        return mbzDataCheckService;
    }

    public MbzDataListSetService getMbzDataListSetService(){
        return mbzDataListSetService;
    }

    public MbzDictInfoService getMbzDictInfoService(){
        return mbzDictInfoService;
    }

    public MbzLogService getMbzLogService(){
        return mbzLogService;
    }

    public MbzModelCheckService getMbzModelCheckService(){
        return mbzModelCheckService;
    }

    public MbzDataTemplateConfigService getMbzDataTemplateConfigService(){
        return mbzDataTemplateConfigService;
    }

    public MbzDataSetService getMbzDataSetService(){
        return mbzDataSetService;
    }

}