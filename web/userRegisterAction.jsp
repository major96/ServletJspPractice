<%--
  Created by IntelliJ IDEA.
  User: bagjingeun
  Date: 2022/01/11
  Time: 1:33 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.major.servletJspPractice.common.user.UserDAO" %>
<%@ page import="com.major.servletJspPractice.common.user.UserDTO" %>
<%@ page import="com.major.servletJspPractice.common.util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

<%
    request.setCharacterEncoding("UTF-8");
    String username=null;
    String password=null;
    String email=null;

    if (request.getParameter("userID") != null){
        username = request.getParameter("userID");
    }
    if (request.getParameter("userPWD") != null){
        password = request.getParameter("userPWD");
    }
    if (request.getParameter("userEmail") != null){
        email = request.getParameter("userEmail");
    }
    if ((username == null) || (password == null) || (email == null)) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('입력이 안된 사항이 있습니다.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
        return;
    }

    UserDAO userDAO = new UserDAO();
    int result = userDAO.join(new UserDTO(username, password, email, SHA256.getSHA256(email), false));
    if(result == -1) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('이미 존재하는 아이디입니다');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
        return;
    }
    else {
        session.setAttribute("userID", username);
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("location.href = 'emailSendAction.jsp';");
        script.println("</script>");
        script.close();
        return;
    }
%>