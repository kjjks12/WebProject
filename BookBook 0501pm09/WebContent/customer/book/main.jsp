<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="assets/ico/favicon.ico">
<title>SOLID - Bootstrap 3 Theme</title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/assets/css/style.css?ver=2"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/custom/css/common.css" />



</head>

<body>
	<!--헤더 부분 include -->

	<jsp:include page="../../header.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-xs-8 col-xs-offset-2">
				<div class="input-group">
					<div class="input-group-btn search-panel">
						<button type="button" class="btn btn-default dropdown-toggle"
							data-toggle="dropdown">
							<span id="search_concept">검색</span> <span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="#contains">도서명</a></li>
							<li><a href="#its_equal">분야명</a></li>
							<li><a href="#greather_than">저자명</a></li>
						</ul>
					</div>
					<input type="hidden" name="search_param" value="all"
						id="search_param"> <input type="text" class="form-control"
						name="x" placeholder="Search term..."> <span
						class="input-group-btn">
						<button class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div>
			</div>
		</div>

		<hr>
		<h3>도서목록</h3>
		<div class="row">
			<div class="col-xs-3">
				<a href="#"> 
				<img
					src="${pageContext.request.contextPath}/bookimg/book.jpg">
					<center><h4>아마존 웹 서비스 인 인잭션</h4></center>
				</a>
			</div>
			<div class="col-xs-3">
				<a href="#"> 
				<img
					src="${pageContext.request.contextPath}/bookimg/book.jpg">
					<center><h4>아마존 웹 서비스 인 인잭션</h4></center>
				</a>
			</div>
			<div class="col-xs-3">
				<a href="#"> 
				<img
					src="${pageContext.request.contextPath}/bookimg/book.jpg">
					<center><h4>아마존 웹 서비스 인 인잭션</h4></center>
				</a>
			</div>
			<div class="col-xs-3">
				<a href="#"> 
				<img
					src="${pageContext.request.contextPath}/bookimg/book.jpg">
					<center><h4>아마존 웹 서비스 인 인잭션</h4></center>
				</a>
			</div>
			<div class="col-xs-3">
				<a href="#"> 
				<img
					src="${pageContext.request.contextPath}/bookimg/book.jpg">
					<center><h4>아마존 웹 서비스 인 인잭션</h4></center>
				</a>
			</div>
			<div class="col-xs-3">
				<a href="#"> 
				<img
					src="${pageContext.request.contextPath}/bookimg/book.jpg">
					<center><h4>아마존 웹 서비스 인 인잭션</h4></center>
				</a>
			</div>
			<div class="col-xs-3">
				<a href="#"> 
				<img
					src="${pageContext.request.contextPath}/bookimg/book.jpg">
					<center><h4>아마존 웹 서비스 인 인잭션</h4></center>
				</a>
			</div>
		</div>
		<hr>
		<!--전체 container끝  -->
		<jsp:include page="../../footer.jsp" />

		<!-- Bootstrap core JavaScript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script
			src="${pageContext.request.contextPath}/assets/js/jquery-3.2.0.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/jquery.hoverdir.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/jquery.hoverex.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/jquery.prettyPhoto.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/jquery.isotope.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/portfolio.js"></script>
		<script>
	$(function(){
		$('.search-panel .dropdown-menu').find('a').click(function(e) {
			var param = $(this).attr("href").replace("#","");
			var concept = $(this).text();
			$('.search-panel span#search_concept').text(concept);
			$('.input-group #search_param').val(param);
		}); 
	})	
	</script>
</body>
</html>