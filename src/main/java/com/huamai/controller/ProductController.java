package com.huamai.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.huamai.entity.Product;
import com.huamai.service.ProductService;
import com.huamai.util.BasePageResult;
import com.huamai.util.BasePageResultUtil;
import com.huamai.util.Utils;

@Controller
@RequestMapping("/Product")
public class ProductController {
	
	@Autowired
	private ProductService productservice;
	

	@RequestMapping("/index")
	public ModelAndView index() {
		String imgPath = Utils.readProperties("imgPath");
		ModelAndView mv = new ModelAndView("backstage/product/productIndex");
		mv.addObject("imgPath", imgPath);
		return mv;
	}
	
	@RequestMapping("/AddorEdit")
	public ModelAndView Add(@RequestParam(required=false) Integer id,@RequestParam(required=false) Integer pid) {
		ModelAndView mv = new ModelAndView("backstage/product/productEdit");
		if(id==null&&pid!=null) {
			Product parent = productservice.selectByPrimerykey(pid);
			Product chlid = new Product();
			chlid.setParentid(parent.getId());
			mv.addObject("entity", chlid);
			mv.addObject("parentName", parent.getProductname());
		}
		if(id!=null) {
			Product chlid = productservice.selectByPrimerykey(id);
			if(chlid.getParentid()!=null&&chlid.getParentid()!=0){
				Product parent = productservice.selectByPrimerykey(chlid.getParentid());
				mv.addObject("parentName", parent.getProductname());
			}
			mv.addObject("entity", chlid);
		}
		return mv;
	}
	
	
	@RequestMapping("/productList")
	@ResponseBody
	public BasePageResult productList(@RequestParam Map<String,Object> map)
	{
		return BasePageResultUtil.success(productservice.productList(map));
	}
	
	@RequestMapping("/productAddorUpdate")
	@ResponseBody
	public BasePageResult productAdd(Product entity)
	{
		if(entity.getId()==null) {
			if(productservice.insertProduct(entity))
				return BasePageResultUtil.success();
			return BasePageResultUtil.failResult(-1, "添加失败！");
		}
		if(productservice.updateProduct(entity))
			return BasePageResultUtil.success();
		return BasePageResultUtil.failResult(-1, "更新失败！");
	}
	
	@RequestMapping("/drop")
	@ResponseBody
	public BasePageResult drop(@RequestParam Integer id) {
		return productservice.dropProduct(id);
	}
	
	
	
}
