package com.darshanafurniture.bean;

import java.util.Date;


public class ExternalItemBean {

	private Long id;
	private Integer supplierId;
	private String productCode;
	private String productName;
	private Integer quantity;
	private String brandName;
	private Double unitPrice;
	private Date purchasedTime;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Integer getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
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
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public Double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public Date getPurchasedTime() {
		return purchasedTime;
	}
	public void setPurchasedTime(Date purchasedTime) {
		this.purchasedTime = purchasedTime;
	}

}
