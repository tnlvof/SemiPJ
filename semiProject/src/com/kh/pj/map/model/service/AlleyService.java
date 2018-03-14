package com.kh.pj.map.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.pj.map.model.dao.AlleyDao;
import com.kh.pj.map.model.vo.Alley;
import static com.kh.pj.common.JDBCTemplet.*;
public class AlleyService {

	public ArrayList<Alley> selectAlley(String address) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		System.out.println(address);
		ArrayList<Alley>list =new AlleyDao().selectAlley(con,address);
		close(con);
		return list;
	}

	public int SelectAlleyCode(String address) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		System.out.println(address);
		int code = new AlleyDao().SelectAlleyCode(con,address);
		close(con);
		
		return code;
	}

}
