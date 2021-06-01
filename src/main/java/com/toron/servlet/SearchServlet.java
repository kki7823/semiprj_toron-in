package com.toron.servlet;

import com.toron.dao.ListDAO;
import com.toron.dto.ListBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "SearchServlet", value = "/Search")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        ArrayList<ListBean> selectList = new ArrayList<>();
        ListDAO lDAO = ListDAO.getInstance();

        String keyword = request.getParameter("search");

        selectList = lDAO.selectListByKey(keyword);

        request.setAttribute("sList", selectList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("listView.jsp");
        dispatcher.forward(request, response);

    }
}
