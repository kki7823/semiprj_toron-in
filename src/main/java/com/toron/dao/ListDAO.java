package com.toron.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.toron.dto.ListBeanFree;
import com.toron.dto.MemberBean;

public class ListDAO extends DAO {

    private ListDAO() {
    }

    private static ListDAO instance = null;

    public static ListDAO getInstance(){
        if(instance == null){
            instance = new ListDAO();
        }
        return new ListDAO();
    }

    public ArrayList<ListBeanFree> member_myList(String id) {
    	String query="select * from tbllist_free where id=?";
    	
    	Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<ListBeanFree> m_list=new ArrayList<ListBeanFree>();
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			while (rs.next()) {
				ListBeanFree m_list_one=new ListBeanFree();
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
}
