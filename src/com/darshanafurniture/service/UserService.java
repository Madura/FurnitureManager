package com.darshanafurniture.service;

import java.util.List;

import com.darshanafurniture.model.User;

public interface UserService {
	
	public User login(String user, String pw);
	
	public String checkPermision(String user, String userType);
	
	public void registerOrUpdateUser(User user);

	public List<User> listUsers();
	
	public User getProduct(long userId);
	
	public void deleteUser(User user);
}
