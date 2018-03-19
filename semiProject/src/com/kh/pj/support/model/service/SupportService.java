package com.kh.pj.support.model.service;

import static com.kh.pj.common.JDBCTemplet.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.pj.board.model.dao.BoardDao;
import com.kh.pj.support.model.dao.SupportDao;
import com.kh.pj.support.model.vo.Support;

public class SupportService {
	public ArrayList<Support> selectList(int currentPage, int limit, String boardCategory) {
		Connection con = getConnection();

		ArrayList<Support> list = new SupportDao().selectList(con, currentPage, limit, boardCategory);

		close(con);

		return list;
	}
	
	public int insertNotice(Support s, String boardCategory) {
		Connection con = getConnection();

		int result = new SupportDao().insertNotice(con, s, boardCategory);

		if(result > 0) commit(con);
		else rollback(con);

		close(con);

		return result;
	}

	public int getListCount(String boardCategory) {
		Connection con = getConnection();

		int listCount = new SupportDao().getListCount(con, boardCategory);

		close(con);

		return listCount;
	}
	
	public Support selectOne(int num, String boardCategory) {
		Connection con = getConnection();
		Support s = null;

		int result = new SupportDao().updateCount(con, num, boardCategory);

		if(result > 0){
			commit(con);
			s = new SupportDao().selectOne(con, num, boardCategory);
		} else{
			rollback(con);
		}

		close(con);

		return s;
	}
	
	public int updateNotice(Support s, String boardCategory) {
		Connection con = getConnection();
		
		int result = new SupportDao().updateNotice(con, s, boardCategory);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		return result;
	}

	public ArrayList<Support> deleteNotice(int bno, int currentPage, int limit, String boardCategory) {
		Connection con = getConnection();
		ArrayList<Support> list = null;
		
		int result = new SupportDao().deleteNotice(con, bno, boardCategory);
		
		if(result > 0){
			commit(con);
			list = new SupportDao().selectList(con, currentPage, limit, boardCategory);
		} else{
			rollback(con);
		}		
		
		return list;
	}

<<<<<<< HEAD
=======

	public int insertReply(Support s, String boardCategory) {
		Connection con = getConnection();

		int result = new SupportDao().insertReply(con, s, boardCategory);

		if(result > 0) commit(con);
		else rollback(con);

		close(con);
		
		return result;
	}

>>>>>>> master
	public ArrayList<Support> search(int currentPage, int limit, String searchValue,
			String searchCategory, String boardCategory) {
			Connection con = getConnection();

			ArrayList<Support> list = new SupportDao().search(con, currentPage,limit,searchValue,searchCategory, boardCategory);
			System.out.println("service list : " + list);
			close(con);
			
			return list;
	}

	public ArrayList<Support> insertReply(Support s) {
		Connection con = getConnection();
		ArrayList<Support> replyList = null;
		
		int result = new SupportDao().insertReply(con, s);
		
		if(result > 0) {
			commit(con);
			replyList = new SupportDao().selectReplyList(con, s.getpNo());
		} else {
			rollback(con);
		}
		
		close(con);
		
		return replyList;
	}

	public ArrayList<Support> selectReplyList(Support s) {
		Connection con = getConnection();
		ArrayList<Support> replyList = new SupportDao().selectReplyList(con, s.getbId());
		
		close(con);
		
		return replyList;
	}


}
