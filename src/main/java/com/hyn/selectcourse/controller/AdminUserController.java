package com.hyn.selectcourse.controller;

import com.hyn.selectcourse.model.User;
import com.hyn.selectcourse.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author huang
 */
@Controller
public class AdminUserController {
    private Logger log = Logger.getLogger(AdminUserController.class);
    @Autowired
    private UserService userService;

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/getAdminUserList")
    public ModelAndView getAdminUserList(@RequestParam("content") String content,
                                   @RequestParam("page") int page,
                                   @RequestParam("size") int size,
                                   @RequestParam("status") int status,
                                   HttpServletRequest request,HttpSession session, ModelAndView view) {

        int start = (page -1) * size;
        Map map = new HashMap(16);
        map.put("status",status);
        map.put("start",start);
        map.put("end",size);
        if(content != null && !"".equals(content)) {
            map.put("content",content);
        }
        int count = userService.getUserListCount(map);
        List<User> users = userService.getUserList(map);

        int pageCount = (count % size == 0)?(count/size):(count/size +1);
        request.setAttribute("lists", users);
        request.setAttribute("content", content);
        request.setAttribute("page",page);
        request.setAttribute("count",count);
        request.setAttribute("pageCount",pageCount);

        view.setViewName("adminUserInfo");
        return view;
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/main")
    public ModelAndView main(ModelAndView view) {
        int userCount = userService.getAllUserCount();
        int courseCount = userService.getAllCourseCount();
        view.addObject("userCount",userCount);
        view.addObject("courseCount",courseCount);
        view.setViewName("main");
        return view;
    }
}
