/**
 * 
 */

var circle;
var marker;
var sqaure;
var area;
var map;
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
	map = new google.maps.Map(document.getElementById('map'), {
		zoom : 16,
		center : seoul
	});
	
	map.addListener('click', function(e) {

		placeMarkerAndPanTo(e.latLng, map);
	});
}

function outputinitMap(output_lat, output_lng) {
	map = new google.maps.Map(document.getElementById('map'), {
		zoom : 16,
		center : {
			lat : output_lat,
			lng : output_lng
		}
	});

	map.addListener('click', function(e) {

		
	});
}

