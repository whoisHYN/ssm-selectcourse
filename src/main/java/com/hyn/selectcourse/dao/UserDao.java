package com.hyn.selectcourse.dao;

import com.hyn.selectcourse.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface UserDao {
    User getUserByLoginNameAndPassword(@Param("loginName") String loginName, @Param("password") String password, @Param("status") String status);

    int checkAccountExist(@Param("loginName") String loginName, @Param("status") String status);

    void updateUserInfo(Map map);

    void updateUserPassword(Map map);

    User getUserByLoginName(String loginName);

    List<User> getUserList(Map map);

    int getUserListCount(Map map);

    void deleteUser(String loginName);

    void addUser(User user);

    User getTeaByUserName(Map map);

    int getAllCourseCount();

    int getAllUserCount();

    int getStudentListCount(Map map);

    List<Map> getStudentList(Map map);

    List<Map> getMyGradeInfo(String loginName);
}
