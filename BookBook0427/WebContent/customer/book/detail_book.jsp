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
	<div class="container">
		<div class="row"><%@ include file="../../header.jsp"%></div>
		<div class="row">
			<div class="col-xs-3">
				<img src="${pageContext.request.contextPath}/bookimg/book.jpg">
			</div>
			<div class="col-xs-5">
				<h3>아마존 웹 서비스 인 액션</h3>
				<hr>
				<ul>
					<li><strong>저자 : </strong> <span>안드레아스 비티히, 미하엘 비티히</span>
					<li>
				</ul>
				<ul>
					<li><strong>출간 :</strong> <span>2017-05-01</span>
					<li>
				</ul>
				<ul>
					<li><strong>페이지 :</strong> <span>504쪽</span>
					<li>
				</ul>
				<ul>
					<li><strong>ISBN : </strong> <span>9788968483585</span>
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
			AWS 입문자를 위한 시원시원한 실습서 이 책은 AWS를 클라우드 인프라의 핵심인 컴퓨팅, 저장소, 네트워킹을 중심으로
			소개한다. 구체적으로는 클라우드 컴퓨팅 개론과 계정 생성 같은 기초, AWS API로 AWS의 모든 기능을 프로그램적으로
			제어하는 인프라 자동화, 데이터를 안전하게 보관하는 다양한 기법, 사설 네트워크로 시스템을 격리하는 방법, 고가용성과
			장애허용 설계 기법 등을 설명한다. ★ 최신 업데이트에 맞춰 새로 단장한 AWS 베스트셀러 이 책의 저자들은 독일 툴리우스
			발덴(Tullius Walden) 은행의 IT 인프라 전체를 AWS로 옮겼다. 철저한 인프라 보안을 중시하고 미션 크리티컬한
			금융 비즈니스를 외부 클라우드로 재구축하는 일은 AWS에 대한 깊은 성찰과 정말 중요한 핵심을 짚어내는 힘을 안겨줬다. 이때
			얻은 통찰과 노하우를 담은 이 책의 원서는 출간 직후부터 줄곧 영미권 아마존 베스트셀러로 자리매김하며 독자들의 사랑을
			받아왔다. 원서의 깔끔한 설명을 기초로, 번역서에서는 AWS의 새로워진 UI와 서비스에 맞게 화면을 다시 캡처하고 내용을
			다듬었다. AWS를 처음 사용하는 개발자부터 전문 인프라 엔지니어까지 AWS를 제대로 학습하려는 모든 이에게 최고의 입문서가
			될 것이다. ★ 주요 내용 클라우드 개념과 패턴 정리 AWS에 애플리케이션 배포하기 아마존의 풍부한 서비스들 통합하기 비용
			효율적으로 운영하기 AWS 기반 고급 아키텍처 설계하기
			<hr>
		</div>
		<div class="row">
			<h4>저자소개</h4>
			저자 안드레아스 비티히, 미하엘 비티히 분산 시스템 개발 및 아키텍처, 알고리즘 거래와 실시간 분석 전문가이자 전 세계를
			대상으로 활동하는 컨설턴트다. 둘 다 전문가 등급의 AWS 공인 솔루션 아키텍트로, 독일 툴리우스 발덴(Tullius
			Walden) 은행의 IT 인프라 전체를 AWS로 옮겼다. 역자 모파상(백영상) 연세대학교를 졸업하고 한국IBM에서 금융권
			E-Business 서비스, 유비쿼터스 컴퓨팅 서비스 플랫폼 등을 개발했다. 이후 삼성전자 미디어솔루션센터에서 소셜허브,
			삼성 서비스 플랫폼 개발 및 운영에 참여했다. 미디어 허브, 챗온 메신저 서비스를 아마존 클라우드 환경에서 개발/운영하면서
			AWS와 인연을 맺었다. 그 후 IBM으로 돌아와 클라우드 환경의 데이터 서비스 및 인지 솔루션 아키텍트로 활동했다. 현재
			SK에서 인공지능 솔루션 아키텍트로 활동 중이다.
			<hr>
		</div>
		<div class="row">
			<h4>목차</h4>
			Part 1 시작하기 CHAPTER 1 아마존 웹 서비스란 1.1 클라우드 컴퓨팅이란 1.2 AWS로 무엇을 할 수 있나
			1.3 AWS를 사용해서 얻을 수 있는 장점 1.4 비용은 얼마나 드나 1.5 타사 서비스와의 비교 1.6 AWS 서비스
			둘러보기 1.7 AWS와의 상호작용 1.8 AWS 계정 생성 1.9 요약

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