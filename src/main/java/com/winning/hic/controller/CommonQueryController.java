package com.winning.hic.controller;

import com.winning.hic.base.Constants;
import com.winning.hic.model.MbzDictInfo;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description: 通用控制类
 * User: LENOVO
 * Date: 2018-07-26
 * Time: 13:55
 */
@RestController
public class CommonQueryController extends BaseController {

    @ApiOperation(value = "/common/dict",notes = "根据字典类型加载字典值")
    @ApiImplicitParam(
            name = "字典代码(dictCode)",value = "dictInfo",required = true,
            dataType = "MbzDictInfo"
    )
    @PostMapping(value = "/common/dict")
    public Map<String, Object> getDictListByDictCode(MbzDictInfo dictInfo){
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        result.put("data", getFacade().getMbzDictInfoService().getMbzDictInfoList(dictInfo));
        return result;
    }
}
