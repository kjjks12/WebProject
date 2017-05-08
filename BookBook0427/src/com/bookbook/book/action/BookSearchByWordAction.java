package com.bookbook.book.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbook.book.domain.BookDTO;
import com.bookbook.book.service.BookService;
import com.bookbook.util.action.Action;


public class BookSearchByWordAction implements Action{


	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try{
		String keyField = request.getParameter("keyField"); 
		String keyWord = request.getParameter("keyWord");
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		int result = BookService.getTotalRecord(keyField, keyWord);
		List<BookDTO> searchList = BookService.getBookList(pageNum, keyField, keyWord);
		
		request.setAttribute("result", result);
		request.setAttribute("searchList", searchList);
		request.getRequestDispatcher("book_search_list.jsp").forward(request, response);
		
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
