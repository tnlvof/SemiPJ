<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String msg = (String)request.getAttribute("msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#goMain{
		background:orangered;
		border-radius:5px;
		width:80px;
		height:25px;
		text-align:center;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<h1 align="center"><%= msg %></h1>
	<div id="goMain" onclick="goMain();">메인으로</div>
	<script>
		function goMain(){
			location.href="index.jsp"
		}
	</script>
</body>
</html>