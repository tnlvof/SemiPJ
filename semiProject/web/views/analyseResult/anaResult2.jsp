<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, com.kh.pj.analyse.controller.*"%>
<% 

	AnalyseMethod am = new AnalyseMethod();


	String catagoryCode = (String)session.getAttribute("catagoryCode");
	String[] catagoryName = am.getCatagoryName(catagoryCode);
	
	HashMap<String, ArrayList<HashMap>> allTable = (HashMap<String, ArrayList<HashMap>>)session.getAttribute("allTable");
	
	ArrayList<HashMap> frontTable = null;
	//ArrayList<HashMap> backTable = null;
	if(allTable!=null){
		frontTable = allTable.get("상권_추정매출");
		//backTable = allTable.get("상권배후지_추정매출");
	}	
	System.out.print(frontTable.size());
	ArrayList<HashMap> frontRows = new ArrayList<HashMap>();
	//ArrayList<HashMap> backRows = new ArrayList<HashMap>();
	for(HashMap<String, String> hm:frontTable){
		if(hm.get("서비스_업종_코드").equals(catagoryCode)){				
			frontRows.add(hm);
		}
	}
	
	/* for(HashMap<String, String> hm:backTable){
		if(hm.get("서비스_업종_코드").equals(catagoryCode)){				
			backRows.add(hm);	
		}
	} */
	
	HashMap<String, String> frontRecentRow = frontRows.get(0);
	//HashMap<String, String> backRecentRow = backRows.get(0);
	
	String recentDate = String.valueOf(frontRecentRow.get("기준_년월_코드")).substring(0, 4) + "년 " + String.valueOf(frontRecentRow.get("기준_년월_코드")).substring(4, 6) + "월";
	
	ArrayList<HashMap> frontRecentRows = new ArrayList<HashMap>();
	//ArrayList<HashMap> backRecentRows = new ArrayList<HashMap>();
	for(HashMap<String, String> hm:frontTable){
		if(hm.get("기준_년월_코드").equals(frontRecentRow.get("기준_년월_코드"))&&hm.get("서비스_업종_코드").contains(catagoryCode.substring(0, 3))){				
			frontRecentRows.add(hm);
		}
	}
	/* for(HashMap<String, String> hm:backTable){
		if(hm.get("기준_년월_코드").equals(frontRecentRow.get("기준_년월_코드"))&&hm.get("서비스_업종_코드").contains(catagoryCode.substring(0, 3))){				
			backRecentRows.add(hm);
		}
	} */

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<%@ include file="../common/resultMenu.jsp" %>
	<h1 align="center">매출분석</h1>
	선택한 업종 : <%=catagoryName[0] +" > "+ catagoryName[1] %>
	<h2 align="center">1. 업종별 추이</h2>
	<hr>
	
	<h2 align="center">2. 상권별 매출비교</h2>
	<div class="anaResult detailResult0"></div>
	<div class="anaResult detailResult1"><div class="twoPie Pie1"></div><div class="twoPie Pie2"></div></div>
	<hr>
	
	<h2 align="center">3. 시기별 매출특성</h2>
	<div class="anaResult detailResult2"><div class="thePie Pie1"></div><div class="thePie Pie2"></div><div class="thePie Pie3"></div></div>
	<hr>
	
	<h2 align="center">3. 고객별 매출특성</h2>
	<div class="anaResult detailResult3"><div class="twoPie Pie1"></div><div class="twoPie Pie2"></div></div>
	<hr>	
</body>
<script>
	$(function(){
		<%	
		
		String[] inLineText = {"detailResult0", "매출 추이 ("+recentDate+"기준)", "매출", "만원", am.getCategories("기준_년월_코드", frontRows)};
		String[] inLinedataName = {"상권"};
		String[] inLinedata = {am.getData("당월_금액", 10000, frontRows)};
		out.print(am.getLine(inLineText, inLinedataName, inLinedata));
		
		String[] inBarText = {"detailResult1 .Pie1", "업종별 월 매출 ("+recentDate+"기준)", "매출", "만원", am.getJob(catagoryCode)};
		String[] inBardataName = {"상권"};
		String[] inBardata = {am.getData("당월_금액", 10000, frontRecentRows)};
		out.print(am.getBar(inBarText, inBardataName, inBardata));
		
		String[] barText = {"detailResult1 .Pie2", "업종별 월 건수 ("+recentDate+"기준)", "건수", "건", am.getJob(catagoryCode)};
		String[] bardataName = {"상권"};
		String[] bardata = {am.getData("당월_건수", 1, frontRecentRows)};
		out.print(am.getBar(barText, bardataName, bardata));
		
		String[] inMuchBarText = {"detailResult2 .Pie1", "주중, 주말 매출 비율 ("+recentDate+"기준)", "매출", "만원", new String("'주중', '주말'")};
		String[] inMuchBardataName = {"상권"};
		String[] inMuchdata = {frontRecentRow.get("주중_금액"), frontRecentRow.get("주말_금액")};
		String[] inMuchBardata = {am.getData2(inMuchdata, 10000)};
		out.print(am.getBar(inMuchBarText, inMuchBardataName, inMuchBardata));
		
		String[] DayBarText = {"detailResult2 .Pie2", "요일별 매출 비율 ("+recentDate+"기준)", "매출", "만원", new String("'월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'")};
		String[] DayBardataName = {"상권"};
		String[] Daydata = {frontRecentRow.get("월요일_금액"),frontRecentRow.get("화요일_금액"),frontRecentRow.get("수요일_금액"),frontRecentRow.get("목요일_금액"),frontRecentRow.get("금요일_금액"),frontRecentRow.get("토요일_금액"),frontRecentRow.get("일요일_금액")};
		String[] DayBardata = {am.getData2(Daydata, 10000)};
		out.print(am.getBar(DayBarText, DayBardataName, DayBardata));
		
		String[] timeBarText = {"detailResult2 .Pie3", "시간대별 매출 비율 ("+recentDate+"기준)", "매출", "만원", new String("'00시~06시', '06시~11시', '11시~14시', '14시~17시', '17시~21시', '21시~24시'")};
		String[] timeBardataName = {"상권"};
		String[] timedata = {frontRecentRow.get("시간대_00_06_금액"),frontRecentRow.get("시간대_06_11_금액"),frontRecentRow.get("시간대_11_14_금액"),frontRecentRow.get("시간대_14_17_금액"),frontRecentRow.get("시간대_17_21_금액"),frontRecentRow.get("시간대_21_24_금액")};
		String[] timeBardata = {am.getData2(timedata, 10000)};
		out.print(am.getBar(timeBarText, timeBardataName, timeBardata));
		
		String[] genderBarText = {"detailResult3 .Pie1", "성별별 매출 비율 ("+recentDate+"기준)", "매출", "만원", new String("'남성', '여성'")};
		String[] genderBardataName = {"상권"};
		String[] genderdata = {frontRecentRow.get("남성_금액"),frontRecentRow.get("여성_금액")};
		String[] genderBardata = {am.getData2(genderdata, 10000)};
		out.print(am.getBar(genderBarText, genderBardataName, genderBardata));
		
		String[] ageBarText = {"detailResult3 .Pie2", "연령별 매출 비율 ("+recentDate+"기준)", "매출", "만원", new String("'10대', '20대', '30대', '40대', '50대', '60대 이상'")};
		String[] ageBardataName = {"상권"};
		String[] agedata = {frontRecentRow.get("연령대_10_금액"),frontRecentRow.get("연령대_20_금액"),frontRecentRow.get("연령대_30_금액"),frontRecentRow.get("연령대_40_금액"),frontRecentRow.get("연령대_50_금액"),frontRecentRow.get("연령대_60_이상_금액")};
		String[] ageBardata = {am.getData2(agedata, 10000)};
		out.print(am.getBar(ageBarText, ageBardataName, ageBardata));
		%>
	});
</script>
</html>