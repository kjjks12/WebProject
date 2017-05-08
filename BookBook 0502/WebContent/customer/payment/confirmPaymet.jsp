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
				<li><span class="curr">step 02 <strong>주문/결제</strong></span><span class="bl"></span></li>
				<li><span>step 03 <strong>주문완료</strong></span></li>
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
			<c:forEach var="orderDetail" items="${requestScope.orderDetailDTOList}">
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
		<li>주문상품 수량 :  <span id="buyCnt">${requestScope.orderDetailDTOList.size()}종 [${requestScope.orderTotalQty}개]</span></li>
		<li>배송료 :  <span id="deliveryCost">0원</span></li> 
		<li>총 주문 금액 :  <span class="price" id="totalPrice"><fmt:formatNumber value="${orderTotalPrice}" />원</span></li>
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
<form name="LGD_PAYINFO" id="LGD_PAYINFO" method="post" onSubmit="return payment()" action="Payment?key=confirmPayment">
<c:forEach var="orderDetail" items="${requestScope.orderDetailDTOList}"  varStatus="state">
	<c:if test="${state.index==0}">
		<c:choose>
			<c:when test="${requestScope.orderTotalQty==1}"><input type="hidden" name="orderTitle" value="${orderDetail.bookDTO.bookTitle}" ></c:when>
			<c:otherwise><input type="hidden" name="orderTitle" value="[ ${orderDetail.bookDTO.bookTitle }]외  ${requestScope.orderTotalQty-1}개 " ></c:otherwise>
		</c:choose>
	</c:if>
	<input type="hidden" name="bookCode" value="${orderDetail.bookDTO.bookCode}">
	<input type="hidden" name="bookTitle" value="${orderDetail.bookDTO.bookTitle}">
	<input type="hidden" name="orderDetailQty" value="${orderDetail.orderDetailQty}">
	<input type="hidden" name="orderDetailPrice" value="${orderDetail.bookDTO.bookPrice}">
</c:forEach>
	<input type="hidden" name="orderUserEmail" value="${requestScope.userDTO.userEmail}">

	<input type="hidden" name="paymentTotalPrice" value="${orderTotalPrice}">
	<input type="hidden" name="paymentType" value="0401">
	
	<input type="hidden" name="orderTotalPrice" value="${orderTotalPrice}">
	<input type="hidden" name="orderTotalQty" value="${orderTotalQty}">

<input name="p_prod_cnt" id="p_prod_cnt" type="hidden" value="4">
<div class="addr_info_box">
	<p class="tit">배송지 정보</p>
	<div class="address_info" style="position: relative;">
		<fieldset>
		<legend>배송지 정보 입력</legend>
		<div class="register_addr">
                  <div class="register_li">
				<div class="i_tit"><strong>배송지 선택<span> *</span></strong></div>
				<div class="i_con">													
					
					<label class="ra_label">
						<input name="delivery_addr" class="i_radio" id="delivery_Orderaddr" onclick="javascript:set_deliveryAddr();" type="radio" checked="" value="Orderaddr">
						<span>주문자와 동일</span>
					</label>
					<label class="ra_label">
						<input name="delivery_addr" class="i_radio" id="delivery_Shippingaddr" onclick="javascript:set_deliveryAddr();" type="radio" value="Shippingaddr">
						<span>최근 배송지</span>
					</label>
                          <label class="ra_label">
						<input name="delivery_addr" class="i_radio" id="delivery_Address" onclick="javascript:set_deliveryAddr();" type="radio" value="Address">
						<span>주소록</span>
					</label>
                          <label class="ra_label">
						<input name="delivery_addr" class="i_radio" id="delivery_Newaddr" onclick="javascript:set_deliveryAddr();" type="radio" value="Newaddr">
						<span>새로입력</span>
					</label>
				</div>
			</div>
                  <div class="register_li">
				<div class="i_tit"><strong>이름<span> *</span></strong></div>
				<div class="i_con">
					<label>
						<input name="m_name" class="i_text" id="m_name" type="text" value="${requestScope.userDTO.userName}">	
					</label>
				</div>
			</div>
                  <div class="register_li">
				<div class="i_tit"><strong>주소<span> * </span></strong></div>
				<div class="i_con">
					<label>
						<input name="m_zipcode" class="i_text" id="m_zipcode" onclick="openDaumPostcode('org');" type="text" readonly="">	
					</label>
					<label>		
						<input class="i_button" id="prof_zipcode" onclick="openDaumPostcode('org');" type="button" value="우편번호 검색">
					</label>
					<div class="input_space"></div>
					<label>
						<input name="m_address" class="i_text2" id="m_address" type="text" value="${requestScope.userDTO.userAddr}">	
					</label>
					<label class="i_label"><!--<strong>상세주소</strong>-->
						<input name="m_address_sub" class="i_text2" id="m_address_sub" type="text">
                              <span>※ 배송주소를 다시 한번 확인해 주세요.</span>
					</label>
				</div>
			</div>
                  <div class="register_li">
				<div class="i_tit"><strong>휴대전화<span> *</span></strong></div>
				<div class="i_con">
					<label>
						<input name="m_mobile_1" class="i_text3" id="m_mobile_1" onkeyup="this.value=number_filter(this.value);" type="text" maxlength="4">	
					</label>
					-
					<label>
						<input name="m_mobile_2" class="i_text3" id="m_mobile_2" onkeyup="this.value=number_filter(this.value);" type="text" maxlength="4">	
					</label>
					- 
					<label>
						<input name="m_mobile_3" class="i_text3" id="m_mobile_3" onkeyup="this.value=number_filter(this.value);" type="text" maxlength="4"><br>
                              <!--<span>※ 정확한 배송을 위해 꼭 필요합니다.</span>-->
					</label>
				</div>
			</div>
                   
                  <div class="register_li">
				<div class="i_tit"><strong>일반전화</strong></div>
				<div class="i_con">
					<label>
						<input name="m_phone_1" class="i_text3" id="m_phone_1" onkeyup="this.value=number_filter(this.value);" type="text" maxlength="4">	
					</label>
					- 
					<label>
						<input name="m_phone_2" class="i_text3" id="m_phone_2" onkeyup="this.value=number_filter(this.value);" type="text" maxlength="4">	
					</label>
					- 
					<label>
						<input name="m_phone_3" class="i_text3" id="m_phone_3" onkeyup="this.value=number_filter(this.value);" type="text" maxlength="4">	
					</label>
				</div>
			</div> 
                  <div class="register_li">
				<div class="i_tit"><strong>배송메시지</strong></div>
				<div class="i_con">
					<label>
						<input name="ord_comment" class="i_text4" id="ord_comment" type="text">
                               <span>(50자 이내 작성)</span>
					</label>
				</div>
			</div>
			<!-- EVENT -->
			          <!--
         <div class="register_li">
				<div class="i_tit"><strong>사은품</strong></div>
				<div class="i_con">
					<label>
						<input type="text" name="ord_gift" id="ord_gift" class="i_text4" readonly value="">
					</label>
				</div>
			</div>
        -->
								<!--// EVENT -->
		</div>
		</fieldset>
					</div>
	
</div>
		
<!-- 배송지 정보 SCRIPT -->
<script src="/js/member.js" type="text/javascript"></script>
<!--<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.js"></script>	-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><script src="http://s1.daumcdn.net/svc/attach/U03/cssjs/postcode/1484723365148/170118.js" type="text/javascript" charset="UTF-8"></script>
<script>
//새주소등록  우편번호찾기
function openDaumPostcode(str) {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;

			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if(data.userSelectedType === 'R'){
				//법정동명이 있을 경우 추가한다.
				if(data.bname !== ''){
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if(data.buildingName !== ''){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			$('#m_zipcode').val(data.zonecode);
			$('#m_address').val(fullAddr);
			$('#m_address_sub').focus();
			
			if(str=="org"){
				$('#m_zipcode').val(data.zonecode);			    
				$('#m_address').val(fullAddr);
				$('#m_address_sub').focus();				 
			}else{	    		
				$('#ham_zipcode').val(data.zonecode);				    
				$('#ham_address').val(fullAddr);
				$('#ham_address_sub').focus();				    	    				    
			}

		}
	}).open();
}


</script>
<script type="text/javascript">
	var customerTel='${userDTO.userTel}';
	var customerTel=customerTel.split('-');
	
	var tel1=document.getElementById("m_mobile_1");
	var tel2=document.getElementById("m_mobile_2");
	var tel3=document.getElementById("m_mobile_3");
	var zipcode=document.getElementById("m_zipcode");
	tel1.value=customerTel[0];
	tel2.value=customerTel[1];
	tel3.value=customerTel[2];
	zipcode.value='${userDTO.userZipCode}';
	
	function payment(){
	
		//LGD_PAYINFO
		confirmPayment
		
		return true;
	}
</script>	
<!-- //배송지 정보 SCRIPT -->   
    
        <!-- 할인 정보 -->
        <div class="discount_info_box">
        	<p class="tit">할인 정보</p>
            <div class="discount_info">
            	<p class="tit">부크부크이코인</p>
                <div class="register_li">
						<input name="my_e_coin" id="my_e_coin" type="hidden" value="0">                 	            
                    <label>
                        <input name="e_coin" class="i_text2" id="e_coin" onkeyup="check_useEcoin();" type="text" value=""> 원					
                    </label>
                    <label>		
                        <input class="i_button" id="apply_mileage" onclick="set_apply_mileage();" type="button" value="적용">
                    </label>
                    <span id="remain_ecoin">보유 한빛이코인 : 0원</span>
                    <!--
                    by coffin, 2016-04-25
                    <label for="check_agreement">
                        <input class="i_check" type="checkbox" id="check_all_e_coin" name="check_all_e_coin" value="Y" onclick="check_allEcoin();" >
                        <span>전액사용</span>
                    </label>
                    -->
                    
                    <div id="ecoin_warning">
                    <!-- 입력 조건 안맞을 경우 노출 경고 문구
                    <p class="warning">* 보유하신 한빛이코인보다 입력하신 금액이 많습니다.</p>
                    <p class="warning">* 총 주문 금액보다 입력하신 금액이 많습니다.</p>
                    <p class="warning">* 100원 단위로 입력해주세요.</p>
                     //입력 조건 안맞을 경우 노출 경고 문구 -->                     
                  	</div>
                </div>
                            </div>
			<div class="coupon_info">
				<p class="tit">쿠폰</p>
				<a class="btn_white4" style="width: 75px; height: 25px; line-height: 23px; margin-top: 5px;" href="/myhanbit/coupon.html" target="_blank">쿠폰등록</a>
				<p class="coupon_guide">쿠폰사용안내<a onclick="coupon_layer_open('layer_coupon');return false;" href="javascript:;"><img alt="쿠폰사용안내" src="http://www.hanbit.co.kr/images/store/ico_question.gif"></a></p>
				
				<!-- 보유쿠폰 리스트 -->				
				<div class="coupon_hold_area">
					<table class="coupon_hold" border="0">
						<tbody>													
							<tr>	<td class="cp_validity" colspan="4">사용가능한 쿠폰이 없습니다.</td></tr>														
						</tbody>
					</table>
				</div>
				<!-- //보유쿠폰 리스트 -->
			</div>
        </div>
        <!-- //할인 정보 -->
		
<!-- 결제 정보 -->
<div class="payment_info">
	<p class="tit">결제 정보</p>
	<dl class="payment_type">
	<dt>결제방법 선택</dt>
	<dd>
		<label class="ra_label">
		<input name="ord_pay_method" class="i_radio" id="ord_pay_method" onclick="javascript:select_pay_method(0);" type="radio" checked="checked" value="card">
		<span>신용카드</span>
		</label>
	</dd>
	<dd>
		<label class="ra_label">
		<input name="ord_pay_method" class="i_radio" id="ord_pay_method" onclick="javascript:select_pay_method(1);" type="radio" value="account">
		<span>실시간 계좌이체</span>
		</label>
	</dd>
	<dd>
		<label class="ra_label">
		<input name="ord_pay_method" class="i_radio" id="ord_pay_method" onclick="javascript:select_pay_method(2);" type="radio" value="bank">
		<span>무통장 입금</span>
		</label>
	</dd>
	<dd>
		<label class="ra_label">
		<input name="ord_pay_method" class="i_radio" id="ord_pay_method" onclick="javascript:select_pay_method(3);" type="radio" value="mobile">
		<span>휴대폰 결제</span>
		</label>
	</dd>
	</dl>			
</div>
<!-- //결제 정보 -->
		
		
		<!-- 1.신용카드 - 주의사항 안내창 -->
		<div id="p_type_card" style="display: block;">
			<div class="caution_box">
				<p>웹브라우저에 팝업차단 기능이 켜 있으면 정상적으로 결제가 되지 않을 수 있습니다.<br>팝업 차단을 미리 해제하시기 바랍니다.</p>
			</div>
		</div>
		<!-- //1.신용카드 - 안내창 -->
		
		
		<!-- 2.실시간 계좌이체 - 주의사항 안내창  -->
		<div id="p_type_account" style="display: none;">
			<div class="caution_box">
				<p>통장 예금주 본인의 공인인증서를 필요로 합니다.(은행에 따라 보안/OPT카드 사용)</p>
			</div>
		</div>
		<!-- //2.실시간 계좌이체 - 주의사항 안내창 -->
		
		
		<!-- 3.무통장입금 - 안내창 -->
		<div id="p_type_deposit" style="display: none;">
			<!-- 무통장입금 입금 계좌 -->
			<div class="account_info">
				<div class="register_li">
					<div class="i_tit"><strong>입금계좌<span> *</span></strong></div>
					<div class="i_con">
						<label>
							<select name="ord_bank" class="i_select2" id="ord_bank">	
								<option value="결제계좌를 선택해 주세요.">결제계좌를 선택해 주세요.</option>	
								<option value="KB">국민은행 / 069101-04-009393 / 한빛미디어(주)</option>
								<option value="URI">우리은행 / 068-396373-13-001 / 한빛미디어(주)</option>
								<option value="SH">신한은행 / 240-05-013166 / 한빛미디어(주)</option>
								<option value="NH">농협 / 038-17-003870 / 한빛미디어(주)</option>
							</select>	
						</label>
					</div>
				</div>
				<div class="register_li">
					<div class="i_tit"><strong>입금예정일<span> *</span></strong></div>
					<div class="i_con">
						<!-- 달력 -->
						<div class="cld_area">
							<label>
								<input name="ord_onlinedt" class="i_text hasDatepicker" id="ord_onlinedt" type="text" readonly="">
							</label>
							<label>
								<button name="ord_onlinedt_btn" class="i_car" id="ord_onlinedt_btn" type="button" value="검색">달력</button>
							</label>
						</div>
						<!-- //달력 -->
					</div>
				</div>
				<div class="register_li">
					<div class="i_tit"><strong>입금자명<span> *</span></strong></div>
					<div class="i_con">
						<label>
							<input name="ord_name" class="i_text2" id="ord_name" type="text">	
						</label>
					</div>
				</div>
				<script type="text/javascript">				
				 $(function() {    
					$("#ord_onlinedt_btn").click(function() {					
						$('#ord_onlinedt').datepicker('show');
					});	
				});					
			</script>
				<!-- 현금영수증 신청 옵션 영역 -->
				<div class="register_li">
					<div class="i_tit"><strong>현금영수증</strong></div>
					<div class="i_con">
						<label class="ra_label">
							<input name="receipt_type" class="i_radio" id="receipt_type" onclick="javascript:select_form_type2(0);" type="radio" value="P">
							<span>개인소득공제용</span>
						</label>
						<label class="ra_label">
							<input name="receipt_type" class="i_radio" id="receipt_type" onclick="javascript:select_form_type2(1);" type="radio" value="B">
							<span>사업자증빙용</span>
						</label>
						<label class="ra_label">
							<input name="receipt_type" class="i_radio" id="receipt_type" onclick="javascript:select_form_type2(2);" type="radio" checked="checked" value="N">
							<span>미신청</span>
						</label>
					</div>
					<div class="i_con" id="type_individual" style="display: none;">
						<div class="type_mobile">
							<label>
								<select name="ca_receipt_type" class="i_select" id="ca_receipt_type" onchange="select_cash_receipt(this.value);">
									<option value="HP">휴대전화</option>
									<option value="CA">현금영수증카드</option>
								</select>
							</label>						
							<label class="lblhp">
								<input name="receipt_hp1" class="i_text3" id="receipt_hp1" style="width: 80px;" type="text">
								-
								<input name="receipt_hp2" class="i_text3" id="receipt_hp2" style="width: 100px;" type="text">	
								-
								<input name="receipt_hp3" class="i_text3" id="receipt_hp3" style="width: 100px;" type="text">	
							</label>						
					
							<label class="lblcard" style="display: none;">
								<input name="receipt_card1" class="i_text3" id="receipt_card1" type="text">	
								-
								<input name="receipt_card2" class="i_text3" id="receipt_card2" type="text">
								-
								<input name="receipt_card3" class="i_text3" id="receipt_card3" type="text">
								-
								<input name="receipt_card4" class="i_text3" id="receipt_card4" type="text">
							</label>
					</div>
					</div>
					
					<div class="i_con" id="type_business" style="display: none;">
						<label>
							<span>사업자 등록번호</span>
							<input name="bizno1" class="i_text3" id="bizno1" style="width: 80px;" type="text">	
						</label>
						- 
						<label>
							<input name="bizno2" class="i_text3" id="bizno2" style="width: 60px;" type="text">	
						</label>
						- 
						<label>
							<input name="bizno3" class="i_text3" id="bizno3" type="text">	
						</label>
					</div>
					
					<div class="i_con" id="type_donot" style="display: none;"></div>
					
				</div>
				<!-- 현금영수증 신청 옵션 영역 -->
			</div>
			<!-- //무통장입금 입금 계좌 -->
			<!-- 안내창 -->
			<div class="caution_box">
				<p>무통장입금은 주중 오전 11시, 오후 3시 두차례 입금확인 합니다(주말 입금확인 안됨).<br>
				실제 입금액이 다를 경우 주문이 정상적으로 처리되지 않을 수 있습니다.<br>
				입금자명에는 입금하시는 고객님의 실명을 기재하여 주시기 바랍니다.</p>
			</div>
			<!-- //안내창 -->	
		</div>
		<!-- //3.무통장입금 - 안내창 -->
		
			
		<!-- 4.휴대폰 결제 - 주의사항 안내창 -->
		<div id="p_type_mobile" style="display: none;">
			<div class="caution_box">
				<p>결제금액 외에 발생되는 수수료는 없으며, 결제대금은 휴대폰 사용료에 합산 청구됩니다.</p>
			</div>
		</div>
		<!-- //4.휴대폰 결제 - 안내창 -->	
		
<!-- 주문,결제 최종 정보 영역 -->
<div class="total_info">			
	<input name="sum_sale_price" id="sum_sale_price" type="hidden">
	<input name="sum_ecoin_price" id="sum_ecoin_price" type="hidden">
	<input name="sum_coupon_price" id="sum_coupon_price" type="hidden">
	<input name="sum_total_price" id="sum_total_price" type="hidden" value="106400">
	<input name="sum_total_mileage" id="sum_total_mileage" type="hidden" value="5170">
	<input name="p_delivery_price" id="p_delivery_price" type="hidden" value="0">
				
	<!-- 주문 총액 정보 -->
		<dl class="total_order">
			<dt>주문상품 : </dt>
			<dd>${requestScope.orderDetailDTOList.size()}종 [${requestScope.orderTotalQty}개]</dd><br>
			<dt>총 상품금액 : </dt>
			<dd><fmt:formatNumber value="${orderTotalPrice}" />원</dd><br>
			<dt>배송비 : </dt>
			<dd>0원</dd><br>
			<dt>할인금액 : </dt>
			<dd><span id="sum_st_price_show">0원</span></dd><br>
		</dl>
	<!-- //주문 총액 정보 -->
				
	<!-- 최종 결제 정보 -->
	<dl class="total_payment">
		<dt><strong>최종 결제 금액 :</strong></dt>
		<dd><strong><span id="sum_t_price_show"><fmt:formatNumber value="${orderTotalPrice}" />원</span></strong></dd><br>
		<dt>최종 적립 마일리지 :</dt>
		<dd><span id="sum_st_mileage_show">0</span>점</dd><br>
	</dl>
	<!-- //최종 결제 정보 -->
				
	<!-- 결제하기 버튼 -->
	<label>
	<!--<button name="" type="submit" value="결제하기" class="btn_payment" onclick="location='/myhanbit/order_complete.html'">결제하기</button>-->
		<button name="bynPay" class="btn_payment" onclick="payment();" type="submit" value="결제하기">결제하기</button>
	</label>
	<!-- //결제하기 버튼 -->
</div>
<!-- //주문,결제 최종 정보 영역 -->
		
			
<div class="btn_area_cart" style="text-align: left;">
	<a class="btn_white2" style="width: 150px; text-align: center; font-size: 14px;" href="/myhanbit/cart.html">&lt; 이전단계</a>
</div>
</form>
		
	

























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
