package com.toron.servlet;

import javax.servlet.*;
import javax.servlet.http.*;

import com.toron.dao.MemberDAO;
import com.toron.dto.MemberBean;

import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Arrays;

@WebServlet("/MemberUpdateServlet")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("MemberUpdateServlet - doPost() 호출 성공");

		String id = request.getParameter("id");
		String nick = request.getParameter("nick");
		String phone = request.getParameter("phone");
		String pwd = request.getParameter("pwd");
		String pwd2 = request.getParameter("pwd2"); // 비밀번호확인
		String email = request.getParameter("email");
		String zipcode = request.getParameter("zipcode");
		String address = request.getParameter("address");

		String[] interest = request.getParameterValues("interest");
		// System.out.println(Arrays.toString(interest));

		MemberBean member = new MemberBean();
		member.setId(id);
		member.setNick(nick);
		member.setPhone(phone);
		member.setPwd(pwd);
		member.setEmail(email);
		member.setZipcode(zipcode);
		member.setAddress(address);
		member.setInterest(interest);

		MemberDAO dao = MemberDAO.getInstance();
		dao.update_member_one(member);

		response.sendRedirect("member/memberProfile.jsp");

	}
}
