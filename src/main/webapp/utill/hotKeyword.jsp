<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.toron.dto.*, com.toron.dao.*" %>
<%@ page import="java.util.*, java.sql.*" %>

<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("MM/dd");

    ListDAO dao=ListDAO.getInstance();

    ArrayList<ListSum_id> m_list=dao.bestUser();
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
    <style type="text/css">
        .bg-primary {background-color: #e8c992!important;}
    </style>

    <title>Title</title>
    <style>
        .list-group{
            margin-top:30px;
        }
    </style>
</head>
<body>
    <div>
        <div>
            <div id="hotK_container">
                <h5>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                         fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                        <path
                                d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                    </svg>
                    <span class="text-primary">
				<font color="#198754" style="font-family:'MaplestoryOTFLight';">
					<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;오늘의 토론 왕!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></font></span> <small
                        class="text-muted"><%= sf.format(nowTime) %></small>

                    </h4>
                    <ul class="list-group mb-3">

                        <!-- 첫번째 li -->
                        <li class="list-group-item d-flex justify-content-between bg-light">
                            <div class="text-success">
                                <span id="hotK_color" class="badge bg-primary rounded-pill">1</span>
                                <div id="hot_word">
                                    <h6 class="my-0"><font><%=m_list.get(0).getId() %></font></h6>
                                </div>

                            </div> <span class="text-success">글 작성수: <%=m_list.get(0).getListSum() %></span>
                        </li>

                        <!-- 두번째 li -->
                        <%
                            for(int i=1; i<4; i++){
                        %>

                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <span id="hotK_color" class="badge bg-primary rounded-pill"><%=i+1 %></span>
                                <h6 class="my-0"><%=m_list.get(i).getId() %></h6>


                            </div> <span class="text-muted">글 작성수: <%=m_list.get(i).getListSum() %></span>
                        </li>

                        <%} %>

                    </ul>
            </div>
        </div>
    </div>
</body>
</html>