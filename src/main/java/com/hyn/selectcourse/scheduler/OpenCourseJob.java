package com.hyn.selectcourse.scheduler;


import com.hyn.selectcourse.service.CourseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.task.TaskExecutor;

import javax.inject.Inject;


//@Component
//@Lazy(false)
public class OpenCourseJob {
    private Logger logger = LoggerFactory.getLogger(OpenCourseJob.class);

    @Inject
    private TaskExecutor taskExecutor;
    @Inject
    private CourseService courseService;

    //@PostConstruct
   // @Scheduled(cron = "0 44 12 24 3 ?")
    public void runJob() {
        try {
            logger.info("开放选课...");
            taskExecutor.execute(new OpenTaskRunnable(courseService));
        } catch (Exception e) {
            logger.error("开放选课错误{" + e.getMessage() + "}");
        }

    }
}
