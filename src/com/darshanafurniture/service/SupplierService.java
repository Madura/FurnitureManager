package com.darshanafurniture.service;

import java.util.List;

import com.darshanafurniture.model.Supplier;

public interface SupplierService {
	public void addSupplier(Supplier supplier);
	public List<Supplier> getSuppliers();
	public Supplier getSupplier(int supplierId);
	public void deleteSupplier(Supplier supplier);
}
