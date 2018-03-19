package com.kh.pj.board.model.service;

import static com.kh.pj.common.JDBCTemplet.close;
import static com.kh.pj.common.JDBCTemplet.commit;
import static com.kh.pj.common.JDBCTemplet.getConnection;
import static com.kh.pj.common.JDBCTemplet.rollback;

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


	public ArrayList<HashMap<String, Object>> selectList(int currentPage, int limit) {
		Connection con = getConnection();

		ArrayList<HashMap<String,Object>> list = new BoardDao().selectList(con,currentPage,limit);
		
		close(con);
		
		return list;
	}

	public int getListCount(String boardCategory) {
		Connection con = getConnection();

		int listCount = new BoardDao().getListCount(con,boardCategory);

		close(con);

		return listCount;
	}



	public HashMap<String, Object> selectOneBoard1(int num, String boardCategory) {
		Connection con = getConnection();
		
		HashMap<String,Object> hmap = null; 
		
		int result = new BoardDao().updateCount(con, num, boardCategory);
		
		if(result > 0) {
			commit(con);
			hmap = new BoardDao().selectOneBoard1(con,num);
		}else {
			rollback(con);
		}
		close(con);
		
		//new BoardDao().selectThumbnailMap; 
		
		return hmap;
	}
	public ArrayList<Board> boardSelctAll() {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		ArrayList<Board>list = new BoardDao().boardSelctAll(con);
		System.out.println(list+"service");
		close(con);
		return list;
	}


	public int updateBoard(Board b, ArrayList<Attachment> fileList) {
		Connection con = getConnection();

		int result = 0;
		
		int result1 = new BoardDao().updateBoard(con, b);
		
		int result2 = new BoardDao().updateAttachment(con,b,fileList);
		
		System.out.println("service result2 : " + result2);
		
		if(result1 >0 || result2 >0) {
			commit(con);
			result =1;
		}else {
			rollback(con);
		}
	
		close(con);

		return result;
	}


	public int deleteBoard(int bno, String boardCategory) {
		Connection con = getConnection();
		
		int result = new BoardDao().deleteBoard(con,bno,boardCategory);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}


	public ArrayList<HashMap<String, Object>> searchBoard1(int currentPage, int limit, String searchValue,
			String searchCategory) {
		Connection con = getConnection();

		ArrayList<HashMap<String,Object>> list = new BoardDao().searchBoard1(con,currentPage,limit,searchValue,searchCategory);
		
		close(con);
		
		return list;
	}

	public ArrayList<Board> boardSearchAll(String searchval, String searchcon) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		ArrayList<Board>list = new BoardDao().boardSearchAll(con,searchval,searchcon);
		System.out.println(list+"service");
		close(con);
		return list;
	}


	public int boardRemove(String bTitle) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int result = new BoardDao().boardRemove(con,bTitle);
		if(result>0)
		{
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}


	public int boardReturn(String bTitle) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int result = new BoardDao().boardReturn(con, bTitle);
		if(result>0)
		{
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
  }
	public ArrayList<Board> insertReply(Board b) {
		Connection con = getConnection();
		ArrayList<Board> replyList = null;
		
		int result = new BoardDao().insertReply(con,b);
		
		if(result > 0) {
			commit(con);
			replyList = new BoardDao().selectReplyList(con,b.getpNo());
		}else {
			rollback(con);
		}
		
		close(con);
		
		return replyList;
		}


	public ArrayList<Board> selectReplyList(Board b) {
		Connection con = getConnection();
		ArrayList<Board> replyList = new BoardDao().selectReplyList(con,b.getbId());
		
		close(con);
		
		return replyList;
	}
}
