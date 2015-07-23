package com.darshanafurniture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.darshanafurniture.dao.SupplierDao;
import com.darshanafurniture.model.Supplier;

@Service("supplierService")
public class SupplierServiceImpl implements SupplierService {
	
	@Autowired
	private SupplierDao supplierDao;

	@Override
	public void addSupplier(Supplier supplier) {
		supplierDao.addSupplier(supplier);

	}

	@Override
	public List<Supplier> getSuppliers() {
		return supplierDao.getSuppliers();
	}

	@Override
	public Supplier getSupplier(int supplierId) {
		return supplierDao.getSupplier(supplierId);
	}

	@Override
	public void deleteSupplier(Supplier supplier) {
		supplierDao.deleteSupplier(supplier);

	}

}
