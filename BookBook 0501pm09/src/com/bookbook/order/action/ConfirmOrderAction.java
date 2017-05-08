package com.bookbook.order.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookbook.book.domain.BookDTO;
import com.bookbook.cart.domain.CartDTO;
import com.bookbook.cart.service.CartService;
import com.bookbook.cart.service.CartServiceImpl;
import com.bookbook.order.domain.OrderDTO;
import com.bookbook.order.service.OrderService;
import com.bookbook.order.service.OrderServiceImpl;
import com.bookbook.orderdetail.domain.OrderDetailDTO;
import com.bookbook.user.domain.UserDTO;
import com.bookbook.util.action.Action;

public class ConfirmOrderAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	
		String errorMessage=null;
		String movePage=null;
		HttpSession session=request.getSession();
		String customerCode=(String)session.getAttribute("loggedInUser");
		String bookCode=(String)request.getParameter("bookCode");
		String orderQty=request.getParameter("orderQty");
		
		try {
			//임시데이터
			OrderService orderService=new OrderServiceImpl();
			List<OrderDetailDTO> orderDetailDTOList=new ArrayList<>();
			
			//도서코드 또는 장바구니에서 주문상품 가져오기
			if(bookCode!=null && orderQty!=null){//도서코드와 수량이 있는 경우
				//주문도서를 orderDetailDTO로 변환
				BookDTO bookDTO=new BookDTO();
				bookDTO.setBookCode(bookCode);
				OrderDetailDTO orderDetailDTO=new OrderDetailDTO(null, bookDTO, Integer.parseInt(orderQty), 0);
				orderDetailDTOList.add(orderDetailDTO);
			}else{//장바구니에서 주문상품 가져오기
				CartService cartService=new CartServiceImpl();
				List<CartDTO> cartDTOList=cartService.selectCart(customerCode);
				
				if(cartDTOList!=null && cartDTOList.size()!=0){
					for(CartDTO cartDTO:cartDTOList){
						orderDetailDTOList.add(new OrderDetailDTO(null, cartDTO.getBookDTO(), cartDTO.getOrderDetailQty(), 0));
					}	
				}
				else{
					//아무런 데이터가 없다면 에러페이지 이동
					throw new Exception("잘못된 주문 정보이거나 장바구니에 데이터가 존재하지 않습니다.");
				}
			}

			System.out.println("aaaa");
			
			//주문 도서가 주문가능한 상태인지 확인후 처리 없으면 에러 페이지 처리
			List<BookDTO> lackBookDTOList=new ArrayList<>();
			List<OrderDetailDTO> orderDetailDTOListResult=orderService.selectAvailableOrder(orderDetailDTOList);

			if(orderDetailDTOListResult==null || orderDetailDTOListResult.size()==0){
				for(OrderDetailDTO orderDetailDTO : orderDetailDTOList){
					lackBookDTOList.add(orderDetailDTO.getBookDTO());
				}
			}else{
				if(orderDetailDTOList.size()!=orderDetailDTOListResult.size()){
					for(int i=0, iSize=orderDetailDTOList.size(); i<iSize; i++){
						for(int j=0, jSize=orderDetailDTOListResult.size(); j<jSize; j++){
							if(orderDetailDTOList.get(i).getBookDTO().getBookCode().equals(orderDetailDTOListResult.get(j).getBookDTO().getBookCode())){
								break;
							}
							if(j==jSize-1){
								//주문이 불가능한 상품정보 저장
								lackBookDTOList.add(orderDetailDTOList.get(i).getBookDTO());
							}
						}
					}
					//없는 도서는 주문불가 도서에 추가
				}
			}
			int orderTotalQty=0, orderTotalPrice=0;
			for(OrderDetailDTO orderDetailDTO : orderDetailDTOList){
				orderTotalQty+=orderDetailDTO.getOrderDetailQty();
				orderTotalPrice+=orderDetailDTO.getBookDTO().getBookPrice()*orderDetailDTO.getOrderDetailQty();
			}
			System.out.println("bbbb");
			//주문정보 생성해서 request에 등록(고객 기본정보, 책정보)
			request.setAttribute("orderTotalPrice", orderTotalPrice);
			request.setAttribute("orderTotalQty", orderTotalQty);
			request.setAttribute("orderDetailDTOList", orderDetailDTOList);
			request.setAttribute("lackBookDTOList", lackBookDTOList);
			UserDTO userDTO=orderService.selectUserOrderInfo(customerCode);
			
			System.out.println(userDTO);
			if(userDTO!=null){
				request.setAttribute("userDTO", userDTO);
			}else{
				throw new Exception("주문자 정보를 불러 올 수 없습니다.");
			}
			
			System.out.println("cccc");
			request.getRequestDispatcher("customer/payment/confirmPaymet.jsp").forward(request, response);
			
		} catch (Exception e) {
			request.setAttribute("errorMessage", errorMessage);
			try {
				request.getRequestDispatcher("error.jsp").forward(request, response);
			} catch (ServletException | IOException e1) {
				e1.printStackTrace();
			}
		}
	}

}
