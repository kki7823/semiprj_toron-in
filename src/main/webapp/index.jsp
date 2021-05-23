<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
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
<link href="css/style.css?fdd" type="text/css" rel="stylesheet">
<meta charset="UTF-8">
<title>메인페이지</title>

</head>
<body style="background-color:#e9f2e9;">

	<div id="header_container">
		<!-- header -->
		<jsp:include page="header.jsp" />
	</div>

	<div id="main_container" class="container-lg" style="border: 1pt solid;">
		<!-- 실시간 인기검색어 / best5 -->
		<div id="utill">
			<div id="main_hotK">
				<jsp:include page="utill/hotKeyword.jsp" />
			</div>

			<div id="main_best5">
				<jsp:include page="utill/best.jsp" />
			</div>
		</div>
		
		<!-- 최신글 -->
		<div style="width:1300px; border:1px solid;">
			ddd
			<!-- <jsp:include page="newestList.jsp" /> -->
		</div>
	</div>


	<div id="footer_container">
		<!-- footer -->
		<jsp:include page="footer.jsp" />

	</div>

</body>
</html>
