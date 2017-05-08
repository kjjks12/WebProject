package com.bookbook.cart.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookbook.cart.service.CartService;
import com.bookbook.cart.service.CartServiceImpl;
import com.bookbook.util.action.Action;

public class CartUpdateAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			String qty = request.getParameter("qty");
			String userCode = (String) session.getAttribute("loggedInUser");
			String bookCode = request.getParameter("bookCode");
			System.out.println(bookCode);
			bookCode = bookCode.substring(8, bookCode.length()-4);
			
			CartService cs = new CartServiceImpl();
			int result = cs.updateCart(userCode, Integer.parseInt(qty), bookCode);
			
			if (result == 0)
				System.out.println("update실패");
			else
			{
				System.out.println("update성공");
			PrintWriter out = response.getWriter();
			out.println(result);
			response.sendRedirect(request.getContextPath()+"/Cart");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
