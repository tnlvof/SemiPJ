package com.kh.pj.board.model.service;

import static com.kh.pj.common.JDBCTemplet.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.pj.board.model.dao.BoardDao;
import com.kh.pj.board.model.vo.Board;

public class BoardService {

	public ArrayList<Board> selectAll(int currentPage, int limit) {
		Connection con = getConnection();

		ArrayList<Board> list = new BoardDao().selectAll(con, currentPage, limit);

		close(con);

		return list;
	}
	
	public int getListCount() {
		Connection con = getConnection();

		int listCount = new BoardDao().getListCount(con);

		close(con);

		return listCount;
	}

	public Board selectOne(int num) {
		Connection con = getConnection();
		Board b = null;

		int result = new BoardDao().updateCount(con, num);

		if(result > 0){
			commit(con);
			b = new BoardDao().selectOne(con, num);
		} else{
			rollback(con);
		}

		close(con);

		return b;
	}

}
