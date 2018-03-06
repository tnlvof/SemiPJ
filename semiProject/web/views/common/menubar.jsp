<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/pj/css/common.css">
<link rel="stylesheet" href="/pj/css/reset.css">
<link rel="shortcut icon" href="/pj/images/slogo.png">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>앞날이 창창</title>
</head>
<body>
	<div class="header">
		<a href="/pj/index.jsp"><img src="/pj/images/changchang.png" class="logo"></a>
		<form id="loginForm">
			<div class="loginBtns">
				<span class="glyphicon glyphicon-user"></span>
				<div id="loginBtn">로그인</div>
				<div id="joinBtn">
					<a href="/pj/views/member/memberJoinAgreement.jsp">회원가입</a>
				</div>
			</div>
		</form>
	</div>
	<div class="nav-wrap">
		<div class="inner-nav">
			<ul class="nav" align="center">
				<li class="bar">|</li>
				<li class="menu">상권분석</li>
				<li class="bar">|</li>
				<li class="menu">정부시책</li>
				<li class="bar">|</li>
				<li class="menu" onclick="location.href='/pj/views/community/board1/board1_List.jsp'">커뮤니티</li>
				<li class="bar">|</li>
				<li class="menu">고객센터</li>
				<li class="bar">|</li>
			</ul>
		</div>
	</div>
</body>
</html>