package com.darshanafurniture.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.darshanafurniture.model.BuyingAndSellingProduct;

@Repository("buyingAndSellingProductDao")
public class BuyingAndSellingProductDaoImpl implements BuyingAndSellingProductDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addProduct(BuyingAndSellingProduct product) {
		sessionFactory.getCurrentSession().saveOrUpdate(product);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BuyingAndSellingProduct> listProducts() {	
		return sessionFactory.getCurrentSession().createCriteria(BuyingAndSellingProduct.class).list();
	}

	@Override
	public BuyingAndSellingProduct getProduct(long productId) {
		return (BuyingAndSellingProduct) sessionFactory.getCurrentSession().get(BuyingAndSellingProduct.class, productId);
	}

	@Override
	public void deleteProduct(long productId) {
		sessionFactory.getCurrentSession().createQuery("DELETE FROM BuyingAndSellingProduct WHERE productId = " + productId).executeUpdate();

	}

	@Override
	public List<BuyingAndSellingProduct> getProductList(List<Long> productIDs) {
		
		 List<BuyingAndSellingProduct> buyAndSellingProducts = (List<BuyingAndSellingProduct>) sessionFactory.getCurrentSession().createQuery("from BuyingAndSellingProduct e where e.id in (:ids)").setParameterList("ids", productIDs);

		return buyAndSellingProducts;
	}

	@Override
	public void sellProductList(List<BuyingAndSellingProduct> sellingProducts) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BuyingAndSellingProduct> searchProductByProductCodeOrName(String productCodeOrName) {
		List<BuyingAndSellingProduct> returnedProductList = (List<BuyingAndSellingProduct>) sessionFactory.getCurrentSession().createCriteria(BuyingAndSellingProduct.class).add( Restrictions.like("productName" , productCodeOrName+"%")).list();
		return returnedProductList;
	}

}
