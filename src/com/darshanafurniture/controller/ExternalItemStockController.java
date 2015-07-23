package com.darshanafurniture.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.darshanafurniture.bean.ExternalItemStockBean;
import com.darshanafurniture.model.ExternalItem;
import com.darshanafurniture.model.ExternalItemStock;
import com.darshanafurniture.model.TestProduct;
import com.darshanafurniture.service.ExternalItemStockService;

@Controller
public class ExternalItemStockController {

	@Autowired
	private ExternalItemStockService externalItemStockService;
	
	@RequestMapping(value = "/displayExternalItemStockList", method = RequestMethod.GET)
	public ModelAndView displayExternalItemList(@ModelAttribute("command")  ExternalItemStockBean productBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		List<ExternalItemStockBean> itemList = prepareExternalItemStockListOfBean(externalItemStockService.listStock());
		model.put("externalItemStock",  itemList);
		return new ModelAndView("externalItemStockList", model);
	}
	
	@RequestMapping(value = "/getItemFromStock", method = RequestMethod.GET)
	public ExternalItemStock getItemFromStock(@RequestParam("productCode") String productCode) {
		Map<String, Object> model = new HashMap<String, Object>();
		ExternalItemStock item = externalItemStockService.getItem(productCode);
		return item;
	}
	
	@RequestMapping(value = "/searchProduct", method = RequestMethod.GET)
	public @ResponseBody
	List<ExternalItemStock> getProductNames(@RequestParam("productName") String productName) {
		System.out.println("search keyword : "+productName);
		return simulateSearchResult(productName);
 
	}
	
	@RequestMapping(value = "/sellProducts", method = RequestMethod.POST)
	public @ResponseBody
	String sellProducts(@RequestBody String product) {
		System.out.println("name : " + product);
		return product;
	}
	
	private List<ExternalItemStock> simulateSearchResult(String productCode) {
		 
		List<ExternalItemStock> results = new ArrayList<ExternalItemStock>();
		List<ExternalItemStock> listOfProducts = externalItemStockService.searchProducts(productCode);
		
		System.out.println("size : "+listOfProducts.size());
		Map<Long, Object> productsMap = new HashMap<Long,Object>();
 
		// iterate a list and filter by tagName
		for (ExternalItemStock product : listOfProducts) {
			//if (product.getProductCode().contains(productCode)) {
				results.add(product);

				System.out.println("id : "+product.getProductCode() + "name : " + product.getProductName());
			//}
		}
 
		return results;
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
				//bean.setLabelingPrice(23.25);
				bean.setLabelingPrice(externalItemStock.getLabelingPrice());
				beans.add(bean);
			}
		}
		
		return beans;
	}
}
