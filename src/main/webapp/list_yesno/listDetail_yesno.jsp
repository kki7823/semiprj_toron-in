<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!--Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
            crossorigin="anonymous"></script>
    <link href="../css/style1.css?ver=1svZ" rel="stylesheet" type="text/css">
    <title>상세보기-찬반</title>
</head>
<body>
    <div id="listD_container" class="container-xxl">
        <div id="listD_mainrow" class="row">
            <!--start of nav-->
            <jsp:include page="../listNav.jsp"/>

            <!--Start of mainbox-->
                <div id="listD_mainbox_y" class="col">
                    <div id="listD_titlebox">
                <span id="listD_title" style="width: 500px;">
                    저녁 맛있는거먹기 vs 식단 ㄱㄱ
                </span>
                        <span id="listD_wdate" style="width: 140px;">작성일 2021/05/21</span>
                        <div id="listD_profile" class="d-flex align-items-center text-center">
                            <div class="profile_box">
                                <img class="profile_photo" alt="profile" src="../images/user_profile/sample1.jpeg"/>
                            </div>
                            <span id="listD_profile_id">야마가싹도노</span><!--닉네임 들가는 곳-->
                        </div>
                    </div>
                    <!--말풍선 넣는곳-->
                    <div id="listD_contentsbox_y">
                        <div class="listD_balloon" >
                            <div class="balloon_yes">
                                <div class="balloon_id">경경경 님:</div>
                                가끔 맛있는것도 먹어야죠 <br/>
                                맛있으면 0칼로리 ㅇㅈ?
                            </div>
                        </div>
                        <div class="listD_balloon" >
                            <div class="balloon_no">
                                <div class="balloon_id">영영영 님:</div>
                                야이 정신나간새끼야 맛있으면 3천칼로리다
                            </div>
                        </div>
                        <div class="listD_balloon" >
                            <div class="balloon_yes">
                                야마돈다 <br/>
                                햄버거 먹고싶다 <br/>
                                ㅅㅂ <br/>
                            </div>
                        </div>
                    </div>

                    <div id="listD_commentInbox_y" class="rounded" style="border: 1pt solid slategrey">
                        <h5 class="text-start" style="margin: 10px">댓글등록</h5>
                        <textarea id="listD_commentIn_y" rows="4"></textarea>
                        <button class="btn btn-outline-secondary btn-lg" type="submit" style="margin: 10px">등록</button>
                    </div>
                    <div id="listD_buttonbox">
                        <hr class="my-4"/>
                        <button class="btn btn-primary btn-sm" type="submit" style="margin-right: 20px;">목록으로</button>
                    </div>
                </div> <!--End of mainbox-->
                <div id="listD_yesno_nav" class="col" style="border: 1pt solid">
                    <ul>
                        <li>참여자 수 : 102명</li>
                        <li>찬성 : 99</li>
                        <li>반대 : 3</li>
                    </ul>
                </div>
            </div>
        </div>
</body>
</html>