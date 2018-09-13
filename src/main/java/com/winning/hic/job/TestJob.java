package com.winning.hic.job;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Component;

/**
 * @author chensj
 * @title 测试问题
 * @email chensj@winning.com.cn
 * @package com.winning.hic.job
 * @date: 2018-09-13 12:44
 */
//@Configuration
//@Component
//@EnableScheduling
public class TestJob {


    private static final Logger logger = LoggerFactory.getLogger(TestJob.class);

    public void extraData(){
        System.out.println("TestJob data extra ......");
        logger.info("TestJob data extra ......");
    }
}
