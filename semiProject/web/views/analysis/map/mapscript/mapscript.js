/**
 * 
 */

var circle;
var marker;
var sqaure;
var area;

var seoul = {
	lat : 37.5665350,
	lng : 126.9779690
};

function changeValue() {
	var getRangevalue = document.getElementById("range").value;
	var labeltext = document.getElementById("showrange").value;
	console.log(getRangevalue, labeltext);

}

function initMap() {
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom : 16,
		center : seoul
	});

	map.addListener('click', function(e) {

		placeMarkerAndPanTo(e.latLng, map);
	});
}

function outputinitMap(output_lat, output_lng) {
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom : 16,
		center : {
			lat : output_lat,
			lng : output_lng
		}
	});

	map.addListener('click', function(e) {

		placeMarkerAndPanTo(e.latLng, map);
	});
}

function placeMarkerAndPanTo(latLng, map) {

	var shape_circle = document.getElementById("circle");
	var shape_sqaure = document.getElementById("square");
	var shape_area = document.getElementById("select");

	if (shape_circle.className == "btn btn-primary") {
		var getRangevalue = document.getElementById("range").value;
		console.log(getRangevalue);
		marker = new google.maps.Marker({
			position : latLng,
			map : map
		});
		marker.setMap(map);
		circle = new google.maps.Circle({
			strokeColor : '#FF0000',
			strokeOpacity : 0.8,
			strokeWeight : 2,
			fillColor : '#FF0000',
			fillOpacity : 0.35,
			map : map,
			center : latLng,
			radius : getRangevalue * 1,
			dragable : true
		});

		circle.setMap(map);
	}

	if (shape_sqaure.className == "btn btn-primary") {
		sqaure = new google.maps.Rectangle({
			strokeColor : '#FF0000',
			strokeOpacity : 0.8,
			strokeWeight : 2,
			fillColor : '#FF0000',
			fillOpacity : 0.35,
			map : map,
			bounds : map.getBounds(),
			editable : true,
			dragable : true
		});

		console.log(map.getBounds());
	}

	map.panTo(latLng);

}

function btnswitch(num) {

	var shape_circle = document.getElementById("circle");
	var shape_sqaure = document.getElementById("square");
	var shape_area = document.getElementById("select");

	if (num == 1) {
		console.log("원선택 모드");
		shape_circle.className = "btn btn-primary";
		shape_sqaure.className = "btn btn-secondary";
		shape_area.className = "btn btn-secondary";
	}

	if (num == 2) {
		console.log("사각형선택 모드");
		shape_circle.className = "btn btn-secondary";
		shape_sqaure.className = "btn btn-primary";
		shape_area.className = "btn btn-secondary";
	}
	if (num == 3) {
		console.log("영역선택 모드");
		shape_circle.className = "btn btn-secondary";
		shape_sqaure.className = "btn btn-secondary";
		shape_area.className = "btn btn-primary";
	}
	if (num == 4) {

		marker.setMap(null);
		circle.setMap(null);
		sqaure.setMap(null);

	}

	var btnc;
	var btns;
	var btna;
}
function toolchange() {
	var tool = document.getElementById("tool");
	var shape_circle = document.getElementById("circle");
	var shape_sqaure = document.getElementById("square");
	var shape_area = document.getElementById("select");

	if (shape_circle.className == "btn btn-primary") {
		tool.innerHTML = "<input type=range min=50 max=1000 step=50 id=range><label id=getrangelabel>0m";
		var getrangelabel = document.getElementById("getrangelabel");
		range.addEventListener("change", function() {
			getrangelabel.innerHTML = document.getElementById("range").value
					+ "m"
		});

	}
	if (shape_sqaure.className == "btn btn-primary") {
		alert("영역을 클릭하고 범위를 지정해주세요");
		tool.innerHTML = "원하는 지역을 클릭하고 범위를 조절해주세요";
	}
	if (shape_area.className == "btn btn-primary") {
		alert("상권을 선택해주세요");
		tool.innerHTML = "상권을 선택해주세요";

		// 상권 선택 스크립트 발동
	}
}