<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, org.json.simple.JSONObject, com.kh.pj.analyse.controller.*"%>
<% 
	DoAnalyse da = new DoAnalyse();
	HashMap<String, ArrayList<HashMap>> allTable = (HashMap<String, ArrayList<HashMap>>)session.getAttribute("allTable");
	String catagoryCode = (String)session.getAttribute("catagoryCode");
	String[] catagoryName = da.getCatagoryName(catagoryCode);
	ArrayList<HashMap> front = null;
	if(allTable!=null){
		front = allTable.get("상권_지수지표");
	}
	HashMap<String, String> frontRecentRow = null;
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
	<h1 align="center">종합결과</h1>
	선택한 업종 : <%=catagoryName[0] +" > "+ catagoryName[1] %>
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
	for(HashMap<String, String> hm:front){
		if(hm.get("서비스_업종_코드").equals(catagoryCode)){				
			frontRecentRow = hm;
			break;
		}
	}
	
	String[] lineText = {"detailResult0", catagoryName[1] + " 지수지표", catagoryCode};
	out.print(da.get4Line(lineText, front));
	%>
	});
</script>
</html>