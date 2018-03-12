<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, org.json.simple.JSONObject, com.kh.pj.analyse.controller.*"%>
<% 
	DoAnalyse da = new DoAnalyse();
	HashMap<String, ArrayList<HashMap>> allTable = (HashMap<String, ArrayList<HashMap>>)session.getAttribute("allTable");
	ArrayList<HashMap> front = null;
	ArrayList<HashMap> back = null;
	if(allTable!=null){
		front = allTable.get("상권_소득소비");
		back = allTable.get("상권배후지_소득소비");
	}	
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
		HashMap<String, String> frontRecentRow = front.get(0);
		HashMap<String, String> backRecentRow = back.get(0);
		
		String[] inBarText = {"detailResult0", "월 평균 소득", "금액", "만원", "10000"};
	    String[] inxName = {"월 평균 소득"};
	    String[] inCode = {"월_평균_소득_금액"};
	    out.print(da.getBar(inBarText, inxName, inCode, frontRecentRow, backRecentRow));
	    
	    String[] OutBarText = {"detailResult1", "총 지출", "금액", "만원", "10000"};
	    String[] OutxName = {"총 지출"};
	    String[] OutCode = {"지출_총금액"};
	    out.print(da.getBar(OutBarText, OutxName, OutCode, frontRecentRow, backRecentRow));
	    
	    String[] OutDetailBarText = {"detailResult2", "지출상세", "금액", "만원", "10000"};
	    String[] OutDetailxName = {"의류", "문화", "교육", "식료품", "여가", "생활용품", "의료비", "유흥", "교통"};
	    String[] OutDetailCode = {"의류_신발_지출_총금액", "문화_지출_총금액", "교육_지출_총금액", "식료품_지출_총금액", "여가_지출_총금액", "생활용품_지출_총금액", "의료비_지출_총금액", "유흥_지출_총금액", "교통_지출_총금액"};
	    out.print(da.getBar(OutDetailBarText, OutDetailxName, OutDetailCode, frontRecentRow, backRecentRow));
	    %>
	});
</script>
</html>