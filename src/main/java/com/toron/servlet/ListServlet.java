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

        String category = null;
        switch (request.getParameter("cat")) {
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

        request.setAttribute("sList",selectList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("listView.jsp");
        dispatcher.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
