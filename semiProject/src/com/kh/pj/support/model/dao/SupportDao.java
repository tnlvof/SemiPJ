package com.kh.pj.support.model.dao;

import static com.kh.pj.common.JDBCTemplet.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.pj.member.model.dao.MemberDao;
import com.kh.pj.support.model.vo.Support;

public class SupportDao {
	private Properties prop = new Properties();

	public SupportDao(){
		String fileName = MemberDao.class.getResource("/sql/support/support-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Support> selectList(Connection con, int currentPage, int limit, String boardCategory) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Support> list = null;

		String query = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			System.out.println("startRow " +startRow);
			System.out.println("endRow " + endRow);
			System.out.println("boardCategory " + boardCategory);
			
			pstmt.setString(1, boardCategory);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Support>();

			while(rset.next()){
				Support s = new Support();
				
				s.setbId(rset.getInt("b_id"));
				s.setbTitle(rset.getString("b_title"));
				s.setbDate(rset.getDate("b_date"));
				s.setbText(rset.getString("b_text"));
				s.setbWriter(rset.getString("nickname"));
				s.setmNo(rset.getInt("member_no"));
				s.setbCategory(rset.getString("board_category"));
				s.setvCount(rset.getInt("view_count"));
				s.setpNo(rset.getInt("p_no"));
				s.setAdopt(rset.getString("adopt_yn"));
				s.setbNo(rset.getInt("b_no"));
				s.setRecCount(rset.getInt("rec_count"));
				s.setRefLevel(rset.getInt("ref_level"));
				s.setbPassword(rset.getString("b_password"));
				
				list.add(s);
				
			}
			System.out.println("dao " + list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int insertNotice(Connection con, Support s, String boardCategory) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = null;
		
		if(boardCategory.equals("6")){			
			query = prop.getProperty("insertNotice");
		} else if(boardCategory.equals("7")){
			query = prop.getProperty("insertQna");
		} else if(boardCategory.equals("8")){
			query = prop.getProperty("insertFaq");
		} 
		
		System.out.println("query : " + query);
		
		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, s.getbTitle());
			pstmt.setString(2, s.getbText());
			pstmt.setInt(3, Integer.parseInt(s.getbWriter()));
			pstmt.setString(4, boardCategory);
			pstmt.setString(5, s.getbPassword());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}

		return result;
	}

	public int getListCount(Connection con, String boardCategory) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("listCount");

		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, boardCategory);
			rset = pstmt.executeQuery();

			if(rset.next()){
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		

		return listCount;
	}

	public int updateCount(Connection con, int num, String boardCategory) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateCount");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, boardCategory);
			pstmt.setInt(2, num);
			pstmt.setString(3, boardCategory);
			pstmt.setInt(4, num);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}

		return result;
	}

	public Support selectOne(Connection con, int num, String boardCategory) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Support s = null;

		String query = prop.getProperty("selectOne");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, boardCategory);
			pstmt.setInt(2, num);

			rset = pstmt.executeQuery();

			if(rset.next()){
				s = new Support();
				
				s.setbId(rset.getInt("b_id"));
				s.setbTitle(rset.getString("b_title"));
				s.setbDate(rset.getDate("b_date"));
				s.setbText(rset.getString("b_text"));
				s.setbWriter(rset.getString("nickname"));
				s.setmNo(rset.getInt("member_no"));
				s.setbCategory(rset.getString("board_category"));
				s.setvCount(rset.getInt("view_count"));
				s.setpNo(rset.getInt("p_no"));
				s.setAdopt(rset.getString("adopt_yn"));
				s.setbNo(rset.getInt("b_no"));
				s.setRecCount(rset.getInt("rec_count"));
				s.setRefLevel(rset.getInt("ref_level"));
				s.setbPassword(rset.getString("b_password"));
			}

			System.out.println("dao s : " + s);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}

		return s;
	}

	public int updateNotice(Connection con, Support s, String boardCategory) {
	   PreparedStatement pstmt = null;
	   int result = 0;
	   
	   String query = prop.getProperty("updateSupport");
	   
	   try {
		pstmt = con.prepareStatement(query);
		pstmt.setString(1, s.getbTitle());
		pstmt.setString(2, s.getbText());
		pstmt.setString(3, boardCategory);
		pstmt.setInt(4, s.getbNo());
		
		result = pstmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally{
		close(pstmt);
	}
	   
	   
	   return result;
   }



public int deleteNotice(Connection con, int bno, String boardCategory) {
	PreparedStatement pstmt = null;
	int result = 0;
	
	String query = prop.getProperty("deleteSupport");
	
	try {
		pstmt = con.prepareStatement(query);
		pstmt.setString(1, boardCategory);
		pstmt.setInt(2, bno);
		
		result = pstmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally{
		close(pstmt);
	}
	
	
	return result;
}

}
