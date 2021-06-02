<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.toron.dto.*, com.toron.dao.*" %>
<%@ page import="java.util.*, java.sql.*" %>
<html>
<head>
    <title>Title</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
            crossorigin="anonymous">
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
            crossorigin="anonymous"></script>

    <style>
        .list-group-item.active {
            z-index: 2;
            color: #fff;
            background-color: #0d6efd;
            border-color: #ffffff;
        }
    </style>
</head>
<body>
    <%
        ListDAO dao=ListDAO.getInstance();
        ArrayList<ListBean> bestList=dao.selectListByHit();

        String cate;
        String category_num="0";
        String[] categorys=new String[bestList.size()];
        for(int i=0; i<bestList.size();i++){
            cate=bestList.get(i).getCategory();

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
            categorys[i]=category_num;
        }
    %>
    <div id="best_container">
        <div>
            <div style="margin-top:10px;">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                     fill="currentColor" class="bi bi-hand-thumbs-up-fill"
                     viewBox="0 0 16 16">
                    <path
                            d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"/>
                </svg>
                <span class="fs-5 fw-semibold"><font color="#198754" style="font-family:'MaplestoryOTFLight';"><b>&nbsp;&nbsp;&nbsp;Best5</b></font></span>
            </div>


            <div style="margin-top:10px;" class="list-group list-group-flush border-bottom scrollarea">
                <a href="ListDetail?type=<%=bestList.get(0).getType() %>&no=<%=bestList.get(0).getNo() %>&category_num=<%=categorys[0] %>"
                   class="list-group-item list-group-item-action active py-3 lh-tight"
                   aria-current="true" style="background-color:#e8c992;">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <small><%=bestList.get(0).getType() %> > <%=bestList.get(0).getCategory() %></small>
                        <strong class="mb-1"><%=bestList.get(0).getTitle() %></strong>
                        <small><%=bestList.get(0).getId() %></small>
                    </div>
                </a>

                <% for (int i=1; i<5; i++) { %>
                <a href="ListDetail?type=<%=bestList.get(i).getType() %>&no=<%=bestList.get(i).getNo() %>&category_num=<%=categorys[i] %>"
                   class="list-group-item list-group-item-action py-3 lh-tight">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <small><%=bestList.get(i).getType() %> > <%=bestList.get(i).getCategory() %></small> <strong class="mb-1"><%=bestList.get(i).getTitle() %></strong> <small
                            class="text-muted"><%=bestList.get(i).getId() %></small>
                    </div>
                </a>
                <%} %>

            </div>
        </div>
    </div>
    </div>
</body>
</html>