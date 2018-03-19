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
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<%@ include file="/views/common/supportSidebar.jsp"%>
	<div class="supportContainer">
		<div class="supportHeader">
			<h2>Q&A</h2>
		</div>
		<div class="tableArea-detail">
			<table align="center">
				<tr>
					<th scope="row">작성일</th>
					<td colspan="2"><span><%=s.getbDate()%></span></td>
					<th scope="row">조회수</th>
					<td colspan="1"><span><%=s.getvCount()%></span></td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="4"><span><%=s.getbTitle()%></span></td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td colspan="4"><span><%=s.getbWriter()%></span></td>
				</tr>
				<tr>
					<td colspan="5" class="textBox">
					<div class="textDiv">
						<p id="content"><%=s.getbText()%>
						</p>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div align="center" class="support-btn">
			<button
				onclick="location.href='<%=request.getContextPath()%>/selectQna.sp'">목록보기</button>
			<%
				if (loginUser != null && loginUser.getMemberId().equals("admin") || loginUser.getNickName().equals(s.getbWriter())) {
			%>
			<button onclick="location.href='<%= request.getContextPath() %>/selectUpdateQna.sp?num=<%= s.getbNo() %>'">수정</button>
			<button onclick="deleteQna();">삭제</button>
			<%
				}
			%>
		</div>
	</div>
	</div>
	<script>
	function deleteQna(){
		var result = confirm('정말 삭제하시겠습니까?'); 
		if(result) { 
			location.href="<%= request.getContextPath() %>/deleteQna.sp?bno=<%= s.getbNo()%>";
		}
	}
	</script>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>