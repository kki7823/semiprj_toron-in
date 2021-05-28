<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%
	String mode=(String)session.getAttribute("mode");
	if(mode != null){
%>
	<script>
		alert("로그인에 실패하였습니다. \n 아이디 또는 비밀번호를 확인하세요.");
	</script>
<%} %>
	
<html>
<head>
    <!--Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
            crossorigin="anonymous"></script>

    <link href="../css/style.css?ver=2222" rel="stylesheet" type="text/css">
    <title>로그인</title>
</head>
<body>
    <div id="container" class="container-lg" >
            <div id="login_form">
                <form action="../LoginServlet" method="post">
                    <img class="mb-4" src="/docs/5.0/assets/brand/bootstrap-logo.svg" alt="Logo" width="72" height="57">
                    <h1 id="login_title" class="h3 mb-3 fw-normal">로그인</h1>

                    <div id="login_idbox" class="form-floating">
                        <input type="text" class="form-control" id="floatingInput" placeholder="아이디" name="login_id">
                        <label for="floatingInput">아이디</label>
                    </div>
                    <div id="login_pwbox" class="form-floating">
                        <input type="password" class="form-control" id="floatingPassword" placeholder="비밀번호" name="login_pw">
                        <label for="floatingPassword">비밀번호</label>
                    </div>

                    <div class="checkbox mb-3">
                        <label>
                            <input type="checkbox" value="remember-me"> 아이디 기억하기
                        </label>
                    </div>
                    <input type="submit" id="login_button" class="w-100 btn btn-lg btn-primary" value="로그인"/>
                    <p class="mt-5 mb-3 text-muted">© 2017–2021</p>
                </form>
            </div>
    </div>
</body>
</html>
