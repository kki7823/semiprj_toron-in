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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //로그아웃
        HttpSession session=request.getSession();
        session.invalidate();

        PrintWriter out = response.getWriter();
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

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

        /**
         * if(mode==0){
         * 	request.setAttribute("mode", "0");
         * }else if(mode==1){
         * 	request.setAttribute("mode", "1");
         * }
         * **/
        HttpSession session=request.getSession();
        if(mode==0 || mode==1) {
            session.setAttribute("mode", "실패");
        }else {
            System.out.println("로그인 성공");
            MemberBean member=dao.select_member_one(login_id);

            session.setAttribute("loginUser", member);
            //session.setAttribute("userId", login_id);

            //request.setAttribute("message", "로그인되었습니다.");
            url="main.jsp";

        }
        response.sendRedirect(url);

    }
}
