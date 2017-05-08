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
		//System.out.println(keyField); 
		//System.out.println(keyWord); 
		
		if(keyField==null) keyField="all";
		
		
		List<BookDTO> searchList = BookService.getBookList(keyField, keyWord);
		
		request.setAttribute("selectList", searchList);
		
		request.getRequestDispatcher("main2.jsp").forward(request, response);
		
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
