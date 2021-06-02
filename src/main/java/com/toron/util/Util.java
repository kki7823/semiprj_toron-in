package com.toron.util;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;

public class Util {
    public static void listFileUploader(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String path = request.getSession().getServletContext().getRealPath("images/list_image");
        int size = 1024 * 1024 * 10;
        String file = "";
        String originalFile = "";

        try {
            MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

            Enumeration files = multi.getFileNames();
            String str = (String)files.nextElement();

            file = multi.getFilesystemName(str);
            originalFile = multi.getOriginalFileName(str);

        }catch (Exception e){
            System.out.println("listFileUploader err : "+e.getMessage());
        }

    }

}
