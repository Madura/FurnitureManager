package com.darshanafurniture.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.darshanafurniture.model.ExternalItem;


public interface ExternalItemDao {
	
	public void addProduct(ExternalItem product);

	public List<ExternalItem> listProducts();
	
	public ExternalItem getProduct(long productId);
	
	public void deleteProduct(long productId);
	
	public List<ExternalItem> searchProductsByProductCode(String productCodeOrName);

}
