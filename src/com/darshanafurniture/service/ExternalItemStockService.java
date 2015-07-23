package com.darshanafurniture.service;

import java.util.List;

import com.darshanafurniture.model.ExternalItemStock;

public interface ExternalItemStockService {
	public void addExternalItemToStock(ExternalItemStock item);
	public List<ExternalItemStock> listStock();
	public boolean isProductAvailable(String ProductCode);
	public ExternalItemStock getItem(String productCode);
	public List<ExternalItemStock> searchProducts(String productCode);
}
