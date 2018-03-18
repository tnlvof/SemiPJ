<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
<link rel="shortcut icon" href="/pj/images/slogo.png">
<link rel="stylesheet" href="/pj/css/common.css">
<link rel="stylesheet" href="/pj/css/reset.css">
<link rel="stylesheet" href="/pj/css/support.css">
<title>앞날이 창창</title>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<%@ include file="/views/common/supportSidebar.jsp"%>
	<div class="supportContainer">
	<div class="supportHeader">
			<h2>공지사항</h2>
		</div>
		<div class="formArea">
			<form action="<%=request.getContextPath()%>/insertNotice.sp"
				method="post">
				<table>
					<tr>
						<th scope="row">제목</th>
						<td colspan="4"><input type="text" name="title"></td>
					</tr>
					<tr>
						<td colspan="5">
							<div class="summerDiv">
								<textarea id="summernote" name="text">
								</textarea>
							</div> <script>
								$(function() {
									$('#summernote').summernote();
								});
							</script>
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
					<button type="reset"
						onclick="location.href='<%=request.getContextPath()%>/select.sp'">취소하기</button>
					<button type="submit">등록하기</button>
				</div>
			</form>
		</div>
	</div>
	</div>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>