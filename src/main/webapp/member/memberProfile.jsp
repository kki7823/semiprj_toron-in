<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>

<%@ page import="com.toron.dao.*, com.toron.dto.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    request.setCharacterEncoding("UTF-8");
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("YY.MM.dd HH:mm");

    //MemberDAO dao=MemberDAO.getInstance();
    //MemberBean m=dao.select_member_one("test1");
%>
<html>
<head>
    <!--Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
            crossorigin="anonymous"></script>

    <!--custom css-->
    <link href="../css/style1.css?dn1" type="text/css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>memberProfile</title>
</head>
<body>
    <div style="background-color:#e9f2e9;">
        <div id="header_container">
            <!-- header -->
            <jsp:include page="../header.jsp"/>
        </div>

        <div class="container-lg"
             style="background-color:white; margin-top:55px; border: 3px solid #8e9c90; border-radius:20px;">
            <div id="memberP_con" class="container-lg" style="margin-top:20px; padding:30px;">

                <div id="memP_title">
                    <h2>개인정보</h2>
                    <hr class="my-4">
                </div>
                <form action="../MemberUpdate" method="post" class="needs-validation" novalidate=""
                      name="memberProfile">
                    <div class="row g-3">

                        <div id="member_photo_box">
                            <!-- 파일 구현 후 수정 -->
                            <img id="member_photo"
                                 src="/semiprj_toron_in/images/user_profile/${sessionScope.loginUser.photo }"/>
                        </div>
                        <div></div>

                        <div class="col-sm-6">
                            <span>아이디</span><span style="color: darkred;">&nbsp;*</span><br/>
                            <input type="text" name="id" class="form-control" id="join_idbar"
                                   placeholder="영문소문자/숫자, 4~16자" value="${loginUser.id }" required="required"
                                   style="display: inline" readonly/>

                        </div>

                        <div class="col-sm-6">
                            <span>닉네임</span><span style="color: darkred;">&nbsp;*</span>
                            <input type="text" name="nick" class="form-control" id="join_nickbar"
                                   value="${loginUser.nick }"
                                   required="required"/>
                            <div class="invalid-feedback">Valid name is required.</div>
                        </div>


                        <div class="col-sm-6">
                            <span>이름</span><span style="color: darkred;">&nbsp;*</span>
                            <input type="text" name="name" class="form-control" id="join_namebar"
                                   value="${loginUser.name }"
                                   required="required" readonly/>
                            <div class="invalid-feedback">Valid name is required.</div>
                        </div>


                        <div class="col-sm-6">
                            <span>전화번호</span> <span style="color: darkred;">&nbsp;*</span>
                            <input type="text" name="phone" class="form-control" id="join_phonebar"
                                   value="${loginUser.phone }" required="required"/>
                            <div class="invalid-feedback">Valid name is required.</div>
                        </div>

                        <div class="col-sm-6">
                            <span>비밀번호</span><span style="color: darkred;">&nbsp;*</span>
                            <input type="password" name="pwd" class="form-control" id="join_pwbar"
                                   placeholder="영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자" value="${loginUser.pwd }"
                                   required="required"/>
                            <div class="invalid-feedback">Valid password is required.</div>
                        </div>
                        <div class="col-sm-6">
                            <span>비밀번호 확인</span><span style="color: darkred;">&nbsp;*</span>
                            <input type="password" name="pwd2" class="form-control" id="join_pwbar2"
                                   placeholder="영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자" value="${loginUser.pwd }"
                                   required="required"/>
                            <div class="invalid-feedback">Valid password is required.</div>
                        </div>

                        <div style="width: 800px;" class="col-sm-6">
                            <span>이메일</span> <span style="color: darkred;">&nbsp;*</span>
                            <input type="email" name="email" class="form-control" id="join_emailbar"
                                   placeholder="email@example.com"
                                   value="${loginUser.email }" required="required"/>
                            <div class="invalid-feedback">Valid name is required.</div>
                        </div>

                        <div class="col-sm-6">
                            <span>우편번호</span><span style="color: darkred;">&nbsp;*</span><br/>
                            <input type="text" name="zipcode" class="form-control" id="join_postalbar"
                                   value="${loginUser.zipcode }" required="required"
                                   style="display: inline"/>

                            <div class="invalid-feedback">Valid name is required.</div>
                        </div>

                        <div class="col-sm-6">
                            <span>주소</span><span style="color: darkred;">&nbsp;*</span>
                            <input type="text" name="address" class="form-control" id="join_addressbar"
                                   value="${loginUser.address }" required="required"/>
                            <div class="invalid-feedback">Valid name is required.</div>
                        </div>

                        <div class="my-3">
                            <span>관심분야<br/></span>
                            <div class="form-check">
                                <input id="social" name="interest" type="checkbox"
                                       class="form-check-input" style="" value="사회"
                                       <c:if test="${loginUser.interest[0] == '1'}">checked</c:if> />
                                <label class="form-check-label" for="social">사회</label>
                            </div>
                            <div class="form-check">
                                <input id="health" name="interest" type="checkbox"
                                       class="form-check-input" value="건강"
                                       <c:if test="${loginUser.interest[1] == '1'}">checked</c:if>>
                                <label class="form-check-label" for="health">건강</label>
                            </div>
                            <div class="form-check">
                                <input id="love" name="interest" type="checkbox"
                                       class="form-check-input" value="연애"
                                       <c:if test="${loginUser.interest[2] == '1'}">checked</c:if>>
                                <label class="form-check-label" for="love">연애</label>
                            </div>
                            <div class="form-check">
                                <input id="study" name="interest" type="checkbox"
                                       class="form-check-input" value="학업"
                                       <c:if test="${loginUser.interest[3] == '1'}">checked</c:if>> <label
                                    class="form-check-label" for="study">학업</label>
                            </div>
                            <div class="form-check">
                                <input id="work" name="interest" type="checkbox"
                                       class="form-check-input" value="직장"
                                       <c:if test="${loginUser.interest[4] == '1'}">checked</c:if>>
                                <label class="form-check-label" for="work">직장</label>
                            </div>
                            <div class="form-check">
                                <input id="etc" name="interest" type="checkbox"
                                       class="form-check-input" value="기타"
                                       <c:if test="${loginUser.interest[5] == '1'}">checked</c:if>>
                                <label class="form-check-label" for="ect">기타</label>
                            </div>
                        </div>


                    </div>
                    <!-- End of join_mainbox -->
                    <div id="join_buttonbox">
                        <button class="w-100 btn btn-primary btn-lg" type="button" onclick="memberUpdate()"
                                style="background-color:green; border:1px solid white; margin:0 auto;">개인정보수정
                        </button>
                    </div>

                </form>
            </div>

            <!-- 내가 쓴 글 -->
            <div id="myList_container" class="container-lg">
                <div id="memP_title">
                    <h2>내가 쓴 글</h2>
                    <hr class="my-4">
                </div>

                <form id="myList">
                    <div class="table-responsive">
                        <table class="table table-striped table-sm">
                            <thead>
                            <tr>
                                <th>no</th>
                                <th>토론종류</th>
                                <th>카테고리</th>
                                <th>글제목</th>
                                <th>작성시간</th>
                                <th>조회수</th>
                                <th>추천</th>
                                <th>수정</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                String userId = ((MemberBean) session.getAttribute("loginUser")).getId();
                                ListDAO dao2 = ListDAO.getInstance();
                                ArrayList<ListBean> m_list = dao2.member_myList(userId);

                                String cate;
                                String category_num = "0";
                                String[] categorys = new String[m_list.size()];
                                for (int i = 0; i < m_list.size(); i++) {
                                    cate = m_list.get(i).getCategory();

                                    switch (cate) {
                                        case "사회":
                                            category_num = "1";
                                            break;
                                        case "건강":
                                            category_num = "2";
                                            break;
                                        case "연애":
                                            category_num = "3";
                                            break;
                                        case "학교":
                                            category_num = "4";
                                            break;
                                        case "직장":
                                            category_num = "5";
                                            break;

                                    }
                                    categorys[i] = category_num;
                                }

                                for (int i = 0; i < m_list.size(); i++) {
                                    ListBean m_list_one = m_list.get(i);
                            %>
                            <tr>
                                <td><%=m_list_one.getNo() %>
                                </td>
                                <td><%=m_list_one.getType() %>
                                </td>
                                <td><%=m_list_one.getCategory() %>
                                </td>

                                <!-- 여기에 해당 글로 갈 수 있게 링크-->
                                <td>
                                    <a href="../ListDetail?type=<%=m_list_one.getType() %>&no=<%=m_list_one.getNo() %>&category_num=<%=categorys[i] %>"
                                       style="color: green; text-decoration: none;"><%=m_list_one.getTitle() %>
                                    </a></td>
                                <td><%=m_list_one.getW_date()%>
                                </td>
                                <td><%=m_list_one.getHit() %>
                                </td>
                                <td><%=m_list_one.getGood() %>
                                </td>
                                <td>
                                    <input class="btn btn-success" type="button" value="삭제"/>
                                </td>
                            </tr>
                            <%} %>

                            </tbody>
                        </table>
                    </div>

                </form>
            </div>

            <!-- 내가 쓴 댓글 -->
            <%

                CommentDAO cDAO = CommentDAO.getInstance();
                ArrayList<CommentBeanProfile> clist = cDAO.selectCommentId(userId);
            %>
            <div id="myList_container" class="container-lg">
                <div id="memP_title">
                    <h2>내가 쓴 댓글</h2>
                    <hr class="my-4">
                </div>


                <form id="myList">
                    <div class="table-responsive">
                        <table class=" table table-striped table-sm" style="text-align: center;">
                            <thead>
                            <tr >
                                <th style="width: 10%">no</th>
                                <th style="width: 80%">내용</th>
                                <th style="width: 10%">이동</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% for (int i = 0; i < clist.size(); i++) { %>
                            <tr >
                                <td><%=clist.get(i).getNo()%></td>
                                <td><%=clist.get(i).getComment()%></td>
                                <td>
                                    <input class="btn btn-success" type="button" value="해당글이동"/>
                                </td>
                            </tr>
                            <%}%>

                            </tbody>
                        </table>
                    </div>

                </form>
            </div>
        </div>

        <div id="footer_container" style="margin-top:35px;">
            <!-- footer -->
            <jsp:include page="../footer.jsp"/>

        </div>

    </div> <!-- 이게 끝!!!! -->

    <script src="../js/script.js"></script>
</body>
</html>