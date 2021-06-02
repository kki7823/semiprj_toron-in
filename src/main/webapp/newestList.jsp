<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="com.toron.dto.*, com.toron.dao.*" %>
<%@ page import="java.util.*, java.sql.*" %>
<%@ page import="java.text.ParseException, java.text.SimpleDateFormat, java.text.DateFormat, java.util.Date" %>

<%
	ListDAO dao = ListDAO.getInstance();
	ArrayList<ListBean> newest_list = dao.selectList_newest();
	
	String cate;
	String category_num="0";
	String[] categorys=new String[newest_list.size()];
	for(int i=0; i<newest_list.size();i++){
			cate=newest_list.get(i).getCategory();
			
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
                <th id="main_list_tb_cate" scope="col">카테고리</th>
                <th id="main_list_tb_title" scope="col">제목</th>
                <th id="main_list_tb_id" scope="col">작성자</th>
                <th id="main_list_tb_date" scope="col">작성일</th>
                <th id="main_list_tb_hit" scope="col">조회수</th>
            </tr>
            </thead>
            <tbody>
            
            <%
            	for(int i=0; i<5; i++){
            		String fromW_date=newest_list.get(i).getW_date();
            		String toW_date=fromW_date.substring(0, 10);
           %>
            	
            <tr>
                <th scope="row"><%=i+1 %></th>
                <td><%=newest_list.get(i).getType() %></td>
                <td><%=newest_list.get(i).getCategory() %></td>
                <td><a href="ListDetail?type=<%=newest_list.get(i).getType() %>&no=<%=newest_list.get(i).getNo() %>&category_num=<%=categorys[i] %>" 
                style="color: green; text-decoration: none;"><%=newest_list.get(i).getTitle() %></a></td>
                <td><%=newest_list.get(i).getId() %></td>
                <td><%=toW_date %></td>
                <td><%=newest_list.get(i).getHit() %></td>
            </tr>
            
            <%} %>
            
            </tbody>
        </table>
        <!--End of listV_table-->
        <div id="main_list_buttonbox" style="text-align:right;">
            <hr class="my-4"/>
            <button class="btn btn-success" type="submit">글작성</button>
        </div>
    </div>