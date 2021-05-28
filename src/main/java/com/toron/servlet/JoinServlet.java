package com.toron.servlet;

import javax.servlet.*;
import javax.servlet.http.*;

//import com.oreilly.servlet.MultipartRequest;
import com.toron.dao.MemberDAO;

import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/JoinServlet")
public class JoinServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("조인서블릿이다! 두포스트 호출 성공");
    	request.setCharacterEncoding("UTF-8");

    	//String path = request.getRealPath("/image");
    	//System.out.println("path:"+ path);
    	//String saveFolder="C:\\java\\sts-bundle\\pivotal-tc-server\\instances\\base-instance\\wtpwebapps\\semiprj_toron-in\\image";
		//MultipartRequest mr=new MultipartRequest(request, saveFolder);
		
    	
    	
    }
}
