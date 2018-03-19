<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#adminmenubar ul li:hover {
	background: lightgray;
	font-weight: bold;
}

#addData tr:hover {
	background: white;
}

#container {
	width: 80%;
	height: 100%;
	border: 3px solid white;
	margin-top: -393px;
	margin-left: 310px;
}

body {
	background: darkgray;
}
</style>
</head>
<body>
	<%@ include file="adminsidebar.jsp"%>
	<div id=container class="well-lg">
		<h2 align="center">ADMIN PAGE - 게시판 검색</h2>
		<hr>
		<button id="B_AllSelect_btn" onclick="BoardSelectAll();">전체
			게시판조회</button>
		<select id=searchcon>
			<option value="nick">작성자</option>
			<option value="title">제목</option>
			<option value="text">내용</option>
		</select> <input type="text" id=searchval>
		<button onclick="BoardSearch();">검색</button>
		<hr>
		<table id=board_table class="table table-bordered">
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>날짜</th>
				<th>내용</th>
				<th>작성자</th>
				<th>글분류</th>
				<th>조회수</th>
				<th>부모글번호</th>
				<th>채택여부</th>
				<th>활성여부</th>
				<th>글번호</th>
				<th>추천수</th>
				<th>글레벨</th>
				<th>글비밀번호</th>
			</tr>
			<tbody id=addData>
			</tbody>
		</table>
	</div>
	<script type="text/javascript">
	var boards = [];
	var table = document.getElementById("addData");
		function BoardSelectAll() {
			$.ajax({
				url : "<%=request.getContextPath()%>/bselect.al",
				data : {
					data : "test"
				},
				type : "get",
				success : function(data) {
					console.log("ok" + data);
					var board_arr = [];
					table.innerHTML="";
					for (var i = 0; i < data.length; i++) {
						board_arr[0] = data[i].bId;
						board_arr[1] = data[i].bTitle;
						board_arr[2] = data[i].bDate;
						board_arr[3] = data[i].bText;
						board_arr[4] = data[i].bWriter;
						board_arr[5] = data[i].bCategory;
						board_arr[6] = data[i].vCount;
						board_arr[7] = data[i].pNo;
						board_arr[8] = data[i].adopt;
						board_arr[9] = data[i].status;
						board_arr[10] = data[i].bNo;
						board_arr[11] = data[i].recCount;
						board_arr[12] = data[i].refLevel;
						board_arr[13] = data[i].bPassword;
						boards[i] = board_arr;

						table.innerHTML = "<tr><td>" + board_arr[0] + "</td>"
								+ "<td>" + board_arr[1] + "</td>" + "<td>"
								+ board_arr[2] + "</td>" + "<td>"
								+ board_arr[3] + "</td>" + "<td>"
								+ board_arr[4] + "</td>" + "<td>"
								+ board_arr[5] + "</td>" + "<td>"
								+ board_arr[6] + "</td>" + "<td>"
								+ board_arr[7] + "</td>" + "<td>"
								+ board_arr[8] + "</td>" + "<td>"
								+ board_arr[9] + "</td>" + "<td>"
								+ board_arr[10] + "</td>" + "<td>"
								+ board_arr[11] + "</td>" + "<td>"
								+ board_arr[12] + "</td>" + "<td>"
								+ board_arr[13] + "</td>" + "<td>"
								+ "<button onclick='boardRemove(\"" + board_arr[1] + "\");'>삭제</button> "
								+ "<button onclick='boardReturn(\""	+ board_arr[1] + "\");'>복구</button> "
								+ "</td></tr>"
					}
					console.log(boards)
				},
				error : function(data) {
					console.log("error" + data);
				}
			});
		}
		function BoardSearch() {
			var searchval = $("#searchval").val();
			var searchcon = $("#searchcon").val();
			var table = document.getElementById("addData");
			$.ajax({
				url : "<%=request.getContextPath()%>/bselect.al",
				data : {
					searchval : searchval,
					searchcon : searchcon
				},
				type : "get",
				success : function(data) {
					console.log("ok" + data);
					var board_arr = [];
					table.innerHTML = "";
					for (var i = 0; i < data.length; i++) {
						board_arr[0] = data[i].bId;
						board_arr[1] = data[i].bTitle;
						board_arr[2] = data[i].bDate;
						board_arr[3] = data[i].bText;
						board_arr[4] = data[i].bWriter;
						board_arr[5] = data[i].bCategory;
						board_arr[6] = data[i].vCount;
						board_arr[7] = data[i].pNo;
						board_arr[8] = data[i].adopt;
						board_arr[9] = data[i].status;
						board_arr[10] = data[i].bNo;
						board_arr[11] = data[i].recCount;
						board_arr[12] = data[i].refLevel;
						board_arr[13] = data[i].bPassword;
						boards[i] = board_arr;

						table.innerHTML += "<tr><td>" + board_arr[0] + "</td>"
								+ "<td>" + board_arr[1] + "</td>" + "<td>"
								+ board_arr[2] + "</td>" + "<td>"
								+ board_arr[3] + "</td>" + "<td>"
								+ board_arr[4] + "</td>" + "<td>"
								+ board_arr[5] + "</td>" + "<td>"
								+ board_arr[6] + "</td>" + "<td>"
								+ board_arr[7] + "</td>" + "<td>"
								+ board_arr[8] + "</td>" + "<td>"
								+ board_arr[9] + "</td>" + "<td>"
								+ board_arr[10] + "</td>" + "<td>"
								+ board_arr[11] + "</td>" + "<td>"
								+ board_arr[12] + "</td>" + "<td>"
								+ board_arr[13] + "</td>" + "<td>"
								+ "<button onclick='boardRemove(\"" + board_arr[1] + "\");'>삭제</button> "
								+ "<button onclick='boardReturn(\""	+ board_arr[1] + "\");'>복구</button> "
								+ "</td></tr>"
					}
					console.log(boards)
				},
				error : function(data) {
					console.log("error" + data);
				}
			});
		}
		function boardRemove(bTitle) {
			$.ajax({
				url : "<%=request.getContextPath()%>/bremove.one",
				data : {
					bTitle : bTitle
				},
				type : "get",
				success : function(data) {
					alert(bTitle+"삭제처리 완료");
					location.reload();
				},
				error : function() {

				}
			});
		}
		function boardReturn(bTitle) {
			$.ajax({
				url : "<%=request.getContextPath()%>/breturn.one",
				data : {
					bTitle : bTitle
				},
				type : "get",
				success : function(data) {
					alert(bTitle+"복구처리 완료");
					location.reload();
				},
				error : function() {

				}
			});
		}
	</script>
</body>
</html>