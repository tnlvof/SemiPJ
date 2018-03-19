<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.pj.support.model.vo.*, com.kh.pj.board.model.vo.*"%>
<%
	Support s = (Support) request.getAttribute("s");
    ArrayList<Support> replyList = (ArrayList<Support>) request.getAttribute("replyList");
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

.submitBtn{
text-align:right;
} 

.replyWriteArea textarea{
margin-left:30px;
}

.replyWriteArea{
   margin-top:30px;
   margin-bottom:30px;
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

		<div class="replyArea" align="center">
		<div id="replySelectArea">
				<table id="replySelectTable" border="1" align="center">
				<% for(int i = 0; i < replyList.size(); i++){ %>
					<tr>
						<td width="100px" style="font-weight:600; text-align:center;"><%= replyList.get(i).getbWriter() %></td>
						<td width="300px" style="padding-left:20px; text-align:left;"><%= replyList.get(i).getbText() %></td>
						<td width="150px" style="text-align:center;"><%= replyList.get(i).getbDate() %></td>
					</tr>
					<% } %>
				</table>
			</div>
		<%
				if (loginUser != null && loginUser.getMemberId().equals("admin")) {
			%>
		<div class="replyWriteArea">
			<table align="center">
				<tr>
					<td colspan="4">
					<textarea rows="3" cols="80" id="replyContent"></textarea>
					</td>
					<td colspan="1"><button class="submitBtn" id="addReply">등록</button></td>
				</tr>
			</table>
		</div>
		<% } %>
	</div>
		
	</div>
	</div>
	<script>
	$(function() {
        $("#addReply").click(
           function() {
              var writer = <%=loginUser.getMemberNo()%>;
              var bid = <%= s.getbId() %>;
              var content = $("#replyContent").val();
           
              console.log(writer);
              console.log(bid);
              console.log(content);
              $.ajax({
                 url:"/pj/insertReply.sp",
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
