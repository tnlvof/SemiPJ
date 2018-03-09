package com.kh.pj.board.model.dao;

import static com.kh.pj.common.JDBCTemplet.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.pj.board.model.dao.BoardDao;
import com.kh.pj.board.model.vo.Board;

public class BoardDao {
	private Properties prop = new Properties();
	
	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int insertBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("inserBoard");
		
		try {
			pstmt= con.prepareStatement(query);
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}
