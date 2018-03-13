/**
 * 
 */
// SELECT * from SHOPLIST where SVC_SE_CD='CS' and SVC_INDUTY_CD like 'CS%';

function shoplist() {
//옵션지정	
	var food_arr = [ "한식음식점", "중국집", "일식집", "양식집", "분식집", "패스트푸드점", "치킨집",
			"제과점", "커피음료", "호프간이주점" ];
	var service_arr = [ "입시보습학원", "외국어학원", "예체능학원", "치과의원", "한의원", "일반의원",
			"보육시설", "부동산중개업", "인테리어", "노래방", "PC방", "당구장", "골프연습장", "헬스클럽",
			"노인요양시설", "미용실", "네일숍", "피부관리실" ];
	var sell_arr = [ "슈퍼마켓", "편의점", "컴퓨터판매수리", "휴대폰", "정육점", "과일채소", "의류점",
			"패션잡화", "약국" ];
//벨류 지정
	var foodval_arr = [ "CS100001", "CS100002", "CS100003", "CS100004",
			"CS100005", "CS100006", "CS100007", "CS100008", "CS100009",
			"CS100010" ];
	var serviceval_arr = [ "CS200001", "CS200002", "CS200003", "CS200004",
			"CS200005", "CS200006", "CS200007", "CS200008", "CS200009",
			"CS200010", "CS200011", "CS200012", "CS200013", "CS200014",
			"CS200015", "CS200016", "CS200017", "CS200018", "CS200019",
			"CS200020", "CS200021", "CS200022" ];
	var sellval_arr = [ "CS300001", "CS300002", "CS300003", "CS300004",
			"CS300005", "CS300006", "CS300007", "CS300008", "CS300009",
			"CS300010", "CS300011" ];

	var sel1 = document.getElementById("sel1").value;
	var sel2 = document.getElementById("sel2");
	switch (sel1) {
	case "외식업":
		sel2.innerHTML = "<option>2차분류</option>";
		for (var i = 0; i < food_arr.length; i++) {
			sel2.innerHTML += "<option value=" + foodval_arr[i] + ">"
					+ food_arr[i] + "</option>";
		}
		break;

	case "서비스업":
		sel2.innerHTML = "<option>2차분류</option>";
		for (var i = 0; i < service_arr.length; i++) {
			sel2.innerHTML += "<option value=" + serviceval_arr[i] + ">"
			+ service_arr[i] + "</option>";
		}
		break;

	case "도소매업":
		sel2.innerHTML = "<option>2차분류</option>";
		for (var i = 0; i < sell_arr.length; i++) {
			sel2.innerHTML += "<option value=" + sellval_arr[i] + ">"
			+ sell_arr[i] + "</option>";
		}
		break;
	default:
		sel2.innerHTML = "<option>2차분류</option>";
		break;
	}
}
function changecheck() {
	var sel2 = document.getElementById("sel2");
	console.log(sel2.value)
}