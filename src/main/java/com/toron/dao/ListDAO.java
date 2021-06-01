package com.toron.dao;

import com.toron.dto.ListBean;
import com.toron.dto.ListSum_id;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

public class ListDAO extends DAO {

    //Constuctor
    private ListDAO() {

    }

    //SingleTon
    private static ListDAO instance = null;

    public static ListDAO getInstance() {
        if (instance == null) {
            instance = new ListDAO();
        }
        return new ListDAO();
    }

    // 자유토론 작성글 insert
    public int insertPost_free(ListBean listBean) {
        try {
            String query = "insert into tbllist_free (no,type,category,title,content,id,upload) values (seqlist.nextval,?,?,?,?,?,?)";
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, listBean.getType());
            pstmt.setString(2, listBean.getCategory());
            pstmt.setString(3, listBean.getTitle());
            pstmt.setString(4, listBean.getContent());
            pstmt.setString(5, listBean.getId());
            pstmt.setString(6, listBean.getUpload());
            result = pstmt.executeUpdate();
            System.out.println("자유글 삽입 완료");

        } catch (SQLException e) {
            System.out.println("insertPost_free : FAIL - " + e.getMessage());
        } finally {
            closeConnection(conn, pstmt);
        }

        return result;
    }

    // 찬반토론 작성글 insert
    public int insertPost_yn(ListBean listBean) {
        try {
            String query = "insert into tbllist_yesno (no,type,category,title,id,upload) values (seqlist.nextval,?,?,?,?,?)";
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, listBean.getType());
            pstmt.setString(2, listBean.getCategory());
            pstmt.setString(3, listBean.getTitle());
            pstmt.setString(4, listBean.getId());
            pstmt.setString(5, listBean.getUpload());
            result = pstmt.executeUpdate();
            System.out.println("찬반글 삽입 완료");

        } catch (SQLException e) {
            System.out.println("insertPost_yn : FAIL - " + e.getMessage());
        } finally {
            closeConnection(conn, pstmt);
        }

        return result;
    }

    //작성글 select - 전체
    public ArrayList<ListBean> selectListAll() {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        String query = "SELECT NO,TYPE,title,ID,W_DATE,hit FROM TBLLIST_FREE\n" +
                "UNION \n" +
                "SELECT NO,TYPE,title,ID,W_DATE,hit FROM TBLLIST_YESNO";

        ArrayList<ListBean> m_list = new ArrayList<ListBean>();

        try {
            conn = getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ListBean m_list_one = new ListBean();
                m_list_one.setNo(rs.getInt("no"));
                m_list_one.setType(rs.getString("type"));
                m_list_one.setTitle(rs.getString("title"));
                m_list_one.setId(rs.getString("id"));
                m_list_one.setW_date(rs.getString("w_date"));
                m_list_one.setHit(rs.getInt("hit"));
                m_list.add(m_list_one);
            }
        } catch (SQLException e) {
            System.err.println("selectListAll SQL ERR: " + e.getMessage());

        } finally {
            closeConnection(conn, pstmt, rs);
        }

        return m_list;
    }

    //작성글 select - 토론종류 별
    public ArrayList<ListBean> selectListByType(String type) {
        conn = null;
        pstmt = null;
        rs = null;
        String query = "SELECT NO,TYPE,title,ID,W_DATE,hit FROM TBLLIST_FREE WHERE type=?\n" +
                "UNION \n" +
                "SELECT NO,TYPE,title,ID,W_DATE,hit FROM TBLLIST_YESNO WHERE type=?";
        ArrayList<ListBean> c_list = new ArrayList<ListBean>();

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, type);
            pstmt.setString(2, type);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                ListBean c_list_one = new ListBean();

                c_list_one.setNo(rs.getInt("no"));
                c_list_one.setType(rs.getString("type"));
                c_list_one.setTitle(rs.getString("title"));
                c_list_one.setId(rs.getString("id"));
                c_list_one.setW_date(rs.getString("w_date"));
                c_list_one.setHit(rs.getInt("hit"));
                c_list.add(c_list_one);
            }
        } catch (SQLException e) {
            System.err.println("selectListByType SQL ERR: " + e.getMessage());

        } finally {
            closeConnection(conn, pstmt, rs);
        }

        return c_list;
    }

    //작성글 select - 카테고리 별
    public ArrayList<ListBean> selectListByCat(String cat) {
        conn = null;
        pstmt = null;
        rs = null;
        String query = "SELECT NO,TYPE,title,ID,W_DATE,hit FROM TBLLIST_FREE WHERE category=?\n" +
                "UNION \n" +
                "SELECT NO,TYPE,title,ID,W_DATE,hit FROM TBLLIST_YESNO WHERE category=?";
        ArrayList<ListBean> c_list = new ArrayList<ListBean>();

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, cat);
            pstmt.setString(2, cat);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                ListBean c_list_one = new ListBean();

                c_list_one.setNo(rs.getInt("no"));
                c_list_one.setType(rs.getString("type"));
                c_list_one.setTitle(rs.getString("title"));
                c_list_one.setId(rs.getString("id"));
                c_list_one.setW_date(rs.getString("w_date"));
                c_list_one.setHit(rs.getInt("hit"));
                c_list.add(c_list_one);
            }
        } catch (SQLException e) {
            System.err.println("selectListByCat SQL ERR: " + e.getMessage());

        } finally {
            closeConnection(conn, pstmt, rs);
        }

        return c_list;
    }

    //작성글 select - 제목 (찬반토론)
    public ListBean selectListByNo_free(int no) {
        conn = null;
        pstmt = null;
        rs = null;
        String query = "SELECT * FROM TBLLIST_FREE WHERE no=?";
        ListBean t_list_one = new ListBean();

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            rs.next();

            t_list_one.setNo(rs.getInt("no"));
            t_list_one.setType(rs.getString("type"));
            t_list_one.setCategory(rs.getString("category"));
            t_list_one.setTitle(rs.getString("title"));
            t_list_one.setContent(rs.getString("content"));
            t_list_one.setId(rs.getString("id"));
            t_list_one.setW_date(rs.getString("w_date"));
            t_list_one.setHit(rs.getInt("hit"));
            t_list_one.setGood(rs.getInt("good"));

        } catch (SQLException e) {
            System.err.println("selectListByTitle_free SQL ERR: " + e.getMessage());

        } finally {
            closeConnection(conn, pstmt, rs);
        }

        return t_list_one;
    }

    //작성글 select - 제목 (찬반토론)
    public ListBean selectListByNo_yesno(int no) {
        conn = null;
        pstmt = null;
        rs = null;
        String query = "SELECT * FROM TBLLIST_YESNO WHERE no=?";
        ListBean t_list_one = new ListBean();

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            rs.next();
            t_list_one.setNo(rs.getInt("no"));
            t_list_one.setType(rs.getString("type"));
            t_list_one.setCategory(rs.getString("category"));
            t_list_one.setTitle(rs.getString("title"));
            t_list_one.setId(rs.getString("id"));
            t_list_one.setW_date(rs.getString("w_date"));
            t_list_one.setHit(rs.getInt("hit"));
            t_list_one.setGood(rs.getInt("good"));

        } catch (SQLException e) {
            System.err.println("selectListByTitle_yesno SQL ERR: " + e.getMessage());

        } finally {
            closeConnection(conn, pstmt, rs);
        }

        return t_list_one;
    }

    //돌핀
    public ArrayList<ListBean> member_myList(String id) {
        String query="select * from tbllist_free where id=?";

        Connection conn=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        ArrayList<ListBean> m_list=new ArrayList<ListBean>();

        try {
            conn=getConnection();
            pstmt=conn.prepareStatement(query);
            pstmt.setString(1, id);
            rs=pstmt.executeQuery();

            while (rs.next()) {
                ListBean m_list_one=new ListBean();
                m_list_one.setNo(rs.getInt("no"));
                m_list_one.setType(rs.getString("type"));
                m_list_one.setCategory(rs.getString("category"));
                m_list_one.setTitle(rs.getString("title"));
                m_list_one.setContent(rs.getString("content"));
                m_list_one.setId(rs.getString("id"));
                m_list_one.setW_date(rs.getString("w_date"));
                m_list_one.setHit(rs.getInt("hit"));
                m_list_one.setUpload(rs.getString("upload"));
                m_list_one.setGood(rs.getInt("good"));
                m_list.add(m_list_one);

            }

        }catch(SQLException e) {
            System.err.println("member_myList SQL ERR: "+e.getMessage());

        }finally {
            try {
                if(rs!=null) {
                    rs.close();
                }
                if(pstmt!=null) {
                    pstmt.close();
                }
                if(conn!=null) {
                    conn.close();
                }
            }catch(SQLException e) {
                System.err.println("member_myList CLOSE ERR: "+e.getMessage());
            }
        }

        return m_list;
    }
    
    /**조회수 증가 메소드 (Free ver.)**/
    public void updateHit_free(int no) {
		String sql = "update tbllist_free set hit=hit+1 where no=?";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);

			pstmt.executeUpdate();
		} catch (Exception e) {
			System.err.println("ListDAO - updateHit_free ERR: " + e.getMessage());
		} finally {
			closeConnection(conn, pstmt);
		}

	}
    
    /**조회수 증가 메소드 (yesno ver.)**/
    public void updateHit_yserno(int no) {
    	String sql = "update tbllist_yesno set hit=hit+1 where no=?";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);

			pstmt.executeUpdate();
		} catch (Exception e) {
			System.err.println("ListDAO - updateHit_yserno ERR: " + e.getMessage());
		} finally {
			closeConnection(conn, pstmt);
		}

    }
    
    /****utill/best.jsp에서 사용하는 인기글(조회수 기준) 메소드****/
    public ArrayList<ListBean> selectListByHit(){
    	Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        String query ="select no, type, category, title, id, hit from tbllist_free \n" + 
        		"union \n" + 
        		"select no, type, category, title, id, hit from tbllist_yesno \n" + 
        		"order by hit desc";
        
        ArrayList<ListBean> best_list = new ArrayList<ListBean>();

        try {
            conn = getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ListBean b_list_one = new ListBean();
                b_list_one.setNo(rs.getInt("no"));
                b_list_one.setType(rs.getString("type"));
                b_list_one.setCategory(rs.getString("category"));
                b_list_one.setTitle(rs.getString("title"));
                b_list_one.setId(rs.getString("id"));
                b_list_one.setHit(rs.getInt("hit"));
                
                best_list.add(b_list_one);
            }
        } catch (SQLException e) {
            System.err.println("ListDAO - selectListByHit SQL ERR: " + e.getMessage());

        } finally {
            closeConnection(conn, pstmt, rs);
        }

        return best_list;
    }
    
    /**newestList.jsp에서 사용하는 최신글 메소드**/
    public ArrayList<ListBean> selectList_newest() {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        String query = "SELECT NO,TYPE,category,title,ID,W_DATE,hit FROM TBLLIST_FREE \n" + 
        		"UNION \n" + 
        		"SELECT NO,TYPE,category,title,ID,W_DATE,hit FROM TBLLIST_YESNO \n" + 
        		"order by w_date desc";

        ArrayList<ListBean> newest_list = new ArrayList<ListBean>();

        try {
            conn = getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ListBean n_list_one = new ListBean();
                n_list_one.setNo(rs.getInt("no"));
                n_list_one.setType(rs.getString("type"));
                n_list_one.setCategory(rs.getString("category"));
                n_list_one.setTitle(rs.getString("title"));
                n_list_one.setId(rs.getString("id"));
                n_list_one.setW_date(rs.getString("w_date"));
                n_list_one.setHit(rs.getInt("hit"));
                
                newest_list.add(n_list_one);
            }
        } catch (SQLException e) {
            System.err.println("ListDAO - selectList_newest SQL ERR: " + e.getMessage());

        } finally {
            closeConnection(conn, pstmt, rs);
        }

        return newest_list;
    }
    
    /**utill/hotKeyword.jsp에서 사용하는 토론왕(글 작성 개수 기준) 메소드**/
    public ArrayList<ListSum_id> bestUser(){
    	 Connection conn = null;
         Statement stmt = null;
         ResultSet rs = null;
         String query ="select id, count(id) as list_sum \n" + 
         		"from tbllist_free \n" + 
         		"group by id \n" + 
         		"union \n" + 
         		"select id, count(id) as list_sum \n" + 
         		"from tbllist_yesno \n" + 
         		"group by id";
        		 
         ArrayList<ListSum_id> m_list = new ArrayList<ListSum_id>();
    	
    	try {
            conn = getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
            	ListSum_id n_list_one = new ListSum_id();
                 n_list_one.setId(rs.getString("id"));
                 n_list_one.setListSum(rs.getInt("list_sum"));
                 
                 m_list.add(n_list_one);
            }
            
        } catch (SQLException e) {
            System.err.println("ListDAO - bestUser ERR: " + e.getMessage());

        } finally {
            closeConnection(conn, pstmt, rs);
        }

        return m_list;
    }
}
