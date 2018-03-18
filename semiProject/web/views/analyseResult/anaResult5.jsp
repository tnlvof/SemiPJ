<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, com.kh.pj.analyse.controller.*"%>
<% 
	AnalyseMethod am = new AnalyseMethod();
	HashMap<String, ArrayList<HashMap>> allTable = (HashMap<String, ArrayList<HashMap>>)session.getAttribute("allTable");
	ArrayList<HashMap> front = null;

	if(allTable!=null){
		front = allTable.get("상권_집객시설");
	}
	
	HashMap<String, String> frontRecentRow = front.get(0);
	
	String recentDate = String.valueOf(frontRecentRow.get("기준_년월_코드")).substring(0, 4) + "년 " + String.valueOf(frontRecentRow.get("기준_년월_코드")).substring(4, 6) + "월";
	System.out.println("지역분석에 사용자 접속");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<%@ include file="../common/resultMenu.jsp" %>
	<h1 align="center">지역분석</h1>
	
	<h3 align="center">1. 주요시설</h3>
	<div class="titleDiv">
	.	<div class="printBtn" id="printBtn">집객시설 다운로드</div>
	</div>
	<div class="anaResult detailResult0"></div>
	<div class="anaResult detailResult1"></div>
	<div class="tableArea">
		<table border="1">
			<tr>
				<th>지역</th>
				<th>시설 총 수</th>
				<th>은행</th>
				<th>관공서</th>
				<th>숙박시설</th>
				<th>슈퍼마켓</th>
				<th>백화점</th>
				<th>극장</th>
				<th>약국</th>
				<th>일반병원</th>
				<th>종합병원</th>
			</tr>
			<tr>
				<th><%=frontRecentRow.get("상권_코드_명") %></th>
				<td><%=frontRecentRow.get("집객시설_수") %></td>
				<td><%=frontRecentRow.get("은행_수") %></td>
				<td><%=frontRecentRow.get("관공서_수") %></td>
				<td><%=frontRecentRow.get("숙박_시설_수") %></td>
				<td><%=frontRecentRow.get("슈퍼마켓_수") %></td>
				<td><%=frontRecentRow.get("백화점_수") %></td>
				<td><%=frontRecentRow.get("극장_수") %></td>
				<td><%=frontRecentRow.get("약국_수") %></td>
				<td><%=frontRecentRow.get("일반_병원_수") %></td>
				<td><%=frontRecentRow.get("종합병원_수") %></td>

			</tr>
		</table>
	</div>
	
	<h3 align="center">2. 학교시설</h3>
	<div class="anaResult detailResult2"></div>
	<div class="tableArea">
		<table border="1">
			<tr>
				<th>지역</th>
				<th>유치원</th>
				<th>초등학교</th>
				<th>중학교</th>
				<th>고등학교</th>
				<th>대학교</th>
			</tr>
			<tr>
				<th><%=frontRecentRow.get("상권_코드_명") %></th>
				<td><%=frontRecentRow.get("유치원_수") %></td>
				<td><%=frontRecentRow.get("초등학교_수") %></td>
				<td><%=frontRecentRow.get("중학교_수") %></td>
				<td><%=frontRecentRow.get("고등학교_수") %></td>
				<td><%=frontRecentRow.get("대학교_수") %></td>
			</tr>
		</table>
	</div>
	
	<h3 align="center">3. 교통시설</h3>
	<div class="anaResult detailResult3"></div>
	<div class="tableArea">
		<table border="1">
			<tr>
				<th>지역</th>
				<th>버스정거장</th>
				<th>버스터미널</th>
				<th>지하철역</th>
				<th>철도역</th>
				<th>공항</th>
			</tr>
			<tr>
				<th><%=frontRecentRow.get("상권_코드_명") %></th>
				<td><%=frontRecentRow.get("버스_정거장_수") %></td>
				<td><%=frontRecentRow.get("버스_터미널_수") %></td>
				<td><%=frontRecentRow.get("지하철_역_수") %></td>
				<td><%=frontRecentRow.get("철도_역_수") %></td>
				<td><%=frontRecentRow.get("공항_수") %></td>
			</tr>
		</table>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
<script>
	$(function(){
		$("#printBtn").click(function(){
			location.href='<%=request.getContextPath()%>/downloadExcel.an?tableName=상권_집객시설&areaCode=<%=frontRecentRow.get("상권_코드")%>';
		});	
	
		<% 
		String[] ferLineText = {"detailResult0", "집객시설 수 추이 ("+recentDate+"기준)", "집객시설 수", "개", am.getCategories("기준_년월_코드", front)};
		String[] ferLinedataName = {"상권"};
		String[] ferLinedata = {am.getData("집객시설_수", 1, front)};
		out.print(am.getLine(ferLineText, ferLinedataName, ferLinedata));
		
		String[] ferBarText = {"detailResult1", "주요시설 현황 ("+recentDate+"기준)", "시설 수", "개", new String("'은행','관공서', '숙박시설', '슈퍼마켓', '백화점', '극장', '약국', '일반병원', '종합병원'")};
		String[] ferBardataName = {"상권"};
		String[] ferBardata = {frontRecentRow.get("은행_수")+","+frontRecentRow.get("관공서_수")+","+frontRecentRow.get("숙박_시설_수")+","+frontRecentRow.get("슈퍼마켓_수")+","+frontRecentRow.get("백화점_수")+","+frontRecentRow.get("극장_수")+","+frontRecentRow.get("약국_수")+","+frontRecentRow.get("일반_병원_수")+","+frontRecentRow.get("종합병원_수")};
		out.print(am.getBar(ferBarText, ferBardataName, ferBardata));
		
		String[] schBarText = {"detailResult2", "학교시설 현황 ("+recentDate+"기준)", "시설 수", "개", new String("'유치원','초등학교', '중학교', '고등학교', '대학교'")};
		String[] schBardataName = {"상권"};
		String[] schBardata = {frontRecentRow.get("유치원_수")+","+frontRecentRow.get("초등학교_수")+","+frontRecentRow.get("중학교_수")+","+frontRecentRow.get("고등학교_수")+","+frontRecentRow.get("대학교_수")};
		out.print(am.getBar(schBarText, schBardataName, schBardata));
		
		String[] transBarText = {"detailResult3", "교통시설 현황 ("+recentDate+"기준)", "시설 수", "개", new String("'버스 정거장','버스 터미널', '지하철 역', '철도 역', '공항'")};
		String[] transBardataName = {"상권"};
		String[] transBardata = {frontRecentRow.get("버스_정거장_수")+","+frontRecentRow.get("버스_터미널_수")+","+frontRecentRow.get("지하철_역_수")+","+frontRecentRow.get("철도_역_수")+","+frontRecentRow.get("공항_수")};
		out.print(am.getBar(transBarText, transBardataName, transBardata));
		%>
	});
</script>
</html>