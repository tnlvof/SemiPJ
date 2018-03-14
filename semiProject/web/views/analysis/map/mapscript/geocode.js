/**
 * 
 */

var marker = [];

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

function addmarker(alley_arr) {
	console.log(alley_arr);
	var sel2 = document.getElementById("sel2").value;

	map = new google.maps.Map(document.getElementById('map'), {
		zoom : 16,
		center : seoul
	});

	var geocoder = new google.maps.Geocoder();

	for (var i = 0; i < alley_arr.length; i++) {
		var address = alley_arr[i];

		console.log(alley_arr[i] + "for");
		geocoder.geocode({
			'address' : address
		}, function(results, status) {
			console.log(status);
			console.log(results);
			if (status == google.maps.GeocoderStatus.OK) {
				// var latLng = results[0].geometry.location;
				var lat = results[0].geometry.location.lat();// 위도
				var lng = results[0].geometry.location.lng();// 경도
				var alley_nm = results[0].address_components[0].long_name;
				console.log("alley_nm: " + alley_nm + " lat : " + lat
						+ " lng : " + lng);

				markerset(alley_nm, lat, lng);

			}

		});

	}

}
function markerset(address, lat, lng) {

	var sel2 = document.getElementById("sel2").value;
	
	addmarker = new google.maps.Marker({
		position : {
			lat : lat,
			lng : lng
		},
		map : map,
		title : address
	});

	console.log(randomcolor);
	console.log("마커 호출완료");

	addmarker.addListener('click', function() {

		console.log(address + sel2);
		getCode(address, sel2)
	});

	addmarker.setMap(map);
	map.panTo({
		lat : lat,
		lng : lng
	});

	marker.push(addmarker);

	console.log(marker.length);
}
