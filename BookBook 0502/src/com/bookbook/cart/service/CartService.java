package com.bookbook.cart.service;

import java.sql.SQLException;
import java.util.List;

import com.bookbook.book.domain.BookDTO;
import com.bookbook.cart.domain.CartDTO;

public interface CartService {
	/**
	 * �ֹ���ȣ�� �޾Ƽ� �ֹ��� ������ ���(�ֹ�����, �ֹ���, �ֹ�, ����, �ֹ��� �̸�)
	 * @param orderCode : �ֹ���ȣ
	 * @return �ֹ������� ����
	 */
	List<CartDTO> selectCart(String userCode) throws SQLException;
	int insertCart(String userCode, BookDTO bookDTO) throws SQLException;
	int deleteCart(String userCode, String bookCode) throws SQLException;
	int updateCart(String userCode, int qty, String bookCode) throws SQLException;
	int checkCart(String userCode, String bookCode) throws SQLException;
}
