<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.pj.member.model.vo.Member"%>
<% Member loginUser = (Member)session.getAttribute("loginUser"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/reset.css">
<style>
	.btns{
		align:center;		
	}
	#loginBtn{
		display:inline-block;
		vertical-align:middle;
		text-align:center;
		background:orangered;
		color:white;
		height:20px;
		width:100px;
		border-radius:5px;
	}
	#loginBtn:hover, #memberJoinBtn:hover, #logoutBtn:hover{
		cursor:pointer;	
	}
	.wrap{
		background:black;
		width:100%;
		height:50px;
	}
	.menu{
		background:black;
		color:white;
		text-align:center;
		vertical-align:middle;
		width:150px;
		height:50px;
		display:table-cell;
	}
	.nav{
		width:600px;
		margin-left:auto;
		margin-right:auto;
	}
	.menu:hover{
		background:darkgray;
		color:orangered;
		font-weight:bold;
		cursor:pointer;
	}
	#logoutBtn{
		background:orangered;
		color:white;
		text-decoration:none;
		border-radius:5px;
	}	
</style>
</head>
<body>
	<div class="loginArea">
		<form id="loginForm" action="<%=request.getContextPath() %>/login.me" method="post">
			<table align="center">
				<tr>
					<td><label class="text">ID : </label></td>
					<td><input type="text" name="memberId"></td>
				</tr>
				<tr>
					<td><label class="text">PWD : </label></td>
					<td><input type="password" name="memberPwd"></td>
				</tr>				
			</table>
			<div class="btns" align="center">
				<div id="loginBtn" onclick="login();">로그인</div>
			</div>
		</form>
		
		<script>
			function login(){
				$('#loginForm').submit();
			}
			<%-- function logout(){
				location.href="<%=request.getContextPath()%>/logout.me";
			}
			function memberJoin(){			
				location.href="/jsp/views/member/memberJoinForm.jsp";
			}
			function changeInfo(){
				
			} --%>
		</script>
	</div>
</body>
</html>