package com.darshanafurniture.dao;

import java.util.List;

import com.darshanafurniture.model.BuyingAndSellingProduct;

public interface BuyingAndSellingProductDao {
	public void addProduct(BuyingAndSellingProduct product);

	public List<BuyingAndSellingProduct> listProducts();
	
	public BuyingAndSellingProduct getProduct(long productId);
	
	public void deleteProduct(long productId);
	
	public List<BuyingAndSellingProduct> getProductList(List<Long> productIDs);
	
	public void sellProductList(List<BuyingAndSellingProduct> sellingProducts);
	
	public List<BuyingAndSellingProduct> searchProductByProductCodeOrName(String productCodeOrName);

}
