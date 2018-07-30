package com.winning.hic.service;

/**
* @author chensj
* @title Facade
* @email chensj@163.com
* @package com.winning.hic.service;
* @date 2018-05-23 09:05:16
*/
public interface Facade {

    EmrMxmcmlkService getEmrMxmcmlkService();

    EmrQtbljlkService getEmrQtbljlkService();

    EmrMbkService getEmrMbkService();

    MbzAutomateSetService getMbzAutomateSetService();

    MbzDatabasesListService getMbzDatabasesListService();

    MbzDataCheckService getMbzDataCheckService();

    MbzDataListSetService getMbzDataListSetService();

    MbzDataSetService getMbzDataSetService();

    MbzDictInfoService getMbzDictInfoService();

    MbzLogService getMbzLogService();

    MbzModelCheckService getMbzModelCheckService();

    MbzDataTemplateConfigService getMbzDataTemplateConfigService();

}