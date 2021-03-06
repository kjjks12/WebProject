<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="assets/ico/favicon.ico">
<title>부끄부끄</title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/style.css?ver=1"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css"
	rel="stylesheet">
<style>
.table>tbody>tr>td, .table>tfoot>tr>td {
	vertical-align: middle;
}

@media screen and (max-width: 600px) {
	table#cart tbody td .form-control {
		width: 20%;
		display: inline !important;
	}
	.actions .btn {
		width: 36%;
		margin: 1.5em 0;
	}
	.actions .btn-info {
		float: left;
	}
	.actions .btn-danger {
		float: right;
	}
	table#cart thead {
		display: none;
	}
	table#cart tbody td {
		display: block;
		padding: .6rem;
		min-width: 320px;
	}
	table#cart tbody tr td:first-child {
		background: #333;
		color: #fff;
	}
	table#cart tbody td:before {
		content: attr(data-th);
		font-weight: bold;
		display: inline-block;
		width: 8rem;
	}
	table#cart tfoot td {
		display: block;
	}
	table#cart tfoot td .btn {
		display: block;
	}
}
</style>
<!-- CSS -->
</head>

<body>
	<%@ include file="/header.jsp"%>
	<div id="headerwrap">
		<div class="container">
			<h1>MY CART</h1>
			<hr>
			<table id="cart" class="table table-hover table-condensed">
				<thead>
					<tr>
						<th style="width: 50%">상품명</th>
						<th style="width: 10%">가격</th>
						<th style="width: 8%">수량</th>
						<th style="width: 22%" class="text-center">합계</th>
						<th style="width: 10%"></th>
					</tr>
				</thead>

				<tbody>
					<c:set var="sum" value="0"/>
					<c:forEach var="cartDTOList" items="${cartDTOList}" varStatus="status">
						<tr>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs">
										<img src="bookimg/${cartDTOList.bookDTO.bookCode}.jpg"
											alt="..." class="img-responsive" />
									</div>
									<div class="col-sm-10">
										<h4 class="nomargin">${cartDTOList.bookDTO.bookTitle}</h4>
									</div>

								</div>
							</td>
							<td id="price" data-th="Price"><fmt:formatNumber
									value="${cartDTOList.bookDTO.bookPrice}" /> 원</td>
							<td data-th="Quantity">
							<input type="number"
								class="form-control text-center"
								value="${cartDTOList.orderDetailQty}" id="qty">
								</td>
							<td id="subtotal" data-th="Subtotal" class="text-center subtotal"><fmt:formatNumber
									value="${cartDTOList.orderDetailPrice}" /> 원</td>
							<td class="actions" data-th="">
								<!-- <button class="btn btn-info btn-sm"> <i class="fa fa-refresh"></i></button> -->
								<button class="btn btn-danger btn-sm" id="${cartDTOList.bookDTO.bookCode}">
									<i class="fa fa-trash-o"> 삭제</i>
								</button>
							</td>
						</tr>
						<c:set var="sum" value="${cartDTOList.orderDetailPrice+sum}"/>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr class="visible-xs">
						<td class="text-center"><strong> <!-- TOTAL 부분 -->
						</strong></td>
					</tr>
					<tr>
						<td><a href="#" class="btn btn-warning" onclick="window.history.back();return false;"><i
								class="fa fa-angle-left"></i> 쇼핑 계속하기</a></td>
						<td colspan="2" class="hidden-xs"></td>
						<td class="hidden-xs text-center">
						<strong id="sumPrice">
							<fmt:formatNumber value="${sum}"/> 원
						</strong>
						</td>
						<td>
						<a  id="order_btn" href="${pageContext.request.contextPath}/Order?key=confirmOrder" class="btn btn-success btn-block">주문하기 <i
								class="fa fa-angle-right"></i>
						</a></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>


	<%@ include file="/footer.jsp"%>
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
	<script>
		$(document).ready(function() {
			var sum=${sum};	
		
			function uncomma(str) {
				str = String(str);
				return str.replace(/[^\d]+/g, '');
			}

			function tocomma(str) {
				return str.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
			
			$(document).on("click", ".btn-sm", function(){
				// AJAX
				$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/Cart?key=cartDelete",
						data : "bookCode="+$(this).attr('id'),
						dataType : "text",
						success : function(result) {
							//alert("result : "+result)
							if (result==0) {
								alert("삭제 되지 않았습니다. 다시 시도해주세요.");
							}
							
							else {
								alert("삭제 되었습니다.");
								location.href="${pageContext.request.contextPath}/Cart?key=cartSelect";
							}
						},
						error : function(err) {
							console.log(err);
						}
					})
			})
			
			
			$(document).on("change", "#qty", function() {
				var value = $(this).val();
				
				//alert($(this).prev().prev().children().children().children());
				if (value <= 0) {
					alert("상품 수량은 1개 이상 입력해주세요.");
					$(this).val(1);
				}
				
				else {
						var price = $(this).parent().prev().text();
						price = price.split(" ");
						price = uncomma(price[0]);
						var qty = $(this).val();
						qty = parseInt(qty);
						var subtotal = tocomma(price * qty);
						$(this).parent().next().text(subtotal + " 원");
						sum = 0;
						var tempPrice = 0;
						
						$(".subtotal").each(function(){
							tempPrice = $(this).text().split(" ");
							tempPrice = uncomma(tempPrice[0]);
							sum += parseInt(tempPrice);
						})
						sum = tocomma(sum);
												
						
						$("#sumPrice").text(sum+" 원");
					$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/Cart?key=cartUpdate",
						data : "qty=" + $(this).val() + "&bookCode="+$(this).parent().parent().find('img').attr('src'),
						dataType : "text",
						success : function(result) {
							console.log(result);
						},
						error : function(err) {
							console.log(err);
						}
					})
				}
			});
			
				$("#order_btn").click(function(event){
					if((sum*1)==0){
						alert('장바구니에 상품이 없습니다.');
					//event.stopPropagation();	
					event.preventDefault();
					}
				});
				
		});//jQuery 끝
	</script>
</body>
</html>