package com.toron.servlet;

import com.toron.dao.CommentDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CommentUpdateServlet", value = "/CommentUpdate")
public class CommentUpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        CommentDAO commDAO = CommentDAO.getInstance();
        String comments = request.getParameter("comment");
        int commentNo = Integer.parseInt(request.getParameter("commentno"));
        int result = 0;

        result = commDAO.updateComment_free(commentNo, comments);

        if (result > 0) {
            System.out.println("자유토론 댓글 수정 성공"); //추후 로깅 처리
        } else {
            System.out.println("자유토론 댓글 수정 실패"); //추후 로깅 처리
        }
        response.sendRedirect("list_free/listDetail_free.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
