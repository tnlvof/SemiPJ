<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="shortcut icon" href="/pj/images/slogo.png">
<link rel="stylesheet" href="/pj/css/common.css">
<link rel="stylesheet" href="/pj/css/reset.css">
<link rel="stylesheet" href="/pj/css/memberJoin.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>앞날이 창창</title>
</head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="join-wrap">
		<div class="join-head">
			<div class="agreementHeader" style="height:156px;"> 
				<a class="ico-join"><img src="/pj/images/llogo.png"
					class="join-logo"></a>
			</div>
		</div>
		<div class="join-body">
			<div class="paging-step">
				<span class="ico-join ico-paging"> <i class="fa fa-circle"> </i> <i class="fa fa-circle"></i>
					<i class="fa fa-circle on"></i>
				</span>
			</div>
			<div class="checkImg">
			<img src="/pj/images/check.png">
			</div>
			<div class="wrap-title">
				<h3 class="title-join">회원가입이 성공적으로 완료되었습니다!</h3>
				<div class="text-join">알차고 실속있는 서비스로 찾아뵙겠습니다.
				</div>
			</div>
			<div class="wrap-btns" style="padding-top:100px;">
			<div class="wrap-btns2">
				<button type="button" id="nextBtn"
					class="btn_comm2 btn_type1 disabled"
					onclick="location.href='/pj/index.jsp'">확인</button>
				<button type="button" id="nextBtn"
					class="btn_comm3 btn_type2 disabled"
					onclick="location.href='/pj/views/login/loginForm.jsp'">로그인</button>
					</div>
			</div>
		</div>
	</div>
</body>
</html>