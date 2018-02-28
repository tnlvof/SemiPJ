<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="shortcut icon" href="/pj/images/slogo.png">
<link rel="stylesheet" href="/pj/css/common.css">
<link rel="stylesheet" href="/pj/css/reset.css">
<title>앞날이 창창</title>
<style>
.btns-wrap {
	position: absolute;
	top: 95px;
	right: 120px;
}

.btns-wrap ul {
	overflow: hidden;
}

.btns-wrap li img {
	width: 100%;
}

.btns {
	float: left;
	margin-top: 10px;
	margin-left: 10px;
	border: 1px solid midnightblue;
}

.btn {
	width: 180px;
	height: 370px;
}

.btn2 {
	width: 180px;
	height: 183px;
}

.btn3 {
	width: 370px;
	height: 183px;
}

.carousel-control .glyphicon-menu-left, .carousel-control .glyphicon-menu-right,
	.carousel-control .icon-next, .carousel-control .icon-prev {
	position: absolute;
	top: 50%;
	z-index: 5;
	display: inline-block;
}

.carousel-control.left, .carousel-control.right {
	background-image: linear-gradient(to right, rgba(0, 0, 0, .0001) 0,
		rgba(0, 0, 0, 0) 100%);
}

.carousel-indicators .active {
	width: 18px;
}
</style>
</head>
<body>
	<%@ include file="views/common/menubar.jsp"%>
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<!-- <img src="images/bg1.jpg" style="width: 100%;"> -->
					<img src="http://placehold.it/1200x500" width="100%">
				</div>

				<div class="item">
					<!-- <img src="images/bg2.jpg" style="width: 100%;"> -->
					<img src="http://placehold.it/1200x500" width="100%">
				</div>

				<div class="item">
					<!-- <img src="images/bg3.jpg" style="width: 100%;"> -->
					<img src="http://placehold.it/1200x500" width="100%">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-menu-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span class="glyphicon glyphicon-menu-right"></span>
				<span class="sr-only">Next</span>
			</a>

			<div class="btns-wrap">
				<ul>
					<li class="btn1 btns"><a href="#"><img
							src="http://placehold.it/180x370"></a></li>
					<li class="btn2 btns"><a href="#"><img
							src="http://placehold.it/180x180"></a></li>
					<li class="btn2 btns"><a href="#"><img
							src="http://placehold.it/180x180"></a></li>
					<br>
					<li class="btn3 btns"><a href="#"><img
							src="http://placehold.it/370x180"></a></li>
				</ul>
			</div>
			<!-- btns-wrap -->
		</div>
		<!-- myCarousel -->
	</div>
	<!-- container -->
	<%@ include file="views/common/footer.jsp"%>
</body>
</html>