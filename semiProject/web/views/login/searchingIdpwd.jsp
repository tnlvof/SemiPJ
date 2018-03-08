<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>앞날이 창창차라자라창~~~~~~~~</title>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
		<center>
<br><br>	
<h1>아이디 / 비밀번호 찾기</h1>
	<br>
	<form action="idsearch.do method="post">
		<table width="500" border="1" bgcolor="grey">
			<tr height="40">
				<td align="center" width="200">이름</td>
				<td width="300"><input type="text" name="name" size="30"></td>
			</tr>
			<tr height="40">
				<td align="center" width="200">전화번호</td>
				<td width="300"><input type="text" name="phone" size="30"></td>
			</tr>
			<tr height="40">
				<td algin="center" colspan="2"><input type="submit" value="아이디/패스워드 찾기"></td>
			</tr>
	</table>







</form>
	</center>

<br><br><br><br><br><br><br><br><br><br>	
<br><br><br><br><br>
<br>
<hr>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>