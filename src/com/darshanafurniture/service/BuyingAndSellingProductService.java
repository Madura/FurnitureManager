package com.darshanafurniture.service;

import java.util.List;

import com.darshanafurniture.model.BuyingAndSellingProduct;

public interface BuyingAndSellingProductService {

	public void addProduct(BuyingAndSellingProduct product);

	public List<BuyingAndSellingProduct> listProducts();
	
	public BuyingAndSellingProduct getProduct(long productId);
	
	public void deleteProduct(long productId);
	
	public List<BuyingAndSellingProduct> searchProductsByProductCode(String productCodeOrName);
}
