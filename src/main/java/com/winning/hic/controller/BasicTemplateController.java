package com.winning.hic.controller;

import com.winning.hic.base.Constant;
import com.winning.hic.model.MbzDataSet;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description:基础模板配置
 * User: LENOVO
 * Date: 2018-07-26
 * Time: 9:20
 */
@RestController
public class BasicTemplateController extends BaseController {

    @ApiOperation(value = "/basic/list",notes = "加载接口表字段信息")
    @ApiImplicitParams(
        {
                @ApiImplicitParam(name = "dataSet",value = "接口表",required = true,dataType = "MbzDataSet"),
                @ApiImplicitParam(name = "config",value = "是否已经配置路径",required = false,dataType = "Integer"),
        }
    )
    @GetMapping("/basic/list")
    public Map<String, Object> loadBasicTemplateInfo(MbzDataSet dataSet, Integer config){
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constant.SUCCESS);
        result.put("rows", getFacade().getMbzDataSetService().getMbzDataSetList(dataSet));
        return result;
    }
    @ApiOperation(value = "/basic/edit",notes = "编辑接口表信息")
    @ApiImplicitParam(name = "dataSet",value = "接口表",required = true,dataType = "MbzDataSet")
    @RequestMapping(value = "/basic/edit",method = RequestMethod.POST)
    public Map<String, Object> editMbzDataSetInfo(MbzDataSet dataSet){
        getFacade().getMbzDataSetService().modifyMbzDataSet(dataSet);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constant.SUCCESS);
        return result;
    }
}
