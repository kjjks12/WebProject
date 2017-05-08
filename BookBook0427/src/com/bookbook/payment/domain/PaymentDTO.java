package com.bookbook.payment.domain;

public class PaymentDTO {
	/**결제 코드*/
	private String paymentCode;
	/**주문 코드*/
	private String orderCode;
	/**결제금액*/
	private int paymentTotalPrice;
	/**결제종류*/
	private String paymentType;
	/**결제일*/
	private String paymentDate;
	
	public PaymentDTO() {
		super();
	}

	public PaymentDTO(String paymentCode, String orderCode, int paymentTotalPrice, String paymentType,
			String paymentDate) {
		super();
		this.paymentCode = paymentCode;
		this.orderCode = orderCode;
		this.paymentTotalPrice = paymentTotalPrice;
		this.paymentType = paymentType;
		this.paymentDate = paymentDate;
	}

	public String getPaymentCode() {
		return paymentCode;
	}

	public void setPaymentCode(String paymentCode) {
		this.paymentCode = paymentCode;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public int getPaymentTotalPrice() {
		return paymentTotalPrice;
	}

	public void setPaymentTotalPrice(int paymentTotalPrice) {
		this.paymentTotalPrice = paymentTotalPrice;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	@Override
	public String toString() {
		return "PaymentDTO [paymentCode=" + paymentCode + ", orderCode=" + orderCode + ", paymentTotalPrice="
				+ paymentTotalPrice + ", paymentType=" + paymentType + ", paymentDate=" + paymentDate + "]";
	}
	
}
