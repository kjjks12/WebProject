<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

	<%@ include file="/header.jsp"%>
	<%-- <jsp:include page="${pageContext.request.contextPath}/header.jsp" /> --%>

	<div class="container">
		<div class="row">
			<div class="col-xs-8 col-xs-offset-2">
		 <div class="input-group">
                <div class="input-group-btn search-panel">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    	<span id="search_concept">분류</span> <span class="caret"></span>
                    </button>
                    <ul  id="select_box" class="dropdown-menu" role="menu">
                      <li value="book_title"><a href="#book_title">제목</a></li>
                      <li value="book_author"><a href="#book_author">저자</a></li>
                      <li value="book_publisher"><a href="#book_publisher">출판사</a></li>
                    </ul>
                </div>
                <input type="hidden" name="search_param" value="all" id="search_param">         
                <input type="text" id="input_data" class="form-control" name="x" placeholder="Search term...">
                <span class="input-group-btn">
                    <button  id="search-btn" class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
                </span>
            </div>
        </div>
			</div>
		</div>
		<!-- 검색 부분 끝 -->



		<h3>새로 나온 책</h3>
		<div class="row">
			<div class="col-xs-12">
					<c:forEach items="${selectList}" var="selectList">
						<div class="col-xs-3">
						<div class="portfolio-item graphic-design">
							<div class="he-wrap tpl6">
								<img src="bookimg/${selectList.bookCode}.jpg" width="200px" height="300px">
								<div class="he-view">
									<div class="bg a0" data-animate="fadeIn">
										<h3 class="a1" data-animate="fadeInDown">
											￦
											<fmt:formatNumber value="${selectList.bookPrice}" />
										</h3>
										<!-- 상세 보기 페이지로 링크 거는 부분 -->
										<a data-rel="prettyPhoto"
											href="${pageContext.request.contextPath}/book?key=bookSearchDetail&book_code=${selectList.bookCode}"
											class="dmbutton a2" data-animate="fadeInUp"><i
											class="fa fa-search"></i></a> <a href="single-project.html"
											class="dmbutton a2" data-animate="fadeInUp"><i
											class="fa fa-link"></i></a>

									</div>

									<!-- he bg -->
								</div>
								<div>
									${selectList.bookTitle}<br> ${selectList.bookAuthor}<br>
								</div>
								<!-- he view -->
							</div>
							<!-- he wrap -->

						</div>
					</div>

					</c:forEach>

				</div>
			</div>
		</div>
	<!--전체 container끝  -->

	<%@ include file="/header.jsp"%>
	<%-- 		<jsp:include page="${pageContext.request.contextPath}/footer.jsp" /> --%>
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
	<script>
	$(document).ready(function(e){
		var param;
		
	    $('.search-panel .dropdown-menu').find('a').click(function(e) {
			e.preventDefault();
			param = $(this).attr("href").replace("#","");
			var concept = $(this).text();
			$('.search-panel span#search_concept').text(concept);
			//$('.input-group #search_param').val(param);
		});
	
	    $("#search-btn").click(function(){
			//alert('aa');
			//alert(param);
			//alert($("#input_data").val());
			location.href="book?key=bookSearch&keyField="+param+"&keyWord="+$("#input_data").val();
		});
	
	});
	</script>
</body>
</html>