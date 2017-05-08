package com.bookbook.user.action;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbook.user.dao.UserDAOImpl;
import com.bookbook.util.action.Action;

public class IdCheckUserAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8 ");

			// 파라미터를 받는다
			String id = request.getParameter("inputId");

			// 파라미터 값을 확인한다.
			PrintWriter out = response.getWriter();
			try {
				int result = new UserDAOImpl().idCheck(id);

				if (result == 1) {// 사용가능한 아이디이다.
					out.print("사용가능한 아이디입니다.");
				} else {
					out.print("중복된 아이디입니다.");
				}
			} catch (SQLException e) {
				e.printStackTrace();
				// 에러페이지로 이동~ 에러페이지가 아직 만들어지지 않았음.
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
