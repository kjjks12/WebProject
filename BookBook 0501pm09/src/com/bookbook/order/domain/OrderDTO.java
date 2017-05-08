package com.bookbook.order.domain;

import java.util.List;

import com.bookbook.orderdetail.domain.OrderDetailDTO;
import com.bookbook.payment.domain.PaymentDTO;
import com.bookbook.user.domain.UserDTO;

public class OrderDTO {
	/**주문상세내역*/
	private List<OrderDetailDTO> orderDetailDTOList;
	/**주문결제내역*/
	private PaymentDTO paymentDTO;
	/**주문자 정보*/
	private UserDTO customerDTO;
	/**주문코드*/
	private String orderCode;
	/**주문제목*/
	private String orderTitle;
	/**배송지 주소*/
	private String orderAddr;
	/**주문 사용자 코드*/
	private String orderUserCode;
	/**주문일*/
	private String orderDate;
	/**배송지 연락처*/
	private String orderTel;
	/**주문상태*/
	private String orderState;
	/**주문금액*/
	private int orderPrice;
	/**주문수량*/
	private int orderQty;
	/**주문 요청사항*/
	private String orderMessage;
	
	
	public OrderDTO() {
		super();
	}


	public OrderDTO(List<OrderDetailDTO> orderDetailDTOList, PaymentDTO paymentDTO, UserDTO customerDTO,
			String orderCode, String orderTitle, String orderAddr, String orderUserCode, String orderDate,
			String orderTel, String orderState, int orderPrice, int orderQty) {
		super();
		this.orderDetailDTOList = orderDetailDTOList;
		this.paymentDTO = paymentDTO;
		this.customerDTO = customerDTO;
		this.orderCode = orderCode;
		this.orderTitle = orderTitle;
		this.orderAddr = orderAddr;
		this.orderUserCode = orderUserCode;
		this.orderDate = orderDate;
		this.orderTel = orderTel;
		this.orderState = orderState;
		this.orderPrice = orderPrice;
		this.orderQty = orderQty;
	}


	public OrderDTO(List<OrderDetailDTO> orderDetailDTOList, PaymentDTO paymentDTO, UserDTO customerDTO,
			String orderCode, String orderTitle, String orderAddr, String orderUserCode, String orderDate,
			String orderTel, String orderState, int orderPrice, int orderQty, String orderMessage) {
		super();
		this.orderDetailDTOList = orderDetailDTOList;
		this.paymentDTO = paymentDTO;
		this.customerDTO = customerDTO;
		this.orderCode = orderCode;
		this.orderTitle = orderTitle;
		this.orderAddr = orderAddr;
		this.orderUserCode = orderUserCode;
		this.orderDate = orderDate;
		this.orderTel = orderTel;
		this.orderState = orderState;
		this.orderPrice = orderPrice;
		this.orderQty = orderQty;
		this.orderMessage = orderMessage;
	}


	public List<OrderDetailDTO> getOrderDetailDTOList() {
		return orderDetailDTOList;
	}


	public void setOrderDetailDTOList(List<OrderDetailDTO> orderDetailDTOList) {
		this.orderDetailDTOList = orderDetailDTOList;
	}


	public PaymentDTO getPaymentDTO() {
		return paymentDTO;
	}


	public void setPaymentDTO(PaymentDTO paymentDTO) {
		this.paymentDTO = paymentDTO;
	}


	public UserDTO getCustomerDTO() {
		return customerDTO;
	}


	public void setCustomerDTO(UserDTO customerDTO) {
		this.customerDTO = customerDTO;
	}


	public String getOrderCode() {
		return orderCode;
	}


	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}


	public String getOrderTitle() {
		return orderTitle;
	}


	public void setOrderTitle(String orderTitle) {
		this.orderTitle = orderTitle;
	}


	public String getOrderAddr() {
		return orderAddr;
	}


	public void setOrderAddr(String orderAddr) {
		this.orderAddr = orderAddr;
	}


	public String getOrderUserCode() {
		return orderUserCode;
	}


	public void setOrderUserCode(String orderUserCode) {
		this.orderUserCode = orderUserCode;
	}


	public String getOrderDate() {
		return orderDate;
	}


	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}


	public String getOrderTel() {
		return orderTel;
	}


	public void setOrderTel(String orderTel) {
		this.orderTel = orderTel;
	}


	public String getOrderState() {
		return orderState;
	}


	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}


	public int getOrderPrice() {
		return orderPrice;
	}


	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}


	public int getOrderQty() {
		return orderQty;
	}


	public void setOrderQty(int orderQty) {
		this.orderQty = orderQty;
	}


	public String getOrderMessage() {
		return orderMessage;
	}


	public void setOrderMessage(String orderMessage) {
		this.orderMessage = orderMessage;
	}


	@Override
	public String toString() {
		return "OrderDTO [orderDetailDTOList=" + orderDetailDTOList + ", paymentDTO=" + paymentDTO + ", customerDTO="
				+ customerDTO + ", orderCode=" + orderCode + ", orderTitle=" + orderTitle + ", orderAddr=" + orderAddr
				+ ", orderUserCode=" + orderUserCode + ", orderDate=" + orderDate + ", orderTel=" + orderTel
				+ ", orderState=" + orderState + ", orderPrice=" + orderPrice + ", orderQty=" + orderQty
				+ ", orderMessage=" + orderMessage + "]";
	}

}
