package com.kh.pj.board.model.dao;

import static com.kh.pj.common.JDBCTemplet.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.pj.member.model.dao.MemberDao;
import com.kh.pj.board.model.vo.Board;

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

	public ArrayList<Board> selectAll(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;

		ResultSet rset = null;
		ArrayList<Board> list = null;

		String query = prop.getProperty("selecAll");

		try {
			pstmt = con.prepareStatement(query);

			//조회 시작할 할 번호와 마지막 행 번호 계산
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Board>();

			while(rset.next()){
				Board b = new Board();
				
				


				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int getListCount(Connection con) {
		// TODO Auto-generated method stub
		return 0;
	}

}
