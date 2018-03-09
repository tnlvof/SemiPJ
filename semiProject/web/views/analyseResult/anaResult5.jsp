<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, org.json.simple.JSONObject, com.kh.pj.analyse.controller.*"%>
<% 
	DoAnalyse da = new DoAnalyse();
	HashMap<String, ArrayList<HashMap>> allTable = (HashMap<String, ArrayList<HashMap>>)session.getAttribute("allTable");
	ArrayList<HashMap> front = null;
	ArrayList<HashMap> back = null;
	/* for(ArrayList<JSONObject> j:allList){
		System.out.print(j);
	} */
	if(allTable!=null){
		front = allTable.get("상권_집객시설");
		back = allTable.get("상권배후지_집객시설");
	}	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/resultMenu.jsp" %>
	<h1 align="center">지역분석</h1>
	
	<h3 align="center">1. 주요시설</h3>
	<div class="anaResult detailResult0"></div>
	<div class="anaResult detailResult1"></div>
	<hr>
	
	<h3 align="center">2. 학교시설</h3>
	<div class="anaResult detailResult2"></div>
	<hr>
	
	<h3 align="center">3. 교통시설</h3>
	<div class="anaResult detailResult3"></div>
</body>
<script>
	$(function(){
		<% 
		String[] facilitieLineText = {"detailResult0", "주요시설 추이", "주요시설 수", "개", "집객시설_수", "1"};
		out.print(da.get2Line(facilitieLineText, front, back));
		
		HashMap<String, String> frontRecentRow = front.get(0);
		HashMap<String, String> backRecentRow = back.get(0); 
		
		
		String[] facilitieRecBarText = {"detailResult1", "주요시설 현황", "주요시설 수", "개", "1"};
	    String[] facilitieRecxName = {"은행", "버스 정거장", "버스 터미널", "지하철역", ",철도역", "공항", "숙박시설", "관공서", "백화점", "슈퍼마켓", "극장", "약국", "일반병원","종합병원","유치원", "초등학교", "중학교", "고등학교", "대학교"};
	    String[] facilitieRecCode = {"은행_수", "버스 정거장_수", "버스 터미널_수", "지하철역_수", ",철도역_수", "공항_수", "숙박시설_수", "관공서_수", "백화점_수", "슈퍼마켓_수", "극장_수", "약국_수", "일반병원_수","종합병원_수","유치원_수", "초등학교_수", "중학교_수", "고등학교_수", "대학교_수"};
	    out.print(da.getBar(facilitieRecBarText, facilitieRecxName, facilitieRecCode, frontRecentRow, backRecentRow));
	    
	    String[] schoolRecBarText = {"detailResult2", "학교시설 현황", "학교시설 수", "개", "1"};
	    String[] schoolRecxName = {"유치원", "초등학교", "중학교", "고등학교", "대학교"};
	    String[] schoolRecCode = {"유치원_수", "초등학교_수", "중학교_수", "고등학교_수", "대학교_수"};
	    out.print(da.getBar(schoolRecBarText, schoolRecxName, schoolRecCode, frontRecentRow, backRecentRow));
	    
	    String[] transefortRecBarText = {"detailResult3", "교통시설 현황", "교통시설 수", "개", "1"};
	    String[] transefortRecxName = {"버스 정거장", "버스 터미널", "지하철역", ",철도역", "공항"};
	    String[] transefortRecCode = {"버스 정거장_수", "버스 터미널_수", "지하철역_수", ",철도역_수", "공항_수"};
	    out.print(da.getBar(transefortRecBarText, transefortRecxName, transefortRecCode, frontRecentRow, backRecentRow));
		%>
	});
</script>
</html>