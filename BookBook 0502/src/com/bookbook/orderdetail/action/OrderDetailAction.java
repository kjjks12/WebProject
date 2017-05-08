package com.bookbook.orderdetail.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbook.order.domain.OrderDTO;
import com.bookbook.orderdetail.service.OrderDetailService;
import com.bookbook.orderdetail.service.OrderDetailServieImpl;
import com.bookbook.util.action.Action;

public class OrderDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String orderCode=request.getParameter("orderCode");
		
		OrderDetailService orderDetailService=new OrderDetailServieImpl();
		try {
			OrderDTO orderDTO=orderDetailService.selectOrderDetail(orderCode);
			request.setAttribute("orderDTO", orderDTO);
			
			request.getRequestDispatcher("customer/orderDetail/orderDetailView.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("errorMsg", e.getMessage());
			try {
				request.getRequestDispatcher("error.jsp").forward(request, response);
			} catch (ServletException | IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

}
