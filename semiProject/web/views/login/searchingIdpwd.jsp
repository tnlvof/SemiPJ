<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="/pj/css/common.css">
<link rel="stylesheet" href="/pj/css/reset.css">
<link rel="shortcut icon" href="/pj/images/slogo.png">
<title>앞날이 창창</title>
<style type="text/css">
	#searchIdPwd {
		align:center;
	}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
<br><br>	
<h1 align="center">아이디 / 비밀번호 찾기</h1>
	<br>
	<form action="<%=request.getContextPath()%>/SearchIdServlet.me" id="searchingId" method="post">
		<div align="center">
				<table>
			<tr height="40">
				<td align="center" width="200">이름</td>
				<td width="300"><input type="text" name="member_name" size="30" ></td>
			</tr>
			<tr height="40">
				<td align="center" width="200">생년월일</td>
				<td width="300"><input type="text" name="birth" size="30" ></td>
			</tr>
		</table>
		</div>
			<div align="center">
				<button onclick="findingId();">아이디 찾기</button>
			</div>
	</form>
	<br><br>
	<form action="<%=request.getContextPath()%>/SearchPwdServlet.me" id="searchingPwd" method="post">
		<div align="center">
			<table>
				<tr height="40">
					<td align="center" width="200">아이디</td>
					<td width="300"><input type="text" name="member_Id" size="30" ></td>
				</tr>
				<tr height="40">
					<td align="center" width="200">이름</td>
					<td width="300"><input type="text" name="member_name" size="30" ></td>
				</tr>
				<tr height="40">
					<td align="center" width="200">이메일</td>
					<td width="300"><input type="text" name="email" size="30" ></td>
				</tr>
			</table>
		</div>
			<div align="center">
				<button onclick="findingPwd();">비밀번호 찾기</button>
			</div>
	</form>
			<script>
				function findingId(){
					$('#searchingId').submit();
				}
				
				function findingPwd(){
					$('searchingPwd').submit();
				}
			</script>


<%-- <%
String page = (String)request.getAttribute("page"); // 꼭 형변환을 해주자.
%> --%>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>