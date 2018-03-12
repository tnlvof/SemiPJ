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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
			<a href="/pj/views/support/notice/noticeList.jsp" class="subMenuOn">공지사항</a>
			<a href="/pj/views/support/qna/qnaList.jsp">Q&A</a>
			<a href="/pj/views/support/faq/faqList.jsp">FAQ</a>
			</div>
		</div>
</body>
</html>