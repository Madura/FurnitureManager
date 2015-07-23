package com.darshanafurniture.model;

import java.io.Serializable;

public class TestProduct implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8233747124545764681L;
	private String productCode;
	private String brandName; 
	private String productName;
	private Integer quantity;
	private Integer discount;
	private String soldPrice;
	
	public TestProduct() {
		
	}
	
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Integer getDiscount() {
		return discount;
	}
	public void setDiscount(Integer discount) {
		this.discount = discount;
	}
	public String getSoldPrice() {
		return soldPrice;
	}
	public void setSoldPrice(String soldPrice) {
		this.soldPrice = soldPrice;
	}
	

}
