<%--
  Created by IntelliJ IDEA.
  User: bagjingeun
  Date: 2022/01/11
  Time: 1:33 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.major.servletJspPractice.common.user.UserDAO" %>
<%@ page import="com.major.servletJspPractice.common.util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

<%
    request.setCharacterEncoding("UTF-8");
    String code = null;
    UserDAO userDAO = new UserDAO();
    String userID = null;

    if (request.getParameter("code") != null)
        code = request.getParameter("code");

    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }

    if (userID == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('입력 안된 사항이 있습니다');");
        script.println("location.href = 'userLogin.jsp';");
        script.println("</script>");
        script.close();
        return;
    }

    String email = userDAO.getUserEmail(userID);
    boolean isRight = new SHA256().getSHA256(email).equals(code) ? true : false;
    if (isRight) {
        userDAO.setEmailChecked(userID);
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('인증이 완료되었습니다.');");
        script.println("location.href = 'index.jsp';");
        script.println("</script>");
        script.close();
    } else {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 코드입니다.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
    }

%>