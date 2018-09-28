package com.winning.hic.job;

import com.winning.hic.base.utils.DateUtil;
import com.winning.hic.model.MbzAutomateSet;
import com.winning.hic.service.MbzAutomateSetService;
import org.quartz.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @author chensj
 * @title 定时查库更新任务
 * @email chensj@winning.com.cn
 * @package com.winning.hic.job
 * @date: 2018-09-13 13:11
 */

/*
 * 在这个类中的方法上需要@Scheduled注解配合@EnableScheduling使用。
 * @EnableScheduling是声明这是个计划任务配置类
 * @Scheduled是声明这是个计划任务
 * @Component泛指组件，当组件不好归类的时候，我们可以使用这个注解进行标注
 * 当加入这个注解的好处是可以直接使用Spring的依赖注入
 */
@Configuration
@EnableScheduling// 必加
@Component// 必加
public class ScheduleRefreshDatabase {

    private Logger logger = LoggerFactory.getLogger(ScheduleRefreshDatabase.class);

    @Autowired
    private MbzAutomateSetService mbzAutomateSetService;

    @Autowired
    @Qualifier("jobDetail")
    private JobDetail jobDetail;

    @Autowired
    @Qualifier("jobTrigger")
    private CronTrigger cronTrigger;
    /*
     * 将QuartzConfigration.class中的调度工厂注入
     */
    @Autowired
    @Qualifier("scheduler")
    private Scheduler scheduler;

    @Scheduled(fixedRate = 1000 * 60 * 30 ) // 每隔30min查库，并根据查询结果决定是否重新设置定时任务
    public void scheduleUpdateCronTrigger() throws SchedulerException {
        logger.info("刷新定时任务信息开始：[{}]",DateUtil.format(new Date(),DateUtil.PATTERN_19));
        CronTrigger trigger = (CronTrigger) scheduler.getTrigger(cronTrigger.getKey());
        String currentCron = trigger.getCronExpression();// 当前Trigger使用的
        MbzAutomateSet automateSet = mbzAutomateSetService.getMbzAutomateSet(null);
        if(automateSet == null ){ //表示未配置时间
            automateSet = new MbzAutomateSet();
            automateSet.setGroupName("HLHT");
            automateSet.setJobName("HLHT-Job");
            automateSet.setTriggerName("HLHT-Trigger");
            automateSet.setBatchDate("2:00:00");
            automateSet.setCron("* * 2 * * ?");
            mbzAutomateSetService.createMbzAutomateSet(automateSet);
            // 表达式调度构建器
            CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule("* * 2 * * ?");
            // 按新的cronExpression表达式重新构建trigger
            trigger = (CronTrigger) scheduler.getTrigger(cronTrigger.getKey());
            trigger = trigger.getTriggerBuilder().withIdentity(cronTrigger.getKey())
                    .withSchedule(scheduleBuilder).build();
            // 按新的trigger重新设置job执行
            scheduler.rescheduleJob(cronTrigger.getKey(), trigger);
            logger.info("刷新定时任务信息结束，未配置调度规则，将采用默认规则：[{}]，设置时间是：[{}]","* * 2 * * ?",DateUtil.format(new Date(),DateUtil.PATTERN_19));
            return;
        }
        String searchCron = automateSet.getCron(); // 从数据库查询出来的
        //System.out.println(currentCron);
       // System.out.println(searchCron);
        if (currentCron.equals(searchCron)) {
            // 如果当前使用的cron表达式和从数据库中查询出来的cron表达式一致，则不刷新任务
        } else {
            logger.info("任务【" + automateSet.getJobName() + "】的调度规则已变更为[" + searchCron + "]，正在重新设置.@"+DateUtil.format(new Date(),DateUtil.PATTERN_19));
            // 表达式调度构建器
            CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(searchCron);
            // 按新的cronExpression表达式重新构建trigger
            trigger = (CronTrigger) scheduler.getTrigger(cronTrigger.getKey());
            trigger = trigger.getTriggerBuilder().withIdentity(cronTrigger.getKey())
                    .withSchedule(scheduleBuilder).build();
            // 按新的trigger重新设置job执行
            scheduler.rescheduleJob(cronTrigger.getKey(), trigger);
            currentCron = searchCron;
        }

        logger.info("刷新定时任务信息结束:[{}]",DateUtil.format(new Date(),DateUtil.PATTERN_19));
    }

}
