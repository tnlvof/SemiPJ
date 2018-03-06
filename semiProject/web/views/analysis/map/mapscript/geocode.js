/**
 * 
 */

function trancode() {
	var input_address = document.getElementById("address").value;
	console.log(input_address);

	var geocoder = new google.maps.Geocoder();
	geocoder.geocode({
		'address' : input_address
	}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			// var latLng = results[0].geometry.location;
			var lat = results[0].geometry.location.lat();
			var lng = results[0].geometry.location.lng();
			console.log("lat : " + lat + " lng : " + lng);
			if (lat == null || lng == null) {
				alert("주소를 다시 확인해주세요");
			} else {
				console.log("지도 호출완료")
				outputinitMap(lat, lng);
			}

		}
	});

}
