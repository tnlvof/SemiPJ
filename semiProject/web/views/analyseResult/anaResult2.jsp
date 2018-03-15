<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, com.kh.pj.analyse.controller.*"%>
<% 

	AnalyseMethod am = new AnalyseMethod();


	String catagoryCode = (String)session.getAttribute("catagoryCode");
	String[] catagoryName = am.getCatagoryName(catagoryCode);
	
	HashMap<String, ArrayList<HashMap>> allTable = (HashMap<String, ArrayList<HashMap>>)session.getAttribute("allTable");
	
	ArrayList<HashMap> frontTable = null;
	//ArrayList<HashMap> backTable = null;
	if(allTable!=null){
		frontTable = allTable.get("상권_추정매출");
		//backTable = allTable.get("상권배후지_추정매출");
	}	
	System.out.print(frontTable.size());
	ArrayList<HashMap> frontRows = new ArrayList<HashMap>();
	//ArrayList<HashMap> backRows = new ArrayList<HashMap>();
	for(HashMap<String, String> hm:frontTable){
		if(hm.get("서비스_업종_코드").equals(catagoryCode)){				
			frontRows.add(hm);
		}
	}
	
	/* for(HashMap<String, String> hm:backTable){
		if(hm.get("서비스_업종_코드").equals(catagoryCode)){				
			backRows.add(hm);	
		}
	} */
	
	HashMap<String, String> frontRecentRow = frontRows.get(0);
	//HashMap<String, String> backRecentRow = backRows.get(0);
	
	String recentDate = String.valueOf(frontRecentRow.get("기준_년월_코드")).substring(0, 4) + "년 " + String.valueOf(frontRecentRow.get("기준_년월_코드")).substring(4, 6) + "월";
	
	ArrayList<HashMap> frontRecentRows = new ArrayList<HashMap>();
	//ArrayList<HashMap> backRecentRows = new ArrayList<HashMap>();
	for(HashMap<String, String> hm:frontTable){
		if(hm.get("기준_년월_코드").equals(frontRecentRow.get("기준_년월_코드"))&&hm.get("서비스_업종_코드").contains(catagoryCode.substring(0, 3))){				
			frontRecentRows.add(hm);
		}
	}
	/* for(HashMap<String, String> hm:backTable){
		if(hm.get("기준_년월_코드").equals(frontRecentRow.get("기준_년월_코드"))&&hm.get("서비스_업종_코드").contains(catagoryCode.substring(0, 3))){				
			backRecentRows.add(hm);
		}
	} */
	String[] date= {"201708", "201709", "201710","201711"};
	long[] much = new long[4];
	long[] count = new long[4];
   for(int i = 0; i < date.length; i++){
      for(HashMap<String, String> hm:frontTable){
         if(hm.get("기준_년월_코드").equals(date[i])&&hm.get("서비스_업종_코드").contains(catagoryCode.substring(0, 3))){            
            much[i] += Long.parseLong(String.valueOf(hm.get("당월_금액")));
            count[i] += Long.parseLong(String.valueOf(hm.get("당월_건수")));
         }
      }
   }

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	.tableArea1 table {
		width:1000px;
		width:1000px;
	}
	.tableArea1 td{
		width:1000px;
		height:30px;
	}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<%@ include file="../common/resultMenu.jsp" %>
	<h1 align="center">매출분석</h1>
	선택한 업종 : <%=catagoryName[0] +" > "+ catagoryName[1] %>
	<!-- <h2 align="center">1. 업종별 추이</h2>
	<hr> -->
	
	<h2 align="center">1. 상권별 매출비교</h2>
	<div class="anaResult detailResult0"></div>
	<div class="anaResult detailResult1"><div class="twoPie Pie1"></div><div class="twoPie Pie2"></div></div>
	<div align="center" class="tableArea">
	<table border="1">
		<tr align="center">
			<th rowspan="2">구분</th>
			<th rowspan="2" colspan="2">업종</th>
			<th>2017년08월</th>
			<th>2017년09월</th>
			<th>2017년10월</th>
			<th>2017년11월</th>
		</tr>
		<tr align="center">
			<th>액/건</th>
			<th>액/건</th>
			<th>액/건</th>
			<th>액/건</th>
		</tr>
		<tr align="center">
			<td rowspan="2">소분류</td>
			<td rowspan="2"><%= catagoryName[1] %></td>
			<td>매출액</td>
			<td><%= frontRows.get(0).get("당월_금액") %></td>
			<td><%= frontRows.get(1).get("당월_금액") %></td>
			<td><%= frontRows.get(2).get("당월_금액") %></td>
			<td><%= frontRows.get(3).get("당월_금액") %></td>
		</tr>
		<tr align="center">
			<td>건수</td>
			<td><%= frontRows.get(0).get("당월_건수") %></td>
			<td><%= frontRows.get(1).get("당월_건수") %></td>
			<td><%= frontRows.get(2).get("당월_건수") %></td>
			<td><%= frontRows.get(3).get("당월_건수") %></td>
			
		</tr>
		<tr align="center">
			<td rowspan="2">대분류</td>
			<td rowspan="2"><%= catagoryName[0] %></td>
			<td>매출액</td>
			<td><%= much[0] %></td>
			<td><%= much[1] %></td>
			<td><%= much[2] %></td>
			<td><%= much[3] %></td>
		</tr>
		<tr align="center">
			<td>건수</td>
			<td><%= count[0] %></td>
			<td><%= count[1] %></td>
			<td><%= count[2] %></td>
			<td><%= count[3] %></td>
			
		</tr>
	</table>
	</div>
	<div align="center">
    	<em>TIP</em>
    	<table class="tableArea1" align="center">
    	<tr>
    		<td>
    			<ul>
       		 		<li>최근 6개월간 매출액 통계 추이를 통해 업종의 계절적 변동성, 성장성 등을 판단할 수 있으며, 업소수 변화추이와 비교하여 경쟁관계의 변화 등을 가늠해볼 수 있습니다. 
       	 			<strong>이용건수</strong>는 매출액에 대한 결제건수를 의미하므로, 특정업종(예, 음식업)의 경우에는 이용고객수를 의미하지는 않습니다만, 
       	 			<strong>이용횟수의 변화</strong>를 확인할 수 있습니다. </li>
    			</ul>	
    		</td>
    	
    	</tr>
    	</table>
	</div>
	<div>
		<p>매출액 통계는 카드사 가맹점 매출통계를 기반으로 추정된 정보로서, 세부적인 조건(점포면적, 점포 위치의 입지조건, 서비스 품질 등)에 따라 달라질 수 있으니 참고 정보로만 활용하시기 바랍니다.
해당지역의 선택업종이 없는 경우 표출 되지 않습니다.</p>
	</div>
	
	<br><br>
	
	<h2 align="center">2. 시기별 매출특성</h2>
	<div class="anaResult detailResult2"><div class="thePie Pie1"></div><div class="thePie Pie2"></div><div class="thePie Pie3"></div></div>
	<h3 align="center">주중/주말, 요일별 비율</h3>
	<br>
	<div class="tableArea" align="center">
		<table>
			<tr>
				<th>업종</th>
				<th rowspan="3">구분</th>
				<th rowspan="2" colspan="2">주말/주중</th>
				<th rowspan="2" colspan="8">요일별</th>
			</tr>
			<tr>
				<th><%= catagoryName[1] %></th>
			</tr>
			<tr>
				<th>지역</th>
				<th>주말</th>
				<th>주중</th>
				<th>일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th>토</th>
			</tr>
			<tr>
				<td rowspan="2">선택상권</td>
				<td>매출액</td>
				<td><%= frontRecentRow.get("주말_금액") %></td>
				<td><%= frontRecentRow.get("주중_금액") %></td>
				<td><%= frontRecentRow.get("일요일_금액") %></td>
				<td><%= frontRecentRow.get("월요일_금액") %></td>
				<td><%= frontRecentRow.get("화요일_금액") %></td>
				<td><%= frontRecentRow.get("수요일_금액") %></td>
				<td><%= frontRecentRow.get("목요일_금액") %></td>
				<td><%= frontRecentRow.get("금요일_금액") %></td>
				<td><%= frontRecentRow.get("토요일_금액") %></td>
			</tr>
			<tr>
				<td>비율</td>
				<td><%= frontRecentRow.get("주말_비율") %></td>
				<td><%= frontRecentRow.get("주중_비율") %></td>
				<td><%= frontRecentRow.get("일요일_비율") %></td>
				<td><%= frontRecentRow.get("월요일_비율") %></td>
				<td><%= frontRecentRow.get("화요일_비율") %></td>
				<td><%= frontRecentRow.get("수요일_비율") %></td>
				<td><%= frontRecentRow.get("목요일_비율") %></td>
				<td><%= frontRecentRow.get("금요일_비율") %></td>
				<td><%= frontRecentRow.get("토요일_비율") %></td>
			</tr>
		</table>
	</div>
	<br>
	<h3 align="center">시간대 별 비율</h3>
	<br>
	<div class="tableArea" align="center">
		<table>
			<tr>
				<th>업종</th>
				<th rowspan="3">구분</th>
				<th rowspan="3">00 ~ 06시</th>
				<th rowspan="3">06 ~ 11시</th>
				<th rowspan="3">11 ~ 14시</th>
				<th rowspan="3">14 ~ 17시</th>
				<th rowspan="3">17 ~ 21시</th>
				<th rowspan="3">21 ~ 24시</th>
			</tr>
			<tr>
				<th><%= catagoryName[1] %></th>
			</tr>
			<tr>
				<th>지역</th>
			</tr>
			<tr>
				<td rowspan="2">선택상권</td>
				<td>매출액</td>
				<td><%= frontRecentRow.get("시간대_00_06_금액") %></td>
				<td><%= frontRecentRow.get("시간대_06_11_금액") %></td>
				<td><%= frontRecentRow.get("시간대_11_14_금액") %></td>
				<td><%= frontRecentRow.get("시간대_14_17_금액") %></td>
				<td><%= frontRecentRow.get("시간대_17_21_금액") %></td>
				<td><%= frontRecentRow.get("시간대_21_24_금액") %></td>
			</tr>
			<tr>
				<td>비율</td>
				<td><%= frontRecentRow.get("시간대_00_06_비율") %></td>
				<td><%= frontRecentRow.get("시간대_06_11_비율") %></td>
				<td><%= frontRecentRow.get("시간대_11_14_비율") %></td>
				<td><%= frontRecentRow.get("시간대_14_17_비율") %></td>
				<td><%= frontRecentRow.get("시간대_17_21_비율") %></td>
				<td><%= frontRecentRow.get("시간대_21_24_비율") %></td>
			</tr>
		</table>
	</div>
	<br><br><br>
	<h2 align="center">3. 고객별 매출특성</h2>
	<br><br>
	<div class="anaResult detailResult3"><div class="twoPie Pie1"></div><div class="twoPie Pie2"></div></div>
	<div class="tableArea" align="center">
		<table>
			<tr>
				<th>업종</th>
				<th rowspan="3">구분</th>
				<th rowspan="2" colspan="2">성별</th>
				<th rowspan="2" colspan="7">연령별</th>
			</tr>
			<tr>
				<th><%= catagoryName[1] %></th>
			</tr>
			<tr>
				<th>지역</th>
				<th>남성</th>
				<th>여성</th>
				<th>10대</th>
				<th>20대</th>
				<th>30대</th>
				<th>40대</th>
				<th>50대</th>
				<th>60대 이상</th>
			</tr>
			<tr>
				<td rowspan="2">선택상권</td>
				<td>매출액</td>
				<td><%= frontRecentRow.get("남성_금액") %></td>
				<td><%= frontRecentRow.get("여성_금액") %></td>
				<td><%= frontRecentRow.get("연령대_10_금액") %></td>
				<td><%= frontRecentRow.get("연령대_20_금액") %></td>
				<td><%= frontRecentRow.get("연령대_30_금액") %></td>
				<td><%= frontRecentRow.get("연령대_40_금액") %></td>
				<td><%= frontRecentRow.get("연령대_50_금액") %></td>
				<td><%= frontRecentRow.get("연령대_60_이상_금액") %></td>
			</tr>
			<tr>
				<td>비율</td>
				<td><%= frontRecentRow.get("남성_비율") %></td>
				<td><%= frontRecentRow.get("여성_비율") %></td>
				<td><%= frontRecentRow.get("연령대_10_비율") %></td>
				<td><%= frontRecentRow.get("연령대_20_비율") %></td>
				<td><%= frontRecentRow.get("연령대_30_비율") %></td>
				<td><%= frontRecentRow.get("연령대_40_비율") %></td>
				<td><%= frontRecentRow.get("연령대_50_비율") %></td>
				<td><%= frontRecentRow.get("연령대_60_이상_비율") %></td>
			</tr>
		</table>
	</div>
</body>
<%@ include file="../common/footer.jsp"%>
<script>
	$(function(){
		<%	
		
		String[] inLineText = {"detailResult0", "매출 추이 ("+recentDate+"기준)", "매출", "만원", am.getCategories("기준_년월_코드", frontRows)};
		String[] inLinedataName = {"상권"};
		String[] inLinedata = {am.getData("당월_금액", 10000, frontRows)};
		out.print(am.getLine(inLineText, inLinedataName, inLinedata));
		
		String[] inBarText = {"detailResult1 .Pie1", "업종별 월 매출 ("+recentDate+"기준)", "매출", "만원", am.getJob(catagoryCode)};
		String[] inBardataName = {"상권"};
		String[] inBardata = {am.getData("당월_금액", 10000, frontRecentRows)};
		out.print(am.getBar(inBarText, inBardataName, inBardata));
		
		String[] barText = {"detailResult1 .Pie2", "업종별 월 건수 ("+recentDate+"기준)", "건수", "건", am.getJob(catagoryCode)};
		String[] bardataName = {"상권"};
		String[] bardata = {am.getData("당월_건수", 1, frontRecentRows)};
		out.print(am.getBar(barText, bardataName, bardata));
		
		String[] inMuchBarText = {"detailResult2 .Pie1", "주중, 주말 매출 비율 ("+recentDate+"기준)", "매출", "만원", new String("'주중', '주말'")};
		String[] inMuchBardataName = {"상권"};
		String[] inMuchdata = {frontRecentRow.get("주중_금액"), frontRecentRow.get("주말_금액")};
		String[] inMuchBardata = {am.getData2(inMuchdata, 10000)};
		out.print(am.getBar(inMuchBarText, inMuchBardataName, inMuchBardata));
		
		String[] DayBarText = {"detailResult2 .Pie2", "요일별 매출 비율 ("+recentDate+"기준)", "매출", "만원", new String("'월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'")};
		String[] DayBardataName = {"상권"};
		String[] Daydata = {frontRecentRow.get("월요일_금액"),frontRecentRow.get("화요일_금액"),frontRecentRow.get("수요일_금액"),frontRecentRow.get("목요일_금액"),frontRecentRow.get("금요일_금액"),frontRecentRow.get("토요일_금액"),frontRecentRow.get("일요일_금액")};
		String[] DayBardata = {am.getData2(Daydata, 10000)};
		out.print(am.getBar(DayBarText, DayBardataName, DayBardata));
		
		String[] timeBarText = {"detailResult2 .Pie3", "시간대별 매출 비율 ("+recentDate+"기준)", "매출", "만원", new String("'00시~06시', '06시~11시', '11시~14시', '14시~17시', '17시~21시', '21시~24시'")};
		String[] timeBardataName = {"상권"};
		String[] timedata = {frontRecentRow.get("시간대_00_06_금액"),frontRecentRow.get("시간대_06_11_금액"),frontRecentRow.get("시간대_11_14_금액"),frontRecentRow.get("시간대_14_17_금액"),frontRecentRow.get("시간대_17_21_금액"),frontRecentRow.get("시간대_21_24_금액")};
		String[] timeBardata = {am.getData2(timedata, 10000)};
		out.print(am.getBar(timeBarText, timeBardataName, timeBardata));
		
		String[] genderBarText = {"detailResult3 .Pie1", "성별별 매출 비율 ("+recentDate+"기준)", "매출", "만원", new String("'남성', '여성'")};
		String[] genderBardataName = {"상권"};
		String[] genderdata = {frontRecentRow.get("남성_금액"),frontRecentRow.get("여성_금액")};
		String[] genderBardata = {am.getData2(genderdata, 10000)};
		out.print(am.getBar(genderBarText, genderBardataName, genderBardata));
		
		String[] ageBarText = {"detailResult3 .Pie2", "연령별 매출 비율 ("+recentDate+"기준)", "매출", "만원", new String("'10대', '20대', '30대', '40대', '50대', '60대 이상'")};
		String[] ageBardataName = {"상권"};
		String[] agedata = {frontRecentRow.get("연령대_10_금액"),frontRecentRow.get("연령대_20_금액"),frontRecentRow.get("연령대_30_금액"),frontRecentRow.get("연령대_40_금액"),frontRecentRow.get("연령대_50_금액"),frontRecentRow.get("연령대_60_이상_금액")};
		String[] ageBardata = {am.getData2(agedata, 10000)};
		out.print(am.getBar(ageBarText, ageBardataName, ageBardata));
		%>
	});
</script>
</html>