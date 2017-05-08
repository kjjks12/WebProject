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
 <div class="docu_title"><h2>구매이력(상세보기)</h2></div> 
<div class="myhanbit_wrap">
<h3 class="ord_num">주문번호 : ${requestScope.orderDTO.orderCode}</h3>
<!-- 주문상태 -->
		<div class="order_state_area">
			<!-- 
			해당 주문상태일 경우 클래스에 _r 붙습니다.
			
			입금대기	state1 // state1_r 
			결제완료	state2 // state2_r
			배송준비	state3 // state3_r
			배송중		state4 // state4_r
			거래완료	state5 // state5_r
			취소요청	state6 // state6_r
			취소완료	state7 // state7_r
			-->
			<ul class="progress_order">	
			<c:forEach var="orderStatus" items="${CodeUtil.getChildCodes('03')}" varStatus="status">
				<c:choose>
					<c:when test="${orderStatus==requestScope.orderDTO.orderState}"><li class="progress state${status.index+1}_r" >${CodeUtil.getCodeName(orderStatus)}</li><li class="bl_next"></li></c:when>
					<c:otherwise><li class="progress state${status.index+1}" >${CodeUtil.getCodeName(orderStatus)}</li><li class="bl_next"></li></c:otherwise>
				</c:choose>
				<c:if test="${status.index<=CodeUtil.getChildCodes('03').size()-1}"><li class="bl_next"></li></c:if>
			</c:forEach>

			</ul>
			<ul class="cancel_order">
				<li class="cancel state6">취소요청</li>
				<li class="bl_next"></li>
				<li class="cancel state7">취소완료</li>
			</ul>
		</div> 
<p>

<!-- 주문고객정보 -->
<p class="tit">주문 고객 정보</p>
<div class="table_area">
<table class="tbl_type_list5" border="0" cellspacing="0" summary="주문고객 정보 테이블">
	<caption>주문고객 정보</caption>
	<colgroup>
	<col width="160px">
	<col width="410px">
	<col width="160px">
	<col width="">
	</colgroup>
	<tbody>
		<tr>
		<th>이름</th>
		<td>${requestScope.orderDTO.customerDTO.userName}</td>
		<th>주문접수일</th>
		<td>${requestScope.orderDTO.orderDate}</td>
	</tr>
</tbody>
</table>
</div>

<!-- 상품 정보 -->
<div class="product_info">
	<p class="tit">상품 정보</p>
	<div class="table_area_cart">
	<table class="tbl_type_list" >
	<colgroup>
		<col width="140px">
		<col width="">
		<col width="136px">
		<col width="86px">
		<col width="140px">	
	</colgroup>
					<thead>
						<tr>
							<th colspan="2" scope="col">상품명</th>
							<!--th scope="col">주문상태</th-->
							<th scope="col">판매가</th>
							<th scope="col">수량</th>
							<th scope="col">합계</th>
						</tr>
					</thead>	
<c:forEach var="order" items="${requestScope.orderDTO.orderDetailDTOList}">
<tr>
	<td class="thumb_area2"><a href="${pageContext.request.contextPath}/book?key=bookSearchDetail&book_code=${order.bookDTO.bookCode}"><img src="${pageContext.request.contextPath}/bookimg/${order.bookDTO.bookCode}.jpg" alt="" class="thumb" /></a></td>
	<td class="left info" style="vertical-align:middle"> ${order.bookDTO.bookTitle}</td>
	<td> <p  class="price"><fmt:formatNumber value="${order.bookDTO.bookPrice}" /> 원</p></td>
	<td>${order.orderDetailQty} 개</td>
	<td><p class="price2" ><fmt:formatNumber value="${order.orderDetailPrice*order.orderDetailQty}" /> 원</p></td>
</tr>
</c:forEach>
</table></div>
</div>
<!-- 주문,결제 최종 정보 영역 -->
<div class="total_info">
	<dl class="total_order">
		<dt style="line-height:300%">주문상품 : </dt><dd style="line-height:300%">${requestScope.orderDTO.orderQty} 개 </dd>
		<dt style="line-height:300%">총 상품금액 : </dt><dd style="line-height:300%"><fmt:formatNumber value="${requestScope.orderDTO.orderPrice}" /> 원</dd>
		<dt style="line-height:300%">배송비 : </dt><dd style="line-height:300%"> 0 원</dd>
	</dl>
	<dl class="total_payment">
		<dt>최종 결제 금액 : </dt><dd><fmt:formatNumber value="${requestScope.orderDTO.orderPrice}" /> 원 </dd><br>
		<dt>최종 적립 마일리지 : </dt><dd>0 원</dd>
	</dl>
	<!-- 결제하기 버튼 -->

									<button name="" type="submit" value="주문취소" class="btn_cancel" onClick="cancel_infor_layer_open('layer_cancel_infor');return false;">주문취소</button>

											<a href="javascript:alert('운송장 번호가 아직 입력되지 않았습니다');" class="btn_tracking_num2" target="_blank">배송조회</a>
</div>
</br>
<div class="cart_deposit_box_area">
	<table class="tbl_type_list5" border="0" cellspacing="0" summary="무통장 입금 시">
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
					<td>${CodeUtil.getCodeName(requestScope.orderDTO.paymentDTO.paymentType)} </td>
					<td><fmt:formatNumber value="${requestScope.orderDTO.paymentDTO.paymentTotalPrice}" /> 원</td>
					<td>${requestScope.orderDTO.paymentDTO.paymentDate}</td>
					<td><a href="javascript:print_receipt('1488566318494');">거래명세서 출력 &gt;</a></td>
				</tr>
			</tbody>
	</table>
</div>
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