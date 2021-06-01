package com.toron.servlet;

import com.toron.dao.ListDAO;
import com.toron.dto.ListBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ListDetailServlet", value = "/ListDetail")
public class ListDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        ListBean selectListBean = new ListBean();
        ListDAO lDAO = ListDAO.getInstance();
        HttpSession session = request.getSession();

        String type = request.getParameter("type");
        int no = Integer.parseInt(request.getParameter("no"));
        
        //목록으로 가기 위해서 필요 변수
        String category_num=request.getParameter("category_num");
        
        if (type.equals("자유")) {
        	//조회수 증가 먼저 시켜줌
        	lDAO.updateHit_free(no);
        	
        	//안된다~~~~~~~~~~~~~~~~
        	 //목록으로 가기 위한 작업
            request.setAttribute("category_num", category_num);
            System.out.println("ListDetailServlet의 "+category_num);
            
            selectListBean = lDAO.selectListByNo_free(no);
            session.setAttribute("sList",selectListBean);
            
            response.sendRedirect("list_free/listDetail_free.jsp");
            
            System.out.println(selectListBean.getTitle());

        } else if (type.equals("찬반")) {
        	//조회수 증가시켜줌
        	lDAO.updateHit_yserno(no);
        	
            selectListBean = lDAO.selectListByNo_yesno(no);
            session.setAttribute("sList",selectListBean);
            response.sendRedirect("list_yesno/listDetail_yesno.jsp");
            System.out.println(selectListBean.getTitle());

        } else {
            System.out.println("ListDetailServlet Error");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}