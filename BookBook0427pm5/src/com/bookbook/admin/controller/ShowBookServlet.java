package com.bookbook.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbook.admin.service.AdminBookService;
import com.bookbook.bookdetail.domain.BookDetailDTO;

/**
 * @version 1.0 (2017-04-26)
 * @author ������
 * @param  attr:���� ã������ null  (�о�,������,����) ã���� ����
 * 		   data:ã�� ������ ���� ã������ null
 * @brief  1. left.jsp ���� ���� ���� �Ҷ� ȣ��
 *		   2. �Ŀ� ���� ��ü �˻� �Ҷ� ��� �Ϸ�����!!
 */
@WebServlet("/ShowBookServlet")
public class ShowBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	AdminBookService bookService= new AdminBookService();
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("ShowBookServlet");
		String attr=request.getParameter("attr");
		String data=request.getParameter("data");
		//System.out.println("attr :"+attr);
		//System.out.println("data :"+data);
		
		if(attr==null && data==null){
			attr="all";
			data="all";
		}
		
		try{

			List<BookDetailDTO> list=bookService.showBook(attr, data);

			request.setAttribute("list", list);
			request.getRequestDispatcher("admin/book_show.jsp").forward(request, response);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
