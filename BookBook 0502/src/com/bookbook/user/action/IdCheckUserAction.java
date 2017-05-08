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

			// �Ķ���͸� �޴´�
			String id = request.getParameter("inputId");

			// �Ķ���� ���� Ȯ���Ѵ�.
			PrintWriter out = response.getWriter();
			try {
				int result = new UserDAOImpl().idCheck(id);

				if (result == 1) {// ��밡���� ���̵��̴�.
					out.print("��밡���� ���̵��Դϴ�.");
				} else {
					out.print("�ߺ��� ���̵��Դϴ�.");
				}
			} catch (SQLException e) {
				e.printStackTrace();
				// ������������ �̵�~ ������������ ���� ��������� �ʾ���.
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
