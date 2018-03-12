<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../common/menubar.jsp"%>
	<form action="<%=request.getContextPath() %>/runAnalyse.an" method="post">
	상권코드 : <input type="text" name="areaCode" value="000062">
	<br>
	업종코드 : <input type="text" name="catagoryCode" value="CS100001">

	<br>
	<button type="submit">분석</button>
	</form>
</body>
</html>