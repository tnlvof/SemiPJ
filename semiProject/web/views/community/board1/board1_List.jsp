<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>앞날이 창창</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/pj/css/common.css">
<link rel="stylesheet" href="/pj/css/reset.css">
</head>
<style>
	.searchBanner{
		width:1200px;
		height:300px;
		background-image:url("/pj/images/bannerImg1.png");
		background-size:cover;
		background-repeat:no-repeat;
		text-align:center;
	}
	.searchDiv{
		display:inline-block;
		width:700px;
		height:100px;
		padding:140px;
		color:white;
	}
</style>
<%@ include file="/views/common/menubar.jsp" %>
<body>
	<div class="div1">
		<div class="searchBanner">
			<div class="searchDiv">
				<select id="searchCategory">
					<option>제목</option>
					<option>작성자</option>
					<option>내용</option>
				</select>
				<input type="search" name="searchValue" size="30">	
				<button id="searchBtn">검색</button>
			</div>
		</div>
	</div>
</body>
</html>