package com.bookbook.user.action;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbook.user.dao.UserDAOImpl;
import com.bookbook.user.domain.UserDTO;
import com.bookbook.util.action.Action;

public class InsertUserAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {

			String id = request.getParameter("inputId");
			String password = request.getParameter("inputPassword1");
			String tel = request.getParameter("tel1") + "-" + request.getParameter("tel2") + "-"
					+ request.getParameter("tel3");
			String addr = request.getParameter("sample6_address") + " " + request.getParameter("sample6_address2");
			String gender = request.getParameter("gender");
			String birth = request.getParameter("birthYear") + request.getParameter("birthMonth")
					+ request.getParameter("birthDay");
			String email = request.getParameter("userEmail1") + "@" + request.getParameter("userEmail2");
			String name = request.getParameter("name");
			String hint = "도레미";
			String question = "파솔라";
			String answer = "시도레";

			System.out.println(id + password + tel + addr + hint + email + birth + gender);

			PrintWriter out = response.getWriter();

			// 성공하면 1, 실패하면 0 반환
			int result = new UserDAOImpl()
					.insert(new UserDTO(id, password, tel, addr, gender, birth, email, name, hint, question, answer));
			if (result != 0) {
				response.sendRedirect("signup_success.jpg");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// 에러페이지로 이동
		}
	}
}