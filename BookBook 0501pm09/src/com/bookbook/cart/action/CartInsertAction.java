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
			String userCode = (String) request.getSession().getAttribute("loggedInUser");
			String bookCode = request.getParameter("bookCode");
			String bookTitle = request.getParameter("bookTitle");
			String bookPrice = request.getParameter("bookPrice");
			
			BookDTO bookDTO = new BookDTO(bookCode, bookTitle, Integer.parseInt(bookPrice));
			
			CartService cs = new CartServiceImpl();
			if (cs.checkCart(userCode, bookCode)!=0){
				int result = cs.updateCart(userCode, 0, bookCode);
				if (result == 0)
					throw new Exception("카트에 넣기 실패");
				else
					System.out.println("update성공");
			}
			
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