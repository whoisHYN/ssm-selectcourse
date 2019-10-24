<%@ page import="com.hyn.selectcourse.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if(user == null ) {
        response.sendRedirect("http://localhost:8081/selectCourse/index.jsp");
    }
%>