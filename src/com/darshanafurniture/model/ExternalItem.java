package com.darshanafurniture.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.darshanafurniture.constant.BrandNames;

@Entity
@Table(name="ExternalItem")
public class ExternalItem implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3092801936449100198L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	private Integer supplierId;
	private String productCode;
	private String productName;
	private Integer quantity;
	@Column (name = "brandName")
	@Enumerated (EnumType.STRING)
	private BrandNames brandName;
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
	public BrandNames getBrandName() {
		return brandName;
	}
	public void setBrandName(BrandNames brandName) {
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
