package com.bookbook.orderdetail.domain;

import com.bookbook.book.domain.BookDTO;

public class OrderDetailDTO {
	/**�ֹ��ڵ�*/
	private String orderCode;
	/**�ֹ� ��������*/
	private BookDTO bookDTO;
	/**�ֹ� ��������*/
	private int orderDetailQty;
	/**�ֹ� ��������*/
	private int orderDetailPrice;
	public OrderDetailDTO() {
		super();
	}
	public OrderDetailDTO(String orderCode, BookDTO bookDTO, int orderDetailQty, int orderDetailPrice) {
		super();
		this.orderCode = orderCode;
		this.bookDTO = bookDTO;
		this.orderDetailQty = orderDetailQty;
		this.orderDetailPrice = orderDetailPrice;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
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
	@Override
	public String toString() {
		return "OrderDetailDTO [orderCode=" + orderCode + ", bookDTO=" + bookDTO + ", orderDetailQty=" + orderDetailQty
				+ ", orderDetailPrice=" + orderDetailPrice + "]";
	}
}
