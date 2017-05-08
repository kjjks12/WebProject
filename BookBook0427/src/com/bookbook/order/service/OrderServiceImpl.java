package com.bookbook.order.service;

import java.sql.SQLException;
import java.util.List;

import com.bookbook.order.dao.OrderDAO;
import com.bookbook.order.dao.OrderDAOImpl;
import com.bookbook.order.domain.OrderDTO;

public class OrderServiceImpl implements OrderService {

	@Override
	public int selectOrderCount(String customerCode) throws SQLException {
		OrderDAO orderDAO=new OrderDAOImpl();
		int result = orderDAO.selectOrderCount(customerCode);
		return result;
	}

	@Override
	public List<OrderDTO> selectOrderAll(String customerCode, int pageNum) throws SQLException {
		OrderDAO orderDAO=new OrderDAOImpl();
		List<OrderDTO> orderDTOList=orderDAO.selectOrderAll(customerCode, pageNum);
		return orderDTOList;
	}

	@Override
	public List<OrderDTO> selectCurrentOrder(String customerCode, String orderStateCode) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertOrder(OrderDTO orderDTO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateOrder(OrderDTO orderDTO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteOrder(String orderCode) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateOrderState(String orderCode, String orderStateCode) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
