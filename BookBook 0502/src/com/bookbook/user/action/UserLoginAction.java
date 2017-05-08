package com.bookbook.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbook.user.dao.UserDAOImpl;
import com.bookbook.user.domain.UserDTO;
import com.bookbook.util.action.Action;

public class UserLoginAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			/*System.out.println("userLogin");*/
			String id = request.getParameter("inputId");
			String pw = request.getParameter("inputPassword");
			
			/*System.out.println("id="+id);
			System.out.println("pwd="+pw);
			*/
			UserDTO userDTO = new UserDTO(id, pw);
			
			int result = new UserDAOImpl().login(userDTO);
			PrintWriter out=response.getWriter();
			
			
			if (result == 1) {
				request.getSession().setAttribute("loggedInUser", id);
				out.println("<script>");
				out.println("alert('"+id+"님 반갑습니다')");
				out.println("location.href='start.jsp'");
				out.println("</script>");
				//request.getRequestDispatcher("start.jsp").forward(request, response);
			} else {
			/*	throw new Exception("로그인 실패"); */
				out.println("<script>");
				out.println("alert('id ,pwd를 확인해주세요')");
				out.println("location.href='"+request.getContextPath()+"/customer/user/login.jsp'");
				out.println("</script>");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
