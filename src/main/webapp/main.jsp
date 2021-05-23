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
    <link href="css/style1.css?ver=12" type="text/css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>메인페이지</title>
</head>
<body>
    <div id="container" class="container-flude container-lg">
        <div id="main_header_top" class="row">
            <div id="main_logobox" class="col">
                <img src="image/logo.png" alt="logo" height="90px" width="90px"/>
            </div>
            <div id="main_searchbox" class="col-6">
                <fieldset id="search_bar">
                    <legend>search bar</legend>
                    <input type="text" name="search"/>
                    <input type="button" name="search_button" value="검색"/>
                </fieldset>
            </div>
            <div id="main_memobox" class="col">
                팀명 : 토론IN<br/>
                만든이 : 김경일, 이영<br/>
                프로젝트 시작일 : 2021.05.10<br/>
                프로젝트 종료일 : 2021.06.04<br/>
            </div>
        </div>
        <div id="main_header_bottom" class="row">
            <div id="main_navbox" class="col-10" style="border: 1pt solid">
                <ul id="main_nav" class="nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">인덱스1</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">인덱스2</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">인덱스3</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                    </li>
                </ul>
            </div>
            <div id="main_loginbox" class="d-flex justify-content-evenly align-items-center col">
                <input class="btn btn-primary" type="submit" value="로그인"/>
                <input class="btn btn-primary" type="submit" value="회원가입"/>
            </div>
        </div>
    </div>

</body>
</html>
