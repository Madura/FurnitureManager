package com.darshanafurniture.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.darshanafurniture.bean.BuyingAndSellingProductBean;
import com.darshanafurniture.bean.ExternalItemBean;
import com.darshanafurniture.constant.BrandNames;
import com.darshanafurniture.model.BuyingAndSellingProduct;
import com.darshanafurniture.model.ExternalItem;
import com.darshanafurniture.service.BuyingAndSellingProductService;
import com.darshanafurniture.service.ExternalItemService;
import com.darshanafurniture.service.SupplierService;
import com.darshanafurniture.util.DateFormater;

@Controller
public class ExternalItemController {

	private static final Logger logger = LoggerFactory.getLogger(ExternalItemController.class);

	@Autowired
	private ExternalItemService externalItemService;
	
	@Autowired
	private SupplierService supplierService;
	
	@RequestMapping(value = "/displayAddProductForm", method = RequestMethod.POST)
	public ModelAndView displayAddProductForm(@ModelAttribute("command") ExternalItemBean productBean, 
			BindingResult result) {
		return new ModelAndView("redirect:/viewBuyAndSellProduct.html");
	}
	
	
	@RequestMapping(value = "/saveExternalItem", method = RequestMethod.POST)
	public ModelAndView saveProduct(@ModelAttribute("command") ExternalItemBean productBean, 
			BindingResult result) {
		ExternalItem product = prepareModel(productBean);
		externalItemService.addProduct(product);
		return new ModelAndView("redirect:/viewBuyAndSellProduct.html");
	}
	
	@RequestMapping(value = "/displayExternalItemList", method = RequestMethod.GET)
	public ModelAndView displayExternalItemList(@ModelAttribute("command")  ExternalItemBean productBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("externalItems",  prepareExternalItemListOfBean(externalItemService.listProducts()));
		model.put("suppliers",  new SupplierController().prepareSupplierListOfBean(supplierService.getSuppliers()));
		return new ModelAndView("externalItemList", model);
	}
	
	@RequestMapping(value = "/editExternalItem", method = RequestMethod.GET)
	public @ResponseBody String editProduct(@RequestParam("id") String id,
											@RequestParam("supplierId") String supplierId,
											@RequestParam("productCode") String productCode,
											@RequestParam("productName") String productName,
											@RequestParam("brandName") String brandName,
											@RequestParam("quantity") String quantity,
											@RequestParam("unitPrice") String unitPrice,
											@RequestParam("purchasedTime") String purchasedTime) {
		System.out.println(id);
		System.out.println(productCode);
		System.out.println(productName);
		System.out.println(brandName);
		System.out.println(quantity);
		System.out.println(unitPrice);
		
		ExternalItem product = externalItemService.getProduct(Long.valueOf(id));
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("product",  product);
		
/*		Date purchasedTimeAndDate = null;
		try {
			purchasedTimeAndDate = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss").parse(purchasedTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		product.setId(Long.valueOf(id));
		product.setProductCode(productCode);
		product.setSupplierId(Integer.valueOf(supplierId));
		product.setProductName(productName);
		product.setBrandName(BrandNames.valueOf(brandName));
		product.setQuantity(Integer.valueOf(quantity));
		product.setUnitPrice(Double.valueOf(unitPrice));
		product.setPurchasedTime(DateFormater.StringDateToDate(purchasedTime));
		externalItemService.addProduct(product);
		
		return "edited";
	}
	
	@RequestMapping(value = "/deleteExternalItem", method = RequestMethod.GET)
	public @ResponseBody String editProduct(@RequestParam("id") String id) {
		System.out.println(id);
		externalItemService.deleteProduct(Long.valueOf(id));	
		return "deleted";
	}
	
	private ExternalItem prepareModel(ExternalItemBean productBean){
		logger.info("start prepareModel() in BuyingAndSellingController.java ");
		logger.info("id", productBean.getId());
		ExternalItem product = new ExternalItem();
		product.setProductCode(productBean.getProductCode());
		product.setProductName(productBean.getProductName());
		product.setBrandName(BrandNames.valueOf(productBean.getBrandName()));
		product.setQuantity(productBean.getQuantity());
		product.setUnitPrice(productBean.getUnitPrice());
		product.setPurchasedTime(new Date());
		product.setSupplierId(productBean.getSupplierId());
		productBean.setId(null);
		logger.info("end prepareModel() in BuyingAndSellingController.java ");
		return product;
	}
	
	
	private List<ExternalItemBean> prepareExternalItemListOfBean(List<ExternalItem> products) {
		List<ExternalItemBean> beans = null;
		if(products != null && !products.isEmpty()) {
			beans = new ArrayList<ExternalItemBean>();
			ExternalItemBean bean = null;
			for (ExternalItem externalItem : products) {
				bean = new ExternalItemBean();
				bean.setId(externalItem.getId());
				bean.setSupplierId(externalItem.getSupplierId());
				bean.setProductCode(externalItem.getProductCode());
				bean.setProductName(externalItem.getProductName());
				bean.setBrandName(externalItem.getBrandName().toString());
				bean.setQuantity(externalItem.getQuantity());
				bean.setUnitPrice(externalItem.getUnitPrice());
				bean.setPurchasedTime(externalItem.getPurchasedTime());
				beans.add(bean);
			}
		}
		
		return beans;
	}
}
