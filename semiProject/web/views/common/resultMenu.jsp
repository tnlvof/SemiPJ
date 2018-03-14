<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.highcharts.com/highcharts.src.js"></script>
<style>
	.resultMenu{margin-left:auto; margin-right:auto;, margin-top:20px; width:800px;}
	.resultMenu ul{list-style-type:none; height:40px;}
	.resultMenu ul li{float: left; border:1px solid black;width:19%;}
	.resultMenu ul li a{display: block; padding: 5px 25px;}
	.resultMenu ul li a:hover{background:black; color:white;}
	.anaResult{width:1000px; height:500px; border:1px solid black; margin-left:auto; margin-right:auto; margin-bottom:50px;}
	.twoPie{width:49%; height:99%; display:inline-block; border:1px solid black; margin-left:auto; margin-right:auto;}
	.thePie{width:33%; height:99%; display:inline-block; border:1px solid black; margin-left:auto; margin-right:auto;}
</style>
</head>
<body>
	<div class="resultMenu" align="center">
		<ul>
			<li><a href="<%=request.getContextPath() %>/views/analyseResult/anaResult0.jsp">상권평가</a></li>
			<%-- <li><a href="<%=request.getContextPath() %>/views/analyseResult/anaResult1.jsp">업종분석</a></li> --%>
			<li><a href="<%=request.getContextPath() %>/views/analyseResult/anaResult2.jsp">매출분석</a></li>
			<li><a href="<%=request.getContextPath() %>/views/analyseResult/anaResult3.jsp">인구분석</a></li>
			<li><a href="<%=request.getContextPath() %>/views/analyseResult/anaResult4.jsp">소득소비</a></li>
			<li><a href="<%=request.getContextPath() %>/views/analyseResult/anaResult5.jsp">지역분석</a></li>
		</ul>
	</div>
</body>
</html>