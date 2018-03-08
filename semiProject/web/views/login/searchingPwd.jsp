<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="/pj/css/common.css">
<link rel="stylesheet" href="/pj/css/reset.css">
<link rel="shortcut icon" href="/pj/images/slogo.png">

<title>앞날이 창창</title>
</head>
<body>
	<h1 align="center">비빌번호 찾기</h1>
	<br>
	<form action="<%=request.getContextPath()%>/SearchPwdServlet.me"
		id="searchingFor" method="post">
		<table width="500" border="1" background="grey">
			<tr height="40">
				<td align="center" width="200">아이디</td>
				<td width="300"><input type="text" name="member_id" size="30"></td>
			</tr>
			<tr height="40">
				<td align="center" width="200">생년월일</td>
				<td width="300"><input type="text" name="birth" size="30"></td>
			</tr>
		</table>

		<div align="center">
			<button onclick="findingPwd();">비밀번호 찾기</button>
		</div>
	</form>
	<script>
		function findingPwd() {
			$('#searchingFor').submit();
		}
	</script>
</body>
</html>