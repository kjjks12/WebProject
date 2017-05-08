package com.bookbook.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbook.book.service.BookService;
import com.bookbook.bookdetail.domain.BookDetailDTO;
import com.bookbook.util.action.Action;

public class BookDetailSearchAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		try{
			String isbn = request.getParameter("book_code"); 
			//System.out.println("Å°°ª:"+isbn);
			BookDetailDTO bookDetailDTO = BookService.getDetailBook(isbn);
			
			//System.err.println(bookDetailDTO);
			
			System.out.println(request.getContextPath()+"/customer/book/detail_book.jsp");
			request.setAttribute("book_detail_dto", bookDetailDTO);//request.getContextPath()
			request.getRequestDispatcher("customer/book/detail_book.jsp").forward(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		
		
	}

}
