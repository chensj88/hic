package com.winning.hic.controller;

import com.winning.hic.model.EmrMxmcmlk;
import com.winning.hic.model.MBNoteTree;
import org.springframework.web.bind.annotation.RequestMapping;
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

    @RequestMapping("/mbk/tree")
    public Map<String, Object> queryMBKTree(){
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", true);
        result.put("data",getFacade().getEmrMxmcmlkService().createEmrMxmcmlkTree());
        return result;
    }

    @RequestMapping("/mbk/childTree")
    public Map<String, Object> queryMBKChildTree(EmrMxmcmlk mxmcmlk){
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", true);
        result.put("data",getFacade().getEmrMxmcmlkService().getEmrMxmcmlkListTree(mxmcmlk));
        return result;
    }
}
