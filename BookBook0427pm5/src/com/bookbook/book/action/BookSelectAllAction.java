package com.bookbook.book.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbook.book.domain.BookDTO;
import com.bookbook.book.service.BookService;
import com.bookbook.util.action.Action;
import com.sun.org.apache.bcel.internal.generic.Select;

public class BookSelectAllAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
	
			
			List<BookDTO> selectList = BookService.selectAll();
			
			request.setAttribute("selectList", selectList);
			//System.out.println(selectList);
			System.out.println(request.getContextPath());
			request.getRequestDispatcher("main2.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
