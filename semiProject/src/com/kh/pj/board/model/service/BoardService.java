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

  /*
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
  */

}
