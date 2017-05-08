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
<link href="assets/css/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="assets/css/style.css?ver=2" rel="stylesheet">
<link href="assets/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
	<%@ include file="/header.jsp"%>
	<div>
		<c:choose>
			<c:when test="${sessionScope.loggedInUser!=null}">
				<div id="headerwrap">
					<div class="container">
						<div class="row">
							<div class="col-lg-8 col-lg-offset-2">
								<h1>마이페이지</h1>
							</div>
							<div class="col-lg-8 col-lg-offset-2 himg">
								<!-- <img src="assets/img/.png" class="img-responsive"> -->
							</div>
						</div>
						<!-- /row -->
					</div>
					<!-- /container -->
				</div>
			</c:when>
			
			<c:otherwise>
				<c:redirect url="login.jsp">
					<c:param name="msg" value="mypage">
					</c:param>
				</c:redirect>
			</c:otherwise>
		</c:choose>
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