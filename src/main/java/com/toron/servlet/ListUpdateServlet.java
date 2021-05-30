package com.toron.servlet;

import com.toron.dao.ListDAO;
import com.toron.dto.ListBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ListUpdateServlet", value = "/ListUpdate")
public class ListUpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        ListDAO lDAO = ListDAO.getInstance();

        String type = null;
        switch (request.getParameter("list_type")) {
            case "1":
                type = "자유";
                break;
            case "2":
                type = "찬반";
                break;
        }

        String category = null;
        switch (request.getParameter("list_category")) {
            case "1":
                category = "사회";
                break;
            case "2":
                category = "건강";
                break;
            case "3":
                category = "연애";
                break;
            case "4":
                category = "학업";
                break;
            case "5":
                category = "직장";
                break;
        }

        String title = request.getParameter("list_title");
        String contents = request.getParameter("list_contents");
        String id = "test1"; // <-----------나중에 session에서 id 가져올것
        String upload = request.getParameter("list_upload");
        System.out.println(type);

        //자유토론
        if (type.equals("자유")) {
            ListBean beanFree = new ListBean();
            beanFree.setType(type);
            beanFree.setCategory(category);
            beanFree.setTitle(title);
            beanFree.setContent(contents);
            beanFree.setId(id);
            beanFree.setUpload(upload);

            if(lDAO.insertPost_free(beanFree)>0){
                //나중에 로깅 처리 할부분
                System.out.println("LIST FREE INSERT : SUCCESS");
            }else {
                System.out.println("LIST FREE INSERT : FAIL");
            }

        } else if (type.equals("찬반")) {
            ListBean beanYesno = new ListBean();
            beanYesno.setType(type);
            beanYesno.setCategory(category);
            beanYesno.setTitle(title);
            beanYesno.setId(id);
            beanYesno.setUpload(upload);

            if(lDAO.insertPost_yn(beanYesno)>0){
                //나중에 로깅 처리 할부분
                System.out.println("LIST YN INSERT : SUCCESS");
            }else {
                System.out.println("LIST YN INSERT : FAIL");
            }
        }

        response.sendRedirect("listView.jsp");
    }
}
