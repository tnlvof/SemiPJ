<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.pj.support.model.vo.*, com.kh.pj.board.model.vo.*" %>
<% ArrayList<Support> list = (ArrayList<Support>)request.getAttribute("list");
   PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage(); %> 
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
<link rel="stylesheet" href="/pj/css/support.css">
<title>앞날이 창창</title>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<%@ include file="/views/common/supportSidebar.jsp"%>
	<div class="supportContainer">
		<div class="supportHeader">
			<h2>FAQ</h2>
		</div>
		<div>
		</div>
		<div class="tableArea">
		<p><%= currentPage %> / <%= maxPage %></p>
			<table align="center">
				<tr>
					<th width="100px">번호</th>
					<th width="550px">제목</th>
					<th width="100px">조회수</th>
				</tr>
				<% for(Support s : list){ %>
            <tr>
               <td><%= s.getbNo() %></td>
               <td><%= s.getbTitle() %></td>
               <td><%= s.getvCount() %></td>
            </tr>
            <% } %>
			</table>
		</div>
		
		<%-- 페이지 처리 --%>
		<div class="pagingArea" align="center">
		<button onclick="location.href='<%= request.getContextPath() %>/selectFaq.sp?currentPage=1'"><<</button>
		<% if(currentPage <= 1){ %>
		<button disabled><</button>
		<% } else{ %>
		<button onclick="location.href='<%= request.getContextPath() %>/selectFaq.sp?currentPage=<%= currentPage - 1 %>'"><</button>
		<% } %>
		
		<% for(int p = startPage; p <= endPage; p++){ 
		        if(p == currentPage){ %>
		        <button disabled style="font-weight:bold"><%= p %></button>
		     <% } else{ %>
		     <button onclick="location.href='<%= request.getContextPath() %>/selectFaq.sp?currentPage=<%= p %>'"><%= p %></button>
		     <% } %>
		<% } %>
		
		<% if(currentPage >= maxPage){ %>
		<button disabled>></button>
		<% } else{ %>
		<button onclick="location.href='<%= request.getContextPath() %>/selectFaq.sp?currentPage=<%= currentPage + 1 %>'">></button>
		<% } %>
		<button onclick="location.href=' <%= request.getContextPath() %>/selectFaq.sp?currentPage=<%= maxPage %>'">>></button>
		</div>
		
		<div class="searchArea" align="center">
			<input type="search" name="searchValue">
			<button type="button" class="boardBtn"><span class="glyphicon glyphicon-search"></span></button>
			<%
				if (loginUser != null && loginUser.getMemberId().equals("admin")) {
			%>
			<button
				onclick="location.href='/pj/views/support/faq/faqInsertForm.jsp'"
				class="boardBtn writeBtn">글쓰기</button>
			<% } %>
		</div>
	</div>
	</div>	
	<script>
	$(function(){
		$(".tableArea td").mouseenter(function(){
			$(this).parent().css({"background":"lightgray", "cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css("background","white");
		}).click(function(){
			var num = $(this).parent().children().eq(0).text();
            console.log(num);
            location.href="<%=request.getContextPath()%>/selectOneFaq.sp?num=" + num;
		});
	});
	</script>
		
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>