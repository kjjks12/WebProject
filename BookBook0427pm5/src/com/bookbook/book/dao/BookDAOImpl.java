package com.bookbook.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookbook.book.action.PageAction;
import com.bookbook.book.domain.BookDTO;
import com.bookbook.bookdetail.domain.BookDetailDTO;
import com.bookbook.util.db.DBUtil;

public class BookDAOImpl implements BookDAO {

	@Override
	public int getTotalRecord(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select count(*) from book ";

		try {

			if (keyWord != null && !keyWord.equals("") && !keyWord.equals("null")) {
				sql += " WHERE " + keyField.trim() + " LIKE '%" + keyWord.trim() + "%'";
			}

			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next())
				result = rs.getInt(1);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e + "=> getTotalRecord fail");
		} finally {
			DBUtil.dbClose(con, ps, rs);
		}

		return result;
	}

	@Override
	public List<BookDTO> getBookList(int pageNum, String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<BookDTO> list = new ArrayList<>();
		String sql = "SELECT ROWNUM , book_code,book_title,book_author,book_price from(select * from book order by book_title)";

		try {

			if (keyWord != null && !keyWord.equals("") && !keyWord.equals("null")) {
				sql += " WHERE " + keyField.trim() + " LIKE '%" + keyWord.trim() + "%'";
			}

			// 전체레코드수 가져오기
			int totalCount = this.getTotalRecord(keyField, keyWord);

			// PageAction쪽의 전역변수의 값들 설정하기
			PageAction.keyField = keyField;
			PageAction.keyWord = keyWord;
			PageAction.pageNum = pageNum;

			// 총페이지수 구한다.
			PageAction.pageCount = (int) Math.ceil(((double) totalCount / PageAction.pageSize));

			// 페이지 번호에 해당하는 게시물의 시작점 구한다. (현재페이지번호-1) * pageSize+1
			int absolute = (pageNum - 1) * PageAction.pageSize + 1;

			con = DBUtil.getConnection();
			// 특정행부터 레코드를 가져오기 위해서 옵션 설정
			ps = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

			rs = ps.executeQuery();

			if (rs.next()) {
				rs.absolute(absolute);// 커서를 특정 위치로 이동시킨다.

				int count = 0;
				while (count < PageAction.pageSize) {
					BookDTO dto = new BookDTO();

					String bookCode = rs.getString(2);
					String bookTitle = rs.getString(3);
					String bookAuthor = rs.getString(4);
					int bookPrice = rs.getInt(5);

					list.add(new BookDTO(bookCode, bookTitle, bookAuthor, bookPrice));

					if (rs.isLast())
						break;
					else
						rs.next();

					count++;
				} // while문끝

			} // if문끝

		} catch (Exception e) {
			System.out.println(e + "=> getBookList fail");
		} finally {
			DBUtil.dbClose(con, ps, rs);
		}

		return list;
	}

	@Override
	public List<BookDTO> selectAll() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT * from book order by book_date";
		List<BookDTO> list = new ArrayList<>();

		try {
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				String bookCode = rs.getString(1);
				String bookTitle = rs.getString(2);
				String bookAuthor = rs.getString(3);
				String bookDate = rs.getString(5);
				int bookPrice = rs.getInt(7);

				list.add(new BookDTO(bookCode, bookTitle, bookAuthor, bookPrice, bookDate));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(con, ps, rs);
		}
		return list;
	}

	
	/**
	 * @version 1.0 2017-04-27
	 * @author 정광수
	 * @param isbn
	 * @return BookDetailDTO 리턴
	 * @throws SQLException
	 * @brief  isbn 으로 찾은 책 세부 사항 리스트 리턴
	 * 		   도서보기 페이지에서 클릭시 isbn가지고 여기로 들어옴
	 */
	public BookDetailDTO getDetailBook(String isbn) throws SQLException{
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

}
