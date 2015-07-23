package com.darshanafurniture.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.darshanafurniture.model.ExternalItem;


public interface ExternalItemService {
	
	public void addProduct(ExternalItem product);

	public List<ExternalItem> listProducts();
	
	public ExternalItem getProduct(long productId);
	
	public void deleteProduct(long productId);
	
	public List<ExternalItem> searchProductsByProductCode(String productCodeOrName);

}
