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
<title>앞날이 창창차라자라창~~~~~~~~</title>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
<br><br>	
<h1>아이디 / 비밀번호 찾기</h1>
	<br>
	<form action="<%=request.getContextPath()%>/SearchIdServlet.me" id="searchingFor" method="post">
		<table width="500" border="1" background="grey">
			<tr height="40">
				<td align="center" width="200">이름</td>
				<td width="300"><input type="text" name="member_name" size="30" ></td>
			</tr>
			<tr height="40">
				<td align="center" width="200">생년월일</td>
				<td width="300"><input type="text" name="birth" size="30" ></td>
			</tr>
		</table>
	
			<div align="center">
				<button onclick="findingId();">아이디 찾기</button>
				<button onclick="findingPwd();">비밀번호 찾기</button>
			</div>
</form>
			<script>
				function findingId(){
					$('#searchingFor').submit();
				}
			</script>


<%-- <%
String page = (String)request.getAttribute("page"); // 꼭 형변환을 해주자.
%> --%>
<br><br><br><br><br><br><br><br><br><br>	
<br><br><br><br><br>
<br>
<hr>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>