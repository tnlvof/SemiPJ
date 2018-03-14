<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/pj/css/common.css">
<link rel="stylesheet" href="/pj/css/reset.css">
<link rel="shortcut icon" href="/pj/images/slogo.png">
<title>앞날이 창창</title>
<style type="text/css">
.loginArea {
	width: 1200px;
	margin: 0 auto;
}

.loginFormArea {
	width: 400px;
	margin: 50px auto 0 auto;
}

.loginFormArea label {
	display: inline-block;
	width: 130px;
}

.loginFormArea input {
	border: 1px solid #d7d7d7;
	padding: 5px;
	margin-bottom: 10px;
	width: 250px;
}

.loginFormArea li {
	text-align: right;
	margin-top: 10px;
}

.loginFormArea #loginBtn,
.loginFormArea #searchingBtn {
	border: 0;
	background: navy;
	color: #fff;
	width: 260px;
	height: initial;
	padding: 10px;
	cursor: pointer;	
	margin-right: 2px;
	border-radius: 3px;
}

.loginFormArea #searchingBtn {
	border: 0;
	background: gray;
	color: #fff;
	width: 260px;
	height: initial;
	padding : 10px;
	cursor: pointer;
	margin-right: auto;
	margin-left: auto;
	border-radius: 3px;
	
}

</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<div class="loginArea">
		<form id="loginForm1" action="<%=request.getContextPath()%>/login.me"
			method="post">
			<ul class="loginFormArea">
			<br>
				<li><label class="text" >ID :</label> <input type="text" name="memberId"></li>
				<li><label class="text">PASSWORD : </label> <input
					type="password" name="memberPwd"></li>
				<li>
					<button id="loginBtn" onclick="login();">로그인</button>
				</li>
				<li>
					<button type="button" id="searchingBtn" onclick="location.href='/pj/views/login/searchingIdpwd.jsp'">ID/PASSWORD 찾기</button>
				</li>
			</ul>
		</form>
		<script>
			function login() {
				$('#loginForm1').submit();
			}
			
		</script>
	</div>
<br><br><br><br><br><br><br><br><br><br>	
<br><br><br><br><br>
<br>
<hr>
		<%@ include file="/views/common/footer.jsp" %>
</body>
</html>