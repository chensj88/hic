package com.winning.hic.controller;

import com.winning.hic.base.Constant;
import com.winning.hic.model.MbzDictInfo;
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

    @PostMapping(value = "/common/dict")
    public Map<String, Object> getDictListByDictCode(MbzDictInfo dictInfo){
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constant.SUCCESS);
        result.put("data", getFacade().getMbzDictInfoService().getMbzDictInfoList(dictInfo));
        return result;
    }
}
