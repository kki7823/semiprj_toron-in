<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.toron.dto.*" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css">

    <!--Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
            crossorigin="anonymous"></script>

    <!--custom css-->
    <link href="css/style1.css" type="text/css" rel="stylesheet">
    <style type="text/css">

        @font-face {
            font-family: 'MaplestoryOTFLight';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/MaplestoryOTFLight.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

    </style>

    <meta charset="UTF-8">
    <title>메인페이지</title>
</head>
<body>
    <div id="main_header_top" class="row">
        <div id="main_logobox" class="col">
            <img src="image/discuss.png" alt="logo" height="90px" width="90px"/>
        </div>

        <!-- 검색 창 -->
        <div id="main_searchbox" class="col-6">
            <form action="Search" method="post">
                <input name="search" type="search" id="form1" size="50"/>
                <button type="submit" class="btn btn-success">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="18" fill="currentColor" class="bi bi-search"
                 viewBox="0 0 16 16">
                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
            </svg>
            </button>
            </form>
        </div>
        <!-- 미니 -->
        <!-- 로그인 된 정보가 있으면 보이게하고 없으면 안보이게 -->
        <%
            MemberBean member = new MemberBean();
            member = (MemberBean) session.getAttribute("loginUser");

            if (member != null) {
        %>
        <jsp:include page="member/memberProfileMini.jsp"/>
        <%} else {%>
        <jsp:include page="member/memberProfileMini_hidden.jsp"/>
        <%} %>
    </div>


    <div id="main_header_bottom" class="row" style="background-color:#f2f2df;">
        <div id="main_navbox" class="col-10">
            <ul id="main_nav" class="nav">
                <li class="nav-item">
                    <a class="nav-link active" id="nav_all" aria-current="page" href="#"><font
                            color="gray">전체</font></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="List?cat=1"><font color="#fb8c00"><b>사회</b></font></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="List?cat=2"><font color="#4db6ac"><b>건강</b></font></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="List?cat=3"><font color="#fb8c00"><b>연애</b></font></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="List?cat=4"><font color="#4db6ac"><b>학업</b></font></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="List?cat=5"><font color="#fb8c00"><b>직장</b></font></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="List?cat=99"><font color="#4db6ac"><b>기타</b></font></a>
                </li>
            </ul>
        </div>
        <div id="main_loginbox" class="d-flex justify-content-evenly align-items-center col">
            <%
                if (member == null) {
            %>
            <input class="btn btn-success" type="button" value="로그인" onclick="location.href='login/loginForm.jsp'"/>
            <%} else {%>
            <input class="btn btn-success" type="button" value="로그아웃" onclick="location.href='Login'"/>
            <%} %>
            <input class="btn btn-success" type="submit" value="회원가입" onclick="location.href='join/joinForm.jsp'"/>
        </div>
    </div>
    <div id="main_body" class="row">
        <div id="main_sidebox" class="col">

        </div>
        <div id="main_" class="col">

        </div>
    </div>
</body>
</html>
