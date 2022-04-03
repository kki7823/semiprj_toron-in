<%@ page import="com.toron.dao.CommentDAO" %>
<%@ page import="com.toron.dto.ListBean" %>
<%@ page import="com.toron.dto.CommentBeanYesno" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.toron.dto.CommentNavBean" %>
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
    <link href="../css/style1.css?ver=dss12" rel="stylesheet" type="text/css">
    <script src="../js/comment.js" type="text/javascript"></script>
    <title>상세보기-찬반</title>
</head>
<body style="background-color: #e9f2e9">
    <div id="header_container">
        <!-- header -->
        <jsp:include page="../header.jsp"/>
    </div>
    <div id="listD_container" class="container-xxl">
        <div id="listD_mainrow" class="row">

            <!--start of nav-->
            <jsp:include page="../listNav.jsp"/>

            <!--Start of mainbox-->
            <div id="listD_mainbox_y" class="col">
                <div id="listD_titlebox">
                    <span id="listD_typeNcate" style="color: green; display:inline-block; margin-top: 20px">${sessionScope.sList.type } > ${sessionScope.sList.category }</span><br/>
                    <br />
                    <span id="listD_title" style="width: 500px;">
                        ${sessionScope.sList.title}
                    </span>
                    <span id="listD_wdate" style="width: 140px;">작성일 ${sessionScope.sList.w_date}</span>
                    <div id="listD_profile" class="d-flex align-items-center text-center">
                        <a href="../member/memberProfile.jsp" style="display : block;">
                            <div class="profile_box" style="position: relative; left: 5px; top: 3px">
                                <img class="profile_photo" alt="profile" src="../images/user_profile/sample1.jpeg"/>
                            </div>
                            <span id="listD_profile_id" style=" width: 100px; position:relative; bottom: 13px; left: 15px;" onclick="location.href='../member/memberProfile.jsp'"><font color="green"; style="font-family:'MaplestoryOTFLight';"><b>${sessionScope.sList.id}
                                님</b></font></span><!--아이디 들가는 곳-->
                        </a>
                    </div>
                </div>
                <!--말풍선 넣는곳-->
                <c:forEach var="commList" items="${commList}" begin="0" end="${commList.size()}">
                    <c:choose>
                        <c:when test="${commList.yesno eq 'yes'}">
                            <div class="listD_contentsbox">
                                <div class="listD_balloon">
                                    <div class="balloon_yes">
                                        <div class="balloon_id" style="color: white">${commList.id}:</div>
                                            ${commList.comment} <br/>
                                        <c:if test="${sessionScope.loginUser.id eq commList.id}">
                                            <a id="listD_button_del"
                                               href="../CommentYn?action=del&commentNo=${commList.commnetNo}">×</a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:when>

                        <c:when test="${commList.yesno eq 'no'}">
                            <div class="listD_contentsbox">
                                <div class="listD_balloon">
                                    <div class="balloon_no">
                                        <div class="balloon_id" style="color: white">${commList.id} :</div>
                                            ${commList.comment} <br/>
                                        <c:if test="${sessionScope.loginUser.id eq commList.id}">
                                            <a id="listD_button_del"
                                               href="../CommentYn?action=del&commentNo=${commList.commnetNo}">×</a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                    </c:choose>
                </c:forEach>

                <form action="../CommentYn" method="post">
                    <div id="listD_commentInbox_y" class="rounded" >
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
                    <button class="btn btn-success btn-sm" onclick="location.href='../List?cat=3'"
                            style="margin-right: 20px;">목록으로
                    </button>
                </div>
            </div> <!--End of mainbox-->
            <%
                int no = ((ListBean)session.getAttribute("sList")).getNo();
                CommentDAO cDAO = CommentDAO.getInstance();
                CommentNavBean comm_nav = cDAO.selectCommentNav(no);
            %>
            <div id="listD_yesno_nav" class="col" >
                <div style="margin-top:20px;">
                    <span class="fs-4"><font color="white"; style="font-family:'MaplestoryOTFLight';"><b>Status</b></font></span>
                    <hr>
                </div>
             참여 : <%=comm_nav.getParicipant()%> 명<br/>
                    찬성 : <%=comm_nav.getYes()%> 명<br/>
                    반대 : <%=comm_nav.getNo()%> 명<br/>
            </div>
        </div>
    </div>
    <script>loginLock_yn(${sessionScope.loginUser.id})</script>
    <div id="footer_container">
        <!-- footer -->
        <jsp:include page="../footer.jsp"/>
    </div>
</body>
</html>