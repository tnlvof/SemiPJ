<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.pj.board.model.vo.*"%>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>앞날이 창창</title>
<link rel="stylesheet" href="/pj/css/common.css">
<link rel="stylesheet" href="/pj/css/reset.css">
<link rel="stylesheet" href="/pj/css/support.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/pj/css/board.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
			<div class="bannerHeader">자유게시판</div>
			<div class="bannerSub">회원님들의 이야기를 자유롭게 이야기하세요</div>
			<div class="searchDiv">
			<form action="<%=request.getContextPath()%>/search.b2">
				<select class="searchCategory" name="selectCategory">
					<option>제목</option>
					<option>작성자</option>
					<option>내용</option>
				</select>
				<div class="inputDiv">
					<input type="text" class="form_text" name="searchValue">
				</div>
				<button type="submit" class="searchBtn">검색</button>
			</form>
			</div>
		</div>
	</div>

	<div class="div1">

		<%@ include file="/views/common/communitySidebar.jsp"%>
		<!-- 게시판 영역 -->
		<div class="board1">
			
		<div class="supportHeader">
			<h2>자유게시판</h2>
		</div>
		
		<div class="tableListArea">
			<table align="center">
				<tr>
					<th width="100px" class="tableLeft-none">번호</th>
					<th width="300px">제목</th>
					<th width="100px">작성자</th>
					<th width="150px">등록일</th>
					<th width="100px">조회수</th>
				</tr>
				<%
					for (int i = 0; i < list.size(); i++) {
						HashMap<String, Object> hmap = list.get(i);
				%>
            <tr>
               <td class="tableLeft-none"><%=hmap.get("b_no")%></td>
               <td><%=hmap.get("b_title")%></td>
               <td><%=hmap.get("nickname")%></td>
               <td><%=hmap.get("b_date")%></td>
               <td><%=hmap.get("view_count")%></td>
            </tr>
            <% } %>
			</table>
		</div>
			
		<script>
	$(function(){
		$(".tableListArea td").mouseenter(function(){
			$(this).parent().css({"font-weight":"bold", "cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css({"font-weight":"normal", "background":"white"});
		}).click(function(){
			var num = $(this).parent().children().eq(0).text();
            console.log(num);
            location.href="<%=request.getContextPath()%>/selectOne.b2?num=" + num;
		});
	});
	</script>	
			
			<%-- <div class="tableArea">
				<%
					for (int i = 0; i < list.size(); i++) {
						HashMap<String, Object> hmap = list.get(i);
				%>
				<div class="thumb-List">
					<div>
						<input type="hidden" value="<%=hmap.get("b_no")%>"> 
						<img src="/pj/thumbnail_uploadFiles/<%=hmap.get("change_name")%>" width="170px" height="170px">
					</div>
					<p class="boardListFont">
						No.
						<%=hmap.get("b_no")%> &nbsp;
						<span class="boardListTitle"><%=hmap.get("b_title")%></span>
						<br> 조회수 :
						<%=hmap.get("view_count")%>
						<br><%=hmap.get("nickname")%>
					</p>
				</div>
				<%
					}
				%>

			</div> --%>
			
			
			<%-- <script>
			$(function(){
				$(".thumb-List").click(function(){
					var num = $(this).children().children().eq(0).val()
					console.log(num);
					
					location.href="<%=request.getContextPath()%>/selectOne.b2?num=" + num;
					});
				});
			</script> --%>
			
			

		<%-- 페이지 처리 --%>
		<div class="pagingArea" align="center">

			<% if(currentPage <= 1){ %>
			
			<% }else{ %>
			<a href="<%= request.getContextPath()%>/selectAllList.b2?currentPage=<%=currentPage -1 %>"> < </a>
			<% } %>
			
			<%for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
			%>
					<a><%= p %></a>	
			<%		}else{ %>
					<a href="<%= request.getContextPath() %>/selectAllList.b2?currentPage=<%=p %>"><%= p %></a>
			<%		}%>
			<%} %>
						
			<% if(currentPage >= maxPage){ %>
			<a> > </a>
			<% }else{ %>
			<a href="<%= request.getContextPath()%>/selectAllList.b2?currentPage=<%=currentPage +1 %>"> > </a>
			<% } %>
			
		</div>

		<div class="writeBtnArea">
			<hr class="hr">
			<%
				if (loginUser != null) {
			%>
			<button class="btn btn-default"
				onclick="location.href='/pj/views/community/board2/board2_insert.jsp'">글쓰기</button>
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