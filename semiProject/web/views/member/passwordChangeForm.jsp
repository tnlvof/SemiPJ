<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.pj.member.model.vo.*"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser"); 
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/reset.css"> -->
<title>Insert title here</title>
<style>
	.btns{
		align:center;		
	}
	#passwordBtn{
		display:inline-block;
		vertical-align:middle;
		text-align:center;
		background:orangered;
		color:white;
		height:20px;
		width:100px;
		border-radius:5px;
	}
	#passwordBtn:hover {
		cursor:pointer;	
	}
	.wrap{
		background:black;
		width:100%;
		height:50px;
	}
</style>
</head>
<body>
	<div class="changePasswordArea">
		<form id="changePasswordForm" action="<%=request.getContextPath() %>/changePassword.me" method="post">
			<table align="center">
				<tr>
					<input type="hidden" value="<%= loginUser.getMemberNo() %>" name="memberNo">
					<td><label class="text">현재 패스워드 : </label></td>
					<td><input type="text" name="memberPwd" id="currentPassword"></td>
				</tr>
				<tr>
					<td><label class="text">변경할 패스워드 : </label></td>
					<td><input type="password" name="changeMemberPwd" id="changeMemberPwd"></td>
				</tr>
				<tr>
					<td><label class="text">변경할 패스워드 확인 : </label></td>
					<td><input type="password" name="changeMemberPwdCheck" id="changeMemberPwdCheck"></td>
				</tr>				
			</table>
			<div class="btns" align="center">
				<div id="passwordBtn" onclick="passwordChange();">변경하기</div>
			</div>
		</form>
		<script>
			function passwordChange(){
				var cp = $("#currentPassword").val();
				var cmp = $("#changeMemberPwd").val();
				var cmpc = $("#changeMemberPwdCheck").val();
				
				
				if(cp == null || cmp == null || cmpc == null || cp == "" || cmp == "" || cmpc == ""){
					alert("빈칸을 입력해주세요");
					return false;
				}else if(cmp != cmpc){
					alert("변경할 비밀번호가 일치하지 않습니다.");
					return false;
				}else{
					$('#changePasswordForm').submit();
				}
			}
		</script>
	</div>

</body>
</html>