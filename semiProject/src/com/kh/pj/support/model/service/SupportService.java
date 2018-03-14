package com.kh.pj.support.model.service;

import static com.kh.pj.common.JDBCTemplet.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.pj.support.model.dao.SupportDao;
import com.kh.pj.support.model.vo.Support;

public class SupportService {
	public ArrayList<Support> selectList(int currentPage, int limit) {
		Connection con = getConnection();

		ArrayList<Support> list = new SupportDao().selectList(con, currentPage, limit);

		close(con);

		return list;
	}
	
	public int insertNotice(Support s) {
		Connection con = getConnection();

		int result = new SupportDao().insertNotice(con, s);

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
	
	public Support selectOne(int num) {
		Connection con = getConnection();
		Support s = null;

		int result = new SupportDao().updateCount(con, num);

		if(result > 0){
			commit(con);
			s = new SupportDao().selectOne(con, num);
		} else{
			rollback(con);
		}

		close(con);

		return s;
	}

}
