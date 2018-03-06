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
		color:white;
	}
	.bannerHeader{
		padding:50px;
		font-size:40px;
		color:white;
	}
</style>
<%@ include file="/views/common/menubar.jsp" %>
<body>
	
		<div class="div1">
		<!-- 검색창 -->
		<div class="searchBanner">
			<div class="bannerHeader">광고게시판</div>
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
		
		<%@ include file="/views/common/communitySidebar.jsp" %>
		<!-- 게시판 영역 -->
		<div class="board1">
		
		</div>
		
	</div>
	
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>