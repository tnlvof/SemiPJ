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
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<%@ include file="/views/common/supportSidebar.jsp"%>
	<div class="supportContainer">
		<div class="supportHeader">
			<h2>Q&A</h2>
		</div>
		<div class="tableArea">
			<table align="center">
				<tr>
					<th width="100px">번호</th>
					<th width="100px">분류</th>
					<th width="300px">제목</th>
					<th width="100px">작성자</th>
					<th width="150px">등록일</th>
					<th width="100px">조회수</th>
				</tr>
				<tr>
				</tr>

				<tr>

				</tr>

			</table>
		</div>
		<div class="searchArea" align="center">
			<select id="searchCondition" name="searchCondition">
				<option>-------</option>
				<option value="category">분류</option>
				<option value="title">제목</option>
				<option value="writer">작성자</option>
				<option value="content">내용</option>
			</select> <input type="search" name="searchValue">
			<button type="button">검색하기</button>
			<button onclick="location.href='qnaInsertForm.jsp'">글쓰기</button>
		</div>
	</div>
	</div>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>