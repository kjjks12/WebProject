package com.bookbook.orderdetail.dao;

import java.sql.SQLException;

import com.bookbook.order.domain.OrderDTO;

public interface OrderDetailDAO {
	/**
	 * �ֹ���ȣ�� �޾Ƽ� �ֹ��� ������ ���(�ֹ�����, �ֹ���, �ֹ�, ����, �ֹ��� �̸�)
	 * @param orderCode : �ֹ���ȣ
	 * @return �ֹ������� ����
	 */
	OrderDTO selectOrderDetail(String orderCode) throws SQLException;
}
