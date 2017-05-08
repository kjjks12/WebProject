package com.bookbook.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookbook.util.action.Action;

public class UserLogoutAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			
			HttpSession session = request.getSession();
			session.invalidate();
			System.out.println("logout");
			response.sendRedirect("start.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
