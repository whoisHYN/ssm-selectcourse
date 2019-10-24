package com.hyn.selectcourse.service.impl;

import com.hyn.selectcourse.dao.UserDao;
import com.hyn.selectcourse.model.User;
import com.hyn.selectcourse.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional(rollbackFor = Exception.class)
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User login(String loginName, String password, String status) {
        return userDao.getUserByLoginNameAndPassword(loginName,password,status);
    }

    @Override
    public int checkAccountExist(String loginName, String status) {
        return userDao.checkAccountExist(loginName, status);
    }

    @Override
    public void updateUserInfo(Map map) {
        userDao.updateUserInfo(map);
    }

    @Override
    public void updateUserPassword(Map map) {
        userDao.updateUserPassword(map);
    }

    @Override
    public User getUserByLoginName(String loginName) {
        return userDao.getUserByLoginName(loginName);
    }

    @Override
    public List<User> getUserList(Map map) {
        return userDao.getUserList(map);
    }

    @Override
    public int getUserListCount(Map map) {
        return userDao.getUserListCount(map);
    }

    @Override
    public void deletUser(String loginName) {
        userDao.deleteUser(loginName);
    }

    @Override
    public void addUser(User user) {
        userDao.addUser(user);
    }

    @Override
    public User getTeaByUserName(Map map) {
        return userDao.getTeaByUserName(map);
    }

    @Override
    public int getAllUserCount() {
        return userDao.getAllUserCount();
    }

    @Override
    public int getAllCourseCount() {
        return userDao.getAllCourseCount();
    }

    @Override
    public int getStudentListCount(Map map) {
        return userDao.getStudentListCount(map);
    }

    @Override
    public List<Map> getStudentList(Map map) {
        return userDao.getStudentList(map);
    }

    @Override
    public List<Map> getMyGradeInfo(String loginName) {
        return userDao.getMyGradeInfo(loginName);
    }
}
