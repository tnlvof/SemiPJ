package com.kh.pj.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.pj.member.model.vo.Member;
import static com.kh.pj.common.JDBCTemplet.*;
public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao(){
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int insertMember(Connection con, Member m){
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertMember");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPwd());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getBirth());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getAddress());
			pstmt.setString(7, m.getNickName());
			pstmt.setString(8, m.getEmail());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;		
	}
	public Member loginCheck(Connection con, String userId, String userPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser =null;
		
		String query = prop.getProperty("loginSelect");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				loginUser = new Member();
				loginUser.setMemberNo(rset.getInt("uno"));
				loginUser.setMemberId(rset.getString("user_id"));
				loginUser.setMemberPwd(rset.getString("user_pwd"));
				loginUser.setNickName(rset.getString("nick_name"));
				loginUser.setPhone(rset.getString("phone"));
				loginUser.setEmail(rset.getString("email"));
				loginUser.setAddress(rset.getString("address"));
				/*loginUser.setInterest(rset.getString("interest"));
				loginUser.setEnrollDate(rset.getDate("enroll_date"));
				loginUser.setModifyDate(rset.getDate("modify_date"));
				loginUser.setStatus(rset.getString("status"));*/
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return loginUser;
	}
}
