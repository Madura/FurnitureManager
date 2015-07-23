package com.darshanafurniture.controller;

import java.util.ArrayList;
import java.util.Arrays;
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

import com.darshanafurniture.bean.ExternalItemBean;
import com.darshanafurniture.bean.SupplierBean;
import com.darshanafurniture.constant.BrandNames;
import com.darshanafurniture.model.BuyingAndSellingProduct;
import com.darshanafurniture.model.ExternalItem;
import com.darshanafurniture.model.Supplier;
import com.darshanafurniture.service.SupplierService;

@Controller
public class SupplierController {
	@Autowired
	private SupplierService supplierService;
	
	private static final Logger logger = LoggerFactory.getLogger(SupplierController.class);
	
	@RequestMapping( value= "/saveSupplier" , method = RequestMethod.POST)
	public String addSupplier(@ModelAttribute("command") SupplierBean supplierBean, BindingResult result) {
		Supplier supplier = prepareModel(supplierBean);
		supplierService.addSupplier(supplier);
		return "success";
	}
	
	
	@RequestMapping( value= "/displaySuppliers" , method = RequestMethod.GET)
	public ModelAndView displaySuppliers(@ModelAttribute("command") SupplierBean supplierBean, BindingResult result) {		
		Map<String, Object> model = new HashMap<String, Object>();
		List<BrandNames> brands = new ArrayList<BrandNames>(Arrays.asList(BrandNames.values()));
		model.put("supplierList",  prepareSupplierListOfBean(supplierService.getSuppliers()));
		model.put("brandNames",  brands);
		System.out.println(BrandNames.values());
		//modelAndView.addObject("brandNames", brands);
		//supplierService.addSupplier(supplier);
		return new ModelAndView("supplierList", model);
	}
	
	@RequestMapping( value= "/deleteSupplier" , method = RequestMethod.GET)
	public String deleteSupplier(@RequestParam("supplierId") String supplierId) {
		System.out.println("supplier deleting : "+supplierId);
		Supplier supplier = supplierService.getSupplier(Integer.valueOf(supplierId));
		supplierService.deleteSupplier(supplier);
		return "deleted";
	}
	
	@RequestMapping(value = "/editSupplier", method = RequestMethod.GET)
	public @ResponseBody String editProduct(@RequestParam("supplierId") String supplierId,
											@RequestParam("supplierName") String supplierName,
											@RequestParam("brandName") String brandName,
											@RequestParam("contactNumber1") String contactNumber1,
											@RequestParam("contactNumber2") String contactNumber2) {

		Supplier supplier = supplierService.getSupplier(Integer.valueOf(supplierId));
		supplier.setSupplierName(supplierName);
		supplier.setBrandName(brandName);
		supplier.setContactNumber1(contactNumber1);
		supplier.setContactNumber2(contactNumber2);
		
		supplierService.addSupplier(supplier);
		return "edited";
	}
	
	
	protected List<SupplierBean> prepareSupplierListOfBean(List<Supplier> suppliers) {
		List<SupplierBean> beans = null;
		if(suppliers != null && !suppliers.isEmpty()) {
			beans = new ArrayList<SupplierBean>();
			SupplierBean bean = null;
			for (Supplier supplier : suppliers) {
				bean = new SupplierBean();
				bean.setSupplierId(supplier.getSupplierId());				
				bean.setSupplierName(supplier.getSupplierName());
				bean.setBrandName(supplier.getBrandName());
				bean.setContactNumber1(supplier.getContactNumber1());
				bean.setContactNumber2(supplier.getContactNumber2());
				beans.add(bean);
			}
		}	
		return beans;
	}
	
	private Supplier prepareModel(SupplierBean supplierBean){
		logger.info("start prepareModel() in BuyingAndSellingController.java ");
		Supplier supplier = new Supplier();
		supplier.setSupplierName(supplierBean.getSupplierName());
		supplier.setBrandName(supplierBean.getBrandName());
		supplier.setContactNumber1(supplierBean.getContactNumber1());
		supplier.setContactNumber2(supplierBean.getContactNumber2());
		supplierBean.setSupplierId(null);
		logger.info("end prepareModel() in BuyingAndSellingController.java ");
		return supplier;
	}
}
