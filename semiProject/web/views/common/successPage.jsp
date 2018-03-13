<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String msg = (String)request.getAttribute("msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#goMain{
		background:navy;
		border-radius:5px;
		width:120px;
		height:25px;
		text-align:center;
		color: white;
		margin: 0 auto;
		cursor:pointer;
		
	}
	
	.message{
		font-weight : 200;
		
	}
	
	
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="/pj/css/common.css">
<link rel="stylesheet" href="/pj/css/reset.css">
<link rel="shortcut icon" href="/pj/images/slogo.png">
<title>앞날이 창창</title>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>

<br><br>

<p class="message" align="center"> 저희 사이트를 이용해주셔서 감사합니다. <br></p>
	<h1 align="center">"<%=msg%>"</h1>
	
	<br><br><br>
	<div id="goMain" onclick="goMain();" align="center">메인으로 가기</div>

	<script>
		function goMain(){
			location.href="index.jsp"
		}
	</script>
	<br><br>
		<%@ include file="/views/common/footer.jsp" %>	
</body>
</html>