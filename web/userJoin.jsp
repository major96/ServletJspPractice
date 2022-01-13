<%--
  Created by IntelliJ IDEA.
  User: bagjingeun
  Date: 2022/01/06
  Time: 2:38 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
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
<%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
    if(userID!=null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인이된 상태입니다.');");
        script.println("location.href = 'index.jsp';");
        script.println("</script>");
        script.close();
        return;
    }
%>
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
                        <%
                            if (userID == null){
                        %>
                        <li>
                            <a class="dropdown-item" href="userLogin.jsp">로그인</a>
                        </li>
                        <li>
                            <a class="dropdown-item active" href="userJoin.jsp">회원가입</a>
                        </li>
                        <%
                        }else{
                        %>
                        <li>
                            <a class="dropdown-item" href="userLogoutAction.jsp">로그아웃</a>
                        </li>
                        <%
                            }
                        %>
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
    <form method="post" action="./userRegisterAction.jsp">
        <div class="row mb-3">
            <label class="form-label p-0">아이디</label>
            <input type="text" name="userID" class="form-control">
        </div>
        <div class="row mb-3">
            <label class="form-label p-0">비밀번호</label>
            <input type="password" name="userPWD" class="form-control">
        </div>
        <div class="row mb-3">
            <label class="form-label p-0">E-Mail</label>
            <input type="email" name="userEmail" class="form-control">
        </div>
        <div class ="row justify-content-start">
        <button type="submit" class="btn btn-primary mt-2 col-2">회원가입</button>
        </div>
    </form>
</section>

<footer class="bg-dark mt-4 p-5 text-center" style="color: #ffffff;">
    Copyright &copy; 2022 박진근 All Rights Reserved.
</footer>

</body>
</html>
