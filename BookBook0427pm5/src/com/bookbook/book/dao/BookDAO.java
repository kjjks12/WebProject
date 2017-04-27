package com.bookbook.book.dao;

import java.util.List;

import com.bookbook.book.domain.BookDTO;

public interface BookDAO {
	/**
     * 전체게시물의 총 레코드수 가져오기
     * (select count(*) from board )
     *  => 검색일경우는 select count(*) from board where  추가 )
     * */
   int getTotalRecord(String keyField , String keyWorad);
	
	
   /**;
    * 모든 게시물 목록리스트(select) 가져오는 메소드
    * ( SELECT ROWNUM , book_code,book_title,book_author,book_price
      from(select * from book order by book_code) )
    * */
   List<BookDTO> getBookList(int pageNum, String keyField, String keyWord);
   
   /**
    * 전체 book데이터 가져오는 메소드
    * */
   List<BookDTO> selectAll();

}
