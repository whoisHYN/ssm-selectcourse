package com.hyn.selectcourse.scheduler;


import com.hyn.selectcourse.service.CourseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.task.TaskExecutor;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;


/**
 * @author huang
 */
@Component
@Lazy(false)
public class CloseCourseJob {
    private Logger logger = LoggerFactory.getLogger(CloseCourseJob.class);

    @Autowired
    private TaskExecutor taskExecutor;
    @Autowired
    private CourseService courseService;

    @PostConstruct
    @Scheduled(cron = "0 46 12 24 3 ?")
    public void runJob() {
        try {
            logger.info("关闭选课...");
            taskExecutor.execute(new CloseTaskRunnable(courseService));
        } catch (Exception e) {
            logger.error("关闭选课错误{" + e.getMessage() + "}");
        }

    }
}
