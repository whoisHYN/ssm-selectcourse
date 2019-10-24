package com.hyn.selectcourse.service.impl;

import com.hyn.selectcourse.dao.UserLogDao;
import com.hyn.selectcourse.model.UserLog;
import com.hyn.selectcourse.service.UserLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * @author huang
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class UserLogServiceImpl implements UserLogService {

    @Autowired
    private UserLogDao userLogDao;

    @Override
    public void insertUserLog(Map map) {
        userLogDao.insertUserLog(map);
    }

    @Override
    public List<UserLog> getUserLogList(Map map) {
        return userLogDao.getUserLogList(map);
    }

    @Override
    public int getUserLogListCount(Map map) {
        return userLogDao.getUserLogListCount(map);
    }
}
