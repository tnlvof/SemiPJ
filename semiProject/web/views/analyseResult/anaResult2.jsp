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
		
		String[] inCountBarText = {"detailResult1", catagoryName[0] + " 업종별 점포수", "건수", "건", "1", catagoryCode, "당월_건수"};
	    out.print(da.getBar2(inCountBarText, front, back));
	
	    String[] inMuchBarText = {"detailResult0", catagoryName[0] + " 업종별 월 매출", "매출", "만원", "10000", catagoryCode, "당월_금액"};
	    out.print(da.getBar2(inMuchBarText, front, back));
	    
	    String[] inCountBarText = {"detailResult1", catagoryName[0] + " 업종별 월 건수", "건수", "건", "1", catagoryCode, "당월_건수"};
	    out.print(da.getBar2(inCountBarText, front, back));
	    
	    String[] inCountBarText = {"detailResult1", catagoryName[0] + " 업종별 평균 영업 개월 수", "건수", "건", "1", catagoryCode, "평균_영업_개월_수"};
	    out.print(da.getBar2(inCountBarText, front, back));
	    
	    
		
	    String[] genderMuchBarText = {"detailResult2", catagoryName[1] + " 성별별 월 매출", "매출", "만원", "10000"};
		String[] genderMuchxName = {"남성", "여성"};
		String[] genderMuchCode = {"남성_금액","여성_금액"};
		out.print(da.getBar(genderMuchBarText, genderMuchxName, genderMuchCode, frontRecentRow, backRecentRow));
		
		String[] genderCountBarText = {"detailResult3", catagoryName[1] + " 성별별 월 건수", "건수", "건", "1"};
		String[] genderCountxName = {"남성", "여성"};
		String[] genderCountCode = {"남성_건수","여성_건수"};
		out.print(da.getBar(genderCountBarText, genderCountxName, genderCountCode, frontRecentRow, backRecentRow));
		
		String[] ageMuchBarText = {"detailResult4", catagoryName[1] + " 연령별 월 매출", "매출", "만원", "1"};
		String[] ageMuchxName = {"10대", "20대", "30대", "40대", "50대", "60대 이상"};
		String[] ageMuchCode = {"연령대_10_금액","연령대_20_금액","연령대_30_금액","연령대_40_금액","연령대_50_금액","연령대_60_이상_금액"};
		out.print(da.getBar(ageMuchBarText, ageMuchxName, ageMuchCode, frontRecentRow, backRecentRow));
		%>
	});
</script>
</html>