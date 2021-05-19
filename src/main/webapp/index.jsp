<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <!--Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
            crossorigin="anonymous"></script>

    <!--custom css-->
    <link href="css/style.css" type="text/css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>메인페이지</title>
</head>
<body>

<div id="container" class="container-lg" style="border: 1pt solid; ">
    <div id="main_header_top" class="row">
        <div id="main_logobox" class="col">
            <img src="image/discuss.png" alt="logo" height="90px" width="90px"/>
        </div>
        <div id="main_searchbox" class="col-6">
            <fieldset id="search_bar">
                <legend>search bar</legend>
                <input type="text" name="search"/>
                <input type="button" name="search_button" value="검색"/>
            </fieldset>
        </div>
        <div id="main_memobox" class="col">
        	<div id="main_profile_photo">
           <img alt="profile" src="image/default.png" height="85px" width="90px" />
          </div>
          
          <div id="main_profile_info">
          	아이디:2zero0 <br />
          	<b>영영</b>님 환영합니다. <br />
          	<a href="#">마이페이지</a>
          </div>
        </div>
    </div>
    <div id="main_header_bottom" class="row">
        <div id="main_navbox" class="col-10" style="border: 1pt solid">
            <ul id="main_nav" class="nav">
                <li class="nav-item">
                    <a class="nav-link active" id="nav_all" aria-current="page" href="#"><font color="gray">전체</font></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">사회</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">건강</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">연애</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">학업</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">직장</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">기타</a>
                </li>
            </ul>
        </div>
        <div id="main_loginbox" class="d-flex justify-content-evenly align-items-center col">
            <input class="btn btn-primary" type="submit" value="로그인"/>
            <input class="btn btn-primary" type="submit" value="회원가입"/>
        </div>
    </div>
    <div id="main_body" class="row">
        <div id="main_sidebox" class="col">

        </div>
        <div id="main_" class="col">

        </div>
    </div>
    
    <!-- 실시간 인기검색어 / best5 -->
    <div class="main_hotK">
    <jsp:include page="utill/hotKeyword.jsp"/>
	</div>
	
	<div>
	<jsp:include page="utill/best.jsp"/>
	</div>
	
</div>




</body>
</html>
