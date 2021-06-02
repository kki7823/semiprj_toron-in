<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.toron.dto.*" %>
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

    <!--custom css-->
    <link href="css/style1.css?l1g" type="text/css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>메인페이지</title>

</head>
<body style="background-color:#e9f2e9;">
    <div id="header_container">
        <!-- header -->
        <jsp:include page="header.jsp"/>
    </div>

    <div class="container-lg">
        <!-- 실시간 인기검색어 / best5 -->
        <div id="utill">
            <div id="main_hotK">
                <jsp:include page="utill/hotKeyword.jsp"/>
            </div>

            <div id="main_best5">
                <jsp:include page="utill/best.jsp"/>
            </div>

            <!-- 최신글 -->
            <div id="main_newestbox">
                <jsp:include page="newestList.jsp"/>
            </div>
        </div>
    </div>

    <div id="footer_container">
        <!-- footer -->
        <jsp:include page="footer.jsp"/>

    </div>

</body>
</html>