<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.pj.support.model.vo.*, com.kh.pj.board.model.vo.*"%>
<% Support s = (Support)request.getAttribute("s"); 
	
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
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<%@ include file="/views/common/supportSidebar.jsp"%>
<% if(loginUser != null && loginUser.getMemberId().equals("admin")){ %>
	<div class="supportContainer">
		<br>
		<h2 align="center">Qna 수정</h2>
		<div class="tableArea">
		<form id="updateForm" method="post">
			<table>
				<tr>
					<td>제목</td>
					<td colspan="3"><input type="text" size="50" name="title"
						value="<%=s.getbTitle()%>"></td>
						<input type="hidden" name="bno" value="<%= s.getbNo()%>">
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" value="<%=s.getbWriter()%>" readonly>
					</td>
					<td>작성일</td>
					<td><input type="date" value="<%=s.getbDate()%>"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="4"><textarea name="text" rows="15" cols="60"><%=s.getbText()%></textarea>
					</td>
				</tr>
			</table>
			<br>
			<div align="center">
			<button onclick="complet();">작성완료</button>	
			<button onclick="deleteQna();">삭제하기</button>
			</div>
			</form>
			<script>
			    function complet(){
			    	$("#updateForm").attr("action", "<%= request.getContextPath() %>/updateQna.sp");
			    }
			    
			    function deleteQna(){
			    	$("#updateForm").attr("action", "<%= request.getContextPath() %>/deleteQna.sp");
			    }
			</script>
		</div>
	</div>
	<% } else{
		request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
		request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
	} %>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>