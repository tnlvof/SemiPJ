<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	width: 300px;
	height: 100%;
	border: 1px solid black;
	display: inline-block;
}

#adminmenubar ul li:hover {
	background: lightgray;
	font-weight: bold;
}

#container {
	width: 70%;
	height: 100%;
	border: 1px solid black;
	margin-top: -380px;
	margin-left: 300px;
	
}
body{
background: darkgray;
}
</style>
</head>

<body>
	<div id=adminmenubar class="well-sm">
		<label>ADMIN PAGE</label>
		<hr>
		<label>회원관리</label>
		<hr>
		<ul>
			<li>회원정보보기</li>
			<li>회원정보수정</li>
			<li>회원신고 관리</li>
		</ul>
		<hr>
		<label>게시판관리</label>
		<hr>
		<ul>
			<li>게시판보기</li>
			<li>게시글삭제</li>
			<li>신고게시판 관리</li>
		</ul>
	</div>
	<div id=container class="well-lg"><label>ADMIN PAGE</label></div>
</body>
</html>