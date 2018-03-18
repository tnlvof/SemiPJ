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

	public BoardDao() {
		String fileName = MemberDao.class.getResource("/sql/board/board-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/*
	 * public ArrayList<Board> selectAll(Connection con, int currentPage, int
	 * limit) { PreparedStatement pstmt = null;
	 * 
	 * ResultSet rset = null; ArrayList<Board> list = null;
	 * 
	 * String query = prop.getProperty("selecAll");
	 * 
	 * try { pstmt = con.prepareStatement(query);
	 * 
	 * //議고쉶 �떆�옉�븷 �븷 踰덊샇�� 留덉�留� �뻾 踰덊샇 怨꾩궛 int startRow = (currentPage - 1) *
	 * limit + 1; int endRow = startRow + limit - 1;
	 * 
	 * //pstmt.setString(1, rset.getString("bCategory")); pstmt.setInt(1,
	 * startRow); pstmt.setInt(2, endRow);
	 * 
	 * rset = pstmt.executeQuery();
	 * 
	 * list = new ArrayList<Board>();
	 * 
	 * while(rset.next()){ Board b = new Board();
	 * 
	 * b.setbId(rset.getInt("bId"));
	 * 
	 * 
	 * list.add(b); } } catch (SQLException e) { e.printStackTrace(); } finally{
	 * close(rset); close(pstmt); }
	 * 
	 * return list; }
	 */

	public int getListCount(Connection con, String boardCategory) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("listCount");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, boardCategory);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	/*
	 * public Board selectOne(Connection con, int num) { PreparedStatement pstmt
	 * = null; ResultSet rset = null; Board b = null;
	 * 
	 * String query = prop.getProperty("selectOne");
	 * 
	 * try { pstmt = con.prepareStatement(query); pstmt.setInt(1, num);
	 * 
	 * rset = pstmt.executeQuery();
	 * 
	 * if(rset.next()){ b = new Board();
	 * 
	 * b.setbId(rset.getInt("bId")); }
	 * 
	 * System.out.println(b);
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); } finally{ close(pstmt);
	 * close(rset); }
	 * 
	 * return b; }
	 * 
	 * public int updateCount(Connection con, int num) { PreparedStatement pstmt
	 * = null; int result = 0;
	 * 
	 * String query = prop.getProperty("updateCount");
	 * 
	 * try { pstmt = con.prepareStatement(query); pstmt.setInt(1, num);
	 * pstmt.setInt(2, num);
	 * 
	 * result = pstmt.executeUpdate();
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); } finally{ close(pstmt);
	 * }
	 * 
	 * return result; }
	 */
	public int insertBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("inserBoard");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getbTitle());
			pstmt.setString(2, b.getbText());
			pstmt.setInt(3, b.getmNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertAttachment(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertAttachment");

		try {
			for (int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, fileList.get(i).getbId());
				pstmt.setString(2, fileList.get(i).getOriginName());
				pstmt.setString(3, fileList.get(i).getChangeName());
				pstmt.setString(4, fileList.get(i).getFilePath());

				int level = 0;
				if (i == 0)
					level = 0;
				else
					level = 1;

				pstmt.setInt(5, level);

				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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

			if (rset.next()) {
				bid = rset.getInt("currval");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return bid;
	}

	public ArrayList<HashMap<String, Object>> selectList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectThumbnailMap");

		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<HashMap<String, Object>>();

			while (rset.next()) {
				hmap = new HashMap<String, Object>();

				hmap.put("b_id", rset.getInt("b_id"));
				hmap.put("b_no", rset.getInt("b_no"));
				hmap.put("b_title", rset.getString("b_title"));
				hmap.put("b_text", rset.getString("b_text"));
				hmap.put("nickname", rset.getString("nickname"));
				hmap.put("view_count", rset.getInt("view_count"));
				hmap.put("b_date", rset.getDate("b_date"));
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
		} finally {
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
		} finally {
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

			while (rset.next()) {
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

			hmap = new HashMap<String, Object>();
			hmap.put("board", b);
			hmap.put("attachment", list);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return hmap;
	}

	public ArrayList<Board> boardSelctAll(Connection con) {
		// TODO Auto-generated method stub

		Statement stmt = null;
		ResultSet rset = null;
		System.out.println("dao");
		String query = prop.getProperty("asd");
		System.out.println(query);
		
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			while (rset.next()) {
				Board b = new Board();
				b.setbId(rset.getInt(1));
				b.setbTitle(rset.getString(2));
				b.setbDate(rset.getDate(3));
				b.setbText(rset.getString(4));
				b.setbWriter(rset.getString(15));
				b.setmNo(rset.getInt(5));
				b.setbCategory(rset.getString(6));
				b.setvCount(rset.getInt(7));
				b.setpNo(rset.getInt(8));
				b.setAdopt(rset.getString(9));
				b.setStatus(rset.getString(10));
				b.setbNo(rset.getInt(11));
				b.setRecCount(rset.getInt(12));
				b.setRefLevel(rset.getInt(13));
				b.setbPassword(rset.getString(14));
				System.out.println(b.toString());
				
				list.add(b);
			}
			System.out.println(list + "dao");
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
}
