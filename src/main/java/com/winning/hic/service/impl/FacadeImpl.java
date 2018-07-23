package com.winning.hic.service.impl;

import com.winning.hic.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
/**
* @author chensj
* @title FacadeImpl
* @email chensj@163.com
* @package com.winning.hic.service.impl;
* @date 2018-05-23 09:05:16
*/
@Component
public class FacadeImpl implements Facade{

    @Autowired
    EmrMxmcmlkService emrMxmcmlkService;

    @Autowired
    EmrMbkService emrMbkService;


    public EmrMxmcmlkService getEmrMxmcmlkService(){
        return emrMxmcmlkService;
    }

    public EmrMbkService getEmrMbkService(){
        return emrMbkService;
    }

}