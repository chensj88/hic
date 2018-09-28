package com.winning.hic.controller;

import com.winning.hic.base.Constants;
import com.winning.hic.model.MbzAutomateSet;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * @author chensj
 * @title
 * @email chensj@winning.com.cn
 * @package com.winning.hic.controller
 * @date: 2018-09-14 10:22
 */
@RestController
@RequestMapping(value = "/autoSet")
public class MbzAutomateSetController extends BaseController {

    @PostMapping(value = "/edit")
    public Map<String, Object>  addOrUpdateMbzAutomateSet(String date){
        String cronStr = convertDateStringToCronString(date);
        System.out.println(cronStr);
        int count = getFacade().getMbzAutomateSetService().getMbzAutomateSetCount(null);
        if(count > 0){
            MbzAutomateSet automateSet = getFacade().getMbzAutomateSetService().getMbzAutomateSet(null);
            automateSet.setBatchDate(date);
            automateSet.setCron(cronStr);
            getFacade().getMbzAutomateSetService().modifyMbzAutomateSet(automateSet);
        }else{
            MbzAutomateSet automateSet = new MbzAutomateSet();
            automateSet.setGroupName("HLHT");
            automateSet.setJobName("HLHT-Job");
            automateSet.setTriggerName("HLHT-Trigger");
            automateSet.setBatchDate(date);
            automateSet.setCron(cronStr);
            getFacade().getMbzAutomateSetService().createMbzAutomateSet(automateSet);
        }
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", Constants.SUCCESS);
        return result;
    }

    private String convertDateStringToCronString(String dateString){
        String[] dateArray = dateString.split(":");
        StringBuilder cronString = new StringBuilder();
        if("00".equals(dateArray[2])){
            cronString.append("* ");
        }else{
            cronString.append(dateArray[2]+" ");
        }
        if("00".equals(dateArray[1])){
            cronString.append("* ");
        }else{
            cronString.append(dateArray[1]+" ");
        }
        if("00".equals(dateArray[0])){
            cronString.append("0 ");
        }else{
            cronString.append(dateArray[0]+" ");
        }
        cronString.append("* * ?");
        return  cronString.toString();
    }
}
