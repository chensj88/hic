package com.winning.hic.controller;

import com.winning.hic.service.Facade;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: LENOVO
 * Date: 2018-07-23
 * Time: 9:21
 */
public class BaseController {

    @Autowired
    private Facade facade;

    public Facade getFacade() {
        return facade;
    }
}
