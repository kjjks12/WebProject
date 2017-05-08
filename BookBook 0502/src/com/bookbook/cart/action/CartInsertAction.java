package com.bookbook.cart.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbook.book.domain.BookDTO;
import com.bookbook.cart.service.CartService;
import com.bookbook.cart.service.CartServiceImpl;
import com.bookbook.util.action.Action;

public class CartInsertAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("cartInsert");
			//유저 코드 ,북 ISBN ,북 title ,책 가격 생성
			String userCode = (String) request.getSession().getAttribute("loggedInUser");
			String bookCode = request.getParameter("bookCode");
			String bookTitle = request.getParameter("bookTitle");
			String bookPrice = request.getParameter("bookPrice");
			
			BookDTO bookDTO = new BookDTO(bookCode, bookTitle, Integer.parseInt(bookPrice));
			
			CartService cs = new CartServiceImpl();
			//넣을 데이터가 이미있으면 -> 업데이트 실행
			if (cs.checkCart(userCode, bookCode)!=0){
				int result = cs.updateCart(userCode, 0, bookCode);
				if (result == 0)
					throw new Exception("카트에 넣기 실패");
				else{
					System.out.println("update성공");
					response.sendRedirect(request.getContextPath()+"/Cart");
				}
			}
			//넣을 데이터가  없는 상태면 insert 실행
			else {
				int result = cs.insertCart(userCode, bookDTO);
				if (result == 0)
					throw new Exception("카트에 넣기 실패");
				else{
					System.out.println("insert성공");
				response.sendRedirect(request.getContextPath()+"/Cart");
			}}
		} catch (Exception e){
			e.printStackTrace();
		}
	}
}