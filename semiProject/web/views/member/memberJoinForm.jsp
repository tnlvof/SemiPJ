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
				<span class="ico-join ico-paging"> <i class="fa fa-circle"></i>
					<i class="fa fa-circle on"></i> <i class="fa fa-circle"></i>
				</span>
			</div>
			<div class="wrap-title">
				<h3 class="title-join">가입 정보 입력</h3>
				<div class="text-join">
					로그인 정보 및 가입 정보를 입력하세요.
				</div>
			</div>
			<form id="joinForm" action="<%= request.getContextPath()%>/insertMember.me" method="post">
			<table align="center" class="join-table">
				<tr>
					<th width="200px"><span class="glyphicon glyphicon-asterisk"></span> 아이디</th>
					<td><input type="text" maxlength="13" name="memberId" id="memberId"></td>
					<td><div id="idCheck">중복확인</div></td>
				</tr>
				<tr>
					<th><span class="glyphicon glyphicon-asterisk"></span> 비밀번호</th>
					<td><input type="password" maxlength="13" name="memberPwd"></td>
					<td></td>
				</tr>
				<tr>
					<th><span class="glyphicon glyphicon-asterisk"></span> 비밀번호 확인</th>
					<td><input type="password" maxlength="13" name="memberPwd2"></td>
					<td><label id="pwdResult"></label></td>
				</tr>
				<tr>
					<th><span class="glyphicon glyphicon-asterisk"></span> 이름</th>
					<td><input type="text" maxlength="13" name="memberName"></td>
					<td><label id="pwdResult"></label></td>
				</tr>
				<tr>
					<th><span class="glyphicon glyphicon-asterisk"></span> 닉네임</th>
					<td><input type="text" maxlength="5" name="nickName"></td>
					<td><label id="nnResult"></label></td>
				</tr>
				<tr>
					<th><span class="glyphicon glyphicon-asterisk"></span> 생년월일 <span style="font-size:11px;">ex) 950716</span></th>
					<td><input type="text" maxlength="13" name="birthday"></td>
					<td><label id="pwdResult"></label></td>
				</tr>
				<tr>
					<th class="table-indent">연락처</th>
					<td>
						<input type="text" maxlength="3" name="tel1" size="2"> -
						<input type="text" maxlength="4" name="tel2" size="2"> -
						<input type="text" maxlength="4" name="tel3" size="2">
					</td>				
				</tr>
				<tr>
					<th class="table-indent">이메일</th>
					<td><input type="email" name="email"></td>
					<td></td>
				</tr>
				<!-- <tr>
					<td>우편번호</td>
					<td><input type="text" name="zipCode"></td>
					<td><div id="ckZip">검색</div></td>
				</tr> -->
				<tr>
					<th class="table-indent">주소</th>
					<td><input type="text" name="address1"></td>
					<td></td>
				</tr>
				<tr>
					<th class="table-indent">상세주소</th>
					<td><input type="text" name="address2"></td>
					<td></td>
				</tr>
				<!-- <tr>
					<td>관심분야</td>
					<td>
						<input type="checkbox" id="sports" name="interest" value="운동"><label for="sports">운동</label>
						<input type="checkbox" id="climbing" name="interest" value="등산"><label for="climbing">등산</label>
						<input type="checkbox" id="fishing" name="interest" value="낚시"><label for="fishing">낚시</label>
						<input type="checkbox" id="cooking" name="interest" value="요리"><label for="cooking">요리</label>
						<input type="checkbox" id="game" name="interest" value="게임"><label for="game">게임</label>
						<input type="checkbox" id="etc" name="interest" value="기타"><label for="etc">기타</label>
					</td>
					<td></td>
				</tr> -->
			</table>

			<div class="wrap-btns">
						<button type="button" class="link_back" onclick="location.href='/pj/views/member/memberJoinAgreement.jsp'">
							<span class="ico_join"></span>◀ 이전으로
						</button>
						<button type="button" id="nextBtn"
							class="btn_comm btn_type1 disabled" onclick="insertMember();">다음단계</button>
			</div>
		</form>
		</div>
	</div>
	<script>
				function insertMember(){
					$("#joinForm").submit();
				}
				function goMain(){
					location.href="<%= request.getContextPath() %>/index.jsp";				
				}				
				$(function(){
					$("#idCheck").click(function(){
						var memberId = $("#memberId").val();
						console.log(memberId);
						
						$.ajax({
							url:"/pj/idCheck.me",
							type:"post",
							data:{"memberId":memberId},
							
							success:function(data){
								console.log(data);
								if(data == "fail"){
									alert("아이디가 중복됩니다.");
								}else{
									alert("사용 가능합니다.");
								}
							},
							
							error:function(msg){
								alert(msg);
							}
						});
					});
				});
			</script>	
</body>
</html>