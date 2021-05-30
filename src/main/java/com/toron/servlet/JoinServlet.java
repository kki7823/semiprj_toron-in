package com.toron.servlet;

import javax.servlet.*;
import javax.servlet.http.*;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.toron.dao.MemberDAO;
import com.toron.dto.MemberBean;

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

		/**파일 업로드**/
    	String savePath = request.getServletContext().getRealPath("/image");
		int sizeLimit = 1024*1024*15;
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8",  new DefaultFileRenamePolicy());
    	
		String fileName = multi.getFilesystemName("m_file");
		System.out.println(savePath); //경로
		System.out.println(fileName);
		
		String userId=multi.getParameter("userId");
		String userPwd=multi.getParameter("userPwd");
		String name=multi.getParameter("name");
		String nick = multi.getParameter("nick");
		String phone = multi.getParameter("phone");
		String email = multi.getParameter("email");
		String zipcode = multi.getParameter("zipcode");
		String address = multi.getParameter("address");
		String[] interest = multi.getParameterValues("interest");
		//System.out.println(userId+" "+userPwd+" "+address);
		
		
		MemberBean member = new MemberBean();
		member.setId(userId);
		member.setPwd(userPwd);
		member.setName(name);
		member.setNick(nick);
		member.setPhone(phone);
		member.setEmail(email);
		member.setAddress(address);
		member.setZipcode(zipcode);
		member.setInterest(interest);
		member.setPhoto(fileName);
		
		MemberDAO dao = MemberDAO.getInstance();
		member=dao.insert_member_one(member);
		
		request.setAttribute("member", member);
		request.setAttribute("userId", userId);
    	
    	RequestDispatcher rd=request.getRequestDispatcher("join/joinSuccess.jsp");
		rd.forward(request, response);
		
    }
}
