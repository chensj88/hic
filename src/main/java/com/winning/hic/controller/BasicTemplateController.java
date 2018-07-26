package com.winning.hic.controller;

import org.springframework.web.bind.annotation.PostMapping;
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

    @PostMapping("/basic/")
    public Map<String, Object> loadBasicTemplateInfo(){

        Map<String, Object> result = new HashMap<String, Object>();
        result.put("total", "");
        result.put("status", "");
        result.put("rows", "");
        return result;
    }
}
