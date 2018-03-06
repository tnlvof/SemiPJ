/**
 * 
 */

function bigselect() {
	var sel1 = document.getElementById("sel1");
	// 대분류배열
	var selarr = [ "음식", "생활서비스", "소매", "관광/여가/오락", "스포츠", "학문/교육",
			"숙박", "부동산" ];
	sel1.innerHTML = "<option>대분류</option>";
	for (var i = 0; i < selarr.length; i++) {
		sel1.innerHTML += "<option>" + selarr[i] + "</option>";
	}

}

function shoplist() {
	var sel1 = document.getElementById("sel1");
	var sel2 = document.getElementById("sel2");

	var s2_option = document.getElementById("s2_option");
	console.log("대분류 변경 : " + sel1.value);
	

	// 중분류배열
	var food_arr = [ "한식", "중식", "일식/수산물", "분식", "닭/오리요리", "양식", "패스트푸드",
			"제과제빵떡케익", "유흥주점", "별식/퓨전요리", "커피점/카페", "음식배달서비스", "기타음식업", "부페" ];
	var servic_earr = [ "이/미용/건강", "세탁/가사서비스", "개인/가정용품수리", "운송/배달/택배",
			"인력/고용/용역알선", "사진", "물품기기대여", "대행업", "대중목욕탕/휴게", "개인서비스", "광고/인쇄",
			"기타서비스업", "자동차/이륜차", "주택수리", "주유소/충전소", "예식/의례/관혼상제", "장례/묘지",
			"법무세무회계", "행사/이벤트" ];
	var sell_arr = [ "음/식료품소매", "선물/팬시/기념품", "종합소매점", "취미/오락관련소매", "의복의류",
			"가방/신발/액세서리", "가정/주방/인테리어", "사무/문구/컴퓨터", "애견/애완/동물", "건강/미용식품",
			"유아용품", "가전제품소매", "책/서적/도서", "운동/경기용품소매", "가구소매", "화장품소매",
			"예술품/골동품/수석/분재", "사진/광학/정밀기기소매", "종교용품판매", "의약/의료품소매",
			"철물/난방/건설자재소매", "페인트/유리제품소매", "자동차/자동차용품", "중고품소매/교환", "기타판매업",
			"시계/귀금속소매" ];
	var joy_arr = [ "PC/오락/당구/볼링등", "무도/유흥/가무", "연극/영화/극장", "스포츠/운동",
			"요가/단전/마사지", "전시/관람", "놀이/여가/취미", "경마/경륜/성인오락" ];
	var sports_arr = [ "운영관리시설", "실내운동시설", "실외운동시설" ];
	var edu_arr = [ "학원-보습교습입시", "학원-창업취업취미", "학원-자격/국가고시", "학원-어학",
			"학원-음악미술무용", "학원-컴퓨터", "학원-예능취미체육", "유아교육", "학원기타", "도서관/독서실",
			"학교", "특수교육기관", "학문교육기타", "연구소", "기타교육기관" ];
	var accommodation_arr = [ "호텔/콘도", "모텔/여관/여인숙", "캠프/별장/펜션", "유스호스텔",
			"민박/하숙" ];
	var property_arr = [ "부동산중개", "부동산임대", "분양", "평가/개발/관리", "부동산관련서비스" ];

	switch (sel1.value) {

	default:
		sel2.innerHTML = "<option>중분류</option>";
		break;
	case "음식":
		console.log("요식업의 하위분류 로딩");
		sel2.innerHTML = "<option>중분류</option>";
		for (var i = 0; i < food_arr.length; i++) {
			sel2.innerHTML += "<option>" + food_arr[i] + "</option>";
		}
		break;

	case "생활서비스":
		console.log("생활서비스의 하위분류 로딩");
		sel2.innerHTML = "<option>중분류</option>";
		for (var i = 0; i < service_arr.length; i++) {
			sel2.innerHTML += "<option>" + service_arr[i] + "</option>";
		}
		break;

	case "소매":
		console.log("소매의 하위분류 로딩");
		sel2.innerHTML = "<option>중분류</option>";
		for (var i = 0; i < sell_arr.length; i++) {
			sel2.innerHTML += "<option>" + sell_arr[i] + "</option>";
		}
		break;
	case "관광/여가/오락":
		console.log("관광/여가/오락의 하위분류 로딩");
		sel2.innerHTML = "<option>중분류</option>";
		for (var i = 0; i < joy_arr.length; i++) {
			sel2.innerHTML += "<option>" + joy_arr[i] + "</option>";
		}
		break;
	case "스포츠":
		console.log("스포츠의 하위분류 로딩");
		sel2.innerHTML = "<option>중분류</option>";
		for (var i = 0; i < sports_arr.length; i++) {
			sel2.innerHTML += "<option>" + sports_arr[i] + "</option>";
		}
		break;
	case "학문/교육":
		console.log("학문/교육의 하위분류 로딩");
		sel2.innerHTML = "<option>중분류</option>";
		for (var i = 0; i < edu_arr.length; i++) {
			sel2.innerHTML += "<option>" + edu_arr[i] + "</option>";
		}
		break;
	case "숙박":
		console.log("숙박의 하위분류 로딩");
		sel2.innerHTML = "<option>중분류</option>";
		for (var i = 0; i < accommodation_arr.length; i++) {
			sel2.innerHTML += "<option>" + accommodation_arr[i] + "</option>";
		}
		break;
	case "부동산":
		console.log("부동산의 하위분류 로딩");
		sel2.innerHTML = "<option>중분류</option>";
		for (var i = 0; i < property_arr.length; i++) {
			sel2.innerHTML += "<option>" + property_arr[i] + "</option>";
		}
		break;
	}

}