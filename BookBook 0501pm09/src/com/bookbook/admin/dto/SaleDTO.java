package com.bookbook.admin.dto;

/**
 * @author ������
 * @brief ���� ���� ���� ����� DTO ����,���� �ֹ���,���� �ݾ���������
 */
public class SaleDTO {

	private String day;
	private String orderCount;
	private String sumPrice; 
	
	
	
	public SaleDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SaleDTO(String day, String orderCount, String sumPrice) {
		super();
		this.day = day;
		this.orderCount = orderCount;
		this.sumPrice = sumPrice;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(String orderCount) {
		this.orderCount = orderCount;
	}

	public String getSumPrice() {
		return sumPrice;
	}

	public void setSumPrice(String sumPrice) {
		this.sumPrice = sumPrice;
	}

	
	
	
	
	
}
