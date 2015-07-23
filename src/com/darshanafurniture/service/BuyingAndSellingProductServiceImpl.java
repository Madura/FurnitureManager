package com.darshanafurniture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.darshanafurniture.dao.BuyingAndSellingProductDao;
import com.darshanafurniture.model.BuyingAndSellingProduct;

@Service("buyingAndSellingProductService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class BuyingAndSellingProductServiceImpl implements BuyingAndSellingProductService {

	@Autowired
	private BuyingAndSellingProductDao buyingAndSellingProductDao;
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addProduct(BuyingAndSellingProduct product) {
		//TODO needs to add product profit margin, currently its 0
		double productBuyingPrice = product.getBuyingPrice();
		double percentage = product.getProfitPercentage();
		double productLablingPrice = 0.0;
		productLablingPrice = productBuyingPrice * (percentage + 100) / 100 ;
		
		product.setLabelingPrice(productLablingPrice);
		
		buyingAndSellingProductDao.addProduct(product);

	}

	@Override
	public List<BuyingAndSellingProduct> listProducts() {
		return buyingAndSellingProductDao.listProducts();
	}

	@Override
	public BuyingAndSellingProduct getProduct(long productId) {
		return buyingAndSellingProductDao.getProduct(productId);
	}

	@Override
	public void deleteProduct(long productId) {
		buyingAndSellingProductDao.deleteProduct(productId);

	}

	@Override
	public List<BuyingAndSellingProduct> searchProductsByProductCode(String productCodeOrName) {
		return buyingAndSellingProductDao.searchProductByProductCodeOrName(productCodeOrName);
	}

}
