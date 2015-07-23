package com.darshanafurniture.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.darshanafurniture.model.BuyingAndSellingProduct;
import com.darshanafurniture.model.ExternalItemStock;
@Repository("externalItemStockDao")
public class ExternalItemStockImpl implements ExternalItemStockDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addExternalItemToStock(ExternalItemStock item) {
		System.out.println(item.getProductCode());
		System.out.println(item.getProductName());

		System.out.println(item.getBrandName());

		//System.out.println(item.getLabelingPrice());

		System.out.println(item.getQuantity());
		System.out.println(item.getUnitPrice());

		sessionFactory.getCurrentSession().saveOrUpdate(item);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ExternalItemStock> listStock() {
		System.out.println("list dao method");
		return sessionFactory.getCurrentSession().createCriteria(ExternalItemStock.class).list();
	}

	@Override
	public boolean isProductAvailable(String ProductCode) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ExternalItemStock getItem(String productCode) {
		// TODO Auto-generated method stub
		return (ExternalItemStock) sessionFactory.getCurrentSession().get(ExternalItemStock.class, productCode);
	}

	@Override
	public List<ExternalItemStock> searchProducts(String productCode) {
		List<ExternalItemStock> returnedProductList = (List<ExternalItemStock>) sessionFactory.getCurrentSession().createCriteria(ExternalItemStock.class).add( Restrictions.like("productCode" , productCode+"%")).list();
		return returnedProductList;
	}
	
	

}
