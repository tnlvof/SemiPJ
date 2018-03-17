<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<% ArrayList<HashMap<String, String>> list = null;
	list = (ArrayList<HashMap<String, String>>)request.getAttribute("list"); 
	if(list!=null){
		out.print(list.get(0));	
	}
	
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/pj/css/common.css">
<link rel="stylesheet" href="/pj/css/reset.css">
<link rel="stylesheet" href="/pj/css/sidebar.css">
<link rel="shortcut icon" href="/pj/images/slogo.png">
<link rel="stylesheet" href="/pj/css/support.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
	div	{
		border:1px solid black;
		background:red;
	}
	
	#chageInfo, #report {
		cursor:pointer;
		
	}
	#reportHeader h2 {
    letter-spacing: -2px;
    font-weight: 700;
    font-size: 23px;
    margin: 0;
    padding: 0;
    color: #333;
	}
	#reportHeader {
		display:inline-block;
	}
	#reportHeader1 h5 {
    width: 50%;
    letter-spacing: -2px;
    font-weight: 700;
    margin: 0;
    padding: 0;
    display:inline-block;
	}
	.point {
    color: #ff7e00 !important;
    font-weight: bold;
    }
    #reportTable {
    	display:inline-block;
    }
    #reportTable tr, td{
    	border:1px solid black;
    	
    }
</style>
<title>앞날이 창창</title>
</head>
<body>
	<%@ include file="/../views/common/menubar.jsp"%>
	<div class="div1">
		<div class="sidenav">
			<div class="sidenav-header">
				<h2>마이페이지</h2>
			</div>
			<div id="sidenav-menu">
			<a id="report" onclick="selectReport();">분석이력</a>
			<a id="chageInfo" onclick="chageInfo();">회원정보수정</a>
			</div>
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<div id="reportHeader">
			&nbsp;<h2>분석이력</h2>
		</div>
		<br><br>
		<div id="reportHeader1">
			&nbsp;&nbsp;&nbsp;&nbsp;<h5>전체 <span class="point ng-binding">1</span>건
				 <span class="grey ng-binding">
				 [<span class="black ng-binding">1</span>/1 페이지]
				 </span>
			</h5>
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;<table id="reportTable">
				<tr>
					<th>번호</th>
					<th>구분</th>
					<th>선택지역명</th>
					<th>업종</th>
					<th>분석일</th>
					<th>보고서</th>
				</tr>
				<%if(list!=null){ 
					for(int i=0; i < list.size(); i++){%>				
				<tr>
					<td><%= list.get(i).get("analysisNo") %></td>
					<td><%= list.get(i).get("memberNo") %></td>
					<td><%= list.get(i).get("address") %></td>
					<td><%= list.get(i).get("BigCategory") + " > " + list.get(0).get("smallCategory") %></td>
					<td><%= list.get(i).get("analyDate") %></td>
					<td><button onclick="reportPage('<%= list.get(i).get("areaCode") %>', '<%= list.get(i).get("categoryCode") %>');">보고서 다시보기</button></td>
				</tr>
				<%} }%>
			</table>
		</div>
	</div>
		<script>
		function selectReport(){
			  location.href="<%=request.getContextPath()%>/selectReport.an?memberNo=<%=loginUser.getMemberNo()%>";
		  }
		function chageInfo(){
			  location.href="/pj/views/member/memberUpdateForm.jsp";
		  }
		function reportPage(i, j){
			console.log(i);
			console.log(j);
			
			location.href="<%=request.getContextPath()%>/runAnalyse.an?areaCode=" + i + "&catagoryCode=" + j;
		}
		</script>
	<%@ include file="/../views/common/footer.jsp"%>
</body>
</html>
	
	
	