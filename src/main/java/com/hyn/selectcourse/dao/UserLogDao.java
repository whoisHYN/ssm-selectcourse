package com.hyn.selectcourse.dao;

import com.hyn.selectcourse.model.UserLog;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface UserLogDao {
    void insertUserLog(Map map);

    List<UserLog> getUserLogList(Map map);

    int getUserLogListCount(Map map);
}
