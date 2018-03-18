package com.kh.pj.analyse.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.pj.analyse.model.dao.AnalyseDao;

import static com.kh.pj.common.JDBCTemplet.*;

public class AnalyseService {

	public HashMap<String, ArrayList<HashMap>> doAnalyse(String areaCode) {
		Connection con = getConnection();
		HashMap<String, ArrayList<HashMap>> allTable = new AnalyseDao().doAnalyse(areaCode, con);
		close(con);		
		return allTable;
	}
	
	public int insertCode(String address, String areaCode, String catagoryCode, int memberNo) {
		Connection con = getConnection();
		int result = 0;
		
		result = new AnalyseDao().insertCode(con, address, areaCode, catagoryCode, memberNo);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public ArrayList<HashMap<String, String>> selectReport(String memberNo) {
		Connection con = getConnection();
		ArrayList<HashMap<String, String>> list = new AnalyseDao().selectReport(con, memberNo);
		close(con);
		return list;
	}

}
