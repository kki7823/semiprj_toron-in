<%@ page import="com.toron.dao.CommentDAO" %>
<%@ page import="com.toron.dto.ListBean" %>
<%@ page import="com.toron.dto.CommentBeanYesno" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    CommentDAO commDAO = CommentDAO.getInstance();
    ListBean sList = (ListBean) session.getAttribute("sList");
    ArrayList<CommentBeanYesno> commList = commDAO.selectCommentYesno(sList.getNo());
    pageContext.setAttribute("commList", commList);
%>
<html>
<head>
    <!--Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
            crossorigin="anonymous"></script>
    <link href="../css/style1.css?ver=22Z2" rel="stylesheet" type="text/css">
    <script src="../js/comment.js" type="text/javascript"></script>
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
                    ${sessionScope.sList.title}
                </span>
                    <span id="listD_wdate" style="width: 140px;">작성일 ${sessionScope.sList.w_date}</span>
                    <div id="listD_profile" class="d-flex align-items-center text-center">
                        <div class="profile_box">
                            <img class="profile_photo" alt="profile" src="../images/user_profile/sample1.jpeg"/>
                        </div>
                        <span id="listD_profile_id">${sessionScope.sList.id}</span><!--닉네임 들가는 곳-->
                    </div>
                </div>
                <!--말풍선 넣는곳-->
                <c:forEach var="commList" items="${commList}" begin="0" end="${commList.size()}">
                    <c:choose>
                        <c:when test="${commList.yesno eq 'yes'}">
                            <div class="listD_contentsbox">
                                <div class="listD_balloon">
                                    <div class="balloon_yes">
                                        <div class="balloon_id">${commList.id} 님:</div>
                                            ${commList.comment} <br/>
                                        <a id="listD_button_del" href="../CommentYn?action=del&commentNo=${commList.commnetNo}">×</a>
<%--                                        <button id="listD_button_del" onclick="location.href='../CommentYn?action=del&commentNo=${commList.commnetNo}'">삭제</button>--%>
                                    </div>
                                </div>
                            </div>
                        </c:when>

                        <c:when test="${commList.yesno eq 'no'}">
                            <div class="listD_contentsbox">
                                <div class="listD_balloon">
                                    <div class="balloon_no">
                                        <div class="balloon_id">${commList.id} 님:</div>
                                            ${commList.comment} <br/>
                                        <a id="listD_button_del" href="../CommentYn?action=del&commentNo=${commList.commnetNo}">×</a>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                    </c:choose>
                </c:forEach>

                <form action="../CommentYn" method="post">
                    <div id="listD_commentInbox_y" class="rounded" style="border: 1pt solid slategrey">
                        <h5 id="listD_commentInTitle_y" class="text-start">댓글등록</h5>
                        <div id="listD_radiobox_y">
                            <input type="radio" name="yesno" value="yes" checked="checked"/>찬성
                            <input type="radio" name="yesno" value="no"/>반대
                        </div>
                        <textarea name="comment_i" id="listD_commentIn_y" rows="4"></textarea>
                                <input name="comment_id" type="text" value="${sessionScope.loginUser.id}" hidden="hidden">
                        <input name="comment_postno" type="text" value="${sessionScope.sList.no}"
                               hidden="hidden">
                        <button class="btn btn-outline-secondary btn-lg" type="submit" style="margin: 10px">등록
                        </button>
                    </div>
                </form>
                <div id="listD_buttonbox">
                    <hr class="my-4"/>
                    <button class="btn btn-primary btn-sm" type="submit" style="margin-right: 20px;">목록으로
                    </button>
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
    <script>loginLock_yn(${sessionScope.loginUser.id})</script>
</body>
</html>