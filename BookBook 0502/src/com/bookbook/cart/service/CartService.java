package com.bookbook.cart.service;

import java.sql.SQLException;
import java.util.List;

import com.bookbook.book.domain.BookDTO;
import com.bookbook.cart.domain.CartDTO;

public interface CartService {
	/**
	 * 주문번호를 받아서 주문상세 정보를 출력(주문도서, 주문상세, 주문, 결제, 주문자 이름)
	 * @param orderCode : 주문번호
	 * @return 주문상세정보 리턴
	 */
	List<CartDTO> selectCart(String userCode) throws SQLException;
	int insertCart(String userCode, BookDTO bookDTO) throws SQLException;
	int deleteCart(String userCode, String bookCode) throws SQLException;
	int updateCart(String userCode, int qty, String bookCode) throws SQLException;
	int checkCart(String userCode, String bookCode) throws SQLException;
}
