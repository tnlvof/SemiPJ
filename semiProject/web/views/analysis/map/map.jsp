<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--  -->
<script src="mapscript/geocode.js"></script>
<script src="mapscript/mapscript.js"></script>
<script src="mapscript/etc.js"></script>
<title>Insert title here</title>
<style type="text/css">
#maptable {
	border-spacing: 5px;
}

#map {
	width: 800px;
	height: 600px;
	margin-top: -250px;
	margin-left: 450px;
}

#btn {
	width: 100px;
}
#notice{
	border: 1px solid black;
}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<table class="table-active text-dark table-bordered" id=maptable>
		<tr>
			<td width=400px>
				<li>주소선택 <input type="text"
					placeholder="[행정동(ex:가락본동 or 가락2동)만 입력하세요]" class="form-control"
					id="address" name="address">
					<br>
					<div id = notice>
					<label>동이름이 겹칠경우 이렇게 검색하세요!<br>관악구 삼성동=삼성동<br>강남구 삼성동=삼성(1,2,3,4)동</label>
					</div>
			</td>
		</tr>
		<tr>
			<td>
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

		</tr>
		<tr>
			<td><button class="btn btn-secondary" id=search>지도검색</button> <input
				type="reset" class="btn btn-secondary"
				onclick="location.reload()"></td>
		</tr>
	</table>
	<br>
	<div id="map"></div>
	<hr>
	<script type="text/javascript">
		$("#search").click(function() {
			var address = $("#address").val();
			var alley_arr = [];
			console.log(address);
			$.ajax({
				url : "<%= request.getContextPath() %>/select.al",
				data : {
					address : address
				},
				type : "post",
				success : function(data) {
					result = "";
					console.log(data)
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
			url : "<%= request.getContextPath() %>/select.cd",
			data : {
				address : address,
				shopcode : sel2
			},
			type : "get",
			success : function(data) {
				console.log("success"+data);
				insertCode(data);
				/* transeArr(data); */

			},
			error : function(data) {
				console.log("fail"+data);
			}
		});
	}
	function insertCode(data){
		console.log(data +"insertCode");
		console.log(data[1] + "insertCode");
		
		location.href='<%= request.getContextPath() %>/insertReport.an?address='+data[0]+'&areaCode='+data[1]+'&catagoryCode='+data[2]+'&memberNo=<%=loginUser.getMemberNo()%>';
		
	}
	
	<%-- function transeArr(data){
		console.log(data+"asdaf");
		console.log(data[1]);
		
		location.href='<%=request.getContextPath()%>/runAnalyse.an?areaCode='+data[1]+'&catagoryCode='+data[2];
		
	} --%>
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAc5oXlzhf_bQjLoeKJKJ-n6-cOXhxQSF0&callback=initMap"></script>

<%@ include file="/views/common/footer.jsp"%>
</body>
</html>