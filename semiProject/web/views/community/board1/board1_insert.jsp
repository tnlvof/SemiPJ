<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>앞날이 창창</title>
<link rel="stylesheet" href="/pj/css/common.css">
<link rel="stylesheet" href="/pj/css/reset.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<style>
	.insertArea table{
		border:1px solid red;
		font-size:14px;
		font-weight:600;
	}
	.insertArea table tr td{
		vertical-align:middle;
	}
	.insertArea {
		float:left;
		width:900px;
		height:550px;
		margin-top:20px;
		margin-left:20px;
		margin-right:auto;
		background:salmon;
/* 		border:1px solid black;
 */	}
	#titleImgArea{
		width:400px;
		height:20px;
		border:2px dashed darkgray;
		text-align:center;
		display:table-cell;
		vertical-align:middle;
	}
	#titleImgArea:hover,
	#contentImgArea1:hover,
	#contentImgArea2:hover,
	#contentImgArea3:hover{
		cursor:pointer;
	}
	#contentImgArea1,#contentImgArea2,#contentImgArea3{
		width:150px;
		height:100px;
		border:2px dashed darkgray;
		text-align:center;
		display:table-cell;
		vertical-align:middle;
	}
	.btnArea {
		wdith:150px;
		margin-left:auto;
		margin-right:auto;
	}
</style>
<%@ include file="/views/common/menubar.jsp" %>
<body>

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

	<div class="div1">

		<%@ include file="/views/common/communitySidebar.jsp"%>
		<!-- 게시판 영역 -->
		<div class="board1">
			
			<%
				if (loginUser != null) {
			%>
			<form action="<%=request.getContextPath()%>/insert.tn"
				method="post" encType="multipart/form-data">
				<div class="insertArea">
					<table align="center">
						<tr>
							<td width="100px">제목</td>
							<td colspan="3"><input type="text" size="45" name="title">
							</td>
						</tr>
						<tr>
							<td>사진 첨부</td>
							<td colspan="3">
								<div id="titleImgArea">
									<img id="titleImg" width="350" height="50">
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="4"><textarea name="content" class="boardContent"></textarea></td>
						</tr>

					</table>
					<div id="fileArea">
						<input type="file" id="thumbnail1" name="thumbnailImg1"
							onchange="LoadImg1(this);">
					</div>
				</div>
				<div class="btnArea" align="center">
					<button type="button" class="submitBtn" onclick="location.href='/pj/views/community/board1/board1_List.jsp'">뒤로가기</button>
					<button type="submit" class="submitBtn">작성완료</button>
				</div>
			</form>

		</div>
		<script>
			$(function() {
				$("#fileArea").hide();

				$("#titleImgArea").click(function() {
					$("#thumbnail1").click();
				});
				$("#contentImgArea1").click(function() {
					$("#thumbnail2").click();
				});
				$("#contentImgArea2").click(function() {
					$("#thumbnail3").click();
				});
				$("#contentImgArea3").click(function() {
					$("#thumbnail4").click();
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

			function LoadImg2(value) {
				if (value.files && value.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$("#contentImg1").attr("src", e.target.result)
					}
					reader.readAsDataURL(value.files[0]);
				}
			}

			function LoadImg3(value) {
				if (value.files && value.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$("#contentImg2").attr("src", e.target.result)
					}
					reader.readAsDataURL(value.files[0]);
				}
			}

			function LoadImg4(value) {
				if (value.files && value.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$("#contentImg3").attr("src", e.target.result)
					}
					reader.readAsDataURL(value.files[0]);
				}
			}
		</script>


		<%
			} else {
				request.setAttribute("msg", "잘못된 경로로 접근하셨습니다");
				request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
			}
		%>
	</div>

	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>