<%--
  Created by IntelliJ IDEA.
  User: gimgyeong-il
  Date: 2021/05/19
  Time: 11:35 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("MM/dd HH:mm");
%>

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


<link href="../css/style.css" type="text/css" rel="stylesheet">
<title>Title</title>
</head>
<body>
	<div class="row g-5">
		<div class="col-md-5 col-lg-4 order-md-last">
			<h5 class="d-flex justify-content-between align-items-center mb-3">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  <path
						d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
</svg>
				<span class="text-primary"><b>실시간 인기 검색어</b></span> <small
					class="text-muted"><%= sf.format(nowTime) %></small>

				</h4>
				<ul class="list-group mb-3">
					<li class="list-group-item d-flex justify-content-between bg-light">
						<div class="text-success">
							<span class="badge bg-primary rounded-pill">1</span>
							<div id="hot_word">
								<h6 class="my-0">다이어트</h6>
							</div>

						</div> <span class="text-success">검색수: 39</span>
					</li>
					<li class="list-group-item d-flex justify-content-between lh-sm">
						<div>
							<span class="badge bg-primary rounded-pill">2</span>
							<h6 class="my-0">술먹을 때</h6>


						</div> <span class="text-muted">검색수: 22</span>
					</li>
					<li class="list-group-item d-flex justify-content-between lh-sm">
						<div>
							<span class="badge bg-primary rounded-pill">3</span>
							<h6 class="my-0">데이트 코스</h6>

						</div> <span class="text-muted">검색수: 19</span>
					</li>
					<li class="list-group-item d-flex justify-content-between lh-sm">
						<div>
							<span class="badge bg-primary rounded-pill">4</span>
							<h6 class="my-0">정치색깔</h6>

						</div> <span class="text-muted">검색수: 14</span>
					</li>
					<li class="list-group-item d-flex justify-content-between lh-sm">
						<div>
							<span class="badge bg-primary rounded-pill">5</span>
							<h6 class="my-0">더치페이</h6>

						</div> <span class="text-muted">검색수: 13</span>
					</li>

				</ul>
		</div>
</body>
</html>
