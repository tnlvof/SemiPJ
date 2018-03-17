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
.enterPassowrd{
width:400px;
height:200px;
margin: 0 auto;
border:1px solid lightgray;
text-align:center;
padding:50px;
margin-top:50px;
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
		<form method="post" name="checkForm" onSubmit="return check()">
			<div class="enterPassowrd">
				<p>비밀번호를 입력하세요.</p>
				<br> <input type="password" id="password" name="password">
				<button type="submit" onclick="checkPassword();">확인</button>
				<button type="reset"
					onclick="location.href='<%=request.getContextPath()%>/selectQna.sp'">취소</button>
			</div>
		</form>
	</div>
	</div>
	<script>
	function check() {
		if(document.checkForm.password.value==''){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
	}
	
	function checkPassword(){
		<%
		if (s.getbPassword().equals("password")) {
		%>
			location.href="<%=request.getContextPath()%>/selectOneQna.sp?num="+ num;
	<%} else {%>
		alert("비밀번호가 잘못되었습니다.");
			return false;
	<%}%>
	}
	</script>	
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>