package com.darshanafurniture.dao;

import java.nio.channels.SeekableByteChannel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.darshanafurniture.model.User;

@Repository("userDao")
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session openSession() {
		return sessionFactory.getCurrentSession();
	}

	@SuppressWarnings("unchecked")
	@Override
	public User login(String userName, String pw) {
        
		return  (User) sessionFactory.getCurrentSession().createQuery("FROM User u WHERE u.userName = '"+userName +"' and u.password = '"+pw+"'").list().get(0);
	}

	@Override
	public String checkPermision(String user, String userType) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void registerOrUpdateUser(User user) {
		System.out.println(user.getPassword());
		System.out.println(user.getUserId());
		openSession().saveOrUpdate(user);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> listUsers() {
		// TODO Auto-generated method stub
		return (List<User>) openSession().createCriteria(User.class).list();
	}

	@Override
	public User getProduct(long userId) {
		// TODO Auto-generated method stub
		return (User) openSession().load(User.class, userId);
	}

	@Override
	public void deleteUser(User user) {
		// TODO Auto-generated method stub
		openSession().createQuery("DELETE FROM User where userId =" + user.getUserId()).executeUpdate();
		
	}
	

}
