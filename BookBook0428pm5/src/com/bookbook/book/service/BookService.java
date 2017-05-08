package com.bookbook.book.service;

import java.sql.SQLException;
import java.util.List;

import com.bookbook.book.dao.BookDAOImpl;
import com.bookbook.book.domain.BookDTO;
import com.bookbook.bookdetail.domain.BookDetailDTO;

public class BookService {
	private static BookDAOImpl bookDao = new BookDAOImpl();
	
	public BookService(){}
	
	/**
	 * BookDAOImpl의 전체게시물의 총 레코드수 가져오기
	 * */
	public static int getTotalRecord(String keyField, String keyWord) throws SQLException{
		int result = bookDao.getTotalRecord(keyField, keyWord);
		
		return result;
	}
	
	
	/**
	 * BookDAOImpl의 모든 게시물 목록리스트(select) 가져오는 메소드
	 * */
	public static List<BookDTO> getBookList(String keyField, String keyWord) throws SQLException{
		List<BookDTO> dto = (List<BookDTO>) bookDao.getBookList( keyField, keyWord);
		
		return dto;
	}
	
	

	public static List<BookDTO> selectAll() throws SQLException{
		List<BookDTO> dto = (List<BookDTO>) bookDao.selectAll();
		
		return dto;
	}
	
	public static BookDetailDTO getDetailBook(String isbn) throws SQLException{
		return bookDao.getDetailBook(isbn);
	}
	

}
