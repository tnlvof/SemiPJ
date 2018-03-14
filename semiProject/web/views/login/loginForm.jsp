<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/pj/css/common.css">
<link rel="stylesheet" href="/pj/css/reset.css">
<link rel="shortcut icon" href="/pj/images/slogo.png">
<title>앞날이 창창</title>
<style type="text/css">
.loginArea {
   width: 1200px;
   margin: 0 auto;
}

.loginFormArea {
   width: 400px;
   margin: 50px auto 0 auto;
}

.loginFormArea label {
   display: inline-block;
   width: 130px;
}

.loginFormArea input {
   border: 1px solid #d7d7d7;
   padding: 5px;
   margin-bottom: 10px;
   width: 250px;
}

.loginFormArea li {
   text-align: right;
   margin-top: 10px;
   font-weight : bold;
   font-size : large;
   
}

.loginFormArea #loginBtn,
.loginFormArea #searchingBtn {
   border: 0;
   background: navy;
   color: #fff;
   width: 260px;
   height: initial;
   padding: 10px;
   cursor: pointer;   
   margin-right: 2px;
   border-radius: 3px;
}

.loginFormArea #searchingBtn {
   border: 0;
   background: gray;
   color: #fff;
   width: 260px;
   height: initial;
   padding : 10px;
   cursor: pointer;
   margin-right: auto;
   margin-left: auto;
   border-radius: 3px;
   
}

#join{
   border: 0;
   background: gray;
   color: #fff;
   width: 260px;
   height: initial;
   padding : 10px;
   cursor: pointer;
   margin-right: auto;
   margin-left: auto;
   border-radius: 3px;
}

   .find-id-pass{
      margin : 225px;
      font-size : small;     
      
   }
   
   .member-footer{
   align:center;
   margin:0 auto;   
   }
</style>
</head>
<body>

   <%@ include file="/views/common/menubar.jsp"%>
   <br><br>
   <div class="loginArea">
      <form id="loginForm1" action="<%=request.getContextPath()%>/login.me"
         method="post">
         <ul class="loginFormArea">
         
         <br><br><br>
         
            <li><label class="text" align="center">ID</label> 
            <input type="text" name="memberId" placeholder="아이디"></li>
            <li><label class="text" align="center">PASSWORD</label> 
            <input type="password" name="memberPwd" placeholder="비밀번호"></li>
            <a href="searchingIdpwd.jsp" class="find-id-pass">아이디(이메일)/비밀번호 찾기
                </a>
            <li><button id="loginBtn" onclick="login();" align="center">로그인</button></li>
                        <hr>
            <li><button type="button"  id="join" onclick="location.href='/pj/views/member/memberJoinForm.jsp'">회원가입</button></li>
            
            <!--<li><button type="button" id="searchingBtn" onclick="location.href='/pj/views/login/searchingIdpwd.jsp'">ID / PASSWORD 찾기</button>-->
            
               <!-- <button type="button" id="searchingBtn" onclick="location.href='/pj/views/login/searchingPwd.jsp'">PASSWORD 찾기</button> -->
            </li>
         </ul>
      </form>
      <script>
         function login() {
            $('#loginForm1').submit();
         }
         
      </script>
   </div>
      <%@ include file="/views/common/footer.jsp" %>   
</body>
</html>