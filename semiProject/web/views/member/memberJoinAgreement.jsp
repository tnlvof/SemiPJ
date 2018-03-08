<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="shortcut icon" href="/pj/images/slogo.png">
<link rel="stylesheet" href="/pj/css/common.css">
<link rel="stylesheet" href="/pj/css/reset.css">
<link rel="stylesheet" href="/pj/css/memberJoin.css">
<title>앞날이 창창</title>
<style>
/* title */
.text-join b {
	color: #1f618d;
	font-weight: bold;
}

/* 약관 동의 */
fieldset {
	border: 0 none;
}

.box-terms {
	position: relative;
	margin: 50px;
}

.box-comm {
	border: 1px solid lightgray;
}

.title-agreement {
	border-bottom: 1px solid lightgray;
	height: 50px;
	font-size: 20px;
	padding-top: 30px;
	padding-left: 20px;
	margin-bottom: 0;
	padding-left: 20px;
}

.termsAgreeContainer {
	overflow: auto;
	height: 230px;
	padding: 20px 30px;
	font-size: 13px;
	line-height: 1.5;
	color: #767676;
	letter-spacing: 0;
}

.wrap_check .ico_check {
	display: block;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
}

.wrap_check {
	position: absolute;
	top: 27px;
	right: 0;
}

/*체크박스 폼*/
input[type=checkbox] {
	display: none;
}

input[type=checkbox]+label {
	position: relative;
	padding: 0 50px;
}

svg {
	height: 25px;
	position: absolute;
}

.p-label {
	position: absolute;
	top: 0;
	left: 30px;
}

.check {
	transition: stroke-dashoffset .5s ease-in-out .2s, stroke-width .3s
		cubic-bezier(0.68, -0.55, 0.265, 1.55);
}

.outer {
	transition: fill .3s ease-out;
	fill: lightgray;
}

.outer:hover {
	fill: #9e9e9e;
}

.inner {
	fill: #FFFFFF;
	transition: opacity .2s ease-in-out .2s, height .3s ease-in-out .3s,
		width .3s ease-in-out .3s, x .3s ease-in-out .3s, y .3s ease-in-out
		.3s, rx .3s ease-in-out .3s;
	opacity: 0;
	width: 0;
	height: 0;
	x: 12px;
	y: 28px;
	rx: 100px;
}

input[type=checkbox]:checked+label .check {
	stroke-dashoffset: 0;
	stroke-width: 7px;
	background: red;
}

input[type=checkbox]:checked+label .outer {
	transition: fill .3s cubic-bezier(0.68, -0.55, 0.265, 1.55);
	fill: lightgray;
}

input[type=checkbox]:checked+label .inner {
	height: 0px;
	width: 0px;
	x: 16px;
	y: 16px;
	rx: 100px;
}

/* 버튼 */
button {
	border: 0 none;
	background-color: transparent;
	cursor: pointer;
	margin: 0 auto;
}

.wrap-btns {
	width: 900px;
	padding-bottom: 50px;
	margin: 0 auto;
}

.link_back {
	position: absolute;
	line-height: 60px;
}

.btn_type1.disabled {
	background: #999;
}

.btn_type1 {
	width: 220px;
	font-size: 18px;
	height: 60px;
}

.btn_comm {
	display: block;
	margin: 0 auto;
	background: #4d87ef;
	color: #fff;
	text-align: center;
	-webkit-appearance: none;
}
</style>
</head>
<body>
	<div class="join-wrap">
		<div class="join-head">
			<div class="agreementHeader">
				<a class="ico-join"><img src="/pj/images/llogo.png"
					class="join-logo"></a>
			</div>
		</div>
		<div class="join-body">
			<div class="paging-step">
				<span class="ico-join ico-paging"> <i class="fa fa-circle on"></i>
					<i class="fa fa-circle"></i> <i class="fa fa-circle"></i>
				</span>
			</div>
			<div class="wrap-title">
				<h3 class="title-join">가입 약관 동의</h3>
				<div class="text-join">
					서비스 약관 및 개인정보 수집, 이용에 <b>동의</b>해주세요.
				</div>
			</div>
			<form>
				<fieldset>
					<legend></legend>
					<div class="box-comm box-terms">
						<h5 class="title-agreement">서비스 약관 동의</h5>
						<div class="termsAgreeContainer">
							<strong>제 1 장 총칙</strong><br> <br> <span>제 1 조
								(목적)</span>
							<p>이 이용약관은 소상공인시장진흥공단 (이하 “당 사이트”)에서 제공하는 인터넷 서비스(이하 '서비스')의
								가입조건 및 이용에 관한 제반 사항과 기타 필요한 사항을 구체적으로 규정함을 목적으로 합니다.</p>
							<span>제 2 조 (용어의 정의)</span>
							<p>① "이용자"라 함은 당 사이트에 접속하여 이 약관에 따라 당 사이트가 제공하는 서비스를 받는 회원 및
								비회원을 말합니다. ② "회원"이라 함은 서비스를 이용하기 위하여 당 사이트에 개인정보를 제공하여 아이디(ID)와
								비밀번호를 부여 받은 자를 말합니다. ③ "회원 아이디(ID)"라 함은 회원의 식별 및 서비스 이용을 위하여 자신이
								선정한 문자 및 숫자의 조합을 말합니다. ④ "비밀번호(패스워드)"라 함은 회원이 자신의 비밀보호를 위하여 선정한
								문자 및 숫자의 조합을 말합니다. ⑤ "소상공인시장진흥공단 패밀리 사이트"는 당 사이트가 운영 또는 제휴하고 있는
								회원제 웹 사이트로서 "[부칙] 3. (소상공인시장진흥공단 패밀리 사이트)"에 명시되어 있습니다.</p>
							<span>제 3 조 (이용약관의 효력 및 변경)</span>
							<p>① 이 약관은 당 사이트에 게시하거나 기타의 방법으로 회원에게 공지함으로써 효력이 발생합니다. ② 당
								사이트는 이 약관을 개정할 경우에 적용일자 및 개정사유를 명시하여 현행 약관과 함께 당 사이트의 초기화면에 그
								적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 회원에게 불리하게 약관내용을 변경하는 경우에는 최소한
								30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 당 사이트는 개정 전 내용과 개정 후 내용을 명확하게
								비교하여 이용자가 알기 쉽도록 표시합니다.</p>
							<span>제 4 조(약관 외 준칙)</span>
							<p>① 이 약관은 당 사이트가 제공하는 서비스에 관한 이용안내와 함께 적용됩니다. ② 이 약관에 명시되지
								아니한 사항은 관계법령의 규정이 적용됩니다.</p>
							<br> <strong>제 2 장 이용계약의 체결</strong><br> <br> <span>제
								5 조 (이용계약의 성립 등)</span>
							<p>① 이용계약은 이용고객이 당 사이트가 정한 약관에 「동의합니다」를 선택하고, 당 사이트가 정한
								온라인신청양식을 작성하여 서비스 이용을 신청한 후, 당 사이트가 이를 승낙함으로써 성립합니다. ② 제1항의 승낙은
								소상공인시장진흥공단 패밀리 사이트와 당 사이트가 제공하는 소상공인관련 정보, 지원서비스 등 서비스의 이용승낙을
								포함합니다. 다만, 소상공인시장진흥공단 패밀리 사이트에서 개별적으로 적용되는 약관에 대한 동의는 회원이
								소상공인시장진흥공단 패밀리 사이트를 최초로 이용할 때 별도의 동의절차를 거칠 수 있습니다.</p>
							<span>제 6 조 (회원가입)</span>
							<p>① 서비스를 이용하고자 하는 고객은 당 사이트에서 정한 회원가입양식에 개인정보를 기재하여 가입을 하여야
								합니다. ② 당 사이트는 만 14세미만의 아동은 회원으로 가입할 수 없습니다.</p>
							<span>제 7 조 (개인정보의 보호 및 사용)</span>
							<p>당 사이트는 관계법령이 정하는 바에 따라 회원 등록정보를 포함한 회원의 개인정보를 보호하기 위해
								노력합니다. 회원 개인정보의 보호 및 사용에 대해서는 관련법령 및 당 사이트의 개인정보 보호정책이 적용됩니다.</p>
							<span>제 8 조 (이용 신청의 승낙과 제한)</span>
							<p>① 당 사이트는 제6조의 규정에 의한 이용신청고객에 대하여 서비스 이용을 승낙합니다. ② 당 사이트는
								아래사항에 해당하는 경우에 대해서 승낙하지 아니 합니다. - 이용계약 신청서의 내용을 허위로 기재한 경우 - 기타
								규정한 제반사항을 위반하며 신청하는 경우</p>
							<span>제 9 조 (회원 ID 부여 및 변경 등)</span>
							<p>① 당 사이트는 이용고객에 대하여 약관에 정하는 바에 따라 자신이 선정한 회원 ID를 부여합니다. ②
								회원 ID는 원칙적으로 변경이 불가하며 부득이한 사유로 인하여 변경 하고자 하는 경우에는 해당 ID를 해지하고
								재가입해야 합니다. ③ 당 사이트의 회원 ID는 회원 본인의 동의 하에 소상공인시장진흥공단 패밀리 사이트의 회원
								ID로 사용될 수 있습니다. ④ 기타 회원 개인정보 관리 및 변경 등에 관한 사항은 서비스별 안내에 정하는 바에
								의합니다.</p>
							<br> <strong>제 3 장 계약 당사자의 의무</strong><br> <br> <span>제
								10 조 (소상공인시장진흥공단의 의무)</span>
							<p>① 당 사이트는 이용고객이 희망한 서비스 제공 개시일에 특별한 사정이 없는 한 서비스를 이용할 수 있도록
								하여야 합니다. ② 당 사이트는 개인정보 보호를 위해 보안시스템을 구축하며 개인정보 보호정책을 공시하고 준수합니다.
								③ 당 사이트는 회원으로부터 제기되는 의견이나 불만이 정당하다고 객관적으로 인정될 경우에는 적절한 절차를 거쳐 즉시
								처리하여야 합니다. 다만, 즉시 처리가 곤란한 경우는 회원에게 그 사유와 처리일정을 통보하여야 합니다.</p>
							<span>제 11 조 (회원의 의무)</span>
							<p>① 이용자는 회원가입 신청 또는 회원정보 변경 시 실명으로 모든 사항을 사실에 근거하여 작성하여야 하며,
								허위 또는 타인의 정보를 등록할 경우 일체의 권리를 주장할 수 없습니다. ② 당 사이트가 관계법령 및 개인정보
								보호정책에 의거하여 그 책임을 지는 경우를 제외하고 회원에게 부여된 ID의 비밀번호 관리소홀, 부정사용에 의하여
								발생하는 모든 결과에 대한 책임은 회원에게 있습니다. ③ 회원은 당 사이트 및 제 3자의 지적 재산권을 침해해서는
								안 됩니다.</p>
							<br> <strong>제 4 장 서비스의 이용</strong><br> <br> <span>제
								12 조 (서비스 이용 시간)</span>
							<p>① 서비스 이용은 당 사이트의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간 운영을
								원칙으로 합니다. 단, 당 사이트는 시스템 정기점검, 증설 및 교체를 위해 당 사이트가 정한 날이나 시간에 서비스를
								일시 중단할 수 있으며, 예정되어 있는 작업으로 인한 서비스 일시중단은 당 사이트 홈페이지를 통해 사전에
								공지합니다. ② 당 사이트는 서비스를 특정범위로 분할하여 각 범위별로 이용가능시간을 별도로 지정할 수 있습니다.
								다만 이 경우 그 내용을 공지합니다. ③ 당 사이트는 긴급한 시스템 점검, 증설 및 교체 등 부득이한 사유로 인하여
								예고 없이 일시적으로 서비스를 중단할 수 있으며, 새로운 서비스로의 교체 등 소상공인시장진흥공단이 적절하다고
								판단하는 사유에 의하여 현재 제공되는 서비스를 완전히 중단할 수 있습니다. ④ 당 사이트가 통제할 수 없는 사유로
								인한 서비스 중단의 경우(시스템관리자의 고의, 과실 없는 디스크장애, 시스템다운 등)에 사전통지가 불가능하며
								타인(PC통신회사, 기간통신사업자 등)의 고의, 과실로 인한 시스템중단 등의 경우에는 공지하지 않습니다.</p>
							<span>제 13 조 (홈페이지 저작권)</span>
							<p>① 당 사이트가 게시한 본 홈페이지의 모든 콘텐트에 대한 저작권은 당 사이트에 있습니다. 다만, 게시물의
								원저작자가 별도로 있는 경우 그 출처를 명시하며 해당 게시물의 저작권은 원저작자에게 있습니다. ② 회원이 직접
								게시한 저작물의 저작권은 회원에게 있습니다. 다만, 회원은 당 사이트에 무료로 이용할 수 있는 권리를 허락한 것으로
								봅니다. ③ 당 사이트 소유의 콘텐트에 대하여 제3자가 허락 없이 다른 홈페이지에 사용 또는 인용하는 것을
								금지합니다.</p>
							<span>제 14 조 (게시물의 관리 및 삭제)</span>
							<p>① 당 사이트는 다음 각 호에 해당하는 게시물이나 자료를 사전통지 없이 삭제하거나 이동 또는 등록 거부를
								할 수 있습니다. - 본서비스 약관에 위배되거나 상용 또는 불법, 음란, 저속하다고 판단되는 게시물을 게시한 경우
								- 다른 회원 또는 제 3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우 - 공공질서 및 미풍양속에
								위반되는 내용을 유포하거나 링크시키는 경우 - 불법복제 또는 해킹을 조장하는 내용인 경우 - 영리를 목적으로 하는
								광고일 경우 - 범죄와 결부된다고 객관적으로 인정되는 내용일 경우 - 다른 이용자 또는 제 3자의 저작권 등 기타
								권리를 침해하는 내용인 경우 - 당 사이트에서 규정한 게시물 원칙에 어긋나거나, 게시판 성격에 부합하지 않는 경우
								- 기타 관계법령에 위배된다고 판단되는 경우 ② 이용자의 게시물이 타인의 저작권을 침해함으로써 발생하는 민·형사상의
								책임은 전적으로 이용자가 부담하여야 합니다.</p>
							<br> <strong>제 5 장 계약 해지 및 이용 제한</strong><br> <br>
							<span>제 15 조 (계약 해지)</span>
							<p>회원이 이용계약을 해지하고자 하는 때에는 소상공인시장진흥공단 패밀리사이트의 [회원탈퇴] 메뉴를 이용해
								직접 해지해야 합니다.</p>
							<span>제 16 조 (서비스 이용제한)</span>
							<p>① 당 사이트는 회원이 서비스 이용내용에 있어서 본 약관 제 11조 내용을 위반하거나, 다음 각 호에
								해당하는 경우 서비스 이용을 제한할 수 있습니다. - 본 약관의 내용에 위배되는 행동을 한 경우 - 기타 정상적인
								서비스 운영에 방해가 될 경우 ② 상기 이용제한 규정에 따라 서비스를 이용하는 회원에게 서비스 이용에 대하여 별도
								공지 없이 서비스 이용의 일시정지, 이용계약 해지 할 수 있습니다.</p>
							<span>제 17 조 (전자우편주소 수집 금지)</span>
							<p>회원은 수작업, 전자우편주소 추출기 등을 이용하여 전자우편주소를 수집 또는 제3자에게 제공할 수
								없습니다. 제 6 장 이의 신청 및 손해배상청구 금지</p>
							<span>제 18 조 (이의신청 금지)</span>
							<p>당 사이트는 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 당 사이트가 고의 또는
								과실로 인한 손해발생을 제외하고는 이에 대하여 책임을 부담하지 아니합니다.</p>
							<span>제 19 조 (손해배상 청구금지)</span>
							<p>서비스 이용으로 발생한 분쟁에 대해 소송이 제기되는 경우 민사 소송법상의 관활 법원에 제기합니다.</p>
							<br> <span>[부 칙]</span>
							<p>1. (시행일) 이 약관은 2008년 12월 15일부터 적용되며, 종전 약관은 본 약관으로 대체되며,
								개정된 약관의 적용일 이전 가입자도 개정된 약관의 적용을 받습니다. 2. (경과규정) 당 사이트는 패밀리 사이트에
								대한 통합인증 서비스를 제공함에 있어 기존 패밀리 사이트의 회원인 경우 본 약관에 동의함으로써 별도 가입절차 없이
								서비스를 이용할 수 있도록 합니다. 3. (소상공인시장진흥공단 패밀리 사이트) 소상공인시장진흥공단,
								소상공인지원포털,소상공인 교육정보시스템, 상권정보시스템, 소상공인방송, 소상공인 커뮤니티, 프랜차이즈,
								소상공인컨설팅, 신사업아이디어, 시니어넷</p>
						</div>
						<div class="wrap_check">
							<input type="checkbox" id="termsAgree" name="q" value="yes" /> <label
								for="termsAgree"><svg shape-rendering="optimizeQuality"
									preserveAspectRatio="xMidYMid meet" viewBox="0 0 64 64"
									version="1.1" xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink">
    <rect class="outer" fill="#BDBCB9" x="0" y="0" width="64"
										height="64" rx="8"></rect>
    <rect class="inner" fill="#BDBCB9" x="4" y="4" width="56"
										height="56" rx="4"></rect>
    <polyline class="check" stroke="#FFFFFF" stroke-dasharray="270"
										stroke-dashoffset="270" stroke-width="8"
										stroke-linecap="round" fill="none" stroke-linejoin="round"
										points="16 31.8 27.4782609 43 49 22"></polyline>
  </svg></label>
							<!--  <input id="policyAgree" name="policyAgree" type="checkbox"
								class="input_check">
							<label for="policyAgree"
								class="ico_join ico_check">개인정보 수집 및 이용 약관에 동의합니다.</label>
							focus 시 .focus 추가 -->
						</div>
					</div>
					<div class="box-comm box-terms">
						<h5 class="title-agreement">개인정보 수집 및 이용 동의</h5>
						<div class="termsAgreeContainer">
							<strong>1. 개인정보의 수집·이용에 관한 사항</strong><br> <br> <strong>I.
								개인정보의 수집·이용 목적</strong>
							<p>가. 소상공인 지원사업 신청 및 정책연동 : 교육, 컨설팅, 희망리턴패키지, 자금, 협동조합활성화,
								프랜차이즈, 나들가게, 상권정보, 특성화시장육성, 행사, 이용자 만족도조사, 이벤트, 경품발송, 게시글,
								메일링서비스, SMS 제공을 위하여 개인의 정보를 수집, 이용하고 있습니다. 나. 회원관리 : 회원제 서비스 이용
								및 제한적 본인 확인제에 따른 본인확인, 개인식별, 가입의사 확인, 가입 및 가입횟수 제한, 추후 법정 대리인
								본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 공지사항 전달</p>
							<br> <strong>II. 수집하려는 개인정보의 항목</strong>
							<p>필수 11개 항목: 이름, 주민등록번호를 대체하는 개인식별 번호, 아이디, 비밀번호, 연락처, 휴대전화,
								이메일, 주소, 회원유형(소상공인,컨설턴트 등, 예비창업자 등), 관심업종, 관심지역 선택 3개 항목 : SMS
								수신여부, 이메일 수신여부, 관심분야 자동수집 1개 항목 : 접속IP정보(동시접속제어)</p>
							<br> <strong>III. 개인정보의 보유 및 이용 기간</strong>
							<p>개인정보 및 관련 정보는 원칙적으로 보유기간의 경과, 개인정보의 수집 및 이용목적의 달성 등 그
								개인정보가 불필요하게 되었을 때에는 지체 없이 파기합니다. (지원관련 통계 및 컨설팅, 자금 등 지원신청자료는
								제외) 다만, 다른 법령에 따라 보존하여야 하는 경우에는 그러하지 않을 수 있습니다. 불필요하게 되었을 때에는 지체
								없이 해당 개인정보를 파기합니다.</p>
							<br> <strong>IV. 동의를 거부할 권리 및 동의를 거부할 경우의 불이익</strong>
							<p>정보주체는 개인정보 수집에 동의를 거부할 권리가 있습니다. 다만, 필수 항목에 대한 동의를 거부할 시
								저희가 제공하는 서비스를 이용할 수 없습니다.</p>
							<br> <strong>V. 14세 미만 아동의 경우 회원가입 및 저희가 제공하는 서비스를
								이용할 수 없습니다.</strong>
						</div>
						<div class="wrap_check">
							<input type="checkbox" id="policyAgree" name="q" value="yes" />
							<label for="policyAgree"><svg
									shape-rendering="optimizeQuality"
									preserveAspectRatio="xMidYMid meet" viewBox="0 0 64 64"
									version="1.1" xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink">
    <rect class="outer" fill="#BDBCB9" x="0" y="0" width="64"
										height="64" rx="8"></rect>
    <rect class="inner" fill="#BDBCB9" x="4" y="4" width="56"
										height="56" rx="4"></rect>
    <polyline class="check" stroke="#FFFFFF" stroke-dasharray="270"
										stroke-dashoffset="270" stroke-width="8"
										stroke-linecap="round" fill="none" stroke-linejoin="round"
										points="16 31.8 27.4782609 43 49 22"></polyline>
  </svg></label>
						</div>
					</div>
					<div class="wrap-btns">
						<button type="button" class="link_back">
							<span class="ico_join"></span>◀ 이전으로
						</button>
						<button type="button" id="nextBtn"
							class="btn_comm btn_type1 disabled">동의하기</button>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	<script>
		
		function checkAgreeState() {
			if ($("#termsAgree").is(":checked")
					&& $("#policyAgree").is(":checked")) {
				$("#nextBtn").removeClass("disabled").focus();
			} else {
				$("#nextBtn").addClass("disabled");
			}
		}
		
	

		  $("#nextBtn").click(function() {
					if ($("#termsAgree").prop("checked") && $("#policyAgree").prop("checked")) {
						location.href="../member/memberJoinForm.jsp";
						return true;
					} else {
						alert("서비스 약관과 개인정보 수집 및 이용에 대해 모두 동의해 주세요.");
						return false;
					}
				});

		/* $(".link_back").click(function() {
			
		}); */

	</script>
</body>
</html>