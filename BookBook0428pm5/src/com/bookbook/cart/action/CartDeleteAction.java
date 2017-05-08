package com.bookbook.cart.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbook.cart.service.CartService;
import com.bookbook.cart.service.CartServiceImpl;
import com.bookbook.util.action.Action;

public class CartDeleteAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			String bookCode = request.getParameter("bookCode");

			CartService cs = new CartServiceImpl();
			int result = cs.deleteCart(bookCode);

			if (result == 0)
				System.out.println("delete실패");
			else
				System.out.println("delete성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
