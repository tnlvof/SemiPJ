package com.kh.pj.board.model.service;

import static com.kh.pj.common.JDBCTemplet.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.pj.board.model.dao.BoardDao;
import com.kh.pj.board.model.vo.Attachment;
import com.kh.pj.board.model.vo.Board;

public class BoardService {


	public int insertBoard(Board b, ArrayList<Attachment> fileList) {
		Connection con = getConnection();

		int result = 0;
		
		int result1 = new BoardDao().insertBoard(con, b);
		
		if(result1 > 0) {
			int bid = new BoardDao().selectCurrval(con);
			
			for(int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setbId(bid);
			}
		}
		
		int result2 = new BoardDao().insertAttachment(con,fileList);
		
		if(result1 >0 && result2 == fileList.size()) {
			commit(con);
			result =1;
		}else {
			rollback(con);
		}
	
		close(con);

		return result;
	}


	public ArrayList<HashMap<String, Object>> selectList() {
		Connection con = getConnection();

		ArrayList<HashMap<String,Object>> list = new BoardDao().selectList(con);
		
		close(con);
		
		return list;
	}



  /*
	public ArrayList<Board> selectAll(int currentPage, int limit) {
		Connection con = getConnection();

		ArrayList<Board> list = new BoardDao().selectAll(con, currentPage, limit);

		close(con);

		return list;
	}
	*/
	public int getListCount(String boardCategory) {
		Connection con = getConnection();

		int listCount = new BoardDao().getListCount(con,boardCategory);

		close(con);

		return listCount;
	}
	/*
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
