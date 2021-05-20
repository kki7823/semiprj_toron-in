<jsp:useBean id="list_temp" class="com.toron.dto.ListBean"/>
<%
    //테스트 출력용 데이터 입력
    list_temp.setNo(1972);
    list_temp.setType("자유");
    list_temp.setCategory("직장");
    list_temp.setTitle("직장 상사가 퇴근하기전에 먼저 퇴근하면 안되나요?");
    list_temp.setContents("칼퇴근 가좌");
    list_temp.setId("gyeong1");
    list_temp.setId("2021-05-20");
    list_temp.setHit(31);
    list_temp.setUpload("image.jpg");
    list_temp.setGood(10);
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!--Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
            crossorigin="anonymous"></script>

    <!--custom css-->
    <link href="css/style1.css?ver=12w21r2" type="text/css" rel="stylesheet">
    <title>글목록</title>
</head>
<body>
    <div id="listV_container" class="container-lg">
        <%--번호/제목/작성자/작성일/조회/(좋아요)--%>
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
        </table>
        <div id="listV_buttonbox">
            <hr class="my-4"/>
            <button class="btn btn-primary btn-sm" type="submit">글작성</button>
        </div>
    </div>

</body>
</html>
