<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"%>
<div id="new_title">

    <span><font color="#198754" style="font-family:'MaplestoryOTFLight'; font-size:1.5em;"><b>최신글 보기</b></font></span>
</div>
<div id="main_list_mainbox" class="col">
    <!--Start of listV_table-->
    <table id="main_list_table" class="table table-hover">
        <thead>
        <tr>
            <th id="main_list_tb_num" scope="col">번호</th>
            <th id="main_list_tb_type" scope="col">종류</th>
            <th id="main_list_tb_title" scope="col">제목</th>
            <th id="main_list_tb_id" scope="col">작성자</th>
            <th id="main_list_tb_date" scope="col">작성일</th>
            <th id="main_list_tb_hit" scope="col">조회수</th>
        </tr>
        </thead>
        <tbody>
        <%--for문 작성--%>
        <tr>
            <th scope="row">1</th>
            <td>찬반</td>
            <td><a href="#" style="color: green; text-decoration: none;">직장 상사가 퇴근하기전에 먼저 퇴근하면 안되나요?</a></td>
            <td>Gyeong1</td>
            <td>2021-05-19</td>
            <td>30</td>
        </tr>
        <tr>
            <th scope="row">2</th>
            <td>자유</td>
            <td><a href="#" style="color: green; text-decoration: none;">야마돌때 해결법은?</a></td>
            <td>yamakim</td>
            <td>2021-05-20</td>
            <td>2103</td>
        </tr>
        </tbody>
    </table>
    <!--End of listV_table-->
    <div id="main_list_buttonbox">
        <hr class="my-4"/>
        <button class="btn btn-success" type="submit">글작성</button>
    </div>
</div>