<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.pj.support.model.vo.*, com.kh.pj.board.model.vo.*"%>
<%
	Support s = (Support) request.getAttribute("s");
%> 

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
<style>
.formArea td {
	vertical-align: middle;
}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<%@ include file="/views/common/supportSidebar.jsp"%>
	<div class="supportContainer">
		<br>
		<h2 align="center">게시판 상세보기</h2>
		<div class="tableArea">
			<table align="center" width="728px">
				<tr>
					<td colspan="1">제목</td>
					<td colspan="5"><span><%=s.getbTitle()%></span></td>
				</tr>
				<tr>
					<td>작성자</td> 
					<td><span><%=s.getbWriter()%></span></td>
					<td>조회수</td>
					<td><span><%=s.getvCount()%></span></td>
					<td>작성일</td>
					<td><span><%=s.getbDate()%></span></td>
				</tr>
				<!-- <tr>
					<td colspan="6">내용</td>
				</tr> -->
				<tr>
					<td colspan="6">
						<p id="content"><%=s.getbText()%>
						</p>
					</td>
				</tr>
			</table>
			<div align="center">
			<button
				onclick="location.href='<%=request.getContextPath()%>/select.sp'">메뉴로
				돌아가기</button>
			<%
				if (loginUser != null && loginUser.getMemberId().equals("admin")) {
			%>
			<button onclick="location.href='<%= request.getContextPath() %>/selectNotice.sp?num=<%= s.getbNo() %>'">수정하기</button>
			<%
				}
			%>
		</div>
		</div>
	</div>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>