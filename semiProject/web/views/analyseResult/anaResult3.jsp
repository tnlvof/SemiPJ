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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인구분석</title>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<%@ include file="../common/resultMenu.jsp" %>
	<h1 align="center">인구분석</h1>
	
	<h3 align="center">1. 유동인구</h3>
	<div class="anaResult detailResult0"></div>
	<div class="tableArea">
		<table>
			<tr>
				<th>지역</th>
				<th><%=dates[0] %></th>
				<th><%=dates[1] %></th>
				<th><%=dates[2] %></th>
			</tr>
			<tr>
				<th><%=moveFrontRecentRow.get("상권_코드_명") %></th>
				<th><%=moveFront.get(2).get("총_수") %></th>
				<th><%=moveFront.get(1).get("총_수") %></th>
				<th><%=moveFront.get(0).get("총_수") %></th>
			</tr>		
		</table>
	</div>
	<div class="anaResult detailResult1"><div class="twoPie Pie1"></div><div class="twoPie Pie2"></div></div>
	<div class="tableArea">
		<table>
			<tr>
				<th rowspan="2">지역</th>
				<th colspan="2">성별</th>
				<th colspan="6">연령</th>
			</tr>
				<th>남성</th>
				<th>여성</th>
				<th>10대</th>
				<th>20대</th>
				<th>30대</th>
				<th>40대</th>
				<th>50대</th>
				<th>60대이상</th>
			<tr>
				<th><%=moveFrontRecentRow.get("상권_코드_명") %></th>
				<td><%=moveFrontRecentRow.get("남성_수") %></td>
				<td><%=moveFrontRecentRow.get("여성_수") %></td>
				<td><%=moveFrontRecentRow.get("연령대_10_수") %></td>
				<td><%=moveFrontRecentRow.get("연령대_20_수") %></td>
				<td><%=moveFrontRecentRow.get("연령대_30_수") %></td>
				<td><%=moveFrontRecentRow.get("연령대_40_수") %></td>
				<td><%=moveFrontRecentRow.get("연령대_50_수") %></td>
				<td><%=moveFrontRecentRow.get("연령대_60_이상_수") %></td>
			</tr>		
		</table>
	</div>
	
	<div class="anaResult detailResult2"><div class="twoPie Pie1"></div><div class="twoPie Pie2"></div></div>
	<div class="tableArea">
		<table>
			<tr>
				<th rowspan="2">지역</th>
				<th colspan="6">시간대</th>
				<th colspan="7">요일</th>
			</tr>
				<th>00~06</th>
				<th>06~11</th>
				<th>11~14</th>
				<th>14~17</th>
				<th>17~21</th>
				<th>21~24</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th>토</th>
				<th>일</th>
			<tr>
				<th><%=moveFrontRecentRow.get("상권_코드_명") %></th>
				<td><%=moveFrontRecentRow.get("시간대_1_수") %></td>
				<td><%=moveFrontRecentRow.get("시간대_2_수") %></td>
				<td><%=moveFrontRecentRow.get("시간대_3_수") %></td>
				<td><%=moveFrontRecentRow.get("시간대_4_수") %></td>
				<td><%=moveFrontRecentRow.get("시간대_5_수") %></td>
				<td><%=moveFrontRecentRow.get("시간대_6_수") %></td>
				<td><%=moveFrontRecentRow.get("월요일_수") %></td>
				<td><%=moveFrontRecentRow.get("화요일_수") %></td>
				<td><%=moveFrontRecentRow.get("수요일_수") %></td>
				<td><%=moveFrontRecentRow.get("목요일_수") %></td>
				<td><%=moveFrontRecentRow.get("금요일_수") %></td>
				<td><%=moveFrontRecentRow.get("토요일_수") %></td>
				<td><%=moveFrontRecentRow.get("일요일_수") %></td>
			</tr>		
		</table>
	</div>
	<hr>
	
	<h3 align="center">2. 상주인구</h3>
	<div class="anaResult detailResult3"><div class="twoPie Pie1"></div><div class="twoPie Pie2"></div></div>
	<div class="tableArea">
		<table>
			<tr>
				<th rowspan="2">지역</th>
				<th colspan="2">성별</th>
				<th colspan="6">연령</th>
			</tr>
				<th>남성</th>
				<th>여성</th>
				<th>10대</th>
				<th>20대</th>
				<th>30대</th>
				<th>40대</th>
				<th>50대</th>
				<th>60대이상</th>
			<tr>
				<td><%=liveFrontRecentRow.get("상권_코드_명") %></td>
				<td><%=liveFrontRecentRow.get("남성_수") %></td>
				<td><%=liveFrontRecentRow.get("여성_수") %></td>
				<td><%=liveFrontRecentRow.get("연령대_10_수") %></td>
				<td><%=liveFrontRecentRow.get("연령대_20_수") %></td>
				<td><%=liveFrontRecentRow.get("연령대_30_수") %></td>
				<td><%=liveFrontRecentRow.get("연령대_40_수") %></td>
				<td><%=liveFrontRecentRow.get("연령대_50_수") %></td>
				<td><%=liveFrontRecentRow.get("연령대_60_이상_수") %></td>
			</tr>		
		</table>
	</div>
	<hr>
	
	<h3 align="center">3. 직장인구</h3>
	<div class="anaResult detailResult4"><div class="twoPie Pie1"></div><div class="twoPie Pie2"></div></div>
	<div class="tableArea">
		<table>
			<tr>
				<th rowspan="2">지역</th>
				<th colspan="2">성별</th>
				<th colspan="6">연령</th>
			</tr>
				<th>남성</th>
				<th>여성</th>
				<th>10대</th>
				<th>20대</th>
				<th>30대</th>
				<th>40대</th>
				<th>50대</th>
				<th>60대이상</th>
			<tr>
				<th><%=workFrontRecentRow.get("상권_코드_명") %></th>
				<td><%=workFrontRecentRow.get("남성_수") %></td>
				<td><%=workFrontRecentRow.get("여성_수") %></td>
				<td><%=workFrontRecentRow.get("연령대_10_수") %></td>
				<td><%=workFrontRecentRow.get("연령대_20_수") %></td>
				<td><%=workFrontRecentRow.get("연령대_30_수") %></td>
				<td><%=workFrontRecentRow.get("연령대_40_수") %></td>
				<td><%=workFrontRecentRow.get("연령대_50_수") %></td>
				<td><%=workFrontRecentRow.get("연령대_60_이상_수") %></td>
			</tr>		
		</table>
	</div>
	<hr>
	
	<h3 align="center">4. 주거형태</h3>
	<div class="anaResult detailResult5"></div>
	<div class="tableArea">
		<table>
			<tr>
				<th>지역</th>
				<th>총 가구 수</th>
				<th>아파트 가구 수</th>
				<th>비 아파트 가구 수</th>
			</tr>
			<tr>
				<th><%=liveFrontRecentRow.get("상권_코드_명") %></th>
				<td><%=liveFrontRecentRow.get("총_가구_수") %></td>
				<td><%=liveFrontRecentRow.get("아파트_가구_수") %></td>
				<td><%=liveFrontRecentRow.get("비_아파트_가구_수") %></td>
			</tr>
		</table>
	</div>
	<hr>
	<script>
	$(function () {	
		    <%
		    String[] moveLineText = {"detailResult0", "유동인구 추이 ("+recentDate+"기준)", "유동인구", "명", am.getCategories("기준_년월_코드", moveFront)};
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
</body>
</html>