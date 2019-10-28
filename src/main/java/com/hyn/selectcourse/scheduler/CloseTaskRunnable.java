package com.hyn.selectcourse.scheduler;

import com.hyn.selectcourse.service.CourseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * @author huang
 */
public class CloseTaskRunnable implements Runnable {
    private Logger logger = LoggerFactory.getLogger(CloseTaskRunnable.class);

    private final CourseService courseService;

    public CloseTaskRunnable(CourseService courseService) {

        this.courseService = courseService;
    }

    @Override
    public void run() {
       courseService.closeCourse();
    }

}
