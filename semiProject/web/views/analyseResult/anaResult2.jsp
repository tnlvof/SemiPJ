<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, org.json.simple.JSONObject, com.kh.pj.analyse.controller.*"%>
<% 
	DoAnalyse da = new DoAnalyse();
	String catagoryCode = (String)session.getAttribute("catagoryCode");
	String[] catagoryName = da.getCatagoryName(catagoryCode);
	HashMap<String, ArrayList<HashMap>> allTable = (HashMap<String, ArrayList<HashMap>>)session.getAttribute("allTable");
	ArrayList<HashMap> front = null;
	ArrayList<HashMap> back = null;
	if(allTable!=null){
		front = allTable.get("상권_추정매출");
		back = allTable.get("상권배후지_추정매출");
		//out.print(income1);
	}	
	HashMap<String, String> frontRecentRow = null;
	HashMap<String, String> backRecentRow = null;	
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
	<h1 align="center">매출분석</h1>
	선택한 업종 : <%=catagoryName[0] +" > "+ catagoryName[1] %>
	<div class="anaResult detailResult0"></div>
	<div class="anaResult detailResult1"></div>
	<div class="anaResult detailResult2"></div>
	<div class="anaResult detailResult3"></div>
	<div class="anaResult detailResult4"></div>
	<div class="anaResult detailResult5"></div>
	<div class="anaResult detailResult6"><div class="ForPie Pie1"></div><div class="ForPie Pie2"></div></div>
	<div class="anaResult detailResult7"></div>
	<div class="anaResult detailResult8"></div>
	<div class="anaResult detailResult9"><div class="ForPie Pie1"></div><div class="ForPie Pie2"></div></div>
	<div class="anaResult detailResult10"></div>
	<div class="anaResult detailResult11"></div>
	<div class="anaResult detailResult12"><div class="ForPie Pie1"></div><div class="ForPie Pie2"></div></div>
	<div class="anaResult detailResult13"></div>
	<div class="anaResult detailResult14"></div>
	<div class="anaResult detailResult15"><div class="ForPie Pie1"></div><div class="ForPie Pie2"></div></div>
	<div class="anaResult detailResult16"><div class="ForPie Pie1"></div><div class="ForPie Pie2"></div></div>
</body>
<script>
	$(function(){
		<%
		for(HashMap<String, String> hm:front){
			if(hm.get("서비스_업종_코드").equals(catagoryCode)){				
				frontRecentRow = hm;
				break;
			}
		}
		for(HashMap<String, String> hm:back){
			if(hm.get("서비스_업종_코드").equals(catagoryCode)){		
				backRecentRow = hm;
				break;
			}
		}
		
		String[] inshopBarText = {"detailResult0", catagoryName[0] + " 업종별 점포수", "점포수", "개", "1", catagoryCode, "점포수"};
	    out.print(da.getBar2(inshopBarText, front, back));
	
	    String[] inMuchBarText = {"detailResult1", catagoryName[0] + " 업종별 월 매출", "매출", "만원", "10000", catagoryCode, "당월_금액"};
	    out.print(da.getBar2(inMuchBarText, front, back));
	    
	    String[] inCountBarText = {"detailResult2", catagoryName[0] + " 업종별 월 건수", "건수", "건", "1", catagoryCode, "당월_건수"};
	    out.print(da.getBar2(inCountBarText, front, back));
	    
	    String[] inMonthBarText = {"detailResult3", catagoryName[0] + " 업종별 평균 영업 개월 수", "개월수", "개월", "1", catagoryCode, "평균_영업_개월_수"};
	    out.print(da.getBar2(inMonthBarText, front, back));

	    
	    String[] genderMuchBarText = {"detailResult4", catagoryName[1] + " 성별별 월 매출", "매출", "만원", "10000"};
		String[] genderMuchxName = {"남성", "여성"};
		String[] genderMuchCode = {"남성_금액","여성_금액"};
		out.print(da.getBar(genderMuchBarText, genderMuchxName, genderMuchCode, frontRecentRow, backRecentRow));
		
		String[] genderCountBarText = {"detailResult5", catagoryName[1] + " 성별별 월 건수", "건수", "건", "1"};
		String[] genderCountxName = {"남성", "여성"};
		String[] genderCountCode = {"남성_건수","여성_건수"};
		out.print(da.getBar(genderCountBarText, genderCountxName, genderCountCode, frontRecentRow, backRecentRow));
		
		String[] genderPerPieText = {"detailResult6", catagoryName[1] + " 성별별 비율", "성별"};
		String[] genderPerxName = {"남성", "여성"};
		String[] genderPerCode = {"남성_비율","여성_비율"};
		out.print(da.getPie(genderPerPieText, genderPerxName, genderPerCode, frontRecentRow, backRecentRow));
		
		
		String[] ageMuchBarText = {"detailResult7", catagoryName[1] + " 연령별 월 매출", "매출", "만원", "10000"};
		String[] ageMuchxName = {"10대", "20대", "30대", "40대", "50대", "60대 이상"};
		String[] ageMuchCode = {"연령대_10_금액","연령대_20_금액","연령대_30_금액","연령대_40_금액","연령대_50_금액","연령대_60_이상_금액"};
		out.print(da.getBar(ageMuchBarText, ageMuchxName, ageMuchCode, frontRecentRow, backRecentRow));
		
		String[] ageCountBarText = {"detailResult8", catagoryName[1] + " 연령별 월 건수", "건수", "건", "1"};
		String[] ageCountxName = {"10대", "20대", "30대", "40대", "50대", "60대 이상"};
		String[] ageCountCode = {"연령대_10_건수","연령대_20_건수","연령대_30_건수","연령대_40_건수","연령대_50_건수","연령대_60_이상_건수"};
		
		String[] agePerPieText = {"detailResult9", catagoryName[1] + " 연령대별 비율", "연령대"};
		String[] agePerxName = {"10대", "20대", "30대", "40대", "50대", "60대 이상"};
		String[] agePerCode = {"연령대_10_비율", "연령대_20_비율", "연령대_30_비율", "연령대_40_비율", "연령대_50_비율", "연령대_60_이상_비율"};
		out.print(da.getPie(agePerPieText, agePerxName, agePerCode, frontRecentRow, backRecentRow));
		out.print(da.getBar(ageCountBarText, ageCountxName, ageCountCode, frontRecentRow, backRecentRow));
		
		
		String[] dayMuchBarText = {"detailResult10", catagoryName[1] + " 요일별 월 매출", "매출", "만원", "10000"};
		String[] dayMuchxName = {"월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"};
		String[] dayMuchCode = {"월요일_금액", "화요일_금액", "수요일_금액", "목요일_금액", "금요일_금액", "토요일_금액", "일요일_금액"};
		out.print(da.getBar(dayMuchBarText, dayMuchxName, dayMuchCode, frontRecentRow, backRecentRow));
		
		String[] dayCountBarText = {"detailResult11", catagoryName[1] + " 요일별 월 건수", "건수", "건", "1"};
		String[] dayCountxName = {"월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"};
		String[] dayCountCode = {"월요일_건수", "화요일_건수", "수요일_건수", "목요일_건수", "금요일_건수", "토요일_건수", "일요일_건수"};
		out.print(da.getBar(dayCountBarText, dayCountxName, dayCountCode, frontRecentRow, backRecentRow));
		
		String[] dayPerPieText = {"detailResult12", catagoryName[1] + " 요일별 비율", "요일"};
		String[] dayPerxName = {"월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"};
		String[] dayPerCode = {"월요일_비율", "화요일_비율", "수요일_비율", "목요일_비율", "금요일_비율", "토요일_비율", "일요일_비율"};
		out.print(da.getPie(dayPerPieText, dayPerxName, dayPerCode, frontRecentRow, backRecentRow));
		
	
		String[] timeMuchBarText = {"detailResult13", catagoryName[1] + "시간대별 월 매출", "매출", "만원", "10000"};
		String[] timeMuchxName = {"00시~06시", "06시~11시", "11시~14시", "14시~17시", "17시~21시", "21시~24시"};
		String[] timeMuchCode = {"시간대_00_06_금액", "시간대_06_11_금액", "시간대_11_14_금액", "시간대_14_17_금액", "시간대_17_21_금액", "시간대_21_24_금액"};
		
		out.print(da.getBar(timeMuchBarText, timeMuchxName, timeMuchCode, frontRecentRow, backRecentRow));
		
		String[] timeCountBarText = {"detailResult14", catagoryName[1] + " 시간대별 월 건수", "건수", "건", "1"};
		String[] timeCountxName = {"00시~06시", "06시~11시", "11시~14시", "14시~17시", "17시~21시", "21시~24시"};
		String[] timeCountCode = {"시간대_건수_06_건수", "시간대_건수_11_건수", "시간대_건수_14_건수", "시간대_건수_17_건수", "시간대_건수_21_건수", "시간대_건수_24_건수"};
		out.print(da.getBar(timeCountBarText, timeCountxName, timeCountCode, frontRecentRow, backRecentRow));
		
		String[] timePerPieText = {"detailResult15", catagoryName[1] + " 시간대별 비율", "시간대"};
		String[] timePerxName = {"00시~06시", "06시~11시", "11시~14시", "14시~17시", "17시~21시", "21시~24시"};
		String[] timePerCode = {"시간대_00_06_비율", "시간대_06_11_비율", "시간대_11_14_비율", "시간대_14_17_비율", "시간대_17_21_비율", "시간대_21_24_비율"};
		out.print(da.getPie(timePerPieText, timePerxName, timePerCode, frontRecentRow, backRecentRow));
		
		
		String[] servPerPieText = {"detailResult16", catagoryName[1] + " 생존율", "생존율"};
		String[] servPerxName = {"1년이하", "1년~2년", "2년~3년", "3년~5년", "5년이상"};
		String[] servPerCode = {"생존_율_1년이하", "생존_율_1_2년", "생존_율_2_3년", "생존_율_3_5년", "생존_율_5년이상"};
		out.print(da.getPie(servPerPieText, servPerxName, servPerCode, frontRecentRow, backRecentRow));
		%>
	});
</script>
</html>