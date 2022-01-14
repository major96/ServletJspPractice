<%--
  Created by IntelliJ IDEA.
  User: bagjingeun
  Date: 2022/01/11
  Time: 1:33 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="javax.mail.*" %>
<%@ page import="java.util.Properties" %>

<%@ page import="com.major.servletJspPractice.common.user.UserDAO" %>
<%@ page import="com.major.servletJspPractice.common.util.SHA256" %>
<%@ page import="com.major.servletJspPractice.common.util.Gmail" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.internet.InternetAddress" %>

<%
    request.setCharacterEncoding("UTF-8");
    UserDAO userDao = new UserDAO();
    String userID = null;
    if(session.getAttribute("userID") != null)
        userID = (String) session.getAttribute("userID");
    if(userID == null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('입력 안된 사항이 있습니다');");
        script.println("location.href = 'userLogin.jsp';");
        script.println("</script>");
        script.close();
        return;
    }

    boolean emailChecked = userDao.getEmailChecked(userID);
    if(emailChecked){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('이미 인증된 회원입니다.');");
        script.println("location.href = 'index.jsp';");
        script.println("</script>");
        script.close();
        return;
    }
    String host = "http://localhost:8080/";
    String from = "jinkeun96@gmail.com";
    String to = userDao.getUserEmail(userID);
    String subject = "강의평가를 위한 인증메일입니다.";
    String content = "다음 링크에 접속하여 이메일 인증을 진행하세요"
            + "<a href = '" + host + "emailCheckAction.jsp?code=" + new SHA256().getSHA256(to) + "'> 이메일 인증</a>";
    Properties p = new Properties();
    p.put("mail.smtp.user", from);
    p.put("mail.smtp.host", "smtp.googlemail.com");
    p.put("mail.smtp.port", "465");
    p.put("mail.smtp.starttls.enable", "true");
    p.put("mail.smtp.auth", "true");
    p.put("mail.smtp.debug", "true");
    p.put("mail.smtp.socketFactory.port", "465");
    p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    p.put("mail.smtp.socketFactory.fallback", "false");

    try{
        Authenticator auth = new Gmail();
        Session sess = Session.getInstance(p, auth);
        sess.setDebug(true);
        MimeMessage msg = new MimeMessage(sess);
        msg.setSubject(subject);
        Address fromAddr = new InternetAddress(from);
        msg.setFrom(fromAddr);
        Address toAddr = new InternetAddress(to);
        msg.addRecipient(Message.RecipientType.TO, toAddr);
        msg.setContent(content, "text/html;charset=UTF-8");
        Transport.send(msg);

    }catch (Exception e){
        e.printStackTrace();
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('오류가 발생했습니다.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
        return;
    }

%>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>강의평가 웹사이트</title>
    <%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <!-- bootstrap.bundle.js 추가 -->--%>
    <link rel="stylesheet" type="text/css" href="css/custom.css">
    <!-- bootstrap CSS 추가 -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <%--    <!-- custom CSS 추가 -->--%>

    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.bundle.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">강의평가 웹사이트</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContents"
                aria-controls="navbar"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarContents">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">메인</a>
                </li>
                <li class="nav-item dropdown active">
                    <a class="nav-link dropdown-toggle" id="dropdown" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        회원관리
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="dropdown">
                        <li>
                            <a class="dropdown-item" href="userLogin.jsp">로그인</a>
                        </li>
                        <li>
                            <a class="dropdown-item active " href="userJoin.jsp">회원가입</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="userLogoutAction.jsp">로그아웃</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <form class="row row-cols-lg-auto ms-auto my-2 my-lg-0 align-items-center" action = "./index.jsp"
                  method = "get">
                <div class="col-12">
                    <input class="form-control mr-sm-2" type="text" name="search" placeholder="내용을 입력하세요" aria-label="Search">
                </div>
                <div class="col-12">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
                </div>
            </form>
        </div>
    </div>
</nav>
<section class="container-fluid" style="max-width: 560px;">
<div class="alert alert-success mt-4" role="alert">
    이메일 주소 인증 메일이 전송되었습니다. 회원가입 시 입력했던 이메일에서 확인해주세요
</div>
</section>

<footer class="bg-dark mt-4 p-5 text-center" style="color: #ffffff;">
    Copyright &copy; 2022 박진근 All Rights Reserved.
</footer>

</body>
</html>
