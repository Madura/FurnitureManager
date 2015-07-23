package com.darshanafurniture.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class StockManipulationData implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5629530644400808352L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer manupulationDataId;
	private String productCode;
	private Double profitPercentage;
	private Integer maxStock;
	private Integer minStock;
	
	public Integer getManupulationDataId() {
		return manupulationDataId;
	}
	public void setManupulationDataId(Integer manupulationDataId) {
		this.manupulationDataId = manupulationDataId;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public Double getProfitPercentage() {
		return profitPercentage;
	}
	public void setProfitPercentage(Double profitPercentage) {
		this.profitPercentage = profitPercentage;
	}
	public Integer getMaxStock() {
		return maxStock;
	}
	public void setMaxStock(Integer maxStock) {
		this.maxStock = maxStock;
	}
	public Integer getMinStock() {
		return minStock;
	}
	public void setMinStock(Integer minStock) {
		this.minStock = minStock;
	}
	

}
