package com.bookbook.orderdetail.service;

import java.sql.SQLException;

import com.bookbook.order.domain.OrderDTO;
import com.bookbook.orderdetail.dao.OrderDetailDAO;
import com.bookbook.orderdetail.dao.OrderDetailDAOImpl;

public class OrderDetailServieImpl implements OrderDetailService {

	@Override
	public OrderDTO selectOrderDetail(String orderCode) throws SQLException {
		OrderDetailDAO orderDetailDAO=new OrderDetailDAOImpl();
		OrderDTO orderDTO=orderDetailDAO.selectOrderDetail(orderCode);

		return orderDTO;
	}

}
