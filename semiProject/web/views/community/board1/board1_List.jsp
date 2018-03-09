<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>앞날이 창창</title>
<link rel="stylesheet" href="/pj/css/common.css">
<link rel="stylesheet" href="/pj/css/reset.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<style>

</style>
<%@ include file="/views/common/menubar.jsp" %>
<body>

	<!-- 검색창 -->
	<div class="searchContainer">
		<div class="searchBanner" align="center">
			<div class="bannerHeader">광고게시판</div>
			<div class="bannerSub">회원분들의 제품을 자유롭게 홍보하세요</div>
			<div class="searchDiv">
				<select class="searchCategory">
					<option>제목</option>
					<option>작성자</option>
					<option>내용</option>
				</select>
				<div class="inputDiv">
					<input type="text" class="form_text" name="searchValue">
				</div> 
					<button class="searchBtn">검색</button>
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
			
			<div class="writeBtnArea">
				<hr class="hr">
					<% if(loginUser != null){ %>
					<button class="btn btn-default" onclick="location.href='/pj/views/community/board1/board1_insert.jsp'">글쓰기</button>
					<% } %>
				<hr class="hr2">
			</div>
		</div>
		
	</div>
	
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>