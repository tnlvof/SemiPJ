<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.pj.board.model.vo.*, java.util.*"%>
<%
	Board b = (Board) request.getAttribute("b");
	ArrayList<Board> replyList = (ArrayList<Board>) request.getAttribute("replyList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <link rel="stylesheet" href="/pj/css/support.css">
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
	    max-height: 1000px;
}
.replyArea{
	background:#f7f7f7;
	margin-left:30px;
}
#replySelectArea{
	width:100%;
	min-height:100px;
}
.replyWriteArea  table  tr  td{
	vertical-align:middle;
	text-align:center;
}
.replyWriteArea  table  tr  td textarea{
	resize:none;
}
.replyWriteArea{
	margin-top:30px;
	margin-bottom:50px;
}
#replySelectTable tr td{
	vertical-align:middle;
	height:50px;
	border-bottom:1px solid white;
}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>

	<div class="div1">
		
		<%@ include file="/views/common/communitySidebar.jsp"%>
		<div class="outer">
			
			<div class="supportHeader">
			<h2>광고 게시판</h2>
		</div>
		<div class="tableArea-detail">
			<table align="center">
				<tr>
					<th scope="row">작성일</th>
					<td colspan="2"><span><%=b.getbDate()%></span></td>
					<th scope="row">조회수</th>
					<td colspan="1"><span><%=b.getvCount()%></span></td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="4"><span><%=b.getbTitle()%></span></td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td colspan="4"><span><%=b.getbWriter()%></span></td>
				</tr>
				<tr>
					<td colspan="5" align="center" style="border-left:1px solid white;">
					<%-- <img id="titleImg"
						src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=titleImg.getChangeName()%>">
					</td> --%>
				</tr>
				<tr>
					<td colspan="5" class="textBox">
					<div class="textDiv">
						<p id="content"><%=b.getbText()%>
						</p>
						</div>
					</td>
				</tr>
				</table>
		</div>
			<div class="replyArea">
				<div id="replySelectArea" align="center">
					<table id="replySelectTable" border="1" align="center">
					<%for(int i=0; i < replyList.size();i++ ){ %>
						<tr>
							<td width="150px" style="font-weight:600;text-align:center;"><%= replyList.get(i).getbWriter() %></td>
							<td width="350px" style="padding-left:20px;text-align:left;"><%= replyList.get(i).getbText() %></td>
							<td width="200px" style="text-align:center;"><%= replyList.get(i).getbDate() %></td>
						</tr>
					<% } %>
					</table>
				</div>
				
				<div class="replyWriteArea">
					<table align="center">
						<tr>
							<td width="100">댓글 작성</td>
							<td width="450">
								<textarea rows="3" cols="60" id="replyContent"></textarea>
							</td>
							<td>
								<button class="submitBtn" id="addReply">댓글 등록</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
			
			<script>
		$(function() {
			$("#addReply").click(
				function() {
					var writer = <%=loginUser.getMemberNo()%>;
					var bid = <%= b.getbId() %>;
					var content = $("#replyContent").val();
				
					console.log(writer);
					console.log(bid);
					console.log(content);
					$.ajax({
						url:"/pj/insertReply.b1",
						data:{writer:writer, content:content , bid:bid},
						type:"post",
						success:function(data){
							//console.log(data)
							var $replySelectTable =$("#replySelectTable");
							$replySelectTable.html('');
							
						for(var key in data){
							var $tr = $("<tr>");
							var $writerTd = $("<td>").text(data[key].bWriter).css({"width":"150px","height":"50px","vertical-align":"middle","text-align":"center","font-weight":"600","border-bottom":"1px solid white"});
							var $contentTd = $("<td>").text(data[key].bText).css({"width":"350px","vertical-align":"middle","border-bottom":"1px solid white","padding-left":"20px"});
							var $dateTd = $("<td>").text(data[key].bDate).css({"width":"200px","vertical-align":"middle","text-align":"center","border-bottom":"1px solid white"});
							
							$tr.append($writerTd);
							$tr.append($contentTd);
							$tr.append($dateTd);
							$replySelectTable.append($tr);
						};
					},
					error:function(data){
						alert(msg);
					}
				});
				
				$("#replyContent").val('');
			});
		});
	</script>
			
			
			<div class="btnArea" align="center">
					<button type="button" class="submitBtn" 
						onclick="location.href='<%= request.getContextPath() %>/selectUpdate.b2?num=<%= b.getbNo()%>'">수정</button>
					<button type="button" class="submitBtn"
						onclick="deleteBoard();">삭제</button>
						<script>
							function deleteBoard(){
								var result = confirm('정말 삭제하시겠습니까?'); 
								if(result) { 
									location.href="<%= request.getContextPath() %>/delete.b2?num=<%= b.getbNo()%>";
								} else { 

								}
							}
						</script>
					<button type="button" class="submitBtn"
						onclick="location.href='<%= request.getContextPath() %>/selectAllList.b2'">목록</button>
			</div>
		</div>
	</div>


	<%@ include file="/views/common/footer.jsp"%>

</body>
</html>