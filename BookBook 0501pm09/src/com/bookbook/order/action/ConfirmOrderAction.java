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
			//�ӽõ�����
			OrderService orderService=new OrderServiceImpl();
			List<OrderDetailDTO> orderDetailDTOList=new ArrayList<>();
			
			//�����ڵ� �Ǵ� ��ٱ��Ͽ��� �ֹ���ǰ ��������
			if(bookCode!=null && orderQty!=null){//�����ڵ�� ������ �ִ� ���
				//�ֹ������� orderDetailDTO�� ��ȯ
				BookDTO bookDTO=new BookDTO();
				bookDTO.setBookCode(bookCode);
				OrderDetailDTO orderDetailDTO=new OrderDetailDTO(null, bookDTO, Integer.parseInt(orderQty), 0);
				orderDetailDTOList.add(orderDetailDTO);
			}else{//��ٱ��Ͽ��� �ֹ���ǰ ��������
				CartService cartService=new CartServiceImpl();
				List<CartDTO> cartDTOList=cartService.selectCart(customerCode);
				
				if(cartDTOList!=null && cartDTOList.size()!=0){
					for(CartDTO cartDTO:cartDTOList){
						orderDetailDTOList.add(new OrderDetailDTO(null, cartDTO.getBookDTO(), cartDTO.getOrderDetailQty(), 0));
					}	
				}
				else{
					//�ƹ��� �����Ͱ� ���ٸ� ���������� �̵�
					throw new Exception("�߸��� �ֹ� �����̰ų� ��ٱ��Ͽ� �����Ͱ� �������� �ʽ��ϴ�.");
				}
			}

			System.out.println("aaaa");
			
			//�ֹ� ������ �ֹ������� �������� Ȯ���� ó�� ������ ���� ������ ó��
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
								//�ֹ��� �Ұ����� ��ǰ���� ����
								lackBookDTOList.add(orderDetailDTOList.get(i).getBookDTO());
							}
						}
					}
					//���� ������ �ֹ��Ұ� ������ �߰�
				}
			}
			int orderTotalQty=0, orderTotalPrice=0;
			for(OrderDetailDTO orderDetailDTO : orderDetailDTOList){
				orderTotalQty+=orderDetailDTO.getOrderDetailQty();
				orderTotalPrice+=orderDetailDTO.getBookDTO().getBookPrice()*orderDetailDTO.getOrderDetailQty();
			}
			System.out.println("bbbb");
			//�ֹ����� �����ؼ� request�� ���(�� �⺻����, å����)
			request.setAttribute("orderTotalPrice", orderTotalPrice);
			request.setAttribute("orderTotalQty", orderTotalQty);
			request.setAttribute("orderDetailDTOList", orderDetailDTOList);
			request.setAttribute("lackBookDTOList", lackBookDTOList);
			UserDTO userDTO=orderService.selectUserOrderInfo(customerCode);
			
			System.out.println(userDTO);
			if(userDTO!=null){
				request.setAttribute("userDTO", userDTO);
			}else{
				throw new Exception("�ֹ��� ������ �ҷ� �� �� �����ϴ�.");
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
