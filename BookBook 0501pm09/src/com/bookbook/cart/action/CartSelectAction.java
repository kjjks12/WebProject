package com.bookbook.cart.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookbook.cart.domain.CartDTO;
import com.bookbook.cart.service.CartService;
import com.bookbook.cart.service.CartServiceImpl;
import com.bookbook.util.action.Action;

public class CartSelectAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			String userCode = session.getAttribute("loggedInUser").toString();
			
			CartService cs = new CartServiceImpl();
			List<CartDTO> cartDTOList = cs.selectCart(userCode);
			
			if (cartDTOList != null) {
				request.setAttribute("cartDTOList", cartDTOList);
				request.getRequestDispatcher("/customer/cart/cart.jsp").forward(request, response);;
			} else {
				
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		
	}
	
}
