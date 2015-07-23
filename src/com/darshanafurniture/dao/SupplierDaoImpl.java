package com.darshanafurniture.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.darshanafurniture.model.Supplier;

@Repository("supplierDaoImpl")
@Transactional
public class SupplierDaoImpl implements SupplierDao {
	
	@Autowired
	public SessionFactory sessionFactory;
	
	@Override
	public void addSupplier(Supplier supplier) {
		//supplier.setSupplierId(1);
		sessionFactory.getCurrentSession().saveOrUpdate(supplier);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Supplier> getSuppliers() {
		return sessionFactory.getCurrentSession().createCriteria(Supplier.class).list();
	}

	@Override
	public Supplier getSupplier(int supplierId) {
		// TODO Auto-generated method stub
		return (Supplier) sessionFactory.getCurrentSession().get(Supplier.class, supplierId);
	}

	@Override
	public void deleteSupplier(Supplier supplier) {
		System.out.println("dao : "+supplier.getSupplierName());
		sessionFactory.getCurrentSession().createQuery("Delete from Supplier where supplierId = "+ supplier.getSupplierId()).executeUpdate();

	}

}
