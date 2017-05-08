package com.bookbook.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbook.user.dao.UserDAOImpl;
import com.bookbook.user.domain.UserDTO;
import com.bookbook.util.action.Action;

public class InsertUserAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset= UTF-8");

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
			String hint = "힌트";
			String question = "문제";
			String answer = "정답";
			String zipcode = request.getParameter("sample6_postcode");
			String level = "레벨";
			String cash = "1000";

			
			System.out.println();
			
			System.out.println(id + password + tel + addr +gender+ birth + email +name + hint+question+ answer + zipcode+ level+cash);

			PrintWriter out = response.getWriter();
			// 성공하면 1, 실패하면 0 반환
			UserDTO userDto = new UserDTO();
			userDto.setUserCode(id);
			int result = new UserDAOImpl()
					.insert(new UserDTO(id,
							name,
							password,
							tel,
							addr,
							gender,
							birth,
							email,
							"",
							"",
							"",
							zipcode,
							"",
							"")
						);
			if (result == 0) {
				out.print("회원가입에 실패했습니다.");

			} else {
/*				out.print("가입을 성공했습니다.");*/
			response.sendRedirect("start.jsp");
			
			}
		} catch (Exception e) {
			e.printStackTrace();
			// 에러페이지로 이동

		}

	}

}
