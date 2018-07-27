package com.winning.hic.controller;

import com.winning.hic.base.Constant;
import com.winning.hic.model.HlhtDataSet;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: LENOVO
 * Date: 2018-07-26
 * Time: 9:20
 */
@RestController
public class BasicTemplateController extends BaseController {

    @GetMapping("/basic/list")
    public Map<String, Object> loadBasicTemplateInfo(HlhtDataSet dataSet){
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constant.SUCCESS);
        result.put("rows", getFacade().getHlhtDataSetService().getHlhtDataSetList(dataSet));
        return result;
    }

    @RequestMapping(value = "/basic/edit")
    public Map<String, Object> editHlhtDataSetInfo(HlhtDataSet dataSet){
        getFacade().getHlhtDataSetService().modifyHlhtDataSet(dataSet);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constant.SUCCESS);
        return result;
    }
}
