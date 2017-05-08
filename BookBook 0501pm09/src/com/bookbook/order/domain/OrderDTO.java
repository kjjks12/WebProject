package com.bookbook.order.domain;

import java.util.List;

import com.bookbook.orderdetail.domain.OrderDetailDTO;
import com.bookbook.payment.domain.PaymentDTO;
import com.bookbook.user.domain.UserDTO;

public class OrderDTO {
	/**�ֹ��󼼳���*/
	private List<OrderDetailDTO> orderDetailDTOList;
	/**�ֹ���������*/
	private PaymentDTO paymentDTO;
	/**�ֹ��� ����*/
	private UserDTO customerDTO;
	/**�ֹ��ڵ�*/
	private String orderCode;
	/**�ֹ�����*/
	private String orderTitle;
	/**����� �ּ�*/
	private String orderAddr;
	/**�ֹ� ����� �ڵ�*/
	private String orderUserCode;
	/**�ֹ���*/
	private String orderDate;
	/**����� ����ó*/
	private String orderTel;
	/**�ֹ�����*/
	private String orderState;
	/**�ֹ��ݾ�*/
	private int orderPrice;
	/**�ֹ�����*/
	private int orderQty;
	/**�ֹ� ��û����*/
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
