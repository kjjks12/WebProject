package com.bookbook.user.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserLoginAction
 */
@WebServlet("/auth/login")
public class UserLoginAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(request.getContextPath()+"/customer/user/login_form.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// dao���� select id pw Ȯ�� �� ������, Httpsession���, session.setAttribute("user", ?);
		
		// �����ϸ� Loginfail.jsp�� redirect
		
	}
}