package com.toron.dao;

import com.toron.dto.CommentBeanFree;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommentDAO extends DAO{

    private CommentDAO() {
    }

    private static CommentDAO instance = null;

    public static CommentDAO getInstance() {
        if (instance == null) {
            instance = new CommentDAO();
        }
        return new CommentDAO();
    }

    //insert - 댓글 입력 (자유)
    public int insertComment_free(int no, String id, String comment) {
        try {
            String query = "insert into tblcomment_free (no,commentno,id,comments) values (?,seqcomment_free.nextval,?,?)";
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, no);
            pstmt.setString(2, id);
            pstmt.setString(3, comment);
            result = pstmt.executeUpdate();
            System.out.println("댓글 삽입 완료 _ 찬반"); // 추후 로그처리

        } catch (SQLException e) {
            System.out.println("insertComment_free : FAIL - " + e.getMessage());
        } finally {
            closeConnection(conn, pstmt);
        }

        return result;
    }
    //insert - 댓글 입력 (자유)
    public int insertComment_yesno(int no, String id, String comment,String yesno) {
        try {
            String query = "insert into tblcomment_yesno (no,commentno,id,comments,yesno) values (?,seqcomment_free.nextval,?,?,?)";
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, no);
            pstmt.setString(2, id);
            pstmt.setString(3, comment);
            pstmt.setString(4, yesno);
            result = pstmt.executeUpdate();
            System.out.println("댓글 삽입 완료 _ 찬반"); // 추후 로그처리

        } catch (SQLException e) {
            System.out.println("insertComment_free : FAIL - " + e.getMessage());
        } finally {
            closeConnection(conn, pstmt);
        }

        return result;
    }

    //댓글 select - 글번호 (찬반토론)
    public ArrayList<CommentBeanFree> selectCommentFree(int no) {
        conn = null;
        pstmt = null;
        rs = null;
        String query = "SELECT * FROM TBLCOMMENT_FREE WHERE no=?";
        ArrayList<CommentBeanFree> comm_list = new ArrayList<CommentBeanFree>();

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                CommentBeanFree commBean = new CommentBeanFree();

                commBean.setNo(rs.getInt("no"));
                commBean.setCommnetNo(rs.getInt("commentno"));
                commBean.setId(rs.getString("id"));
                commBean.setComment(rs.getString("comments"));
                commBean.setC_date(rs.getString("c_date"));
                comm_list.add(commBean);
            }
        } catch (SQLException e) {
            System.err.println("selectCommentFree SQL ERR: " + e.getMessage());

        } finally {
            closeConnection(conn, pstmt, rs);
        }

        return comm_list;
    }

    //댓글 delete - 댓글번호로
    public int deleteCommentFree(int commentNo) {
        conn = null;
        pstmt = null;
        rs = null;
        String query = "delete tblcomment_free WHERE commentno=?";
        int result = 0;

        HttpServletResponse response = null;
        PrintWriter out = null;

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, commentNo);
            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            System.err.println("selectCommentFree SQL ERR: " + e.getMessage());
        }finally {
            closeConnection(conn, pstmt, rs);
        }

        return result;
    }

    public int updateComment_free(int commentno, String comments) {
        try {
            String query = "UPDATE TBLCOMMENT_FREE SET COMMENTS=? WHERE COMMENTNO = ?";
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, comments);
            pstmt.setInt(2, commentno);
            result = pstmt.executeUpdate();
            System.out.println("댓글 수정 완료 _ 찬반"); // 추후 로그처리

        } catch (SQLException e) {
            System.out.println("updateComment_free : FAIL - " + e.getMessage());
        } finally {
            closeConnection(conn, pstmt);
        }

        return result;
    }


}
