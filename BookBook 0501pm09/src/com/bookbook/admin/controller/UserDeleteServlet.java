package com.bookbook.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbook.user.service.UserService;

/**
 * @version 1.0 (2017-04-27)
 * @author 정광수
 * @param customer_code(고객 ID)
 * @return 성공 :0 이외의 값 
 * @brief user_management.jsp 에서 삭제 버튼을 누르면 customer_code 가지고와서
 * 		  해당 데이터 삭제 후 UserManagementServlet 서블릿으로 이동 그러면 회원 보기 페이지로 자동 이동
 * 
 */
@WebServlet("/UserDeleteServlet")
public class UserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserService userService = new UserService();

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			
			String customerCode = request.getParameter("customer_code");
			
			System.out.println("삭제 서블릿 들어옴");
			System.out.println("삭제 code:"+customerCode);
			// System.out.println(customerCode);
			//int result=userService.delete(customerCode);
			//System.out.println("삭제 결과 :"+result);
			
			//request.getRequestDispatcher("UserManagementServlet").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
