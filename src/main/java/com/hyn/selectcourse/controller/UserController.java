package com.hyn.selectcourse.controller;

import com.hyn.selectcourse.model.User;
import com.hyn.selectcourse.model.UserLog;
import com.hyn.selectcourse.service.CourseService;
import com.hyn.selectcourse.service.UserLogService;
import com.hyn.selectcourse.service.UserService;
import com.hyn.selectcourse.util.MD5Util;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author huang
 */
@Controller
public class UserController {
    private Logger log = Logger.getLogger(UserController.class);
    @Autowired
    private UserService userService;
    @Autowired
    private UserLogService userLogService;
    @Autowired
    private CourseService courseService;

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/login")
    public ModelAndView login(@RequestParam("loginName") String loginName,
                              @RequestParam("password") String password,
                              @RequestParam("status") String status,
                              @RequestParam("code") String code,
                              HttpSession session,
                              ModelAndView view) {
        if ("1".equals(status)) {
            if (!session.getAttribute("stuStrCode").equals(code)) {
                view.addObject("status", status);
                view.addObject("message", "验证码错误！请重新输入！");
                view.setViewName("../loginForm");
                return view;
            }
        } else if ("2".equals(status)) {
            if (!session.getAttribute("teaStrCode").equals(code)) {
                view.addObject("status", status);
                view.addObject("message", "验证码错误！请重新输入！");
                view.setViewName("../loginForm");
                return view;
            }
        } else if ("3".equals(status)) {
            if (!session.getAttribute("sysStrCode").equals(code)) {
                view.addObject("status", status);
                view.addObject("message", "验证码错误！请重新输入！");
                view.setViewName("../loginForm");
                return view;
            }
        }
        int userCount = userService.checkAccountExist(loginName, status);
        if (userCount == 0) {
            view.addObject("status", status);
            view.addObject("message", "账号不存在!请重新输入！");
            view.setViewName("../loginForm");
            return view;
        } else {
            String md5Password = MD5Util.md5(password);
            User user = userService.login(loginName, md5Password, status);
            if (user != null) {
                session.setAttribute("user", user);
                view.setViewName("index");
                Map<String, String> logMap = new HashMap<>(16);
                logMap.put("loginName", user.getLoginName());
                logMap.put("type", "登录");
                logMap.put("detail", "登录系统");
                try {
                    logMap.put("ip", InetAddress.getLocalHost().getHostAddress().toString());
                } catch (UnknownHostException e) {
                    e.printStackTrace();
                }
                userLogService.insertUserLog(logMap);
            } else {
                view.addObject("status", status);
                view.addObject("message", "学号或密码错误!请重新输入！");
                view.setViewName("../loginForm");
            }
            return view;
        }
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/updateUserInfo")
    public ModelAndView updateUserInfo(HttpSession session, User user, ModelAndView view) {
        Map<String, String> map = new HashMap<>(16);
        map.put("loginName", user.getLoginName());
        map.put("userName", user.getUserName());
        map.put("profession", user.getProfession());
        map.put("grade", user.getGrade());
        map.put("phone", user.getPhone());
        map.put("address", user.getAddress());
        map.put("remark", user.getRemark());
        userService.updateUserInfo(map);
        User newUser = userService.getUserByLoginName(user.getLoginName());
        session.setAttribute("user", newUser);

        Map<String, String> logMap = new HashMap<>(16);
        logMap.put("loginName", user.getLoginName());
        logMap.put("type", "修改信息");
        logMap.put("detail", "修改个人信息");
        try {
            logMap.put("ip", InetAddress.getLocalHost().getHostAddress().toString());
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
        userLogService.insertUserLog(logMap);
        view.addObject("message", "修改成功!");
        view.setViewName("redirect:/jsp/personInfo.jsp");
        return view;
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/updateUserPassword")
    public ModelAndView updateUserPassword(@RequestParam("loginName") String loginName,
                                           @RequestParam("password") String password,
                                           @RequestParam("newOnePassword") String newOnePassword,
                                           @RequestParam("status") String status,
                                           HttpSession session, ModelAndView view) {
        String md5Password = MD5Util.md5(password);
        String md5NewPassword = MD5Util.md5(newOnePassword);
        User user = userService.login(loginName, md5Password, status);
        if (user != null) {
            Map<String, String> map = new HashMap<>(16);
            map.put("loginName", user.getLoginName());
            map.put("password", md5NewPassword);
            userService.updateUserPassword(map);

            Map<String, String> logMap = new HashMap<>(16);
            logMap.put("loginName", user.getLoginName());
            logMap.put("type", "修改密码");
            logMap.put("detail", "修改登录密码");
            try {
                logMap.put("ip", InetAddress.getLocalHost().getHostAddress().toString());
            } catch (UnknownHostException e) {
                e.printStackTrace();
            }
            userLogService.insertUserLog(logMap);
            view.addObject("message", "修改成功!");
            view.setViewName("redirect:/jsp/changePwd.jsp");
        } else {
            view.addObject("message", "密码错误!请重新输入！");
            view.setViewName("redirect:/jsp/changePwd.jsp");
        }

        return view;
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/logout")
    public void logout(HttpSession session) {
        session.invalidate();
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/getLogList")
    public ModelAndView getLogList(@RequestParam("content") String content,
                                   @RequestParam("page") int page,
                                   @RequestParam("size") int size,
                                   HttpServletRequest request,HttpSession session, ModelAndView view) {

        int start = (page -1) * size;
        User user = (User) session.getAttribute("user");
        Map map = new HashMap();
        map.put("loginName",user.getLoginName());
        map.put("start",start);
        map.put("end",size);
        if(content != null && !"".equals(content)) {
            map.put("content",content);
        }
        int count = userLogService.getUserLogListCount(map);
        List<UserLog> userLogs = userLogService.getUserLogList(map);
        int pageCount = (count % size == 0)?(count/size):(count/size +1);
        request.setAttribute("lists", userLogs);
        request.setAttribute("content", content);
        request.setAttribute("page",page);
        request.setAttribute("count",count);
        request.setAttribute("pageCount",pageCount);
        view.setViewName("myLogInfo");
        return view;
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/deleteUser")
    public void deleteUser(String loginName) {
        userService.deletUser(loginName);
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/addUser")
    public ModelAndView addUser(ModelAndView view, User user) {
        view.setViewName("redirect:/jsp/addUser.jsp");
        view.addObject("status",user.getStatus());
        if(user.getStatus().equals("2")) {
            Map map = new HashMap();
            map.put("status","2");
            map.put("userName",user.getUserName());
            User teaUser = userService.getTeaByUserName(map);
            if(teaUser != null ) {
                view.addObject("message","信息录入失败!!教师姓名已存在!!");
                return view;
            }
        }
        User existUser = userService.getUserByLoginName(user.getLoginName());
        if(existUser != null) {
            view.addObject("message","信息录入失败!!登录名已存在!!");
        } else {
            user.setPassword(MD5Util.md5(user.getPassword()));
            userService.addUser(user);
            view.addObject("message", "信息录入成功!!");
        }

        //view.addObject("message","");
        return view;
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/modifyUser")
    public ModelAndView modifyUser(ModelAndView view,
                                   @RequestParam("status") String status,
                                   @RequestParam("loginName") String loginName ) {
        User user = userService.getUserByLoginName(loginName);
        view.addObject("modifyUser", user);
        view.setViewName("modifyUserInfo");
        return view;
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/adminUpdateUserInfo")
    public ModelAndView adminUpdateUserInfo(ModelAndView view, User user) {

        Map<String, String> map = new HashMap<>(16);
        map.put("loginName", user.getLoginName());
        map.put("userName", user.getUserName());
        map.put("profession", user.getProfession());
        map.put("grade", user.getGrade());
        map.put("phone", user.getPhone());
        map.put("address", user.getAddress());
        map.put("remark", user.getRemark());
        userService.updateUserInfo(map);
        view.addObject("message", "信息修改成功!!");
        view.setViewName("modifyUserInfo");
        view.addObject("modifyUser",user);
        //view.addObject("message","");
        return view;
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/resetPassword")
    public void resetPassword(String loginName) {
        Map<String, String> map = new HashMap<>(16);
        map.put("loginName",loginName);
        map.put("password",MD5Util.md5("123456"));
        userService.updateUserPassword(map);
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/myGrade")
    public ModelAndView myGrade(HttpServletRequest request,
                                ModelAndView view,HttpSession session) {
        int allCredit=0,passCredit=0,noPassCredit=0;
        //判断是否选课开放
        int openFlag = courseService.noOpen();
        //没有开放
        if(openFlag == 0) {
            view.addObject("myGradeInfos",null);
            view.setViewName("myGrade");
            view.addObject("allCredit",allCredit);
            view.addObject("passCredit",passCredit);
            view.addObject("noPassCredit",noPassCredit);
            return view;
        }

        User user = (User) session.getAttribute("user");
        List<Map> myGradeInfos = userService.getMyGradeInfo(user.getLoginName());
        for(Map map :myGradeInfos){
            int score = Integer.parseInt(map.get("score").toString());
            if (score >= 60) {
                passCredit += Integer.parseInt(map.get("credit").toString());
            } else {
                noPassCredit += Integer.parseInt(map.get("credit").toString());
            }
            allCredit += Integer.parseInt(map.get("credit").toString());
        }
        view.addObject("allCredit",allCredit);
        view.addObject("passCredit",passCredit);
        view.addObject("noPassCredit",noPassCredit);
        view.addObject("myGradeInfos",myGradeInfos);
        view.setViewName("myGrade");
        return view;
    }

}
