<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/pj/css/common.css">
<link rel="stylesheet" href="/pj/css/sidebar.css">
<link rel="stylesheet" href="/pj/css/board.css">
<link rel="shortcut icon" href="/pj/images/slogo.png">

<title>앞날이 창창</title>
</head>
<body>
		<div class="sidenav">
			<div class="sidenav-header">
				<h2>커뮤니티</h2>
			</div>
			<a href="<%= request.getContextPath() %>/selectAllList.b1">광고게시판</a>
			<a href="<%= request.getContextPath() %>/selectAllList.b1">자유게시판</a>
			<a href="<%= request.getContextPath() %>/selectAllList.b1">질문게시판</a>
			<a href="<%= request.getContextPath() %>/selectAllList.b1">가입인사</a>
			<a href="<%= request.getContextPath() %>/selectAllList.b1">창업아이템홍보</a>
		</div>
</body>
</html>