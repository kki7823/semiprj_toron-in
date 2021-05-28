<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <!--Bootstrap-->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
            crossorigin="anonymous">
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
            crossorigin="anonymous"></script>

    <link href="../css/style.css?v" rel="stylesheet" type="text/css">
    <script src="../js/script.js" type="text/javascript"></script>
    <meta charset="UTF-8">
    <title>회원가입</title>
</head>
<body>
    <div id="join_container" class="container-lg">
        <div id="join_title" class="py-5 text-center">
            <h2>회원 가입</h2>
            <hr class="my-4">
        </div>
        <form action="../JoinServlet" id="join_form" name="join" method="post" class="needs-validation" novalidate="" enctype="multipart/form-data">
            <div>

            </div>
            <div id="join_mainbox" class="row g-3" >
                <div id="join_idbox" class="col-sm-6" >
                    <span>아이디</span><span style="color:darkred;">&nbsp;*</span><br/>
                    <input type="text" name="userId" class="form-control" id="join_idbar" placeholder="영문소문자/숫자, 4~16자" value="" required="required" style="display: inline"/>
                    <!--  중복확인 여부 확인용--><input type="hidden" name="hidden_idCheck" />
                    <input type="button" class="btn btn-primary" style="margin-bottom: 3px" value="아이디 중복 확인" onclick="idCheck()" />

                    <div class="invalid-feedback">
                        Valid id is required.
                    </div>
                </div>

                <div id="join_pwbox" class="col-sm-6">
                    <span>비밀번호</span><span style="color:darkred;">&nbsp;*</span>
                    <input type="password" name="userPwd" class="form-control" id="join_pwbar"
                           placeholder="영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자" value=""
                           required="required"/>
                    <div class="invalid-feedback">
                        Valid password is required.
                    </div>
                </div>
                <div id="join_pwbox2" class="col-sm-6">
                    <span>비밀번호 확인</span><span style="color:darkred;">&nbsp;*</span>
                    <input type="password" name="userPwd2" class="form-control" id="join_pwbar2"
                           placeholder="영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자" value=""
                           required="required"/>
                    <div class="invalid-feedback">
                        Valid password is required.
                    </div>
                </div>

                <div id="join_namebox" class="col-sm-6">
                    <span>이름</span><span style="color:darkred;">&nbsp;*</span>
                    <input type="text" name="name" class="form-control" id="join_namebar" value=""
                           required="required"/>
                    <div class="invalid-feedback">
                        Valid name is required.
                    </div>
                </div>

                <div id="join_nick" class="col-sm-6">
                    <span>닉네임</span><span style="color:darkred;">&nbsp;*</span>
                    <input type="text" name="nick" class="form-control" id="join_nickbar" value=""
                           required="required"/>
                    <div class="invalid-feedback">
                        Valid name is required.
                    </div>
                </div>

                <div id="join_phone" class="col-sm-6">
                    <span>전화번호</span><span style="color:darkred;">&nbsp;*</span>
                    <input type="text" class="form-control" id="join_phonebar" placeholder="000-0000-0000" value=""
                           required="required"/>
                    <div class="invalid-feedback">
                        Valid name is required.
                    </div>
                </div>

                <div id="join_email" class="col-sm-6">
                    <span>이메일</span><span style="color:darkred;">&nbsp;*</span>
                    <input type="email" class="form-control" id="join_emailbar" placeholder="email@example.com" value=""
                           required="required"/>
                    <div class="invalid-feedback">
                        Valid name is required.
                    </div>
                </div>

                <div id="join_postal" class="col-sm-6">
                    <span>우편번호</span><span style="color:darkred;">&nbsp;*</span><br/>
                    <input type="text" name="zipcode" class="form-control" id="join_postalbar" value=""
                           required="required" style="display: inline"/>
                    <input type="button" class="btn btn-primary" style="margin-bottom: 3px" value="우편번호 찾기"onclick="zipCheck()">
                    <div class="invalid-feedback">
                        Valid name is required.
                    </div>
                </div>

                <div id="join_address" class="col-sm-6">
                    <span>주소</span><span style="color:darkred;">&nbsp;*</span>
                    <input type="text" name="address" class="form-control" id="join_addressbar" value=""
                           required="required"/>
                    <div class="invalid-feedback">
                        Valid name is required.
                    </div>
                </div>

                <div id="join_interest" class="my-3">
                    <span>관심분야<br/></span>
                    <div class="form-check">
                        <input id="social" name="interest" type="checkbox" class="form-check-input">
                        <label class="form-check-label" for="social">사회</label>
                    </div>
                    <div class="form-check">
                        <input id="health" name="interest" type="checkbox" class="form-check-input">
                        <label class="form-check-label" for="health">건강</label>
                    </div>
                    <div class="form-check">
                        <input id="love" name="interest" type="checkbox" class="form-check-input">
                        <label class="form-check-label" for="love">연애</label>
                    </div>
                    <div class="form-check">
                        <input id="study" name="interest" type="checkbox" class="form-check-input">
                        <label class="form-check-label" for="study">학업</label>
                    </div>
                    <div class="form-check">
                        <input id="work" name="interest" type="checkbox" class="form-check-input">
                        <label class="form-check-label" for="work">직장</label>
                    </div>
                </div>

                <div id="join_upload" class="col-sm-6">
                <span>파일 업로드</span>
                <input class="form-control" type="file" id="join_uploadbar"/>
                </div>

            </div>  <!-- End of join_mainbox -->
            <div id="join_buttonbox" class="col-sm-6">
                <button class="btn btn-primary btn-lg" onclick="return ckeckJoin()">확인</button>
                <button class="btn btn-primary btn-lg" type="submit">취소</button>
            </div>
            <hr class="my-4">

        </form>
    </div>

    <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">토론In 회원가입 : Updated by 김경일</p>
        <ul class="list-inline">
        </ul>
    </footer>
</body>
</html>
