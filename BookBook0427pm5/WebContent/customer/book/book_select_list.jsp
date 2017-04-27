<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link href="assets/css/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="assets/css/style.css?ver=2" rel="stylesheet">
<link href="assets/css/font-awesome.min.css" rel="stylesheet">
</head>

<body>
	<%@ include file="/header.jsp"%>


	<!-- *****************************************************************************************************************
    PORTFOLIO SECTION
    ***************************************************************************************************************** -->
	<div id="portfoliowrap">
		<h3>새로 나온 책</h3>

		<div class="portfolio-centered">
			<div class="recentitems portfolio">
				<c:forEach items="${list}" var="list">
					<div class="portfolio-item graphic-design">
						<div class="he-wrap tpl6">
							<img src="assets/img/portfolio/portfolio_09.jpg" alt="">
							<div class="he-view">
								<div class="bg a0" data-animate="fadeIn">
									<h3 class="a1" data-animate="fadeInDown">
										<fmt:formatNumber value="${list.bookPrice}" />
									</h3>
									<a data-rel="prettyPhoto"
										href="assets/img/portfolio/portfolio_09.jpg"
										class="dmbutton a2" data-animate="fadeInUp"><i
										class="fa fa-search"></i></a> <a href="single-project.html"
										class="dmbutton a2" data-animate="fadeInUp"><i
										class="fa fa-link"></i></a>

								</div>

								<!-- he bg -->
							</div>
							<div>
								${list.bookTitle}<br> ${list.bookAuthor} ${list.pageNo}
								${list.pageCount}
							</div>
							<!-- he view -->
						</div>
						<!-- he wrap -->
					</div>
				</c:forEach>
			</div>


		</div>
		<!-- he wrap -->
	</div>
	<!-- end col-12 -->

	</div>







	<%@ include file="/footer.jsp"%>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="assets/js/jquery-3.2.0.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.hoverdir.js"></script>
	<script src="assets/js/jquery.hoverex.min.js"></script>
	<script src="assets/js/jquery.prettyPhoto.js"></script>
	<script src="assets/js/jquery.isotope.min.js"></script>
	<script src="assets/js/custom.js"></script>
	<script src="assets/js/portfolio.js"></script>
</body>
</html>
