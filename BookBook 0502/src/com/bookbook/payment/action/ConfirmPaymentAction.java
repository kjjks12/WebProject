package com.bookbook.payment.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookbook.book.domain.BookDTO;
import com.bookbook.order.domain.OrderDTO;
import com.bookbook.order.service.OrderService;
import com.bookbook.order.service.OrderServiceImpl;
import com.bookbook.orderdetail.domain.OrderDetailDTO;
import com.bookbook.orderdetail.service.OrderDetailService;
import com.bookbook.orderdetail.service.OrderDetailServieImpl;
import com.bookbook.payment.domain.PaymentDTO;
import com.bookbook.user.domain.UserDTO;
import com.bookbook.util.action.Action;

public class ConfirmPaymentAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String errorMessage=null;
		HttpSession session=request.getSession();
		String customerCode=(String)session.getAttribute("loggedInUser");
		
		String[] bookCodes = request.getParameterValues("bookCode");
		String[] orderDetailQties = request.getParameterValues("orderDetailQty");
		String[] orderDetailPrices = request.getParameterValues("orderDetailPrice");
		
		String paymentTotalPrice=request.getParameter("paymentTotalPrice");
		String paymentType=request.getParameter("paymentType");
		
		String orderUserName=request.getParameter("m_name");
		String orderUserEmail=request.getParameter("orderUserEmail");
		String orderTitle=request.getParameter("orderTitle");
		String orderAddr=request.getParameter("m_address") + " " + request.getParameter("m_address_sub"); 
		String ordertel=request.getParameter("m_mobile_1")+"-" +request.getParameter("m_mobile_2") + "-" + request.getParameter("m_mobile_3");
		String orderTotalPrice=request.getParameter("orderTotalPrice");
		String orderTotalQty=request.getParameter("orderTotalQty");
		String orderMessage=request.getParameter("ord_comment");
		String orderZipCode=request.getParameter("m_zipcode");
		

/*		for(int i=0; i<bookCodes.length; i++){
			System.out.println("bookCode : " + bookCodes[i]);
			System.out.println("orderDetailQty : " + orderDetailQties[i]);
			System.out.println("orderDetailPrice : " + orderDetailPrices[i]);
		}
		
		System.out.println("paymentTotalPrice : "+paymentTotalPrice);
		System.out.println("paymentType : "+paymentType);
		
		System.out.println("orderUserName : "+orderUserName);		
		System.out.println("orderUserEmail : " + orderUserEmail);
		System.out.println("orderTitle : "+orderTitle);
		System.out.println("orderAddr : "+orderAddr);
		System.out.println("ordertel : "+ordertel);
		System.out.println("orderTotalPrice : "+orderTotalPrice);
		System.out.println("orderTotalQty : "+orderTotalQty);
		System.out.println("orderMessage : "+orderMessage);
		System.out.println("orderZipCode : "+orderZipCode);	*/	
		
		
		try{
			//�Ķ��Ÿ�� ��ȿ�� �˻�
			
			//���������� �ֹ��� �������� �˻�
			
			//����������  ��Ȯ�� ������ ���Ǿ��� �ִ��� �˻�
			
			//�ֹ������� �����.
			//1. �ֹ� ������ ���� ( å ������ ����)
			List<OrderDetailDTO> orderDetailDTOList=new ArrayList<>();
			for(int i=0; i<bookCodes.length; i++){
				BookDTO bookDTO=new BookDTO(bookCodes[i], 0);
				OrderDetailDTO orderDetailDTO=new OrderDetailDTO(null, bookDTO, Integer.parseInt(orderDetailQties[i]), Integer.parseInt(orderDetailPrices[i]));
				orderDetailDTOList.add(i, orderDetailDTO);
			}
			
			//2. �������� ����
			PaymentDTO paymentDTO=new PaymentDTO(null, null, Integer.parseInt(paymentTotalPrice), "0201", null);
			
			//3. �ֹ����� ����
			UserDTO userDTO=new UserDTO(customerCode, null);
			OrderDTO orderDTO=new OrderDTO(orderDetailDTOList, paymentDTO, userDTO, null, orderTitle, orderAddr, customerCode, null, ordertel, "0302", Integer.parseInt(orderTotalPrice), Integer.parseInt(orderTotalQty), orderMessage);
			
			
			System.out.println(orderDTO);
			//4. �ֹ������� ��� ����
			OrderService orderService=new OrderServiceImpl();
			OrderDTO orderDTOResult=orderService.insertOrder(orderDTO);
			if(orderDTOResult==null){
				throw new Exception("�ֹ��� �����߽��ϴ�.");
			}
			
			//5. ����� request�Ӽ��� ����
			userDTO=orderService.selectUserOrderInfo(customerCode);
			OrderDetailService orderDetailService=new OrderDetailServieImpl();

			
			request.setAttribute("orderDTO", orderDTOResult);
			request.setAttribute("userDTO", userDTO);
			
			//6. ��� �������� �̵�
			request.getRequestDispatcher("customer/order/completeOrder.jsp").forward(request, response);
			
			
		} catch (Exception e) {
			request.setAttribute("errorMsg", e.getMessage());
			try {
				request.getRequestDispatcher("error.jsp").forward(request, response);
			} catch (ServletException | IOException e1) {
				e1.printStackTrace();
			}
		}
	}

}
