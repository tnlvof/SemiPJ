<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.pj.board.model.vo.*, java.util.*" %>
<% 
	Board b = (Board)request.getAttribute("b"); 
	ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");
	Attachment titleImg = fileList.get(0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.outer{
		width:1000px;
		height:650px;
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto; 
		margin-top:50px;
	}
	.detail td{
		text-align:center;
		width:1000px;
		border:1px solid white;
	}
	#titleImgArea{
		width:500px;
		height:300px;
		margin-left:auto;
		margin-right:auto;
	}
	#contentArea{
		height:30px;
	}
	.detailImgArea{
		width:250px;
		height:210px;
		margin-left:auto;
		margin-right:auto;
	}
	#titleImg{
		width:500px;
		height:300px;
	}
	.detailImg {
		width: 250px;
		height:180px;
	}
	
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	<div class="outer">
		<table class="detail" align="center">
			<tr>
				<td width="50px" >제목</td>
				<td colspan="5">
					<label><%= b.getbTitle() %></label>
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<label><%= b.getbWriter() %></label>
				</td>
				<td>조회수</td>
				<td>
					<label><%= b.getvCount() %></label>
				</td>
				<td>작성일</td>
				<td>
					<label><%= b.getbDate() %></label>
				</td>
			</tr>
			<tr>
				<td>대표사진</td>
				<td colspan="4">
					<img id="titleImg" src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%=titleImg.getChangeName()%>">
				</td>
				<td>
					<button onclick="location.href='<%=request.getContextPath() %>/download.tn?num=<%= titleImg.getfNo() %>'">다운로드</button>
				</td>
			</tr>
			<tr>
				<td>사진 메모</td>
				<td colspan="6">
					<p id="contentArea"><%= b.getbText() %></p>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>