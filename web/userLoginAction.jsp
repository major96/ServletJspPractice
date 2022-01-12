<%--
  Created by IntelliJ IDEA.
  User: bagjingeun
  Date: 2022/01/11
  Time: 1:33 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.major.servletJspPractice.common.user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>

<%
    request.setCharacterEncoding("UTF-8");
    String username=null;
    String password=null;

    if (request.getParameter("userID") != null){
        username = request.getParameter("userID");
    }
    if (request.getParameter("userPWD") != null){
        password = request.getParameter("userPWD");
    }

    if ((username == null) || (password == null)) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('입력이 안된 사항이 있습니다.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
        return;
    }

    UserDAO userDAO = new UserDAO();
    int result = userDAO.login(username, password);
    if(result == 1) {
        session.setAttribute("userID", username);
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("location.href = 'index.jsp';");
        script.println("</script>");
        script.close();
        return;
    }
    else if(result == 0){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('비밀번호가 틀립니다.')");
        script.println("history.back();");
        script.println("</script>");
        script.close();
        return;
    }
    else if(result == -2){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('데이터베이스 오류')");
        script.println("history.back();");
        script.println("</script>");
        script.close();
        return;
    }
%>