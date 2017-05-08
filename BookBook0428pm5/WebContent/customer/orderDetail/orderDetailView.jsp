<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.bookbook.order.domain.OrderDTO" %>
<%@page import="com.bookbook.user.domain.UserDTO" %>
<%@page import="com.bookbook.orderdetail.domain.OrderDetailDTO" %>
<%@page import="com.bookbook.book.domain.BookDTO" %>
<%@page import="com.bookbook.payment.domain.PaymentDTO" %>

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
<br><br><br>
<div id="headerWrap">
  구매이력(상세보기)<br> 
<p> 
 주문번호 : ${requestScope.orderDTO.orderCode}
 <br>
주문상태: ${requestScope.orderDTO.orderState}
<p>
주문 고객 정보
이름 : ${requestScope.orderDTO.customerDTO.userName}  주문 접수일 : ${requestScope.orderDTO.orderDate}
<p>

<table>
상품정보
<tr><td></td><td>상품명</td><td>판매가</td><td>수량 </td><td>합계</td></tr>
<c:forEach var="order" items="${requestScope.orderDTO.orderDetailDTOList}">
<tr>
	<td>${order.bookDTO.bookCover}</td>
	<td> ${order.bookDTO.bookTitle}</td>
	<td>${order.bookDTO.bookPrice}</td>
	<td>${order.orderDetailQty}</td>
	<td> ${order.orderDetailPrice}</td>
</tr>
</c:forEach>
</table>

<!-- 주문,결제 최종 정보 영역 -->
<div class="total_info">
	<dl class="total_order">
		<dt>주문상품 : </dt><dd></dl>
		<dt>총 상품금액 : </dt><dd></dl>
		<dt>배송비 : </dt><dd></dl>
	<dl class="total_payment"></dl>
	<label><button>주문취소</button></label>
	<a href="">배송조회</a>
</div>

<div class="cart_deposit_box_area">
	<table class="tbl_type_list5" border="0" cellspacing="0" summary="무통장 입금 시">
		<caption>무통장 입금 정보</caption>
			<colgroup>
			<col width="25%">
			<col width="25%">
			<col width="25%">
			<col width="25%">
			</colgroup>
			<thead>
				<tr>
					<th>결제방식</th>
					<th>금액</th>
					<th>결제일자</th>
					<th>거래명세서</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${requestScope.orderDTO.paymentDTO.paymentType} </td>
					<td class="right">${requestScope.orderDTO.paymentDTO.paymentTotalPrice}</td>
					<td>${requestScope.orderDTO.paymentDTO.paymentDate}</td>
					<td><a href="javascript:print_receipt('1488566318494');">거래명세서 출력 &gt;</a></td>
				</tr>
			</tbody>
	</table>
</div>

</div>
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