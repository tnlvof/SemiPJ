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
				loginUser.setMemberNo(rset.getInt("member_No"));
				loginUser.setMemberId(rset.getString("member_Id"));
				loginUser.setMemberPwd(rset.getString("member_Pwd"));
				loginUser.setMemberName(rset.getString("member_Name"));
				loginUser.setBirth(rset.getString("birthday"));
				loginUser.setPhone(rset.getString("phone"));
				loginUser.setEmail(rset.getString("email"));
				loginUser.setAddress(rset.getString("address"));
				loginUser.setNickName(rset.getString("nickname"));
				/*loginUser.setInterest(rset.getString("interest"));
				loginUser.setEnrollDate(rset.getDate("enroll_date"));
				loginUser.setModifyDate(rset.getDate("modify_date"));*/
				loginUser.setStatus(rset.getString("status"));
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
	public int updateMember(Connection con, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getMemberName());
			pstmt.setString(2, m.getBirth());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getAddress());
			pstmt.setString(5, m.getNickName());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getMemberId());
			
			result = pstmt.executeUpdate();
			
			System.out.println("MemberDao updateMember : " + result);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}
	public int delectMember(Connection con, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("delectMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getMemberId());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		return result;
	}
	public int idCheck(Connection con, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("idCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				result = rset.getInt(1);
			}
			
			System.out.println("MemberDao : " + result);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return result;
	}
	public int changePassword(Connection con, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("changePassword");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getMemberPwd());
			pstmt.setInt(2, m.getMemberNo());
			
			result = pstmt.executeUpdate();
			
			System.out.println("MemberDao changePassword : " + result);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}
	public int checkPassword(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("checkPassword");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, m.getMemberNo());
			pstmt.setString(2, m.getMemberPwd());
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return result;
	}
	public int searchingId(Connection con, Member m) {
			
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = 0;
		
		String query = prop.getProperty("searchingId");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getMemberName());
			pstmt.setString(2, m.getBirth());
			rset= pstmt.executeQuery();
			
			
			System.out.println(m);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		
		return result;
	}
	public int searchingPwd(Connection con, Member m) {


		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String query = prop.getProperty("searchingPwd");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getBirth());
			rset= pstmt.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		
		return 0;	
		}
}
