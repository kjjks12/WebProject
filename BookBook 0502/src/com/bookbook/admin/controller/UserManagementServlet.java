package com.bookbook.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbook.bookdetail.domain.BookDetailDTO;
import com.bookbook.user.domain.UserDTO;
import com.bookbook.user.service.UserService;
import com.sun.org.apache.regexp.internal.REUtil;

/**
 * Servlet implementation class UserManageServlet
 */
@WebServlet("/UserManagementServlet")
public class UserManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService userService = new UserService();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("userService");
		try {
			List<UserDTO> userList = userService.selectAll();
			System.out.println(userList);
			request.setAttribute("userList", userList);
			request.getRequestDispatcher("admin/user_management.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
