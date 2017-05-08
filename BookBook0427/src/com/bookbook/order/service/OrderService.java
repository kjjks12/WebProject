package com.bookbook.order.service;

import java.sql.SQLException;
import java.util.List;

import com.bookbook.order.domain.OrderDTO;

public interface OrderService {
	/**
	 * ����ں� �ֹ� ��ü �� ������
	 */
	int selectOrderCount(String customerCode) throws SQLException;
	/**
	 * ����ں� �ֹ� ��� ��ü �ҷ�����, page�� ���� ������ ������ ���
	 */
	List<OrderDTO> selectOrderAll(String customerCode, int pageNum) throws SQLException;
	
	/**
	 * �ֹ����¿� ���� ����ں� �ֹ� ��� �ҷ�����
	 */
	List<OrderDTO> selectCurrentOrder(String customerCode, String orderStateCode) throws SQLException;	
	
	
	/**
	 * �ֹ� �߰�  1�̸� �ֹ�����, 0�̸� �ֹ�����
 	 */
	int insertOrder(OrderDTO orderDTO) throws SQLException;
	
	/**
	 * �ֹ� ����(�����, ��� ����ó ����) 1�̸� ����Ҽ���, 0�̸� �������
	 */
	int updateOrder(OrderDTO orderDTO) throws SQLException;
	
	/**
	 * �ֹ� ����(�����ڰ� �ֹ��� ����) 1�̸� ��������, 0�̸� ��������
	 */
	int deleteOrder(String orderCode) throws SQLException;
	
	/**
	 * �ֹ� ���(����ڰ� �ֹ��� ���) 1�̸� ��Ҽ���, 0�̸� ��ҽ���
	 */
	int updateOrderState(String orderCode, String orderStateCode) throws SQLException;
	
}
