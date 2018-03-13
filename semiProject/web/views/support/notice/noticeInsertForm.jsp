<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
.formArea td {
	vertical-align: middle;
}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<%@ include file="/views/common/supportSidebar.jsp"%>
	<div class="supportContainer">
		<br>
		<h2 align="center">공지사항 작성</h2>
		<div class="formArea">
			<form action="<%=request.getContextPath()%>/insertNotice.sp" method="post">
				<table>
					<!-- <tr>
						<td class="">분야</td>
						<td><select name="category">
								<option>-----</option>
								<option value="10">공통</option>
						</select></td>
					</tr> -->
					<tr>
						<td>제목</td>
						<td colspan="3"><input type="text" size="100" name="title">
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="3"><textarea rows="15" cols="120" name="text"
								style="resize: none;"></textarea></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td colspan="3"><input type="password" size="20" name="password"></td>
					</tr>
				</table>
				<br>
				<div align="center">
					<button type="reset" onclick="location.href='/views/support/notice/noticeList.jsp'">취소하기</button>
					<button type="submit">등록하기</button>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>