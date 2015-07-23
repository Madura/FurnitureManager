package com.darshanafurniture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.darshanafurniture.dao.ExternalItemDao;
import com.darshanafurniture.dao.ExternalItemStockDao;
import com.darshanafurniture.model.ExternalItem;
import com.darshanafurniture.model.ExternalItemStock;

@Service("externalItemService")
@Transactional
public class ExternalItemServiceImpl implements ExternalItemService{
	
	@Autowired
	private ExternalItemDao externalItemDao;
	
	@Autowired
	private ExternalItemStockDao externalItemStockDao;

	@Override
	public void addProduct(ExternalItem product) {
		String productCode = product.getProductCode();
		int newQuantity = product.getQuantity();
		externalItemDao.addProduct(product);
		ExternalItemStock item = externalItemStockDao.getItem(productCode);
		
		if(item != null && !"".equals(item)) {
			int availableQuantity = item.getQuantity();
			item.setProductCode(productCode);
			//item.setBrandName(product.getBrandName());
			item.setUnitPrice(product.getUnitPrice());
			//item.setProductName(product.getProductName());
			item.setQuantity(newQuantity + availableQuantity);
			externalItemStockDao.addExternalItemToStock(item);	
		} else {
			ExternalItemStock newExternalItem = new ExternalItemStock();
			double labelingPrice = 0;
			labelingPrice = product.getUnitPrice() * 110/100;
			newExternalItem.setProductCode(productCode);
			newExternalItem.setBrandName(product.getBrandName());
			newExternalItem.setUnitPrice(product.getUnitPrice());
			newExternalItem.setProductName(product.getProductName());
			newExternalItem.setQuantity(newQuantity);
			newExternalItem.setLabelingPrice(labelingPrice);
			externalItemStockDao.addExternalItemToStock(newExternalItem);
			
		}
		
		
	}

	@Override
	public List<ExternalItem> listProducts() {
		// TODO Auto-generated method stub
		return externalItemDao.listProducts();
	}

	@Override
	public ExternalItem getProduct(long productId) {
		// TODO Auto-generated method stub
		return externalItemDao.getProduct(productId);
	}

	@Override
	public void deleteProduct(long productId) {
		externalItemDao.deleteProduct(productId);
		
	}

	@Override
	public List<ExternalItem> searchProductsByProductCode(
			String productCodeOrName) {
		// TODO Auto-generated method stub
		return null;
	}

}
