<%@ page import="com.toron.dto.ListBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.toron.dto.CommentBeanFree" %>
<%@ page import="com.toron.dao.CommentDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    CommentDAO commDAO = CommentDAO.getInstance();
    ListBean sList = (ListBean) session.getAttribute("sList");
    ArrayList<CommentBeanFree> commList = commDAO.selectCommentFree(sList.getNo());
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
    <link href="../css/style.css?122" rel="stylesheet" type="text/css">
    <script src="../js/comment.js" type="text/javascript"></script>
    <title>상세보기-자유</title>
</head>
<body>
    <div id="listD_container" class="container-xxl">
        <div id="listD_mainrow" class="row">
            <!--start of nav-->
            <jsp:include page="../listNav.jsp"/>

            <!--Start of mainbox-->
            <div id="listD_mainbox" class="col">
                <div id="listD_titlebox">
                <span id="listD_title" style="width: 500px;">${sessionScope.sList.title}
                </span>
                    <span id="listD_wdate" style="width: 140px;">작성일 ${sessionScope.sList.w_date}</span>
                    <div id="listD_profile" class="d-flex align-items-center text-center">
                        <div class="profile_box">
                            <img class="profile_photo" alt="profile" src="../images/user_profile/sample1.jpeg"/>
                        </div>
                        <span id="listD_profile_id">${sessionScope.sList.id}</span><!--아이디 들가는 곳-->
                    </div>
                </div>
                <div id="listD_contentsbox">
                    <p id="listD_contents">
                        ${sessionScope.sList.content}
                    </p>
                </div>
                <h4>comment</h4>
                <hr class="my-4"/>
                <c:forEach var="commList" items="${commList}" begin="0" end="${commList.size()}">
                    <div id="listD_commentbox">
                        <div class="comment_free">
                            <div class="profile_box">
                                <img class="profile_photo" alt="profile" src="../images/user_profile/sample1.jpeg"
                                     height="85px" width="90px"/>
                            </div>
                            <div class="comment_id">
                                    ${commList.id}
                            </div>
                            <form action="../CommentUpdate" method="get">
                                <textarea name="comment" id="comment-${commList.commnetNo}" class="comment" readonly="readonly"
                                          style="resize: none">${commList.comment}</textarea>
                                <input name="commentno" type="text" value="${commList.commnetNo}" hidden="hidden"/>
                                    <%--                            <c:if test="${commList.id eq sessionScope.id}">--%>
                                    <%--                                    로그인 id == 댓글 id 인 경우에만 버튼 활성화 --%>
                                    <%--                            </c:if>--%>
                                <div class="comment_btnbox">
                                    <button id="comment_btn_edit-${commList.commnetNo}" type="button" class="btn btn-primary btn-sm" onclick="editComment(${commList.commnetNo})">수정
                                    </button>
                                    <button id="comment_btn_editconf-${commList.commnetNo}" class="btn btn-primary btn-sm" type="submit" style="display: none">완료
                                    </button>
                                    <button class="btn btn-primary btn-sm"
                                            onclick="location.href='../Comment?action=del&commentNo=${commList.commnetNo}'">삭제
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </c:forEach>
                <div id="listD_commentInbox" class="rounded" style="border: 1pt solid slategrey">
                    <h5 class="text-start" style="margin: 10px">댓글등록</h5>
                    <form name="comment_from" action="../Comment" method="post">
                        <textarea name="comment_i" id="listD_commentIn" rows="4"></textarea>
                        <input name="comment_id" type="text" value=${sessionScope.loginUser.id} hidden="hidden"><!--session에서 id받아와야됨-->
                        <input name="comment_postno" type="text" value="${sessionScope.sList.no}" hidden="hidden">
                        <!-- 글번호 -->
                        <button class="btn btn-outline-secondary btn-lg" type="submit" style="margin: 10px">등록</button>
                    </form>
                </div>
                <div id="listD_buttonbox">
                    <hr class="my-4"/>
                    <button class="btn btn-primary btn-sm" onclick="location.href='../List?cat=3'" style="margin-right: 20px;">목록으로</button>
                </div>
            </div>
        </div> <!--End of mainbox-->
    </div>
</body>
</html>
<%-- 프로필 사진 업데이트 하는 방법--%>