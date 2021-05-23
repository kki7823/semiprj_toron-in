<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("MM/dd HH:mm");
%>

<meta charset="UTF-8">
<div style="background-color: blue">
    <h5 class="d-flex justify-content-between align-items-center mb-3">
        <span class="text-primary"><b>실시간 인기 검색어</b></span>
        <small class="text-muted"><%= sf.format(nowTime) %>>
        </small>
    </h5>
    <ul class="list-group mb-3">
        <li class="list-group-item d-flex justify-content-between bg-light">
            <div class="text-success">
                <span class="badge bg-primary rounded-pill">1</span>
                <div id="hot_word">
                    <h6 class="my-0">다이어트</h6>
                </div>
            </div>
            <span class="text-success">검색수: 39</span>
        </li>
        <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
                <span class="badge bg-primary rounded-pill">2</span>
                <h6 class="my-0">술먹을 때</h6>
            </div>
            <span class="text-muted">검색수: 22</span>
        </li>
        <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
                <span class="badge bg-primary rounded-pill">3</span>
                <h6 class="my-0">데이트 코스</h6>
            </div>
            <span class="text-muted">검색수: 19</span>
        </li>
        <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
                <span class="badge bg-primary rounded-pill">4</span>
                <h6 class="my-0">정치색깔</h6>
            </div>
            <span class="text-muted">검색수: 14</span>
        </li>
        <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
                <span class="badge bg-primary rounded-pill">5</span>
                <h6 class="my-0">더치페이</h6>
            </div>
            <span class="text-muted">검색수: 13</span>
        </li>
    </ul>
</div>
