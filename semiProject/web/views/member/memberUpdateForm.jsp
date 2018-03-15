<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.pj.member.model.vo.*"%>
<% 
   //Member loginUser = (Member)session.getAttribute("loginUser"); 
   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
   .outer{
      width:600px;
      height:500px;
      background:white;
      color:black;
      margin-top:50px;
      margin-left:auto;
      margin-right:auto;
   }
   
   #idCheck, #ckZip, #goMain, #joinBtn{
      background:navy;
      border-radius:5px;
      width:80px;
      height:25px;
      text-align:center;
   }
   
   #idCheck:hover, #ckZip:hover, #goMain:hover, #joinBtn:hover{
      cursor:pointer;
   }
   td{
      text-align:right;
   }
   #ckZip, #joinBtn{
      background:yellowgreen;
   }
   #goMain, #joinBtn{
      display:inline-block;
   }
   
   .name{
      color: navy;
      font-weight: bold;
   }
   
   .withdraw {
      background: navy;
      color: white;
      border: 0;
      cursor:pointer;
      border-radius:12px;
   }
   
   
   .b{
      background: navy;
      color:white;
      border: 0;
      cursor:pointer;
      border-radius:12px;
      
   }
   
   
   .b1{
      background: grey;
      color:white;
      border: 0;
      cursor:pointer;
      border-radius:12px;
      
   }
   
</style>
</head>
<body>
   <%@ include file="/../views/common/menubar.jsp"%>

<div class="outer">
   <h1 align="center" class="name">♥<%=loginUser.getMemberName()%>♥님의 회원정보 수정
    <button onclick="delectMember();" class="withdraw">회원탈퇴</button></h1><br>
      <form action="<%=request.getContextPath()%>/changeInfo.me" method="post">
            <input type="hidden" value="<%= loginUser.getMemberNo() %>" name="memberNo">
         <div class="table">
            <table align="center">
            <tr>
               <td width="200px">아이디</td>
               <td><input type="text" maxlength="13" name="memberId" value="<%= loginUser.getMemberId() %>" readonly></td>  
            </tr>
            <br>
            <tr>
               <td><label>이름</label></td>
               <td><input type="text" maxlength="13" name="memberName" value="<%= loginUser.getMemberName() %>" readonly></td>
            </tr>
            <tr>
               <td>닉네임</td>
               <td><input type="text" maxlength="5" name="nickName" value="<%= loginUser.getNickName()%>"></td>
               <td><label id="nnResult"></label></td>
            </tr>
            <tr>
               <td>* 생년월일((ex)180502)</td>
               <td><input type="text" maxlength="13" name="birthday" value="<%= loginUser.getBirth() %>" readonly></td>
            </tr>
            <tr>
               <td><label>이메일</label></td>
               <td><input type="email" name="email" value="<%= loginUser.getEmail() %>"></td>
            </tr>
            <tr>
               <td><label>전화번호</label></td>
               <% String phone[] = loginUser.getPhone().split("-"); 
                  for(int i = 0; i < phone.length; i++){
                     //System.out.println(phone[i]);
                  }
               
               %>
               <td>
                  <input type="text" maxlength="3" name="tel1" size="2" value="<%= phone[0] %>">-
                  <input type="text" maxlength="4" name="tel2" size="2" value="<%= phone[1] %>">-
                  <input type="text" maxlength="4" name="tel3" size="2" value="<%= phone[2] %>">
               </td>      
            </tr>
            <tr>
               <td>주소</td>
               <%
                  String address[] = loginUser.getAddress().split(",");
                  for(int i = 0; i < address.length; i++){
                     
                  }
               %>
               <td><input type="text" name="address1" value="<%= address[0] %>"></td>
               <td></td>
            </tr>
            <tr>
               <td>상세주소</td>
               <td><input type="text" name="address2" value="<%= address[0] %>"></td>
               <td></td>
            </tr>
            <tr align="center">
               <td colspan="2"><br>
                  <input type="submit" value="수정하기" class="b">&nbsp;&nbsp;
                  <input type="button" value="메인으로" onclick="location.href='../../index.jsp'" class="b1">
                  <input type="button" value="비밀번호 변경" onclick="location.href='passwordChangeForm.jsp'" class="b1">
               </td>
            </tr>
         </table>
      </div>
      </form>
</div>
<script type="text/javascript">

   function delectMember(){
      var answer = window.confirm("정말로 탈퇴하시겠습니까?");
      if(answer == true){
         location.href='<%= request.getContextPath() %>/DelectMemberServlet.me';
      }else{
         alert("탈퇴를 취소합니다.");
      }
   }
      
</script>
   <%@ include file="/../views/common/footer.jsp"%>
</body>
</html>