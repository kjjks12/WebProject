package com.bookbook.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbook.user.dao.UserDAOImpl;
import com.bookbook.user.domain.UserDTO;
import com.bookbook.util.action.Action;

public class UserLoginAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			String id = request.getParameter("inputId");
			String pw = request.getParameter("inputPassword");
			
			
			UserDTO userDTO = new UserDTO(id, pw);
			
			int result = new UserDAOImpl().login(userDTO);
			
			if (result == 1) {
				request.getSession().setAttribute("loggedInUser", id);
				request.getRequestDispatcher("start.jsp").forward(request, response);
			} else {
				throw new Exception("로그인 실패"); 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
