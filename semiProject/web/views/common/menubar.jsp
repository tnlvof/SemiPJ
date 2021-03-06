<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.pj.member.model.vo.*"%>
<% Member loginUser = (Member)session.getAttribute("loginUser"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/pj/css/common.css">
<link rel="stylesheet" href="/pj/css/reset.css">
<link rel="stylesheet" href="/pj/js/jquery-3.3.1.js">
<link rel="shortcut icon" href="/pj/images/slogo.png">

<style type="text/css">
	#logoutBtn, #changeInfo {
		cursor:pointer;
		display:inline-block;
	}
	#loginOkBtns{
		vertical-align:middle;
	}
	.loginBtns1{
		margin-top:50px;
	}
</style>

<title>앞날이 창창</title>
</head>
<body>
	<div class="header">
<a href="/pj/index.jsp"><img src="/pj/images/changchang.png" class="logo"></a>
		<form id="loginForm">
			<div class="loginBtns1">
					<% if(loginUser == null){ %>
					<br>
					<span class="glyphicon glyphicon-user floatLeft"></span>
						<div id="loginBtn"><a href="/pj/views/login/loginForm.jsp">로그인</a></div>
						<div id="joinBtn"><a href="/pj/views/member/memberJoinAgreement.jsp">회원가입</a></div>
					<% }else{%>
						<div id="userInfo">
						<span class="glyphicon glyphicon-user floatLeft"></span>
						<label><%= loginUser.getMemberName() %>님의 방문을 환영합니다.</label>
							<div class="loginOkbtns" style="text-indent:10px;">
								<div id="changeInfo" onclick="myPage();">마이페이지</div>
								<div id="logoutBtn" onclick="logout();">로그아웃</div>
								<% if(loginUser.getMemberId().equals("admin")){ %>
								<div id="logoutBtn" onclick="location.href='/pj/views/admin/adminsidebar.jsp'">관리자페이지 가기</div>
								<%} %>
							</div>
						</div>
			<% } %>
					</div>
		</form>
	</div>
	
	<div class="nav-wrap">
		<div class="inner-nav">
			<ul class="nav" align="center">
				<li class="bar">|</li>


				<li class="menu" onclick="location.href='/pj/views/analysis/map/map.jsp'">상권분석</li>
				<li class="bar">|</li>
				<li class="menu" onclick="location.href='http://www.sbiz.or.kr/sup/policy/policystartup.do'">정부시책</li>
				<li class="bar">|</li>
				<li class="menu" onclick="goCommunity()">커뮤니티</li>
				<li class="bar">|</li>
				<li class="menu" onclick="goSupport();">고객센터</li>
				<li class="bar">|</li>
			</ul>
		</div>
	</div>
	<script type="text/javascript">
		function goCommunity(){
			location.href="<%= request.getContextPath() %>/selectAllList.b1";
		}
		function logout(){
			location.href="<%= request.getContextPath() %>/logout.me";
		}
		function myPage(){
		<% if(loginUser != null){ %>
			location.href="<%=request.getContextPath()%>/selectReport.an?memberNo=<%=loginUser.getMemberNo()%>";
		<% }else{ %>
			alert("로그인 후 이용이 가능합니다.");
		<% } %>
		}
		function goSupport(){
			  location.href="<%= request.getContextPath() %>/select.sp";
		  }
	</script>
</body>
</html>