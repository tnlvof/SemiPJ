package com.kh.pj.board.model.service;

import static com.kh.pj.common.JDBCTemplet.close;
import static com.kh.pj.common.JDBCTemplet.commit;
import static com.kh.pj.common.JDBCTemplet.getConnection;
import static com.kh.pj.common.JDBCTemplet.rollback;

import java.sql.Connection;

import com.kh.pj.board.model.dao.BoardDao;
import com.kh.pj.board.model.vo.Board;

public class BoardService {

	public int insertBoard(Board b) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertBoard(con,b);

		if(result >0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

}
