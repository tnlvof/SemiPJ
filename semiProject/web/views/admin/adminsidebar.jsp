<%@page import="com.kh.pj.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<% Member loginUser = (Member)session.getAttribute("loginUser"); %>

<!DOCTYPE html>
<html>
<head>
<!--  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#adminmenubar {
	width: 250px;
	height: 100%;
	border: 3px solid white;
	display: inline-block;
	margin-left: 50px;
	margin-top: 50px;
}
body{
background: darkgray;
}
</style>
</head>

<body>
<% if(loginUser.getMemberId().equals("admin")){ %>
	<div id=adminmenubar class="well-sm">
		<label>ADMIN PAGE</label>
		<hr>
		<label>회원관리</label>
		<hr>
		<ul>
			<a href="admin_member.jsp"><li>[검색/조작]</li></a>

		</ul>
		<hr>
		<label>게시판관리</label>
		<hr>
		<ul>
			<a href="admin_board.jsp"><li>[검색/조작]</li></a>

		</ul>
	</div>
	<%}else{
		%><label>잘못된접근입니다.</label><%
		}%>
	
</body>
</html>