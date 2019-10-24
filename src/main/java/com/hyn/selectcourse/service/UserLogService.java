package com.hyn.selectcourse.service;


import com.hyn.selectcourse.model.UserLog;

import java.util.List;
import java.util.Map;

public interface UserLogService {

    void insertUserLog(Map map);

    List<UserLog> getUserLogList(Map map);

    int getUserLogListCount(Map map);
}
