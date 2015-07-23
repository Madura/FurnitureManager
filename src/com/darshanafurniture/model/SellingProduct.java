package com.darshanafurniture.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class SellingProduct {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long sellingId;
	private String productCode;
	private String productBrand;
	private int sellingQuantity;
	private Date dataAndTime;
	private Customer customer;
	private double sellingPrice;
	
	public long getSellingId() {
		return sellingId;
	}
	public void setSellingId(long sellingId) {
		this.sellingId = sellingId;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getProductBrand() {
		return productBrand;
	}
	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}
	public int getQuantity() {
		return sellingQuantity;
	}
	public void setQuantity(int quantity) {
		this.sellingQuantity = quantity;
	}
	public Date getDataAndTime() {
		return dataAndTime;
	}
	public void setDataAndTime(Date dataAndTime) {
		this.dataAndTime = dataAndTime;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public double getSellingPrice() {
		return sellingPrice;
	}
	public void setSellingPrice(double sellingPrice) {
		this.sellingPrice = sellingPrice;
	}
	
	
	
	
	
}
