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
 * @author ������
 * @param customer_code(���� ID)
 * @return ���� :0 �̿��� �� 
 * @brief user_management.jsp ���� ���� ��ư�� ������ customer_code �������ͼ�
 * 		  �ش� ������ ���� �� UserManagementServlet ���������� �̵� �׷��� ȸ�� ���� �������� �ڵ� �̵�
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
			// System.out.println(customerCode);
			int result=userService.delete(customerCode);
			//System.out.println("���� ��� :"+result);
			if(result!=0){
				PrintWriter out = response.getWriter(); 
				out.println("<script type=\'text/javascript'>"); 
				out.println("alert('"+customerCode+"������ �����Ͽ����ϴ�');"); 
				out.println("</script>"); 
			}
			else{
				
			}
			response.sendRedirect(request.getContextPath()+"/UserManagementServlet");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}