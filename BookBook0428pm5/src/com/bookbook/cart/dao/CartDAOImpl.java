package com.bookbook.cart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookbook.book.domain.BookDTO;
import com.bookbook.cart.domain.CartDTO;
import com.bookbook.util.db.DBUtil;

public class CartDAOImpl implements CartDAO {
	@Override
	public List<CartDTO> selectCart(String userCode) throws SQLException {
		List<CartDTO> cartDTOList = new ArrayList<>();
		BookDTO bookDTO = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		int bookPrice = 0;
		int cartQty = 0;

		try {
			sql = "select book.book_code, book.book_title, cartBook.cart_price, cartBook.cart_qty "
					+ "from (select * from cart where cart_customer_code=?) cartBook, book "
					+ "where cartBook.cart_book_code=book.book_code";
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userCode);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				String bookCode = rs.getString(1);
				String bookTitle = rs.getString(2);
				bookPrice = rs.getInt(3);
				cartQty = rs.getInt(4);
				bookDTO = new BookDTO(bookCode, bookTitle, bookPrice);
				CartDTO cartDTO = new CartDTO(userCode, bookDTO, cartQty, bookPrice);
				cartDTOList.add(cartDTO);
			}
			
		} finally {
			DBUtil.dbClose(con, ps, rs);
		}
		return cartDTOList;
	}

	@Override
	public int insertCart(String userCode, int bookQty, BookDTO bookDTO) throws SQLException {
		int result = 0;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;

		try {
			sql = "insert cart into VALUES (cart_sequence.nextval, ?, ?, ?, ?, ?)";
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userCode);
			ps.setString(2, bookDTO.getBookTitle());
			ps.setInt(3, bookQty);
			ps.setInt(4, bookDTO.getBookPrice());
			ps.setString(5, "Y");

			result = ps.executeUpdate();
		} finally {
			DBUtil.dbClose(con, ps, rs);
		}

		return result;
	}

	@Override
	public int deleteCart(String bookCode) throws SQLException {
		int result = 0;
		BookDTO bookDTO = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			sql = "delete from cart where cart_book_code = ?";
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, bookCode);

			result = ps.executeUpdate();

		} finally {
			DBUtil.dbClose(con, ps, rs);
		}

		return result;
	}

	@Override
	public int updateCart(String userCode, int qty) throws SQLException {
		int result = 0;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;

		try {
			sql = "update cart set cart_qty = ? where cart_customer_code = ?";
			con = DBUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, qty);
			ps.setString(2, userCode);
			result = ps.executeUpdate();
		} finally {
			DBUtil.dbClose(con, ps, rs);
		}

		return result;
	}

}
