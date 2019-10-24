package com.hyn.selectcourse.service;


import com.hyn.selectcourse.model.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    User login(String loginName, String password, String status);

    int checkAccountExist(String loginName, String status);

    void updateUserInfo(Map map);

    void updateUserPassword(Map map);

    User getUserByLoginName(String loginName);

    List<User> getUserList(Map map);

    int getUserListCount(Map map);

    void deletUser(String loginName);

    void addUser(User user);

    User getTeaByUserName(Map map);

    int getAllUserCount();

    int getAllCourseCount();

    int getStudentListCount(Map map);

    List<Map> getStudentList(Map map);

    List<Map> getMyGradeInfo(String loginName);
}
