package com.darshanafurniture.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.darshanafurniture.bean.BuyingAndSellingProductBean;
import com.darshanafurniture.bean.ExternalItemStockBean;
import com.darshanafurniture.constant.BrandNames;
import com.darshanafurniture.model.BuyingAndSellingProduct;
import com.darshanafurniture.model.ExternalItemStock;
import com.darshanafurniture.model.User;
import com.darshanafurniture.service.BuyingAndSellingProductService;
import com.darshanafurniture.service.ExternalItemStockService;

@Controller
@SessionAttributes("userName")
public class BuyingAndSellingProductController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(BuyingAndSellingProductController.class);

	@Autowired
	private BuyingAndSellingProductService buyingAndSellingProductService;
	
	@Autowired
	private ExternalItemStockService externalItemStockService;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView welcome(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		String url = request.getRequestURI();
		//System.out.println("/* controller"+user.getUserName());
/*		Map<String, Object> model = new HashMap<String, Object>();
		List<ExternalItemStockBean> itemList = prepareExternalItemStockListOfBean(externalItemStockService.listStock());
		model.put("externalItemStock",  itemList);*/
		
		//List<BrandNames> brands = new ArrayList<BrandNames>(Arrays.asList(BrandNames.values()));
		//System.out.println(BrandNames.values());
		ModelAndView modelAndView = new ModelAndView("index");
		//modelAndView.addObject("brandNames", brands);
/*		
 *  TODO this sample is tested and needs to implement in future
 * System.out.println(url);
		url = url.replace("/sdnext/", "");
		System.out.println(url);
		url = url.replace(".html", "");
		System.out.println(url);
		System.out.println(user);*/
		//if(user.getUserName() != null && "".equals(user.getUserName())) {
			
			return new ModelAndView("login");
		//} else {
			//return modelAndView;
		//}		

	}
	
	@RequestMapping(value = "/addBuyAndSellProduct", method = RequestMethod.GET)
	public ModelAndView addProduct(@ModelAttribute("command") BuyingAndSellingProductBean productBean,
			BindingResult result) {
		return new ModelAndView("addBuyAndSellProduct");
	}
	
	@RequestMapping(value = "/displayBuyingAndSellingProducts", method = RequestMethod.GET)
	public ModelAndView displayBuyingAndSellingProduct(@ModelAttribute("command")  BuyingAndSellingProductBean productBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("products",  prepareListOfBean(buyingAndSellingProductService.listProducts()));
		return new ModelAndView("buyingAndSellingProductList", model);
	}
		
	@RequestMapping(value = "/saveProduct", method = RequestMethod.POST)
	public ModelAndView saveProduct(@ModelAttribute("command") BuyingAndSellingProductBean productBean, 
			BindingResult result) {
		BuyingAndSellingProduct product = prepareModel(productBean);
		buyingAndSellingProductService.addProduct(product);
		return new ModelAndView("redirect:/viewBuyAndSellProduct.html");
	}
	
	@RequestMapping(value = "/viewBuyAndSellProduct", method = RequestMethod.GET)
	public ModelAndView addBuyingAndSellingProduct(@ModelAttribute("command")  BuyingAndSellingProductBean productBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("products",  prepareListOfBean(buyingAndSellingProductService.listProducts()));
		return new ModelAndView("addBuyAndSellProduct", model);
	}
	
	
	@RequestMapping(value = "/deleteBuyingAndSellingProduct", method = RequestMethod.GET)
	public @ResponseBody String deleteProduct(@RequestParam("productId") String productId) {
		System.out.println("delete function" + productId);
		buyingAndSellingProductService.deleteProduct(Long.valueOf(productId));
		//buyingAndSellingProductService.deleteProduct(prepareModel(productBean));
		//Map<String, Object> model = new HashMap<String, Object>();
		//model.put("product", null);
		//model.put("products",  prepareListOfBean(buyingAndSellingProductService.listProducts()));
		return "deleted";
	}
	
	
	
	@RequestMapping(value = "/editBuyingAndSellingProduct", method = RequestMethod.GET)
	public @ResponseBody String editProduct(@RequestParam("productId") String productId,
											@RequestParam("productCode") String productCode,
											@RequestParam("productName") String productName,
											@RequestParam("brandName") String brandName,
											@RequestParam("quantity") String quantity,
											@RequestParam("buyingPrice") String buyingPrice,
											@RequestParam("profitPercentage") String profitPercentage,
											@RequestParam("purchasingTime") String purchasingTime,
											@RequestParam("labelingPrice") String labelingPrice,
											@RequestParam("maxStock") String maxStock,
											@RequestParam("minStock") String minStock) {
		
		BuyingAndSellingProduct product = buyingAndSellingProductService.getProduct(Long.valueOf(productId));
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("product",  product);
		
		product.setProductCode(productCode);
		product.setProductName(productName);
		product.setBrandName(brandName);
		product.setQuantity(Integer.valueOf(quantity));
		product.setBuyingPrice(Double.valueOf(buyingPrice));
		product.setProfitPercentage(Double.valueOf(profitPercentage));
		//product.setMaxStock(Date(purchasingTime));
		product.setLabelingPrice(Double.valueOf(labelingPrice));
		product.setMaxStock(Long.valueOf(maxStock));
		product.setMaxStock(Long.valueOf(minStock));
		
		buyingAndSellingProductService.addProduct(product);
		
		return "edited";
	}
	

	
	
/*	@RequestMapping(value = "/searchProduct", method = RequestMethod.GET)
	public @ResponseBody
	Map<Long,Object> getProductNames(@RequestParam("productName") String productName) {
		System.out.println("search controller"+productName);
		return simulateSearchResult(productName);
 
	}*/
	
/*	@RequestMapping(value = "/searchProduct", method = RequestMethod.GET)
	public @ResponseBody
	ModelAndView getProductNames(@RequestParam("productName") String productName) {
		List<BuyingAndSellingProduct> listOfSuggetions =  simulateSearchResult(productName);
		Map<String, Object> modelMap = new HashMap<String,Object>() ;
		modelMap.put("names", listOfSuggetions);
		System.out.println("search controller"+productName);
		return new ModelAndView("Index", modelMap);
 
	}*/
 
/*	private Map<Long,Object> simulateSearchResult(String productName) {
 
		List<BuyingAndSellingProduct> results = new ArrayList<BuyingAndSellingProduct>();
		List<BuyingAndSellingProduct> listOfProducts = buyingAndSellingProductService.searchProductsByProductCode(productName);
		System.out.println("size : "+listOfProducts.size());
		Map<Long, Object> productsMap = new HashMap<Long,Object>();
 
		// iterate a list and filter by tagName
		for (BuyingAndSellingProduct product : listOfProducts) {
			if (product.getProductName().contains(productName)) {
				results.add(product);
				productsMap.put(product.getProductId(), product);
				System.out.println("product : "+product.getProductName());
			}
		}
 
		return productsMap;
	}*/
	
	
	private List<BuyingAndSellingProductBean> prepareListOfBean(List<BuyingAndSellingProduct> products) {
		List<BuyingAndSellingProductBean> beans = null;
		if(products != null && !products.isEmpty()) {
			beans = new ArrayList<BuyingAndSellingProductBean>();
			BuyingAndSellingProductBean bean = null;
			for (BuyingAndSellingProduct buyingAndSellingProduct : products) {
				bean = new BuyingAndSellingProductBean();
				bean.setProductId(buyingAndSellingProduct.getProductId());
				bean.setProductCode(buyingAndSellingProduct.getProductCode());
				bean.setProductName(buyingAndSellingProduct.getProductName());
				bean.setBrandName(buyingAndSellingProduct.getBrandName());
				bean.setQuantity(buyingAndSellingProduct.getQuantity());
				bean.setBuyingPrice(buyingAndSellingProduct.getBuyingPrice());
				bean.setProfitPercentage(buyingAndSellingProduct.getProfitPercentage());
				bean.setLabelingPrice(buyingAndSellingProduct.getLabelingPrice());
				bean.setPurchasingTime(buyingAndSellingProduct.getPerchasingTime());
				bean.setMaxStock(buyingAndSellingProduct.getMaxStock());
				bean.setMinStock(buyingAndSellingProduct.getMinStock());
				//bean.setMaxStock(buyingAndSellingProduct.getMaxStock());
				//bean.setMinStock(buyingAndSellingProduct.getMinStock());
				beans.add(bean);
			}
		}
		
		return beans;
	}
	
	
	private BuyingAndSellingProduct prepareModel(BuyingAndSellingProductBean productBean){
		logger.info("start prepareModel() in BuyingAndSellingController.java ");
		logger.info("id", productBean.getProductId());
		BuyingAndSellingProduct product = new BuyingAndSellingProduct();
		product.setProductCode(productBean.getProductCode());
		product.setProductName(productBean.getProductName());
		product.setBrandName(productBean.getBrandName());
		product.setQuantity(productBean.getQuantity());
		product.setBuyingPrice(productBean.getBuyingPrice());
		product.setProfitPercentage(productBean.getProfitPercentage());
		product.setLabelingPrice(23d);
		product.setPurchasingTime(new Date());
		product.setMaxStock(productBean.getMaxStock());
		product.setMinStock(productBean.getMinStock());
		//product.setMaxStock(productBean.getMaxStock());
		//product.setMinStock(productBean.getMinStock());
		productBean.setProductId(null);
		logger.info("end prepareModel() in BuyingAndSellingController.java ");
		return product;
	}
	
	private BuyingAndSellingProductBean prepareProductBean(BuyingAndSellingProduct product){
		BuyingAndSellingProductBean bean = new BuyingAndSellingProductBean();
		bean.setProductCode(product.getProductCode());
		bean.setProductName(product.getProductName());
		bean.setBrandName(product.getBrandName());
		bean.setBuyingPrice(product.getBuyingPrice());
		bean.setQuantity(product.getQuantity());
		bean.setProfitPercentage(product.getProfitPercentage());
		bean.setLabelingPrice(product.getLabelingPrice());
		bean.setMaxStock(20L);
		bean.setMinStock(5L);
		return bean;
	}
}
