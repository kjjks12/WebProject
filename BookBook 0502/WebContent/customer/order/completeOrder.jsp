<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.bookbook.order.domain.OrderDTO" %>
<%@page import="com.bookbook.user.domain.UserDTO" %>
<%@page import="com.bookbook.orderdetail.domain.OrderDetailDTO" %>
<%@page import="com.bookbook.book.domain.BookDTO" %>
<%@page import="com.bookbook.payment.domain.PaymentDTO" %>
<%@page import="com.bookbook.util.db.CodeUtil" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link href="assets/css/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="assets/css/style.css" rel="stylesheet">
<link href="assets/css/font-awesome.min.css" rel="stylesheet">


<link rel="stylesheet" href="assets/custom/css/common.css" />
<link rel="stylesheet" href="assets/custom/css/hover.css" />
<link rel="stylesheet" href="assets/custom/css/jquery-ui.css" />
<link rel="stylesheet" href="assets/custom/css/jquery-raty.css" />
<link rel="stylesheet" href="assets/custom/css/layout-hanbit.css" />
<link rel="stylesheet" href="assets/custom/css/layout-member.css" />
<link rel="stylesheet" href="assets/custom/css/layout-network.css" />
<link rel="stylesheet" href="assets/custom/css/layout-store.css" />
<link rel="stylesheet" href="assets/custom/css/layout-myhanbit.css" />
<link rel="stylesheet" href="assets/custom/css/layout-event.css" />

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
<div id="container_h">
 <div class="docu_title"><h2>주문정보 확인</h2></div> 
<div class="myhanbit_wrap">
<!-- 장바구니 탭메뉴 -->
<br>
<div class="tapmenu_cart_area">
			<ul>
				<li><span>step 01 <strong>장바구니</strong></span></li>
				<li><span>step 02 <strong>주문/결제</strong></span></li>
				<li><span class="curr">step 03 <strong>주문완료</strong><span class="bl"></span></span></li>
			</ul>
</div>

<!-- 상품 정보 -->
<div class="table_area order_list">
	<p class="tit">주문 상품 목록</p>
	<table class="tbl_type_list" border="0" cellspacing="0" summary="주문 상품 목록 테이블">
		<caption>주문 상품 목록</caption>
		<colgroup>
		<col width="142">
		<col width="">
		<col width="280">
		<col width="100">
		<col width="125">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">구분</th>
				<th scope="col">상품명</th>
				<th scope="col">판매가</th>
				<th scope="col">수량</th>
				<th scope="col">합계</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="orderDetail" items="${requestScope.orderDTO.orderDetailDTOList}">
			<tr>
				<td>책</td>
				<td class="left">${orderDetail.bookDTO.bookTitle}</td>
				<td><fmt:formatNumber value="${orderDetail.bookDTO.bookPrice}" />원</td>
				<td>${orderDetail.orderDetailQty}</td>						
				<td class="price"><fmt:formatNumber value="${orderDetail.bookDTO.bookPrice * orderDetail.orderDetailQty}" /> 원</td>			
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<!-- 상품 정보  끝-->

<!-- 주문상품 합계 -->
<div class="cart_result_box">
	<ul>
		<li>주문상품 수량 :  <span id="buyCnt">${requestScope.orderDetailDTOList.size()}종 [${requestScope.orderDTO.orderQty}개]</span></li>
		<li>배송료 :  <span id="deliveryCost">0원</span></li> 
		<li>총 주문 금액 :  <span class="price" id="totalPrice"><fmt:formatNumber value="${requestScope.orderDTO.orderPrice}" />원</span></li>
	</ul>
</div>
<!-- 주문상품 합계 끝-->


<!-- 주문고객정보 -->
<br>
<div class="table_area">
<p class="tit">주문 고객 정보</p>
<table class="tbl_type_list5" border="0" cellspacing="0" summary="주문고객 정보 테이블">
	<caption>주문고객 정보</caption>
	<colgroup>
	<col width="160px">
	<col width="210px">
	<col width="160px">
	<col width="210px">
	<col width="">
	</colgroup>
	<tbody>
		<tr>
		<th>이름</th>
		<td>${requestScope.userDTO.userName}</td>
		<th>이메일</th>
		<td>${requestScope.userDTO.userEmail}</td>
		<th>전화번호</th>
		<td>${requestScope.userDTO.userTel}</td>
	</tr>
</tbody>
</table>
</div>
<!-- 주문고객정보 -->




<!-- 배송지 정보  -->
<br>


<br>
</div> <!-- end hanbit warp -->
</div> <!-- end container -->


<%@ include file="/footer.jsp" %>
<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.hoverdir.js"></script>
	<script src="assets/js/jquery.hoverex.min.js"></script>
	<script src="assets/js/jquery.prettyPhoto.js"></script>
	<script src="assets/js/jquery.isotope.min.js"></script>
	<script src="assets/js/custom.js"></script>
	<script src="assets/js/portfolio.js"></script>
</body>
</html>
