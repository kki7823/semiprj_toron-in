package com.toron.servlet;

import javax.servlet.*;


import com.toron.dao.MemberDAO;
import com.toron.dto.MemberBean;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", value = "/Login")
public class LoginServlet extends HttpServlet {

    public LoginServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //로그아웃
        HttpSession session=request.getSession();
        session.invalidate();

        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<script>alert('로그아웃 되었습니다.'); location.href='main.jsp';</script>");
        out.flush();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //System.out.println("로그인 서블릿 doPost호출 성공");

        request.setCharacterEncoding("UTF-8");

        String url="login/loginForm.jsp";
        String login_id=request.getParameter("login_id");
        String login_pw=request.getParameter("login_pw");

        MemberDAO dao=MemberDAO.getInstance();
        int mode=dao.loginMember(login_id, login_pw);

        HttpSession session=request.getSession();

        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        if(mode==0 || mode==1) {
            session.setAttribute("mode", "실패");
            response.sendRedirect(url);
        }else {
            System.out.println("로그인 성공");
            MemberBean member=dao.select_member_one(login_id);

            session.setAttribute("loginUser", member);

            out.println("<script>alert('로그인 되었습니다.');location.href='main.jsp';</script>");
            out.flush();
        }



    }
}
