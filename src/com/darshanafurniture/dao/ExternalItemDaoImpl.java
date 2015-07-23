package com.darshanafurniture.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.darshanafurniture.model.ExternalItem;

@Repository("externalItemDao")
public class ExternalItemDaoImpl implements ExternalItemDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void addProduct(ExternalItem product) {
		sessionFactory.getCurrentSession().saveOrUpdate(product);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ExternalItem> listProducts() {
		return sessionFactory.getCurrentSession().createCriteria(ExternalItem.class).list();
	}

	@Override
	public ExternalItem getProduct(long productId) {
		// TODO Auto-generated method stub
		return (ExternalItem) sessionFactory.getCurrentSession().get(ExternalItem.class, productId);
	}

	@Override
	public void deleteProduct(long productId) {
		sessionFactory.getCurrentSession().createQuery("Delete from ExternalItem where id  =" +productId).executeUpdate();
		
	}

	@Override
	public List<ExternalItem> searchProductsByProductCode(
			String productCodeOrName) {
		// TODO Auto-generated method stub
		return null;
	}

}
