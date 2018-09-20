package com.winning.hic.job;

import com.winning.hic.base.utils.DateUtil;
import org.quartz.Trigger;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.quartz.CronTriggerFactoryBean;
import org.springframework.scheduling.quartz.MethodInvokingJobDetailFactoryBean;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

import java.util.Date;
import java.util.List;

/**
 * @author chensj
 * @title Quatrz定时任务配置
 * @email chensj@winning.com.cn
 * @package com.winning.hic.job
 * @date: 2018-09-13 11:13
 */
@Configuration
public class QuatrzConfig {

    private Logger logger = LoggerFactory.getLogger(QuatrzConfig.class);
    /**
     * 配置定时任务
     * @param extraJob extraJob为需要执行的任务，即任务类
     * @return
     */
    @Bean(name = "jobDetail")
    public MethodInvokingJobDetailFactoryBean detailFactoryBean(DataExtraJob extraJob){
        MethodInvokingJobDetailFactoryBean jobDetail = new MethodInvokingJobDetailFactoryBean();
        jobDetail.setConcurrent(false); //是否并发执行
        jobDetail.setName("HLHT-DATA-EXTRA");// 设置任务的名字
        jobDetail.setGroup("HLHT");// 设置任务的分组，这些属性
        jobDetail.setTargetObject(extraJob); //为需要执行的实体类对应的对象
        jobDetail.setTargetMethod("extraData");//需要执行的方法
        // 通过这几个配置，告诉JobDetailFactoryBean我们需要执行定时执行DataExtraJob类中的extraData方法
        logger.info("定时任务【数据抽取】配置完成@[{}]",DateUtil.format(new Date(),DateUtil.PATTERN_19));
        return jobDetail;
    }

    /**
     * 配置定时任务的触发器，也就是什么时候触发执行定时任务
     * @param jobDetail
     * @return
     */
    @Bean(name = "jobTrigger")
    public CronTriggerFactoryBean cronJobTrigger(@Qualifier("jobDetail") MethodInvokingJobDetailFactoryBean jobDetail){
        CronTriggerFactoryBean tigger = new CronTriggerFactoryBean();
        tigger.setJobDetail(jobDetail.getObject());
        tigger.setCronExpression("* * 2 * * ?");// 初始时的cron表达式
        tigger.setName("HLHT-TRIGGER");// trigger的name
        logger.info("定时触发器【数据抽取】配置完成@[{}]",DateUtil.format(new Date(),DateUtil.PATTERN_19));
        return tigger;
    }
    //=========================测试代码===================
   /* @Bean(name = "testJobDetail")
    public MethodInvokingJobDetailFactoryBean testDetailFactoryBean(TestJob testJob){
        MethodInvokingJobDetailFactoryBean jobDetail = new MethodInvokingJobDetailFactoryBean();
        jobDetail.setConcurrent(false); //是否并发执行
        jobDetail.setName("test-data-extra-hlht");// 设置任务的名字
        jobDetail.setGroup("hlht");// 设置任务的分组，这些属性
        jobDetail.setTargetObject(testJob); //为需要执行的实体类对应的对象
        jobDetail.setTargetMethod("extraData");//需要执行的方法
        // 通过这几个配置，告诉JobDetailFactoryBean我们需要执行定时执行DataExtraJob类中的extraData方法
        logger.info("测试定时任务【数据抽取】配置完成");
        return jobDetail;
    }

    @Bean(name = "testJobTrigger")
    public CronTriggerFactoryBean testCronJobTrigger(@Qualifier("testJobDetail") MethodInvokingJobDetailFactoryBean testJobDetail){
        CronTriggerFactoryBean tigger = new CronTriggerFactoryBean();
        tigger.setJobDetail(testJobDetail.getObject());
        tigger.setCronExpression("40-50 * * * * ?");// 初始时的cron表达式
        tigger.setName("test-hlht-trigger");// trigger的name
        logger.info("测试定时触发器【数据抽取】配置完成");
        return tigger;
    }*/
    //====================================================
    /**
     * 定义quartz调度工厂
     * @param triggers
     * @return
     */
    @Bean(name = "scheduler")
    public SchedulerFactoryBean schedulerFactory(Trigger triggers){
        SchedulerFactoryBean bean = new SchedulerFactoryBean();
        // 用于quartz集群,QuartzScheduler 启动时更新己存在的Job
        bean.setOverwriteExistingJobs(true);
        // 延时启动，应用启动1秒后
        bean.setStartupDelay(1);
        // 注册触发器
        bean.setTriggers(triggers);
        logger.info("调度工厂配置完成,Quartz在应用启动1秒后启动@[{}]",DateUtil.format(new Date(),DateUtil.PATTERN_19));
        return bean;
    }
}
