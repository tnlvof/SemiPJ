package com.kh.pj.map.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.pj.map.model.vo.Alley;
import static com.kh.pj.common.JDBCTemplet.*;

public class AlleyDao {
	Properties prop = new Properties();

	public AlleyDao() {
		// TODO Auto-generated constructor stub

		String fileName = AlleyDao.class.getResource("/sql/map/query-map.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public ArrayList<Alley> selectAlley(Connection con, String address) {
		// TODO Auto-generated method stub
		ArrayList<Alley> list = null;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println(address+"dao");
		String query = prop.getProperty("selectAlley");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, address);
			
			rset = pstmt.executeQuery();
			list=new ArrayList<Alley>();
			while (rset.next()) {
				Alley a = new Alley();
				a.setAlleytrdar_no(rset.getInt(1));
				a.setAlleytrdar_nm(rset.getString(2));
				a.setSigngucd(rset.getInt(3));
				a.setSigngucd_nm(rset.getString(4));
				a.setAdstrdcd(rset.getInt(5));
				a.setAdstrdcd_nm(rset.getString(6));
				
				System.out.println(a.toString());
				
				list.add(a);
			}
			System.out.println(list);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int selectAlleyCode(Connection con, String address) {
		// TODO Auto-generated method stub
		int code = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println(address + "dao");

		String query = prop.getProperty("selectAlleyCode");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, address); 
			rset = pstmt.executeQuery();

			if (rset.next()) {
				code = rset.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return code;
	}

}
