<%--
  Created by IntelliJ IDEA.
  User: bagjingeun
  Date: 2022/01/06
  Time: 2:38 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>첫번째 페이지</title>
  </head>
  <body>
  Hello, World!
  <form action="./userJoinAction.jsp" method = "post">
    <input type = "text" name="username" placeholder="username">
    <input type="password" name="password" placeholder="password">
    <input type="submit" value="회원가입">
  </form>
  </body>
</html>
