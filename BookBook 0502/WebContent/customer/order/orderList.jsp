<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.bookbook.order.domain.OrderDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.bookbook.util.db.CodeUtil" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="assets/ico/favicon.ico">

<title>SOLID - Bootstrap 3 Theme</title>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/assets/css/style.css?ver=2" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" rel="stylesheet">


<!-- Just for debugging purposes. Don't actually copy this line! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


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
</head>
<body>
<%@ include file="/header.jsp" %>
<div id="container_h">
	<!-- 마이부크 wrap -->
	<div class="docu_title">
		<h2>구매이력 (주문조회)</h2>
	</div>
	<br>
	<div class="myhanbit_wrap">
		<div class="table_area">
			<table class="tbl_type_list" border="0" cellspacing="0" summary="전체목록 리스트 테이블">
				<caption>전체목록 리스트</caption>
				<colgroup>
				<col width="150px">
				<col width="150px">
				<col width="">
				<col width="130px">
				<col width="70px">
				<col width="100px">
				<col width="100px">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">주문번호</th>
						<th scope="col">주문일자</th>
						<th scope="col">상품명</th>
						<th scope="col">수량</th>
						<th scope="col">금액</th>
						<th scope="col">총금액</th>
						<th scope="col">주문상태</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="orderDTO" items="${requestScope.orderDTOList}">
						<tr><td><a href="OrderDetail?key=orderDetail&orderCode=${orderDTO.orderCode}"> ${orderDTO.orderCode}</a></td>
						<td>${orderDTO.orderDate}</td>
						<td>${orderDTO.orderTitle}</td>
						<td>${orderDTO.orderQty}</td>
						<td>${orderDTO.orderPrice}</td>
						<td>${orderDTO.orderQty*orderDTO.orderPrice}</td>
						<td>${CodeUtil.getCodeName(orderDTO.orderState)}</td>
						</tr>
				</c:forEach>	
				</tbody>
			</table>
			
			<!-- 페이징 -->
			<div class="paginate bdr_no">
			<c:forEach var="group" items="${requestScope.pageGroupList}" varStatus="state">
				<c:if test="${state.index==0}">
					<c:if test="${group!=1}">&nbsp;<a href="Order?key=orderList&pageNum=${group-1}">[<] </a> &nbsp;</c:if>
				</c:if>
				<c:choose>
					<c:when test="${group==requestScope.pageNum}">&nbsp;<a href="Order?key=orderList&pageNum=${group}"><strong>${group}</strong> </a> &nbsp;</c:when>
					<c:otherwise>&nbsp;<a href="Order?key=orderList&pageNum=${group}">${group} </a> &nbsp;</c:otherwise>
				</c:choose>
				<c:if test="${state.index==requestScope.pageGroupList.size()-1}">
					<c:if test="${requestScope.totalPage!=group}">&nbsp;<a href="Order?key=orderList&pageNum=${group+1}">[>] </a> &nbsp;</c:if>
				</c:if>	
			</c:forEach>
			
			
			</div>
			<!-- //페이징 -->		
		</div>
	</div>
	<!-- //마이한빛 wrap -->
</div>
<br>


	<%@ include file="/footer.jsp"%>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.hoverdir.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.hoverex.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.prettyPhoto.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.isotope.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/portfolio.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</body>
</html>