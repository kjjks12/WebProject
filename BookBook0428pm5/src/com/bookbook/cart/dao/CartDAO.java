package com.bookbook.cart.dao;

import java.sql.SQLException;
import java.util.List;

import com.bookbook.book.domain.BookDTO;
import com.bookbook.cart.domain.CartDTO;

public interface CartDAO {
	/**
	 * �ֹ���ȣ�� �޾Ƽ� �ֹ��� ������ ���(�ֹ�����, �ֹ���, �ֹ�, ����, �ֹ��� �̸�)
	 * @param orderCode : �ֹ���ȣ
	 * @return �ֹ������� ����
	 */
	List<CartDTO> selectCart(String userCode) throws SQLException;
	int insertCart(String userCode, int bookQty, BookDTO bookDTO) throws SQLException;
	int deleteCart(String bookCode) throws SQLException;
	int updateCart(String userCode, int qty) throws SQLException;
}
