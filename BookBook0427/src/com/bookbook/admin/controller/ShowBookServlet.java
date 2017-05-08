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
 * @author 정광수
 * @param  attr:모든거 찾을떄는 null  (분야,도서명,저자) 찾을때 인자
 * 		   data:찾을 데이터 모든거 찾을때는 null
 * @brief  1. left.jsp 에서 도서 관리 할때 호출
 *		   2. 후에 도서 전체 검색 할때 사용 하려구함!!
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
