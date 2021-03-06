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

<title>BookBook</title>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="assets/css/style.css" rel="stylesheet">
<link href="assets/css/font-awesome.min.css" rel="stylesheet">


<!-- Just for debugging purposes. Don't actually copy this line! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<%@ include file="/header.jsp"%>

	<!-- *****************************************************************************************************************
	 HEADERWRAP
	 ***************************************************************************************************************** -->
	<div id="headerwrap">
		<div class="container">
			<div class="row">
				<div class="col-xs-8 col-xs-offset-2">
					<div class="input-group">
						<div style="">
							<form action="book">
								<div class="input-group-btn search-panel">
									<!-- <button type="button" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown" name="keyField">
									<span id="search_concept">Filter by</span> <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#bookTitle">제목</a></li>
									<li><a href="#bookAuthor">저자</a></li>
									<li class="divider"></li>
									<li><a href="#all">Anything</a></li>
								</ul>
								 -->
									<select class="btn btn-default dropdown-toggle" name="keyField">
										<option value="#all" selected="selected">통합 검색</option>
										<option value="#bookTitle">제목</option>
										<option value="#bookAuthor">저자</option>
									</select>
								</div>
								<input type="hidden" name="keyField" value="all" id="keyField">
								<input type="hidden" name="pageNum" value="1"> <input
									type="text" class="form-control" name="keyWord" placeholder="">
								<span class="input-group-btn"> <input type="submit"
									class="btn btn-default" value="검색"> <span
									class="glyphicon glyphicon-search"></span>
								</span>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- /container -->
	</div>
	<!-- /headerwrap -->

	<!-- *****************************************************************************************************************
	 SERVICE LOGOS
	 ***************************************************************************************************************** -->
	<!-- <div id="service">
		<div class="container">
			<div class="row centered">
				<div class="col-md-4">
					<i class="fa fa-heart-o"></i>
					<h4>Handsomely Crafted</h4>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. Lorem Ipsum has been the industry's standard
						dummy text ever since the 1500s, when an unknown printer took a
						galley of type and scrambled it to make a type specimen book.</p>
					<p>
						<br /> <a href="#" class="btn btn-theme">More Info</a>
					</p>
				</div>
				<div class="col-md-4">
					<i class="fa fa-flask"></i>
					<h4>Retina Ready</h4>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. Lorem Ipsum has been the industry's standard
						dummy text ever since the 1500s, when an unknown printer took a
						galley of type and scrambled it to make a type specimen book.</p>
					<p>
						<br /> <a href="#" class="btn btn-theme">More Info</a>
					</p>
				</div>
				<div class="col-md-4">
					<i class="fa fa-trophy"></i>
					<h4>Quality Theme</h4>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. Lorem Ipsum has been the industry's standard
						dummy text ever since the 1500s, when an unknown printer took a
						galley of type and scrambled it to make a type specimen book.</p>
					<p>
						<br /> <a href="#" class="btn btn-theme">More Info</a>
					</p>
				</div>
			</div>
		</div>
	</div> -->

	<!-- *****************************************************************************************************************
	 PORTFOLIO SECTION
	 ***************************************************************************************************************** -->
	<div id="portfoliowrap">
		<h3>새로 나온 책</h3>

		<div class="portfolio-centered">
			<div class="recentitems portfolio">
				<div class="portfolio-item graphic-design">
					<div class="he-wrap tpl6">
						<img src="assets/img/portfolio/portfolio_09.jpg" alt="">
						<div class="he-view">
							<div class="bg a0" data-animate="fadeIn">
								<h3 class="a1" data-animate="fadeInDown">A Graphic Design
									Item</h3>
								<a data-rel="prettyPhoto"
									href="assets/img/portfolio/portfolio_09.jpg"
									class="dmbutton a2" data-animate="fadeInUp"><i
									class="fa fa-search"></i></a> <a href="single-project.html"
									class="dmbutton a2" data-animate="fadeInUp"><i
									class="fa fa-link"></i></a>
							</div>
							<!-- he bg -->
						</div>
						<!-- he view -->
					</div>
					<!-- he wrap -->
				</div>
				<!-- end col-12 -->

				<div class="portfolio-item web-design">
					<div class="he-wrap tpl6">
						<img src="assets/img/portfolio/portfolio_02.jpg" alt="">
						<div class="he-view">
							<div class="bg a0" data-animate="fadeIn">
								<h3 class="a1" data-animate="fadeInDown">A Web Design Item</h3>
								<a data-rel="prettyPhoto"
									href="assets/img/portfolio/portfolio_02.jpg"
									class="dmbutton a2" data-animate="fadeInUp"><i
									class="fa fa-search"></i></a> <a href="single-project.html"
									class="dmbutton a2" data-animate="fadeInUp"><i
									class="fa fa-link"></i></a>
							</div>
							<!-- he bg -->
						</div>
						<!-- he view -->
					</div>
					<!-- he wrap -->
				</div>
				<!-- end col-12 -->

				<div class="portfolio-item graphic-design">
					<div class="he-wrap tpl6">
						<img src="assets/img/portfolio/portfolio_03.jpg" alt="">
						<div class="he-view">
							<div class="bg a0" data-animate="fadeIn">
								<h3 class="a1" data-animate="fadeInDown">A Graphic Design
									Item</h3>
								<a data-rel="prettyPhoto"
									href="assets/img/portfolio/portfolio_03.jpg"
									class="dmbutton a2" data-animate="fadeInUp"><i
									class="fa fa-search"></i></a> <a href="single-project.html"
									class="dmbutton a2" data-animate="fadeInUp"><i
									class="fa fa-link"></i></a>
							</div>
							<!-- he bg -->
						</div>
						<!-- he view -->
					</div>
					<!-- he wrap -->
				</div>
				<!-- end col-12 -->

				<div class="portfolio-item graphic-design">
					<div class="he-wrap tpl6">
						<img src="assets/img/portfolio/portfolio_04.jpg" alt="">
						<div class="he-view">
							<div class="bg a0" data-animate="fadeIn">
								<h3 class="a1" data-animate="fadeInDown">A Graphic Design
									Item</h3>
								<a data-rel="prettyPhoto"
									href="assets/img/portfolio/portfolio_04.jpg"
									class="dmbutton a2" data-animate="fadeInUp"><i
									class="fa fa-search"></i></a> <a href="single-project.html"
									class="dmbutton a2" data-animate="fadeInUp"><i
									class="fa fa-link"></i></a>
							</div>
							<!-- he bg -->
						</div>
						<!-- he view -->
					</div>
					<!-- he wrap -->
				</div>
				<!-- end col-12 -->

				<div class="portfolio-item books">
					<div class="he-wrap tpl6">
						<img src="assets/img/portfolio/portfolio_05.jpg" alt="">
						<div class="he-view">
							<div class="bg a0" data-animate="fadeIn">
								<h3 class="a1" data-animate="fadeInDown">A Book Design Item</h3>
								<a data-rel="prettyPhoto"
									href="assets/img/portfolio/portfolio_05.jpg"
									class="dmbutton a2" data-animate="fadeInUp"><i
									class="fa fa-search"></i></a> <a href="single-project.html"
									class="dmbutton a2" data-animate="fadeInUp"><i
									class="fa fa-link"></i></a>
							</div>
							<!-- he bg -->
						</div>
						<!-- he view -->
					</div>
					<!-- he wrap -->
				</div>
				<!-- end col-12 -->

				<div class="portfolio-item graphic-design">
					<div class="he-wrap tpl6">
						<img src="assets/img/portfolio/portfolio_06.jpg" alt="">
						<div class="he-view">
							<div class="bg a0" data-animate="fadeIn">
								<h3 class="a1" data-animate="fadeInDown">A Graphic Design
									Item</h3>
								<a data-rel="prettyPhoto"
									href="assets/img/portfolio/portfolio_06.jpg"
									class="dmbutton a2" data-animate="fadeInUp"><i
									class="fa fa-search"></i></a> <a href="single-project.html"
									class="dmbutton a2" data-animate="fadeInUp"><i
									class="fa fa-link"></i></a>
							</div>
							<!-- he bg -->
						</div>
						<!-- he view -->
					</div>
					<!-- he wrap -->
				</div>
				<!-- end col-12 -->

				<div class="portfolio-item books">
					<div class="he-wrap tpl6">
						<img src="assets/img/portfolio/portfolio_07.jpg" alt="">
						<div class="he-view">
							<div class="bg a0" data-animate="fadeIn">
								<h3 class="a1" data-animate="fadeInDown">A Book Design Item</h3>
								<a data-rel="prettyPhoto"
									href="assets/img/portfolio/portfolio_07.jpg"
									class="dmbutton a2" data-animate="fadeInUp"><i
									class="fa fa-search"></i></a> <a href="single-project.html"
									class="dmbutton a2" data-animate="fadeInUp"><i
									class="fa fa-link"></i></a>
							</div>
							<!-- he bg -->
						</div>
						<!-- he view -->
					</div>
					<!-- he wrap -->
				</div>
				<!-- end col-12 -->

				<div class="portfolio-item graphic-design">
					<div class="he-wrap tpl6">
						<img src="assets/img/portfolio/portfolio_08.jpg" alt="">
						<div class="he-view">
							<div class="bg a0" data-animate="fadeIn">
								<h3 class="a1" data-animate="fadeInDown">A Graphic Design
									Item</h3>
								<a data-rel="prettyPhoto"
									href="assets/img/portfolio/portfolio_08.jpg"
									class="dmbutton a2" data-animate="fadeInUp"><i
									class="fa fa-search"></i></a> <a href="single-project.html"
									class="dmbutton a2" data-animate="fadeInUp"><i
									class="fa fa-link"></i></a>
							</div>
							<!-- he bg -->
						</div>
						<!-- he view -->
					</div>
					<!-- he wrap -->
				</div>
				<!-- end col-12 -->

				<div class="portfolio-item web-design">
					<div class="he-wrap tpl6">
						<img src="assets/img/portfolio/portfolio_01.jpg" alt="">
						<div class="he-view">
							<div class="bg a0" data-animate="fadeIn">
								<h3 class="a1" data-animate="fadeInDown">A Web Design Item</h3>
								<a data-rel="prettyPhoto"
									href="assets/img/portfolio/portfolio_01.jpg"
									class="dmbutton a2" data-animate="fadeInUp"><i
									class="fa fa-search"></i></a> <a href="single-project.html"
									class="dmbutton a2" data-animate="fadeInUp"><i
									class="fa fa-link"></i></a>
							</div>
							<!-- he bg -->
						</div>
						<!-- he view -->
					</div>
					<!-- he wrap -->
				</div>
				<!-- end col-12 -->

				<div class="portfolio-item books">
					<div class="he-wrap tpl6">
						<img src="assets/img/portfolio/portfolio_10.jpg" alt="">
						<div class="he-view">
							<div class="bg a0" data-animate="fadeIn">
								<h3 class="a1" data-animate="fadeInDown">A Book Design Item</h3>
								<a data-rel="prettyPhoto"
									href="assets/img/portfolio/portfolio_10.jpg"
									class="dmbutton a2" data-animate="fadeInUp"><i
									class="fa fa-search"></i></a> <a href="single-project.html"
									class="dmbutton a2" data-animate="fadeInUp"><i
									class="fa fa-link"></i></a>
							</div>
							<!-- he bg -->
						</div>
						<!-- he view -->
					</div>
					<!-- he wrap -->
				</div>
				<!-- end col-12 -->

			</div>
			<!-- portfolio -->
		</div>
		<!-- portfolio container -->
	</div>
	<!--/Portfoliowrap -->


	<!-- *****************************************************************************************************************
	 MIDDLE CONTENT
	 ***************************************************************************************************************** -->

	<div class="container mtb">
		<div class="row">
			<div class="col-lg-4 col-lg-offset-1">
				<h4>WHAT IS 부끄부끄^//^?</h4>
				<p>Lorem Ipsum is simply dummy text of the printing and
					typesetting industry. Lorem Ipsum has been the industry's standard
					dummy text ever since the 1500s, when an unknown printer took a
					galley of type and scrambled it to make a type specimen book. It
					has survived not only five centuries, but also the leap into
					electronic typesetting, remaining essentially unchanged.</p>
				<p>
					<br /> <a href="about.html" class="btn btn-theme">More Info</a>
				</p>
			</div>

			<div class="col-lg-3">
				<h4>공지 사항</h4>
				<div class="hline"></div>
				<p>
					<a href="#">How cool is this theme?</a>
				</p>
				<p>
					<a href="#">Need a nice good-looking site?</a>
				</p>
				<p>
					<a href="#">Is this theme retina ready?</a>
				</p>
				<p>
					<a href="#">Which version of Font Awesome uses?</a>
				</p>
				<p>
					<a href="#">Free support is integrated?</a>
				</p>
			</div>

			<div class="col-lg-3">
				<h4>자주 묻는 질문</h4>
				<div class="hline"></div>
				<p>
					<a href="single-post.html">Our new site is live now.</a>
				</p>
				<p>
					<a href="single-post.html">Retina ready is not an option.</a>
				</p>
				<p>
					<a href="single-post.html">Bootstrap 3 framework is the best.</a>
				</p>
				<p>
					<a href="single-post.html">You need this theme, buy it now.</a>
				</p>
				<p>
					<a href="single-post.html">This theme is what you need.</a>
				</p>
			</div>

		</div>
	</div>

	<!-- *****************************************************************************************************************
	 TESTIMONIALS
	 ***************************************************************************************************************** -->
	<!-- 	<div id="twrap">
		<div class="container centered">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<i class="fa fa-comment-o"></i>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. Lorem Ipsum has been the industry's standard
						dummy text ever since the 1500s, when an unknown printer took a
						galley of type and scrambled it to make a type specimen book. It
						has survived not only five centuries, but also the leap into
						electronic typesetting, remaining essentially unchanged.</p>
					<h4>
						<br />Marcel Newman
					</h4>
					<p>WEB DESIGNER - BLACKTIE.CO</p>
				</div>
			</div>
		</div>
	</div>
 -->
	<!-- *****************************************************************************************************************
	 OUR CLIENTS
	 ***************************************************************************************************************** -->
	<!-- 	<div id="cwrap">
		<div class="container">
			<div class="row centered">
				<h3>OUR CLIENTS</h3>
				<div class="col-lg-3 col-md-3 col-sm-3">
					<img src="assets/img/clients/client01.png" class="img-responsive">
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3">
					<img src="assets/img/clients/client02.png" class="img-responsive">
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3">
					<img src="assets/img/clients/client03.png" class="img-responsive">
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3">
					<img src="assets/img/clients/client04.png" class="img-responsive">
				</div>
			</div>
		</div>
	</div>
 -->
	<%@ include file="/footer.jsp"%>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.hoverdir.js"></script>
	<script src="assets/js/jquery.hoverex.min.js"></script>
	<script src="assets/js/jquery.prettyPhoto.js"></script>
	<script src="assets/js/jquery.isotope.min.js"></script>
	<script src="assets/js/custom.js"></script>
	<script src="assets/js/portfolio.js"></script>
	<script>
		$(document).ready(function(e) {
			$('.search-panel .dropdown-menu').find('a').click(function(e) {
				e.preventDefault();
				var param = $(this).attr("href").replace("#", "");
				var concept = $(this).text();
				$('.search-panel span#search_concept').text(concept);
				$('.input-group #keyField').val(param);
			});
		});
	</script>
</body>
</html>