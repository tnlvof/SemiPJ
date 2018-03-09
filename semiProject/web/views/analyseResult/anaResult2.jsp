<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, org.json.simple.JSONObject, com.kh.pj.analyse.controller.*"%>
<% 
	DoAnalyse da = new DoAnalyse();
	HashMap<String, ArrayList<HashMap>> allTable = (HashMap<String, ArrayList<HashMap>>)session.getAttribute("allTable");
	ArrayList<HashMap> front = null;
	ArrayList<HashMap> back = null;
	if(allTable!=null){
		front = allTable.get("상권_추정매출");
		back = allTable.get("상권배후지_추정매출");
		//out.print(income1);
	}	

	HashMap<String, String> frontRecentRow = null;
	HashMap<String, String> backRecentRow = null;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/resultMenu.jsp" %>
	<h1 align="center">매출분석</h1>
	<div class="anaResult detailResult0"></div>
	<div class="anaResult detailResult1"></div>
	<div class="anaResult detailResult2"></div>
	<div class="anaResult detailResult3"></div>
	<div class="anaResult detailResult4"></div>
	<div class="anaResult detailResult5"></div>
</body>
<script>
	$(function(){
		<%
	    String[] inMuchBarText = {"detailResult0", catagoryName[0] + " 업종별 월 매출", "매출", "만원", "0.0001", catagoryCode, "thsmon_selng_amt"};
	    out.print(da.getBar2(inMuchBarText, front, back));
	    
	    String[] inCountBarText = {"detailResult1", catagoryName[0] + " 업종별 월 건수", "건수", "건", "1", catagoryCode, "thsmon_selng_co"};
	    out.print(da.getBar2(inCountBarText, front, back));
		
	    String[] genderMuchBarText = {"detailResult2", catagoryName[1] + " 성별별 월 매출", "매출", "만원", "0.0001"};
		String[] genderMuchxName = {"남성", "여성"};
		String[] genderMuchCode = {"ml_selng_amt", "fml_selng_amt"};
		out.print(da.getBar(genderMuchBarText, genderMuchxName, genderMuchCode, incomeRecentJobj1, incomeRecentJobj2));
		
		String[] genderCountBarText = {"detailResult3", catagoryName[1] + " 성별별 월 건수", "건수", "건", "1"};
		String[] genderCountxName = {"남성", "여성"};
		String[] genderCountCode = {"ml_selng_co", "fml_selng_co"};
		out.print(da.getBar(genderCountBarText, genderCountxName, genderCountCode, incomeRecentJobj1, incomeRecentJobj2));
		
		String[] ageMuchBarText = {"detailResult4", catagoryName[1] + " 연령별 월 매출", "매출", "만원", "1"};
		String[] ageMuchxName = {"10대", "20대", "30대", "40대", "50대", "60대 이상"};
		String[] ageMuchCode = {"agrde_10_selng_amt", "agrde_20_selng_amt", "agrde_30_selng_amt", "agrde_40_selng_amt", "agrde_50_selng_amt", "agrde_60_above_selng_amt"};
		out.print(da.getBar(ageMuchBarText, ageMuchxName, ageMuchCode, incomeRecentJobj1, incomeRecentJobj2));
		%>
	});
</script>
</html>