package com.toron.servlet;

import com.toron.dao.CommentDAO;
import com.toron.dao.ListDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ListEditServlet", value = "/ListEdit")
public class ListEditServlet extends HttpServlet {
    @Override
    //글삭제
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        ListDAO lDAO = ListDAO.getInstance();
        int result = 0;

        int listNo = Integer.parseInt(request.getParameter("no"));
        result = lDAO.deleteList_free(listNo);
        PrintWriter out = response.getWriter();

        if (result > 0) {
            out.println("<script>alert('해당 글이 삭제 되었습니다.'); location.href='/semiprj_toron_in/ListIdx?type=0';</script>");
            out.flush();
        } else {
            out.println("<script>alert('해당 글 삭제에 실패 하였습니다.'); location.href='/semiprj_toron_in/ListIdx?type=0';</script>");
            out.flush();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        ListDAO lDAO = ListDAO.getInstance();
        int result = 0;

        int listNo = Integer.parseInt(request.getParameter("no"));
        result = lDAO.deleteList_free(listNo);
        PrintWriter out = response.getWriter();

        if (result > 0) {
            out.println("<script>alert('해당 글이 삭제 되었습니다.'); location.href='/semiprj_toron_in/ListIdx?type=0';</script>");
            out.flush();
        } else {
            out.println("<script>alert('해당 글 삭제에 실패 하였습니다.'); location.href='/semiprj_toron_in/ListIdx?type=0';</script>");
            out.flush();
        }
    }
}
