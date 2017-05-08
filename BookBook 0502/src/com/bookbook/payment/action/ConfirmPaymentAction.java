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
			//파라메타값 유효성 검사
			
			//도서정보가 주문이 가능한지 검사
			
			//도서정보가  정확한 가격이 계산되어져 있는지 검사
			
			//주문정보를 만든다.
			//1. 주문 상세정보 생성 ( 책 정보도 생성)
			List<OrderDetailDTO> orderDetailDTOList=new ArrayList<>();
			for(int i=0; i<bookCodes.length; i++){
				BookDTO bookDTO=new BookDTO(bookCodes[i], 0);
				OrderDetailDTO orderDetailDTO=new OrderDetailDTO(null, bookDTO, Integer.parseInt(orderDetailQties[i]), Integer.parseInt(orderDetailPrices[i]));
				orderDetailDTOList.add(i, orderDetailDTO);
			}
			
			//2. 결제정보 생성
			PaymentDTO paymentDTO=new PaymentDTO(null, null, Integer.parseInt(paymentTotalPrice), "0201", null);
			
			//3. 주문정보 생성
			UserDTO userDTO=new UserDTO(customerCode, null);
			OrderDTO orderDTO=new OrderDTO(orderDetailDTOList, paymentDTO, userDTO, null, orderTitle, orderAddr, customerCode, null, ordertel, "0302", Integer.parseInt(orderTotalPrice), Integer.parseInt(orderTotalQty), orderMessage);
			
			
			System.out.println(orderDTO);
			//4. 주문정보를 디비에 저장
			OrderService orderService=new OrderServiceImpl();
			OrderDTO orderDTOResult=orderService.insertOrder(orderDTO);
			if(orderDTOResult==null){
				throw new Exception("주문에 실패했습니다.");
			}
			
			//5. 결과를 request속성에 저장
			userDTO=orderService.selectUserOrderInfo(customerCode);
			OrderDetailService orderDetailService=new OrderDetailServieImpl();

			
			request.setAttribute("orderDTO", orderDTOResult);
			request.setAttribute("userDTO", userDTO);
			
			//6. 결과 페이지로 이동
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
