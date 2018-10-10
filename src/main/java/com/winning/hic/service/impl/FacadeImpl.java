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
public class FacadeImpl implements Facade {

    @Autowired
    EmrHzsqdjlkService emrHzsqdjlkService;

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

    @Autowired
    EmrQtbljlkService emrQtbljlkService;

    @Autowired
    HlhtBlgyJbjkxxService hlhtBlgyJbjkxxService;

    @Autowired
    HlhtBlgyWssjzyService hlhtBlgyWssjzyService;

    @Autowired
    HlhtCyxjCyxjService hlhtCyxjCyxjService;

    @Autowired
    HlhtMjzblJzlgblService hlhtMjzblJzlgblService;

    @Autowired
    HlhtMjzblMjzblService hlhtMjzblMjzblService;

    @Autowired
    HlhtMjzcfXycfService hlhtMjzcfXycfService;

    @Autowired
    HlhtMjzcfZycfService hlhtMjzcfZycfService;

    @Autowired
    HlhtRyjlJbxxService hlhtRyjlJbxxService;

    @Autowired
    HlhtRyjlRcyjlService hlhtRyjlRcyjlService;

    @Autowired
    HlhtRyjlRyswjlService hlhtRyjlRyswjlService;

    @Autowired
    HlhtZcjlPgcService hlhtZcjlPgcService;

    @Autowired
    HlhtZcjlYdfmService hlhtZcjlYdfmService;

    @Autowired
    HlhtZlczjlMzshfsjlService hlhtZlczjlMzshfsjlService;

    @Autowired
    HlhtZlczjlMzsqfsjlService hlhtZlczjlMzsqfsjlService;

    @Autowired
    HlhtZlczjlSxjlService hlhtZlczjlSxjlService;

    @Autowired
    HlhtZlczjlYbssjlService hlhtZlczjlYbssjlService;

    @Autowired
    HlhtZlczjlZljlService hlhtZlczjlZljlService;

    @Autowired
    HlhtZqgzxxBwztzsService hlhtZqgzxxBwztzsService;

    @Autowired
    HlhtZqgzxxMzzqtysService hlhtZqgzxxMzzqtysService;

    @Autowired
    HlhtZqgzxxQtzqtysService hlhtZqgzxxQtzqtysService;

    @Autowired
    HlhtZqgzxxSstysService hlhtZqgzxxSstysService;

    @Autowired
    HlhtZqgzxxSxzltysService hlhtZqgzxxSxzltysService;

    @Autowired
    HlhtZqgzxxTsjczltysService hlhtZqgzxxTsjczltysService;

    @Autowired
    HlhtZybcjlCyjlService hlhtZybcjlCyjlService;

    @Autowired
    HlhtZybcjlHzjlService hlhtZybcjlHzjlService;

    @Autowired
    HlhtZybcjlJdxjService hlhtZybcjlJdxjService;

    @Autowired
    HlhtZybcjlJjbjlService hlhtZybcjlJjbjlService;

    @Autowired
    HlhtZybcjlQjjlService hlhtZybcjlQjjlService;

    @Autowired
    HlhtZybcjlRcbcjlService hlhtZybcjlRcbcjlService;

    @Autowired
    HlhtZybcjlScbcjlService hlhtZybcjlScbcjlService;

    @Autowired
    HlhtZybcjlShscbcjlService hlhtZybcjlShscbcjlService;

    @Autowired
    HlhtZybcjlSjyscfjlService hlhtZybcjlSjyscfjlService;

    @Autowired
    HlhtZybcjlSqtlService hlhtZybcjlSqtlService;

    @Autowired
    HlhtZybcjlSqxjService hlhtZybcjlSqxjService;

    @Autowired
    HlhtZybcjlSwbltljlService hlhtZybcjlSwbltljlService;

    @Autowired
    HlhtZybcjlSwjlService hlhtZybcjlSwjlService;

    @Autowired
    HlhtZybcjlYnbltljlService hlhtZybcjlYnbltljlService;

    @Autowired
    HlhtZybcjlZkjlService hlhtZybcjlZkjlService;

    @Autowired
    HlhtZzyjlZzyjlService hlhtZzyjlZzyjlService;

    @Autowired
    MbzDataErrorService mbzDataErrorService;

    @Override
    public EmrHzsqdjlkService getEmrHzsqdjlkService() {
        return emrHzsqdjlkService;
    }

    public HlhtBlgyJbjkxxService getHlhtBlgyJbjkxxService() {
        return hlhtBlgyJbjkxxService;
    }

    public HlhtBlgyWssjzyService getHlhtBlgyWssjzyService() {
        return hlhtBlgyWssjzyService;
    }

    public HlhtCyxjCyxjService getHlhtCyxjCyxjService() {
        return hlhtCyxjCyxjService;
    }

    public HlhtMjzblJzlgblService getHlhtMjzblJzlgblService() {
        return hlhtMjzblJzlgblService;
    }

    public HlhtMjzblMjzblService getHlhtMjzblMjzblService() {
        return hlhtMjzblMjzblService;
    }

    public HlhtMjzcfXycfService getHlhtMjzcfXycfService() {
        return hlhtMjzcfXycfService;
    }

    public HlhtMjzcfZycfService getHlhtMjzcfZycfService() {
        return hlhtMjzcfZycfService;
    }

    public HlhtRyjlJbxxService getHlhtRyjlJbxxService() {
        return hlhtRyjlJbxxService;
    }

    public HlhtRyjlRcyjlService getHlhtRyjlRcyjlService() {
        return hlhtRyjlRcyjlService;
    }

    public HlhtRyjlRyswjlService getHlhtRyjlRyswjlService() {
        return hlhtRyjlRyswjlService;
    }

    public HlhtZcjlPgcService getHlhtZcjlPgcService() {
        return hlhtZcjlPgcService;
    }

    public HlhtZcjlYdfmService getHlhtZcjlYdfmService() {
        return hlhtZcjlYdfmService;
    }

    public HlhtZlczjlMzshfsjlService getHlhtZlczjlMzshfsjlService() {
        return hlhtZlczjlMzshfsjlService;
    }

    public HlhtZlczjlMzsqfsjlService getHlhtZlczjlMzsqfsjlService() {
        return hlhtZlczjlMzsqfsjlService;
    }

    public HlhtZlczjlSxjlService getHlhtZlczjlSxjlService() {
        return hlhtZlczjlSxjlService;
    }

    public HlhtZlczjlYbssjlService getHlhtZlczjlYbssjlService() {
        return hlhtZlczjlYbssjlService;
    }

    public HlhtZlczjlZljlService getHlhtZlczjlZljlService() {
        return hlhtZlczjlZljlService;
    }

    public HlhtZqgzxxBwztzsService getHlhtZqgzxxBwztzsService() {
        return hlhtZqgzxxBwztzsService;
    }

    public HlhtZqgzxxMzzqtysService getHlhtZqgzxxMzzqtysService() {
        return hlhtZqgzxxMzzqtysService;
    }

    public HlhtZqgzxxQtzqtysService getHlhtZqgzxxQtzqtysService() {
        return hlhtZqgzxxQtzqtysService;
    }

    public HlhtZqgzxxSstysService getHlhtZqgzxxSstysService() {
        return hlhtZqgzxxSstysService;
    }

    public HlhtZqgzxxSxzltysService getHlhtZqgzxxSxzltysService() {
        return hlhtZqgzxxSxzltysService;
    }

    public HlhtZqgzxxTsjczltysService getHlhtZqgzxxTsjczltysService() {
        return hlhtZqgzxxTsjczltysService;
    }

    public HlhtZybcjlCyjlService getHlhtZybcjlCyjlService() {
        return hlhtZybcjlCyjlService;
    }

    public HlhtZybcjlHzjlService getHlhtZybcjlHzjlService() {
        return hlhtZybcjlHzjlService;
    }

    public HlhtZybcjlJdxjService getHlhtZybcjlJdxjService() {
        return hlhtZybcjlJdxjService;
    }

    public HlhtZybcjlJjbjlService getHlhtZybcjlJjbjlService() {
        return hlhtZybcjlJjbjlService;
    }

    public HlhtZybcjlQjjlService getHlhtZybcjlQjjlService() {
        return hlhtZybcjlQjjlService;
    }

    public HlhtZybcjlRcbcjlService getHlhtZybcjlRcbcjlService() {
        return hlhtZybcjlRcbcjlService;
    }

    public HlhtZybcjlScbcjlService getHlhtZybcjlScbcjlService() {
        return hlhtZybcjlScbcjlService;
    }

    public HlhtZybcjlShscbcjlService getHlhtZybcjlShscbcjlService() {
        return hlhtZybcjlShscbcjlService;
    }

    public HlhtZybcjlSjyscfjlService getHlhtZybcjlSjyscfjlService() {
        return hlhtZybcjlSjyscfjlService;
    }

    public HlhtZybcjlSqtlService getHlhtZybcjlSqtlService() {
        return hlhtZybcjlSqtlService;
    }

    public HlhtZybcjlSqxjService getHlhtZybcjlSqxjService() {
        return hlhtZybcjlSqxjService;
    }

    public HlhtZybcjlSwbltljlService getHlhtZybcjlSwbltljlService() {
        return hlhtZybcjlSwbltljlService;
    }

    public HlhtZybcjlSwjlService getHlhtZybcjlSwjlService() {
        return hlhtZybcjlSwjlService;
    }

    public HlhtZybcjlYnbltljlService getHlhtZybcjlYnbltljlService() {
        return hlhtZybcjlYnbltljlService;
    }

    public HlhtZybcjlZkjlService getHlhtZybcjlZkjlService() {
        return hlhtZybcjlZkjlService;
    }

    public HlhtZzyjlZzyjlService getHlhtZzyjlZzyjlService() {
        return hlhtZzyjlZzyjlService;
    }


    public EmrQtbljlkService getEmrQtbljlkService() {
        return emrQtbljlkService;
    }


    public EmrMxmcmlkService getEmrMxmcmlkService() {
        return emrMxmcmlkService;
    }

    public EmrMbkService getEmrMbkService() {
        return emrMbkService;
    }


    public MbzAutomateSetService getMbzAutomateSetService() {
        return mbzAutomateSetService;
    }

    public MbzDatabasesListService getMbzDatabasesListService() {
        return mbzDatabasesListService;
    }

    public MbzDataCheckService getMbzDataCheckService() {
        return mbzDataCheckService;
    }

    public MbzDataListSetService getMbzDataListSetService() {
        return mbzDataListSetService;
    }

    public MbzDictInfoService getMbzDictInfoService() {
        return mbzDictInfoService;
    }

    public MbzLogService getMbzLogService() {
        return mbzLogService;
    }

    public MbzModelCheckService getMbzModelCheckService() {
        return mbzModelCheckService;
    }

    public MbzDataTemplateConfigService getMbzDataTemplateConfigService() {
        return mbzDataTemplateConfigService;
    }

    public MbzDataSetService getMbzDataSetService() {
        return mbzDataSetService;
    }

    public MbzDataErrorService getMbzDataErrorService() {
        return mbzDataErrorService;
    }

    @Autowired
    OutpJzjlkService outpJzjlkService;

    @Autowired
    OutpOrderService outpOrderService;

    @Autowired
    OutpOrderitemService outpOrderitemService;


    public OutpJzjlkService getOutpJzjlkService(){
        return outpJzjlkService;
    }

    public OutpOrderService getOutpOrderService(){
        return outpOrderService;
    }

    public OutpOrderitemService getOutpOrderitemService(){
        return outpOrderitemService;
    }

    @Autowired
    EmrMbmxkService emrMbmxkService;

    public EmrMbmxkService getEmrMbmxkService(){
        return emrMbmxkService;
    }
    @Autowired
    MbzDataColumnService mbzDataColumnService;

    public MbzDataColumnService getMbzDataColumnService(){
        return mbzDataColumnService;
    }

    @Autowired
    MbzLoadDataInfoService mbzLoadDataInfoService;

    public MbzLoadDataInfoService getMbzLoadDataInfoService(){
        return mbzLoadDataInfoService;
    }

    @Autowired
    MbzTemplateNodeDetailInfoService mbzTemplateNodeDetailInfoService;

    public MbzTemplateNodeDetailInfoService getMbzTemplateNodeDetailInfoService(){
        return mbzTemplateNodeDetailInfoService;
    }
}