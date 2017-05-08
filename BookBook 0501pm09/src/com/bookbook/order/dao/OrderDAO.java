package com.bookbook.order.dao;

import java.sql.SQLException;
import java.util.List;

import com.bookbook.book.domain.BookDTO;
import com.bookbook.order.domain.OrderDTO;
import com.bookbook.orderdetail.domain.OrderDetailDTO;
import com.bookbook.user.domain.UserDTO;

public interface OrderDAO {
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
	List<OrderDTO> selectCurrentOrder(String customeCode, String orderStateCode) throws SQLException;	
	
	/**
	 * �ֹ������� �������� Ȯ��
	 */
	List<OrderDetailDTO> selectAvailableOrder(List<OrderDetailDTO> orderDetailDTOList) throws SQLException ;
	
	/**
	 * �ֹ� �߰�  1�̸� �ֹ�����, 0�̸� �ֹ�����
 	 */
	OrderDTO insertOrder(OrderDTO orderDTO) throws SQLException;
	
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
	
	
	/**
	 * ȸ���� ������� �˻� 
	 */
	UserDTO selectUserOrderInfo(String customerCode)throws SQLException;
	
}
