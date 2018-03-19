<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, com.kh.pj.analyse.controller.*"%>
<% 
	AnalyseMethod am = new AnalyseMethod();
	HashMap<String, ArrayList<HashMap>> allTable = (HashMap<String, ArrayList<HashMap>>)session.getAttribute("allTable");
	ArrayList<HashMap> moveFront = null;
	ArrayList<HashMap> liveFront = null;
	ArrayList<HashMap> workFront = null;
	ArrayList<HashMap> aprtFront = null;
	if(allTable!=null){
		moveFront = allTable.get("상권_추정유동인구");
		liveFront = allTable.get("상권_상주인구");
		workFront = allTable.get("상권_직장인구");
		aprtFront = allTable.get("상권_아파트");
	}
	HashMap<String, String> moveFrontRecentRow = moveFront.get(0);
	HashMap<String, String> liveFrontRecentRow = liveFront.get(0);
	HashMap<String, String> workFrontRecentRow = workFront.get(0);
	HashMap<String, String> aprtFrontRecentRow = aprtFront.get(0);
	
	String[] dates = am.getCategories("기준_년월_코드", moveFront).split(",");
	
	String recentDate = String.valueOf(moveFrontRecentRow.get("기준_년월_코드")).substring(0, 4) + "년 " + String.valueOf(moveFrontRecentRow.get("기준_년월_코드")).substring(4, 6) + "월";
	
	String catagoryCode = (String)session.getAttribute("catagoryCode");
	String[] catagoryName = am.getCatagoryName(catagoryCode);

	System.out.println("인구분석에 사용자 접속");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인구분석</title>
<style type="text/css">
	.tableArea td{
		border:1px solid black;
		vertical-align:middle;
		width:50px;
		height:30px;
	}
	.tableArea th{
		border:1px solid black;
		vertical-align:middle;
		width:50px;
		height:30px;
		background:lightgray;
	}
	.tableArea table {
		width:1000px;
	}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<%@ include file="../common/resultMenu.jsp" %>
	<h1 align="center">인구분석</h1>
	
	<h3 align="center">1. 유동인구</h3>
	<div class="titleDiv">
선택한 업종 : <%=catagoryName[0] +" > "+ catagoryName[1] %>
		<div class="printBtn" id="printBtn1">유동인구 다운로드</div>
	</div>
	<div class="anaResult detailResult0"></div>

	<div align="center" class="tableArea">
		<table>
			<tr align="center">
				<th>지역</th>
				<th>2017.06</th>
				<th>2017.07</th>
				<th>2017.08</th>
			</tr>
			<tr align="center">
				<th><%= moveFrontRecentRow.get("상권_코드_명") %></th>
				<td><%= moveFront.get(0).get("총_수") %>명</td>
				<td><%= moveFront.get(1).get("총_수") %>명</td>
				<td><%= moveFront.get(2).get("총_수") %>명</td>
			</tr>
		</table>
	</div>
	<br><br>
	<div class="anaResult1 detailResult1"><div class="twoPie Pie1"></div>
	<div class="twoPie Pie2"></div></div>
	<div align="center" class="tableArea">
	<table border="1">
		<tr align="center">
			<th rowspan="2">지역</th>
			<th rowspan="2">구분</th>
			<th colspan="2">성별</th>
			<th colspan="6">연령별</th>
		</tr>
		<tr align="center">
			<th>남성</th>
			<th>여성</th>
			<th>10대</th>
			<th>20대</th>
			<th>30대</th>
			<th>40대</th>
			<th>50대</th>
			<th>60대이상</th>
		</tr>
		<tr align="center">
			<th rowspan="2"><%= moveFrontRecentRow.get("상권_코드_명") %></th>
			<th>명</th>
			<td><%= moveFront.get(0).get("남성_수") %>명</td>
			<td><%= moveFront.get(0).get("여성_수") %>명</td>
			<td><%= moveFront.get(0).get("연령대_10_수") %>명</td>
			<td><%= moveFront.get(0).get("연령대_20_수") %>명</td>
			<td><%= moveFront.get(0).get("연령대_30_수") %>명</td>
			<td><%= moveFront.get(0).get("연령대_40_수") %>명</td>
			<td><%= moveFront.get(0).get("연령대_50_수") %>명</td>
			<td><%= moveFront.get(0).get("연령대_60_이상_수") %>명</td>
		</tr>
	</table>
	</div>
	<br><br>
	<div class="anaResult1 detailResult2"><div class="twoPie Pie1"></div>
	<div class="twoPie Pie2"></div></div>
	<div align="center" class="tableArea">
	<table border="1">
		<tr align="center">
			<th>지역</th>
			<th>구분</th>
			<th>00 ~ 06시</th>
			<th>06 ~ 12시</th>
			<th>12 ~ 15시</th>
			<th>15 ~ 18시</th>
			<th>18 ~ 21시</th>
			<th>21 ~ 24시</th>
		</tr>
		<tr align="center">
			<th rowspan="2"><%= moveFrontRecentRow.get("상권_코드_명") %></th>
			<th>명</th>
			<td><%= moveFront.get(0).get("시간대_1_수") %>명</td>
			<td><%= moveFront.get(0).get("시간대_2_수") %>명</td>
			<td><%= moveFront.get(0).get("시간대_3_수") %>명</td>
			<td><%= moveFront.get(0).get("시간대_4_수") %>명</td>
			<td><%= moveFront.get(0).get("시간대_5_수") %>명</td>
			<td><%= moveFront.get(0).get("시간대_6_수") %>명</td>
		</tr>
	</table>
	</div>
	<br><br>
	<h3 align="center">2. 상주인구</h3>
	<div class="titleDiv">
선택한 업종 : <%=catagoryName[0] +" > "+ catagoryName[1] %>
		<div class="printBtn" id="printBtn2">상주인구 다운로드</div>
	</div>
	<div class="anaResult1 detailResult3"><div class="twoPie Pie1"></div>
	<div class="twoPie Pie2"></div></div>
	<div align="center" class="tableArea">
	<table border="1">
		<tr align="center">
			<th rowspan="2">지역</th>
			<th rowspan="2">구분</th>
			<th colspan="2">성별</th>
			<th colspan="6">연령별</th>
		</tr>
		<tr align="center">
			<th>남성</th>
			<th>여성</th>
			<th>10대</th>
			<th>20대</th>
			<th>30대</th>
			<th>40대</th>
			<th>50대</th>
			<th>60대이상</th>
		</tr>
		<tr align="center">
			<th rowspan="2"><%= moveFrontRecentRow.get("상권_코드_명") %></th>
			<th>명</th>
			<td><%= liveFront.get(0).get("남성_수") %>명</td>
			<td><%= liveFront.get(0).get("여성_수") %>명</td>
			<td><%= liveFront.get(0).get("연령대_10_수") %>명</td>
			<td><%= liveFront.get(0).get("연령대_20_수") %>명</td>
			<td><%= liveFront.get(0).get("연령대_30_수") %>명</td>
			<td><%= liveFront.get(0).get("연령대_40_수") %>명</td>
			<td><%= liveFront.get(0).get("연령대_50_수") %>명</td>
			<td><%= liveFront.get(0).get("연령대_60_이상_수") %>명</td>
		</tr>
	</table>
	</div>
	<br><br>
	<h3 align="center">3. 직장인구</h3>
	<div class="titleDiv">
선택한 업종 : <%=catagoryName[0] +" > "+ catagoryName[1] %>
		<div class="printBtn" id="printBtn3">직장인구 다운로드</div>
	</div>
	<div class="anaResult1 detailResult4"><div class="twoPie Pie1"></div>
	<div class="twoPie Pie2"></div></div>
	<div align="center" class="tableArea">
	<table border="1">
		<tr align="center">
			<th rowspan="2">지역</th>
			<th rowspan="2">구분</th>
			<th colspan="2">성별</th>
			<th colspan="6">연령별</th>
		</tr>
		<tr align="center">
			<th>남성</th>
			<th>여성</th>
			<th>10대</th>
			<th>20대</th>
			<th>30대</th>
			<th>40대</th>
			<th>50대</th>
			<th>60대이상</th>
		</tr>
		<tr align="center">
			<th rowspan="2"><%= moveFrontRecentRow.get("상권_코드_명") %></th>
			<th>명</th>
			<td><%= workFront.get(0).get("남성_수") %>명</td>
			<td><%= workFront.get(0).get("여성_수") %>명</td>
			<td><%= workFront.get(0).get("연령대_10_수") %>명</td>
			<td><%= workFront.get(0).get("연령대_20_수") %>명</td>
			<td><%= workFront.get(0).get("연령대_30_수") %>명</td>
			<td><%= workFront.get(0).get("연령대_40_수") %>명</td>
			<td><%= workFront.get(0).get("연령대_50_수") %>명</td>
			<td><%= workFront.get(0).get("연령대_60_이상_수") %>명</td>
		</tr>
	</table>
	</div>
	<br><br>
	<h3 align="center">4. 주거형태</h3>
	<div class="titleDiv">
선택한 업종 : <%=catagoryName[0] +" > "+ catagoryName[1] %>
		<div class="printBtn" id="printBtn4">아파트 다운로드</div>
	</div>
	<div class="anaResult detailResult5"></div>
	<div align="center" class="tableArea">
	<table border="1">
		<tr align="center">
			<th rowspan="2">지역</th>
			<th rowspan="2">구분</th>
			<th colspan="2">2017.05</th>
			<th colspan="2">2017.06</th>
			<th colspan="2">2017.07</th>
			<th colspan="2">2017.08</th>
		</tr>
		<tr align="center">
			<th>아파트 가구 수</th>
			<th>비 아파트 가구 수</th>
			<th>아파트 가구 수</th>
			<th>비 아파트 가구 수</th>
			<th>아파트 가구 수</th>
			<th>비 아파트 가구 수</th>
			<th>아파트 가구 수</th>
			<th>비 아파트 가구 수</th>
			
		</tr>
		<tr align="center">
			<th rowspan="2"><%= moveFrontRecentRow.get("상권_코드_명") %></th>
			<th>가구</th>
			<td><%= liveFront.get(0).get("아파트_가구_수") %></td>
			<td><%= liveFront.get(0).get("비_아파트_가구_수") %></td>
			<td><%= liveFront.get(1).get("아파트_가구_수") %></td>
			<td><%= liveFront.get(1).get("비_아파트_가구_수") %></td>
			<td><%= liveFront.get(2).get("아파트_가구_수") %></td>
			<td><%= liveFront.get(2).get("비_아파트_가구_수") %></td>
			<td><%= liveFront.get(3).get("아파트_가구_수") %></td>
			<td><%= liveFront.get(3).get("비_아파트_가구_수") %></td>
		</tr>
	</table>
	</div>
	<br><br>

	<script>
	$(function () {	
		$("#printBtn1").click(function(){
			location.href='<%=request.getContextPath()%>/downloadExcel.an?tableName=상권_추정유동인구&areaCode=<%=moveFrontRecentRow.get("상권_코드")%>';
		});	
		$("#printBtn2").click(function(){
			location.href='<%=request.getContextPath()%>/downloadExcel.an?tableName=상권_상주인구&areaCode=<%=moveFrontRecentRow.get("상권_코드")%>';
		});	
		$("#printBtn3").click(function(){
			location.href='<%=request.getContextPath()%>/downloadExcel.an?tableName=상권_직장인구&areaCode=<%=moveFrontRecentRow.get("상권_코드")%>';			
		});	
		$("#printBtn4").click(function(){
			location.href='<%=request.getContextPath()%>/downloadExcel.an?tableName=상권_아파트&areaCode=<%=moveFrontRecentRow.get("상권_코드")%>';
		});	
		
	
		    <%
		    String[] moveLineText = {"detailResult0", "월별 유동인구 ("+recentDate+"기준)", "유동인구", "명", am.getCategories("기준_년월_코드", moveFront)};
			String[] moveLinedataName = {"상권"};
			String[] moveLinedata = {am.getData("총_수", 1, moveFront)};
			out.print(am.getLine(moveLineText, moveLinedataName, moveLinedata));
			
			String[] moveGenderBarText = {"detailResult1 .Pie1", "성별별 유동인구 ("+recentDate+"기준)", "유동인구", "명", new String("'남성', '여성'")};
			String[] moveGenderBardataName = {"상권"};
			String[] moveGenderBardata = {moveFrontRecentRow.get("남성_수")+","+moveFrontRecentRow.get("여성_수")};
			out.print(am.getBar(moveGenderBarText, moveGenderBardataName, moveGenderBardata));
			
			String[] moveAgeBarText = {"detailResult1 .Pie2", "연령별 유동인구 ("+recentDate+"기준)", "유동인구", "명", new String("'10대', '20대', '30대', '40대', '50대', '60대 이상'")};
			String[] moveAgeBardataName = {"상권"};
			String[] moveAgeBardata = {moveFrontRecentRow.get("연령대_10_수")+","+moveFrontRecentRow.get("연령대_20_수")+","+moveFrontRecentRow.get("연령대_30_수")+","+moveFrontRecentRow.get("연령대_40_수")+","+moveFrontRecentRow.get("연령대_50_수")+","+moveFrontRecentRow.get("연령대_60_이상_수")};
			out.print(am.getBar(moveAgeBarText, moveAgeBardataName, moveAgeBardata));
			
			String[] moveTimeBarText = {"detailResult2 .Pie1", "시간대별 유동인구 ("+recentDate+"기준)", "유동인구", "명", new String("'00시~06시', '06시~11시', '11시~14시', '14시~17시', '17시~21시', '21시~24시'")};
			String[] moveTimeBardataName = {"상권"};
			String[] moveTimeBardata = {moveFrontRecentRow.get("시간대_1_수")+","+moveFrontRecentRow.get("시간대_2_수")+","+moveFrontRecentRow.get("시간대_3_수")+","+moveFrontRecentRow.get("시간대_4_수")+","+moveFrontRecentRow.get("시간대_5_수")+","+moveFrontRecentRow.get("시간대_6_수")};
			out.print(am.getBar(moveTimeBarText, moveTimeBardataName, moveTimeBardata));
			
			String[] moveDayBarText = {"detailResult2 .Pie2", "요일별 유동인구 ("+recentDate+"기준)", "유동인구", "명", new String("'월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'")};
			String[] moveDayBardataName = {"상권"};
			String[] moveDayBardata = {moveFrontRecentRow.get("월요일_수")+","+moveFrontRecentRow.get("화요일_수")+","+moveFrontRecentRow.get("수요일_수")+","+moveFrontRecentRow.get("목요일_수")+","+moveFrontRecentRow.get("금요일_수")+","+moveFrontRecentRow.get("토요일_수")+","+moveFrontRecentRow.get("일요일_수")};
			out.print(am.getBar(moveDayBarText, moveDayBardataName, moveDayBardata));
			
			String[] liveGenderBarText = {"detailResult3 .Pie1", "성별별 상주인구 ("+recentDate+"기준)", "상주인구", "명", new String("'남성', '여성'")};
			String[] liveGenderBardataName = {"상권"};
			String[] liveGenderBardata = {liveFrontRecentRow.get("남성_수")+","+liveFrontRecentRow.get("여성_수")};
			out.print(am.getBar(liveGenderBarText, liveGenderBardataName, liveGenderBardata));
			
			String[] liveAgeBarText = {"detailResult3 .Pie2", "연령별 상주인구 ("+recentDate+"기준)", "상주인구", "명", new String("'10대', '20대', '30대', '40대', '50대', '60대 이상'")};
			String[] liveAgeBardataName = {"상권"};
			String[] liveAgeBardata = {liveFrontRecentRow.get("연령대_10_수")+","+liveFrontRecentRow.get("연령대_20_수")+","+liveFrontRecentRow.get("연령대_30_수")+","+liveFrontRecentRow.get("연령대_40_수")+","+liveFrontRecentRow.get("연령대_50_수")+","+liveFrontRecentRow.get("연령대_60_이상_수")};
			out.print(am.getBar(liveAgeBarText, liveAgeBardataName, liveAgeBardata));
			
			String[] workGenderBarText = {"detailResult4 .Pie1", "성별별 직장인구 ("+recentDate+"기준)", "직장인구", "명", new String("'남성', '여성'")};
			String[] workGenderBardataName = {"상권"};
			String[] workGenderBardata = {workFrontRecentRow.get("남성_수")+","+workFrontRecentRow.get("여성_수")};
			out.print(am.getBar(workGenderBarText, workGenderBardataName, workGenderBardata));
			
			String[] workAgeBarText = {"detailResult4 .Pie2", "연령별 직장인구 ("+recentDate+"기준)", "직장인구", "명", new String("'10대', '20대', '30대', '40대', '50대', '60대 이상'")};
			String[] workAgeBardataName = {"상권"};
			String[] workAgeBardata = {workFrontRecentRow.get("연령대_10_수")+","+workFrontRecentRow.get("연령대_20_수")+","+workFrontRecentRow.get("연령대_30_수")+","+workFrontRecentRow.get("연령대_40_수")+","+workFrontRecentRow.get("연령대_50_수")+","+workFrontRecentRow.get("연령대_60_이상_수")};
			out.print(am.getBar(workAgeBarText, workAgeBardataName, workAgeBardata));
			
			 String[] aprtLineText = {"detailResult5", "아파트 가구수 추이 ("+recentDate+"기준)", "세대수", "가구", am.getCategories("기준_년월_코드", liveFront)};
			String[] aprtLinedataName = {"아파트 가구", "비 아파트 가구"};
			String[] aprtLinedata = {am.getData("아파트_가구_수", 1, liveFront), am.getData("비_아파트_가구_수", 1, liveFront)};
			out.print(am.getLine(aprtLineText, aprtLinedataName, aprtLinedata));
		    %>
	});	
	</script>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>