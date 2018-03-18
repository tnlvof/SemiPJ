<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.pj.support.model.vo.*, com.kh.pj.board.model.vo.*"%>
<% Support s = (Support)request.getAttribute("s"); 
	
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
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
		<div class="supportHeader">
			<h2>FAQ</h2>
		</div>
		<div class="tableArea-update">
		<form id="updateForm" method="post">
			<table align="center">
				<tr>
					<th scope="row">제목</th>
					<td colspan="4"><input type="text" size="50" name="title"
						value="<%=s.getbTitle()%>"></td>
						<input type="hidden" name="bno" value="<%= s.getbNo()%>">
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td colspan="4"><span><%=s.getbWriter()%></span></td>
				</tr>
					<tr>
						<td colspan="5" class="updateTextBox">
							<div class="summerDiv">
								<textarea id="summernote" name="text"><%=s.getbText()%>
								</textarea>
							</div> <script>
								$(function() {
									$('#summernote').summernote();
								});
							</script>
						</td>
					</tr>
				</table>
			<br>
			<div align="center">
			<button onclick="complet();">작성완료</button>	
			</div>
			</form>
			<script>
			    function complet(){
			    	$("#updateForm").attr("action", "<%= request.getContextPath() %>/updateFaq.sp");
			    }
			</script>
		</div>
	</div>
	</div>
	<% } else{
		request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
		request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
	} %>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>