<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, com.kh.pj.analyse.controller.*"%>
<% 
	DoAnalyse da = new DoAnalyse();
	HashMap<String, ArrayList<HashMap>> allTable = (HashMap<String, ArrayList<HashMap>>)session.getAttribute("allTable");
	ArrayList<HashMap> front = null;
	ArrayList<HashMap> back = null;

	if(allTable!=null){
		front = allTable.get("상권_점포");
		back = allTable.get("상권배후지_점포");
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
	<h1 align="center">업종분석</h1>
	<div class="anaResult detailResult0"></div>
	<div class="anaResult detailResult1"></div>
	<div class="anaResult detailResult2"></div>
	<div class="anaResult detailResult3"></div>
	<div class="anaResult detailResult4"></div>
	<div class="anaResult detailResult5"></div>
</body>
<%@ include file="../common/footer.jsp"%>
<script>
	$(function(){
		
	});
</script>
</html>