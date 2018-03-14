package com.kh.pj.map.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.kh.pj.map.model.vo.Alley;
import static com.kh.pj.common.JDBCTemplet.*;

public class AlleyDao {

	public ArrayList<Alley> selectAlley(Connection con, String address) {
		// TODO Auto-generated method stub
		ArrayList<Alley> list = null;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println(address+"dao");
		String query = "select * from alley where ADSTRD_CD_NM=? and not REGEXP_LIKE(ALLEY_TRDAR_NM,'[A-Z]')" ;

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

	public int SelectAlleyCode(Connection con, String address) {
		// TODO Auto-generated method stub
		int code=0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println(address+"dao");
		
		String query = "select ALLEY_TRDAR_NO from alley where ALLEY_TRDAR_NM=? and not REGEXP_LIKE(ALLEY_TRDAR_NM,'[A-Z]')" ;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, address);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				code=rset.getInt(1);
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
