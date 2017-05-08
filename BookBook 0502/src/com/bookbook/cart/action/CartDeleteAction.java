package com.bookbook.cart.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookbook.cart.service.CartService;
import com.bookbook.cart.service.CartServiceImpl;
import com.bookbook.util.action.Action;

public class CartDeleteAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			String bookCode = request.getParameter("bookCode");
			String userCode = (String) session.getAttribute("loggedInUser");
		
			CartService cs = new CartServiceImpl();
			
			
			int result = cs.deleteCart(userCode, bookCode);

			if (result == 0)
				System.out.println("delete실패");
			else
				System.out.println("delete성공");
			
			PrintWriter out = response.getWriter();
			out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
