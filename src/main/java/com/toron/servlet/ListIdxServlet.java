package com.toron.servlet;

import com.toron.dao.ListDAO;
import com.toron.dto.ListBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ListIdxServlet", value = "/ListIdx")
public class ListIdxServlet extends HttpServlet {

    public ListIdxServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        ArrayList<ListBean> selectList = new ArrayList<>();
        ListDAO lDAO = ListDAO.getInstance();

        String type = request.getParameter("type");

        switch (type){
            case "0":
                selectList = lDAO.selectListAll();
                break;
            case "1":
                selectList = lDAO.selectListByType("자유");
                break;
            case "2":
                selectList = lDAO.selectListByType("찬반");
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
