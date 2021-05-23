<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<body>
<div id="listV_mainbox" class="col">
    <!--Start of listV_table-->
    <table id="listV_table" class="table table-hover">
        <thead>
        <tr>
            <th id="listV_tb_num" scope="col">번호</th>
            <th id="listV_tb_type" scope="col">종류</th>
            <th id="listV_tb_title" scope="col">제목</th>
            <th id="listV_tb_id" scope="col">작성자</th>
            <th id="listV_tb_date" scope="col">작성일</th>
            <th id="listV_tb_hit" scope="col">조회수</th>
        </tr>
        </thead>
        <tbody>
        <%--for문 작성--%>
        <tr>
            <th scope="row">1</th>
            <td>찬반</td>
            <td>직장 상사가 퇴근하기전에 먼저 퇴근하면 안되나요?</td>
            <td>Gyeong1</td>
            <td>2021-05-19</td>
            <td>30</td>
        </tr>
        <tr>
            <th scope="row">2</th>
            <td>자유</td>
            <td>야마돌때 해결법은?</td>
            <td>yamakim</td>
            <td>2021-05-20</td>
            <td>2103</td>
        </tr>
        </tbody>
    </table><!--End of listV_table-->
    <div id="listV_buttonbox">
        <hr class="my-4"/>
        <button class="btn btn-primary btn-sm" type="submit">글작성</button>
    </div>
</div>

</body>
</html>