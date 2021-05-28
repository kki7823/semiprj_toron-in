package com.toron.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.toron.dao.MemberDAO;
import com.toron.dto.ZipcodeBean;

/**
 * Servlet implementation class ZipSearchServlet
 */
@WebServlet("/ZipSearchServlet")
public class ZipSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZipSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("집체크 두겟호출입니다요");
		response.sendRedirect("join/zipSearch.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("집체크하는거 포스트!!시발 호출");
		request.setCharacterEncoding("UTF-8");
		
		String search = request.getParameter("search");
		
		String area3=null;
		ArrayList<ZipcodeBean> zipList=null;
		
		area3=request.getParameter("area3"); //폼에서 넘어온 값
		
		MemberDAO dao=MemberDAO.getInstance();
		zipList=dao.zipcodeRead(area3);
		
		//System.out.println(zipList.get(0).getArea3());
		
		// 보낼 값
		request.setAttribute("search", search);
		request.setAttribute("zipList", zipList);
		
		RequestDispatcher rd2=request.getRequestDispatcher("join/zipSearch.jsp");
		rd2.forward(request, response);
		
	}

}
