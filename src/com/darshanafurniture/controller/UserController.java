package com.darshanafurniture.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.darshanafurniture.bean.BuyingAndSellingProductBean;
import com.darshanafurniture.bean.ExternalItemStockBean;
import com.darshanafurniture.bean.UserBean;
import com.darshanafurniture.constant.BrandNames;
import com.darshanafurniture.model.BuyingAndSellingProduct;
import com.darshanafurniture.model.ExternalItemStock;
import com.darshanafurniture.model.Supplier;
import com.darshanafurniture.model.User;
import com.darshanafurniture.security.LoginHandler;
import com.darshanafurniture.service.ExternalItemStockService;
import com.darshanafurniture.service.SupplierService;
import com.darshanafurniture.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private SupplierService supplierService;
	
	@Autowired
	private ExternalItemStockService externalItemStockService;
	
	
	@RequestMapping(value = "/loginForm" , method = RequestMethod.GET)
	public String loginForm(){
		return "login";
		
	}
	
	@RequestMapping(value = "/saveUser", method = RequestMethod.POST)
	public ModelAndView saveUser(@ModelAttribute("command") UserBean userBean, 
			BindingResult result) {
		User user = prepareModel(userBean);
		userService.registerOrUpdateUser(user);
		System.out.println("user name : "+ user.getPassword());
		//buyingAndSellingProductService.addProduct(product);
		return new ModelAndView("index");
	}
	
	
	@RequestMapping(value = "/login" , method = RequestMethod.POST)
	public ModelAndView login(@RequestParam("userName") String userName, @RequestParam("password") String password){
		
		System.out.println("login function called");
		User user = userService.login(userName, LoginHandler.getMD5(password));

		List<BrandNames> brands = new ArrayList<BrandNames>(Arrays.asList(BrandNames.values()));
		System.out.println(BrandNames.values());

		
		List<Supplier> listOfSuppliers = supplierService.getSuppliers();

		
		Map<String, Object> model = new HashMap<String, Object>();
		List<ExternalItemStockBean> itemList = prepareExternalItemStockListOfBean(externalItemStockService.listStock());
		model.put("externalItemStock",  itemList);
		//model.put
		
		ModelAndView modelAndView = new ModelAndView("index", model);
		modelAndView.addObject("user", user);
		modelAndView.addObject("brandNames", brands);
		modelAndView.addObject("suppliers", listOfSuppliers);
		
		if(user != null) {
			return modelAndView;
		} else {
			return new ModelAndView("login");
		}
	}
	
	@RequestMapping(value = "/logout" , method = RequestMethod.GET)
	public ModelAndView logout(){
		
		System.out.println("logout function called");
		ModelAndView modelAndView = new ModelAndView("login");
		return modelAndView;
	}
	
/*	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");

		return model;

	}*/
	
	
	
	@RequestMapping(value = "/userList" , method = RequestMethod.GET)
	public ModelAndView listOfUsers(@ModelAttribute("command") UserBean userBean, 
			BindingResult result){
		List<User> listOfUsers = new ArrayList<User>();
		Map<String, Object> model = new HashMap<String, Object>();
		System.out.println("login function called");
		listOfUsers = userService.listUsers();
		model.put("listOfUsers", prepareListOfUserBean(listOfUsers));
		
		return new ModelAndView("listOfUsers",model);

	}
	
	
	private User prepareModel(UserBean userBean){
		User user = new User();
		//user.setUserId(2);
		user.setUserName(userBean.getUserName());
		user.setPassword(LoginHandler.getMD5(userBean.getPassword()));
		user.setUserType(userBean.getUserType());
		user.setUserStatus(userBean.getUserStatus());
		return user;
	}
	
	
	private List<UserBean> prepareListOfUserBean(List<User> users) {
		List<UserBean> beans = null;
		if(users != null && !users.isEmpty()) {
			beans = new ArrayList<UserBean>();
			UserBean bean = null;
			for (User user : users) {
				bean = new UserBean();
				bean.setUserId(user.getUserId());
				bean.setUserName(user.getUserName());
				bean.setPassword(user.getPassword());
				bean.setUserType(user.getUserType());
				bean.setUserStatus(user.getUserStatus());
				beans.add(bean);
			}
		}
		return beans;
	}
	
	protected List<ExternalItemStockBean> prepareExternalItemStockListOfBean(List<ExternalItemStock> stockProducts) {
		List<ExternalItemStockBean> beans = null;
		if(stockProducts != null && !stockProducts.isEmpty()) {
			beans = new ArrayList<ExternalItemStockBean>();
			ExternalItemStockBean bean = null;
			for (ExternalItemStock externalItemStock : stockProducts) {
				bean = new ExternalItemStockBean();
				bean.setProductCode(externalItemStock.getProductCode());
				bean.setProductName(externalItemStock.getProductName());
				bean.setBrandName(externalItemStock.getBrandName());
				bean.setQuantity(externalItemStock.getQuantity());
				bean.setUnitPrice(externalItemStock.getUnitPrice());
				//
				bean.setLabelingPrice(externalItemStock.getLabelingPrice());
				beans.add(bean);
			}
		}
		
		return beans;
	}
}

