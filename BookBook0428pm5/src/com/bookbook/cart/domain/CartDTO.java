package com.bookbook.cart.domain;

import java.util.List;

import com.bookbook.book.domain.BookDTO;

public class CartDTO {
	/**사용자 id*/
	private String userCode;
	/**주문 도서정보*/
	private BookDTO bookDTO;
	/**주문 도서수량*/
	private int orderDetailQty;
	/**주문 도서가격*/
	private int orderDetailPrice;
	
	public CartDTO() {
		super();
	}
	
	public CartDTO(String userCode, BookDTO bookDTO, int orderDetailQty, int orderDetailPrice) {
		super();
		this.userCode = userCode;
		this.bookDTO = bookDTO;
		this.orderDetailQty = orderDetailQty;
		this.orderDetailPrice = orderDetailPrice;
	}

	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public BookDTO getBookDTO() {
		return bookDTO;
	}
	public void setBookDTO(BookDTO bookDTO) {
		this.bookDTO = bookDTO;
	}
	public int getOrderDetailQty() {
		return orderDetailQty;
	}
	public void setOrderDetailQty(int orderDetailQty) {
		this.orderDetailQty = orderDetailQty;
	}
	public int getOrderDetailPrice() {
		return orderDetailPrice;
	}
	public void setOrderDetailPrice(int orderDetailPrice) {
		this.orderDetailPrice = orderDetailPrice;
	}
	
}
