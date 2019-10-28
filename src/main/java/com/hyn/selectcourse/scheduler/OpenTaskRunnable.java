package com.hyn.selectcourse.scheduler;

import com.hyn.selectcourse.service.CourseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * @author huang
 */
public class OpenTaskRunnable implements Runnable {
    private Logger logger = LoggerFactory.getLogger(OpenTaskRunnable.class);

    private final CourseService courseService;

    public OpenTaskRunnable( CourseService courseService) {
        this.courseService = courseService;
    }

    @Override
    public void run() {
       courseService.openCourse();
    }

}
