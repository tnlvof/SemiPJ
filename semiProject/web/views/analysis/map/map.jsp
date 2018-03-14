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
				<li>주소선택 <input type="text"
					placeholder="주소입력[행정동(ex:가락본동)만 입력하세요]" class="form-control"
					id="address" name="address">
					<button class="btn btn-secondary" width=100px onclick="trancode();">검색</button>
					<br> <br>
			<li>업종선택 <select class="form-control" id="sel1"
					onchange="shoplist();">
						<option>1차분류</option>
						<option>외식업</option>
						<option>서비스업</option>
						<option>도소매업</option>
				</select> <select class="form-control" id="sel2" onchange=changecheck();>
						<option>2차분류</option>
				</select>
			</td>
			<td rowspan="2"><div id="map"></div></td>
		</tr>
		<tr>
			<td><button class="btn btn-secondary" id=search>검색</button> <input
				type="reset" class="btn btn-secondary"
				onclick="location.href='http://localhost:8002/map/map.jsp'"></td>
		</tr>
	</table>
	<br>
	<hr>
	<script type="text/javascript">
		$("#search").click(function() {
			var address = $("#address").val();
			var alley_arr = [];
			
			$.ajax({
				url : "select.al",
				data : {
					address : address
				},
				type : "get",
				success : function(data) {
					result = "";
					for (var i = 0; i < data.length; i++) {
						alley_arr[i] = data[i].alleytrdar_nm;

					}
					console.log(alley_arr);
					addmarker(alley_arr);

				},
				error : function() {

				}
			});
		});
	//
	function getCode(address,sel2){
		var alley_arr = [];
		$.ajax({
			url : "select.cd",
			data : {
				address : address,
				shopcode : sel2
			},
			type : "get",
			success : function(data) {
				console.log("success"+data);

			},
			error : function(data) {
				console.log("fail"+data);
			}
		});
	};
	
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAc5oXlzhf_bQjLoeKJKJ-n6-cOXhxQSF0&callback=initMap"></script>


</body>
</html>