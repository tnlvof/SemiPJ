<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, com.kh.pj.analyse.controller.*"%>
<% 
	AnalyseMethod am = new AnalyseMethod();
	HashMap<String, ArrayList<HashMap>> allTable = (HashMap<String, ArrayList<HashMap>>)session.getAttribute("allTable");
	ArrayList<HashMap> front = null;
	ArrayList<HashMap> back = null;
	if(allTable!=null){
		front = allTable.get("상권_소득소비");
		back = allTable.get("상권배후지_소득소비");
	}	
	
	HashMap<String, String> frontRecentRow = front.get(0);
	HashMap<String, String> backRecentRow = back.get(0);
	
	String recentDate = String.valueOf(frontRecentRow.get("기준_년월_코드")).substring(0, 4) + "년 " + String.valueOf(frontRecentRow.get("기준_년월_코드")).substring(4, 6) + "월";
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
	<h1 align="center">소득소비</h1>
	<h3 align="center">1. 소득</h3>
	<div class="anaResult detailResult0"></div>
	<hr>
	
	<h3 align="center">2. 소비</h3>
	<div class="anaResult detailResult1"></div>
	<div class="anaResult detailResult2"></div>
</body>
<script>
	$(function(){
		<%
		String[] inLineText = {"detailResult0", "월 평균 소득 추이 ("+recentDate+"기준)", "평균 소득", "만원", am.getCategories("기준_년월_코드", front)};
		String[] inLinedataName = {"상권"};
		String[] inLinedata = {am.getData("월_평균_소득_금액", 1, front)};
		out.print(am.getLine(inLineText, inLinedataName, inLinedata));
		
		String[] outLineText = {"detailResult1", "총 지출 추이 ("+recentDate+"기준)", "총 지출", "만원", am.getCategories("기준_년월_코드", front)};
		String[] outLinedataName = {"상권"};
		String[] outLinedata = {am.getData("지출_총금액", 10000, front)};
		out.print(am.getLine(outLineText, outLinedataName, outLinedata));
		
		String[] outBarText = {"detailResult2", "지출 상세 ("+recentDate+"기준)", "지출", "만원", new String("'의류','문화', '교육', '식료품', '여가', '생활용품', '의료비', '유흥', '교통'")};
		String[] outBardataName = {"상권"};
		String[] outdata = {frontRecentRow.get("의류_신발_지출_총금액"),frontRecentRow.get("문화_지출_총금액"),frontRecentRow.get("교육_지출_총금액"),frontRecentRow.get("식료품_지출_총금액"),frontRecentRow.get("여가_지출_총금액"),frontRecentRow.get("생활용품_지출_총금액"),frontRecentRow.get("의료비_지출_총금액"),frontRecentRow.get("유흥_지출_총금액"),frontRecentRow.get("교통_지출_총금액")};
		String[] outBardata = {am.getData2(outdata, 10000)};
		out.print(am.getBar(outBarText, outBardataName, outBardata));
		%>
	});
</script>
</html>