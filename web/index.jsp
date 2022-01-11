<%--
  Created by IntelliJ IDEA.
  User: bagjingeun
  Date: 2022/01/06
  Time: 2:38 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">메인</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="dropdown" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        회원관리
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="dropdown">
                        <li>
                            <a class="dropdown-item" href="userLogin.jsp">로그인</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="userJoin.jsp">회원가입</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <form class="row row-cols-lg-auto ms-auto my-2 my-lg-0 align-items-center">
                <div class="col-12">
                    <input class="form-control mr-sm-2" type="search" placeholder="내용을 입력하세요" aria-label="Search">
                </div>
                <div class="col-12">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
                </div>
            </form>
        </div>
    </div>
</nav>
<section class="container-fluid">
    <form method="get" action="./index.jsp" class="row mt-3">
        <div class="col-1 mx-1 mt-2">
            <select name="LectureDivide" class="form-control">
                <option class="form-control" value="전체">전체</option>
                <option class="form-control" value="전공">전공</option>
                <option class="form-control" value="교양">교양</option>
                <option class="form-control" value="기타">기타</option>
            </select>
        </div>
        <div class="col-3 mx-1 mt-2">
            <input type="text" name="search" class="form-control" placeholder="내용을 입력하세요">
        </div>
        <div class="col-3 mx-1 mt-2">
            <button type="submit" class="btn btn-primary">검색</button>
            <a class="btn btn-primary" data-bs-toggle="modal" href="#registerModal">등록하기</a>
            <a class="btn btn-danger" data-bs-toggle="modal" href="#reportModal">신고</a>
        </div>
    </form>
    <div class="card bg-light mt-3">
        <div class="card-header bg-light">
            <div class="row">
                <div class="col-8 text-start">자료구조입문&nbsp;<small>박진근</small></div>
                <div class="col-4 text-end">
                    종합<span style="color: red;">A</span>
                </div>
            </div>
        </div>
        <div class="card-body">
            <h5 class="card-title">
                정말 좋은 강의입니다. &nbsp;<small>2021년 가을학기</small>
            </h5>
            <p class="card-text">아주그냥 개꿀임 ㄹㅇ</p>
            <div class="row">
                <div class="col-9 text-start">
                    성적<span style="color: red;">A</span>
                    여유도<span style="color: red;">A</span>
                    강의 퀄리티<span style="color: red;">C</span>
                    <span style="color: green">(추천 : 15)</span>
                </div>
                <div class="col-3 text-end">
                    <a onclick="return confirm('추천하시겠습니까?')" href="./likeAction.jsp?evaluationID=">추천</a>
                    <a onclick="return confirm('삭제하시겠습니까?')" href="./deleteAction.jsp?evaluationID=">삭제</a>
                </div>
            </div>
        </div>
    </div>
    <div class="card bg-light mt-3">
        <div class="card-header bg-light">
            <div class="row">
                <div class="col-8 text-start">알고리즘입문&nbsp;<small>박진근</small></div>
                <div class="col-4 text-end">
                    종합<span style="color: red;">C</span>
                </div>
            </div>
        </div>
        <div class="card-body">
            <h5 class="card-title">
                뭔말인지 모르겠는 강의 &nbsp;<small>2021년 가을학기</small>
            </h5>
            <p class="card-text">하지만 뭔말인지 모르겠는건 당신뿐만이 아닐겁니다 ㅎㅎ;</p>
            <div class="row">
                <div class="col-9 text-start">
                    성적<span style="color: red;">B</span>
                    여유도<span style="color: red;">C</span>
                    강의 퀄리티<span style="color: red;">A</span>
                    <span style="color: green">(추천 : 31)</span>
                </div>
                <div class="col-3 text-end">
                    <a onclick="return confirm('추천하시겠습니까?')" href="./likeAction.jsp?evaluationID=">추천</a>
                    <a onclick="return confirm('삭제하시겠습니까?')" href="./deleteAction.jsp?evaluationID=">삭제</a>
                </div>
            </div>
        </div>
    </div>
    <div class="card bg-light mt-3">
        <div class="card-header bg-light">
            <div class="row">
                <div class="col-8 text-start">생태인류학&nbsp;<small>권혜윤</small></div>
                <div class="col-4 text-end">
                    종합<span style="color: red;">A</span>
                </div>
            </div>
        </div>
        <div class="card-body">
            <h5 class="card-title">
                자연에 관한 신박한 강의 &nbsp;<small>2021년 가을학기</small>
            </h5>
            <p class="card-text">읽는 책 분량이 많긴 해도 그만큼 얻어가는게 많았음</p>
            <div class="row">
                <div class="col-9 text-start">
                    성적<span style="color: red;">B</span>
                    여유도<span style="color: red;">C</span>
                    강의 퀄리티<span style="color: red;">A</span>
                    <span style="color: green">(추천 : 31)</span>
                </div>
                <div class="col-3 text-end">
                    <a onclick="return confirm('추천하시겠습니까?')" href="./likeAction.jsp?evaluationID=">추천</a>
                    <a onclick="return confirm('삭제하시겠습니까?')" href="./deleteAction.jsp?evaluationID=">삭제</a>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modal">평가 등록</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                </button>
            </div>
            <div class="modal-body">
                <form action="./evaluationRegisterAction.jsp" method="post">
                    <div class="row">
                        <div class="col-sm-6">
                            <label>강의명</label>
                            <input type="text" name="lectureName" class="form-control" maxlength="20">
                        </div>
                        <div class="col-sm-6">
                            <label>교수명</label>
                            <input type="text" name="professorName" class="form-control" maxlength="20">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <label>수강연도</label>
                            <select name="lectureYear" class="form-control">
                                <option value="2011">2011</option>
                                <option value="2012">2012</option>
                                <option value="2013">2013</option>
                                <option value="2014">2014</option>
                                <option value="2015">2015</option>
                                <option value="2016">2016</option>
                                <option value="2017">2017</option>
                                <option value="2018">2018</option>
                                <option value="2019">2019</option>
                                <option value="2020">2020</option>
                                <option value="2021" selected>2021</option>
                                <option value="2022">2022</option>
                                <option value="2023">2023</option>
                            </select>
                        </div>
                        <div class="col-sm-4">
                            <label>수강학기</label>
                            <select name="lectureSemester" class="form-control">
                                <option value="1학기">1학기</option>
                                <option value="여름학기">여름학기</option>
                                <option value="2학기">2학기</option>
                                <option value="겨울학기" selected>겨울학기</option>
                            </select>
                        </div>
                        <div class="col-sm-4">
                            <label>강의구분</label>
                            <select name="lectureDivide" class="form-control">
                                <option value="전공" selected>전공</option>
                                <option value="교양">교양</option>
                                <option value="기타">기타</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <label>제목</label>
                        <input type="text" name="evaluationTime" class="form-control" maxlength="30">
                    </div>
                    <div class="row">
                        <label>내용</label>
                        <input type="text" name="evaluationContent" class="form-control" maxlength="2048"
                               style="height: 100px;">
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <label>종합</label>
                            <select name="totalScore" class="form-control">
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="C">C</option>
                                <option value="D">D</option>
                                <option value="E">E</option>
                                <option value="F">F</option>
                            </select>
                        </div>
                        <div class="col-sm-3">
                            <label>성적</label>
                            <select name="totalScore" class="form-control">
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="C">C</option>
                                <option value="D">D</option>
                                <option value="E">E</option>
                                <option value="F">F</option>
                            </select>
                        </div>
                        <div class="col-sm-3">
                            <label>여유도</label>
                            <select name="totalScore" class="form-control">
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="C">C</option>
                                <option value="D">D</option>
                                <option value="E">E</option>
                                <option value="F">F</option>
                            </select>
                        </div>
                        <div class="col-sm-3">
                            <label>강의 퀄리티</label>
                            <select name="totalScore" class="form-control">
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="C">C</option>
                                <option value="D">D</option>
                                <option value="E">E</option>
                                <option value="F">F</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                        <button type="submit" class="btn btn-primary">등록하기</button>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>
<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="report" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="report">신고하기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                </button>
            </div>
            <div class="modal-body">
                <form action="./reportAction.jsp" method="post">
                    <div class="row">
                        <label>신고 제목</label>
                        <input type="text" name="reportTitle" class="form-control" maxlength="30">
                    </div>
                    <div class="row">
                        <label>내용</label>
                        <input type="text" name="reportContent" class="form-control" maxlength="2048"
                               style="height: 100px;">
                    </div>
                    <div class="modal-footer d-flex justify-content-end">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                        <button type="submit" class="btn btn-danger">신고하기</button>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>
<footer class="bg-dark mt-4 p-5 text-center" style="color: #ffffff;">
    Copyright &copy; 2022 박진근 All Rights Reserved.
</footer>


</body>
</html>
