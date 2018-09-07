package com.winning.hic.controller;

import com.winning.hic.model.EmrMxmcmlk;
import com.winning.hic.model.MbzDictInfo;
import com.winning.hic.model.MBNoteTree;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: LENOVO
 * Date: 2018-07-23
 * Time: 9:09
 */
@RestController
public class TreeController extends BaseController {

    @RequestMapping(value = "/mbk/tree" , method = RequestMethod.POST)
    @ApiOperation(value = "病历模板顶级树",notes = "加载病历模板顶级树")
    public Map<String, Object> queryMBKTree(){
        Map<String, Object> result = new HashMap<>();
        result.put("status", true);
        result.put("data",getFacade().getEmrMxmcmlkService().createEmrMxmcmlkTree());
        return result;
    }

    @RequestMapping(value = "/mbk/childTree",method = RequestMethod.POST)
    @ApiOperation(value = "根据传入mldm获取子级病历模板",notes = "根据传入参数获取子级节点")
    @ApiImplicitParam(name = "mxmcmlk",value = "明细名称目录库",required = true,dataType = "EmrMxmcmlk")
    public Map<String, Object> queryMBKChildTree(EmrMxmcmlk mxmcmlk){
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", true);
        result.put("data",getFacade().getEmrMxmcmlkService().getEmrMxmcmlkListTree(mxmcmlk));
        return result;
    }


    @ApiOperation(value = "测试多库情况下，不同库运行是否正常",notes = "多库运行是否正常")
    @RequestMapping("/mbk/test")
    public Map<String, Object> test(){
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", true);
        result.put("data",getFacade().getMbzAutomateSetService().getMbzAutomateSet(null));
        return result;
    }


    @RequestMapping(value = "/dict/tree",method = RequestMethod.POST)
    @ApiOperation(value = "获取平台接口表字典数据",notes = "获取平台接口表字典数据")
    public Map<String, Object> queryDICTTree(){
        MbzDictInfo dictInfo = new MbzDictInfo();
        dictInfo.setDictCode("platformTableName");
        dictInfo.setStatus(1);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", true);
        result.put("data",getFacade().getMbzDictInfoService().getMbzDictInfoList(dictInfo));
        return result;
    }
}
