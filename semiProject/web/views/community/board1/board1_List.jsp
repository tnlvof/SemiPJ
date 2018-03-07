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
	.searchContainer{
		width:100%;
		text-align:center;
		margin:auto;
	}
	.searchBanner{
		margin-top:20px;
		width:1200px;
		height:300px;
		background-image:url("/pj/images/banner.png");
		background-size:cover;
		background-repeat:no-repeat;
		text-align:center;
		display:inline-block;
	}
	.searchDiv{
		display:inline-block;
		width:700px;
		height:100px;
		color:white;
	}
	.bannerHeader{
		margin-top:20px;
		padding:30px;
		font-size:40px;
		color:white;
	}
	.bannerSub{
		margin-bottom:30px;
		font-size:30px;
		color:white;
	}
	.board1{
		width:950px;
		margin:auto;
		display:inline-block;
	}
	.tableArea{
		
	}
	table , th{
		border: 1px solid lightgray;
	}
	
</style>
<%@ include file="/views/common/menubar.jsp" %>
<body>
	<!-- 검색창 -->
	<div class="searchContainer">
		<div class="searchBanner" align="center">
			<div class="bannerHeader">광고게시판</div>
			<div class="bannerSub">회원분들의 제품을 자유롭게 홍보하세요</div>
			<div class="searchDiv">
				<select id="searchCategory">
					<option>제목</option>
					<option>작성자</option>
					<option>내용</option>
				</select> <input type="search" name="searchValue" size="30">
				<button id="searchBtn">검색</button>
			</div>
		</div>
	</div>

	<div class="div1">
		
		
		<%@ include file="/views/common/communitySidebar.jsp" %>
		<!-- 게시판 영역 -->
		<div class="board1">
			<div class="tableArea">
				<table align="center">
					<tr>
						<th>글제목</th>
						<th>조회수</th>
					</tr>
				</table>
			</div>
		</div>
		
	</div>
	
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>