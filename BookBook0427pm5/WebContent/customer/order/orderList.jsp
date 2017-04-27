<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.bookbook.order.domain.OrderDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

</head>

<body>
<%@ include file="/header.jsp" %>
<br><br><br>
<div id="headerWrap">
  주문조회<br>  
<div id="body" class="container">
	<table class="table table-striped"><thead><tr class="success"><th>주문번호</th><th>주문일자</th><th>상품명</th><th>수량</th><th>상품명</th><th>주문금액</th><th>주문상태</th></tr></thead>
	<c:forEach var="orderDTO" items="${requestScope.orderDTOList}">
		<tr><td><a href="OrderDetail?key=orderDetail&orderCode=${orderDTO.orderCode}"> ${orderDTO.orderCode}</a></td>
		<td>${orderDTO.orderDate}</td>
		<td>${orderDTO.orderTitle}</td>
		<td>${orderDTO.orderQty}</td>
		<td>${orderDTO.orderPrice}</td>
		<td>${orderDTO.orderQty*orderDTO.orderPrice}</td>
		<td>${orderDTO.orderState}</td>
		</tr>
	</c:forEach>
</table>
</div>
<p>
현재 페이지 : ${requestScope.pageNum }
<br>
<c:forEach var="group" items="${requestScope.pageGroupList}" varStatus="state">
	<c:if test="${state.index==0}">
		<c:if test="${group!=1}">&nbsp;<a href="Order?key=orderList&pageNum=${group-1}">[<] </a> &nbsp;</c:if>
	</c:if>
	&nbsp;<a href="Order?key=orderList&pageNum=${group}">[${group}] </a> &nbsp;
	
	
	<c:if test="${state.index==requestScope.pageGroupList.size()-1}">
		<c:if test="${requestScope.totalPage!=group}">&nbsp;<a href="Order?key=orderList&pageNum=${group+1}">[>] </a> &nbsp;</c:if>
	</c:if>
	
</c:forEach>



</div>
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