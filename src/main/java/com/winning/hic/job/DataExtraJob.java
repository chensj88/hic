package com.winning.hic.job;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Component;

/**
 * @author chensj
 * @title 数据抽取任务
 * @email chensj@winning.com.cn
 * @package com.winning.hic.job
 * @date: 2018-09-13 11:08
 */
/*@Configuration
@Component
@EnableScheduling*/
public class DataExtraJob {


    private static final Logger logger = LoggerFactory.getLogger(DataExtraJob.class);


    public void extraData(){
        System.out.println("data extra ......");
        logger.info("data extra ......");
    }
}
