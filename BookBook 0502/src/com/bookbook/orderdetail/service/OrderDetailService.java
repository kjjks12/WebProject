package com.bookbook.orderdetail.service;

import java.sql.SQLException;

import com.bookbook.order.domain.OrderDTO;

public interface OrderDetailService {
	/**
	 * 주문번호를 받아서 주문상세 정보를 출력(주문도서, 주문상세, 주문, 결제, 주문자 이름)
	 * @param orderCode : 주문번호
	 * @return 주문상세정보 리턴
	 */
	OrderDTO selectOrderDetail(String orderCode) throws SQLException;
}
