package com.winning.hic.controller;

import com.alibaba.fastjson.JSON;
import com.winning.hic.base.Constant;
import com.winning.hic.model.MbzDataListSet;
import com.winning.hic.model.MbzDataSet;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: LENOVO
 * Date: 2018-07-30
 * Time: 14:33
 */
@RestController
public class MbzDataListSetController extends BaseController {

    @PostMapping(value = "/dataList/addOrModify")
    @ApiOperation(value = "/dataList/addOrModify",notes = "新增或者修改互利互通数据集与CIS模板关系")
    @ApiImplicitParam(value = "字典值和模板集合",name = "新增或者修改互利互通数据集与CIS模板关系",required = true,dataType = "List")
    public Map<String, Object> addOrModifyDataListSet(@RequestBody List<MbzDataListSet> mbzDataListSetList){
        getFacade().getMbzDataListSetService().createMbzDataListSetForList(mbzDataListSetList);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constant.SUCCESS);
        return result;
    }

    @PostMapping(value = "/dataList/queryConfigTemplate")
    @ApiOperation(value = "/dataList/queryConfigTemplate",notes = "查询已配置互利互通数据集与CIS模板关系")
    @ApiImplicitParam(value = "查询已配置互利互通数据集与CIS模板关系",name = "查询已配置互利互通数据集与CIS模板关系",required = true,dataType = "MbzDataListSet")
    public Map<String, Object> queryConfigTemplate(MbzDataListSet MbzDataListSet){
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constant.SUCCESS);
        result.put("data",  getFacade().getMbzDataListSetService().getMbzDataListSetModelCodeList(MbzDataListSet));
        return result;
    }
}
