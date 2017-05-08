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
			String userCode = request.getParameter("userCode");
			int bookQty = Integer.parseInt(request.getParameter("bookQty"));
			String bookTitle = request.getParameter("bookTitle");
			String bookPrice = request.getParameter("bookPrice");
			
			BookDTO bookDTO = new BookDTO(bookTitle, Integer.parseInt(bookPrice));
			
			CartService cs = new CartServiceImpl();
			int result = cs.insertCart(userCode, bookQty, bookDTO);
			
			if (result == 0)
				System.out.println("insert실패");
			else
				System.out.println("insert성공");
		} catch (Exception e){
			e.printStackTrace();
		}
		
	}
}
