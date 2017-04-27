package com.bookbook.book.dao;

import java.util.List;

import com.bookbook.book.domain.BookDTO;

public interface BookDAO {
	/**
     * ��ü�Խù��� �� ���ڵ�� ��������
     * (select count(*) from board )
     *  => �˻��ϰ��� select count(*) from board where  �߰� )
     * */
   int getTotalRecord(String keyField , String keyWorad);
	
	
   /**;
    * ��� �Խù� ��ϸ���Ʈ(select) �������� �޼ҵ�
    * ( SELECT ROWNUM , book_code,book_title,book_author,book_price
      from(select * from book order by book_code) )
    * */
   List<BookDTO> getBookList(int pageNum, String keyField, String keyWord);
   
   /**
    * ��ü book������ �������� �޼ҵ�
    * */
   List<BookDTO> selectAll();

}
