<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, org.json.simple.JSONObject, com.kh.pj.analyse.controller.*"%>
<% 
	DoAnalyse da = new DoAnalyse();
	HashMap<String, ArrayList<HashMap>> allTable = (HashMap<String, ArrayList<HashMap>>)session.getAttribute("allTable");
	ArrayList<HashMap> moveFront = null;
	ArrayList<HashMap> moveBack = null;
	ArrayList<HashMap> liveFront = null;
	ArrayList<HashMap> liveBack = null;
	ArrayList<HashMap> workFront = null;
	ArrayList<HashMap> workBack = null;
	ArrayList<HashMap> aprtFront = null;
	ArrayList<HashMap> aprtBack = null;
	if(allTable!=null){
		moveFront = allTable.get("상권_추정유동인구");
		moveBack = allTable.get("배후지_추정유동인구");
		liveFront = allTable.get("상권_상주인구");
		liveBack = allTable.get("상권배후지_상주인구");
		workFront = allTable.get("상권_직장인구");
		workBack = allTable.get("상권배후지_직장인구");
		aprtFront = allTable.get("상권_아파트");
		aprtBack = allTable.get("상권배후지_아파트");		
	}	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인구분석</title>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<%@ include file="../common/resultMenu.jsp" %>
	<h1 align="center">인구분석</h1>
	<h3 align="center">1. 유동인구</h3>
	<div class="anaResult detailResult0"></div>
	<div class="anaResult detailResult1"></div>
	<div class="anaResult detailResult2"></div>
	<div class="anaResult detailResult3"></div>
	<div class="anaResult detailResult4"></div>
	<hr>
	
	<h3 align="center">2. 상주인구</h3>
	<div class="anaResult detailResult5"></div>
	<div class="anaResult detailResult6"></div>
	<hr>
	
	<h3 align="center">3. 직장인구</h3>
	<div class="anaResult detailResult7"></div>
	<div class="anaResult detailResult8"></div>
	
	<h3 align="center">4. 주거형태</h3>
	<div class="anaResult detailResult9"></div>
	<script>
	$(function () {
		    <%
		    HashMap<String, String> moveFrontRecentRow = moveFront.get(0);
		    HashMap<String, String> moveBackRecentRow = moveBack.get(0);
		    String[] moveLineText = {"detailResult0", "유동인구 추이", "유동인구 수", "명", "총_수", "1"};
		    out.print(da.get2Line(moveLineText, moveFront, moveBack));
		    
		    String[] genderMoveBarText = {"detailResult1", "성별별 유동인구", "유동인구 수", "명", "1"};
		    String[] genderMovexName = {"남성", "여성"};
		    String[] genderMoveCode = {"남성_수", "여성_수"};
		    out.print(da.getBar(genderMoveBarText, genderMovexName, genderMoveCode, moveFrontRecentRow, moveBackRecentRow));
		    
		    String[] dayMoveBarText = {"detailResult2", "요일별 유동인구", "유동인구 수", "명", "1"};
		    String[] dayMovexName = {"월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"};
		    String[] dayMoveCode = {"월요일_수", "화요일_수", "수요일_수", "목요일_수", "금요일_수", "토요일_수", "일요일_수"};
		    out.print(da.getBar(dayMoveBarText, dayMovexName, dayMoveCode, moveFrontRecentRow, moveBackRecentRow));
		    
		    String[] ageMoveBarText = {"detailResult3", "연령대별 유동인구", "유동인구 수", "명", "1"};
		    String[] ageMovexName = {"10대", "20대", "30대", "40대", "50대", "60대 이상"};
		    String[] ageMoveCode = {"연령대_10_수", "연령대_20_수", "연령대_30_수", "연령대_40_수", "연령대_50_수", "연령대_60_이상_수"};
		    out.print(da.getBar(ageMoveBarText, ageMovexName, ageMoveCode, moveFrontRecentRow, moveBackRecentRow));
		    
		    String[] timeMoveBarText = {"detailResult4", "시간대별 유동인구", "유동인구 수", "명", "1"};
		    String[] timeMovexName = {"00 ~ 06시", "06 ~ 12시", "12 ~ 15시", "15 ~ 18시", "18 ~ 21시", "21 ~ 24시"};
		    String[] timeMoveCode = {"시간대_1_수","시간대_2_수","시간대_3_수","시간대_4_수","시간대_5_수","시간대_6_수"};
		    out.print(da.getBar(timeMoveBarText, timeMovexName, timeMoveCode, moveFrontRecentRow, moveBackRecentRow));
		    
		    
		    HashMap<String, String> liveFrontRecentRow = liveFront.get(0);
		    HashMap<String, String> liveBackRecentRow = liveBack.get(0);
			
			String[] genderLiveBarText = {"detailResult5", "성별별 상주인구", "상주인구 수", "명", "1"};
			String[] genderLivexName = {"남성", "여성"};
			String[] genderLiveCode = {"남성_수", "여성_수"};
			out.print(da.getBar(genderLiveBarText, genderLivexName, genderLiveCode, liveFrontRecentRow, liveBackRecentRow));
			 
			String[] ageLiveBarText = {"detailResult6", "연령대별 상주인구", "상주인구 수", "명", "1"};
			String[] ageLivexName = {"10대", "20대", "30대", "40대", "50대", "60대 이상"};
			String[] ageLiveCode = {"연령대_10_수", "연령대_20_수", "연령대_30_수", "연령대_40_수", "연령대_50_수", "연령대_60_이상_수"};
			out.print(da.getBar(ageLiveBarText, ageLivexName, ageLiveCode, liveFrontRecentRow, liveBackRecentRow));
			 
			 
			HashMap<String, String> workFrontRecentRow = workFront.get(0);
			HashMap<String, String> workBackRecentRow = workBack.get(0);
			//System.out.println(workFrontRecentRow);
			//System.out.println(workBackRecentRow);
			String[] genderWorkBarText = {"detailResult7", "성별별 직장인구", "직장인구 수", "명", "1"};
			String[] genderWorkxName = {"남성", "여성"};
			String[] genderWorkCode = {"남성_수", "여성_수"};
			out.print(da.getBar(genderWorkBarText, genderWorkxName, genderWorkCode, workFrontRecentRow, workBackRecentRow));
			 
			String[] ageWorkBarText = {"detailResult8", "연령대별 직장인구", "직장인구 수", "명", "1"};
			String[] ageWorkxName = {"10대", "20대", "30대", "40대", "50대", "60대 이상"};
			String[] ageWorkCode = {"연령대_10_수", "연령대_20_수", "연령대_30_수", "연령대_40_수", "연령대_50_수", "연령대_60_이상_수"};
			out.print(da.getBar(ageWorkBarText, ageWorkxName, ageWorkCode, workFrontRecentRow, workBackRecentRow));
			
			String[] aptLineText = {"detailResult9", "아파트 세대 수 추이", "세대 수", "명", "아파트_가구_수", "1"};
		    out.print(da.get2Line(aptLineText, liveFront, liveBack));
		    %>
	});	
	</script>
</body>
</html>