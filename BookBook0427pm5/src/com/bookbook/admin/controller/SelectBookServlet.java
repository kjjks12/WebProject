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
 * @author 정광수
 * @param bookCode 를 이용하여 해당 도서를 반환
 * @goto: 선택된 책을 가지고  책 수정 페이지로 이동!! (불러온 데이터 수정창에 셋팅 하기 위해서)
 * @brief: book_show.jsp 에서 도서를 클릭 할시 isbn(bookCode) 값을 가지고 해당 도서를 가져옴
 *         도서를 가지고 수정 페이지로 이동
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
