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
		<h2 align="center">ADMIN PAGE - 회원정보 검색</h2>
		<hr>
		<button id="m_AllSelect_btn" onclick="memberSelectAll();">전체
			회원조회</button>
		<div style="margin-top: -20px;" align="right">
			<select id=searchcon>
				<option value="nick">닉네임</option>
				<option value="id">아이디</option>
				<option value="name">이름</option>
			</select> <input type="text" id=searchval>
			<button onclick="memberSearch();">검색</button>
		</div>

		<hr>
		<table id=member_table class="table table-bordered">
			<tr>
				<th width="75px">회원번호</th>
				<th>회원아이디</th>
				<!--<th>비밀번호</th>  -->
				<th width=75px>이름</th>
				<th width=75px>생년월일</th>
				<th>연락처</th>
				<th>주소</th>
				<th width=75px>회원분류</th>
				<!--<th>사업체명</th>  -->
				<!--<th>업종</th>  -->
				<!--<th>사업자번호</th>  -->
				<!--<th>사업체주소</th> -->
				<!--<th>사업체연락처</th>  -->
				<th>닉네임</th>
				<th>가입일</th>
				<th width=75px>회원상태</th>
				<th>이메일</th>
				<th>선택</th>
			</tr>
			<tbody id=addData>
			</tbody>
		</table>
		<hr>
		<button onclick="memberWithdraw();">탈퇴</button>
		<hr>
	</div>

	<script type="text/javascript">
	var members = [];	
	function memberSelectAll() {
			var table = document.getElementById("addData");

			$.ajax({
				url : "<%= request.getContextPath() %>/mselect.al",
				type : "get",
				data : {
					data : "test"
				},
				success : function(data) {
					console.log("success");
					console.log(data);
					var tr = document.createElement("tr");
					var td = $("<td></td>");
					table.innerHTML = "";
					var member_arr = [];
					for (var i = 0; i < data.length; i++) {
						member_arr[0] = data[i].memberNo;
						member_arr[1] = data[i].memberId;
						//member_arr[2]=data[i].memberPwd;
						member_arr[3] = data[i].memberName;
						member_arr[4] = data[i].birth;
						member_arr[5] = data[i].phone;
						member_arr[6] = data[i].address;
						member_arr[7] = data[i].memberCategory;
						member_arr[8]=data[i].company;
						member_arr[9]=data[i].companyCategory;
						member_arr[10]=data[i].companyNo;
						member_arr[11]=data[i].companyAddress;
						member_arr[12]=data[i].companyPhone;
						member_arr[13] = data[i].nickName;
						member_arr[14] = data[i].enrollDate;
						member_arr[15] = data[i].status;
						member_arr[16] = data[i].email;
						members[i] = member_arr;
						console.log(member_arr);
						console.log(member_arr.length);
						console.log(members.length);
						table.innerHTML += "<tr><td>" + member_arr[0] + "</td>"
								+ "<td>" + member_arr[1] + "</td>" +
								//"<td>"+member_arr[2]+"</td>"+
								"<td>" + member_arr[3] + "</td>" + "<td>"
								+ member_arr[4] + "</td>" + "<td>"
								+ member_arr[5] + "</td>" + "<td>"
								+ member_arr[6] + "</td>" + "<td>"
								+ member_arr[7] + "</td>" +
								//"<td>"+member_arr[8]+"</td>"+
								//"<td>"+member_arr[9]+"</td>"+
								//"<td>"+member_arr[10]+"</td>"+
								//"<td>"+member_arr[11]+"</td>"+
								//"<td>"+member_arr[12]+"</td>"+
								"<td>" + member_arr[13] + "</td>" + "<td>"
								+ member_arr[14] + "</td>" + "<td>"
								+ member_arr[15] + "</td>" + "<td>"
								+ member_arr[16] + "</td>" + "<td>"
								+ "<button onclick='memberWithdraw(\""+member_arr[1]+"\");'>탈퇴</button> "
								+ "<button onclick='memberReturn(\""+member_arr[1]+"\");'>복구</button> "
								+"</td></tr>"
					}

				},
				error : function() {
					console.log("fail");

				}
			});
		}
		function memberSearch() {
			var searchval = $("#searchval").val();
			var searchcon = $("#searchcon").val();
			var table = document.getElementById("addData");
			console.log(searchval, searchcon);
			$.ajax({
				url : "<%= request.getContextPath() %>/msearch.al",
				type : "get",
				data : {
					searchval : searchval,
					searchcon : searchcon
				},
				success : function(data) {
					console.log("success");
					console.log(data);
					var tr = document.createElement("tr");
					var td = $("<td></td>");
					table.innerHTML = "";
					var member_arr = [];

					for (var i = 0; i < data.length; i++) {
						member_arr[0] = data[i].memberNo;
						member_arr[1] = data[i].memberId;
						member_arr[2]=data[i].memberPwd;
						member_arr[3] = data[i].memberName;
						member_arr[4] = data[i].birth;
						member_arr[5] = data[i].phone;
						member_arr[6] = data[i].address;
						member_arr[7] = data[i].memberCategory;
						member_arr[8]=data[i].company;
						member_arr[9]=data[i].companyCategory;
						member_arr[10]=data[i].companyNo;
						member_arr[11]=data[i].companyAddress;
						member_arr[12]=data[i].companyPhone;
						member_arr[13] = data[i].nickName;
						member_arr[14] = data[i].enrollDate;
						member_arr[15] = data[i].status;
						member_arr[16] = data[i].email;
						members[i] = member_arr;
						console.log(member_arr);
						console.log(member_arr.length);
						console.log(members.length);
						table.innerHTML += "<tr><td>" + member_arr[0] + "</td>"
								+ "<td>" + member_arr[1] + "</td>" +
								//"<td>"+member_arr[2]+"</td>"+
								"<td>" + member_arr[3] + "</td>" + "<td>"
								+ member_arr[4] + "</td>" + "<td>"
								+ member_arr[5] + "</td>" + "<td>"
								+ member_arr[6] + "</td>" + "<td>"
								+ member_arr[7] + "</td>" +
								//"<td>"+member_arr[8]+"</td>"+
								//"<td>"+member_arr[9]+"</td>"+
								//"<td>"+member_arr[10]+"</td>"+
								//"<td>"+member_arr[11]+"</td>"+
								//"<td>"+member_arr[12]+"</td>"+
								"<td>" + member_arr[13] + "</td>" + "<td>"
								+ member_arr[14] + "</td>" + "<td>"
								+ member_arr[15] + "</td>" + "<td>"
								+ member_arr[16] + "</td>" + "<td>"
								+ "<button onclick='memberWithdraw(\""+member_arr[1]+"\");'>탈퇴</button> "
								+ "<button onclick='memberReturn(\""+member_arr[1]+"\");'>복구</button> "
								+"</td></tr>"
					}

					

				},
				error : function() {

				}
			});
		}
		function memberWithdraw(memberID){
			console.log(memberID);
			$.ajax({
				url:"<%= request.getContextPath() %>/mwithdraw.one",
				data:{
					memberID:memberID
				},
				type:"get",
				success:function(){
					alert(memberID+"탈퇴처리 완료");
					location.reload();
				},
				error : function() {

				}
			});
		}
		function memberReturn(memberID){
			console.log(memberID);
			$.ajax({
				url:"<%= request.getContextPath() %>/mreturn.one",
				data:{
					memberID:memberID
				},
				type:"get",
				success:function(){
					alert(memberID+"복구처리 완료");
					location.reload();
				},
				error : function() {

				}
			});
		}
	</script>
</body>
</html>