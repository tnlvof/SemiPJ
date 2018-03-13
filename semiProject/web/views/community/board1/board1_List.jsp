<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>앞날이 창창</title>
<link rel="stylesheet" href="/pj/css/common.css">
<link rel="stylesheet" href="/pj/css/reset.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/pj/css/board.css">
</head>
<style>
.thumb-List{
		width: 194px;
		border:1px solid white;
		display:inline-block;
		align:center;
		margin-bottom:20px;
	}
.thumb-List:hover{
		opacity:0.8;
		cursor:pointer;
	}
.boardListFont{
	font-size:13px;
}
.boardListTitle{
	color:black;
	font-weight:600;
	font-size:14px;
}
</style>
<%@ include file="/views/common/menubar.jsp"%>
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


		<%@ include file="/views/common/communitySidebar.jsp"%>
		<!-- 게시판 영역 -->
		<div class="board1">
			<div class="tableArea">
				<%
					for (int i = 0; i < list.size(); i++) {
						HashMap<String, Object> hmap = list.get(i);
				%>
				<div class="thumb-List">
					<div>
						<input type="hidden" value="<%=hmap.get("b_id")%>"> 
						<img src="/pj/thumbnail_uploadFiles/<%=hmap.get("change_name")%>" width="150px" height="150px">
					</div>
					<p class="boardListFont">
						No.
						<%=hmap.get("b_no")%> &nbsp;
						<span class="boardListTitle"><%=hmap.get("b_text")%></span>
						<br> 조회수 :
						<%=hmap.get("view_count")%>
						<br><%=hmap.get("nickname")%>
					</p>
				</div>
				<%
					}
				%>

			</div>
			<script>
			$(function(){
				$(".thumb-List").click(function(){
					var num = $(this).children().children().eq(0).val()
					console.log(num);
					
					location.href="<%=request.getContextPath()%> /selectOne.tn?num=" + num;
					});
				});
			</script>

		<div class="writeBtnArea">
			<hr class="hr">
			<%
				if (loginUser != null) {
			%>
			<button class="btn btn-default"
				onclick="location.href='/pj/views/community/board1/board1_insert.jsp'">글쓰기</button>
			<%
				}
			%>
			<hr class="hr2">
		</div>
		</div>
	</div>

	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>