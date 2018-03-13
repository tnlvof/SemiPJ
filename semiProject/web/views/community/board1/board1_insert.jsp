<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Summernote</title>

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
</head>
<style>
.insertArea table {
	border: 1px solid lightgray;
	font-size: 14px;
	font-weight: 600;
	
}

.insertArea table tr td {
	padding: 5px;
	vertical-align: middle;
}

.insertArea {
	float: left;
	width: 980px;
	height: 800px;
	margin-right: auto;
}

.btnArea {
	wdith: 150px;
	margin-left: auto;
	margin-right: auto;
}

.boardInput {
	height: 25px;
}

.note-editor.note-frame .note-editing-area .note-editable {
	min-height: 400px; 
}

</style>
<body>

	<%@ include file="/views/common/menubar.jsp"%>

	<!-- 검색창 -->
	<div class="searchContainer">
		<div class="searchBanner" align="center">
			<div class="bannerHeader">광고게시판</div>
			<div class="bannerSub">회원분들의 제품을 자유롭게 홍보하세요</div>
			<div class="searchDiv">
				<select class="searchCategory">
					<option>제목</option>
					<option>작성자</option>
					<option>내용</option>
				</select>
				<div class="inputDiv">
					<input type="text" class="form_text" name="searchValue">
				</div>
				<button class="searchBtn">검색</button>
			</div>
		</div>
	</div>

	<!--본문-->
	<div class="div1">

		<%@ include file="/views/common/communitySidebar.jsp"%>

		<!-- 게시판 영역 -->
		<div class="board1" style="">
			<%
				if (loginUser != null) {
			%>
			<form action="<%=request.getContextPath()%>/insert.b1" method="post" encType="multipart/form-data">
				<div class="insertArea">
					<table align="center">
						<tr>
							<td width="100px">제목</td>
							<td colspan="3"><input type="text" class="boardInput"
								size="45" name="title"></td>
						</tr>
						<tr>
							<td>대표 이미지</td>
							<td colspan="3">
								<div id="titleImgArea">
									<img id="titleImg" width="390" height="200">
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<div class="contentDiv">
									<textarea id="summernote" name="content">
								</textarea>
								</div> <script>
									$(function() {
										$('#summernote').summernote();
									});
								</script>
							</td>
						</tr>
					</table>
					<div id="fileArea">
						<input type="file" id="thumbnail1" name="thumbnailImg1"
							onchange="LoadImg1(this);">
					</div>
				</div>
				<div class="btnArea" align="center">
					<button type="button" class="submitBtn"
						onclick="location.href='/pj/views/community/board1/board1_List.jsp'">뒤로가기</button>
					<button type="submit" class="submitBtn">작성완료</button>
				</div>
			</form>

		</div>
	</div>
		<script>
			$(function() {
				$("#fileArea").hide();

				$("#titleImgArea").click(function() {
					$("#thumbnail1").click();
				});
			});

			function LoadImg1(value) {
				if (value.files && value.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$("#titleImg").attr("src", e.target.result)
					}
					reader.readAsDataURL(value.files[0]);
				}
			}
		</script>
		<%
			} else {
				request.setAttribute("msg", "잘못된 경로로 접근하셨습니다");
				request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			}
		%>
	

</body>
</html>
	<%@ include file="/views/common/footer.jsp"%>
