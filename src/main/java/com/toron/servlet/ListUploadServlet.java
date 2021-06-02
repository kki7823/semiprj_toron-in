package com.toron.servlet;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.toron.dao.ListDAO;
import com.toron.dto.ListBean;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ListUploadServlet", value = "/ListUpload")
public class ListUploadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        ListDAO lDAO = ListDAO.getInstance();

        //파일 업로드 관련
        String path = request.getSession().getServletContext().getRealPath("images/list_image");
        System.out.println(path);
        int size = 1024 * 1024 * 10;


        try {
            //enctype이 Multipart면 모든 파라미터를 MultipartRequest로 받아야 함
            MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

            String type = null;
            switch (multi.getParameter("list_type")) {
                case "1":
                    type = "자유";
                    break;
                case "2":
                    type = "찬반";
                    break;
            }

            String category = null;
            switch (multi.getParameter("list_category")) {
                case "1":
                    category = "사회";
                    break;
                case "2":
                    category = "건강";
                    break;
                case "3":
                    category = "연애";
                    break;
                case "4":
                    category = "학업";
                    break;
                case "5":
                    category = "직장";
                    break;
            }

            String title = multi.getParameter("list_title");
            String contents = multi.getParameter("list_contents");
            String id = multi.getParameter("list_id");
            //파일 업로드
            String upload = multi.getFilesystemName("list_upload");
            String origin_upload = multi.getOriginalFileName("list_upload");
            System.out.println(origin_upload);
            System.out.println(type);

            //자유토론
            if (type.equals("자유")) {
                ListBean beanFree = new ListBean();
                beanFree.setType(type);
                beanFree.setCategory(category);
                beanFree.setTitle(title);
                beanFree.setContent(contents);
                beanFree.setId(id);
                beanFree.setUpload(upload);

                if (lDAO.insertPost_free(beanFree) > 0) {
                    //나중에 로깅 처리 할부분
                    System.out.println("LIST FREE INSERT : SUCCESS");
                } else {
                    System.out.println("LIST FREE INSERT : FAIL");
                }

            } else if (type.equals("찬반")) {
                ListBean beanYesno = new ListBean();
                beanYesno.setType(type);
                beanYesno.setCategory(category);
                beanYesno.setTitle(title);
                beanYesno.setId(id);

                if (lDAO.insertPost_yn(beanYesno) > 0) {
                    //나중에 로깅 처리 할부분
                    System.out.println("LIST YN INSERT : SUCCESS");
                } else {
                    System.out.println("LIST YN INSERT : FAIL");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("listView.jsp");
    }
}
