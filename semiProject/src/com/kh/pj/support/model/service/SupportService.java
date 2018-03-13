package com.kh.pj.support.model.service;

import static com.kh.pj.common.JDBCTemplet.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.pj.support.model.dao.SupportDao;
import com.kh.pj.support.model.vo.Support;

public class SupportService {
	public ArrayList<Support> selectList() {
		Connection con = getConnection();

		ArrayList<Support> list = new SupportDao().selectList(con);

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

}
