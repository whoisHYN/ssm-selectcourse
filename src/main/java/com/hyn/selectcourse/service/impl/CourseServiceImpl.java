package com.hyn.selectcourse.service.impl;

import com.hyn.selectcourse.dao.CourseDao;
import com.hyn.selectcourse.model.Course;
import com.hyn.selectcourse.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional(rollbackFor = Exception.class)
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseDao courseDao;
    @Override
    public void addCourse(Course course) {
        courseDao.addCourse(course);
    }

    @Override
    public Integer isExistCourse(Map map) {
        return courseDao.isExistCourse(map);
    }

    @Override
    public void insertUserCourse(Map map) {
        courseDao.insertUSerCourse(map);
    }

    @Override
    public void addChooseCourse(Long id) {
        courseDao.addChooseCourse(id);
    }

    @Override
    public void reduceChooseCourse(Long id) {
        courseDao.reduceChooseCourse(id);
    }

    @Override
    public List<Course> getNoChooseCourseList(Map map) {
        return courseDao.getNoChooseCourseList(map);
    }

    @Override
    public Integer getNoChooseCourseListCount(Map map) {
        return courseDao.getNoChooseCourseListCount(map);
    }

    @Override
    public List<Course> getChooseCourseList(Map map) {
        return courseDao.getChooseCourseList(map);
    }

    @Override
    public Integer getChooseCourseListCount(Map map) {
        return courseDao.getChooseCourseListCount(map);
    }

    @Override
    public Course getCourseById(Long id) {
        return courseDao.getCourseById(id);
    }

    @Override
    public int getSaveTimeCourse(Map map) {
        return courseDao.getSaveTimeCourse(map);
    }

    @Override
    public int getAllCredit(String loginName) {
        return courseDao.getAllCredit(loginName);
    }

    @Override
    public void deleteCourse(Map map) {
        courseDao.deleteCourse(map);
    }

    @Override
    public List<Map> getMessageListByCourseId(Map map) {
        return courseDao.getMessageListByCourseId(map);
    }

    @Override
    public int getMessageCountByCourseId(Long courseId) {
        return courseDao.getMessageCountByCourseId(courseId);
    }

    @Override
    public void addMessage(Map map) {
        courseDao.addMessage(map);
    }

    @Override
    public void openCourse() {
        courseDao.openCourse();
    }

    @Override
    public void closeCourse() {
        courseDao.closeCourse();
    }

    @Override
    public int noOpen() {
        return courseDao.noOpen();
    }

    @Override
    public List<Course> getAllCourseList(Map map) {
        return courseDao.getAllCourseList(map);
    }

    @Override
    public int getAllCourseListCount(Map map) {
        return courseDao.getAllCourseListCount(map);
    }

    @Override
    public List<Map> screenWillDelete(Map map) {
        return courseDao.screenWillDelete(map);
    }

    @Override
    public void screenStu(Map map) {
        courseDao.screenStu(map);
    }

    @Override
    public void updateScore(Map map) {
        courseDao.updateScore(map);
    }

    @Override
    public int getTeaCourseListCount(Map map) {
        return courseDao.getTeaCourseListCount(map);
    }

    @Override
    public List<Course> getTeaCourseList(Map map) {
        return courseDao.getTeaCourseList(map);
    }


}
