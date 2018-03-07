<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.pj.member.model.vo.*"%>
<% Member loginUser = (Member)session.getAttribute("loginUser"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/reset.css">
<style type="text/css">
	#logoutBtn, #changeInfo {
		cursor:pointer;
		display:inline-block;
		
	}
	#loginOkBtns{
		vertical-align:middle;
	}
</style>
<title>앞날이 창창</title>
</head>
<body>
	<div class="header">
		<img src="images/changchang.png" class="logo">
		<form id="loginForm">
			<div class="loginBtns">
				<span class="glyphicon glyphicon-user"></span>
					<% if(loginUser == null){ %>
						<div id="loginBtn"><a href="views/login/loginForm.jsp">로그인</a></div>
						<div id="joinBtn"><a href="views/member/memberJoinAgreement.jsp">회원가입</a></div>
					<% }else{%>
						<div id="userInfo">
						<label><%= loginUser.getMemberName() %>님의 방문을 환영합니다.</label>
							<div class="loginOkbtns">
								<div id="changeInfo" onclick="changeInfo();">정보수정</div>
								<div id="logoutBtn" onclick="logout();">로그아웃</div>
							</div>
						</div>
			<% } %>
					</div>
		</form>
	</div>
	<div class="nav-wrap">
		<ul class="nav">
			<li class="bar">|</li>
			<li class="menu">상권분석</li>
			<li class="bar">|</li>
			<li class="menu">정부시책</li>
			<li class="bar">|</li>
			<li class="menu">커뮤니티</li>
			<li class="bar">|</li>
			<li class="menu">고객센터</li>
			<li class="bar">|</li>
		</ul>
	</div>
	<script type="text/javascript">
		function logout(){
			location.href="<%= request.getContextPath() %>/logout.me";
		
		}
		function changeInfo(){
			location.href="views/member/memberUpdateForm.jsp";
		}
	</script>
</body>
</html>