package com.darshanafurniture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.darshanafurniture.dao.UserDao;
import com.darshanafurniture.model.User;


@Service("userService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;

	@Override
	public User login(String user, String pw) {
		return userDao.login(user, pw);
	}

	@Override
	public String checkPermision(String user, String userType) {
		// TODO Auto-generated method stub
		return userDao.checkPermision(user, userType);
	}

	@Override
	public void registerOrUpdateUser(User user) {
		userDao.registerOrUpdateUser(user);

	}

	@Override
	public List<User> listUsers() {
		return userDao.listUsers();
	}

	@Override
	public User getProduct(long userId) {
		return userDao.getProduct(userId);
	}

	@Override
	public void deleteUser(User user) {
		userDao.deleteUser(user);

	}

}
