package com.darshanafurniture.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ExternalItemSold implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8186352601711816582L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long invoiceId;
	private String customerId;
	private String userId;
	private Date soldTime;
	private Double totalBill;
	private Double discount;
	private Double transportCost;
	private Double finalBill;
	private Integer totalItemCount;
	
	public Long getInvoiceId() {
		return invoiceId;
	}
	public void setInvoiceId(Long invoiceId) {
		this.invoiceId = invoiceId;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getSoldTime() {
		return soldTime;
	}
	public void setSoldTime(Date soldTime) {
		this.soldTime = soldTime;
	}
	public Double getTotalBill() {
		return totalBill;
	}
	public void setTotalBill(Double totalBill) {
		this.totalBill = totalBill;
	}
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
	}
	public Double getTransportCost() {
		return transportCost;
	}
	public void setTransportCost(Double transportCost) {
		this.transportCost = transportCost;
	}
	public Double getFinalBill() {
		return finalBill;
	}
	public void setFinalBill(Double finalBill) {
		this.finalBill = finalBill;
	}
	public Integer getTotalItemCount() {
		return totalItemCount;
	}
	public void setTotalItemCount(Integer totalItemCount) {
		this.totalItemCount = totalItemCount;
	}
	
}
