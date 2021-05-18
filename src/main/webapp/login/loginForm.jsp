<%--
  Created by IntelliJ IDEA.
  User: gimgyeong-il
  Date: 2021/05/18
  Time: 5:24 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!--Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
            crossorigin="anonymous"></script>

    <link href="../css/style1.css?ver=222222" rel="stylesheet" type="text/css">
    <title>로그인</title>
</head>
<body>
    <div id="container" class="container-lg" style="border: 1pt solid; ">
            <div id="login_form">
                <form>
                    <img class="mb-4" src="/docs/5.0/assets/brand/bootstrap-logo.svg" alt="Logo" width="72" height="57">
                    <h1 class="h3 mb-3 fw-normal">로그인</h1>

                    <div class="form-floating">
                        <input type="email" class="form-control" id="floatingInput" placeholder="아이디">
                        <label for="floatingInput">아이디</label>
                    </div>
                    <div class="form-floating">
                        <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
                        <label for="floatingPassword">비밀번호</label>
                    </div>

                    <div class="checkbox mb-3">
                        <label>
                            <input type="checkbox" value="remember-me"> 아이디 기억하기
                        </label>
                    </div>
                    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
                    <p class="mt-5 mb-3 text-muted">© 2017–2021</p>
                </form>
            </div>
    </div>
</body>
</html>
