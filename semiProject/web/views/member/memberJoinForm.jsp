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
					<td><input type="password" maxlength="13" name="memberPwd" id="memberPwd"></td>
					<td></td>
				</tr>
				<tr>
					<th><span class="glyphicon glyphicon-asterisk"></span> 비밀번호 확인</th>
					<td><input type="password" maxlength="13" name="memberPwd2" id="memberPwd2"></td>
					<td><label id="pwdResult"></label></td>
				</tr>
				<tr>
					<th><span class="glyphicon glyphicon-asterisk"></span> 이름</th>
					<td><input type="text" maxlength="13" name="memberName" id="memberName"></td>
					<td><label id="pwdResult"></label></td>
				</tr>
				<tr>
					<th><span class="glyphicon glyphicon-asterisk"></span> 닉네임</th>
					<td><input type="text" maxlength="5" name="nickName" id="nickName"></td>
					<td><label id="nnResult"></label></td>
				</tr>
				<tr>
					<th><span class="glyphicon glyphicon-asterisk"></span> 생년월일 <span style="font-size:11px;">ex) 950716</span></th>
					<td><input type="text" maxlength="13" name="birthday" id="birthday"></td>
					<td><label id="pwdResult"></label></td>
				</tr>
				<tr>
					<th><span class="glyphicon glyphicon-asterisk"></span> 연락처</th>
					<td>
						<input type="text" maxlength="3" name="tel1" class="tel" id="tel1" size="2"> -
						<input type="text" maxlength="4" name="tel2" class="tel" id="tel2" size="2"> -
						<input type="text" maxlength="4" name="tel3" class="tel" id="tel3" size="2">
					</td>				
				</tr>
				<tr>
					<th><span class="glyphicon glyphicon-asterisk"></span> 이메일</th>
					<td><input type="email" name="email" id="email"></td>
					<td><div id="emailCheck">인증번호</div></td>
				</tr>
				<tr>
					<th><span class="glyphicon glyphicon-asterisk"></span> 인증번호입력</th>
					<td><input type="text" name="ecode" id="ecode"></td>
					<td><div id="chemail">확인</div></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" name="zipCode"></td>
					<td><div id="ckZip">검색</div></td>
				</tr>
				<tr>
					<th class="table-indent">주소</th>
					<td><input type="text" name="address1" id="address1"></td>
					<td></td>
				</tr>
				<tr>
					<th class="table-indent">상세주소</th>
					<td><input type="text" name="address2" id="address2"></td>
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
							class="btn_comm btn_type1 disabled" onclick="insertMember();" disabled="true">다음단계</button>
			</div>
		</form>
		</div>
	</div>
	<script>
				function insertMember(){
					//정규화 규칙
					//아이디 검사 : 영문소문자+숫자 4~12자리, 영문소문자로 시작, 숫자 하나이상 포함
					//비밀번호 확인 검사 : 비밀번호와 값이 일치, 영문대소문자+숫자 6~18자리, 숫자 하나이상 포함
					//이름 검사 : 2글자이상, 한글만
					//생년월일 검사:숫자6자리
					//전화번호 검사 : 전화번호 앞자리 2~3자리 숫자, 두번째 자리는 3~4자리 숫자, 세번째자리는 4자리 숫자
					//이메일 검사 : 영어 소문자 시작, 4글자이상 @ 1글자이상 주소.글자1~3개
					var id=$("#memberId");
					var pa=$("#memberPwd");
					var paco=$("#memberPwd2");
					var na=$("#memberName");
					var bi=$("#birthday");
					var tel=$(".tel");
					var em=$("#email");
					
					var idRegExp=/^[a-z][a-z0-9_-]{3,11}$/
					var idRegExp2=/\d/g;
					var paRegExp=/^[A-Za-z0-9_-]{6,18}$/;
					var paRegExp2=/\d/g;
					var naRegExp=/^[가-힝]{2,4}$/
					var biRegExp=/^[0-9]{6}$/g
					var telRegExp=/^\d{2,3}-\d{3,4}-\d{4}$/
					var emRegExp=/^[a-z][a-z0-9_-]{3,11}@([a-z\d\.-]+)\.([a-z\.]{2,6})$/

					if(!(idRegExp.test(id.val()))||!(idRegExp2.test(id.val()))){
						alert("아이디가 잘못 입력되었습니다\n영문소문자+숫자 4~12자리, 영문소문자로 시작, 숫자 하나이상 포함");
						id.select();
						console.log(idRegExp.test(id.val()));
					}else if(!paRegExp.test(pa.val())||!(paRegExp2.test(pa.val()))){
						alert("비밀번호가 잘못 입력되었습니다\n영문대소문자+숫자 6~18자리, 숫자 하나이상 포함");
						pa.select();
					}else if(pa.val()!=paco.val()){
						alert("비밀번호가 일치하지 않습니다");
						pa.select();
					}else if(!naRegExp.test(na.val())){
						alert("이름이 잘못 입력되었습니다\n2글자이상, 한글만");
						na.select();
					}else if(!biRegExp.test(bi.val())){
						alert("생년월일이 잘못 입력되었습니다\n숫자6자리");
						bi.select();
					}else if(!(telRegExp.test(tel.eq(0).val()+'-'+tel.eq(1).val()+'-'+tel.eq(2).val()))){
						alert("전화번호가 잘못 입력되었습니다\n앞자리 2~3자리 숫자, 두번째 자리는 3~4자리 숫자, 세번째자리는 4자리 숫자");
						tel[0].select();
					}else if(!emRegExp.test(em.val())){
						alert("이메일이 잘못 입력되었습니다\n영어 소문자 시작, 4글자이상 @ 1글자이상 주소.글자1~3개");
						em.select();
					}else{						
						$("#joinForm").submit();
					}
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
				$(function(){
						<% String Rpw[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0",
								"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P",
								"Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
				
							String code = "";
				
							System.out.println(Rpw.length);
				
							for (int i = 0; i < 6; i++) {
								code += Rpw[(int)(Math.random() * 36)];
								System.out.println(code);
							}
							
						%>
				 	$("#emailCheck").click(function(){
						var email = $("#email").val();
						var code = '<%= code %>';
						$.ajax({
							url:"/pj/emailServlet.me",
							type:"post",
							data:{"email":email, "code":code},
							
							success:function(data){
								alert("입력하신 이메일로 인증번호가 발송되었습니다.");
							},
							
							error:function(msg){
								alert(msg);
							}
						});
					});
				});
				
				$(function(){
					$("#chemail").click(function(){
						if($("#ecode").val() == '<%= code %>'){
							alert("인증의 성공하였습니다.");
							$("#nextBtn").attr('disabled', false);
						}else{
							alert("인증번호를 다시 입력해주시기 바랍니다.");
							$("#nextBtn").attr('disabled', true);
						}
					});
				}); <%-- chemail(){
					if($("#ecode").val() == '<%= code %>'){
						alert("인증의 성공하였습니다.");
						$("#nextBtn").attr('disabled', false);
					}else{
						alert("인증번호를 다시 입력해주시기 바랍니다.");
						$("#nextBtn").attr('disabled', true);
					}
					
				} --%>

			</script>	
</body>
</html>