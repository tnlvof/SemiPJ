<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="shortcut icon" href="/pj/images/slogo.png">
<link rel="stylesheet" href="/pj/css/common.css">
<link rel="stylesheet" href="/pj/css/reset.css">
<title>앞날이 창창</title>
<style>
.sidenav {
	width: 200px;
	/* position: fixed; */
	display: inline-block;
    z-index: 1;
	overflow-x: hidden;
}

.sidenav a {
	padding: 20px 8px 20px 30px;
	text-decoration: none;
	font-size: 15px;
	display: block;
	border: 1px solid lightgray;
	border-top: none;
}

.sidenav-header {
	height: 100px;
	background: midnightblue;
	color:white;
	text-align: center;
	font-size: 18px;
	font-weight: bold;
	padding-top: 40px;
}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<div class="div1">
		<div class="sidenav">
			<div class="sidenav-header">
				<h1>고객센터</h1>
			</div>
			<a href="#">Q&A</a> <a href="#">FAQ</a>
		</div>
	</div>
</body>
</html>