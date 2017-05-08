package com.bookbook.cart.service;

import java.sql.SQLException;
import java.util.List;

import com.bookbook.book.domain.BookDTO;
import com.bookbook.cart.dao.CartDAO;
import com.bookbook.cart.dao.CartDAOImpl;
import com.bookbook.cart.domain.CartDTO;


public class CartServiceImpl implements CartService {
	@Override
	public List<CartDTO> selectCart(String userCode) throws SQLException {
		CartDAO cartDAO=new CartDAOImpl();
		List<CartDTO> cartDTOList=cartDAO.selectCart(userCode);

		return cartDTOList;
	}

	@Override
	public int insertCart(String userCode, int bookQty, BookDTO bookDTO) throws SQLException {
		CartDAO cartDAO = new CartDAOImpl();
		int result = cartDAO.insertCart(userCode, bookQty, bookDTO);
		
		return result;
	}

	@Override
	public int updateCart(String userCode, int qty) throws SQLException {
		CartDAO cartDAO = new CartDAOImpl();
		int result = cartDAO.updateCart(userCode, qty);
		return result;
	}

	@Override
	public int deleteCart(String bookCode) throws SQLException {
		CartDAO cartDAO = new CartDAOImpl();
		int result = cartDAO.deleteCart(bookCode);
		
		return result;
	}

}
