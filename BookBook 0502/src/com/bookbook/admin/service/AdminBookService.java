package com.bookbook.admin.service;

import java.sql.SQLException;
import java.util.List;

import com.bookbook.admin.dao.AdminBookDAO;
import com.bookbook.book.domain.BookDTO;
import com.bookbook.bookdetail.domain.BookDetailDTO;

public class AdminBookService {
	
	AdminBookDAO bookDao= new AdminBookDAO();
	
	public int saveBook(BookDetailDTO bookDetailDto)throws SQLException{
		return bookDao.saveBook(bookDetailDto);
	}
	
	public List<BookDTO> showBook(String attr, String data) throws SQLException {
		return bookDao.showBook(attr, data);
	}
	
	public BookDetailDTO selectBook(String isbn) throws SQLException {
		return bookDao.selectBook(isbn);
	}
	
	public int update(BookDetailDTO bookDetailDto) throws Exception {
		
		return bookDao.update(bookDetailDto);
	}
}
