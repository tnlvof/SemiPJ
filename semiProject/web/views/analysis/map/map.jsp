<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--  -->
<script src="mapscript/geocode.js"></script>
<script src="mapscript/mapscript.js"></script>
<script src="mapscript/etc.js"></script>
<title>Insert title here</title>
<style type="text/css">
#maptable {
	width: 1200px;
	border-spacing: 5px;
}

#map {
	width: 800px;
	height: 600px;
}

#btn {
	width: 100px;
}
</style>
</head>
<body>
	<table class="table-active text-dark table-bordered" id=maptable>
		<tr>
			<td width=400px>
				<li>주소선택 <input type="text" placeholder="주소입력"
					class="form-control" id="address">
					<button class="btn btn-secondary" width=100px onclick="trancode();">검색</button>
					<br> <br>
			<li>업종선택 <select class="form-control" id="sel1"
					onchange="shoplist();" onload="bigselect();">
				</select> <select class="form-control" id="sel2">
				</select>
			</td>
			<td rowspan="5"><div id="map"></div></td>
		</tr>
		<tr>
			<td><li><label>영역선택</label> <br>
					<button class="btn btn-secondary" width=100px id=circle
						onclick="btnswitch(1);toolchange();">원</button>
					<button class="btn btn-secondary" width=100px id=square
						onclick="btnswitch(2);toolchange();">사각형</button>
					<button class="btn btn-secondary" width=100px id=select
						onclick="btnswitch(3);toolchange();">상권선택</button>
					<button class="btn btn-secondary" width=100px id=select
						onclick="btnswitch(4);toolchange();">도형삭제</button></td>
		</tr>
		<tr>
			<td id=tool>
				<p>도구를 선택해주세요</p>
			</td>
		</tr>
		<tr>
			<td><button class="btn btn-secondary">검색</button> <input
				type="reset" class="btn btn-secondary"></td>
		</tr>
	</table>

	<script type="text/javascript">
	bigselect();
	</script>

	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAc5oXlzhf_bQjLoeKJKJ-n6-cOXhxQSF0&callback=initMap"></script>
</body>
</html>