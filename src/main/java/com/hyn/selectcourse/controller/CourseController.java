package com.hyn.selectcourse.controller;

import com.hyn.selectcourse.model.Course;
import com.hyn.selectcourse.model.User;
import com.hyn.selectcourse.service.CourseService;
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
import java.util.Random;

/**
 * @author huang
 */
@Controller
public class CourseController {
    private Logger log = Logger.getLogger(CourseController.class);
    @Autowired
    private UserService userService;
    @Autowired
    private CourseService courseService;

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/addCourse1")
    public ModelAndView addCourse(ModelAndView view) {
        Map map = new HashMap();
        map.put("status","2");
        map.put("start",0);
        map.put("end",99);
        List<User> teaLists = userService.getUserList(map);
        view.addObject("teaLists",teaLists);
        view.setViewName("addCourse");
        return view;
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/saveCourse")
    public ModelAndView saveCourse(Course course, ModelAndView view) {

        Map teaMap = new HashMap();
        teaMap.put("status","2");
        teaMap.put("start",0);
        teaMap.put("end",99);
        List<User> teaLists = userService.getUserList(teaMap);
        view.addObject("teaLists",teaLists);
        view.setViewName("addCourse");

        Map map = new HashMap();
        map.put("id",course.getId());
        Integer idCount = courseService.isExistCourse(map);
        if(idCount > 0) {
            view.addObject("message","添加课程失败!!课程编号已存在!!");
            return view;
        }
        map = new HashMap();
        map.put("name",course.getName());
        Integer nameCount = courseService.isExistCourse(map);
        if(nameCount > 0) {
            view.addObject("message","添加课程失败!!课程名称已存在!!");
            return view;
        }
        map = new HashMap();
        map.put("teaName",course.getTeaName());
        map.put("time",course.getTime());
        Integer teaTimeCount = courseService.isExistCourse(map);
        if(teaTimeCount > 0) {
            view.addObject("message","添加课程失败!!教师时间与已有课程冲突!!");
            return view;
        }
        map = new HashMap();
        map.put("time",course.getTime());
        map.put("place",course.getPlace());
        Integer timePlaceCount = courseService.isExistCourse(map);
        if(timePlaceCount > 0) {
            view.addObject("message","添加课程失败!!时间地点与已有课程冲突!!");
            return view;
        }
        courseService.addCourse(course);
        if(course.getRequired().equals("1")) {
            Map stuMap = new HashMap();
            stuMap.put("status","1");
            stuMap.put("start",0);
            stuMap.put("end",999);
            List<User> userLists = userService.getUserList(stuMap);
            for(User stu : userLists) {
                Random r = new Random();
                int random = r.nextInt(100);
                Map sMap = new HashMap();
                sMap.put("random",random);
                sMap.put("courseId",course.getId());
                sMap.put("teaName",course.getTeaName());
                sMap.put("stuId",stu.getLoginName());
                courseService.insertUserCourse(sMap);
                courseService.addChooseCourse(course.getId());
            }
        }
        view.addObject("message","添加课程成功!!");
        return view;
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/getSelectCoursePage")
    public ModelAndView getSelectCoursePage(@RequestParam("page") int page,
                                            @RequestParam("content") String content,
                                            @RequestParam("courseId") Long courseId,
                                            HttpServletRequest request,
                                            ModelAndView view,HttpSession session) {
        //判断是否选课开放
        int openFlag = courseService.noOpen();
        //没有开放
        if(openFlag > 0) {
            view.addObject("openFlag","false");
            view.addObject("courseLists",null);
            view.setViewName("selectCoursePage");
            request.setAttribute("content", "");
            request.setAttribute("page",1);
            request.setAttribute("count",0);
            request.setAttribute("pageCount",1);
            return view;
        }
        User user = (User) session.getAttribute("user");
        if(courseId != 0) {
            boolean flag = true;
            Course course = courseService.getCourseById(courseId);
            Map timeMap = new HashMap();
            timeMap.put("stuId",user.getLoginName());
            timeMap.put("time",course.getTime());
            int timeCount = courseService.getSaveTimeCourse(timeMap);
            if(timeCount > 0) {
                view.addObject("message","选课失败!!已存在相同时间的课程!!");
                flag = false;
            }
            int creditCount = courseService.getAllCredit(user.getLoginName());
            int allCredit = creditCount + Integer.parseInt(course.getCredit());
            if( allCredit > 32) {
                view.addObject("message","选课失败!!选课学分总数大于最大学分32分!!");
                flag = false;
            }
            if(flag == true) {
                Random r = new Random();
                int random = r.nextInt(100);
                Map courseMap = new HashMap();
                courseMap.put("random",random);
                courseMap.put("courseId",course.getId());
                courseMap.put("teaName",course.getTeaName());
                courseMap.put("stuId",user.getLoginName());
                courseService.insertUserCourse(courseMap);
                view.addObject("message","选课成功!!");
                courseService.addChooseCourse(course.getId());
            }
        }
        int start = (page -1) * 10;
        Map map = new HashMap();
        if(content != null && content != "") {
            map.put("content",content);
        }
        map.put("start",start);
        map.put("loginName",user.getLoginName());
        int count = courseService.getNoChooseCourseListCount(map);
        int pageCount = (count % 10 == 0)?(count/10):(count/10 +1);
        List<Course> courseLists = courseService.getNoChooseCourseList(map);
        view.addObject("courseLists",courseLists);
        view.setViewName("selectCoursePage");
        request.setAttribute("content", content);
        request.setAttribute("page",page);
        request.setAttribute("count",count);
        request.setAttribute("pageCount",pageCount);
        return view;
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/getChoosePage")
    public ModelAndView getChoosePage(@RequestParam("page") int page,
                                      @RequestParam("content") String content,
                                      @RequestParam("courseId") Long courseId,
                                      HttpServletRequest request,
                                      ModelAndView view,HttpSession session) {
        int openFlag = courseService.noOpen();
        if(openFlag > 0) {
            view.addObject("openFlag","false");
        }

        User user = (User) session.getAttribute("user");
        if(courseId != 0) {
            courseService.reduceChooseCourse(courseId);
            Map courseMap = new HashMap();
            courseMap.put("courseId",courseId);
            courseMap.put("stuId",user.getLoginName());
            courseService.deleteCourse(courseMap);
            view.addObject("message","退课成功!!");
        }

        int start = (page -1) * 10;
        Map map = new HashMap();
        if(content != null && content != "") {
            map.put("content",content);
        }
        map.put("start",start);
        map.put("loginName",user.getLoginName());
        int count = courseService.getChooseCourseListCount(map);
        int pageCount = (count % 10 == 0)?(count/10):(count/10 +1);
        List<Course> courseLists = courseService.getChooseCourseList(map);
        view.addObject("courseLists",courseLists);
        view.setViewName("choosePage");
        request.setAttribute("content", content);
        request.setAttribute("page",page);
        request.setAttribute("count",count);
        request.setAttribute("pageCount",pageCount);
        return view;
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/myTimeTable")
    public ModelAndView myTimeTable(
            HttpServletRequest request,
            ModelAndView view,HttpSession session) {
        User user = (User) session.getAttribute("user");
        Map map = new HashMap();
        map.put("start",0);
        map.put("loginName",user.getLoginName());
        List<Course> courseLists = courseService.getChooseCourseList(map);
        view.addObject("courseLists",courseLists);
        view.setViewName("myTimeTable");
        return view;
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/courseDetail")
    public ModelAndView courseDetail( @RequestParam("courseId") Long courseId,ModelAndView view) {
        Course course = courseService.getCourseById(courseId);
        view.addObject("course",course);
        view.setViewName("courseDetail");
        return view;
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/courseMessage")
    public ModelAndView courseMessage( @RequestParam("page") int page,
                                       @RequestParam("courseId") Long courseId,
                                       @RequestParam("loginName") String loginName,
                                       @RequestParam("message") String message,
                                       HttpServletRequest request,ModelAndView view,
                                       HttpSession session) {
        if(!"".equals(message)) {
            Map map = new HashMap();
            map.put("courseId",courseId);
            map.put("loginName",loginName);
            map.put("message",message);
            courseService.addMessage(map);
        }
        User user = (User) session.getAttribute("user");
        int start = (page -1) * 5;
        Course course = courseService.getCourseById(courseId);
        Map messageMap = new HashMap();
        messageMap.put("start",start);
        messageMap.put("courseId",courseId);
        List<Map> messages = courseService.getMessageListByCourseId(messageMap);
        int count = courseService.getMessageCountByCourseId(courseId);
        int pageCount = (count % 5 == 0)?(count/5):(count/5 +1);
        request.setAttribute("page",page);
        request.setAttribute("count",count);
        request.setAttribute("pageCount",pageCount);
        view.addObject("user",user);
        view.addObject("messages",messages);
        view.addObject("course",course);
        view.setViewName("courseMessage");
        return view;
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/adminCourseManage")
    public ModelAndView adminCourseManage(@RequestParam("page") int page,
                                            @RequestParam("content") String content,
                                            HttpServletRequest request,
                                            ModelAndView view,HttpSession session) {
        int openFlag = courseService.noOpen();
        if(openFlag > 0) {
            view.addObject("openFlag","false");
        }
        int start = (page -1) * 10;
        Map map = new HashMap();
        if(content != null && content != "") {
            map.put("content",content);
        }
        map.put("start",start);
        int count = courseService.getAllCourseListCount(map);
        int pageCount = (count % 10 == 0)?(count/10):(count/10 +1);
        List<Course> courseLists = courseService.getAllCourseList(map);
        view.addObject("courseLists",courseLists);
        view.setViewName("adminCourseManage");
        request.setAttribute("content", content);
        request.setAttribute("page",page);
        request.setAttribute("count",count);
        request.setAttribute("pageCount",pageCount);
        return view;
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/openCourse")
    public void openCourse() {
        courseService.openCourse();
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/closeCourse")
    public void closeCourse() {
        courseService.closeCourse();
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/screenStu")
    public void screenStu(@RequestParam("courseId") Long courseId,
                          @RequestParam("stuCountStr") String stuCountStr) {
        int stuCount = Integer.parseInt(stuCountStr);
        Map map = new HashMap();
        map.put("stuCount",stuCount);
        map.put("courseId",courseId);
        List<Map> lists = courseService.screenWillDelete(map);
        for(Map list:lists) {
            courseService.screenStu(list);
            courseService.reduceChooseCourse( Long.parseLong(list.get("course_id").toString()));
        }
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/studentList")
    public ModelAndView studentList(@RequestParam("page") int page,
                                          @RequestParam("content") String content,
                                          @RequestParam("courseId") Long courseId,
                                          HttpServletRequest request,
                                          ModelAndView view,HttpSession session) {
        int openFlag = courseService.noOpen();
        if(openFlag > 0) {
            view.addObject("openFlag","false");
        }
        int start = (page -1) * 10;
        Map map = new HashMap();
        if(content != null && content != "") {
            map.put("content",content);
        }
        map.put("start",start);
        map.put("courseId",courseId);
        int count = userService.getStudentListCount(map);
        int pageCount = (count % 10 == 0)?(count/10):(count/10 +1);
        List<Map> studentLists = userService.getStudentList(map);
        view.addObject("studentLists",studentLists);
        view.addObject("courseId",courseId);
        view.setViewName("studentList");
        request.setAttribute("content", content);
        request.setAttribute("page",page);
        request.setAttribute("count",count);
        request.setAttribute("pageCount",pageCount);
        return view;
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/inputScore")
    public ModelAndView inputScore(@RequestParam("courseId") Long courseId, ModelAndView view,
                                    @RequestParam("stuId") String stuId,
                                   @RequestParam("score") String score,
                                   @RequestParam("userName") String userName) {
        if(!"".equals(userName)) {
            Map map = new HashMap();
            map.put("courseId",courseId);
            map.put("stuId",stuId);
            map.put("score",score);
            courseService.updateScore(map);
        }
        Course course = courseService.getCourseById(courseId);
        User user = userService.getUserByLoginName(stuId);
        view.addObject("course",course);
        view.addObject("score",score);
        view.addObject("user",user);
        view.setViewName("inputScore");
        return view;
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/teaCourseManage")
    public ModelAndView teaCourseManage(@RequestParam("page") int page,
                                          @RequestParam("content") String content,
                                          HttpServletRequest request,
                                          ModelAndView view,HttpSession session) {
        int openFlag = courseService.noOpen();
        if(openFlag > 0) {
            view.addObject("openFlag","false");
        }
        User teacher = (User) session.getAttribute("user");
        int start = (page -1) * 10;
        Map map = new HashMap();
        map.put("teaName",teacher.getUserName());
        if(content != null && !"".equals(content)) {
            map.put("content",content);
        }
        map.put("start",start);
        int count = courseService.getTeaCourseListCount(map);
        int pageCount = (count % 10 == 0)?(count/10):(count/10 +1);

        List<Course> courseLists = courseService.getTeaCourseList(map);
        view.addObject("courseLists",courseLists);
        view.setViewName("teaCourseManage");
        request.setAttribute("content", content);
        request.setAttribute("page",page);
        request.setAttribute("count",count);
        request.setAttribute("pageCount",pageCount);
        return view;
    }

}
