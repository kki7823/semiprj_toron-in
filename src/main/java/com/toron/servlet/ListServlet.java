package com.toron.servlet;

import com.toron.dao.ListDAO;
import com.toron.dto.ListBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.awt.image.AreaAveragingScaleFilter;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ListServlet", value = "/List")
public class ListServlet extends HttpServlet {

    public ListServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        ArrayList<ListBean> selectList = new ArrayList<>();
        ListDAO lDAO = ListDAO.getInstance();

        //안된다~~~~~
        //목록으로 가기위해서 카테고리 숫자 변수 따로 만듦(1,2,3.. 저장)
        String category_num = request.getParameter("cat");

        //dao수행 위해 카테고리 한글 저장
        String category;
        switch (category_num) {
            case "0":
                selectList=lDAO.selectListAll();
                break;
            case "1":
                category = "사회";
                selectList=lDAO.selectListByCat(category);
                break;
            case "2":
                category = "건강";
                selectList=lDAO.selectListByCat(category);
                break;
            case "3":
                category = "연애";
                selectList=lDAO.selectListByCat(category);
                break;
            case "4":
                category = "학교";
                selectList=lDAO.selectListByCat(category);
                break;
            case "5":
                category = "직장";
                selectList=lDAO.selectListByCat(category);
                break;
            case "99":
                //기타
                break;
        }
        //목록으로 가기 위해서 저장해놓음 , 확인 콘솔창 메시지
        request.setAttribute("category_num", category_num);
        System.out.println("ListServlet의 "+category_num);

        request.setAttribute("sList",selectList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("listView.jsp");
        dispatcher.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
