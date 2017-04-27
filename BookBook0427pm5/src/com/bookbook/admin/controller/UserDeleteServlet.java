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
		System.out.println("삭제 들어왔어");
		PrintWriter out=response.getWriter();
		try {
			String customerCode = request.getParameter("customer_code");
			// System.out.println(customerCode);
			int result=userService.delete(customerCode);
			if(result!=0){
				System.out.println("삭제성공");
				out.println("alert('"+customerCode+"삭제에 성공하였습니다')");
			}
			response.sendRedirect(request.getContextPath()+"/UserManagementServlet");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
