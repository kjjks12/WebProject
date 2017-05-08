package com.bookbook.admin.dao;

import java.io.CharArrayReader;
import java.io.Reader;
import java.io.StringReader;
import java.io.Writer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookbook.book.domain.BookDTO;
import com.bookbook.bookdetail.domain.BookDetailDTO;
import com.bookbook.util.db.DBUtil;

import oracle.jdbc.internal.OracleResultSet;
import oracle.net.aso.s;
import oracle.sql.CLOB;
import oracle.jdbc.driver.OracleResultSetCache;;

public class AdminBookDAO {

	/**
	 * @author ������
	 * @param bookDetailDto
	 * @return book,bookdetail ��� and �����ڷ� ���� (0=���� , 1=����)
	 * @throws SQLException
	 * @brief å��, å �����׸� �ι��� insert �ʿ� �ϰ� ó���� ��!
	 */
	public int saveBook(BookDetailDTO bookDetailDto) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int bookResult = 0;
		int detailResult = 0;
		try {
			//System.out.println("DAO ó���κ� ����");
			/*
			 * Clob clob = conn.createClob(); clob.setString(0,
			 * bookDetailDto.getBookDetailDescription()); clob.setString(0,
			 * bookDetailDto.getBookDetailAuthor()); clob.setString(0,
			 * bookDetailDto.getBookDetailIndex());
			 */

			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);// ���� Ŀ�� ���
			//System.out.println("1");
			pstmt = conn.prepareStatement("INSERT INTO BOOK VALUES" + "(?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, bookDetailDto.getBookDTO().getBookCode());
			pstmt.setString(2, bookDetailDto.getBookDTO().getBookTitle());
			pstmt.setString(3, bookDetailDto.getBookDTO().getBookAuthor());
			pstmt.setString(4, bookDetailDto.getBookDTO().getBookPublisher());
			pstmt.setString(5, bookDetailDto.getBookDTO().getBookDate());
			pstmt.setInt(6, bookDetailDto.getBookDTO().getBookPage());
			pstmt.setInt(7, bookDetailDto.getBookDTO().getBookPrice());
			pstmt.setString(8, bookDetailDto.getBookDTO().getBookCover());
			pstmt.setString(9, bookDetailDto.getBookDTO().getBookCategoryCode());
			pstmt.setInt(10, bookDetailDto.getBookDTO().getBookInventory());
			pstmt.setString(11, bookDetailDto.getBookDTO().getBookUsed());
			//System.out.println("2");
			pstmt.executeUpdate();
			//System.out.println("Book ������Ʈ �Ϸ�");

			pstmt = conn.prepareStatement("INSERT INTO BOOKDETAIL VALUES(?, ?, ?, ?)");
			pstmt.setString(1, bookDetailDto.getBookDTO().getBookCode());
			pstmt.setString(2, bookDetailDto.getBookDetailDescription());
			pstmt.setString(3, bookDetailDto.getBookDetailAuthor());
			pstmt.setString(4, bookDetailDto.getBookDetailIndex());
			pstmt.executeUpdate();
			conn.commit();

			//System.out.println("���������� �Ծ�");
		} finally {
			DBUtil.dbClose(conn, pstmt, rs);
		}
		return bookResult & detailResult;
	}
	
	
	/**
	 * @author ������
	 * @param bookDetailDto
	 * @return book,bookdetail ��� and �����ڷ� ���� (0=���� , 1=����)
	 * @throws SQLException
	 * @brief å��, å �����׸� �ι��� insert �ʿ� �ϰ� ó���� ��!
	 */
	public int update(BookDetailDTO bookDetailDto) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int bookResult = 0;
		int detailResult = 0;
		try {

			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);// ���� Ŀ�� ���
			StringBuffer sqlQuery = new StringBuffer();
			sqlQuery.append("UPDATE BOOK SET ");
			sqlQuery.append("BOOK_TITLE = ? , ");
			sqlQuery.append("BOOK_AUTHOR = ? , ");
			sqlQuery.append("BOOK_PUBLISHER = ? , ");
			sqlQuery.append("BOOK_DATE = ? , ");
			sqlQuery.append("BOOK_PAGE = ? , ");
			sqlQuery.append("BOOK_PRICE = ? , ");
			sqlQuery.append("BOOK_COVER = ? , ");
			sqlQuery.append("BOOK_CATEGORY_CODE = ? , ");
			sqlQuery.append("BOOK_INVENTORY = ? , ");
			sqlQuery.append("BOOK_USED = ?  ");
			sqlQuery.append("WHERE BOOK_CODE = ? ");
			System.out.println(sqlQuery.toString());
			pstmt = conn.prepareStatement(sqlQuery.toString());
			pstmt.setString(1, bookDetailDto.getBookDTO().getBookTitle());
			pstmt.setString(2, bookDetailDto.getBookDTO().getBookAuthor());
			pstmt.setString(3, bookDetailDto.getBookDTO().getBookPublisher());
			pstmt.setString(4, bookDetailDto.getBookDTO().getBookDate());
			pstmt.setInt(5, bookDetailDto.getBookDTO().getBookPage());
			pstmt.setInt(6, bookDetailDto.getBookDTO().getBookPrice());
			pstmt.setString(7, bookDetailDto.getBookDTO().getBookCover());
			pstmt.setString(8, bookDetailDto.getBookDTO().getBookCategoryCode());
			pstmt.setInt(9, bookDetailDto.getBookDTO().getBookInventory());
			pstmt.setString(10, bookDetailDto.getBookDTO().getBookUsed());
			pstmt.setString(11, bookDetailDto.getBookDTO().getBookCode());
			//System.out.println("2");
			bookResult=pstmt.executeUpdate();
			//System.out.println("Book ������Ʈ �Ϸ�");
			
			
			/**
			 * CLOB ���������� ���� �����ͺ��� �뷮�� ũ������ ��� ������ �߰��� �ȵ�...
			 * ���� update�� �� ������ �Ҵ��� ������ �ٽ� select�� ������ �;���
			 * 
			 */
			
			
			//1.update �� DB���� Ȯ��
			sqlQuery.setLength(0);
			sqlQuery.append("UPDATE BOOKDETAIL SET ");
			sqlQuery.append("BOOKDETAIL_DESCRIPTION = ? , ");
			sqlQuery.append("BOOKDETAIL_AUTHOR = ? , ");
			sqlQuery.append("BOOKDETAIL_INDEX = ?  ");
			sqlQuery.append("where  BOOKDETAIL_CODE = ? ");
			System.out.println(sqlQuery.toString());
			pstmt=conn.prepareStatement(sqlQuery.toString());
			pstmt.setString(1,bookDetailDto.getBookDetailDescription());
			pstmt.setString(2,bookDetailDto.getBookDetailAuthor());
			pstmt.setString(3,bookDetailDto.getBookDetailIndex());
			pstmt.setString(4,bookDetailDto.getBookDTO().getBookCode());
			detailResult=pstmt.executeUpdate();
			
			
			/*StringReader reader1 = new StringReader(bookDetailDto.getBookDetailDescription());
			StringReader reader2 = new StringReader(bookDetailDto.getBookDetailAuthor());
			StringReader reader3 = new StringReader(bookDetailDto.getBookDetailIndex());
			
			pstmt = conn.prepareStatement(sqlQuery.toString());
			pstmt.setCharacterStream(1, reader1, bookDetailDto.getBookDetailDescription().length());
			pstmt.setCharacterStream(2, reader2, bookDetailDto.getBookDetailAuthor().length());
			pstmt.setCharacterStream(3, reader3, bookDetailDto.getBookDetailIndex().length());
			pstmt.setString(4, bookDetailDto.getBookDTO().getBookCode());
			pstmt.executeUpdate();
			
			reader3.close();
			reader2.close();
			reader1.close();*/
		/*	//2.������ �����ͼ� ä������
			sqlQuery.setLength(0);
			sqlQuery.append("select * from BOOKDETAIL where BOOKDETAIL_CODE = ?");
			pstmt= conn.prepareStatement(sqlQuery.toString());
			pstmt.setString(1, bookDetailDto.getBookDTO().getBookCode());
			rs= pstmt.executeQuery();
			
			if(rs.next()){
				CLOB clob = null;
		          Writer writer = null;
		          Reader src = null;
		          char[] buffer = null;
		          int read = 0;  
		          clob = ((OracleResultSet)rs).getCLOB(1);         
		          writer = clob.getCharacterOutputStream();
		          // str -> DB�� ���� ����
		          src = new CharArrayReader(bookDetailDto.getBookDetailDescription().toCharArray()); 

		         
		          buffer = new char[1024]; 
		          read = 0;
		          while ( (read = src.read(buffer,0,1024)) != -1) { 
		               writer.write(buffer, 0, read); // write clob. 
		          }
		          src.close();         
		          writer.close();
		          
		          
		          clob = ((OracleResultSet)rs).getCLOB(2);         
		          writer = clob.getCharacterOutputStream();
		          src = new CharArrayReader(bookDetailDto.getBookDetailAuthor().toCharArray()); 
		          read = 0;
		          while ( (read = src.read(buffer,0,1024)) != -1) { 
		               writer.write(buffer, 0, read); // write clob. 
		          }
		          src.close();         
		          writer.close();
		          
		          
		          clob = ((OracleResultSet)rs).getCLOB(3);         
		          writer = clob.getCharacterOutputStream();
		          src = new CharArrayReader(bookDetailDto.getBookDetailAuthor().toCharArray()); 
		          read = 0;
		          while ( (read = src.read(buffer,0,1024)) != -1) { 
		        	  writer.write(buffer, 0, read); // write clob. 
		          }
		          
		          src.close();         
		          writer.close();

			}*/
			
			conn.commit();
			conn.setAutoCommit(true);
			System.out.println("������Ʈ ����");
		} finally {
			DBUtil.dbClose(conn, pstmt, rs);
		}
		return bookResult & detailResult;
	}

	/**
	 * @author ������
	 * @param attr:(�о�,���ǻ�,����)
	 *            data=ex) attr:�о� data:ã�� ����
	 * @return �ش� �ϴ� ��� ������ ����Ʈ�� ���� ��ȯ
	 * @throws SQLException
	 * @brief å��, å �����׸� �ι� ã�ƾ� �ؼ� �ϰ� ó�� �ʿ�
	 */
	public List<BookDTO> showBook(String attr, String data) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BookDTO> list = null;
		try {
			conn = DBUtil.getConnection();

			StringBuffer sqlQeury = new StringBuffer();
			sqlQeury.append(" select * from book ");
		/*	sqlQeury.append(" inner join bookdetail ");
			sqlQeury.append(" on book.book_code = bookdetail.bookdetail_code ");*/
			if (attr.equals("bookName"))
				sqlQeury.append("where BOOK_TITLE LIKE ? ");
			else if (attr.equals("author"))
				sqlQeury.append("where BOOK_AUTHOR LIKE ? ");
			else if (attr.equals("publisher"))
				sqlQeury.append("where BOOK_PUBLISHER LIKE ? ");

			pstmt = conn.prepareStatement(sqlQeury.toString());
			if (!attr.equals("all")) {
				pstmt.setString(1, "%" + data + "%");
			}
			System.out.println("���� :"+sqlQeury.toString());
			rs = pstmt.executeQuery();

			list = new ArrayList<>();
			while (rs.next()) {
				String bookCode = rs.getString("BOOK_CODE");
				String bookTitle = rs.getString("BOOK_TITLE");
				String bookAuthor = rs.getString("BOOK_AUTHOR");
				String bookPublisher = rs.getString("BOOK_PUBLISHER");
				String bookDate = rs.getString("BOOK_DATE");
				int bookPage = rs.getInt("BOOK_PAGE");
				int bookPrice = rs.getInt("BOOK_PRICE");
				String bookCover = rs.getString("BOOK_COVER");
				String bookCategoryCode = rs.getString("BOOK_CATEGORY_CODE");
				int bookInventory = rs.getInt("BOOK_INVENTORY");
				String bookUsed = rs.getString("BOOK_USED");

			/*	String bookDetailDescription = rs.getString("BOOKDETAIL_DESCRIPTION");
				String bookDetailAuthor = rs.getString("BOOKDETAIL_AUTHOR");
				String bookDetailIndex = rs.getString("BOOKDETAIL_INDEX");*/

				BookDTO bookDto = new BookDTO(bookCode, bookTitle, bookAuthor, bookPublisher, bookDate, bookPage,
						bookPrice, bookCover, bookCategoryCode, bookInventory, bookUsed);
/*
				BookDetailDTO bookDetailDTO = new BookDetailDTO(bookDto, bookDetailDescription, bookDetailAuthor,
						bookDetailIndex);*/

				list.add(bookDto);
			}

		} finally {
			DBUtil.dbClose(conn, pstmt, rs);
		}
		return list;
	}

	/**
	 * @author ������
	 * @param isbn:
	 *            isbn ���� �ش� �ϴ� ������ ������
	 * @return bookDetailDto �Ѱ� ��ȯ
	 * @throws SQLException
	 * @brief å��, å �����׸� innerjoin ���� bookcode�� ��ġ�ϴ°� ã��
	 */
	public BookDetailDTO selectBook(String isbn) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BookDetailDTO bookDetailDTO = new BookDetailDTO();
		try {
			conn = DBUtil.getConnection();

			StringBuffer sqlQeury = new StringBuffer();
			sqlQeury.append(" select * from book ");
			sqlQeury.append(" inner join bookdetail ");
			sqlQeury.append(" on book.book_code = bookdetail.bookdetail_code ");
			sqlQeury.append("where book.book_code = ? ");

			pstmt = conn.prepareStatement(sqlQeury.toString());
			pstmt.setString(1,isbn);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String bookCode = rs.getString("BOOK_CODE");
				String bookTitle = rs.getString("BOOK_TITLE");
				String bookAuthor = rs.getString("BOOK_AUTHOR");
				String bookPublisher = rs.getString("BOOK_PUBLISHER");
				String bookDate = rs.getString("BOOK_DATE");
				int bookPage = rs.getInt("BOOK_PAGE");
				int bookPrice = rs.getInt("BOOK_PRICE");
				String bookCover = rs.getString("BOOK_COVER");
				String bookCategoryCode = rs.getString("BOOK_CATEGORY_CODE");
				int bookInventory = rs.getInt("BOOK_INVENTORY");
				String bookUsed = rs.getString("BOOK_USED");

				String bookDetailDescription = rs.getString("BOOKDETAIL_DESCRIPTION");
				String bookDetailAuthor = rs.getString("BOOKDETAIL_AUTHOR");
				String bookDetailIndex = rs.getString("BOOKDETAIL_INDEX");

				BookDTO bookDto = new BookDTO(bookCode, bookTitle, bookAuthor, bookPublisher, bookDate, bookPage,
						bookPrice, bookCover, bookCategoryCode, "100", bookInventory, bookUsed);

				bookDetailDTO = new BookDetailDTO(bookDto, bookDetailDescription, bookDetailAuthor,
						bookDetailIndex);

			}

		} finally {
			DBUtil.dbClose(conn, pstmt, rs);
		}
		return bookDetailDTO;
	}

	
	/**
	 * @author ������
	 * @version 1.0 2017-04-28
	 * @param isbn: isbn ���� �ش� �ϴ� ������ ����
	 * @return  ���� : 1  ���� 0;
	 * @throws SQLException
	 * @brief å��, å �����׸� innerjoin ���� bookcode�� ��ġ�ϴ°� ã��
	 */
	public BookDetailDTO deleteBook(String isbn) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();

			StringBuffer sqlQeury = new StringBuffer();
			sqlQeury.append(" select * from book ");
			sqlQeury.append(" inner join bookdetail ");
			sqlQeury.append(" on book.book_code = bookdetail.bookdetail_code ");
			sqlQeury.append("where book.book_code = ? ");

			pstmt = conn.prepareStatement(sqlQeury.toString());
			pstmt.setString(1,isbn);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String bookCode = rs.getString("BOOK_CODE");
				String bookTitle = rs.getString("BOOK_TITLE");
				String bookAuthor = rs.getString("BOOK_AUTHOR");
				String bookPublisher = rs.getString("BOOK_PUBLISHER");
				String bookDate = rs.getString("BOOK_DATE");
				int bookPage = rs.getInt("BOOK_PAGE");
				int bookPrice = rs.getInt("BOOK_PRICE");
				String bookCover = rs.getString("BOOK_COVER");
				String bookCategoryCode = rs.getString("BOOK_CATEGORY_CODE");
				int bookInventory = rs.getInt("BOOK_INVENTORY");
				String bookUsed = rs.getString("BOOK_USED");

				String bookDetailDescription = rs.getString("BOOKDETAIL_DESCRIPTION");
				String bookDetailAuthor = rs.getString("BOOKDETAIL_AUTHOR");
				String bookDetailIndex = rs.getString("BOOKDETAIL_INDEX");

				BookDTO bookDto = new BookDTO(bookCode, bookTitle, bookAuthor, bookPublisher, bookDate, bookPage,
						bookPrice, bookCover, bookCategoryCode, "100", bookInventory, bookUsed);

		

			}

		} finally {
			DBUtil.dbClose(conn, pstmt, rs);
		}
		return null;
	}

	
}
