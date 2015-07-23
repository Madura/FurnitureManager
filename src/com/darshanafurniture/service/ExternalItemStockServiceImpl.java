package com.darshanafurniture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.darshanafurniture.dao.ExternalItemStockDao;
import com.darshanafurniture.model.ExternalItemStock;

@Service("externalItemStockService")
@Transactional
public class ExternalItemStockServiceImpl implements ExternalItemStockService {

	@Autowired
	private ExternalItemStockDao externalItemStockDao;

	@Override
	public void addExternalItemToStock(ExternalItemStock item) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ExternalItemStock> listStock() {
		// TODO Auto-generated method stub
		System.out.println("service method");
		return externalItemStockDao.listStock();
	}

	@Override
	public boolean isProductAvailable(String ProductCode) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ExternalItemStock getItem(String productCode) {
		// TODO Auto-generated method stub
		return externalItemStockDao.getItem(productCode);
	}

	@Override
	public List<ExternalItemStock> searchProducts(String productCode) {
		return externalItemStockDao.searchProducts(productCode);
	}
	

}
