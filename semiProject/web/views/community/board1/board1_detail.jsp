<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.pj.board.model.vo.*, java.util.*"%>
<%
	Board b = (Board) request.getAttribute("b");
	ArrayList<Attachment> fileList = (ArrayList<Attachment>) request.getAttribute("fileList");
	Attachment titleImg = fileList.get(0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>

<style>
.outer {
	float: left;
    overflow: hidden;
    width: 700px;
    margin-left: 20px;
    margin-right: auto;
}

.detail{
	width:100%;
}

.detail td {
	text-align: center;
	border: 1px solid lightgray;
}


#titleImgArea {
	height: 300px;
	margin-left: auto;
	margin-right: auto;
}

#contentArea {
	height: 30px;
}

#titleImg {
	width: 400px;
	height: 300px;
}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>

	<div class="div1">

		<%@ include file="/views/common/communitySidebar.jsp"%>
		<div class="outer">
			<table class="detail" align="center">
				<tr>
					<td colspan="5"><label><%=b.getbTitle()%></label></td>
				</tr>
				<tr>
					<td><label><%=b.getbWriter()%></label></td>
					<td><label><%=b.getvCount()%></label></td>
					<td><label><%=b.getbDate()%></label></td>
				</tr>
				<tr>
					<td colspan="5"><img id="titleImg"
						src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=titleImg.getChangeName()%>">
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<p id="contentArea"><%=b.getbText()%></p>
					</td>
				</tr>
			</table>
			<div class="btnArea" align="center">
					<button type="button" class="submitBtn" 
						onclick="location.href='<%= request.getContextPath() %>/selectUpdate.b1?num=<%= b.getbNo()%>'">수정</button>
					<button type="button" class="submitBtn"
						onclick="deleteBoard();">삭제</button>
						<script>
							function deleteBoard(){
								var result = confirm('정말 삭제하시겠습니까?'); 
								if(result) { 
									location.href="<%= request.getContextPath() %>/delete.b1?num=<%= b.getbNo()%>";
								} else { 

								}

							}
						</script>
					<button type="button" class="submitBtn"
						onclick="location.href='<%= request.getContextPath() %>/selectAllList.b1'">목록</button>
			</div>
		</div>
	</div>


	<%@ include file="/views/common/footer.jsp"%>

</body>
</html>