package com.kh.pj.board.model.dao;


import static com.kh.pj.common.JDBCTemplet.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.pj.board.model.vo.Attachment;
import com.kh.pj.board.model.vo.Board;
import com.kh.pj.member.model.dao.MemberDao;

public class BoardDao {
	private Properties prop = new Properties();

	public BoardDao(){
		String fileName = MemberDao.class.getResource("/sql/board/board-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
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
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	public int insertBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("inserBoard");
		
		try {
			pstmt= con.prepareStatement(query);
			pstmt.setString(1, b.getbTitle());
			pstmt.setString(2, b.getbText());
			pstmt.setInt(3, b.getmNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int insertAttachment(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachment");
		
		try {
			for(int i = 0; i< fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, fileList.get(i).getbId());
				pstmt.setString(2, fileList.get(i).getOriginName());
				pstmt.setString(3, fileList.get(i).getChangeName());
				pstmt.setString(4, fileList.get(i).getFilePath());
				
				int level = 0;
				if(i == 0) level = 0;
				else level =1;
					
				pstmt.setInt(5, level);
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int selectCurrval(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		int bid = 0;
		
		String query = prop.getProperty("selectCurrval");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				bid = rset.getInt("currval");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return bid;
	}
	
	public ArrayList<HashMap<String, Object>> selectList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String,Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectThumbnailMap");
		
		int startRow = (currentPage -1) * limit + 1;
		int endRow = startRow + limit -1;

		try {
			pstmt  = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
		
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String,Object>();
				
				hmap.put("b_id", rset.getInt("b_id"));
				hmap.put("b_no", rset.getInt("b_no"));
				hmap.put("b_title",rset.getString("b_title"));
				hmap.put("b_text",rset.getString("b_text"));
				hmap.put("nickname",rset.getString("nickname"));
				hmap.put("view_count",rset.getInt("view_count"));
				hmap.put("b_date",rset.getDate("b_date"));
				hmap.put("f_no", rset.getInt("f_no"));
				hmap.put("origin_name", rset.getString("origin_name"));
				hmap.put("change_name", rset.getString("change_name"));
				hmap.put("file_path", rset.getString("file_path"));
				hmap.put("upload_date", rset.getString("upload_date"));
				
				list.add(hmap);
			}
			System.out.println(list);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int updateCount(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
		
			result = pstmt.executeUpdate();
			
			System.out.println(result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public HashMap<String, Object> selectOneBoard1(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		Board b = null;
		Attachment at = null;
		ArrayList<Attachment> list = null;
		
		String query = prop.getProperty("selectOneBoard1");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Attachment>();
			
			while(rset.next()) {
				b = new Board();
				b.setbId(rset.getInt("b_id"));
				b.setbTitle(rset.getString("b_title"));
				b.setbDate(rset.getDate("b_date"));
				b.setbText(rset.getString("b_text"));
				b.setbWriter(rset.getString("nickname"));
				b.setmNo(rset.getInt("member_no"));
				b.setbCategory(rset.getString("board_category"));
				b.setvCount(rset.getInt("view_count"));
				b.setpNo(rset.getInt("p_no"));
				b.setAdopt(rset.getString("adopt_yn"));
				b.setbNo(rset.getInt("b_no"));
				b.setRecCount(rset.getInt("rec_count"));
				b.setRefLevel(rset.getInt("ref_level"));
				b.setbPassword(rset.getString("b_password"));
				
				at = new Attachment();
				at.setfNo(rset.getInt("f_no"));
				at.setOriginName(rset.getString("origin_name"));
				at.setChangeName(rset.getString("change_name"));
				at.setFilePath(rset.getString("file_path"));
				at.setUploadDate(rset.getDate("upload_date"));
				
				list.add(at);
			}
			
			hmap = new HashMap<String,Object>();
			hmap.put("board", b);
			hmap.put("attachment", list);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return hmap;
	}

	public int updateBoard(Connection con, Board b) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateBoard");
		
		try {
			pstmt= con.prepareStatement(query);
			pstmt.setString(1, b.getbTitle());
			pstmt.setString(2, b.getbText());
			pstmt.setInt(3, b.getbNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}


	public int updateAttachment(Connection con, Board b, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateAttachment");
		
		try {
			for(int i = 0; i< fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getFilePath());
				pstmt.setInt(4, b.getbNo());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}


	public int deleteBoard(Connection con, int bno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
}
