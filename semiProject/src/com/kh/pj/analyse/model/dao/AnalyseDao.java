package com.kh.pj.analyse.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.pj.analyse.controller.AnalyseMethod;

import static com.kh.pj.common.JDBCTemplet.*;

public class AnalyseDao {
	Properties prop =new Properties();
	
	public AnalyseDao(){
		String fileName = AnalyseDao.class.getResource("/sql/analyse/analyse-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public HashMap<String, ArrayList<HashMap>> doAnalyse(String areaCode, Connection con) {
		HashMap<String, ArrayList<HashMap>> allTable = new HashMap<String, ArrayList<HashMap>>();
		ArrayList<HashMap> table = null;
		HashMap<String, String> row = null;
		//테이블명
		String[] tableName = new String[]{"상권_지수지표","상권_추정매출","상권_추정유동인구","상권_상주인구","상권_직장인구","상권_아파트","상권_소득소비","상권_집객시설"};		
		//지표지수 테이블 컬럼명
		String[] 지표지수 = new String[]{"기준_년월_코드","상권_코드","상권_코드_명","서비스_업종_코드","서비스_업종_코드_명","과밀_코드","활성도_코드","성장성_코드","안정성_코드","과밀_구간_코드_명","활성도_코드_명","성장성_코드_명","안정성_코드_명","과밀_값","활성도_지표_값","성장성_지표_값","안정성_지표_값"};
		//추정매출 테이블 컬럼명
		String[] 추정매출 = new String[]{"기준_년월_코드","상권_코드","상권_코드_명","서비스_업종_코드","서비스_업종_코드_명","평균_영업_개월_수","생존_율_1년이하","생존_율_1_2년","생존_율_2_3년","생존_율_3_5년","생존_율_5년이상","당월_금액","당월_건수","주중_비율","주말_비율","월요일_비율","화요일_비율","수요일_비율","목요일_비율","금요일_비율","토요일_비율","일요일_비율","시간대_00_06_비율","시간대_06_11_비율","시간대_11_14_비율","시간대_14_17_비율","시간대_17_21_비율","시간대_21_24_비율","남성_비율","여성_비율","연령대_10_비율","연령대_20_비율","연령대_30_비율","연령대_40_비율","연령대_50_비율","연령대_60_이상_비율","주중_금액","주말_금액","월요일_금액","화요일_금액","수요일_금액","목요일_금액","금요일_금액","토요일_금액","일요일_금액","시간대_00_06_금액","시간대_06_11_금액","시간대_11_14_금액","시간대_14_17_금액","시간대_17_21_금액","시간대_21_24_금액","남성_금액","여성_금액","연령대_10_금액","연령대_20_금액","연령대_30_금액","연령대_40_금액","연령대_50_금액","연령대_60_이상_금액","주중_건수","주말_건수","월요일_건수","화요일_건수","수요일_건수","목요일_건수","금요일_건수","토요일_건수","일요일_건수","시간대_건수_06_건수","시간대_건수_11_건수","시간대_건수_14_건수","시간대_건수_17_건수","시간대_건수_21_건수","시간대_건수_24_건수","남성_건수","여성_건수","연령대_10_건수","연령대_20_건수","연령대_30_건수","연령대_40_건수","연령대_50_건수","연령대_60_이상_건수","점포수"};
		//추정유동인구 테이블 컬럼명
		String[] 추정유동인구 = new String[]{"기준_년월_코드","상권_코드","상권_코드_명","총_수","남성_수","여성_수","연령대_10_수","연령대_20_수","연령대_30_수","연령대_40_수","연령대_50_수","연령대_60_이상_수","시간대_1_수","시간대_2_수","시간대_3_수","시간대_4_수","시간대_5_수","시간대_6_수","월요일_수","화요일_수","수요일_수","목요일_수","금요일_수","토요일_수","일요일_수"};
		//상주인구 테이블 컬럼명
		String[] 상주인구 = new String[]{"기준_년월_코드","상권_코드","상권_코드_명","총_수","남성_수","여성_수","연령대_10_수","연령대_20_수","연령대_30_수","연령대_40_수","연령대_50_수","연령대_60_이상_수","남성연령대_10_수","남성연령대_20_수","남성연령대_30_수","남성연령대_40_수","남성연령대_50_수","남성연령대_60_이상_수","여성연령대_10_수","여성연령대_20_수","여성연령대_30_수","여성연령대_40_수","여성연령대_50_수","여성연령대_60_이상_수","총_가구_수","아파트_가구_수","비_아파트_가구_수"};
		//직장인구 테이블 컬럼명
		String[] 직장인구 = new String[]{"기준_년월_코드","상권_코드","상권_코드_명","총_수","남성_수","여성_수","연령대_10_수","연령대_20_수","연령대_30_수","연령대_40_수","연령대_50_수","연령대_60_이상_수","남성연령대_10_수","남성연령대_20_수","남성연령대_30_수","남성연령대_40_수","남성연령대_50_수","남성연령대_60_이상_수","여성연령대_10_수","여성연령대_20_수","여성연령대_30_수","여성연령대_40_수","여성연령대_50_수","여성연령대_60_이상_수"};
		//아파트 테이블 컬럼명
		String[] 아파트 = new String[]{"기준_년월_코드","상권_코드","상권_코드_명","단지_수","가격_1억미만_세대_수","가격_1억_세대_수","가격_2억_세대_수","가격_3억_세대_수","가격_4억_세대_수","가격_5억_세대_수","가격_6억이상_세대_수"};
		//소득소비 테이블 컬럼명
		String[] 소득소비 = new String[]{"기준_년월_코드","상권_코드","상권_코드_명","월_평균_소득_금액","소득_구간_코드","지출_총금액","식료품_지출_총금액","의류_신발_지출_총금액","생활용품_지출_총금액","의료비_지출_총금액","교통_지출_총금액","여가_지출_총금액","문화_지출_총금액","교육_지출_총금액","유흥_지출_총금액"};
		//집객시설 테이블 컬럼명
		String[] 집객시설 = new String[]{"기준_년월_코드","상권_코드","상권_코드_명","집객시설_수","관공서_수","은행_수","종합병원_수","일반_병원_수","약국_수","유치원_수","초등학교_수","중학교_수","고등학교_수","대학교_수","백화점_수","슈퍼마켓_수","극장_수","숙박_시설_수","공항_수","철도_역_수","버스_터미널_수","지하철_역_수","버스_정거장_수"};
		
		
		String[][] colsName = new String[][]{지표지수, 추정매출, 추정유동인구, 상주인구, 직장인구, 아파트, 소득소비, 집객시설};
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			for (int i = 0; i < tableName.length; i++) {
				String query = prop.getProperty(tableName[i]);

				pstmt = con.prepareStatement(query);
				pstmt.setString(1, areaCode);

				rset = pstmt.executeQuery();
				table = new ArrayList<HashMap>();
				while(rset.next()){
					row = new HashMap<String, String>();					

					for (int j = 0; j < colsName[i].length; j++) {						
						row.put(colsName[i][j], rset.getString(j+1));
					}		
					table.add(row);
				}
				allTable.put(tableName[i], table);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return allTable;
	}
	public int insertCode(Connection con, String address, String areaCode, String catagoryCode, int memberNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertCode");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			pstmt.setString(2, areaCode);
			pstmt.setString(3, catagoryCode);
			pstmt.setString(4, address);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		return result;
	}
	public ArrayList<HashMap<String, String>> selectReport(Connection con, String memberNo) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		HashMap<String, String> hmap= null;
		ResultSet rset = null;
		String query = prop.getProperty("selectReport");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(memberNo));
			rset = pstmt.executeQuery();
			while(rset.next()){
				hmap = new HashMap<String, String>();
				hmap.put("analysisNo", rset.getString("analysis_no"));
				hmap.put("memberNo", rset.getString("member_no"));
				hmap.put("areaCode", rset.getString("areacode"));
				hmap.put("categoryCode", rset.getString("CATEGORYCODE"));
				hmap.put("address", rset.getString("address"));
				hmap.put("analyDate", rset.getString("analydate"));
				hmap.put("BigCategory", new AnalyseMethod().getCatagoryName(rset.getString("CATEGORYCODE"))[0]);
				hmap.put("smallCategory", new AnalyseMethod().getCatagoryName(rset.getString("CATEGORYCODE"))[1]);
				list.add(hmap);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return list;
	}
	public int deleteAnalyse(Connection con, String analysisNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteAnalyse");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, analysisNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}
	
}
