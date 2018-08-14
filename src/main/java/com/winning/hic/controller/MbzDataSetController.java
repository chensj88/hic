package com.winning.hic.controller;

import com.winning.hic.base.Constants;
import com.winning.hic.model.MbzDataSet;
import com.winning.hic.model.support.Row;
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
public class MbzDataSetController extends BaseController {

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
        result.put("status", Constants.SUCCESS);
        result.put("rows", getFacade().getMbzDataSetService().getMbzDataSetList(dataSet));
        return result;
    }
    @ApiOperation(value = "/basic/edit",notes = "编辑接口表信息")
    @ApiImplicitParam(name = "dataSet",value = "接口表",required = true,dataType = "MbzDataSet")
    @RequestMapping(value = "/basic/edit",method = RequestMethod.POST)
    public Map<String, Object> editMbzDataSetInfo(MbzDataSet dataSet,Integer status){
        if (status == null ){
            getFacade().getMbzDataSetService().modifyMbzDataSet(dataSet);
        }else{
            dataSet.setId(null);
            getFacade().getMbzDataSetService().createMbzDataSet(dataSet);
        }
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        return result;
    }

    @ApiOperation(value = "/basic/plist",notes = "加载接口表父级字段信息")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "row",value = "分页参数",required = true,dataType = "Row"),
                    @ApiImplicitParam(name = "dataSet",value = "接口表",required = true,dataType = "MbzDataSet"),
                    @ApiImplicitParam(name = "config",value = "是否已经配置路径",required = false,dataType = "Integer"),
            }
    )
    @GetMapping("/basic/plist")
    public Map<String, Object> loadBasicTemplateInfoList(Row row, MbzDataSet dataSet, Integer config){
        dataSet.setPId(0L);
        dataSet.setRow(row);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("total", getFacade().getMbzDataSetService().getMbzDataSetCount(dataSet));
        result.put("rows", getFacade().getMbzDataSetService().getMbzDataSetPageList(dataSet));
        return result;
    }
    @ApiOperation(value = "/basic/plist",notes = "加载接口表子级字段信息")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "row",value = "分页参数",required = true,dataType = "Row"),
                    @ApiImplicitParam(name = "dataSet",value = "接口表",required = true,dataType = "MbzDataSet"),
                    @ApiImplicitParam(name = "config",value = "是否已经配置路径",required = false,dataType = "Integer"),
            }
    )
    @GetMapping("/basic/clist")
    public Map<String, Object> loadBasicTemplateInfoListChild(Row row, MbzDataSet dataSet, Integer config){
        dataSet.setRow(row);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("total", getFacade().getMbzDataSetService().getMbzDataSetCount(dataSet));
        result.put("rows", getFacade().getMbzDataSetService().getMbzDataSetPageList(dataSet));
        return result;
    }

    @ApiOperation(value = "/basic/tree",notes = "加载当前接口表字段信息，并生成树")
    @ApiImplicitParams(
            {
                    @ApiImplicitParam(name = "dataSet",value = "接口表",required = true,dataType = "MbzDataSet")
            }
    )
    @PostMapping("/basic/tree")
    public Map<String, Object> loadColumnsForInterfaceTable(MbzDataSet dataSet){
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("data", getFacade().getMbzDataSetService().getNodeTreeFromMbzDataSet(dataSet));
        return result;
    }
}
