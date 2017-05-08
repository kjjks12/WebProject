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
						<h4>판매가 :
						<fmt:formatNumber
										value="${book_detail_dto.bookDTO.bookPrice}" pattern="#,###.##" />
						원</h4>
					<li>
					<li>
						<h4>배송료 :</h4>
					<li>
				</ul>
				<button class="btn-warning" id="shopping_basket">장바구니</button>
				<button class="btn-warning" id="direct_buy">바로구매</button>
			</div>
		</div>
	
		<div class="row">
			<hr>
			<div class="col-xs-12">
				<ul class="nav nav-tabs">
					<li><a href="#" id="all">전체</a></li>
					<li><a href="#" id="book" >책소개</a></li>
					<li><a href="#" id="author">저자소개</a></li>
					<li><a href="#" id="index">목차</a></li>
				</ul>
			</div>
		</div>
		<!-- 네비게이션  선택에 따라 데이터 들어갈 영역 -->
		<div class="row" id="book_info">
			<h4>책소개</h4>
			${fn:replace(book_detail_dto.bookDetailDescription,'&lt;', '<')}
			<hr>
		</div>
		<div class="row" id="author_info">
			<h4>저자소개</h4>
				${fn:replace(book_detail_dto.bookDetailAuthor,'&lt;', '<')}
			<hr>
		</div>
		<div class="row" id="index_info">
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
	
	
	
<script type="text/javascript">
$(document).ready(function() {
  $('#all , #book , #author, #index').click(function(event){
	  //href 연결 안해주고 단순 click 만 처리하게 해줌
	  event.preventDefault();
	  
	  if($(this).text()=='전체'){
		  $("#book_info").show();
		  $("#author_info").show();
		  $("#index_info").show();
		  //alert($(this).text());
	  }
	  else if($(this).text()=='책소개'){
		  $("#book_info").show();
		  $("#author_info").hide();
		  $("#index_info").hide();
		  //alert($(this).text())
	  }
	  else if($(this).text()=='저자소개'){
		  $("#book_info").hide();
		  $("#author_info").show();
		  $("#index_info").hide();
		   // alert($(this).text())
	  }
	  else if($(this).text()=='목차'){
		  $("#book_info").hide();
		  $("#author_info").hide();
		  $("#index_info").show();
		 // alert($(this).text())
	  }
	  
  });//전체 보기, 저자보기,목차보기 버튼 

  
  
  $("#shopping_basket").click(function(){
	 // alert();
	 // alert(${sessionScope.loggedInUser});
	 if(${sessionScope.loggedInUser!=null}){
	  location.href="Cart?key=cartInsert&bookCode=${book_detail_dto.bookDTO.bookCode}&bookTitle=${book_detail_dto.bookDTO.bookTitle}&bookPrice=${book_detail_dto.bookDTO.bookPrice}";
	 }
	 else{
		 alert('로그인이 필요한 페이지 입니다');
	 }
  });
  
  $("#direct_buy").click(function(){
	 if(${sessionScope.loggedInUser!=null}){
	  location.href="${pageContext.request.contextPath}/Order?key=confirmOrder&bookCode=${book_detail_dto.bookDTO.bookCode}";
	 }
	 else{
		 alert('로그인이 필요한 페이지 입니다');
	 }
  });
  
});//jQuery
</script>
	
	
</body>
</html>