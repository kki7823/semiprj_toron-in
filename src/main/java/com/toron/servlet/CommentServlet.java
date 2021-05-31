package com.toron.servlet;

import com.toron.dao.CommentDAO;
import com.toron.dto.CommentBeanFree;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(name = "CommentServlet", value = "/Comment")
public class CommentServlet extends HttpServlet {

    public CommentServlet() {
    }

    //댓글 삭제
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        CommentDAO commDAO = CommentDAO.getInstance();
        String action = request.getParameter("action");
        int result = 0;

        if (action.equals("del")) {
            int commetNo = Integer.parseInt(request.getParameter("commentNo"));
            PrintWriter out = response.getWriter();
            response.setContentType("text/html; charset=UTF-8");
            result = commDAO.deleteCommentFree(commetNo);
            if (result > 0) {
                out.println("<script>alert('댓글이 삭제 되었습니다.'); location.href='list_free/listDetail_free.jsp';</script>");
                out.flush();
            } else {
                out.println("<script>alert('댓글 삭제 실패'); location.href='list_free/listDetail_free.jsp';</script>");
                out.flush();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        CommentDAO cDAO = CommentDAO.getInstance();
        int result = 0;


        int no = Integer.parseInt(request.getParameter("comment_postno"));
        String id = request.getParameter("comment_id");
        String comment = request.getParameter("comment_i");

        result = cDAO.insertComment_free(no, id, comment);

        if (result > 0) {
            System.out.println("자유토론 댓글 삽입 성공"); //추후 로깅 처리
        } else {
            System.out.println("자유토론 댓글 삽입 실패"); //추후 로깅 처리
        }

        response.sendRedirect("list_free/listDetail_free.jsp");
    }
}
