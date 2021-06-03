<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <!--Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
            crossorigin="anonymous"></script>

    <!--custom css-->
    <link href="css/style.css?hh" type="text/css" rel="stylesheet">
    <title>글목록</title>
    <style type="text/css">
    	#listV_table>tbody>tr>td>a:hover{
    		font-weight:bold;
    	}
    </style>
</head>
<body>
<div id="header_container">
        <!-- header -->
        <jsp:include page="header.jsp"/>
    </div>
    
    <div style="background-color:#e9f2e9;">
    <div id="listV_container" class="container-xxl" style="padding:20px;">
        <div id="listV_mainrow" class="row">
            <jsp:include page="listNav.jsp"/>
            <div id="listV_mainbox" class="col" style="background-color:white; border: 3px solid #8e9c90; border-radius:20px; margin-left:20px; padding:20px;">
                <span class="fs-4"><font color="green"; style="font-family:'MaplestoryOTFLight';"><b>&nbsp;&nbsp;&nbsp;&nbsp;List</b></font></span>
                
                <!--Start of listV_table-->
                <table id="listV_table" class="table table-hover">
                    <thead>
                    <tr>
                        <th id="listV_tb_num" scope="col">번호</th>
                        <th id="listV_tb_type" scope="col">종류</th>
                        <th id="listV_tb_cate" scope="col">카테고리</th>
                        <th id="listV_tb_title" scope="col">제목</th>
                        <th id="listV_tb_id" scope="col">작성자</th>
                        <th id="listV_tb_date" scope="col">작성일</th>
                        <th id="listV_tb_hit" scope="col">조회수</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%--for문 작성--%>
                    <c:forEach var="list" items="${requestScope.sList}" begin="0" end="${requestScope.sList.size()}">
                    	
                        <tr>
                            <th scope="row">${list.no}</th>
                            <td>${list.type}</td>
                            <td>${list.category}</td>
                            <td><a style="color: green; text-decoration: none; " href="ListDetail?type=${list.type}&no=${list.no}&category_num=${requestScope.category_num}">${list.title}</a></td>
                            <td>${list.id}</td>
                            <td>${fn:substring(list.w_date,0,10)}</td>
                            <td>${list.hit}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table><!--End of listV_table-->
                <div id="listV_buttonbox">
                    <hr class="my-4"/>
                    <button class="btn btn-success" onclick="location.href='listUpload.jsp'">글작성</button>
                </div>
            </div>
        </div>
    </div>
    </div><!-- 이게 끝이다!! -->
    
     <div id="footer_container">
        <!-- footer -->
        <jsp:include page="footer.jsp"/>
    </div>
</body>
</html>