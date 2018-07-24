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

    EmrMbkService getEmrMbkService();

    HlhtAutomateSetService getHlhtAutomateSetService();

    HlhtDatabasesListService getHlhtDatabasesListService();

    HlhtDataCheckService getHlhtDataCheckService();

    HlhtDataListSetService getHlhtDataListSetService();

    HlhtDataSetService getHlhtDataSetService();

    HlhtDictInfoService getHlhtDictInfoService();

    HlhtLogService getHlhtLogService();

    HlhtModelCheckService getHlhtModelCheckService();
}