package com.toron.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;


import com.toron.dto.MemberBean;
import com.toron.dto.ZipcodeBean;

public class MemberDAO extends DAO {

    private MemberDAO() {
    }

    private static MemberDAO instance = null;

    public static MemberDAO getInstance(){
        if(instance == null){
            instance = new MemberDAO();
        }
        return new MemberDAO();
    }

    public MemberBean select_member_one(String id) {
    	MemberBean member=null;
    	String query="select * from tblmember where id=?";
    	
    	Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				member=new MemberBean();
				member.setId(rs.getString("id"));
				member.setPwd(rs.getString("pwd"));
				member.setName(rs.getString("name"));
				member.setNick(rs.getString("nick"));
				member.setPhone(rs.getString("phone"));
				member.setEmail(rs.getString("email"));
				member.setAddress(rs.getString("address"));
				member.setZipcode(rs.getString("zipcode"));
								//010100
				String interest=rs.getString("interest");
				String interests[]=new String[6];
				for(int i=0; i<interests.length;i++) {
					interests[i]=interest.substring(i,i+1);
				}
				member.setInterest(interests);
				
				member.setPhoto(rs.getString("photo"));
				member.setM_date(rs.getString("m_date"));
				member.setIsAdmin(rs.getString("isAdmin"));
			}
			
		}catch(SQLException e) {
			System.err.println("select_member_one SQL ERR: "+e.getMessage());
		
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
				System.err.println("select_member_one CLOSE ERR: "+e.getMessage());
			}
		}
		
    	return member;
    }
    
    
    public MemberBean update_member_one(MemberBean member) {
  
    	Connection conn=null;
		PreparedStatement pstmt=null;
		String query=null;
		boolean flag = false;
		
		try {
			conn=getConnection();
			query="update tblmember set nick=?, phone=?, pwd=?, email=?, zipcode=?, address=?, interest=? where id=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, member.getNick());
			pstmt.setString(2, member.getPhone());
			pstmt.setString(3, member.getPwd());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getZipcode());
			pstmt.setString(6, member.getAddress());
			
			//사회, 건강, 연애, 학업, 직장, 기타
			String interests[]=member.getInterest();
			
			char list_num[]= {'0','0','0','0','0','0'};
			String list_str[]= {"사회", "건강", "연애", "학업", "직장", "기타"};
			if(interests != null) {
				for(int i=0; i<interests.length; i++) {
					for(int j=0; j<list_str.length; j++) {
						if(interests[i].equals(list_str[j])) {
							list_num[j]='1';
							break;
						}
					}
				}
			}
			pstmt.setString(7, new String(list_num));
			
			pstmt.setString(8, member.getId());
			
			if(pstmt.executeUpdate() == 1) {
				flag=true;
				System.out.println("회원수정성공");
			}
			
		}catch(SQLException e) {
			System.err.println("update_member_one SQL ERR: "+e.getMessage());
		
		}finally {
			try {
				if(pstmt!=null) {
					pstmt.close();
				}
				if(conn!=null) {
					conn.close();
				}
			}catch(SQLException e) {
				System.err.println("update_member_one CLOSE ERR: "+e.getMessage());
			}
		}
		
    	return member;
    }

    /**회원가입(멤버 인서트)**/
    public MemberBean insert_member_one(MemberBean member) {
    	Connection conn=null;
		PreparedStatement pstmt=null;
		String query=null;
		boolean flag = false;
		
		try {
			conn=getConnection();
			query="insert into tblmember (id, pwd, name, nick, phone, email, address, zipcode, interest, photo) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getName());
			
			pstmt.setString(4, member.getNick());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getAddress());
			pstmt.setString(8, member.getZipcode());
			
			//관심분야
			//사회, 건강, 연애, 학업, 직장, 기타
			String interests[]=member.getInterest();
			
			char list_num[]= {'0','0','0','0','0','0'};
			String list_str[]= {"사회", "건강", "연애", "학업", "직장", "기타"};
			if(interests != null) {
				for(int i=0; i<interests.length; i++) {
					for(int j=0; j<list_str.length; j++) {
						if(interests[i].equals(list_str[j])) {
							list_num[j]='1';
							break;
						}
					}
				}
			}
			pstmt.setString(9, new String(list_num));
			
			pstmt.setString(10, member.getPhoto());
			
			if(pstmt.executeUpdate() == 1) {
				flag=true;
				System.out.println("회원 집어넣기 성공!!ㅜㅜ");
			}
			
		}catch(SQLException e) {
			System.err.println("insert_member_one SQL ERR: "+e.getMessage());
		
		}finally {
			try {
				if(pstmt!=null) {
					pstmt.close();
				}
				if(conn!=null) {
					conn.close();
				}
			}catch(SQLException e) {
				System.err.println("insert_member_one CLOSE ERR: "+e.getMessage());
			}
		}
		
    	return member;
    }
    
    
    /**아이디 중복확인 메소드**/
    public boolean checkId(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		boolean flag  = false;
		
		try {
			conn = getConnection();
			sql = "select id from tblmember where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();	//sql문 실행
			flag = rs.next();			//true이면 중복, false 중복아님
			
		} catch (SQLException e) {
			System.err.println("MemberDAO - CheckId ERR :"+e.getMessage());
		} finally {
			closeConnection(conn, pstmt, rs);
		}
		return flag;
	}	//ID 중복확인 END
    
    /** 로그인 확인 메소드**/
	public int loginMember(String id, String pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int mode = 0;
		//0: 아이디 존재X / 1: 비밀번호 틀림 / 2: 로그인 성공
		
		try {
			if (checkId(id)==false) {   
				return mode; //아이디 자체가 없음 -> mode값 0 반환 (입구컷)
			}
			conn = getConnection();
			sql = "select id, pwd from tblmember where id = ? and pwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			rs = pstmt.executeQuery();
			if (rs.next())
				mode = 2;    // id와 pwd 확인 성공 -> mode값 2 반환 (통과)
			else
				mode = 1;	// id는 있는데 비밀번호가 틀림 -> mode값 1 반환 (비번 다시 입력해라)
		} catch (Exception e) {
			System.err.println("MemberDAO - loginMember ERR: "+e.getMessage());
		} finally {
			closeConnection(conn, pstmt, rs);
		}
		return mode;
	}
    
	/**우편번호 검색 메소드**/
	public  ArrayList<ZipcodeBean> zipcodeRead(String area3) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<ZipcodeBean> zipList = new ArrayList<ZipcodeBean>();
		
		try {
			con = getConnection();
			sql = "select * from zipcode_tbl where area3 like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+area3+"%");//'%강남대로%'
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ZipcodeBean bean = new ZipcodeBean();
				bean.setZipcode(rs.getString(1));
				bean.setArea1(rs.getString(2));
				bean.setArea2(rs.getString(3));
				bean.setArea3(rs.getString(4));
				zipList.add(bean);
			} 
		} catch (Exception e) {
			System.err.println("MemberDAO - zipcodeRead ERR: "+e.getMessage());
		} finally {
			closeConnection(con, pstmt, rs);
		}
		
		return zipList;
	} // 우편번호 검색 END
}
