package com.bookbook.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbook.admin.service.AdminBookService;
import com.bookbook.bookdetail.domain.BookDetailDTO;

/**
 * @version 1.0 (2017-04-27)
 * @author ������
 * @param bookCode �� �̿��Ͽ� �ش� ������ ��ȯ
 * @goto: ���õ� å�� ������  å ���� �������� �̵�!! (�ҷ��� ������ ����â�� ���� �ϱ� ���ؼ�)
 * @brief: book_show.jsp ���� ������ Ŭ�� �ҽ� isbn(bookCode) ���� ������ �ش� ������ ������
 *         ������ ������ ���� �������� �̵�
 */
@WebServlet("/SelectBookServlet")
public class SelectBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	AdminBookService service= new AdminBookService();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String bookCode=request.getParameter("book_code");
		System.out.println(bookCode);
		try{
		BookDetailDTO bookDetailDTO=service.selectBook(bookCode);
		//System.out.println(bookDetailDTO);
		request.setAttribute("book_detail_dto", bookDetailDTO);
			request.getRequestDispatcher("admin/book_modified.jsp").forward(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	
	}

}
