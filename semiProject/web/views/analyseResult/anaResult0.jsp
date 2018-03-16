<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, com.kh.pj.analyse.controller.*"%>
<% 
	AnalyseMethod am = new AnalyseMethod();
	HashMap<String, ArrayList<HashMap>> allTable = (HashMap<String, ArrayList<HashMap>>)session.getAttribute("allTable");

	String catagoryCode = (String)session.getAttribute("catagoryCode");
	String[] catagoryName = am.getCatagoryName(catagoryCode);
	
	ArrayList<HashMap> table = null;
	if(allTable!=null){
		table = allTable.get("상권_지수지표");
	}
	
	ArrayList<HashMap> rows = new ArrayList<HashMap>();
	for(HashMap<String, String> hm:table){
		if(hm.get("서비스_업종_코드").equals(catagoryCode)){				
			rows.add(hm);
		}
	}
	HashMap<String, String> frontRecentRow =rows.get(0);
	String recentDate = String.valueOf(frontRecentRow.get("기준_년월_코드")).substring(0, 4) + "년 " + String.valueOf(frontRecentRow.get("기준_년월_코드")).substring(4, 6) + "월";
	System.out.println("상권평가에 사용자 접속");
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
	<h1 align="center">종합결과</h1>
	선택한 업종 : <%=catagoryName[0] +" > "+ catagoryName[1] %>
	<div class="anaResult detailResult0"></div>
	<!-- <div class="anaResult detailResult1"></div> -->
	<div class="tableArea">
		<table border="1">
			<tr>
				<th rowspan="2">지역</th>
				<th rowspan="2">업종</th>
				<th colspan="2">과밀도</th>
				<th colspan="2">활성도</th>
				<th colspan="2">성장성</th>
				<th colspan="2">안정성</th>
			</tr>
			<tr>
				<th>지표</th>
				<th>상태</th>
				<th>지표</th>
				<th>상태</th>
				<th>지표</th>
				<th>상태</th>
				<th>지표</th>
				<th>상태</th>
			</tr>
			<tr>
				<th><%=frontRecentRow.get("상권_코드_명") %></th>
				<th><%=catagoryName[1] %></th>
				<td><%=frontRecentRow.get("과밀_값") %></td>
				<td><%=frontRecentRow.get("과밀_구간_코드_명") %></td>
				<td><%=frontRecentRow.get("활성도_지표_값") %></td>
				<td><%=frontRecentRow.get("활성도_코드_명") %></td>
				<td><%=frontRecentRow.get("성장성_지표_값") %></td>
				<td><%=frontRecentRow.get("성장성_코드_명") %></td>
				<td><%=frontRecentRow.get("안정성_지표_값") %></td>
				<td><%=frontRecentRow.get("안정성_코드_명") %></td>
			</tr>
		</table>
	</div>
	
</body>
<%@ include file="../common/footer.jsp"%>
<script>
	$(function(){
	<%
		
	String[] lineText = {"detailResult0", "지표 추이 ("+recentDate+"기준)", "지표", "점", am.getCategories("기준_년월_코드", rows)};
	String[] linedataName = {"과밀도", "활성도", "성장성", "안정성"};
	String[] linedata = {am.getData("과밀_값", 1, rows), am.getData("활성도_지표_값", 1, rows), am.getData("성장성_지표_값", 1, rows), am.getData("안정성_지표_값", 1, rows)};
	out.print(am.getLine(lineText, linedataName, linedata));
	
	/* String[] barText = {"detailResult1", "지표 ("+recentDate+"기준)", "지표", "점", new String("'과밀도', '활성도', '성장성', '안정성'")};
	String[] bardataName = {"상권"};
	String[] bardata = {frontRecentRow.get("과밀_값")+", "+frontRecentRow.get("활성도_지표_값")+", "+frontRecentRow.get("성장성_지표_값")+", "+frontRecentRow.get("안정성_지표_값")};
	out.print(am.getBar(barText, bardataName, bardata)); */
	
/* 	String[] pieText = {"detailResult2", "원그래프 테스트 ("+recentDate+"기준)", "지표"};
	String[] piedataName = {"테스트1", "테스트2"};
	String[] piedata = {"58.0","42.0"};
	out.print(am.getPie(pieText, piedataName, piedata)); */
	%>
	});
</script>
</html>