<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<div class="container">
		<div class="row"><%@ include file="../../header.jsp"%></div>
		<div class="row">
			<div class="col-xs-3">
				<img src="bookimg/${book_detail_dto.bookDTO.bookCode}.jpg">
				<%-- <img src="${pageContext.request.contextPath}/bookimg/book.jpg"> --%>
			</div>
			<div class="col-xs-5">
				<h3>${book_detail_dto.bookDTO.bookTitle}</h3>
				<hr>
				<ul>
					<li><strong>저자 : </strong> <span>${book_detail_dto.bookDTO.bookAuthor}</span>
					<li>
				</ul>
				<ul>
					<li><strong>출간 :</strong> <span>${book_detail_dto.bookDTO.bookPublisher}</span>
					<li>
				</ul>
				<ul>
					<li><strong>페이지 :</strong> <span>${book_detail_dto.bookDTO.bookPage}</span>
					<li>
				</ul>
				<ul>
					<li><strong>ISBN : </strong> <span>${book_detail_dto.bookDTO.bookCode}</span>
					<li>
				</ul>
			</div>
			<div class="col-xs-3">
				<ul>
					<li>
						<h4>판매가 :</h4>
					<li>
					<li>
						<h4>배송료 :</h4>
					<li>
				</ul>
				<button class="btn-warning">장바구니</button>
				<button class="btn-warning">위시리스트</button>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<ul class="nav nav-tabs">
					<li><a href="#">전체</a></li>
					<li><a href="#">책소개</a></li>
					<li><a href="#">저자소개</a></li>
					<li><a href="#">목차</a></li>
				</ul>
			</div>
		</div>
		<!-- 네비게이션  선택에 따라 데이터 들어갈 영역 -->
		<div class="row">
			<h4>책소개</h4>
			${fn:replace(book_detail_dto.bookDetailDescription,'&lt;', '<')}
			<hr>
		</div>
		<div class="row">
			<h4>저자소개</h4>
				${fn:replace(book_detail_dto.bookDetailAuthor,'&lt;', '<')}
			<hr>
		</div>
		<div class="row">
			<h4>목차</h4>
			${fn:replace(book_detail_dto.bookDetailIndex,'&lt;', '<')}
			<hr>
		</div>

	</div>
	<!--전체 container끝  -->
	<%@ include file="../../footer.jsp"%>
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
	<script src="${pageContext.request.contextPath}/assets/js/portfolio.js"></script>
</body>
</html>