<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.major.servletJspPractice.common.user.UserDAO" %>
<%@ page import="com.major.servletJspPractice.common.user.UserDTO" %>
<%@ page import="java.io.PrintWriter" %>
<!-- PrintWriter는 화면출력을 위한 객체 -->
<%
    request.setCharacterEncoding("UTF-8");
    String username = null;
    String password = null;
    if (!request.getParameter("username").equals("")){
        username = request.getParameter("username");
    }
    if (!request.getParameter("password").equals("")){
        password = request.getParameter("password");
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
    int result = userDAO.join(username, password);
    if (result == 1) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('회원가입이 완료되었습니다.');");
        script.println("location.href = 'index.jsp';");
        script.println("</script>");
        script.close();
        return;
    }
%>
