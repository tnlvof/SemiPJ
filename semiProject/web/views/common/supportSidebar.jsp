<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/pj/css/common.css">
<link rel="stylesheet" href="/pj/css/reset.css">
<link rel="stylesheet" href="/pj/css/sidebar.css">
<link rel="shortcut icon" href="/pj/images/slogo.png">
<title>앞날이 창창</title>
</head>
<script>
	$(document).ready(function() {
		$("a").click(function(event) {
			$("a").addClass("subMenuOn");
		});
	});
</script>
<body>
<div class="div1">
		<div class="sidenav">
			<div class="sidenav-header">
				<h2>고객센터</h2>
			</div>
			<div id="sidenav-menu">
			<a onclick="goSupport();">공지사항</a>
			<a onclick="goQna();">Q&A</a>
			<a onclick="goFaq();">FAQ</a>
			</div>
		</div>
		<script>
		function goSupport(){
			  location.href="<%=request.getContextPath()%>/select.sp";
		  }
		function goQna(){
			  location.href="<%=request.getContextPath()%>/selectQna.sp";
		  }
		function goFaq(){
			  location.href="<%=request.getContextPath()%>/selectFaq.sp";
		  }
		</script>
</body>
</html>