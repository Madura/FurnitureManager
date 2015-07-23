package com.darshanafurniture.bean;

import java.io.Serializable;

import com.darshanafurniture.constant.BrandNames;
import com.darshanafurniture.model.StockManipulationData;

public class ExternalItemStockBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private String productCode;
	private String productName;
	private Integer quantity;
	private BrandNames brandName;
	private Double unitPrice;
	private Double labelingPrice;
	private StockManipulationData manipulationData;
	
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
	public Double getLabelingPrice() {
		return labelingPrice;
	}
	public void setLabelingPrice(Double labelingPrice) {
		this.labelingPrice = labelingPrice;
	}
	public StockManipulationData getManipulationData() {
		return manipulationData;
	}
	public void setManipulationData(StockManipulationData manipulationData) {
		this.manipulationData = manipulationData;
	}

}

