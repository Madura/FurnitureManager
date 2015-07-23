package com.darshanafurniture.dao;

import java.util.List;

import com.darshanafurniture.model.Supplier;

public interface SupplierDao {
	public void addSupplier(Supplier supplier);
	public List<Supplier> getSuppliers();
	public Supplier getSupplier(int supplierId);
	public void deleteSupplier(Supplier supplier);

}
