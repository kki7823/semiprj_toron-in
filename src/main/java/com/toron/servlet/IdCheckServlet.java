package com.toron.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.toron.dao.MemberDAO;

/**
 * Servlet implementation class IdCheckServlet
 */
@WebServlet(name = "IdCheckServlet", value = "/IdCheck")
public class IdCheckServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //아이디 중복확인 클릭 -> 중복확인용 새 창 -> id 값 get방식으로 넘어옴
        String userId=request.getParameter("userId");
        HttpSession session = request.getSession();
        MemberDAO dao=MemberDAO.getInstance();
        int result;

        // 중복확인 메소드 checkId 불린값이 결과값임 그러니까 여기서 true면 1 이렇게 바꿔주고 포워드
        boolean flag=dao.checkId(userId); //중복: true / 중복x: false
        if(flag == true) {
            result=1; // 중복
        }else {
            result=0; // 중복x
        }

        request.setAttribute("userId", userId);
        request.setAttribute("result", result);

        RequestDispatcher rd=request.getRequestDispatcher("join/idCheck.jsp");
        rd.forward(request, response);

//        response.sendRedirect("/semiprj_toron_in/join/idCheck.jsp");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
