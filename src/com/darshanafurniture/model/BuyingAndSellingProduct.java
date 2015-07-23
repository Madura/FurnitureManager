package com.darshanafurniture.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="BuyingAndSellingProduct")
public class BuyingAndSellingProduct implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6313078819947861777L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long productId;
	private String productCode;
	private String productName;
	private Integer quantity;
	private String brandName;
	private Double buyingPrice;
	private Double profitPercentage;
	private Double labelingPrice;
	private Date purchasingTime;
	private Date sellingTime;
	private Long maxStock;
	private Long minStock;
	
	public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
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
	public Double getBuyingPrice() {
		return buyingPrice;
	}
	public void setBuyingPrice(Double buyingPrice) {
		this.buyingPrice = buyingPrice;
	}
	public Double getProfitPercentage() {
		return profitPercentage;
	}
	public void setProfitPercentage(Double profitPercentage) {
		this.profitPercentage = profitPercentage;
	}
	public Double getLabelingPrice() {
		return labelingPrice;
	}
	public void setLabelingPrice(Double labelingPrice) {
		this.labelingPrice = labelingPrice;
	}
	public Date getPerchasingTime() {
		return purchasingTime;
	}
	public void setPurchasingTime(Date purchasingTime) {
		this.purchasingTime = purchasingTime;
	}
	public Date getSellingTime() {
		return sellingTime;
	}
	public void setSellingTime(Date sellingTime) {
		this.sellingTime = sellingTime;
	}
	public Long getMaxStock() {
		return maxStock;
	}
	public void setMaxStock(Long maxStock) {
		this.maxStock = maxStock;
	}
	public Long getMinStock() {
		return minStock;
	}
	public void setMinStock(Long minStock) {
		this.minStock = minStock;
	}

}
