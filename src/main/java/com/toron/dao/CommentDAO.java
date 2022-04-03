package com.toron.dao;

import com.toron.dto.CommentBeanFree;
import com.toron.dto.CommentBeanProfile;
import com.toron.dto.CommentBeanYesno;
import com.toron.dto.CommentNavBean;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommentDAO extends DAO {

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

    //insert - 댓글 입력 (찬반)
    public int insertComment_yesno(int no, String id, String comment, String yesno) {
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
            System.out.println("insertComment_yesno : FAIL - " + e.getMessage());
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

    //댓글 select - id (찬반토론)
    public ArrayList<CommentBeanProfile> selectCommentId(String id) {
        conn = null;
        pstmt = null;
        rs = null;
        String query = "SELECT no,comments FROM TBLCOMMENT_FREE WHERE id=? \n" +
                        "UNION \n" +
                        "SELECT no,comments FROM TBLCOMMENT_YESNO WHERE id=? \n";

        ArrayList<CommentBeanProfile> comm_list = new ArrayList<CommentBeanProfile>();

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            pstmt.setString(2, id);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                CommentBeanProfile commBean = new CommentBeanProfile();

                commBean.setNo(rs.getInt("no"));
                commBean.setComment(rs.getString("comments"));
                comm_list.add(commBean);
            }
        } catch (SQLException e) {
            System.err.println("selectCommentId SQL ERR: " + e.getMessage());

        } finally {
            closeConnection(conn, pstmt, rs);
        }

        return comm_list;
    }

    //댓글 select - 글번호 (찬반토론)
    public ArrayList<CommentBeanYesno> selectCommentYesno(int no) {
        conn = null;
        pstmt = null;
        rs = null;
        String query = "SELECT * FROM TBLCOMMENT_YESNO WHERE no=? ORDER BY c_date ASC";
        ArrayList<CommentBeanYesno> comm_list = new ArrayList<CommentBeanYesno>();

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                CommentBeanYesno commBean = new CommentBeanYesno();

                commBean.setNo(rs.getInt("no"));
                commBean.setCommnetNo(rs.getInt("commentno"));
                commBean.setId(rs.getString("id"));
                commBean.setComment(rs.getString("comments"));
                commBean.setC_date(rs.getString("c_date"));
                commBean.setYesno(rs.getString("yesno"));
                comm_list.add(commBean);
            }
        } catch (SQLException e) {
            System.err.println("selectCommentYesno SQL ERR: " + e.getMessage());

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
            System.err.println("deleteCommentFree SQL ERR: " + e.getMessage());
        } finally {
            closeConnection(conn, pstmt, rs);
        }

        return result;
    }

    //댓글 delete - 댓글번호로
    public int deleteCommentYn(int commentNo) {
        conn = null;
        pstmt = null;
        rs = null;
        String query = "delete tblcomment_yesno WHERE commentno=?";
        int result = 0;

        HttpServletResponse response = null;
        PrintWriter out = null;

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, commentNo);
            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            System.err.println("deleteCommentYn SQL ERR: " + e.getMessage());
        } finally {
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

    //댓글 select - 글번호 (찬반토론)
    public CommentNavBean selectCommentNav(int no) {
        conn = null;
        pstmt = null;
        rs = null;
        String query = "SELECT count(DISTINCT id) AS participant, \n" +
                "count(CASE when YESNO='yes' THEN 1 end) AS yes,\n" +
                "count(CASE when YESNO='no' THEN 1 end) AS no\n" +
                "FROM TBLCOMMENT_YESNO WHERE NO=?";
        CommentNavBean comm_nav = new CommentNavBean();

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            rs.next();
            comm_nav.setParicipant(rs.getInt("participant"));
            comm_nav.setYes(rs.getInt("yes"));
            comm_nav.setNo(rs.getInt("no"));

        } catch (SQLException e) {
            System.err.println("selectCommentYesno SQL ERR: " + e.getMessage());

        } finally {
            closeConnection(conn, pstmt, rs);
        }

        return comm_nav;
    }


}
