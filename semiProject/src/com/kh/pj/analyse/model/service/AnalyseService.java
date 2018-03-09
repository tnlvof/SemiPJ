package com.kh.pj.analyse.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.pj.analyse.model.dao.AnalyseDao;

import static com.kh.pj.common.JDBCTemplet.*;

public class AnalyseService {

	public HashMap<String, ArrayList<HashMap>> doAnalyse(String areaCode, String catagoryCode) {
		Connection con = getConnection();
		HashMap<String, ArrayList<HashMap>> allTable = new AnalyseDao().doAnalyse(areaCode, catagoryCode, con);
		
		if(allTable!=null) close(con);
		else rollback(con);
		
		return allTable;
	}

}
