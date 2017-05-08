package com.bookbook.orderdetail.service;

import java.sql.SQLException;

import com.bookbook.order.domain.OrderDTO;

public interface OrderDetailService {
	/**
	 * �ֹ���ȣ�� �޾Ƽ� �ֹ��� ������ ���(�ֹ�����, �ֹ���, �ֹ�, ����, �ֹ��� �̸�)
	 * @param orderCode : �ֹ���ȣ
	 * @return �ֹ������� ����
	 */
	OrderDTO selectOrderDetail(String orderCode) throws SQLException;
}
